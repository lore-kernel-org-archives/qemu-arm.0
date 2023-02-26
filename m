Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4028794ejc;
        Sun, 26 Feb 2023 14:08:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9CVXdqFrAH+8oDUtE8Ftz1tjKmiqfnotEM4dnrO9+aZDTOnRRGYWR6LkUOGzK/hrmbWCrT
X-Received: by 2002:a05:6214:1c4c:b0:56a:b749:3ca0 with SMTP id if12-20020a0562141c4c00b0056ab7493ca0mr42186339qvb.35.1677449289750;
        Sun, 26 Feb 2023 14:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449289; cv=none;
        d=google.com; s=arc-20160816;
        b=jS6fflsdgbM1JLZwdLqB2QaPk77oaqCoJGeqa6adapQdiN2CppiIAGJPxasSFM7McP
         EQmG0S8Ttryw+idUUZ/Kx8epW+LRIiOHaZ60P6HKk4Olp3F6j4PtqTra5PG2NUPgvLg0
         CFGXnYLGGHc2/rCPebvm5WOlQPIKXh6EyUOF3lfpHYgHdHa3+UpGgkizNJfiS23N9j8s
         q/3pMwIHWuFYBoVPGTHnaf7Fki9Uii1MN+Q7eFZCOH80ktbL93VyQvwH68YrbKssWNWZ
         oywYdV5BiMx4GSHf1iDaQI1u9GgRH0kHx2NBjwEdjC7j3SXW22NSkFVH7TswO5HigBfH
         /AMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=fI+RGYAGJmkK9ItOnQm3SAMT7F8JvJjN4gwby0OUI64=;
        b=uH2ux+uSM6dbVeYOXcjTL73ByWcSayUEW3bfMEbdA2JqrKEVegKTnXh6R99nnJl40C
         ELRWrLrdxoAc0HRomKLOgOzyz1WtRg/yr6sNBY3XK/t1ln7MEAA5UMLZBX30MfJFtIkr
         BjPBxdDMCCsYiBsjXwRxR4Tu2mg4Dk6FOqmFOxtoP4+XF3wVd+1/PfRXnlfdxQk7rUB5
         qnitwyR7S7KQ+vvtM3eYR62GV8JMCAyXFPRjhPPdUIcaRi3LvvExxm1MZ0Yl0/Bfzmrk
         kcYiarPHzZSxpMjmXAmfCNE6BOein5mtV6UUoN6zWUv9CegHfSTqs/0lPc0mCiOww1X2
         KfcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=M6mmnAtP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5-20020a0cc545000000b0056c238cedd2si4840924qvi.507.2023.02.26.14.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:08:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=M6mmnAtP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPAn-0002P1-5J; Sun, 26 Feb 2023 17:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3B9j7YwgKCMwA46ABsxsy66y3w.u648w4C-s94565y5C.69y@flex--smostafa.bounces.google.com>)
 id 1pWPAh-0002Nx-3E
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:07 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3B9j7YwgKCMwA46ABsxsy66y3w.u648w4C-s94565y5C.69y@flex--smostafa.bounces.google.com>)
 id 1pWPAf-0003tl-Lo
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:06 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so2094050wmj.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fI+RGYAGJmkK9ItOnQm3SAMT7F8JvJjN4gwby0OUI64=;
 b=M6mmnAtPssYSbaRHCy2ue6WJ/c/9BJvncXQUyDqZ02SQZM/9dBdl685KA8L4jlVxpI
 ORv/wIOkbr9IwPwiv6EhFfT9JRb7g449bKNSRiS4HdeMNQuHXINzHtE7BaVXs28V5ask
 y8cD7F/IVwKJu2rr9wbaZsoiMm7WlkYzVM/0G2wU4aLa3RsAs55JNNdoEW1CMo8+XEBx
 wYqWuCBQhGPiyVQFUcRlThP9CF0/L06ddst1QXrWvqsJGPea1qHrWdU6yfkUhXIzHGYe
 +jkEu1CRjqpDDF3X2irY65BzmdtjnA/xpo3uIyks+CsTJFGABcBetkIiVIe2DhicSI2z
 3X1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fI+RGYAGJmkK9ItOnQm3SAMT7F8JvJjN4gwby0OUI64=;
 b=lSp7wH2TRrOQhJGi3YbisvivNRClxOnt+pU7f96HCkO6uGJ1/UXtH4sXNsivx2rJU8
 gft578LJOkY0j96SKI81ZQZwNpB1lBL2fkEIvvzxD55AoOMsFk5g0F/PrIZax072UWqW
 o3EUBMr3f8eTgvq7OqbhJo6FLUcL5rpjxj3vJfwzDokLWwhkluulQ/jt1oc0ZDciAsqS
 I7RUUsaJO+vFkvosuxLjZvbNaidbDWh3274l3CfSvS3FUF8Kgi/Qgq8LN6xJK1PERBx6
 8Oekf4jAfUJ0yIm0p+yFewBUoMJ0qMAw2GSCMeqEwh2w2MDkWhLpiwrJgGDET4snvzbY
 rB0w==
X-Gm-Message-State: AO0yUKVEri72uvvG3TLFaxUUn5+i3eWx9Epnd+AafDHasuZ6Yk9EOW1w
 muyBU/Hj65llMRQCQWuM8HoEva+3hop5zA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:3481:b0:3df:97a1:75e8 with SMTP
 id a1-20020a05600c348100b003df97a175e8mr1879457wmq.0.1677449223756; Sun, 26
 Feb 2023 14:07:03 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:40 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-2-smostafa@google.com>
Subject: [RFC PATCH v2 01/11] hw/arm/smmuv3: Add missing fields for IDR0
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3B9j7YwgKCMwA46ABsxsy66y3w.u648w4C-s94565y5C.69y@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: LoQkeaUDOThr

In preparation for adding stage-2 support.
Add IDR0 fields related to stage-2.

VMID16: 16-bit VMID supported.
S2P: Stage-2 translation supported.

They are described in 6.3.1 SMMU_IDR0.

No functional change intended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
Changes in V2:
- Collected Reviewed-by tags.
---
 hw/arm/smmuv3-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e8f0ebf25e..183d5ac8dc 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
 /* MMIO Registers */
 
 REG32(IDR0,                0x0)
+    FIELD(IDR0, S2P,         0 , 1)
     FIELD(IDR0, S1P,         1 , 1)
     FIELD(IDR0, TTF,         2 , 2)
     FIELD(IDR0, COHACC,      4 , 1)
     FIELD(IDR0, ASID16,      12, 1)
+    FIELD(IDR0, VMID16,      18, 1)
     FIELD(IDR0, TTENDIAN,    21, 2)
     FIELD(IDR0, STALL_MODEL, 24, 2)
     FIELD(IDR0, TERM_MODEL,  26, 1)
-- 
2.39.2.637.g21b0678d19-goog

