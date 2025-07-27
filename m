Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1C0C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:18:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRQ-0002B9-5V; Sun, 27 Jul 2025 04:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPW-0002RG-9p
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPU-0004mx-7L
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2401b855635so339605ad.2
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603626; x=1754208426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVylRwCjX6yYGQroRwywsqeSdVr352gntV1nVCoF2rc=;
 b=ZWvZnFUGzRbB/uxmhFekJEKU0QUNp/VwkbpFop4Fza86bZMm1oCoZ/nG+1Lpi9Yqia
 6aXDED4Dy3BTyy/Q/lL1dLCF34gG12qRtxzduhCZ/GCT20wMUqKRgYMv+jVROZEqcgor
 /r86MFnR8JtwHb9cWcwvJUXrBDEp3J/UOwnTcObKnruHdo5VlTxFmiQsZ6cNjXBP5bcr
 k4wCFCANwSsfx0i95M55Yjak7WtoXDt/HZexNPOA+za6bCxOVfdl5OlmzPAov7wDjD3e
 MCkPqtrLs5rDUwDBIssGvBBeMEvo2hlXqlf8n0GXBzRKj6Et2E2YOC1jQ5xLFnYYl3Zp
 rHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603626; x=1754208426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MVylRwCjX6yYGQroRwywsqeSdVr352gntV1nVCoF2rc=;
 b=hGajXjOaEEImCx0RXnPQ0ltWlFBOf0SMO5byCoyAgU8YR8OWzVdfN+Bq4quH4L+DB+
 xpefR/4XMLNPTcG4LQlNCk6rfjRneAbvWgq1VdKkeJ+DX+9+qxtfoVikV8QWJsjcwgIL
 1NvUgrleQD/enuKsbyeV3KqobRIqDYZmizPnVv0z/uzQP5AnKjaFeEffsWY9r9JT6mQn
 yj/zWvouGeMG1NHr+q6gDSMHTVw22u2J3aOApxm8qdfZPkmT2vCTUa/QENBNukdqqOqk
 mtGqB6lmbFT8lpWyF/3lHGWiTAqU0pX4GLv1cl/R2up8ADqq17sfAclO58PdTeLgfFx/
 zLEQ==
X-Gm-Message-State: AOJu0YzRiYeOXK9cMc2oU7MD2DX+SJda7qYkBQ19JgCCEjqMXXdpLAxS
 upFiVAJQJv19nuUYVRJ5dpELHajaFn/30lvicAFp+ZDVvfGtwtzOhAYrWENcCyz/CEg=
X-Gm-Gg: ASbGncvjc1JVyLIcrpYqkgbBkYneqp3MCRdspZ77cPxcDhK9Wf7spkxETHjoEsD/0eA
 Xk99OR14Ex1/xp/4wWsfkq1M/5lRTNaEamhkMO1X2ttKV6j5RzOddcRychyJXcTs4gaiHq9WIRp
 thWgO70pIH8gJncf8Xxot8AzKbqTwXKDmxIARMaqRFf8WhnY+d6AS3u/bRTecEK3yuR5pWe1HzK
 kOT8l+Od5apq/pEgUPujnqWmKRHpG3YEogz4S2oec1MNaTFCQDmxWYQxvz9ySYaVkuvny+KYVxa
 W40F92ndHNN2dpg8JXyqh6WqBtW533/722A+G+DJPnCrA2MAj+kEeEA+xY/brdu0vfRhRw7JEE0
 6wIm0qPEskae67uCynHad0rne9edqQRxbopiNDY8In6nnI9r71LxptqV9ddqE1o9iVCPVcEF007
 kHuGP8AZiwKLnXdEvGk/mQ
X-Google-Smtp-Source: AGHT+IFfMqbiYXQ8ocaJp0HDlsiUS8Udv/KquBlBVdj5jLlSf7y9wSFmP89e7hHrFNGsn+kT1XZipQ==
X-Received: by 2002:a17:902:e948:b0:23f:b09f:52c7 with SMTP id
 d9443c01a7336-23fb3043a03mr130054195ad.23.1753603626590; 
 Sun, 27 Jul 2025 01:07:06 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 57/82] target/arm: Implement GCSPOPM
Date: Sat, 26 Jul 2025 22:02:29 -1000
Message-ID: <20250727080254.83840-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/arm/tcg/translate-a64.c | 27 +++++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 93358e6123..9b19520346 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -48,6 +48,7 @@ enum {
     ARM_CP_DC_GZVA               = 0x0007,
     /* Special: gcs instructions */
     ARM_CP_GCSPUSHM              = 0x0008,
+    ARM_CP_GCSPOPM               = 0x0009,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 38987372c9..74a1697840 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -85,6 +85,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 0,
       .access = PL0_W, .accessfn = access_gcspushm,
       .fgt = FGT_NGCSPUSHM_EL1, .type = ARM_CP_GCSPUSHM },
+    { .name = "GCSPOPM", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 1,
+      .access = PL0_R, .type = ARM_CP_GCSPOPM },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a5810be2f7..0279111cd2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2502,6 +2502,27 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
+static void gen_gcspopm(DisasContext *s, int rt)
+{
+    int sp_off = offsetof(CPUARMState, cp15.gcspr_el[s->current_el]);
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 value = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPM, rt));
+
+    /* The value at top-of-stack must have low 2 bits clear. */
+    tcg_gen_ld_i64(addr, tcg_env, sp_off);
+    tcg_gen_qemu_ld_i64(value, clean_data_tbi(s, addr), mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_TSTNE, value, 3, fail_label);
+
+    /* Complete the pop and return the value. */
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_st_i64(addr, tcg_env, sp_off);
+    tcg_gen_mov_i64(cpu_reg(s, rt), value);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2783,6 +2804,12 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_add_gcs_record(s, cpu_reg(s, rt));
         }
         return;
+    case ARM_CP_GCSPOPM:
+        /* Note that X[rt] is unchanged if !GCSEnabled. */
+        if (s->gcs_en) {
+            gen_gcspopm(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


