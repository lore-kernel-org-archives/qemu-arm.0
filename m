Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888245lfb;
        Thu, 21 May 2020 13:00:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKe15EKgRGrIYdm9WLk/aBAPTmFy1558y8o33iKNpbgLXKHm89ENk3gd9yGr+2k2uN9P5j
X-Received: by 2002:a25:3bc6:: with SMTP id i189mr18330912yba.411.1590091204512;
        Thu, 21 May 2020 13:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091204; cv=none;
        d=google.com; s=arc-20160816;
        b=soAFRNCpxNaQG/ppUOk9R3GVtvk7nekPBt7AA5iMLqeeqwWyZAVz/W6o5oyPH0gVF3
         h7Bge+i9kOKWGvcRboT5+FQCj+6wlvuEKGnYdI/cs842nF2D0RczvNEP1nBDih+7dxQD
         eRCGa5kXBL1Cjj8Vm/PJtaPdfRoh/zrbpiQXqnZKJJEfimfL6MJC9EX1sEeK0YOIPFEk
         xYZ3Ek6YjpbBCnf6UpSP+o+3ewXIwnBa9R9N6zA/2Dd0sTzTeRCxcdjp3NcPPAeaMcFp
         Gf47ng8Ca8xF4Y8xUUi77tE7wygWL0an6Tgjd245mTDEEkvuX64zQBYaM+bw50UqDLsp
         NW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=az8pj3ArsVB5H8vNRsyPhpcnKHlQHKIjS7ekh/fQInY=;
        b=xvzGG/db83kQX/01fO8z6AADCslo3rgZRItkdrd5ogJk4hT/OxGOq44Ht9GErvRxSN
         ORV8JzEklfwZ0Ldv2kjzBJd4if+81w09d0ETzwoU4ydudFJ+JDvxtXq0IoWvhKvIWqAL
         dTjys7dgCHI9j4jeztL1/zYBPfXadURY7Ikb+E7mMk4BgoFxVKW4wEENwAyKHVuwDoQP
         4VGBNFnOEWQYLkZoFHsaotVANIp7Ul+9VG+9tcxbOcptd0FasBboaSn/n5rkSeYW/dAf
         CMG9cSnafIskhXK91HkgzRcVSb9C1pF/WXxGpUNBJtsP/7Qm6edCi6kLdy3OC/PXO60D
         YEeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OgPdj+H5;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id a12si5770134ybp.200.2020.05.21.13.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 13:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OgPdj+H5;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=az8pj3ArsVB5H8vNRsyPhpcnKHlQHKIjS7ekh/fQInY=;
	b=OgPdj+H5bQEVLF6ZKECKvJuQxVfcT1o4jQBfDZaKdPTM5RrstZtlDwOdTBYbOtA6ZPi99x
	1uLCG7j9ZX1IhnJEEMhG+x5twfI22aDC7qeGeSgoJazZ/abbGJ9Z5wMcZ+tA9UGOUvhg2j
	tcuUAz2LxIy6Gji9/4pHRPsx2zLw6p4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-VOPnVOnIO2Sg5GESzM-u2Q-1; Thu, 21 May 2020 15:59:58 -0400
X-MC-Unique: VOPnVOnIO2Sg5GESzM-u2Q-1
Received: by mail-wr1-f69.google.com with SMTP id r7so3360363wrc.13
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=az8pj3ArsVB5H8vNRsyPhpcnKHlQHKIjS7ekh/fQInY=;
        b=WOgQTSV7ShPSuHnjSfwGDjF2SRms4Dgl7cyN7ekkdSIEMJcscDHDDO3HoWZTqcdlbk
         vohXWUr9jPL65M88BQD+SwU0DtQoO/Ra2EUfwY0rGMTdXeEibBNTU6Mr97hw+3BLDjDF
         +U/hylKI09+o0IcBs4xpNWqvM6G6Z5Ghw74GkjaaCcPpgfatr9Ed6Me5MG620HojFtmv
         O/abUVURCF5J1uWSAGqwKiYH52Hla/XBuR1XsZPDF8Q/EroNWJDnClMdivO4dEM6APu+
         lPmg1IrC0KfJDoUwZFQWF3/q8ii9iyt9S//P8TiAZsRn2XDaypMq+YmX+LEMC5QfugU1
         nOOw==
X-Gm-Message-State: AOAM532AX8rxuzs+ovZoK7wWJEIiZwJW8GpdAkuL5/GMU+Q77bK+2ds2
	f7x2JcXMFRr6iNljbdOClLMEr0wY7NWAvK0cMFSii5lXHd+D18oWTyiT4+CFEVXiXX2l9f9tdIl
	/KGoi2/OX96+KT92z
X-Received: by 2002:a7b:c948:: with SMTP id i8mr9806683wml.138.1590091197742;
        Thu, 21 May 2020 12:59:57 -0700 (PDT)
X-Received: by 2002:a7b:c948:: with SMTP id i8mr9806677wml.138.1590091197523;
        Thu, 21 May 2020 12:59:57 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id u65sm7476303wmg.8.2020.05.21.12.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 08/11] accel/Kconfig: Add the TCG selector
Date: Thu, 21 May 2020 21:59:08 +0200
Message-Id: <20200521195911.19685-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: TSZL1QV3Atip

Expose the CONFIG_TCG selector to let minikconf.py uses it.

When building with --disable-tcg build, this helps to deselect
devices that are TCG-dependent.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 accel/Kconfig | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 648757f79a..f8a45e1379 100644
--- a/Makefile
+++ b/Makefile
@@ -405,6 +405,7 @@ endif
 MINIKCONF_ARGS = \
     $(CONFIG_MINIKCONF_MODE) \
     $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
+    CONFIG_TCG=$(CONFIG_TCG) \
     CONFIG_KVM=$(CONFIG_KVM) \
     CONFIG_SPICE=$(CONFIG_SPICE) \
     CONFIG_IVSHMEM=$(CONFIG_IVSHMEM) \
diff --git a/accel/Kconfig b/accel/Kconfig
index c21802bb49..2ad94a3839 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,3 +1,6 @@
+config TCG
+    bool
+
 config KVM
     bool
 
-- 
2.21.3
