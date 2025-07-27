Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C1C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:10:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRF-0000NW-9A; Sun, 27 Jul 2025 04:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPa-0002jD-Ij
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:15 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPY-0004oi-Mg
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:14 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b34a71d9208so2487904a12.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603631; x=1754208431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1IXOiXj1C1ZetYUAJn76SJu5i4qqFoVN2qqJt7z2Klg=;
 b=BqfKWI1pKEMvpsARuvEY8QWhVROAAl9orvFfRn40cOh935v+0wEf8rZ93veo7A1yrQ
 vPCVm9qY+XFI/vH4wLA5uFbKkO6uiS3bygpX6iD5OE3aVrS92INbm9ruLAFjdxQ0yzMa
 G1Sa5rWiqAt/oBK4hvnCFnsrwoHtKGdseAjhgpJJJpVzCbvQqwUDTfwl8Yo2/7cta5xg
 EqA6Cqx5lu0Rltjm/NZ0KaX5qn2Jb4uw33lHg0XFa2oLq3mprr4PcYcTmH8tu6smVmvZ
 rhkr1SdwJdi6TJKE1/o3x8weSCxfe+EPhCq2RptdtGrenC6sqH4IOGFy4KcwDloRMNLQ
 l++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603631; x=1754208431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1IXOiXj1C1ZetYUAJn76SJu5i4qqFoVN2qqJt7z2Klg=;
 b=RarAPULQ56cV3k12Nui/k49N6+/d1MUCYWwYTrIIpJsEuZyT69rjy4q4tikmuk3kR/
 NQHuI341Ap1f8R+Oy3Gb0/eoPqGcE3WxK8itcSdvCQsflThHtSfegUiMTyqKTXCDruZo
 XDzVP7j5Qg2tv583ezr3aJaaB01IUdYmN49j+NQpr74sQjBbYOYcKUpBkQ2fgBFKjID1
 BsbcdkQuHAnmhKN1zbl8D5GVR33F5DdmmOIGJqFsaEULlBKdRWM9BAPbYt4P5HnfYeSY
 qkIwfv2Cwd75y5RqlL6Raj1vp0ET0xN7HjewjfX3wA8wbHl1cNfbDNAMu1SlEvmHtpWK
 izOA==
X-Gm-Message-State: AOJu0YxXmcDNcbmQVzc5fgpxn4zRKuCPgFiPH7FEboE0SzhUutAm/1oE
 pIV8lshGCAob9MYyG8lZPTaLySl4tU28EKdi9CNZdJdw0C7NGkCPjsJsNqRU6Bx4GbE=
X-Gm-Gg: ASbGncunZXXQpug+dJ4FKINWo8NeyRzIolvRpcxbIblZ0Q8+4AJ2oW9UpMczNlEoiB4
 cV/T1gtH1ajqmcRC1Yc5tQzQSb4zceCzCaw68OuFaY77067GxSKC14giW4QlSQTF+pvqafkLNUS
 x8KgwjJllDq+GceONpuR6Fvd3x2cVurQIk48KmmVnAi4FEslieldM1ioI+VRke6bAHlA3Q0wsrt
 FQX5Th2SIK9HbmSTHKscYA7aU//jS7fu5Vvqmq4rpKv5kszzpg6ZXevPgxjuDNgDlgTkSnvztJN
 V0aHLgie82FWmzWqRbIpJSVRwsfDyydPOcc2cXRjqyTTe+9nMv/vGriaYDgitdIQT/vOeV05el8
 I6BEbtjOwoVJrVA5pzint4gQaaYrew9oIBdLtNy9p2x5sXzEyBs/qV6RV4H2dBHWMeV2HAS9byu
 HTbqJuvWWEdw==
X-Google-Smtp-Source: AGHT+IHjBkuqtuiOLcMSppkeQ2Zf4hV3hjaQ82NkUs+E4Dc3jfIUVk7HlFBsz/i+AYABL1BqbJndOw==
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id
 d9443c01a7336-23fb319041emr108186605ad.42.1753603631121; 
 Sun, 27 Jul 2025 01:07:11 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 61/82] target/arm: Implement GCSSS1
Date: Sat, 26 Jul 2025 22:02:33 -1000
Message-ID: <20250727080254.83840-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 392a0a264f..ee8b870e17 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -52,6 +52,7 @@ enum {
     ARM_CP_GCSPUSHX              = 0x000a,
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
+    ARM_CP_GCSSS1                = 0x000d,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index ab53a4314f..bdafc60786 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -114,6 +114,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
       .access = PL0_R, .type = ARM_CP_GCSPOPM },
+    { .name = "GCSSS1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 2,
+      .access = PL0_W, .type = ARM_CP_GCSSS1 },
     { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index af91b7f95f..e4c7801740 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2634,6 +2634,33 @@ static void gen_gcspopx(DisasContext *s)
     tcg_gen_st_i64(addr, tcg_env, sp_off);
 }
 
+static void gen_gcsss1(DisasContext *s, int rt)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 inptr = cpu_reg(s, rt);
+    TCGv_i64 cmp = tcg_temp_new_i64();
+    TCGv_i64 new = tcg_temp_new_i64();
+    TCGv_i64 old = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS1, rt));
+
+    /* Compute the valid cap entry that the new stack must have. */
+    tcg_gen_ld_i64(new, tcg_env, sp_off);
+    tcg_gen_deposit_i64(cmp, inptr, tcg_constant_i64(1), 0, 12);
+    /* Compute the in-progress cap entry for the old stack. */
+    tcg_gen_deposit_i64(new, new, tcg_constant_i64(5), 0, 3);
+
+    /* Swap the valid cap the with the in-progress cap. */
+    tcg_gen_atomic_cmpxchg_i64(old, inptr, cmp, new, mmuidx, mop);
+    tcg_gen_brcond_i64(TCG_COND_NE, old, cmp, fail_label);
+
+    /* The new stack had a valid cap: change gcspr. */
+    tcg_gen_andi_i64(new, inptr, ~7);
+    tcg_gen_st_i64(new, tcg_env, sp_off);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2945,6 +2972,11 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspopx(s);
         }
         return;
+    case ARM_CP_GCSSS1:
+        if (s->gcs_en) {
+            gen_gcsss1(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


