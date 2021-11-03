Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp122585lfv;
        Wed, 3 Nov 2021 15:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVC0XWjQPNhBxCFbbVIz1YZ44GLccxSEHsCGt94C1qRh5xe+nU5kpsOBAYKakwjraS2cJw
X-Received: by 2002:a05:6808:1447:: with SMTP id x7mr13354722oiv.23.1635977453285;
        Wed, 03 Nov 2021 15:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635977453; cv=none;
        d=google.com; s=arc-20160816;
        b=dH2x8zvbDfy69/a41nYcG+IF+lrdD7Y1KQxzksNznxTEnwbXuVouGFqcxBy+F9P+I4
         uc5izn529spQWq1q7jq8c8rDkZKol6Ae5mFY8JF9oAUmvChTLG4IEmBs5FWv/la6EVxd
         CesUqkhqWxCMj5Jg50+01BnBGxqI+9uRsRpmQdm8JkxyUx8KrObuKPzJwa520xxWdqzK
         1anZ1rbcjke4B8BNVnR6PPjRcZ77K/xZSsqcMtU0fY6q0QtK3oBLkG/AR28yX2bGsX+8
         OZ71HXVPvTScUweI3UYsb0aTcvuAjiMnif6Dtzs0CY28fyCEw2p2eiv1Dg7bQA/YxbVA
         7mVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
        b=OMev9uRMLs7PLHUuukUgHeQoY3P1TeOvDB1mLTQZIxySyf+lBAcddtmc4IagyL4wDt
         xI/Y7g4+u0eJIiHSogSCYHsmJ5GIpwbPIcJce2qcICSHt5KkqcmgTh8igxXNo9Mn0emZ
         gaWmFIE6GV6b1gbC1vVf99mE0ogk+OkuWNF3v7T/XNJqrKnUX6Yh+r25AFOflCO8LgPW
         404XH7UKWoqcgAi/M+8JdVitT/9MCzqlgA1Op/JedU2emoyYJWP7N67tmDvbzbEFEzRE
         V3TuQ72E/28MjHu8xL8KIjGozjZQSK1INgoseQ6Ta7Ih1kzrE5LxNUcq/qXc0nEfp6N4
         R1pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PN6MgwhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si740083otl.159.2021.11.03.15.10.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 15:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PN6MgwhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:44938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miOT4-0001M8-U4
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 18:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xAaDYQgKCO8nlYRfkjYXffXcV.TfdhVdl-RidefeXel.fiX@flex--wuhaotsh.bounces.google.com>)
 id 1miOKM-0003Dm-91
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:52 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:49725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xAaDYQgKCO8nlYRfkjYXffXcV.TfdhVdl-RidefeXel.fiX@flex--wuhaotsh.bounces.google.com>)
 id 1miOKH-0002YS-6P
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 18:01:48 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 y124-20020a623282000000b0047a09271e49so2119613pfy.16
 for <qemu-arm@nongnu.org>; Wed, 03 Nov 2021 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=PN6MgwhITl+W/ne1Iazq0YDgkUZK2QrCL2PDFrZEkEY9jTBiQ/i+RVxkUqXBYPh3Ix
 hbYyzLUXLaa36QKnf66odxXD1vbF0IBaOcxMZXPGXgx6jhXDg3lWXGOc/lC52kVtzRHF
 3GyiwsQktn8b475dvv+CwpF8GpeeCFqIqm9rNkjr/zqDPRhaFszAQKqN/8Jre8KwkNxi
 vEnL3BZvG4+6ucEjDB8r0QFuSrUycJ+JnatMSVEtutLIh+5ORds90EeCS96PMdWx2Qs6
 nWnpzWf6TLe8LH9IW7Os0HLa4GL0cVNglWBCRebBv5XhFUOO1P75+k086YUsdpaMtJv1
 hD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dMycM0iTAsn10hNJmp4h6CEEwqweLqLM9YjEB0Wk4fM=;
 b=DTGRV5mCXuBRjT+NyG02RfCR/h04Sfm3IxTxDQTHR3KYnpbKoaC2HxgRU/PvZeY/GO
 S2bkxkWnJa48Ek617Zzb00/0FYgDGNkFWmj2lHQUSgbaNIkwXC4/b+Qd+vTy11cTHQwa
 UzHF6spShFUImDTgF1YGIJmb9+ou2Sod7p5jXk03Ft+S8X+rqpIrbJPKgyyaTLa/UJHg
 +Lcx1ec/NSLZUpmgyaG0hNxlJEQm6qoXSVYS354g36NxrH09GcRyhUXl+Tb/TWLcZd+F
 KqpXq68aq/YBbNdnYehyO5wfMR6y3tq7NVVkDsYRmnEbuh5/ql/vaakQvsYKv5qHLCFU
 DLxg==
X-Gm-Message-State: AOAM531Wg+TvJA4CTp4PNJZnqZMx8D/h9Nqd1N+c/zza7SfCv+prI3+d
 aRu9WhmXf1TDZRqRQ54qZbUW4Jfk/EdkOw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:7756:0:b0:492:656c:3b84 with SMTP id
 s83-20020a627756000000b00492656c3b84mr7372825pfc.43.1635976900343; Wed, 03
 Nov 2021 15:01:40 -0700 (PDT)
Date: Wed,  3 Nov 2021 15:01:30 -0700
In-Reply-To: <20211103220133.1422879-1-wuhaotsh@google.com>
Message-Id: <20211103220133.1422879-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211103220133.1422879-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v4 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3xAaDYQgKCO8nlYRfkjYXffXcV.TfdhVdl-RidefeXel.fiX@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k0wlss1RFFfd

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of write only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74..bc6f3f55e6 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.33.1.1089.g2158813163f-goog

