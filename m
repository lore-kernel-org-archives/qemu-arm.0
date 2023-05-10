Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003f32f013c3csm23187052wmh.6.2023.05.10.08.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:07:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 72E7D1FFC3;
	Wed, 10 May 2023 16:06:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 8/8] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
Date: Wed, 10 May 2023 16:06:58 +0100
Message-Id: <20230510150658.1399087-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510150658.1399087-1-alex.bennee@linaro.org>
References: <20230510150658.1399087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lUzxvyDyf3Rg

From: Fabiano Rosas <farosas@suse.de>

This machine hardcodes initialization of the USB device, so select the
corresponding Kconfig. It is not enough to have it as "default y if
XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
disables the default selection resulting in:

$ ./qemu-system-aarch64 -M xlnx-zcu102
qemu-system-aarch64: missing object type 'usb_dwc3'
Aborted (core dumped)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-8-farosas@suse.de>
Message-Id: <20230503091244.1450613-8-alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d7c457955..0f42c556d7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -436,6 +436,7 @@ config XLNX_VERSAL
     select OR_IRQ
     select XLNX_BBRAM
     select XLNX_EFUSE_VERSAL
+    select XLNX_USB_SUBSYS
 
 config NPCM7XX
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index ce4f433976..0ec6def4b8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -136,5 +136,4 @@ config USB_DWC3
 
 config XLNX_USB_SUBSYS
     bool
-    default y if XLNX_VERSAL
     select USB_DWC3
-- 
2.39.2
