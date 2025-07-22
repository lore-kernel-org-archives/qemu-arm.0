Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22456C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 14:29:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueDxf-0004SD-By; Tue, 22 Jul 2025 10:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ueDuY-0000s8-SS
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 10:24:10 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ueDuW-00046q-B4
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 10:24:06 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so5508920a12.0
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753194243; x=1753799043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QgRdvDymuUcz4ENig7Co8/7DUwWCH2GmvD/UEqjYk4w=;
 b=YMdhR8PM5KxUiv2DbfJUdm3shF5d9ei3vb+sZJeLUySU2qz7eIxgbXRLs4N0yWUh0s
 2nHV0m23CYmkJys4TfjgphIQItccRTQkse1MRmQQbpZigU0ELF0+moKu3/JF/4+jB6YB
 /f5vLWi33llFXSERMDuy8jOnsydwcY8J7o/dI/H9mdFVXpUG1IxY+qMOttzY2xZbJSgR
 erMsGZkN55b61ZaBCcVRaXgZctmjkjbdbsxUtqUM931waKIYLvyppvzy9Q0spqcJL0vd
 awyoYjH7D2OIkZy2ZLQrAhix0GBPCTEUscOlTK3uXRk3SaLRtJ056l63iDKokp0oCe9B
 epqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194243; x=1753799043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QgRdvDymuUcz4ENig7Co8/7DUwWCH2GmvD/UEqjYk4w=;
 b=V8yLJC85XGmwDY7ND6ujVKhzrPCrCV56TU8nqEsX/Z+sV7GoQ37bbBGiB9Cg941lju
 PaccP/3O2E5f5MFpKckOHeiynGvX+5tlwWXGCDipOZMu3mdDyhoHLQt0aDCvusGcErH+
 BBIJ2aZ/L8CxYN4tCqX5xdHt/dX5Ry0n91XF/SSscVR+wdPeLs3kwVl7ztVOg00bo8b8
 MNx6esyBYE/lVLd5AyMAkTPDpDBmmxOL8TJMXcuWUSkiTC3iVKYVF0QmHN5nq7blv+Ph
 zR7ONI7z1bNqUMvzXXsV0GJR6FuhIKl9akg8VxwYtSiMInQzdS90oWdZw72l+Q72kggM
 bOog==
X-Gm-Message-State: AOJu0YxBKK7qY8/VanmaVLiE8F3aN3fpRzI3Fhm/ioURag2RjpK5nutj
 7+Xnu02W9gPmGR2TxXqMS6MTQYLOQasqhCLppBfGd9/MxaUq+Uh1ukuqyo9tLf/4XeE=
X-Gm-Gg: ASbGncvz5y7cFq38KJg1Hp+O3APwm1GR6u+k79A1zEUcpVuOgeW2bpub5/KQLBFH8aE
 ZHTXxTivsqX4prwlgXu2537/tBLUBf4TNjz/kU4+2nrxS8i9iR8/BwkyeLb5leaQhgWuS5TSYu1
 2AWJQ6wjWRNp6Z/EXcnrHQVAy7lU4gqdYmzeRYxwXxqazk4YH8yhELvMUEv2IXawXUQBojI6303
 ybA3S0rssEv3fGIrAzP/Jz341my/gp/W0LOs1ih663e6JQDPnszj1b1qXh9qT8/Eotx5ibvT33+
 q3cqnFQMyiaHqlCG8asek9d/t+PPBDVw7jXzW+kWKfIsZcsney0UDv0TghIkDA5cSBX67CLbdus
 +AgxLACMLXVuk9ZfASpFfR81Jx6qj
X-Google-Smtp-Source: AGHT+IES+afgTL+0ZIuMe24b0dxekY/hjdL0umQJUUmCBXozckAHMOmGpgHsZk3TiP3RO969iYBwaA==
X-Received: by 2002:a05:6a21:689:b0:220:19b7:9d6b with SMTP id
 adf61e73a8af0-23810b4e1b6mr41974923637.9.1753194242713; 
 Tue, 22 Jul 2025 07:24:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe653a7sm7274980a12.2.2025.07.22.07.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 07:24:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PULL 1/1] tcg/optimize: Don't fold INDEX_op_and_vec to extract
Date: Tue, 22 Jul 2025 07:23:57 -0700
Message-ID: <20250722142358.253998-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722142358.253998-1-richard.henderson@linaro.org>
References: <20250722142358.253998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

There is no such thing as vector extract.

Fixes: 932522a9ddc1 ("tcg/optimize: Fold and to extract during optimize")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3036
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 tcg/optimize.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 62a128bc9b..3638ab9fea 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1454,7 +1454,7 @@ static bool fold_and(OptContext *ctx, TCGOp *op)
     a_mask = t1->z_mask & ~t2->o_mask;
 
     if (!fold_masks_zosa_int(ctx, op, z_mask, o_mask, s_mask, a_mask)) {
-        if (ti_is_const(t2)) {
+        if (op->opc == INDEX_op_and && ti_is_const(t2)) {
             /*
              * Canonicalize on extract, if valid.  This aids x86 with its
              * 2 operand MOVZBL and 2 operand AND, selecting the TCGOpcode
-- 
2.43.0


