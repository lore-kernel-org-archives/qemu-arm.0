Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1483640ejb;
        Mon, 7 Aug 2023 07:15:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+yfUs8cApVwi2RHwVpf5QIYgVnWLX8ow8zLzWEhGyyEmNS0dDqU64uJeNDKR4xgwhu2/C
X-Received: by 2002:a05:6102:1c2:b0:443:5ec3:55da with SMTP id s2-20020a05610201c200b004435ec355damr3953299vsq.15.1691417744648;
        Mon, 07 Aug 2023 07:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691417744; cv=none;
        d=google.com; s=arc-20160816;
        b=OEtikVkrSnMOHNLjrd+avS5lWjTX+aGTi5aX/4/RpIOFyi0k1pfrWkbqpXhOWEQoC7
         TJFHa5Bi7sacVC38nLY6P9UUL6fwGioRVkL1oXVH3IDsDVNvCzz4lpaKS7fv6AMVKwXU
         nbrkgUR5PA+aNj9DseNXGvztyEZCUgxefB+4iosJ3wuq3R4oeFGooCS2Axb1DReTXmxy
         E5OxNR52gY7MixVbHROsYs/fcm+CynKmBkKet0rFhrV4dYaGvVEeUj/BzWHIotc5M8KW
         U2E068yyPyTSIgD7Pcn4cKTTFEklZHnxCcw1pHLcQGaxBJoH7/HOuGGi4KGUC05+VUpI
         OhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bd+htH+P/WAjyuut/9qNXD2yHqngSJFvzj95KpMX1XE=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=cpvWzdE1+QwbcMHwZby01pHC915pzuzzhGMDSkUDSFtVOhJp5kpPjf9ybfFXRpYCQf
         gDl7bWIBapUMcR2edY5kAZV+75hgN0HoUGqdit9WnbXVdzdn09STbdydQ4U8JZuQTBRp
         2YeIwm/Stz5wR4ZCeXR8Vl2iIuR/RFFEegPW6drhy2odLgz6EaQvFZ2d+ru0NfDqPmvg
         V+JzlgGC60aNI3jf983V6EXtEm9zCSyzrrBVtTBqv4zw6uLn48zlMsYeFx6/pqKO5HpC
         4sox4XzSrc55yhtg/Khg3yEbfpEY2PvAUHZjWiX5yE3uM2JWnTMXenmCd4qb2f2CpkSp
         fZPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9GWWpqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26-20020a056102105a00b00446eb080cc2si655200vsq.347.2023.08.07.07.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 07:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b9GWWpqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT110-00008K-Kj; Mon, 07 Aug 2023 10:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10z-00006t-LO
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT10w-0005RB-ST
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 10:15:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22e36so28522425e9.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691417717; x=1692022517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bd+htH+P/WAjyuut/9qNXD2yHqngSJFvzj95KpMX1XE=;
 b=b9GWWpqXYW/sxNzDU1E9+PZeNZADDu5zouObLzVPCQcoP4Q0517U1RCjfzutnvs5qo
 QOILXRh/Df8QxzEgRWrkmlVetzFYs6EFCkAQ+hdWWyQpcf2qNj/zFsjPAdJ1W14ZeSQ6
 sQYhmiemo+8aBhlWD+rAIYKQDGrsqzwUz46f22odvZJaQWMhG+VWDomJsPg+yja7LT0L
 b+DJdEC59q+8Ks5JWNndKupjs3gfKcd3UuvsZQBQ0d4qp1x1vGLJjUcR8brGoLAkwkjB
 0vI+MglgY1QbNuGlWzjqYJbB/diNdsDMNufycfaqt/jfOwOW7nnLmcUCi6DL0PLW3CoJ
 RHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417717; x=1692022517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd+htH+P/WAjyuut/9qNXD2yHqngSJFvzj95KpMX1XE=;
 b=jyeSRFxDQnDkrYT0xcDHrhs8n+sYoyky6JbzptgFAEl/tet22fDzmp+R91hxZAStBn
 A8Nk0egbj95Sz47N8i09S/fuHIFrHdBCuFospQvFa5D039J7iTtlJkPb1nFrj11NV3ef
 6ycVpuaLs+Yqv1LVv90fMfoSWaduU/vz1O3mTWLDor1vNDffVVN6py+7VqzwTS1UnH7k
 JvrFtKQWJ1x9vHBNQ/95F16JORvlulbpgWYc/PGgV+1aviQLxa7KOSE0gRGCFvhKP8sr
 vYHolM8RsxtCe5DHxCNvxwQ4te9Z+UHSC+R7NXej7hpqWEftQ1XPr/fh+uVSEjuh5V7P
 XJLw==
X-Gm-Message-State: AOJu0YxOxf81mFzkcFRspMNiV64Q4vQh775OgZU6C7T0utK6b+MluA3G
 Dsz737xz/i/GHeCtw/z+21J18gHa+5Bh9Iof3vs=
X-Received: by 2002:a7b:c846:0:b0:3fe:20ef:1d32 with SMTP id
 c6-20020a7bc846000000b003fe20ef1d32mr7428318wml.10.1691417717000; 
 Mon, 07 Aug 2023 07:15:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c261400b003fe2ebf479fsm10835617wma.36.2023.08.07.07.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] target/arm/ptw: Don't set fi->s1ptw for
 UnsuppAtomicUpdate fault
Date: Mon,  7 Aug 2023 15:15:00 +0100
Message-Id: <20230807141514.19075-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807141514.19075-1-peter.maydell@linaro.org>
References: <20230807141514.19075-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: anisWPxv5t7r

For an Unsupported Atomic Update fault where the stage 1 translation
table descriptor update can't be done because it's to an unsupported
memory type, this is a stage 1 abort (per the Arm ARM R_VSXXT).  This
means we should not set fi->s1ptw, because this will cause the code
in the get_phys_addr_lpae() error-exit path to mark it as stage 2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8f94100c61f..bafeb876ad7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -701,7 +701,6 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
 
     if (unlikely(!host)) {
         fi->type = ARMFault_UnsuppAtomicUpdate;
-        fi->s1ptw = true;
         return 0;
     }
 
-- 
2.34.1

