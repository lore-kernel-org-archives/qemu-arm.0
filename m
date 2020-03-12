Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088157lfc;
        Thu, 12 Mar 2020 12:43:11 -0700 (PDT)
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr9339953plo.179.1584042191312;
        Thu, 12 Mar 2020 12:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042191; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb51TFGKSG3wsd7GVVRazbTFIqKeKQArtKuyIwp7s5Y3sPRIuRIu1kLNdRPJNdlysY
         RAwb/8EEP1OiSu7dYvlCIKTP+6memaqYDhsYmolI+f09cgefAupTON++YyxR8wnneDoa
         DskYwNsO/nf6XolU0lGdHn1Uvh85Ynwcj+OElpWhs/XFS4OumSMM4p+cPcsqyKtukSwz
         Br6GdHtFcnCdRwlIvHE8ozX3mfIKOMXu0T37rfqtJFhaXhtroVqiB0ZhVwxnPP7RB49J
         UM635xFErKodNH0rgt7juED0HkmSdCXP7b0iRa3elk2U3w+ctI34q76cixjrjNdT4Hyc
         aKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7tXXL1aIZa+UtCbjnv5unnvpKSgUfOHdhgWj90HH058=;
        b=VKtLQ0WyDbzkvcbx1n8/nziUEI8iHMMHFAq6TsJlRKtQBA83sArADwGt982Mk0LO71
         dNvczIWD5CXoIePZshXIK6EqBk8iQUOISJ0QYpP7F9Fi635/5Dy8yIduR4ens+FcA/E/
         y1orloBBEadqbXHQpq08uztj9Vn3k9fA6D6d2WFv6c+yG969tzGVVIcANcEta4nJFKj3
         pZzaLyKIrFrGJX8CuJCZ3cWNcQsCCr2zSygjn4ZFwI8rlWX//rh7MSG/v/khi8wpi3N8
         ov6UasyRYfEwuaIRMNYQqOUjBocSvb1nAL6jTyRaxQTm7LnfOmhriBjgEmMb4G6Do0QX
         7sMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZ3J9BIF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p6sor7747552pls.47.2020.03.12.12.43.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZ3J9BIF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7tXXL1aIZa+UtCbjnv5unnvpKSgUfOHdhgWj90HH058=;
        b=HZ3J9BIFMbH7FTKw2xECHChtcI/vfAPmLedYZgT7AaIastMiLWoLzpNsDA8DAdtjag
         yFAuH2ei1xRkSMGW2HDGnjXKLkquL9K4St1Ow5O0l9U8Z7Rf10ACMv6Zswy7W7Indbgf
         2yqm8EwQIWxAfFa+lIVEHcjJQDp04LTPkxgMxNQjCOqsMtz5Y/kydTGJ0UKiFqruaeNe
         D1swpVBdQyyVVGplkmmTnjb78/sWKdXltVBJvDDYEAfy+S3HQo5SLOJ9TWyDgDhPHiad
         1qHCmfug6qyasfyFxAsW6n1I6PLxPL5gcdKQHFUpvmnhMgJlrOwqJBH+uNrRTAyunbwD
         Wy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tXXL1aIZa+UtCbjnv5unnvpKSgUfOHdhgWj90HH058=;
        b=Cg10eYsDuZFJSY8DV/4eJE9BT06C3MXS+1HOov874JVX7YwycCm3MebrPUSCkKNw6L
         +og10fDwtq9egMXj8qIaHdgJV+xMCQ/CDHVErbVlaGD8cLvELA4/TOQa1BXX9O5pyXg3
         cdOts7CXrv7nVxDuo/C8zOfHopz/KX25ecfr+Le750l4DcyspTLbiBGndZ0dCnR/qpao
         9xsR8k1C5aCftSLyjb2QREU3HxHcLFDKqek+WD3OA9uJkYdAsFhYUKYqaol/lAyFf7oI
         yyt37XQlLkBxjdmlti/2Pxsf7Bs22DaRqzMEqPC3XarnURrTpy9sURI0WCJqfnC45RSG
         rC1Q==
X-Gm-Message-State: ANhLgQ3IgujA2YR+P8XMzxCfZdGZefrgJa2AupwqlHhd8vfx1W3L5GSO
	D87pqM8Z+zrWt2pqcr44gpJmL6mX
X-Google-Smtp-Source: ADFU+vuSgUUQzkGrrD8l/QTXUUUK3o1dEQ2IFGMXMGIop4GeZcgOdNNmzRqQPG1UGD9EYabTqjCQMA==
X-Received: by 2002:a17:902:694c:: with SMTP id k12mr9427834plt.329.1584042190805;
        Thu, 12 Mar 2020 12:43:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 37/42] target/arm: Implement data cache set allocation tags
Date: Thu, 12 Mar 2020 12:42:14 -0700
Message-Id: <20200312194219.24406-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: npXd9Ft23BxW

This is DC GVA and DC GZVA, and the tag check for DC ZVA.

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
index 67164d56a1..b78bf2be4a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2337,7 +2337,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
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
index e4b4366af7..44e7c0d19b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6983,6 +6983,22 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
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
index 1314b200e0..f33f174584 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1919,6 +1919,45 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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
2.20.1
