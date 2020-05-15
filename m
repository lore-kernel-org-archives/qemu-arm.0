Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679223lfb;
        Fri, 15 May 2020 10:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFoG+K7fHwwuHeU62Zd9f8crxb45IpKSMlPgyPJt7FKqDfp3k/k3SU+yKyEBy97/B4vPeX
X-Received: by 2002:a50:c016:: with SMTP id r22mr3696110edb.388.1589562521955;
        Fri, 15 May 2020 10:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562521; cv=none;
        d=google.com; s=arc-20160816;
        b=ATIaDRAZ1nL2qg7FFtarm8ZdK06LL4+s3e7cRNYbq+Tbzam5PmAHpn3Uqn6FZ6ZUJh
         86zguLvkbHFUiUTb8yWweSBxuMuN8jbLbjCEBtSGtiUiZ9UyZEwzg8xJb1QD0CcWI0l+
         6BijOAxp3DVPJwf/oBuYtINaXISH96NCYVUzrvE1E82S1sChXQJp9MzOZCOcfMvlMJ/m
         iDcnD6QGZJnaWRuJJUSiQ625XBjQ/1JVPzzdHjEDToWSYaCChNvDWIr6d7TwZ1b9B905
         t0hIWCRsTbjJyEry4cHty6VBhft3O5OZiodAUo0Zwd5UV0GSH6tHGM6zgbn07AO6V6t/
         J1ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JTxQcDt8oQCk497tRXJC3a7DdI5+FkjTGcyXVLcdRbM=;
        b=dBfNaSxzNjw8aN1XVzHqH2pgh8/HNfgXCBfm2C0LEOUWSR6H1TNQf4DbC+qEdydiap
         a2XIMf2s5FTbnJZhW8HBYJmgQoCghE3o0kp7gCO3+6KDuZAu7vloZVyR7FPiMdjwVU/V
         SyfgCojW2UEw7nUcmeMTKjrd8Nqe72ZfV64f5kL6nyCJLg/07AQEYhlMabgrOUhfpGLA
         +SqIevHx1QAvH6e75ULVuLrMPXl/A9sTo0fVCd/CWHEZJKX6QUbIKw1RQqvHc394+gVr
         QqClAS99jT7zGXi1BTsmwOiKU4QAqnvGrT/P+sqil+WVNM2sUhH7PTzZYdM3tp0SetbR
         9WQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L6tZ5OF6;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id oy3si1710501ejb.226.2020.05.15.10.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L6tZ5OF6;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JTxQcDt8oQCk497tRXJC3a7DdI5+FkjTGcyXVLcdRbM=;
	b=L6tZ5OF6iU7vGkhmifzGbzgRcGzbcPtV/oXNAhXsefFmupp8mqb1t2UOubTMb3xyVg1j/Q
	AlaUywiU1cHPxPUqrEbCCFRaplMtCzi2duO+7t7FvOhp4EiEs05Fe2BMWPqibmszhsKKI0
	4ibdq80l2AnxjDkcvrboOpfFCac1DCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-weeCzbSeN5-LA0b3fmF-zA-1; Fri, 15 May 2020 13:08:36 -0400
X-MC-Unique: weeCzbSeN5-LA0b3fmF-zA-1
Received: by mail-wm1-f70.google.com with SMTP id m11so1262493wml.5
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JTxQcDt8oQCk497tRXJC3a7DdI5+FkjTGcyXVLcdRbM=;
        b=mgwr5jRJumzOxZY2o+24E53voXBIA49ouMUQdK5WkV7bzHpSqxZQRUlDcJzHHaaz9y
         /95xR9hhGUDZafzRPYLmKPACOCwebIcvgM24M0NUcVgrKdZ9j1M0g0QqeWFGdhBXa35T
         OWKWMLe+Y6x5AFMkDcOXEnYjy2Pa/fvq0zWLm7CU6JnsnSiuAXlwB2gv4KNtmrBvCnyf
         jEvKCKCpFcTTf1Pquw7fWjqPKcN2ETUjAi0uen3g5InWUZVg09obuR9z4nWASH/N/H3f
         I+rgj4RGg7LM1svdqN+Squ/wtHDf58PEFPGTw0jsvEHI3d1yeN0NiTIRoOmyzbxj/8CA
         6j6g==
X-Gm-Message-State: AOAM533pu4HkOiOSTjEnpmjviP1sa3wy8aoVNqsWQG/NhlZZM174HOBY
	6kP71eAew8ykEfBhwxjXonVq64os2JuMqWCzqtB4rgXQinj65hcEiDgEarJ7QUtYGEa1U97jfcF
	ahMjlKddvKlyq1CAA
X-Received: by 2002:a1c:b141:: with SMTP id a62mr4847491wmf.7.1589562515267;
        Fri, 15 May 2020 10:08:35 -0700 (PDT)
X-Received: by 2002:a1c:b141:: with SMTP id a62mr4847476wmf.7.1589562515032;
        Fri, 15 May 2020 10:08:35 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id j16sm4368177wru.13.2020.05.15.10.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:34 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 05/10] Makefile: Remove dangerous EOL trailing backslash
Date: Fri, 15 May 2020 19:07:59 +0200
Message-Id: <20200515170804.5707-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Vqt3U1GSjJqb

One might get caught trying to understand unexpected Makefile
behavior. Trailing backslash can help to split very long lines,
but are rather dangerous when nothing follow. Preserve other
developers debugging time by removing this one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 34275f57c9..84453789f9 100644
--- a/Makefile
+++ b/Makefile
@@ -420,7 +420,7 @@ MINIKCONF_ARGS = \
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
-MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
+MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
-- 
2.21.3
