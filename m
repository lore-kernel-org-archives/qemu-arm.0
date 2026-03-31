Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48ECFF60EE
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 09:23:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7VJZ-0004gM-CU; Tue, 31 Mar 2026 05:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7VJX-0004f4-J2
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 05:23:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7VJV-0003vN-2e
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 05:23:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43b9d3ebed5so3985957f8f.1
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774948986; x=1775553786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wP+GI1GA2esVBEcdv2LEdQJ+EKOQrpQMHXtB4e3u7TU=;
 b=uuF5tiyJtl6NyKA3FiAhGWMXajshZ9x7EGb1BlnYVoG9/8cJFemM6HC/xdSi7JFmPV
 PAECsZ8rndEoIjT7El1mVj2+Qwy5p7Nmvq+/O9e0wkH0zCDePxzukmY2fJwEs0prTJ+K
 GfHy8sGHw8UOLQhpu0CpsXSC1BWbG0HretAQqxjVdgyuEjmths/sogPTwTFxb1io2cC7
 ThfTgoV/PHT4FWlgd8oXJlsyopOARyJt65orkwKFNCAzeXpuAll3sZVJcK7caeIqEMaV
 hNwbAQGIEfjiaybWRpEO16vujjzZrVVIHbXU5wSSW0ElQBBqncY1hp8aZjNRPslg+qt4
 Rosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774948986; x=1775553786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wP+GI1GA2esVBEcdv2LEdQJ+EKOQrpQMHXtB4e3u7TU=;
 b=Pc8yqpTj2ZLAfs3JBKKqZZ+ccbRsH/mqcFX81gIqBGi39NYNEQEf234tdD65cGi8KE
 ohp2EhMqb/44yyUbp9jdoyaW7bNlXbQIrnLMjQz9GAkRwJS2cmyJ77ARYiFWF2ZdhKsw
 Y3R5GSnf06kip1ZnqmlTqV7cjUBuJr8mDGijss8IunevHrAtQy6SVNm6xmK8sGKWlAY5
 J4CnMAvuLEWWGDdNwNVHPJBiVOlh81hBSxSEKBrRBU0LcEd5JPH7wwM0hQYAQfyEGGfr
 5pL74DgPzuqbdcZBTRZDwjCBMGXacDQYdqTIVgOrGyW8h4XlNrdY8ZSPa6A6Ehn8qTha
 jXjg==
X-Gm-Message-State: AOJu0YwPRnwUPbUm/xpB81osROa9citeVPp3P1FbfB6+x+JzwZm3AIJt
 msGo1e3uAZJwl+xkUO9hAKZ7DBTUCEn1IU4eDj3Rkr6EQuqJZkeBQHnljpe23cufh02ygH3AYTt
 IwIqNw3U=
X-Gm-Gg: ATEYQzyFksyBxG5n57Av4mMJXOCMhkXvEH7mrJlJUb84BFt49dGhmHn8NxWuzjDIz3w
 Yl6BbBKsNVBy4oqj/F62c2FLVGovfkBEXplWGVB3VAfDzPy014Ki/SyAqSF1s/LGHfaOOR7JbyK
 tkmGzjr6xaYOxBfiZYDVtdz6PQrxAu+YYQ1Lynr3IguLnAwd1rcrqZfivYOALBUcGnvtAHwFoGz
 b+znj/JIMszBfz33SoE3AJ7DTRf1o3SJJ7+5kH5UGa0C+bNwrRZllVavdr6b8WuY8aWlf5TQYI8
 NqtYUeTZ2vBQH/rpnYZ+eS42jV01OrArAAhJYmlB4F5GtVoLiS7OdIdK01n4sEKhEnb9mX6X+Aa
 lBezYnH8Wg8+ajgQy09F09FVhCj8aSmG1uOzsTu23ckU9x4LsUyKihbsgbQy6y2zoIId1/Yz5y7
 skzlDSw8upydxJuEIzlO3oRonwlJDeVcChDS0LYmK0YmixG07pgvnbFfTyE2S+DVtcUESBZHNay
 K4bo4tk4WIiI53tNOnkttWIh4i3HP0=
X-Received: by 2002:a5d:64e6:0:b0:439:b858:1d28 with SMTP id
 ffacd0b85a97d-43b9ea9aef9mr25655034f8f.26.1774948986461; 
 Tue, 31 Mar 2026 02:23:06 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf257b72dsm25928298f8f.34.2026.03.31.02.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 02:23:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: do_ats_write(): avoid assertion when ptw failed
Date: Tue, 31 Mar 2026 10:23:05 +0100
Message-ID: <20260331092305.2062580-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

In do_ats_write() we try to assert that the cacheattrs from
get_phys_addr_for_at() are in the form we expect:

    /*
     * ATS operations only do S1 or S1+S2 translations, so we never
     * have to deal with the ARMCacheAttrs format for S2 only.
     */
    assert(!res.cacheattrs.is_s2_format);

However, the GetPhysAddrResult struct documents that its fields are
only valid when the page table walk succeeded.  For a two stage page
table walk which fails during stage two, we will return early from
get_phys_addr_twostage() and depending on the fault type the
res.cacheattrs may have been initialized with the stage 2 cache attr
information in stage 2 format.  In this case we will incorrectly
assert here.

Fix the assertion to not look at the res fields if the lookup failed.

Note for stable backports: the do_ats_write() function is in
target/arm/helper.c in older QEMU versions, but the change to the
assert line is the same.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3328
Fixes: 9f225e607f21 ("target/arm: Postpone interpretation of stage 2 descriptor attribute bits")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a regression, but it's a very safe fix, so this will probably
get into 11.0.

 target/arm/tcg/cpregs-at.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 0e8f229aa7..53dd67375d 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -37,8 +37,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
      * have to deal with the ARMCacheAttrs format for S2 only.
+     * (Note that res fields are only valid on ptw success.)
      */
-    assert(!res.cacheattrs.is_s2_format);
+    assert(ret || !res.cacheattrs.is_s2_format);
 
     if (ret) {
         /*
-- 
2.43.0


