var ModalWindow = function() {
	var modalWindow = function(targetElement, modalWindowId) {
	    this.targetElement = targetElement;
	    this.id = modalWindowId;
	    this.initialize();
	};

	modalWindow.prototype = {
	    initialize: function() {
            this.closeButtonElement = this.targetElement.getElementsByClassName("modal__close")[0];
            this.wireUpEvents();
        },

        open: function() {
            this.targetElement.classList.add('show');
            document.body.classList.add('overflow--hide');
        },

        close: function() {
            this.targetElement.classList.remove('show');
            document.body.classList.remove('overflow--hide');
        },

        wireUpEvents: function() {
	        var self = this;
            self.closeButtonElement.onclick = function (event) {
                self.close();
            };
        }
    };

	return modalWindow;
}();

var NullModalWindow = function() {
	var nullModalWindow = function() {};

	nullModalWindow.prototype = {
        open: function() {},
        close: function() {}
    };

	return nullModalWindow;
}();


var ModalWindows = function() {
	var modalWindows = function(targetClassName) {
	    this.targetClassName = targetClassName;
	    this.modalWindows = {};
	    this.nowShowingModal = new NullModalWindow();
	    this.initialize();
	};

	modalWindows.prototype = {
	    initialize: function() {
	        this.modalWindowElements = document.getElementsByClassName(this.targetClassName);
            this.setupModals();
            this.ensureOpenModalClosesOnEsc();
        },

        setupModals: function() {
	        var self = this;
            for (var i = 0; i < this.modalWindowElements.length; i++) {
                var modalWindowElement = this.modalWindowElements[i];
                var modalWindowId = modalWindowElement.getAttribute("id");
                var openModalWindowElement = document.querySelector("a." + modalWindowId);
                var modalWindow = new ModalWindow(modalWindowElement, modalWindowId);

                self.modalWindows[modalWindowId] = modalWindow;

                openModalWindowElement.onclick = function (event) {
                    event.stopPropagation();
                    event.preventDefault();
                    var modalWindow = self.modalWindows[this.getAttribute("name")];
                    modalWindow.open();
                    self.nowShowingModal = modalWindow;
                };
            }
        },

        closeCurrentlyOpenWindow: function() {
            this.nowShowingModal.close();
            this.nowShowingModal = new NullModalWindow();
        },

        ensureOpenModalClosesOnEsc: function() {
            var self = this;
            document.addEventListener('keyup', function (e) {
                if (e.keyCode === 27) {
                    self.closeCurrentlyOpenWindow();
                }
            })
        }
    };

	return modalWindows;
}();
