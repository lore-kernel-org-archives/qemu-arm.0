Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888358lfb;
        Thu, 21 May 2020 13:00:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp7CaA4CEUtvAvbMIqikeHmVHCj2TxUfLmOtwX/nIabqeI8IwhJ3BI8t7zqldvn5ePQOwh
X-Received: by 2002:a5b:903:: with SMTP id a3mr18166299ybq.141.1590091213884;
        Thu, 21 May 2020 13:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091213; cv=none;
        d=google.com; s=arc-20160816;
        b=Nvn/zBuwCiekLKzvG8NWxMXl1ZDjJ5O5Ur/kGK99PY7yNON9SeT9dB9wMC8dWMTrFx
         mccuy28VCB8VlqXLB1x3a4EzHRe1PZc7Ns0RRmgkDAcP7VI9Fk5YkzrCGoggV+i8lwtA
         YzWzOW6D1LeCI3oMtAMS+H9qBpJUhwcXbwuM5ORsUo9xp/NVBsDOGcgH+k3qixT4J0YK
         bnuQCdztCnJQT4hEjnP4gXeLdZTWarpvSzT/0GMgSeOOx1NQvYKNXDhpJmeQXNZx+mcr
         MBZyOD2d9fHIrVJHaomk6mDHFt01TAfPeFms/aIuLfItDtYAHZv+W+wNp8BHH3A8lgLc
         oI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
        b=DM9nUz+nbr7/830R+i3TFvJ/mYIQAL3MoStBA+gvOapdjwFZj7lSqo4mvl8DRWHC2Y
         S/L9sro61+2DDeIANU+51+RGLF4yUOyEngf31n9TWCXNcFqUME5dspO965hlr41HvErM
         N+08i+H101aHvngWQFeWj5aqbdbqajL+AvgG0UjocDZOxJYvKSBq0hERMv1jd1OhJTgW
         uempzapDbUsThvNEcO3SHa5J0krfzdkolrytohlostfvD+jZODe0gUqJOyZ7s9/cFZKq
         xTFsS4eWcm1e5kUdzZeC5rAgsGBs1ZIzyWI0M8Yj0fpld7JEKG6C7IIzxX1Dw4Gfn2d5
         M12w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bjut5/jr";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e7si5690932ybe.99.2020.05.21.13.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 13:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bjut5/jr";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
	b=bjut5/jry8dMJw1PXO3YrRAkTfFnhcDR6LNWa9Ck+vPnxu3QtCmrdlsAsFBLgBpuHaHvpQ
	HbWsbZFe/tQlgtT28pBoB4B2evmpIX7EsxQCsgCjg/wpsQPidAvYtxCVtqkoI2M+BBZ/jM
	X0KdrnTQLk+kJJLgqrNqLoK2jpMCzmA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-RHoRJeFCNM6JADznO2TL8A-1; Thu, 21 May 2020 16:00:09 -0400
X-MC-Unique: RHoRJeFCNM6JADznO2TL8A-1
Received: by mail-wm1-f70.google.com with SMTP id z5so87853wml.6
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
        b=KW5TZVa1HSjDtMn2uxQikdEp0FQJJRFalotnJwdVQID6t8nd+Ve5c8p6ZPL3DBtSxx
         e774exulPDxOGTEeWiZy7MRHuySISKuooWclTDnHQnOzwVGWlcNT8fbDIoLRtz5lLeMy
         QpFrv4J422NvcA1OeZCRXrMysgLsknhBAPluhw7eR9L8ieYrQ3FsLo5t/s/z/29ssMbc
         lA3P7nd1dmTymIucqDvc3QNfE0PXhfuAtcq1/V9CVfTTDr9DHdohU9ti8cvlwb5EcD8S
         DjaL+hRNv0pA/1k2DDQ9ygwLqPzgkRyT5WVHr/wuXT5AXHIO3cVQMu8u5fPlVAZybidO
         C+xg==
X-Gm-Message-State: AOAM530rki4ypUfXdAFMjXOSTaFJdacehJrur1UmYwDnYpttq9pF0SSU
	D+FM4u+1P6InHQow1VfuMRtvMp2F2B0m7jiiQFYQB9rRcNSX3GHIit1wcb8UzmNYsyEbyeDNug7
	plciO6L/mO3Wyadzg
X-Received: by 2002:a05:6000:8:: with SMTP id h8mr235568wrx.372.1590091208414;
        Thu, 21 May 2020 13:00:08 -0700 (PDT)
X-Received: by 2002:a05:6000:8:: with SMTP id h8mr235543wrx.372.1590091208262;
        Thu, 21 May 2020 13:00:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id j4sm5672973wrx.24.2020.05.21.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 13:00:07 -0700 (PDT)
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
Subject: [PATCH v3 10/11] Makefile: Allow target-specific optional Kconfig
Date: Thu, 21 May 2020 21:59:10 +0200
Message-Id: <20200521195911.19685-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: zRsNYIHlDh5r

Allow use of target-specific Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Use base-arch() to include TARGET_BASE_ARCH/Kconfig
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f8a45e1379..d5009cd304 100644
--- a/Makefile
+++ b/Makefile
@@ -423,11 +423,13 @@ MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
                    $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
+                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		$(wildcard $(SRC_PATH)/target/$(call base-arch, $(firstword $(subst -, ,$@)))/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3
