Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp1529063ejs;
        Thu, 17 Aug 2023 20:37:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3387:b0:138:1980:1837 with SMTP id yy7-20020a056a21338700b0013819801837mr2153413pzb.13.1692329825966;
        Thu, 17 Aug 2023 20:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692329825; cv=none;
        d=google.com; s=arc-20160816;
        b=Pt+rxe/5t/0tXQ8+Qs9HRUp+VAh2WDvyWR2eE26dqLCO1LQ5oK5GBmy5RwVuOJ69NP
         6lHd6ce4201MGcIAujDNetY8c7A/uOeZOs1hh6lo0VOiIULP7Mw3ShbY1/bFPqgvOH+E
         3hU6RE6YGpSrgJuYxSS9AaIKhUXGDXlM+Q4GvwSWBaPJBjXAyVmSLqpClfM5v545JOwc
         QEvodphu/CmoA8kXs32fAOlvZeNXtJRxqoaRlpmRT/LEMqUJXbsX4ObK/yRXNcMtpzbG
         djHGuPxFHqHkidm2NSBjuzbK1guqRI8ByaydWNVVA5ZO5ApWNlZedx0S+yOk8r8tlpgw
         RWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fDgcaTMJn76IqBG3wvUQ8hqaBU+41zfZWx/0YdFh8Js=;
        fh=IdxtL+U8HJ8TOThHm/miJa94PO4pGqoNzDP1s6nycNM=;
        b=YAIcrWHRS3rGyh9bK2BhicGlsGMn7fueJl36rSzvrm2h2kkVLoysc1yPdu5Tbrnu2w
         nR9Jg/W6t/TkVhBXW7b0ir0tHeTPpJh/yhuTG4L/7Z7x5kYLMFxl8jTijXqMEOCBw/Uz
         sbefFp70VAqNezW1yAL4FrH8cM5rU3HmrpSTUbM/juDNi020yRl4A9PGG6AZkUylgd+1
         AaWUGxrGdApocA3YF3oT/f20qrWLuP+ruRoGhywE9AXYD6hljrCIyctZJJT9SIRGl5zI
         hmz9CNZEfHhl60lJpv2GXxU6DXKKbf9x13YpQiyBep8xYmyb5RlgAJ1JyxVx9U8uYscd
         dmxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=c7pfO67b;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w28-20020aa7955c000000b0068859d136casor773528pfq.2.2023.08.17.20.37.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Aug 2023 20:37:05 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=c7pfO67b;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692329825; x=1692934625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDgcaTMJn76IqBG3wvUQ8hqaBU+41zfZWx/0YdFh8Js=;
        b=c7pfO67bYGep/CCalwpSzQG73w6V+Wq8aUEy1/TqMFx8xgzK28E+fDPp8pfIVeG8rC
         wk0RhCkymVULa08xi2JB0CM0XGMHosMmbNW+xL4TmPxXF3mwJrNKRU9AcVinI8oN/n5S
         sO3kwc+26u5FrTWSnzVPVdbNVCi9MSPZ3h2+/DY77FFjL8tb8UV+oP6zT5I532eOzyYp
         f05tFCkne7kfeJilswYf5n5yg1vwA8BvYNESzKm5HGUBfHxAfKOL4Bx+u78zbOKf05Ar
         swVbG0Vv6U7vmovlaRHCCKemmW88YUvKM8mhyjlNTdcAcU9DVedGqENLiM7CryZ5sJC9
         hbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692329825; x=1692934625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDgcaTMJn76IqBG3wvUQ8hqaBU+41zfZWx/0YdFh8Js=;
        b=BtoCoRqD6Jx6lJEhBv+xVBLG+p8hUsov4f7NfTvzAPCpSdh6+fWrYbSLdA4OtDtQkA
         M4JXmdc2mnawZ4SqZs/+bVZ9F2gvjhskTNJmTM40uphX8M4Th8rqlGybEwQdIw3S2pMD
         89v2eFVomSjHz+k59S70LY88fEitUcpW14rFJRkqz+7a+q1SSlOKW0jpxsW6clOvFVy2
         qBnAUiGeNXmCPozHwZM9OZ8GWTv1Z/MRvUef7R+KCNl4wM9lSPogXxLPI9ahm5MLWjIi
         O0IUTzH7gAD2dl9RhuDSXkV/9QWYiHTTzq0MN5MmkSu1DDNVpqIgSqjPgeXU6NfSVeW1
         O9BA==
X-Gm-Message-State: AOJu0YwtdkXpC3ReSj502SXmcH9rbfYoCVHcBNcnOKNccZ0zs26Jz6+a
	Wz45mXHI+4Iob22tLYLMB3+Z7wlVUpUSTV2CE4Q=
X-Google-Smtp-Source: AGHT+IFa3N0QJqMVNgBzjvZogXkFwo/w52Z3xa2M3kQCbTREqvBV/Uu6/tDrmpVOIgYgwPr/0jK66w==
X-Received: by 2002:a05:6a00:290c:b0:67e:18c6:d2c6 with SMTP id cg12-20020a056a00290c00b0067e18c6d2c6mr1390306pfb.5.1692329825194;
        Thu, 17 Aug 2023 20:37:05 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id c24-20020aa781d8000000b00686a80f431dsm484135pfn.126.2023.08.17.20.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 20:37:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH RESEND v5 05/26] target/arm: Move the reference to arm-core.xml
Date: Fri, 18 Aug 2023 12:36:24 +0900
Message-ID: <20230818033648.8326-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818033648.8326-1-akihiko.odaki@daynix.com>
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HzfkMzSn6VOt

Some subclasses overwrite gdb_core_xml_file member but others don't.
Always initialize the member in the subclasses for consistency.

This especially helps for AArch64; in a following change, the file
specified by gdb_core_xml_file is always looked up even if it's going to
be overwritten later. Looking up arm-core.xml results in an error as
it will not be embedded in the AArch64 build.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 93c28d50e5..d71a162070 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2354,7 +2354,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2376,8 +2375,10 @@ static void arm_cpu_instance_init(Object *obj)
 static void cpu_register_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
+    cc->gdb_core_xml_file = "arm-core.xml";
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
-- 
2.41.0
