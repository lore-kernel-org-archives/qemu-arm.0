Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679343lfb;
        Fri, 15 May 2020 10:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyXT1nVZQDrCYKf0TgzRg9VLezSPzxwP7KBA/Z0nHcyrDsVKRERaNKDozxHLLOiudfppP8
X-Received: by 2002:a25:c287:: with SMTP id s129mr7083056ybf.337.1589562530455;
        Fri, 15 May 2020 10:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562530; cv=none;
        d=google.com; s=arc-20160816;
        b=GktWgl1VOJY1hLE7io8imSGI+F9IoxxoK3nfh/dxUgz7ZapJSxAm1MvIex1SUox3qy
         +rK6m25KksLj0n3X2Xiw+uPO1by9oC5cinyxyeGbNGrVYBhys5IeyIE/hl7B+3PZ9rwH
         pX6IS9ATOwXopYiWLnT6CSTUas3cK0fswTAl8jnR/I1us7scHbEPjAjF4QLj00YuXqTd
         oKnC2wcfFyJfNi+/BGaiSCVE+/lI4UeO7EwAfeMnVELht1lVOk1mCtRdwKktTCc4lSVI
         tmnU0ODucv4mfvuJDt/yMOg+cGRr5xKjzqUK5dcrg9M+QXDGnxAb5A5Mrq9iQQmgZOWr
         1U7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=67oKUwzJF/EYz6sathwG2YKI0GXJwcGpGF25DTlLRL8=;
        b=y0ykEszthjQlPPxZ6SPxAlWMGf7imkcDi8SuOUaQ2BHfKjrXqetYQd4/trlc6358rM
         evSgQsUtaUipYYHAeHLuRITqR9KxpTwKPfxGE5yhnNIGHswfiIj+bIQTJvWCjkDOpNkz
         Fx3cp9JbbJRO79FNka6YtznEawQ4ROp3g2Jal7BvHzywdvwYNYx520oKdfeQ05f10lfP
         LDnukaubN+IN9+vGEsGORKNTLmjW4w52uGGJ7yJiMarZso2Ad7HfQ6SbnOJlASaWMcS+
         KPH+vxqDjBov4b2Nx9lFv1+y1l6vw2c4e9sot2n9ZuQE5t6aZ0rCW3w89NMEEoyWPnIV
         LHiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TB1VoQc/";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 65si2033614ybo.141.2020.05.15.10.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TB1VoQc/";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67oKUwzJF/EYz6sathwG2YKI0GXJwcGpGF25DTlLRL8=;
	b=TB1VoQc/00x0WG59/96CKMGtzOaZvob2CyhsIaT5LoBgLvThG5YNoArr6XDIEZ2tnlPCmC
	J9PlJEMuAYT57M9ETr21yULfsfLaBK9vYzCjGsHiT/GHboPmnkcA0cqcTYZpWjHPeVreht
	zFvqcJa0yvROoVRCQhqZm+Uzpxfy2P4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-l_JEoI3PMDKtd9iesx37Vg-1; Fri, 15 May 2020 13:08:48 -0400
X-MC-Unique: l_JEoI3PMDKtd9iesx37Vg-1
Received: by mail-wm1-f72.google.com with SMTP id g10so1476657wme.0
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67oKUwzJF/EYz6sathwG2YKI0GXJwcGpGF25DTlLRL8=;
        b=K9m6tr+f06fyjr1WYjPPbco1dHDZS0/XznKEvTOpI74OoJTObHbhCShHgXWypDyqQb
         q+nOjV/HSwdYFMqk91EyekXGEnRIdcFe+k+fGobPIObHn2VgpVasK8+CmYNb9rcS51GH
         OZmNmEor2ROl38UfWm0B3E+TC5rMH671AvXS75D9SFg/Vqgjw/BJGL/m5U7joWR4Vagj
         Osqfd+Nwg/g0idQCT0l+P1fIKZcHL7MVb3wbBRcO/4xqvGICfAMcFfjEPOvt0cNFrv0+
         IrDBXUM9C6r+KxW72igfIMVehwHp26g1cjlPXu+gzYAPEDMcn6rbgBs6AucgQrjqGhUN
         ViXQ==
X-Gm-Message-State: AOAM531vHN8DSQeImMbK7RF6/Pv6+ldINEw8C1GOAwxIuTT0A2qLrFSb
	JxdznkUR1/ZsHzRBmAdsG0rbRneNVbL7cqdKbremqHh0uN9tq/WKqtBUANFigHhWoAeXhWvzFHv
	LUPAcq0bCmIwFzo6w
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr4995608wmm.107.1589562526805;
        Fri, 15 May 2020 10:08:46 -0700 (PDT)
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr4995590wmm.107.1589562526574;
        Fri, 15 May 2020 10:08:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id q2sm3795634wmq.23.2020.05.15.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/10] accel/Kconfig: Extract accel selectors into their own config
Date: Fri, 15 May 2020 19:08:01 +0200
Message-Id: <20200515170804.5707-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: MW90hCWuYtkM

Move the accel selectors from the global Kconfig.host to their
own Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 Kconfig.host  | 7 -------
 accel/Kconfig | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 accel/Kconfig

diff --git a/Makefile b/Makefile
index 665900d5c8..06826273c1 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,7 @@ MINIKCONF_ARGS = \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
                  $(wildcard $(SRC_PATH)/hw/*/Kconfig)
diff --git a/Kconfig.host b/Kconfig.host
index 55136e037d..a6d871c399 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -2,9 +2,6 @@
 # down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
 # these two need to be kept in sync.
 
-config KVM
-    bool
-
 config LINUX
     bool
 
@@ -31,10 +28,6 @@ config VHOST_KERNEL
     bool
     select VHOST
 
-config XEN
-    bool
-    select FSDEV_9P if VIRTFS
-
 config VIRTFS
     bool
 
diff --git a/accel/Kconfig b/accel/Kconfig
new file mode 100644
index 0000000000..c21802bb49
--- /dev/null
+++ b/accel/Kconfig
@@ -0,0 +1,6 @@
+config KVM
+    bool
+
+config XEN
+    bool
+    select FSDEV_9P if VIRTFS
-- 
2.21.3
