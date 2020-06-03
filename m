Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp43927lfc;
        Tue, 2 Jun 2020 18:33:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6HoS3T3ZD9eLHGwUAtjzItNX//JP67x8BsMmQZE8CkmGTGykPmDjGHrcjtKIQ8ueIWj5s
X-Received: by 2002:a25:dfcc:: with SMTP id w195mr29902494ybg.372.1591148025137;
        Tue, 02 Jun 2020 18:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591148025; cv=none;
        d=google.com; s=arc-20160816;
        b=y/NBR3+bSUXsKJVOqcpgnxDDKiUWNCcYp2hGlYxm0rQzSIIouQqEStvp1EnhUeOP9i
         8+sZ9ub6Iv7/aYIDYlqV1pC2FUausHKlqcmbiJaeWeoOun7MiuUYmwkZd8IkUQP5lN4M
         Sq4N8g3aA69QsPbqOGe7HprEFfL27aAlCW5BtfrtTwXBO+DBUB8QpXLMwNaMXep7jdhW
         kNhtVfhLgHPv6XdPEdRq6AlZCQoH4FZ8pilie6tp0iSK7sDcby3nz6BkmYebKYCBHcn9
         0ikp2ZDQ7iLKq1/50HKHWzom96+qa8UnYf1F54iLFhJIkj82BUl3wahHyBHpzEU1pk1E
         ObZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CSv1KeR8menjHwPFPDbJzuFwzIdMp1D6EtoFs3JeUrg=;
        b=WrM9R05zvJpeOS3/TkFNdigca71R+8Wmk+6AOCZXSWBotNv9N3CEsM8vPCTBwrWq+a
         1Wnb1jvE/Ut6bW+Wj3cKp1zEe7S+l7ufvrC2CxRZT8SlH1grzeHElzv5nKIrWOl/OeBy
         rfveoWdJPW4NTZt8Ed4LxXon9Ra6vEaCxAqn9aY0HiJrSe6wB+FWbiYGDTLFEz0j4wqA
         i3RZm4bDo6X1D/qk9gswNIJ3lkaLGXytqTKJuOj5gUNF5kgKU2H8DqEZGFimQ8rQHfuJ
         nmiabFSVyF+NP+/kVT3GBRDwATm0Zo/CdkFysmK0eMeI37GzkS9Ni8UMhdWeAb2Y0NHP
         D+kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cTI/2G4x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i83si390433ybg.25.2020.06.02.18.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:33:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cTI/2G4x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIHo-0000y7-HR
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyt-0005BZ-Ns
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:14:11 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyr-0003h8-FS
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:14:11 -0400
Received: by mail-pg1-x542.google.com with SMTP id t7so572993pgt.3
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CSv1KeR8menjHwPFPDbJzuFwzIdMp1D6EtoFs3JeUrg=;
 b=cTI/2G4xtLZWFI74ebrmfOp+95jUiunM6RjKXxwCHPVrtNVaCIBNTMhtpACOMNWsUA
 En42YXxQrHeCj2YRftrnCowP8VAY47gnwc8IEnEPZ15BVQBWbiZvjpUAP4nX8tbfHc2N
 gMLxjGY801ATYOsNPHzIT8pmXGrNSFoM94nAM1HE+r5OqTWUMCWV6LXUY4wikWtMPiat
 NRi+8AU1f8lGeZJMppvNWGQRgi5e6UNo820ki8gu7yhSMStaYwxeBqxH8NJ/VxdCdsYr
 w3WjeGNsV31OzeQ9QDKunb5Y7dvqZVQUUAbn+uV4885fngZcIoY+NuRPZ0PwG8pwzHvT
 J2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CSv1KeR8menjHwPFPDbJzuFwzIdMp1D6EtoFs3JeUrg=;
 b=AYfATEeFsI1yFKzrGw1JTvu+WfAbPpIqdm6Y6vVdK4Oy8mG7np43aGwj20iqQrV8Ue
 jxCGBgzHOSbDSaMChWd9M/eL1cM763bz3qqN9W6wrL+McmkXK7ngy/y2xrz0ppFZMHtQ
 xbDpdNdCEURRbyJRqLwg48USTXWbBqr2xRCMWP/6BYr8U/oZNYZb+DhLg2k5VeGQ+8xb
 ckTnEFWfzvIghmuVznchBoLVu+G+QpfObwqFOu3q618a0gpnF5QFgzURkYG6rTq/3eBl
 xMKBLScjc7+o6s5stnExsPLKbpG10G2nUyH4wfoCyI+DjdIS+MBHbkS2PRxuZ0i5vaAT
 3STw==
X-Gm-Message-State: AOAM533C/S2GiaaA6UPpAN/D0kMYp8aBM8fVVtYfWpOCd4N7GT85wvXB
 Y/R6f0d53857SuIqTz3ExJObUAMAc4Q=
X-Received: by 2002:aa7:868f:: with SMTP id d15mr6072371pfo.166.1591146847684; 
 Tue, 02 Jun 2020 18:14:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:14:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 37/42] target/arm: Implement data cache set allocation tags
Date: Tue,  2 Jun 2020 18:13:12 -0700
Message-Id: <20200603011317.473934-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyCetmfatk0w

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
index a5d3b6c9ee..17594226eb 100644
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
index c56e8e500b..3adafc07f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6996,6 +6996,22 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
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
index 394633babd..009cea6ed1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1865,6 +1865,45 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
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

