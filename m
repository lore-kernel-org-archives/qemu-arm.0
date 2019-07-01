Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2652880wru;
        Mon, 1 Jul 2019 06:25:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVL1Rz5QWUBqqLhQ/CFU6ZWXWFbeWobTpFtvIkSXYSOKB3D+5kabpx6tw80bmAt+7gJc4I
X-Received: by 2002:ae9:c30e:: with SMTP id n14mr18964293qkg.220.1561987543654;
        Mon, 01 Jul 2019 06:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987543; cv=none;
        d=google.com; s=arc-20160816;
        b=FGV/xDE4zZV+Q+KgaJvrPIa3D4Fmvionuaxz79tL4Xlid9ytTZ2Hl7ak4uJCUPEPh4
         U6/LPKPEsVjserz3f8oeQEFvePG5AN66KbRsY2cfcg5xLjR0GorZa0m8TJ3oAQL41zHL
         1guzzXmiHg1rbBjTgrw5ZV/osHbAPPnfq2TDWRQco4biqqzrFCzdVFlnI7bS1g8yq09o
         DbUxG5qWPmD3NEIz3reHa4fYZsOwQwInccj1dC070za6nS2fzmZXXYX/m5ixrM3avTF1
         L2+QcqqL7sNUx0XmdeMT9PQesxBZMuA3OSiSYlPGlcZORoHO6To/HKpSjnIqpgtMRSuj
         UOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bkgV+B35PFMDytJWd35KhlcRcpJKYpDa4Tvn3fmXnQs=;
        b=djy6QFIYCwOisXNvrEI1kfl2EjynNaLcPp5ELuaUmPsLOcYRTqdwnGdzhW1yp66QKf
         BExr6GvHn6KsMBiWYe5m6za7Rhn7qXDeNJI0PFHurwQOsw9jmERvCBXjGbpcGFWJRdOH
         9XWlWcOCRwxF4qADAEz0vvWhgS4Sf5nEMLmVgo6qA3vNSspH82SeGG7HdpmQVVEblHQr
         NaGpEvDIP2QtWhbWefr8pdaU2FjjyjeuP39xqK8gkKyC+KaJip0J/vg+O++BpknxDb1Y
         Tq+B1TOofTOtTLS6ZFVi2C5g1OLSPaEy6Myu0F1FdgmJ+dLSR/duFMRVo7xgeiHmHPno
         mebg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p127si7610501qkb.356.2019.07.01.06.25.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0E283082A27;
	Mon,  1 Jul 2019 13:25:37 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2369F17AB6;
	Mon,  1 Jul 2019 13:25:34 +0000 (UTC)
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
Subject: [PATCH v3 02/27] target/arm: Makefile cleanup (ARM)
Date: Mon,  1 Jul 2019 15:24:51 +0200
Message-Id: <20190701132516.26392-3-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 13:25:37 +0000 (UTC)
X-TUID: VTtCIeo/VOG+

Group ARM objects together, TCG related ones at the bottom.
This will help when restricting TCG-only objects.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: move vfp_helper.o
---
 target/arm/Makefile.objs | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 7c31fa01c1..1cbe7cfdb4 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -4,11 +4,9 @@ obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
-obj-y += translate.o op_helper.o helper.o cpu.o
-obj-y += neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
-obj-y += gdbstub.o
+obj-y += helper.o vfp_helper.o
+obj-y += cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
-obj-y += crypto_helper.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
@@ -32,6 +30,10 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 target/arm/translate.o: target/arm/decode-vfp.inc.c
 target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
 
+obj-y += translate.o op_helper.o
+obj-y += crypto_helper.o
+obj-y += iwmmxt_helper.o vec_helper.o neon_helper.o
+
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
-- 
2.20.1
