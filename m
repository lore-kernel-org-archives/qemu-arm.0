Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679263lfb;
        Fri, 15 May 2020 10:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt1eCHEv+1RKRGgKB3f3SxS8RBTr/bMkTWF3J0HuEJExJ1/Ovpg8IbSPvJbKHNhAgG1pws
X-Received: by 2002:a05:6402:21f9:: with SMTP id ce25mr3878388edb.85.1589562525482;
        Fri, 15 May 2020 10:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562525; cv=none;
        d=google.com; s=arc-20160816;
        b=YK0Zp52lQbIMvvBi9eh1Yn2au25hwT0tR//pV9WHjhdiPKbTxXeoLPL8lqmzPX3hZl
         VeC7ot76GxnVTqC7k/DGH7VuBCcakLJobm17GFH+Ufu5svNGgrLC/IgC3EqZc7QCmd6n
         LyZMus7r+BefskrInL0I4vGo6Jelft4GJBdLTkxPdaAoYU4rdlymdBEdo7suFTr1APFk
         0y83A+BnXDAnm9k1ya9nLCy5/NxyVnIeKVAmtyQLcHrFCB0rwV6msy7FSyhG+9FVZPge
         6JunGD0qGWbk8hG0hW2VEIcb8+NQbpK92cA/dhWdCUECesAiNYeH+SHejiNIbFcAQZPb
         35eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5ITVoQ1ZbyJY3869Qz0QJKhcD0XsDNN4PZcYvj6FH84=;
        b=pn9g6HTfnX60ONbIq7X6Ntza+ftFKUCGUGyQ4YZJKF+3iVPZPZap+2gk4Tos42iC8Q
         Iem04tCB5VTc8UDCXLOt1MbFKdZICLQ/iVVRC+4rH3PbV0xIBlDAB6JKthQ7Fa7A17jh
         0pQeIB4C1r2OXZJbZeJI6Uy+t+EIUtDZROf2J4iMGyPW1d10DWuZl23vFeuOaH6m42ax
         gfGjFmg/MkkTPhmx+VNBI1a82LKHHZFqcei626Q/vk7g61vJRdRAPbR0FkNvdWw11fKW
         TNrF4lX2a/4kCazxDD7A3r4H9VfnDvpXofp0POXtl4jCu914fjRpMoKmBP4AvXCleF5f
         +vLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S1k3BOs8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id q22si1572948edb.5.2020.05.15.10.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S1k3BOs8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ITVoQ1ZbyJY3869Qz0QJKhcD0XsDNN4PZcYvj6FH84=;
	b=S1k3BOs8jR0RETtGS4vLGGVJsTiWwt+PEDj1qaBRANdwjNyeOa8EXSu1UV5QoXxmdMwu6Z
	pT/m0pXl2zmBvq7w49TYM3DctU8tHVlETbIILbgzr6fsbNs+wERhiaC2jQSn1EZlqAsM0V
	lD0gYaRLG+5BG9ztC+Nhk8UZ70NVdAI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-GcUDDBFSM46xrxfP9yRO8w-1; Fri, 15 May 2020 13:08:42 -0400
X-MC-Unique: GcUDDBFSM46xrxfP9yRO8w-1
Received: by mail-wr1-f69.google.com with SMTP id z8so1470767wrp.7
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ITVoQ1ZbyJY3869Qz0QJKhcD0XsDNN4PZcYvj6FH84=;
        b=dm2eBr9swPyINz9FMlWRoT2wC8xFQJc5t+gDrF2chYnlUsti3FWtVqpNTybUSXyrHr
         7Fdp+bsOyNFpfgybLKGNmxPd0Y5jFLFHARJWgaTzDUqz0BRnKpmTC1OC8qk2RKQl4seq
         vOT2EqOoapKXL2WoKb2LC3uQovpw4vVaY38Lw/xTiV4pOpv0OGYjt2RkKuLHKGVZKF3A
         1sVf4zJEmS+bYm7uqWj7Mq2JdwTB4LqEyZVy8yWxFiECvdgDMDVqVktZ6S74OPBYM0WZ
         2OKDhEcn63/m5PQMZvUHZOb86bGsM7LVl+BLGgsvX3D9i8JgG+eInjLPmSE0e1+yaJtQ
         IpJA==
X-Gm-Message-State: AOAM532azkJgtmp/ZaqTczE8v60QvEXQTG8Ir5QKKn/r0adxWIvEvTok
	EIkT10Z3f29u9OiooqMmo7nM6+7a1TWnQ6S0yTZ7ZRP9mNeBE506Ka3K9eRf58uK8XoawXMz4+3
	YloDY40CSjbTZr85B
X-Received: by 2002:a1c:b354:: with SMTP id c81mr4963850wmf.136.1589562521304;
        Fri, 15 May 2020 10:08:41 -0700 (PDT)
X-Received: by 2002:a1c:b354:: with SMTP id c81mr4963827wmf.136.1589562520987;
        Fri, 15 May 2020 10:08:40 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id h20sm4351735wma.6.2020.05.15.10.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:40 -0700 (PDT)
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
Subject: [PATCH v2 06/10] Makefile: Write MINIKCONF variables as one entry per line
Date: Fri, 15 May 2020 19:08:00 +0200
Message-Id: <20200515170804.5707-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: KEwr0j22yech

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 84453789f9..665900d5c8 100644
--- a/Makefile
+++ b/Makefile
@@ -418,12 +418,15 @@ MINIKCONF_ARGS = \
     CONFIG_LINUX=$(CONFIG_LINUX) \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
-MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
-MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/hw/Kconfig
+MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
-	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
+	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
 	    mv $@.tmp $@; \
-- 
2.21.3
