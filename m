Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp847262lfb;
        Sun, 5 Jun 2022 09:11:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBPXShoVc1eKyRvNAdkUUBrbSYVMPyjgpKCCt0q+cLPPw6B++fQDJIE+rHvOO0/ahW1bp1
X-Received: by 2002:a05:6214:1d25:b0:464:55a9:48df with SMTP id f5-20020a0562141d2500b0046455a948dfmr26021080qvd.113.1654445493492;
        Sun, 05 Jun 2022 09:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654445493; cv=none;
        d=google.com; s=arc-20160816;
        b=m/TN2DQOhKyrJd01SIqent4oEsCvd4H/PqL5sPNCW6YpwmgLrvzivTG6fcj+wB0zST
         lqYGubJbgO5jQQ81qKUQoGpyI2x9HjO7npZE08Lns1hf+tbyoopty1WbdMX4gix0pq9j
         sEtegkWCWhVPf149fcWELE9UkJxRN0Z9KXbxzukxut3fIu1EFSOSz4nxjdAwsJMdykhP
         NaBPxFW93q/MNGpBnqgVuV1PiId9o03VzjR2HSOJXHOLnJA/61KG1pU6+biu7g7bqgcP
         yVkUzDInRF5QgboBaZqfnxyUhzlaAGyI6YZpWzN6gYjdFF0O5YgTHHYnDLAd2tDgkcTk
         PiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TgNnGXwfgRry1IQ1wXfMDKr0/OaNnfmlorJs2ZdMw3E=;
        b=lUsgsQ8Gh+0NTWlFneq4f4/w+cpBEahB2u/sY6NE4o0stNBE2A/P9p7bv+L5Kmz4mm
         zwp2512uQ5+dzLnay/ArzGPN/oqL3gvxZPqXD5a6xzFZ7j7rpTDJqhfvqAXMA6DpmfUj
         Ae6MseEF+J7PefN8dByBpZ3hQ7yioYKHt17rXduFCogbLT96fDuUyW9Of1hhUkXLuDCZ
         uzaibbooFf5cLJWGuFv3Xs6vgc/Uxwq3NjU4kotKkA5pcHW3T2Ab9EeZly7BNHH7DYiX
         10SWthjxNqI/6uzB5jtn6IPGhyV3juOgQHC6QP4lum7lJcHZK/1RgV44IIE8HYnCQibc
         T/PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faWhplnx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05620a241400b0069c1fae5c76si7872073qkn.38.2022.06.05.09.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jun 2022 09:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faWhplnx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxsqj-0004XT-0O
	for alex.bennee@linaro.org; Sun, 05 Jun 2022 12:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqF-0004WP-E9
 for qemu-arm@nongnu.org; Sun, 05 Jun 2022 12:11:03 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqD-0000TS-08
 for qemu-arm@nongnu.org; Sun, 05 Jun 2022 12:11:02 -0400
Received: by mail-pg1-x529.google.com with SMTP id q123so11083227pgq.6
 for <qemu-arm@nongnu.org>; Sun, 05 Jun 2022 09:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgNnGXwfgRry1IQ1wXfMDKr0/OaNnfmlorJs2ZdMw3E=;
 b=faWhplnxhQLXhTnyhtTRvCx/d/+U9bkBAk7pZhqpTVR/T7giEFJPvCSne1WWbHkkn4
 WzKAjcZLxcrx50oU9u1cLRX+CMuesp8Vd1Ndkz0uUPwtw36zDMW5C7mcGXXH37uz4i0I
 kA9fJmqRIT7NO2/U/p1EX+uQGb5ZPsTc2rKiBNhIxSqV7mjl5DNJljSZLSaq+8q3/IVW
 LyZFq6LB1CsZHqnMXO0ln99WS0egY23yeC4DarCDM1Ir4hch5cLvkRlzXaSxQZDIL/uJ
 POzxQw6Ji50E7kbJru0WgxErMrQxTB732rRotz2yzZ0ItAWmryWt+/rR4ndpp23GS8XU
 n3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgNnGXwfgRry1IQ1wXfMDKr0/OaNnfmlorJs2ZdMw3E=;
 b=aLDUyawCr5VoAn53ysED7c5U4p1gvxQWixyYXnQU3PUTKO5kPA6PLnpnY4goSLIIBm
 /90eM4Xm5aTfbYKYB/mFUDh04nw+47uJEgy/za/7+e9O+gGPMNksbh6zs0TwaABHmtQj
 fP5EeTuG+YOJhKSu0yRkmlpFAW2AKWzKT0mhtsvNRyCnaot664XIpfTdHj8rUn++uB1v
 RBPObCIoeBPROfV1AfkqLeguJ3pKHekQRNGDr3F/ObcgNgfLm+bA8jTxRmNhoajdR0/p
 02gx7qWlljnH00Mh3MYbkVOJXviKVqnThPv8Cm7lp0TbptnfWEzkkNxTJYKY/BfSrddm
 6yfg==
X-Gm-Message-State: AOAM531DJWEDi/0VWofDGbbwiiF/ZEy3mw5tiocRqQSXlo+71c1xlgP4
 M+crpai7mtUTkujT5hy6xDJc/lPw1VA8pQ==
X-Received: by 2002:a05:6a00:2395:b0:51c:122e:3237 with SMTP id
 f21-20020a056a00239500b0051c122e3237mr2544343pfc.21.1654445459237; 
 Sun, 05 Jun 2022 09:10:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3fb8:a3e1:bf34:75a2])
 by smtp.gmail.com with ESMTPSA id
 q133-20020a632a8b000000b003c14af505fesm8932165pgq.22.2022.06.05.09.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:10:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: SCR_EL3 RES0, RAO/WI tweaks
Date: Sun,  5 Jun 2022 09:10:54 -0700
Message-Id: <20220605161056.293920-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: SfhJyMppHuvu

Adjust RW, fixing #1062, and adjusting bits [4:2].

r~

Richard Henderson (2):
  target/arm: SCR_EL3 bits 4,5 are always res0
  target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]

 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 11 ++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.34.1

