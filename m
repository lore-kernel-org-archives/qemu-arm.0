Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73649CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxu-0005mS-GP; Sat, 30 Aug 2025 11:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER4-0007Mx-Go
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER2-0004xh-0D
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:33 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b4df220483fso505788a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532850; x=1757137650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTRSZKjd08qJnO8hiUHZqz18pN5N0JYxSN7ixmWuuxk=;
 b=I5Y9CUvckqy/Stjd0OEIO/RIlCzDNyeysyH8sBpRzdgio2Tn7ACNH5/rQF2zqXS0wC
 Ht1ZwAlNbSfjzEgQr8dojjF95xHpTFFhH0of0orahrT/Ybldc67PFbR7GXiQdDNmFSjO
 NNSioScIVgm17BrywJpaZX34bZRRCaFWONDqohAmRLLdB1ti2enKUiEV2xP7o/ya3MY+
 fvhgmd+k36RJCy6W4uYT3GHQpZGStiHNCk2gvNiIg1hDGXuwzbEu6UnsuVXZDIwGKoIk
 XkQEg1r4jF5eBCFJuQ0s7JY0NJuFyKDI6DnC8DfrEGwEkiBGYy8VPe74Ov8f2Rrdb/Oa
 0fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532850; x=1757137650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTRSZKjd08qJnO8hiUHZqz18pN5N0JYxSN7ixmWuuxk=;
 b=IcFgYfS6KHx4e38z+UptefGEasK7GNRvmIpvU5PSQWAvth0GhEa064pnWWTcYDAZ+j
 gXxzLRvZnZ6vcOamaSq1xciIFsFdetPw9ieD18ct7OIJSMHOagKqElboSfb7QpY7H1LM
 e+PuseF6OZCWxGqMG5WQC5upi1jvnsi1fODTUjyUVQ3W6hC9K0qn/tjBEzy6CKMuXlnf
 mr+mvFve0asAupH3AMoAEo8sK1xlCt8H9WJZv/2hvmSmaG+g2fXBaZH3TLrT24bwCjr6
 REDUIBffaB0q6LeNQNbHWx3SJGcYVjpyqiS89WJK87oQS+v83sJuUoWAo9rfi7co+Tu5
 Zstg==
X-Gm-Message-State: AOJu0YwbRvpmyEIy27FQaAI0MDcU8+FXIXLuxxght1lxVHfnb7bd7lEK
 4sDYEbtt2DFXpucrTnCW3931D06nG5GKXYciIAIFM3sDJcGVzNV5KcdkAyvIRN6FYHg=
X-Gm-Gg: ASbGncvdzZrRIAQAVctbJ1J2vwcXw8LBVMCok7taqFcxKX/Ncln0cAaBRoefC6NxIe3
 xeu6LFYUl1wQxu/nPI+SNDeX7WSsAqlvaj0sQvcY91/5hmNfN+ocS5BCZB4mu8RZJoI76LkgLUL
 TuI95TVG5YAaZoiNzM6ver0zamZlMbFkq+IocFQ/H/lSGreOQTGflqZd4rCfmWnwm0mE79qPgpn
 f9GsWB86+Az3Hh90a03eLEujDuexPBxtV5tqP7XMDbpZxOM11fRBYys+HPo/DKW1G4+ZL7UQnwP
 4AICYSH7zfEt23vUJ2x4ouDU+IyCtr9rz1ObaOXP+SG5bGdAKBsqb34QUydW1c4+dZIcKtDGJny
 lKdBVdMhUID9/uvtphqg0UuUT/g6mEfxG7J7E5CZdlPH3LShdvVWIpwNqGsabYxQ=
X-Google-Smtp-Source: AGHT+IFM8bU2f8sac4hJOsb8+1+l+chFmJCysVPKXmRNZAkNnZxmmqzqRud2f5YXHl1rzTbF+WSNDg==
X-Received: by 2002:a17:902:e5cf:b0:246:ace5:e1db with SMTP id
 d9443c01a7336-24944aa23a3mr13952825ad.28.1756532850546; 
 Fri, 29 Aug 2025 22:47:30 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 62/84] target/arm: Implement GCSPOPX
Date: Sat, 30 Aug 2025 15:41:06 +1000
Message-ID: <20250830054128.448363-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 3d76afd20b..084ea00e51 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -50,6 +50,7 @@ enum {
     ARM_CP_GCSPUSHM              = 0x0008,
     ARM_CP_GCSPOPM               = 0x0009,
     ARM_CP_GCSPUSHX              = 0x000a,
+    ARM_CP_GCSPOPX               = 0x000b,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index c688d0c391..2d39b17188 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -116,6 +116,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
       .type = ARM_CP_GCSPUSHX },
+    { .name = "GCSPOPX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 6,
+      .access = PL1_W, .type = ARM_CP_GCSPOPX },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e5d9a6e837..b0a1a62a91 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2560,6 +2560,33 @@ static void gen_gcspushx(DisasContext *s)
     clear_pstate_bits(PSTATE_EXLOCK);
 }
 
+static void gen_gcspopx(DisasContext *s)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPX, 31));
+
+    /* The value at top-of-stack must be an exception token. */
+    tcg_gen_qemu_ld_i64(tmp, gcspr, mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 0b1001, fail_label);
+
+    /*
+     * The other three values in the exception return record
+     * are ignored, but are loaded anyway to raise faults.
+     */
+    tcg_gen_addi_i64(addr, gcspr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(gcspr, addr, 8);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2855,6 +2882,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspushx(s);
         }
         return;
+    case ARM_CP_GCSPOPX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspopx(s);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


