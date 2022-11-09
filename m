Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp384339ejx;
        Wed, 9 Nov 2022 08:16:44 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4x7MibwIxGT7SbtkOsCwEXy9QYbOtpm+NJMMyRiUMoAauWQPUNlGh6eOS5GxEyzo6m10/5
X-Received: by 2002:a05:622a:148c:b0:3a5:b66:f377 with SMTP id t12-20020a05622a148c00b003a50b66f377mr48210923qtx.125.1668010604385;
        Wed, 09 Nov 2022 08:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668010604; cv=none;
        d=google.com; s=arc-20160816;
        b=hJMWSWP95M/4TG61IgCzgamLpRI1ymktq9edqYTkbowwyux6LvYqTfBteNMp0gHY74
         jx9N1egMAFR4N9KDZU4QaKcGVK5o/+5+W0wu+GXUgY4Oe3fFzMoU82kR36ipEnGLMvhH
         24egxgfHS4CD3oCCHAAlVbFA1nxnrk66ch4jZvv0mBCRUVCFTr8gKPGHyudMaK+1TEMi
         iZ8qqdjLqqpcrMj7K9SC0Qpn8ygLoYwJj9tw9cFYyTgWlo2CttscpRHn2JB9PFZnrtvw
         MvpD/Elt3XqFHOOPS3hogin1nDJE5Q4LBDu2BT1mrZCPueHsjLkzBpk5zX9HGgutrLAg
         Omxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mWA6AJys5VSw6j1hmZeVD4K0mUdWBpZpgITkZq/H/I4=;
        b=iUUCWMVkObTVsfSeGScAjoMwRAXS4oFzLDQf9vvQlC6cck91l8qRBszLgin8FrIUQr
         BzcL4V1Cqy9cc2GMcd+NRADTjPMKiOxSSE4uZVLuHEdYqJ4JlXKpSjaTYy8v8cHgeN5I
         rueS0WmpZIRem+jwhe7K8YvauOmjr0Uyf7zeYPlqF3bxCQNFE1m9j8qIu5KLVGo4P7LQ
         NzUyIqAIppgI5QcNGVPkV1BT+rzKgszrMHi9YlvZ7Phpt1LPl9KWhzrIn6EpoZMvPUbd
         /ARofQ+9Dkp7njo1UowPkefxxehZt6uJUv41IVx98liBdleILhA0ZXSicrfoXW9yL7XV
         VK7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiLR7Nvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 137-20020a37038f000000b006faf0375326si1043418qkd.141.2022.11.09.08.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 08:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiLR7Nvi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1osnj6-00016Z-Nl; Wed, 09 Nov 2022 11:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj5-000164-1G
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:14:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osniz-0007hj-Cd
 for qemu-arm@nongnu.org; Wed, 09 Nov 2022 11:14:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w14so26493947wru.8
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mWA6AJys5VSw6j1hmZeVD4K0mUdWBpZpgITkZq/H/I4=;
 b=GiLR7Nvivm2qPa8n9N+rUAOCoyDCy/ZO/YWwUVbbSfvpWHF6zLluNOEGBtKI8femE2
 al9bD62WZN/Ce7zaZxwuSUX0nrcscgFUtMszswPaNuFaau516qmlZiGt+Yu/gOiBdwZp
 hlcvT8dz5Ue0qkQw9FVYzAQRyNSSOjNGxOFrP82mDCXTAyxZDAyKN0rkAgSiWflFnlOv
 l2fO/NKEFlqhQtLlGt2JycP+WteqxJGK/KoxfX3Lbvx6JZX1OJRWS1DpjdzAavbwByHv
 9hLAjy0tNwS6nSsBgZ/SP0s0i/hVOw1s6KslPwOet7We0rPck6uEJ8qe5JajvotGvAe7
 XTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWA6AJys5VSw6j1hmZeVD4K0mUdWBpZpgITkZq/H/I4=;
 b=ZsMSL2W70DcZ29wMLx+rwv5roCuHOvNp1HmJHB9OJf/wfFuZ7967z2IUGzVXs40VOk
 KiJGyXSLGPs+oRwPHCzjLrHgmv2NDrbMe1+UYn2+QvUZ6X3uISt9bsWdKipNEdbfRVpF
 zFms9MwEoFsutcdR6ZZra+/GDYyaMUhBZ17Y/KtpuuIJ7Uw7obAYtEZzZ9+AOHJueiM+
 et/TQJinie7jh0uZy4FzA1FpeaKltZKjHyePqlrJGtsPlVOuMoKwDjKWotCY+0hTKM9/
 8NIIERMdyYd785CLfingRHNV8wkZ3JEK20RIzsR9ZPehT7pasKn57aTVgzpGi1/O5A9k
 O1Qg==
X-Gm-Message-State: ACrzQf2uaubJhZC75pRSCiSjPNFkUCN6yOx3sU5IzjXf880N29ziBMW/
 pD8Y7Zr8qfguYpuTyc5DI4FbyNFCbhl2vw==
X-Received: by 2002:adf:fd0f:0:b0:236:e8bd:fd0e with SMTP id
 e15-20020adffd0f000000b00236e8bdfd0emr28433384wrr.288.1668010487605; 
 Wed, 09 Nov 2022 08:14:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:36 +0000
Message-Id: <20221109161444.3397405-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109161444.3397405-1-peter.maydell@linaro.org>
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7D5zm12vnbPb

Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
doesn't do anything that's invalid in the hold phase, so the
conversion is simple and not a behaviour change.

Note that we must convert this base class before we can convert the
TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
handles "chain to parent class reset" when the base class is 3-phase
and the subclass is still using legacy reset, but not the other way
around.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmu-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e09b9c13b74..220838525d4 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -526,9 +526,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static void smmu_base_reset(DeviceState *dev)
+static void smmu_base_reset_hold(Object *obj)
 {
-    SMMUState *s = ARM_SMMU(dev);
+    SMMUState *s = ARM_SMMU(obj);
 
     g_hash_table_remove_all(s->configs);
     g_hash_table_remove_all(s->iotlb);
@@ -543,12 +543,13 @@ static Property smmu_dev_properties[] = {
 static void smmu_base_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
 
     device_class_set_props(dc, smmu_dev_properties);
     device_class_set_parent_realize(dc, smmu_base_realize,
                                     &sbc->parent_realize);
-    dc->reset = smmu_base_reset;
+    rc->phases.hold = smmu_base_reset_hold;
 }
 
 static const TypeInfo smmu_base_info = {
-- 
2.25.1

