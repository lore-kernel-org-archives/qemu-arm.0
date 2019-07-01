Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3004455wru;
        Mon, 1 Jul 2019 12:50:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAsDBT1ppK/pvrqukMEKqXnuNjkVGun8K5yD1RuaLxncwNk2MSLN958TSHsa574G3wwHjo
X-Received: by 2002:ac8:28fc:: with SMTP id j57mr20460555qtj.330.1562010633054;
        Mon, 01 Jul 2019 12:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010633; cv=none;
        d=google.com; s=arc-20160816;
        b=w++QydZseeslfw4834TApvv694b2pgC2FcxKXCNkM6i0i+Zhaxeu+qEOFhr+bKf7UV
         GTXz7p7uaninFA509UhtMK8dc9ryWx3B4Jr+rAQgoD6GCMfOoqpYJDu1qYCjkc4JD6G9
         f7YlBASymPSIC4jtqMc3l2RwWsdm0UbeK66xpvWPdfN537/1ZNKMgNIIiPLGNaSaiub/
         QcwVgI7L2EGDLodBchnBPdK+PXcOSXdk1pCcIM8MJ0yfh+rzVyzBHb7WvNQ1lEDZuG86
         E+mAqjEosR8vtht1fPalnPfDUzSMclu1IVJvKbf+eOPeCjIdXGoGV+CUQ+5sff18niBy
         /aXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Okx9cICGESStz4fghS8fy/6Lc8y97uJ3M4W7xARAQI4=;
        b=Smm2uyGxPfpGoSEBoaf9bxG/3LX2ZuLSObhnvk/CvgM+4bfFOYMyP1VarpMpiM0UIY
         aNITOkzYpa6wB00fJ5kUkUfJAuCcGKwOV+YazHI1uIgfsQKINwtMZoSNzHuP+EZgWuTv
         SfG7S0oEuMl9WmhtsZT3nAuW9VCUPU6Vi9Bx8ZeZSqoPrMX7f6m+nzTpuNKiCdTOGWaD
         oCS5IBUJcmBx1xgkEVAiAE2gB/LTrBWnnAwZwsKgszzDyiVAvOhhhmrbQI7AvuTlseSh
         xMCrjurr/U8P3NGMFzbQJoERhObvCg9uWWFu5x6FncPkyqZy/mo1hUVM0ZWFaYRUaoCs
         co8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k43si8339707qtf.219.2019.07.01.12.50.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BC63308A963;
	Mon,  1 Jul 2019 19:50:32 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34BF8379F;
	Mon,  1 Jul 2019 19:50:26 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	qemu-arm@nongnu.org,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 8/8] target/arm: Do not build TCG objects when TCG is off
Date: Mon,  1 Jul 2019 21:49:42 +0200
Message-Id: <20190701194942.10092-9-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 01 Jul 2019 19:50:32 +0000 (UTC)
X-TUID: fsJnWwR9AspC

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: complete rewrite of patch content, removed R-b tags
---
 target/arm/Makefile.objs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 89cd7c36e3..c8bca74a63 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -32,6 +32,8 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 
+ifeq ($(CONFIG_TCG),y)
+
 obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
 obj-y += crypto_helper.o
@@ -43,3 +45,5 @@ obj-$(CONFIG_SOFTMMU) += psci.o
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
+
+endif # CONFIG_TCG
-- 
2.20.1
