Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3989037ejc;
        Tue, 29 Aug 2023 16:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHErUHauea3MwUdmrwgxzOXsGC57/AlI+r/sS1ERPgYwXHxmWRO+hiTVCg/aP0ZS8vp8Iy0
X-Received: by 2002:a0c:b452:0:b0:64c:8b79:5b24 with SMTP id e18-20020a0cb452000000b0064c8b795b24mr425489qvf.35.1693351437299;
        Tue, 29 Aug 2023 16:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693351437; cv=none;
        d=google.com; s=arc-20160816;
        b=sijyiFgWgS3k3IX7b+E6hvRsSX9GEbTRplO1yCQEAecY9gm23RjXyo4OSaps9vta+H
         tnQi0JkaXFP4e+86ifMI7yVTtWNKQl5v3MN9BKzVRI+uDGQnyRR/cArTZa5jnu0T+Tdn
         yQ1sAZdbKySxQRO6fm/MWurJ+BPQO9A+FF2uq2jDfvn1yv0tSeUaUdPnHF3mkAFPxReJ
         soneRN/3BF63yt1NF+FD8wwFf3a42Aed36yRi91VZvlsTAoI9/knNNSO8dQ988sCkbXu
         1EPKrXd8qYorntxGYxIMhEuCC07VIGVZAW2B0ohKYmnEkf9P9Byvhbj4YjkGlnVjvkpD
         FQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KJs9VdlYYhcs1M3WHRYBXtRa+lFbPejqKMvTmE5WpOE=;
        fh=qP6S92UGCiq93e5OjzY/AAEohT0ahWfu7bb+kTROhJM=;
        b=YBadfFS2nG+izye0WfPE0wiqF9pwD9b9zL49+lD+Md6vD7GlE5ukbeYbo4caAlmOdS
         CAi9ih2wfe+OK5gOmdHHGbP1zZSA4kHAww9JNmab9iC62H3IW9uES7QdMOF1jTghFb9y
         Rf4OtU3916tZf7rAs82b0MI8WEK3VTdWbX6os0uOyhT7J+24kCHimXH/V0I5Of+kLd95
         PUT/+tq34MKQj+JauAxeF2KsEPrwRuz5PMC/AmsTqaIUISKhr+ecVfOQQ29QzX4KktQP
         5edlDxQcTuZqXg5pkJ02RQO/Mzx+03tfpxD3CIs2iMIb9p8/IgiawreQtoLAb4pk2Y/w
         uNXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQfY7WDB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a0cda12000000b00649b7a60690si4421578qvj.384.2023.08.29.16.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 16:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQfY7WDB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qb83m-0003LL-U0; Tue, 29 Aug 2023 19:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83l-0003A1-0u
 for qemu-devel@nongnu.org; Tue, 29 Aug 2023 19:23:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83g-0001M4-RP
 for qemu-devel@nongnu.org; Tue, 29 Aug 2023 19:23:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68a56401b9aso3641426b3a.1
 for <qemu-devel@nongnu.org>; Tue, 29 Aug 2023 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693351419; x=1693956219; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJs9VdlYYhcs1M3WHRYBXtRa+lFbPejqKMvTmE5WpOE=;
 b=TQfY7WDBlbIvrNCsrBydTFY9cUvHxviWv8/O0IA/CJ2EJTh35GRfAJStIV0CLxkUKR
 lRFMaqu3V3dnnmpZBVDVYW1uwVJ/icTiW5YX8PJeSN0qioTnLE0MX/A43BzGR+7ABLXM
 tmxqb7iL7QXEDNjKhZ1/HeF6oGVil3iHitOyNbpBUs/aziWMFhKMg/SNOgVhPyo/U5fQ
 kIFaUoqQNndUy1ooYSSraAbM4UDnWKXQCDGXAcJuE89LKvvXFkIbNri5g2pVIMx3bJ4A
 JI3vdjYuBwxiWtQwg5iAuqjaFf6+tHFgZhfSV4fIdVSRQQQ5y7YWujtuEhr3rrfNeaJC
 zR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693351419; x=1693956219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJs9VdlYYhcs1M3WHRYBXtRa+lFbPejqKMvTmE5WpOE=;
 b=JSJBlolmB7E5snoNMoEUJz6MG5AoNntvd4Lvl0MZNUA3RsU5bWEoVvBLlgzc8JKeAY
 CstC5uXDDXWNr2WBfp4DOtKVuG7TJr8gO08vWVdbLtwc662YOQjo2G8zIa7kqFAF8h/i
 TA9R6ow7Z0viZCFA9G76ZK/nuzcUQjgGVr80ojHAHgWnIXZAFQYkTAqD+89d0g7OKLbI
 08o1kYN80CYyQBPQadxQOdBGGwOPoDS431nhjTc1ufugp+JzvVD/VGDE9Khaw4SSVTUK
 xeRO7BZ4c5KdVnsCAe8D1WaTdiJx1CCoaknEcqSsItgEXgaCyryO2DREqwfTOI//ZaDg
 C/Dw==
X-Gm-Message-State: AOJu0Yzbve5vviIrFM5z834EE8UdWPDzPcHCjpXuY9lBfI3H95+FxQXY
 CM0xCEEhYQYH9RIXsr9DQ/ZbvCXnDF07ez6UHXo=
X-Received: by 2002:a05:6a20:d422:b0:13d:2f80:cf1c with SMTP id
 il34-20020a056a20d42200b0013d2f80cf1cmr747623pzb.17.1693351419039; 
 Tue, 29 Aug 2023 16:23:39 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001b9dadf8bd2sm9829970plg.190.2023.08.29.16.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 16:23:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 02/12] target/arm: Add ID_AA64ISAR2_EL1
Date: Tue, 29 Aug 2023 16:23:25 -0700
Message-Id: <20230829232335.965414-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829232335.965414-1-richard.henderson@linaro.org>
References: <20230829232335.965414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NPttUYORF/z7

From: Aaron Lindsay <aaron@os.amperecomputing.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
[PMM: drop the HVF part of the patch and just comment that
 we need to do something when the register appears in that API]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 target/arm/helper.c  | 4 ++--
 target/arm/hvf/hvf.c | 1 +
 target/arm/kvm64.c   | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cdf8600b96..4a5a5e9eb8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1033,6 +1033,7 @@ struct ArchCPU {
         uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
+        uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 85291d5b8e..b5be68be58 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8439,11 +8439,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64isar1 },
-            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64isar2 },
             { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 486f90be1d..546c0e817f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -847,6 +847,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
         { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
         { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
         { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
         { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4d904a1d11..ac440c33f9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -304,6 +304,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 6, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
                               ARM64_SYS_REG(3, 0, 0, 6, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
+                              ARM64_SYS_REG(3, 0, 0, 6, 2));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 7, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
-- 
2.34.1

