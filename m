Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2704160ejm;
        Wed, 3 May 2023 02:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683105168; x=1685697168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi4DR69tbZyoPw+FTLcDv9TUw8qrCrvNefUXp2WvEkI=;
        b=dcV67XhFrthTa5KjylqP4ezGKVhYZ9yj0cpZ4MDRwpqKP5j2S/gpKw6AjvfGsllUdJ
         cD+kHpM2SeUhs94iYYhKoAxU6HwoC9V1TEyY84yIwlqACRphPFoNsMZnMcc90F+sUbyC
         quCmbs5pNQadqLbGVNMHE7rPGJOJpR2dX3zCCP10wJYRCEiF4f0GX9aerxW0vjF1+bpu
         BvnS/Qu383YiYlKsQqFgkwjsmTKRWzPHJF1+iu7BlgXfZVh3juJ/3i6bUimYJAXsL0a9
         7zQ7x0BrvJAvJceQHw2K1Gx7C3KRVcHMUDo3ODFCRRKZsVAVTNdmYAdYToheucuANxY4
         BndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105168; x=1685697168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi4DR69tbZyoPw+FTLcDv9TUw8qrCrvNefUXp2WvEkI=;
        b=Yct/OIYe+Gah0+6S81ktOaoNGZf/XmU3j96ZdwO7aj9mN10RzcPkzKpmR5lzfxTF3y
         hdmqsdjBGD7wyFzB2T9XoHV5qgv/M+8DeqKaorq3uZtD96QwW7TgHZBUmIYjlha6aJ4A
         EDuNVWc5dgOBUp4d4uJBL7BNGB9JCMDKA2GFqiVc+SbZBi1RZdxYcL2R2BQM0rNtio7i
         zQPGXRRTQ4Pe5c77znjgqMc3KLKlSxFOok0V+tghGNGfIldHjDZOMDxesPDVM+T7iAIl
         RbksS1QjvhYD9ipqfBlxprEd5/pww6X4b8ObtEfeNdpf1IQoEW/YJAzIlCdi86OwpcAS
         hlvA==
X-Google-Smtp-Source: ACHHUZ74tRw7sId5BxVbsGuLuhmxEX0AaJrqiuVaZ3R+fZ+dCS/dhcz1dm/pUgzu3VhxkVqUgkrXOg==
X-Received: by 2002:a5d:4a50:0:b0:2fe:c8b5:b5d5 with SMTP id v16-20020a5d4a50000000b002fec8b5b5d5mr13302259wrs.2.1683105168244;
        Wed, 03 May 2023 02:12:48 -0700 (PDT)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d574b000000b003049d7b9f4csm19181019wrw.32.2023.05.03.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BAAF91FFC1;
	Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Andrew Jeffery <andrew@aj.id.au>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Beraldo Leal <bleal@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 07/22] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
Date: Wed,  3 May 2023 10:12:29 +0100
Message-Id: <20230503091244.1450613-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tj0KNi058Upr

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
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 168c1e8089..cec7898bb7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -439,6 +439,7 @@ config XLNX_VERSAL
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
