Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200B0CCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 19:51:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8l2h-0001eH-LH; Tue, 14 Oct 2025 15:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2V-0001Zz-HE
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:32 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2R-0003Pn-CY
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:30 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7841da939deso5158920b3a.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471424; x=1761076224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2Xy9FdJMIc8NV80GYudnI9XDnoteebZK7GGC8hP3Zs=;
 b=QN8XHLi4MtJc0y9wqdeahgH6pWtux4nFIw7yLzH37DSRzNciB2T9JZMfZAofp5eE+u
 3AGIsiI8I1u918vLws5CoCsxCfYd+eqJ7i6sxaQ7/YCAUedZG+vtaozqu+hyzZAWmopB
 XTCx1neVtgPi71fAXfqe2BTsWouayYHQoXs7ziC3JtExt5nDncZLT+sbvymYVe9crllR
 0UG7VKTx7ItsKZsTlxxxTchJIDGGue7lraJcdN6xey4fNT4/kb3k3IovBhUHdU0abcag
 VmN/uKNU2IjMh9vPHkaQ5uK3ull+0n03lbJ9HqpCnK0IPbHmfbSa6QueE3cn+yigq0Ym
 wuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471424; x=1761076224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2Xy9FdJMIc8NV80GYudnI9XDnoteebZK7GGC8hP3Zs=;
 b=XXS8u140mIvuQ4fxdBlmSXefu3OEPKaZMWMfWI5zF++mbOv2MVxqUhDsphNB04nyGW
 nKu4S1GzieY+y8fRGNcj7ufBpQsCPYXtTPUqeDjlbZqqsCUBTIxGl6TC7X68FOWG76jl
 Nya0S1NEUOowoZlQpPIWLhCMHgu6bvJahtTvQ+knGiSBynS9ZUe7XzbxaY+XNyUFhxBW
 azbYFdyiUmKb+Mg9+Tv0+F32yet94GepNBlhaLBj3HQizgbQy/SPD9mvfStz3AGgf3qz
 vSPkZUZKHkLjSfoqXkPc1sr3P+OQciZDBpHjIi3D/Zuc7fIjy+4bQUr8pj9se6JAvQRM
 apHw==
X-Gm-Message-State: AOJu0YzKySEfQeeEYGeLrnA4QuCSdNilfDIWN6KZyFK//TcJrEsAuVty
 QXCrQOyC0IDhAyc9u7duaSbWZFrCbmBj0T3peVdWUNLGhLQL2i7Lx8y+FwuE1fwGQlg=
X-Gm-Gg: ASbGncumXwZ6iChzrRAlCzVsaZTRLn6Onl74tro4wiNSgP9FvR5P3pFWRjhj54xxeac
 LlHKKD1dQy/lmHG6p5jrmxc82UC2DEfAsW/UPBGP/z8EwsJw7PquUTq0Ui3fgLO3knut+LehkPg
 1lNAQ0FWfWTbNefQMLz+G1OYL4T4jQfmzgKOcqIxgbhbA76FTv+Jew0hifl1qt+MIC3WSCSNbo7
 OOUPsL60RqI0w4B7Ae5hBC71JfV5xQ/TGjgT1Z1ehtPXBkZB4vTXKcvqt/+IbrF2sWApTPaZWQa
 Z1z5/9PRTOm8poO2IRiYYlwQB6WktzIwpFyBbXxSzwxvfOIFWPCGTLVOUbNOXcN8H8WaTuKUXU8
 lArZUqDXM5uQsYlKqIaGgb1EBHUgnxKdI+Ow6fr+ymAfIOeBtGWA=
X-Google-Smtp-Source: AGHT+IH8/s9RQFwZ1jyjGBMNBf0m/XQQIUmyOTE6Xxz7hy3qpf9H3m2oUtfcG7b6eqaSxLmYjMQ2pA==
X-Received: by 2002:a05:6a00:14ca:b0:781:c54:4d24 with SMTP id
 d2e1a72fcca58-79387052554mr28867034b3a.21.1760471424148; 
 Tue, 14 Oct 2025 12:50:24 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63a03dsm15918727b3a.19.2025.10.14.12.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/7] target/arm: Use el local indexing mair_el
Date: Tue, 14 Oct 2025 12:50:15 -0700
Message-ID: <20251014195017.421681-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014195017.421681-1-richard.henderson@linaro.org>
References: <20251014195017.421681-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

We already have regime_el() computed to a local.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 54c45fc9fe..5fcf104272 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2319,7 +2319,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
         /* Index into MAIR registers for cache attributes */
         attrindx = extract32(attrs, 2, 3);
-        mair = env->cp15.mair_el[regime_el(mmu_idx)];
+        mair = env->cp15.mair_el[el];
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
 
-- 
2.43.0


