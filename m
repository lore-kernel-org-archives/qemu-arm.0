Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2884535ejt;
        Mon, 19 Jun 2023 08:59:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ50YKw/L4jj/QdKRyUzZ8UK7ZPJLLTQdQtHAcvlApi+iEs5T7AHMWyH+v+1Ro/xpAbZhcC3
X-Received: by 2002:ad4:5c81:0:b0:62d:fd62:45fa with SMTP id o1-20020ad45c81000000b0062dfd6245famr15352794qvh.54.1687190359676;
        Mon, 19 Jun 2023 08:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190359; cv=none;
        d=google.com; s=arc-20160816;
        b=IJpLDVKl0mDqugKQtgcrE7+as22ToW4TB5sA8+kIlmi6ul7Iyrl6l5S234i0BjFojx
         qa2ms2diH+Cn1GuKm+03aogK5vppEs6Gi6QVCNgMHFLimxoJns9Dw8+fB259Jm1p7T1o
         aqOQIvlAxyWKstqKlXTHJPwbqhunyzDB38JdUMlxOvSJKRmRKJpZPGSdTKjE+Q2uR3m6
         gX5I/xMLlk41Br1U70wJ62oX69UqlJqa7FcS0x59/yEJU4dSZ7zPTgXuvHErphghoS/X
         vR6AXQFlhJ1S2iW+ZsS6DzJX89yPps6y/orD8Hl9xPylz/yR51IbQ7x2YQUFWIhiVyL8
         BjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yhu8d6diQ3is2pZ2Ay7Lkxc29r3qyYX7d/FAwcjykEo=;
        b=rlxbASiORGXU5SOADQTZUVxp2jGn60srW80LalKBb3bhhrWygKWt4G1EwP3R1i/Jr7
         8l2LDWJchvEbvEO83rSVi8nBMadQBBUgJXWBEV6RP3r9dGNTDYu1TUD7mYClpeX3eYFq
         +u0ZY7uL06PiA0GYz8KH0wm6W4ITBq4/e9J838TnieYS/38dI1ljjcTyIED/uIIQ2bKz
         Z6PYgo/+E2PjQHiTXAPon9P+8Q4Zr9W2105FhvsWiR0Xujy2sy1APfg9g0CiH60+ewGe
         LuA51QXqxt87SrjbcVd2c6LA+Zsu5N5GGaSqY1h2ZDj9NJ928FUbNLhEqXUrCtIJ72PP
         S5ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UoZ5Twea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420c800b0063019b42725si89127qve.37.2023.06.19.08.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UoZ5Twea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHGS-0002BJ-22; Mon, 19 Jun 2023 11:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHG3-0000kC-Ox
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:39 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHG1-0005Ig-K7
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:57:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5187aa18410so3738751a12.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190252; x=1689782252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yhu8d6diQ3is2pZ2Ay7Lkxc29r3qyYX7d/FAwcjykEo=;
 b=UoZ5Tweaq01fz9vMxPO3V6ToIpKxpEQJH8aTwQyxFciQRpp7RAUBMrRM16Fdnee0m0
 oAXZ4vZPGk53Jbg3lupubkM/xxq8wsKflZ3ofid79NVA9n83W8Yx5jkDas8miwRBBw+9
 eycu76FWF63yvoY1VYpiGCLO+QnsUeWwGTEsWKd7ULGYrmlpO+HZoKM6WUv63NQFWN1v
 EU3YytKTdCaW5ubABBDPa3xTzNvq0t1JDU+4bbkSmhRvh16E8mozwBmNONuKfoOJpL7x
 /SRpz9ukzpO9OOXU3MgCwpmWBiPNEGWr8WFLYnHFLB7pNMDmYfoskPOgKvMYcLaSkfll
 0Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190252; x=1689782252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yhu8d6diQ3is2pZ2Ay7Lkxc29r3qyYX7d/FAwcjykEo=;
 b=ll33vEew6c5ysRj7v4l1zHWOK9+izUocriPUq9234gpif2OS6Gdl1BUm60jFQRL74t
 XU60Z4x/yga4RGzqnloPtDXwmsZpHOe2hxEYYiSPN46ZRMTmVKOgXJ+hbAqHX3JPEi6M
 DDmzaokTGVsKYoD+WSA0nBHh9zUe8KwG7R8Rq93ntdXNG3M/zTenJwqclnHHCC2DZJRO
 Q8CnE3u8PhgGvhO3bKJ+4KZu5gwdb2ByamEgV1Yo86H5LBPvouhmztLbtYUUjKcCRfxA
 m+xCaxXR5ut3TRJiNd3clP7MZVOWAIZ9TvZy//iQxar1GAb6Mf7YuZN+QC7aYIyzb8nQ
 i1Ew==
X-Gm-Message-State: AC+VfDyCrEh1zQrbfUW1AVMfxesF9uGu4COGhusjis5sHMkZd06kcIdq
 RslaF2oDdPNjeBJFYBc8nWC2zkth5mgvsBNEdYXbsw==
X-Received: by 2002:a05:6402:2043:b0:51b:7c2d:4b28 with SMTP id
 bc3-20020a056402204300b0051b7c2d4b28mr1128702edb.10.1687190252421; 
 Mon, 19 Jun 2023 08:57:32 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 c7-20020aa7df07000000b00514b854c399sm13222120edy.84.2023.06.19.08.57.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:57:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 31/34] target/arm/tcg: Inline 'exec/helper-gen.h'
Date: Mon, 19 Jun 2023 17:55:07 +0200
Message-Id: <20230619155510.80991-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kMktitC39nf3

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 7d57a71b67..13d59d8417 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -6,9 +6,11 @@
 #include "tcg/tcg-op-gvec.h"
 #include "exec/exec-all.h"
 #include "exec/translator.h"
-#include "exec/helper-gen.h"
 #include "internals.h"
 
+#define HELPER_H "helper.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
 
 /* internal defines */
 
-- 
2.38.1

