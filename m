Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp654552ejf;
        Thu, 11 Aug 2022 10:23:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR43wMVRoFMpYhHMfpMj+VqkgMaZ5X+Ggqlwqh01EKWG2nLVTy9iXhSSWiMxlLhwNccze5Yg
X-Received: by 2002:ae9:e518:0:b0:6ba:8d21:5f41 with SMTP id w24-20020ae9e518000000b006ba8d215f41mr50552qkf.106.1660238607380;
        Thu, 11 Aug 2022 10:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238607; cv=none;
        d=google.com; s=arc-20160816;
        b=wGoT3kDoKoxjlU3EndoImEbcMMOnT6ndyn5Lm5IqA/zXLVlOZget0NF+J6YbSh/Njg
         z0vsC11sm2kk+sK0SUPpZ9AMCJvLDyhwh2DeRjNxn1FDBk7ilmOkjWWDGwvFa/2k8Jil
         2EpuKFBeJySTr8utU+LKbtkhAPW1IW4lmcu6ojInVzNZ5XoU8oze6GdPaKFtjMgCJiY1
         wMlYX351p3VbDp6nI/dFm4H+S0beR7IMkMrTIpI5hniV20zKrIP4KyLQYRg8WqQ7PMOr
         JLPw2/PajTYmOXRtE+S7s/dah0akFgOgB3Ll6dTtJ2lDt+Tdt0bQ2dByH7Ep/OfI/lfJ
         edMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uwBdsBVOiqHy9AjYw9A5odDA4xVS3sjfOA/XRmbIZCE=;
        b=ohnWzXpJkyew3VzYoRBoUrqBShDbpNxM7zXTx4FUFR3n8CoBZpMIWnO1564Obdp1u3
         UEsakb9/D6kv88wItybwN5ybwekugFzQjl2wsOVWQdeDwb6oVnJMpYRBK4sF6Ha8EQ9x
         HN4JzzDI6Po6z+LLac8oSIQ2UfThFe0BTGyCT+0AQQWpoXLFSCuE3mR6R64WUZXDYxd3
         6GZnCdNek9zR1E+ZWayEWq9IuG0FjLnn14KDAP+qwSOfaKNw9lONnQVl14IRGM5h0f49
         6cxxXBqa+MdX6RsOSb3djRVLg2avazQ1WlaM+2HzOA+dqlLR2cbv6zloLwtkgs6YF7HY
         Ao4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEJMdqsn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a05621421a800b0047471ae4f9dsi1942675qvc.78.2022.08.11.10.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEJMdqsn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBu2-0004Pg-L5
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnH-0006mF-AF
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnE-0000tl-Hj
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id l22so22055940wrz.7
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=uwBdsBVOiqHy9AjYw9A5odDA4xVS3sjfOA/XRmbIZCE=;
 b=rEJMdqsnNliLGyfMkICr/W2ZAH/nxPja8LLc0i1FlkAaZ9nzUiXa7JPe+vKOkYMpo3
 Xus2pLl7avB5dESdr0e9i2mZOg2wL8XqUgiLy5wAd/KolVfkL85csUE97WP1GE26j8Ws
 T2+M2mmaLjmMx+ih0g1y4TWsPNw6S7iwYns+6xjzcmkjS58IxS9T1VJs2dVqPdr2x45n
 yrO81dsBSJ8FBDMVSnuArVhyU6EIMvuhtI//DSK21Ui8h5058Ly2FbfBWBZ2epjuzOYu
 YZ3+iQ9yy+4Na/2elu7k+DsY51bkt/banKLIWMxTxH9Vg8DkVjdKYoLx54AMF50T/urD
 VjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=uwBdsBVOiqHy9AjYw9A5odDA4xVS3sjfOA/XRmbIZCE=;
 b=MPNrJxZurJAhhM5KGxjT8YcJXbjy5kLZnDuK84xKd8aIGruSkiNqnRkchun80+GkO4
 8ZwujEl1arhgDctjDkKHkm33V+t4H/P/QwXuGXEJVX/fZ0HABLgPLN2w9cUuYOEMy2T6
 3Zpd1DqEhHgNqQJoKXdb4F/2omS3Jx+z2gcZqPS9gTwBMbZPo1EryOIPsAjgGh1eYo4P
 rkKTtC2vJEZf6SoBuokJuzFH+tMTCgV2bMvHuSutRSgT3H6Sl1Mx3pPkQfcCR76sb1So
 qLucxtDBevHaRL10yx1Vv9hvcGOWIE26Am8wQlmDXLxXAwxjMdPJ2rj1F6nQ1wfDRK4Q
 MH8Q==
X-Gm-Message-State: ACgBeo3VkHgduLUJv1X7rkyFVLtDO6DObOFTdcEIk2jm47wjFH/urglm
 BoTwEYNOeo77Zpw2Ex8lI2gaVwPC170Tww==
X-Received: by 2002:a05:6000:993:b0:222:d509:4b5b with SMTP id
 by19-20020a056000099300b00222d5094b5bmr42242wrb.52.1660238182759; 
 Thu, 11 Aug 2022 10:16:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/10] target/arm: Correct value returned by pmu_counter_mask()
Date: Thu, 11 Aug 2022 18:16:11 +0100
Message-Id: <20220811171619.1154755-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MZ+RTjqPwS8g

pmu_counter_mask() accidentally returns a value with bits [63:32]
set, because the expression it returns is evaluated as a signed value
that gets sign-extended to 64 bits.  Force the whole expression to be
evaluated with 64-bit arithmetic with ULL suffixes.

The main effect of this bug was that a guest could write to the bits
in the high half of registers like PMCNTENSET_EL0 that are supposed
to be RES0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b8fefdff675..83526166de0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1296,7 +1296,7 @@ static inline uint32_t pmu_num_counters(CPUARMState *env)
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 static inline uint64_t pmu_counter_mask(CPUARMState *env)
 {
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+  return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
 }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1

