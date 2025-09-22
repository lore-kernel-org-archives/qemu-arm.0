Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67909CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:59:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lfa-0004AI-2J; Mon, 22 Sep 2025 14:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfH-0003hT-Fe
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:33 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lf8-0004xO-QX
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:31 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-267dff524d1so35151935ad.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567199; x=1759171999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRMGkSahDRDIyhY1Pf+KcfrLPaCj+CJxCc4+NBDjs/c=;
 b=EXo+I5c5dou7oUmx/J32POv8Ej+lwIHgNq/lQsyBZwU2EElDu9udEUT5eFXoVoD9H9
 CPSmZ0u2NSElDO3gcwZg8j8tnXatJyGsYA+EGSdgatTP4U4n49VztwYV5CwY0kvHC0Hy
 To30ggaYdlh15t85VqnJoqiBzch+lOZC7lXEdoHpmRsgiTNIF623hF+2CZ3DjMZP1UgG
 ltNaDlB3mPgNU7rRiyBQ8KxG5pocs9Wj8vMP6xEfYAwjjWVLpbuP1CDWZL2N3T/BQwx/
 IZaoB12TMPWX4w6JVIYZp9BKGMVwAg2pkkRW63L8lKqnq7UhJQF+A3Di6Eo6Cc1w+0z3
 /8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567199; x=1759171999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TRMGkSahDRDIyhY1Pf+KcfrLPaCj+CJxCc4+NBDjs/c=;
 b=wuhu25yydDcizIVE8wOZ5U84fJIeclDzNHB17wAOeKCO/zbtJbbbkxlaVRutTDVFpL
 h0WiR4SLWVyOBz6LFNoTLOt+1dhPpfhGtKYitJ/t+DmQ2r1vdBqw1to61uim4yDGszkY
 v83uuotJsXhrKhcso2RBxo35+jPA8hyt5ZXTHHwPo0ghDR46hP36LEMGVyLNqsYvUXJ+
 rv4Qap32LyUQUcAtvnMSUNUNuibthuhVclXRI/U+n3ShfatQj7x6zaBGnon23cxFo0fO
 sTqEUqQOt7UDCc8Tnr/MIsShdf56em+mzklGTwPL8nrFC3JfxWrUlBwbMPdbSAlNKqH2
 jQnA==
X-Gm-Message-State: AOJu0YxmK7vQ0RJeY5vccZVJHKtEFVyoG5mrnXNgXZIAJTs8bg2AWzLn
 oumO1qZ1k/Io2jDHfk1v6/JweAr+5emk3pvHwYoDsFAgfMuqvIUck+FUoVE2bN+Uygk=
X-Gm-Gg: ASbGncsvLYs8y5UfKPdFT0Hx1zHYkq8VBK0EWl4diSBRwPmk1xcXZ322BZbbPlyI0v2
 ofImt3Z6qyIWSo0sKRKp9o4kBVZnODX8ww/wjP4ZeTjlTYeFkxKNHC/b5GxEG6J9Het70b7lmkv
 81LK14JDdAZtKld+WyB7ytMxARTHdisafkW0nRqaqOKOJO4OX5h+cSU3wSqJdQLr8MaRLvjuUHu
 zrhv7drRVNySbTSHbz3x0AeaemwImds4msW+NKZOHAcwxhuUUmSdEmfHzkZHtkTsSEe3/TLszrb
 BBLGkyWiCRpUUE6vLwK8JXYdKgslabA8F06h0mk+y/82QI+/WSJFoCLnbD+Q+2vnWWjePL1+Qkt
 cZX7xq74Bc5oA+MHq1lUpve0tzF8OFtNULg3xsSk=
X-Google-Smtp-Source: AGHT+IExyq1klN3I6uzuB/YJNf++Vp8JA6G2zCD5/7hU3EOr4Brz+R0bFXwQK3i5cXT7IDyPOLHl1g==
X-Received: by 2002:a17:902:ea02:b0:27b:472e:3a23 with SMTP id
 d9443c01a7336-27b472e3b6fmr29636145ad.14.1758567199079; 
 Mon, 22 Sep 2025 11:53:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 47/76] target/arm: Emit HSTR trap exception out of line
Date: Mon, 22 Sep 2025 11:48:55 -0700
Message-ID: <20250922184924.2754205-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
index 78d26aac04..57bc8ea4c5 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -1774,21 +1774,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
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


