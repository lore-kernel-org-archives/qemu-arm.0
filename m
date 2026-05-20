Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F82CD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZR-0001iH-5h; Wed, 20 May 2026 13:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ7-0001Sz-Tq
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:41 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ2-0001yM-Jx
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36931e4f5e8so4454858a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297515; x=1779902315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QD0lZ4gXN1fWzU8DAYp+qX7d5AOu5jrmEh8yc45jBSU=;
 b=SESmsV7CddNMEWl22IglVFrBXLnzb717Bu3UuFGctfbpYsCZ0oTVHAXMlNH6Pqew4P
 Uir075+3rxZO8ds4JYwDfjNxUepIphO5WDaznsPr3tXN5zkFk1XC7gA+MPQOHex3eYIC
 Vgi9K6oYo6g+vv4e11TVDzkrg8IECzO1YG2Kzl4iju8p1QL0ZPde6vIeyixIfdhz4T6H
 Cs501BCp8ad+9BDk4K+zsJ375zJFm10xzbguZt/T+suCh26DjS0X+oEi0n66whKv3fbn
 FMO02EmaDRarbE28WM9kf3Hxa9KOy4NuETQl3/AehYNS2/OohEDGExDoKvodTtBZBsKA
 zEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297515; x=1779902315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QD0lZ4gXN1fWzU8DAYp+qX7d5AOu5jrmEh8yc45jBSU=;
 b=LUE9iyOBCMX1p5VvDoexyyNw0FKITO3TU5KaAcScSEvYsUTV3HBmS2ZbVtvGkz/Er4
 g2uM1OwaQeyfnRV56e2nX2vUMVnA837Yo3UUhY+NRun+5IsOaeVzzovxR216zdA/3OmJ
 EJrLFymgSLig77QA++CGa5FCDGp9DJb2mvqu/2wNWPag5zYOSI8ewoq5qmqS/7l1d4O/
 BO84TiVv2zhG1Fx8RLJZAd1t0eV84WzRTSYgjdjxadmgkQuwSW9DDwMy01eb2rHbmk4L
 ERatDGwhIypKuKVa6chTpMuUOwCKG8nJ1gD/3RyXxqsR4rvix9KHeh3OfZhpdY5uzCxE
 FsIg==
X-Gm-Message-State: AOJu0YzK4OdrzxGekm+Qwh/3KRJNhp1N/to7NMZ/iMK86eEpMlrt4FFw
 /2ct8EhEEqgR0CJmDhTynha5vhAvyKFx+81IJvIKtGOXYJTn6nMzQ9flaozmG+dNZ3DfYkCp3gF
 BJCcMpKw=
X-Gm-Gg: Acq92OEheEPvJRtARgy/f0Mktra78moyGyAUhVWAV6XMujtqLnA9p9ASxUX3FQEQc5I
 ohJ6e7LNK7bxIKerad/PaEcdmYFW9tpJ7NT4Q+diZnCltPd2aV6QYQIul1qIkQ7YxxjUvGd20WT
 Bn+ozOV48OIz1ogALRcGCuqP1C2bcP8ansduECPDVXn+wUCJsysDMXWDtDuujZ9/li9eMCqfR4M
 JL9f2RD/kCuo6B1bgBzgsnrju1iRelJ3yvtHQNXETcMy1Gf+wPX38OYcOJRiwluV0uzcaTVpmw+
 Jgzwr5nfQgf+tHDMBXZnO+j8uQbGuJZIGkoXhGK/aCkeYHyuL/br2OnoLiBVtmF53vsAIAMjoiu
 TWDV0krx2INo1MPTvqUl5TO7emsOki8m+rx9SKk0RKFk3x2nxbc5U38nOg9ve66y3NxM67X9YfT
 xY70S9kaayJbHSibU62Vux6KTvvwqN
X-Received: by 2002:a17:90a:d446:b0:35b:8d89:719b with SMTP id
 98e67ed59e1d1-369519af686mr20885994a91.1.1779297515114; 
 Wed, 20 May 2026 10:18:35 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 18/30] fpu: Use get_float_3nan_prop_rule in
 partsN_pick_nan_muladd
Date: Wed, 20 May 2026 10:18:08 -0700
Message-ID: <20260520171820.848839-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index f40a950b41..7781e16122 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -163,7 +163,7 @@ static FloatPartsN partsN(pick_nan_muladd)(const FloatPartsN *a,
         ret = c;
     } else {
         const FloatPartsN *val[R_3NAN_1ST_MASK + 1] = { a, b, c };
-        Float3NaNPropRule rule = s->float_3nan_prop_rule;
+        Float3NaNPropRule rule = get_float_3nan_prop_rule(s);
 
         assert(rule != float_3nan_prop_none);
         if (have_snan && (rule & R_3NAN_SNAN_MASK)) {
-- 
2.43.0


