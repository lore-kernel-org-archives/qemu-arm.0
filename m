Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp885236ejq;
        Sat, 6 May 2023 00:28:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oiYuuOVCCqFr5C5JDGbViQjqSmnOhiWl3gqSDtVdQxTQTJ2xfX333Gpokdzcl2IIsHal/
X-Received: by 2002:ac8:5b50:0:b0:3ed:a811:23d7 with SMTP id n16-20020ac85b50000000b003eda81123d7mr5575350qtw.38.1683358092793;
        Sat, 06 May 2023 00:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683358092; cv=none;
        d=google.com; s=arc-20160816;
        b=qeVgpbG5Vxpes/C+w2hJPJW0S1JUIC/lB9C8+InAyf33s/SSm/GcRtwaEAuYdNsu+m
         yhjlZHLgbGNAqvE3p88cYFcthhbHKOyt6H9KyhbjFtER2qvzgYZip/79UuCrSvEMvKzj
         Mfv6U4qFtWWaQTwQVHopaN0i/D7KMichIo1Ic85wHflfmSfNZ4Icd40BjhCj7Rx4jnIt
         PDCZRq4C0KM+004vkKC1ODCFHZuHOt4sMhE4mF4SQDlBDuj9rCK3cFj02IpyHKvQp9FC
         hxKi6NzW904dTr6QGEF+JUztVHKAic9D53K7lHjcUHvEx9wnwfU1RQ+hUYCj1CoYSHMD
         ZhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
        b=VOiiSr2s42lLbSKq3az8AdzjcKV+GwgEa0PDuc7+a1l5kdkEYMQ7MMdRR4WJOiFjbw
         3POyzFNZdXecbExEFkS8qe/QN6kepAC83LI2gYsyVD82Uwz54HonELdoO6BCKUVF3CPA
         86XUqlgOv75Nf4mb+61VtKSYGyLD1ujNhm1bo+tlA6FE4hx0qiAILd+E2KMGN3iyN4Fc
         RYyn7WRuHKofViLVXHYNYLk3VgSIGkZ0zMu0eI9iSHMs15nmbUYWZJYFn/ScxEui7gH1
         fC7EXrNoj/RgPX9DHHJiGtYASX/ASuNGAWJW6xBdgMeujUipUwOCHYQ+5CM1zxaWAUVt
         0P1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUB9heQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020ac858c8000000b003f3876984efsi19568qta.680.2023.05.06.00.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUB9heQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGX-0005kj-IY; Sat, 06 May 2023 03:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGU-0005XB-8v
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFu-0004XA-Lh
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so16941555e9.0
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357777; x=1685949777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=UUB9heQZK2dk3DkWZJ+PK33dPI7Dph7mEO7jvS0vPMU8y9q1tDHSw34jXYSyBh/bkI
 WXx12h1YirRPxICSp07nqIEzO2XTR+uwCb7FBvVQAHX1RiWLsXXrVxxngrkpE0Xu+ngr
 SkURFJ42IBa8diQRAj3UDBtGVizvWUJhr/Sou20BFDD5yPj63M1yPTWYwubG6BSta6+h
 5m9b344tcSxJLs7I2Iczm8jZBuSVGQ9jJ8ILU4WuF/PPTXAlTj6qEqwVAAg9UOQZ5E1z
 bZPTXzMBhF9XDDehj1s8wbZHHyGWy2UDyrJ8X8Yf4qtolVvRixtnQIZJ8IvztY4eZQXX
 fsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357777; x=1685949777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=T22/gp38wrs8NQqk8/Oe2o/nVuMkbkTeetwH1H5+lZITqWqpRKl97Q2M0GX9Upavn/
 MYOafJkyaAQiA07UmR86+n/l7+iyTnAx3W5pYss8Si97Qby+FMDcvosUBvXOoENXajEE
 mHWPJket/Mz+zMnsy4cOyakiSxKPD7LEEYv6vHntZwMRAin+qbo8TSEUP7ZKMp5XTn4h
 BhVb884J7gNiJw1o1Lc9VejoawaQ84rrJCafZ9nq+ZV/dNkFi7+1oy9ZFS/tHi25/YFC
 VZT0gHSwEWUjU65UXta55dWhVCEUnttUOpVpsun0Mu7UzctrjTWdre2mXqNBLiK9UxQW
 gZ0A==
X-Gm-Message-State: AC+VfDwqMCfFmEMHSYqUmH3+NUZtjMbK506FD9yLVTQhvNBWCaciRmMC
 W9evYxe91j+0cdZGswdcPrK/gEaOJ1l7cytZQI1JWw==
X-Received: by 2002:a5d:6b86:0:b0:306:2fd1:a91f with SMTP id
 n6-20020a5d6b86000000b003062fd1a91fmr2458522wrx.61.1683357777330; 
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 27/30] tcg/ppc: Remove unused constraint J
Date: Sat,  6 May 2023 08:22:32 +0100
Message-Id: <20230506072235.597467-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NhqbNxs74SI4

Never used since its introduction.

Fixes: 3d582c6179c ("tcg-ppc64: Rearrange integer constant constraints")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 1 -
 tcg/ppc/tcg-target.c.inc     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 9dcbc3df50..094613cbcb 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -16,7 +16,6 @@ REGS('v', ALL_VECTOR_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S16)
-CONST('J', TCG_CT_CONST_U16)
 CONST('M', TCG_CT_CONST_MONE)
 CONST('T', TCG_CT_CONST_S32)
 CONST('U', TCG_CT_CONST_U32)
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 5a4ec0470a..0a14c3e997 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -83,7 +83,6 @@
 #define SZR  (TCG_TARGET_REG_BITS / 8)
 
 #define TCG_CT_CONST_S16  0x100
-#define TCG_CT_CONST_U16  0x200
 #define TCG_CT_CONST_S32  0x400
 #define TCG_CT_CONST_U32  0x800
 #define TCG_CT_CONST_ZERO 0x1000
@@ -270,8 +269,6 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
     if ((ct & TCG_CT_CONST_S16) && val == (int16_t)val) {
         return 1;
-    } else if ((ct & TCG_CT_CONST_U16) && val == (uint16_t)val) {
-        return 1;
     } else if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
         return 1;
     } else if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
-- 
2.34.1

