Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61983C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:56:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLpn-0000wS-P2; Sat, 02 Aug 2025 19:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLnC-0004Nd-FG
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:34 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLn3-0005tu-Ub
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:37:29 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-741b1fe0dc7so57506a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177845; x=1754782645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5UYaNg4HgCgaMfA5VDdSs+JLi614JTEFfBBOaKuI9nc=;
 b=Zsag0+7plfiu6d33/UfqWFJcGnjXQoG2ZoXDSax4OyJCszjI+m9HXoGPCmzcx8n+Zc
 wriBvLowjoJIC//fhcvBE+t546wzkm1+hRs8BFgHxCp8RGnTnaXOrl1M3fwlGWb/meHQ
 63uH/rm+VXq7mw5mNIXZEWkiZueaTyqKdvesuqOKtyGrMK8xtTHsBNf4xoRJJGFVvlFO
 KnMUo18Rb/TFcKz8satbgzGugShfyp1ZJiRc64pKblErR+vMzReKLOu2xuOYMTLp2eCA
 VM1bSbkhMfkPV+ahsbZ2wzUiciadPGhrZYjSQMeHEqqr8H9wjG8YTMS82C7ihNPIMgT/
 Ycwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177845; x=1754782645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5UYaNg4HgCgaMfA5VDdSs+JLi614JTEFfBBOaKuI9nc=;
 b=L3vYppMMS6b/kekLnh7B1U+xkNKq9tttHWNW73XJI1EGV721T9lgkFygsLyz02yErZ
 VF8bVLOqTkWbMKsz5gpg2oFf1kyl0qABxkpvqFggc81uyoTrFW+XmKiPbvvfRGQK92pC
 JN173UAF6XsxKQ3OQJXOEL76+BkZFC2peFbg+HWCvGzLVPr8626XXiuzO7iDC9gGRxC0
 bEyankMzyJG/p0WmqgnmmT9CDXCGufWS0EUOPakZKX8L7HL/HYqT4CeVc2By+8k0PJh7
 pcZdTgaCLPtBASRXsVm3DGuqYxaF6aVKXsaOmTIIqR8+PQJf2PnD7DXGfZtTYooY71XH
 3v0w==
X-Gm-Message-State: AOJu0YwoffLtAcZTIqgUqmNKCaPFCSnkfX8Zkv0BWZnVHgDhl5mbXosr
 6oSnGKOX3QmLeWQ8GIUaAJNBjeXIpiWLyTjDVtrIGVWsIhDCNFcu05CDTdCA1gVaGUY=
X-Gm-Gg: ASbGnctO6AIIHtsUarwM3B31ljI0FohpJAPcOmm7FpZxA/u9P4V5JQsrJeWCK6MNXke
 0q4qRoJ0mfXCVSEOmiNwfN55ob6DPU3t03bLUdeOpb7PvrvESKB2s1VlZEUVtq3R4ionBXhYQ5v
 dVZVM752esGVezl0wOeFf1fHnZgDpS+J/KQF3eG4Hz1fPi1hhg8Ul/Zi5YpMCHTtKcpFpD6Iwyh
 UWsrly0rZabyelp7ThOJ8zIDoFr9r8bXXd7gf3o6WgDBEOTpaH2vYcPi8pnGyco0hl5NGPngB3f
 BN7RD3y37aFI3J/dd2f/WufgqsXiu1hC9q3qknLyqBsXrwFg5lxCXgCkg+RSzaiSp/dpA+XQp6X
 lcZhiAPiPDH7wNvO7pUK/45qC5FktCn4dhsKdwFEj8hyFfSrHsQkk
X-Google-Smtp-Source: AGHT+IHKIfci5+yeHTN2LwNVSz9wmI34VB4fSl/XWAJJxBkB6a8QEUPA3VHuZE7MyK4FgIUxsqGbqw==
X-Received: by 2002:a05:6830:6686:b0:73d:6f86:f256 with SMTP id
 46e09a7af769-7419d1f66f6mr2975789a34.17.1754177844928; 
 Sat, 02 Aug 2025 16:37:24 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:37:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 55/85] target/arm: Emit HSTR trap exception out of line
Date: Sun,  3 Aug 2025 09:29:23 +1000
Message-ID: <20250802232953.413294-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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

Use delay_exception_el to move the exception out of line.
Use TCG_COND_TSTNE instead of separate AND+NE.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index c4dd3a747c..f6fdfaa551 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3033,21 +3033,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
         if (maskbit != 4 && maskbit != 14) {
             /* T4 and T14 are RES0 so never cause traps */
-            TCGv_i32 t;
-            DisasLabel over = gen_disas_label(s);
+            TCGLabel *fail = delay_exception_el(s, EXCP_UDEF, syndrome, 2);
+            TCGv_i32 t =
+                load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
 
-            t = load_cpu_offset(offsetoflow32(CPUARMState, cp15.hstr_el2));
-            tcg_gen_andi_i32(t, t, 1u << maskbit);
-            tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
-
-            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, 2);
-            /*
-             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
-             * but since we're conditionally branching over it, we want
-             * to assume continue-to-next-instruction.
-             */
-            s->base.is_jmp = DISAS_NEXT;
-            set_disas_label(s, over);
+            tcg_gen_brcondi_i32(TCG_COND_TSTNE, t, 1u << maskbit, fail);
         }
     }
 
-- 
2.43.0


