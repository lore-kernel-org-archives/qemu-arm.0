Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp57735lfm;
        Thu, 25 Jun 2020 20:52:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWQzOChDdn/1+Mx4AfeUE0iQ9O/I00JNhFRsy+46fZKhExESW82QKr0E91SO4sX/qRgx7S
X-Received: by 2002:a25:da92:: with SMTP id n140mr1808382ybf.313.1593143553801;
        Thu, 25 Jun 2020 20:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143553; cv=none;
        d=google.com; s=arc-20160816;
        b=j4zbe7Zq5ubi9jNlEgmAarx0ZrPpnOXbSFBvo/C4bsFYT0LSzbFG2CMNvdGJh88qtd
         Co9kNIYerwB6EMDbqRemtzUOeqUa/pRYyEPacHWtF0ivllp65atBBlhJ2vFceA5G7CVr
         /dIJC+986L3EU5imolPPuY6l6h/+YlG26syJRmlBu/3TN8csj2bsY5HWPEB7ECFEt/jz
         /Ap7Mzzqx2LZ93Sv0SYbeTFdudciExTT3WN87S8KKZLznbtLJ6SRUM1ueJUuU1mX5G0p
         fhaLI/0Sgttcs3eVV1LIwVtnXKKkmN9ldI1powfFK1kWKM7eWTm6qKrZiXk831KuU66W
         VpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zleS2QR+lFAdTaTiZt51fC/IOMo1sfVsNhWWJdJDQys=;
        b=RqobuSK/WG9UWpetrUxN127Q/buRstExYNOiIMbsbPsKpTX+hOmBorwPk45gj/UfhK
         z/QyqOOVNv4pn4hSqPkJNlhOb3kFSC0E4R2KZ9iNtQGS00il5HoShV1Yq91+jQa++sW4
         ay71LAR4LMGJClKERG8sWWDBKkusPpkh4tZnbrvVwsVGGg3JdPjaAmasCU1bCAvDkYdj
         Ow3oYaxbMpSuYdCXLPfkicRPrJ158iLjUHFnJyq2DU0zLDbTHe4VEHiuMvkbcjzKFTNV
         8JMPuQKkOxbzhTuDZyXiksv/Paq8BxydLogvgBXur0HieAJjmj2ScuZhndpwhO48HU95
         oktA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gYFxa8Nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g64si1173874ybi.438.2020.06.25.20.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gYFxa8Nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofPk-0001o7-Up
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6Y-0001FL-7e
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:42 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6W-00026N-1M
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:41 -0400
Received: by mail-pj1-x1043.google.com with SMTP id b92so4360540pjc.4
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zleS2QR+lFAdTaTiZt51fC/IOMo1sfVsNhWWJdJDQys=;
 b=gYFxa8NuB2mYtUFTWDBAVaIz6bOCh6uFZoM2ePNF4ua8IT/81vvxe44MKjuBWqBDR4
 qHTLhNM2Et6I3FICmaBJEDclG6zr9gL0gZFHaqsI8gp3P9il8iuXLLQ4eGr6/96KvhTD
 tKy+tsKsjklxKBESDlhVUDVtgn+GhYIgkUId3fxqAPLoPV//+ux5KPxCLuEGkmflUxzs
 LavZyXA6vDDEJCVGNTkzX/o1IDqKtuAnOgVUPOLF9b8W7ZM3IZVjkmsaxIOTFVRmpT+E
 nXvcX5kHJ5RmLLxPqUC/TnE7aDK4V5tFmoFCMej2mUJabtqVQtVqTCO2WCrfYprnU2x6
 s+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zleS2QR+lFAdTaTiZt51fC/IOMo1sfVsNhWWJdJDQys=;
 b=dP2sL0MX2fD/Goddh64QvWOTy4ValsTAli+zplw8TJLWbH1cAbEXrjY9B42z6Tvo5l
 CzPqUqM6wTEOCGAKLGdMU9uIFBn/wnTAKIRrWCY0LCRWhg7TOfbZIMPg6+kXYhP7l+92
 UsLXIx1ltOz9pTCbKLlleZmkbIIn/8uKZA/JM/+LsHT7clQfsDu5gz0MRSiSw78bgR7s
 IWn3vvig42q0hY50GaHqAtHuasOldghTIQdqqZ1EAFlvNhiPvDOJKwUdOXCrICd4utwA
 oYv5rmqRXUzPKt1A/NxuICmzOZ9E6BLb+e2Kg7St9vPZP1vt5WQuAoHBg7qyl0q6CV3S
 tFjA==
