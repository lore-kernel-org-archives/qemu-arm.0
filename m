Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2391333ejb;
        Tue, 30 May 2023 12:16:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AOdFuyhumdoZWfJJcTqrJil3zpWbCIa8MXb75ELHY7tyhaatUYTwBOWR07lvL7MjNc3Wb
X-Received: by 2002:a37:6853:0:b0:75b:e5b1:31c1 with SMTP id d80-20020a376853000000b0075be5b131c1mr2736509qkc.66.1685474203346;
        Tue, 30 May 2023 12:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474203; cv=none;
        d=google.com; s=arc-20160816;
        b=colOFIuNfsoUd4LEEQwBxUjXjDPv5gBiT2eqOKxkZvENVRq3PS2No0Uzrf/iAWPmEN
         XGPN1wiwNZ5CUNMFvO3jQNRDuT6ApZ3rFiMKOLMwovKwE6Z+1tkDenZvOEDTeMJyfnIE
         9iv9oaD6/VoLFF2QmrI3X3t6Ac/Az3103EHW2qOSncCEspbNSmUz05spIfw1mSVAR4S8
         4Y60Ii3vNByzjMk7/EZ6Fd0WBxra4vMKaTpRnpPeufp1ri8EgDIvhpLH3sOmaRpT1qjV
         NdGIBjNzoXiQj5QUpAS8lLlR8PzdDtLLL1C2UH7gB4ue1+eCLmd5wFCBkKP0ovwkvQwr
         ZK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H2XXJkmc8pjiqw5ujX/J89qzMIqZ1uAbhAJfcXpJrUA=;
        b=TVq8vBR2BZ3jwV4Hky3/y68qA0ceYOM8gNR1Eb+hoey4h6Q3ox0v5NF2Mg0cAxgAcS
         5EetBIBqm6X3/FzCaEToExtZQEbku26JwNLiJAgaVPf1nl2OR8qNHntoVA4oxkkn6ZRr
         vNRIU88g2kFfGiVbmWLepOB4LZIjnHR4EpTLcUStW6ARE/XQADL3GPcjcJ2y+oFLhIQG
         5KGKDH+HIxKfw/uK5w8pmOWtwdiCwySdUrP7cQQqo3jJh+ezmFhA5Nv60l5qzuVi7wIk
         equs14uW6kHEVymuwWlUjWzHnt0K+R8Yqvfkh4DCsOTt2Dh9BNIIIF242esOqCpqe6WT
         UnnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NPPk/hAr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op6-20020a05620a534600b0075c9760b545si7007739qkn.74.2023.05.30.12.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NPPk/hAr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44oF-0007IU-Lq; Tue, 30 May 2023 15:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o7-0006yH-RP
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:59 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o3-0004kC-Iv
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:59 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64d2f99c8c3so3569609b3a.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474094; x=1688066094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2XXJkmc8pjiqw5ujX/J89qzMIqZ1uAbhAJfcXpJrUA=;
 b=NPPk/hAr7cnyFdjzNWR541gJAO2DUHDZ5vwW7YiJ4Z9qrT1+8bpKsQfQjIsBqB4cDy
 cd5wcE5vNWyxE9PyBjfwuyVrPVMTiGsP/QrReEvaxcpZKAjzIfbW/1irBch+G3XNeDLV
 pOHPBTxjhgd+tDgCopnD1Xb+FVnYEayOnYL5lhqsO56iqbrR1cWVYCT95/Tm+bUGG54C
 iamMmigErlctfeB9I/Lh6V+NvNh+ldRUzVxR73bNP3MntqB59hGF5zQdZbvQaQWerFgU
 i3BGdD2i1kWvSJC3BVgdS0FjCb4AQaMeCOCUXRSEkAvFaBOFkIntPbd8mEaobfDsZASU
 wYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474094; x=1688066094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2XXJkmc8pjiqw5ujX/J89qzMIqZ1uAbhAJfcXpJrUA=;
 b=Xw/bau24zMCzmFU7Ba0eesemqdewWUBwMXn5T4JZsMZ/R8jVfgjT6wAOlM36X3Qzbg
 5zZnka7SU8Ug9mLk7grbIR0IJ0EdVK/WGd+ySXdEg7+cjFAxyw20GAAwneelc8HdHE8d
 VZ1gWx8Yyx1mA+FKPbMqDyvnUFsiQBrul5Pz5YcsdxaLQeQqrBFdLkgdZ+vMpOi2Jrj2
 ca/fiChYutp7oRx/3bHjJDvwZFQL6Ofs6SfXPOAYC4VoKlifkP5agGBYum98iqmF61aR
 A0tVaqLY/H0IBaVdLf+8pxs5ToKc1e3jX0X6Y9azDOPA1/sd2GF9DzjZ64yQFNH3gbdh
 EV5A==
X-Gm-Message-State: AC+VfDzQO5h2hFZD3uR3xahTjQh5N3FwWzj/n3cFWbMTD5GSOHWH8I6B
 /xA+DKkytzmnzb+YXv2ri4f22Nnm2sdWiFUBDDI=
X-Received: by 2002:a05:6a21:100f:b0:10b:8024:d253 with SMTP id
 nk15-20020a056a21100f00b0010b8024d253mr2861081pzb.26.1685474094331; 
 Tue, 30 May 2023 12:14:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/20] tests/tcg/aarch64: Use stz2g in mte-7.c
Date: Tue, 30 May 2023 12:14:36 -0700
Message-Id: <20230530191438.411344-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: Qoey74Dosed7

We have many other instances of stg in the testsuite;
change these to provide an instance of stz2g.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-7.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
index a981de62d4..04974f9ebb 100644
--- a/tests/tcg/aarch64/mte-7.c
+++ b/tests/tcg/aarch64/mte-7.c
@@ -19,8 +19,7 @@ int main(int ac, char **av)
     p = (void *)((unsigned long)p | (1ul << 56));
 
     /* Store tag in sequential granules. */
-    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
-    asm("stg %0, [%0]" : : "r"(p + 0x1000));
+    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
 
     /*
      * Perform an unaligned store with tag 1 crossing the pages.
-- 
2.34.1

