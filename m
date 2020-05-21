Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888089lfb;
        Thu, 21 May 2020 12:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycLbgFdqI4iyZvUnvxxjFK4EzzCRnR/5LEJiogH7qNznc0OkOoKmkOl+NfuQXAKEE9F+qY
X-Received: by 2002:a25:738e:: with SMTP id o136mr18872791ybc.14.1590091190882;
        Thu, 21 May 2020 12:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091190; cv=none;
        d=google.com; s=arc-20160816;
        b=g2dBYwqlRu5PX7+dN3aN20XnB+YgfSqLxualkjpi6JaxsstYcgCNz0uFixIuMNX/Eq
         I70r9eUajVth072mj3DRTIhUjDNPKMR742Ok4vkweD1nGt4tbPH8OjJZcdfBHIeVcjbs
         MQn3DoBFp9fQMGv2piy4ngcz4Y5r4Gf1o6UUcH+m14Qc64H1+0GJHD5DTTCdWGwl8otN
         v96jrX4EEIniFDUnkk0lC0StaADN8p+zKymu14MdJBdYTvEb0twVa6DsnsKu8PXXn2Z3
         XqrnLFQw3cromAeq/Kria+nruwK+jmlGf+GGZiyoQlPQPPBGuS1jAvr1fiyCvugB1lSD
         voTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
        b=mt8N5Fk8a0FT4B2nEFwvYZboMdk8ij1aPeMxKtj1xHQczchF6SMPam62pjvG9+l/Gd
         /cQMpRD4n7OpH0sWc8vx3E6xrQtzrfHMRgOGCyF/r5MYyo+QPUEKgpKufl7dcgYonxG+
         9BHd/BZ1+CefJJj3pPwb0uRXLt994hMpv41x4ZOLMAPdLAAGZfujIG2T/qjlW8AmGi+z
         9x3BQ7sfT385h691qxnsrwdWl0E+CneL6MoYiSxcPcuN6w7OwjsZP/NgYKEhb/7YmlVC
         9RCoWADVbZUs1a7HBqQ55z9kYiydu2gdhdIWO0XaeCs3RmQG/2wwea6x/SS3AD0XlK1n
         3kEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TB/Re3O7";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id g5si6102440ybe.497.2020.05.21.12.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TB/Re3O7";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
	b=TB/Re3O7xAnpelHUB91gzuFOdAEmmZYJoJBYqsMIFi/ii4iuRjIfho9+1QCBbIkc28jFfE
	p667Dl/SLtxfQIKT9Nzr8inqEH3yYItdnphBM/hn8xJsOu0X0JSCXN9a3qYcoEXUcwLLaO
	9N7ibF5+xtxMFjuaCoG3sdcdNqqDOMQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-D69S8_SXMre-L0m0_n9NSQ-1; Thu, 21 May 2020 15:59:48 -0400
X-MC-Unique: D69S8_SXMre-L0m0_n9NSQ-1
Received: by mail-wm1-f69.google.com with SMTP id y20so941954wmi.8
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
        b=aZPlP3la/I451Q7BGCA/MNv87BN5Tn2w0yN6Apl9mCDks+92Nt/pgtt7tEvXqH/dfL
         22h/O1k/TSMZ5QrypGK6H0h2zAN/W5etZkLtQnrB3fmYBwGGv+u15RRLfq7ZV5BTklTO
         EihUkvQHAaQQTYXJLQW+szFQCMoxG67/EKOyvImtxJoCpnxe6O6/b6qqBZWEfk4axrga
         VXbRzhjhJN0F1pf0Xu/h7vCvsK+YPBolKTYeu3s5pXlYVvIbxrcdjnJ8DAnvKVo395yw
         Rnlws6eVL/3fkWg4+3ri+PcLZZ3mSyohLPwvLDTK/VkrrYKv+5naDV6YNgvuWZnnz1/v
         bxYg==
X-Gm-Message-State: AOAM531QBykfL2Z0DvctqRxqJInvcC1FerucvA8m8qznRfP11BdBbJR5
	S4x/zjYFe/BHTBm+DwyOt2K8ZZCeKXFEXMjdDUPezGTMsg5Oooqftj35EGZNaddUX9m78gHzqH6
	VGerkeBVDdjgqZLfy
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr10054067wmj.176.1590091187088;
        Thu, 21 May 2020 12:59:47 -0700 (PDT)
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr10054054wmj.176.1590091186867;
        Thu, 21 May 2020 12:59:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id q5sm7928308wra.36.2020.05.21.12.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:46 -0700 (PDT)
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
Subject: [PATCH v3 06/11] Makefile: Write MINIKCONF variables as one entry per line
Date: Thu, 21 May 2020 21:59:06 +0200
Message-Id: <20200521195911.19685-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: VAJGKOtHC495

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6c9d718b2c..7666f81e8a 100644
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