X-Gm-Message-State: AOAM531f/CduGcBmDYZ2rtl9tadWav30RLhdG0Ujo7yKcvEInshO38p1
 ZUJZWA+T22d4vqnpOtDRy97xyg==
X-Received: by 2002:a17:90a:fe0c:: with SMTP id
 ck12mr1206712pjb.209.1593142358824; 
 Thu, 25 Jun 2020 20:32:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 39/46] target/arm: Implement data cache set allocation tags
Date: Thu, 25 Jun 2020 20:31:37 -0700
Message-Id: <20200626033144.790098-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QYuldlpchyKX

This is DC GVA and DC GZVA, and the tag check for DC ZVA.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use allocation_tag_mem + memset.
v3: Require pre-cleaned addresses.
v6: Move DCZ block size assert to cpu realize.
    Perform a tag check for DC ZVA.
---
 target/arm/cpu.h           |  4 +++-
 target/arm/helper.c        | 16 ++++++++++++++++
 target/arm/translate-a64.c | 39 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3bf0518ca4..513c38970c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2360,7 +2360,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
 #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
+#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
+#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
+#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
 #define ARM_CP_NO_GDB            0x4000
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 44a3f9fb48..23cf44fcf4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6998,6 +6998,22 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
       .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_GVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
+      .access = PL0_W, .type = ARM_CP_DC_GVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
+    { .name = "DC_GZVA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 4,
+      .access = PL0_W, .type = ARM_CP_DC_GZVA,
+#ifndef CONFIG_USER_ONLY
+      /* Avoid overhead of an access check that always passes in user-mode */
+      .accessfn = aa64_zva_access,
+#endif
+    },
     REGINFO_SENTINEL
 };
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c20af6ee9d..73d753f11f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1874,6 +1874,45 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         }
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
+    case ARM_CP_DC_GVA:
+        {
+            TCGv_i64 clean_addr, tag;
+
+            /*
+             * DC_GVA, like DC_ZVA, requires that we supply the original
+             * pointer for an invalid page.  Probe that address first.
+             */
+            tcg_rt = cpu_reg(s, rt);
+            clean_addr = clean_data_tbi(s, tcg_rt);
+            gen_probe_access(s, clean_addr, MMU_DATA_STORE, MO_8);
+
+            if (s->ata) {
+                /* Extract the tag from the register to match STZGM.  */
+                tag = tcg_temp_new_i64();
+                tcg_gen_shri_i64(tag, tcg_rt, 56);
+                gen_helper_stzgm_tags(cpu_env, clean_addr, tag);
+                tcg_temp_free_i64(tag);
+            }
+        }
+        return;
+    case ARM_CP_DC_GZVA:
+        {
+            TCGv_i64 clean_addr, tag;
+
+            /* For DC_GZVA, we can rely on DC_ZVA for the proper fault. */
+            tcg_rt = cpu_reg(s, rt);
+            clean_addr = clean_data_tbi(s, tcg_rt);
+            gen_helper_dc_zva(cpu_env, clean_addr);
+
+            if (s->ata) {
+                /* Extract the tag from the register to match STZGM.  */
+                tag = tcg_temp_new_i64();
+                tcg_gen_shri_i64(tag, tcg_rt, 56);
+                gen_helper_stzgm_tags(cpu_env, clean_addr, tag);
+                tcg_temp_free_i64(tag);
+            }
+        }
+        return;
     default:
         break;
     }
-- 
2.25.1

