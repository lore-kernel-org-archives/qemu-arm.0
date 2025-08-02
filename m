Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3784DC87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:30:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLga-0006js-CT; Sat, 02 Aug 2025 19:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLg9-0006KS-TR
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:30 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLg6-0004ox-Lw
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:16 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6195f7f9ad6so1224365eaf.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177413; x=1754782213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZO91750IU39C64Ysfe0nf9paxZYyW7yZCYTpOatYiek=;
 b=NLUIaId2k8dOFsyLmq9jQ/tQ0E5vsT3Sn31Pygd4FJ05EEFfZr7fuFi1ilsz7bUaWp
 oSyUyd0sKsMIRA/zIZVVuUPxkZmeIuIsQisB9MGKV/dnhkxmSe3Ok5uUn9oIgl4yLOXG
 4xStDhuLuZ3i3Vlvhy+RjxPwTQUALznTqHBbNwHjEncDVcXFbCJ8dxYV2vxfeHDUattC
 vLicMeB1Ub8bAzvkFtdHybw6MTBANPyCtv1K2zzO/YMdKeRhwPNrXoXfeQgR2tDw167p
 C4vg407lSnAwFMj+qqdfSw7KPF8RcGALbzixOYKS/4LSkcHq/SuRw75C9ja6uCQPu6dH
 Dy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177413; x=1754782213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZO91750IU39C64Ysfe0nf9paxZYyW7yZCYTpOatYiek=;
 b=Mt7w3VlBbAOZ08Xg26msIiStIdNnbpjDjIBIUd0Eycx9ugrxjrqAb6z1jitRKj/BzA
 IIZ0EomlDf0pmlaI+Q6qq1k5D8d2fsM6Hhy1nQbc217LghIDP0LRiLDpNhLKAcTe2pH7
 7hYEAPPxQeaWxmJusrK3TBpFnrKCr8YHG+Tu1Wd846I/kWcGAVfjhDKgo+VBQLTj64fL
 oacsXiMMle+5L/7px4q/2eUGAAW1tEeuAktv+3ArYwG20UwbPHm5bKjZvIK00heSzdXS
 ruFdDi6P1/3QMUBsuYmN+tWsC91JTklIU6+T1UyXzdECR0ANAci/PMXgXS5idvNcOf3J
 af/w==
X-Gm-Message-State: AOJu0Yy9LeeE9Ue61CFm9AiYqTbNPOxedOpkHGuqPEsCgcvwxyOhZbX0
 C4gw7eiOox/4Q/R5xaej753q8WYXXr2rheah5jycf8QfUXeHNA0u7obqkCd3SIf8v1+vDrmgjob
 0Ay6PIfo=
X-Gm-Gg: ASbGncscd9GXRKErNEMKUoGmxv6pcqSeas4rX4g9WoB0/J0zTrnI7Nd8IhvcRBQ6W3h
 BEaAEMIKw3w27OVZnLKHonUYEz0CLsZpqhhF2Hu1jMu4pURKm5hhbMixpnX0Zo2QRijkrF/t6Pe
 WdA01mZuqVjId8DOuWiNAhVVYhM0AK5Efx3340LGSw31JmpZLWgoKft+EOyJ8m8pBxTkwumDehL
 5KjVs+Gwdiym738aJpeSLO1qzM6gSPMcLhI/DFyFJvg0iJ56CZQxdZXa3npcjGsp4xqeeGHJehk
 xTQaooIi1VgFGHXt59vnxtqoUcsQuEpm2PfNMDN29A6GKyofj9EJzZpN96nCpFZYb0Rw5xNqq3d
 KVaM9ydMscuaoxSi4jGebfx+nhUKkdqCfJi+HkCpzPSpGQpAkf7DlgAAtirKFSy0=
X-Google-Smtp-Source: AGHT+IESz46fEIIeUhfl9lmDOVPJQ5fLDSgl0CbbNblgLjaWHC/6zoKyYigLJ73SMsEqCScEpsLXPw==
X-Received: by 2002:a05:6870:a48d:b0:2d6:b7b:a83 with SMTP id
 586e51a60fabf-30b67608083mr2383246fac.13.1754177413293; 
 Sat, 02 Aug 2025 16:30:13 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:30:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/85] linux-user/aarch64: Check syndrome for EXCP_UDEF
Date: Sun,  3 Aug 2025 09:28:30 +1000
Message-ID: <20250802232953.413294-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
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

Note that we have been passing the incorrect code for most
exception codes: uncategorized (do_el0_undef),
systemregistertrap (do_el0_sys), smetrap (do_sme_acc),
btitrap (do_el0_bti) and illegalstate (bad_el0_sync).
Only pacfail uses ILL_ILLOPN (do_el0_fpac).

