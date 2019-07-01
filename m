Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2654327wru;
        Mon, 1 Jul 2019 06:27:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYm7DlYGvZVVVOUFOOxgf4p7c1xmPT0SA3ntqtlek8FBy7012ohBxj8uxtVzPKBsrCnJOp
X-Received: by 2002:ae9:f107:: with SMTP id k7mr21223829qkg.215.1561987634092;
        Mon, 01 Jul 2019 06:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987634; cv=none;
        d=google.com; s=arc-20160816;
        b=FSWeFF/gSLEohOZZWpZy6zUo/eXf1htHJQ3asgFX0KVPHsK+UpjrvZGwf78ZKUroqD
         4UjLYWLsoG1cy8Ajfki5R1r4azwLhcIysZkNW7XL0++vbBVqd2y5vO/x/4HD8T6hQKn4
         kkwYvHqcGUNB0PqpdiQibx9JkWCo33Y+cUf4gtqD94gIzAuiEwt0izZQJsGl1GXfFh4P
         06LlkgY5ftE8P17vDG9+QSzgBq1d2YIziCYbgVAmt77SiYshp7DJdfkrYg7Qut3bJ2pG
         VDfgTHIYm1Z0JHuFxEXr2XicimNBxgV7n21f1WuWurqNxmA3PKkfy/ikw4CRB+GAzifc
         V38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Okx9cICGESStz4fghS8fy/6Lc8y97uJ3M4W7xARAQI4=;
        b=TKsIK1IJ0nd1cbwiMTLMwr5Favm1Sq2C3pXENojj/RTQ9QkU1HenXAiuRcouQLAmrr
         R5C0O0M2vZqsKaZ4ViK8za0cPw7O5yYbNi1QKnt4BTRd7+TE871o7D5r5nWetOTT0Gmq
         rqXwFDt9xpPoKLwmXyYSFNw9FNjx2a3UnX0q4AgCJKDGWk7IVpW7d2qlWpETlMBiIXww
         wF+7RW+fo+M1d0Kc8OL7EpLg6m0PqqlJEpjBjH09NQMOj1v+JoClDIfGkJX336jSNaQ3
         ntgC+RQVDSN6FxmPy3FUCihuKijCsJb6kmsLM62jVN1xiuoABmJ870KZq3yplqEUFzBL
         7AIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f50si7817659qtc.104.2019.07.01.06.27.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46163308792D;
	Mon,  1 Jul 2019 13:27:13 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AC206085B;
	Mon,  1 Jul 2019 13:27:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 27/27] target/arm: Do not build TCG objects when TCG is off
Date: Mon,  1 Jul 2019 15:25:16 +0200
Message-Id: <20190701132516.26392-28-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 13:27:13 +0000 (UTC)
X-TUID: zjId0CSQNhla

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
