Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296F0CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:41:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxg-0004oO-3b; Sat, 30 Aug 2025 11:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQv-0007Kh-T4
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:27 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQs-0004uR-29
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:24 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b49cf21320aso3042892a12.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532835; x=1757137635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dB1cHT1ha866F85MzBv2WZgn+PHcRylb/+Q2tL/eLA=;
 b=dCbdgZAmVUdkkBUGKbZkgyIRKLSqgnTRBE/xMZmI8sfWjSiTPt0rLLYNE+z9evTCgu
 CZSxnpge1jVEj+WjSfo7mZwQzwl6m76rB4UvzvB1ypx2pAH8COVbB5ZZ4YLeOjPHvC6v
 wWcX8+O0o1z1aeCxoBU/SYGg/vX6RkwvH5mUIQ4z7oXBxuw/KhFK+Hc/ovlZBQCFYBAV
 lArwYx1XKkzRjJfI2q0aPTaXdJSerm8ug9GEXDcnRuKG2O2cZEIcGn4pM2HtaettrTrv
 RTVtMHags14gq4e/IKB5jjojy/dOYm1TKPGtihSSh657UvTH9poRx6kkpGk+iPVr38pM
 e0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532835; x=1757137635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dB1cHT1ha866F85MzBv2WZgn+PHcRylb/+Q2tL/eLA=;
 b=SLe2XnmkklI7gi/v7lqr5nZZwTf58VuIK/d56WT3ydyZUx5hjqGCvB1Ch8rDqdH2Cr
 77g1/E7vX4Bhx5n/IDr5xG1fSjOImqS9SZnQN6mDx3MdO0kD/9wDaxkzH0WD1kAHTC5L
 T70Kk7Cvncsa3h3Bh2RVOn/HtDNQKBu6hA2D0R5V1XUDPXbz2tbH4C26Kuw6eyzEEbGL
 Xyt5IvuUMMsOR3QgNXJ1SFQxVXu1rlaZ0Zg826QXlUhjE4NIHUbbvg1oN3QsiL5x5Pd2
 qd7g45cZJmFzoDEaC7Vf2gDYF5GD8DhIapkjLj+/+wRbgAANmwj4pqHPR15sK/ucF/l+
 TXig==
X-Gm-Message-State: AOJu0YxgeoaYlht9hgkxQFAL7SWrhYjYAZ/S2asE5++TF/aKbXZEODhW
 BNO3bLaPjPP42Ohs0S/fjZC/HSuVOfvNuSZ8YcHofdhBJKguZ4wmkP8++n3NsXN61gY=
X-Gm-Gg: ASbGncsxxcJvkSBmZ9qfsJHSqmNkurRmkW4B6BLkIePpjUCwCHYRf5oHCh/mqWyeoy5
 7fz3mm4b5poO7q/9mOCrtHZKE3jEwKlU9OXRA7WuFLyIjBAxF0jyUfeK8ISENZ1ytg14+LFtPtk
 JTZQMwjUfguoU1rkwwrdvyJobW48l3IOKZvw62ttVG+S+vpYuuVL5ydXhA1ZjB0dCHwPaLKVg2W
 NYqufBDvLh/wzaYj3syNyHvHk/N2ZU+35au5ObSu+1apBVdLms2xOgepZZubtHgGMYypMlqDqmo
 FOqCbPPo7ECsAeeH+N4o/g6UQFmL66fj5WRIo/J+trrC7OfCgErz7DjRPXiA+wZ+4g03kXOTAn9
 hL7gPHMEqy+qpDG1w0lMI95Qxs+JJEmF8JZ71HIc0sOmASqWMO+DPfCbJrXQFO5A4UvQK/IuSpq
 nYDbyglcYw
X-Google-Smtp-Source: AGHT+IFUF2vw3Ybp9B+8/EVZdXrvMa6WTfWSB0QJE4w35D0pCx6Eg1EUB1BVa5GNIF/lLTeJVSZuqQ==
X-Received: by 2002:a17:902:e551:b0:240:671c:6341 with SMTP id
 d9443c01a7336-24944906d9fmr14071555ad.26.1756532834537; 
 Fri, 29 Aug 2025 22:47:14 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 56/84] target/arm: Emit v7m LTPSIZE exception out of line
Date: Sat, 30 Aug 2025 15:41:00 +1000
Message-ID: <20250830054128.448363-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 target/arm/tcg/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f6fdfaa551..e787acfc66 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6885,11 +6885,10 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
 
     if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
         /* Need to do a runtime check for LTPSIZE != 4 */
-        DisasLabel skipexc = gen_disas_label(s);
+        TCGLabel *fail = delay_exception(s, EXCP_INVSTATE, syn_uncategorized());
+
         tmp = load_cpu_field(v7m.ltpsize);
-        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc.label);
-        gen_exception_insn(s, 0, EXCP_INVSTATE, syn_uncategorized());
-        set_disas_label(s, skipexc);
+        tcg_gen_brcondi_i32(TCG_COND_NE, tmp, 4, fail);
     }
 
     if (a->f) {
-- 
2.43.0