Note that EC_MOP (do_el0_mops) ought not signal at all.
For now, preserve existing behavior signalling ILL_ILLOPN.

List all other exception codes and document why they do
not apply to user-only.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 66 ++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 85d455d018..098578978e 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -65,6 +65,70 @@ static void signal_for_exception(CPUARMState *env, vaddr addr)
         si_code = TARGET_BUS_ADRALN;
         break;
 
+    case EC_UNCATEGORIZED:         /* E.g. undefined instruction */
+    case EC_SYSTEMREGISTERTRAP:    /* E.g. inaccessible register */
+    case EC_SMETRAP:               /* E.g. invalid insn in streaming state */
+    case EC_BTITRAP:               /* E.g. invalid guarded branch target */
+    case EC_ILLEGALSTATE:
+        /*
+         * Illegal state happens via an ERET from a privileged mode,
+         * so is not normally possible from user-only.  However, gdbstub
+         * is not prevented from writing CPSR_IL, aka PSTATE.IL, which
+         * would generate a trap from the next translated block.
+         * In the kernel, default case -> el0_inv -> bad_el0_sync.
+         */
+        si_signo = TARGET_SIGILL;
+        si_code = TARGET_ILL_ILLOPC;
+        break;
+
+    case EC_PACFAIL:
+        si_signo = TARGET_SIGILL;
+        si_code = TARGET_ILL_ILLOPN;
+        break;
+
+    case EC_MOP:
+        /*
+         * FIXME: The kernel fixes up wrong-option exceptions.
+         * In the meantime, preserve previous qemu behavior.
+         */
+        si_signo = TARGET_SIGILL;
+        si_code = TARGET_ILL_ILLOPN;
+        break;
+
+    case EC_WFX_TRAP:              /* user-only WFI implemented as NOP */
+    case EC_CP15RTTRAP:            /* AArch32 */
+    case EC_CP15RRTTRAP:           /* AArch32 */
+    case EC_CP14RTTRAP:            /* AArch32 */
+    case EC_CP14DTTRAP:            /* AArch32 */
+    case EC_ADVSIMDFPACCESSTRAP:   /* user-only does not disable fpu */
+    case EC_FPIDTRAP:              /* AArch32 */
+    case EC_PACTRAP:               /* user-only does not disable pac regs */
+    case EC_BXJTRAP:               /* AArch32 */
+    case EC_CP14RRTTRAP:           /* AArch32 */
+    case EC_AA32_SVC:              /* AArch32 */
+    case EC_AA32_HVC:              /* AArch32 */
+    case EC_AA32_SMC:              /* AArch32 */
+    case EC_AA64_SVC:              /* generates EXCP_SWI */
+    case EC_AA64_HVC:              /* user-only generates EC_UNCATEGORIZED */
+    case EC_AA64_SMC:              /* user-only generates EC_UNCATEGORIZED */
+    case EC_SVEACCESSTRAP:         /* user-only does not disable sve */
+    case EC_ERETTRAP:              /* user-only generates EC_UNCATEGORIZED */
+    case EC_GPC:                   /* user-only has no EL3 gpc tables */
+    case EC_INSNABORT_SAME_EL:     /* el0 cannot trap to el0 */
+    case EC_DATAABORT_SAME_EL:     /* el0 cannot trap to el0 */
+    case EC_SPALIGNMENT:           /* sp alignment checks not implemented */
+    case EC_AA32_FPTRAP:           /* fp exceptions not implemented */
+    case EC_AA64_FPTRAP:           /* fp exceptions not implemented */
+    case EC_SERROR:                /* user-only does not have hw faults */
+    case EC_BREAKPOINT:            /* user-only does not have hw debug */
+    case EC_BREAKPOINT_SAME_EL:    /* user-only does not have hw debug */
+    case EC_SOFTWARESTEP:          /* user-only does not have hw debug */
+    case EC_SOFTWARESTEP_SAME_EL:  /* user-only does not have hw debug */
+    case EC_WATCHPOINT:            /* user-only does not have hw debug */
+    case EC_WATCHPOINT_SAME_EL:    /* user-only does not have hw debug */
+    case EC_AA32_BKPT:             /* AArch32 */
+    case EC_VECTORCATCH:           /* AArch32 */
+    case EC_AA64_BKPT:             /* generates EXCP_BKPT */
     default:
         g_assert_not_reached();
     }
@@ -108,7 +172,7 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
+            signal_for_exception(env, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-- 
2.43.0


