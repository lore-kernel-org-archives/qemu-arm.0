Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp359563lfg;
        Thu, 1 Apr 2021 03:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFbssFV6zzkYY3jjDU7tCkWd5Ge0lhsfM0EWs0sa+u1W0k6WUrTZeQyECsLiNu0VE7iGz5
X-Received: by 2002:a92:c56f:: with SMTP id b15mr5916560ilj.41.1617273687690;
        Thu, 01 Apr 2021 03:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617273687; cv=none;
        d=google.com; s=arc-20160816;
        b=O/qGEZmBSwcwFIWrNf80jyNPvWQLl+OJVyeehFZSG1DopKzfWcAkh3gfcGULzET3DN
         r6uCf7pxXMPhmAtXl2Ax7x7iejyhTtt9QUOt597NLW3cuv529GlY3TweAZ1h5ozOy2dq
         //SruysLPOuHeQJsN079WTOkTH2Lrl/k0C3yw4PavRixtFljsVvRq8ss/gqaIkwnFZw1
         S/r3diwetXITELnfVn3kD0i5Q7+SqiwAm6odSqx37Q2k+gho6ccgP2yXjlGEAdV3RzNo
         5TpA4rig1DOUzy1Xl0fKeHMMBr2m/bimhrsgJ86zkzo+scSv1FPZSHXKe8Su7XOx2jOD
         U9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
        b=lgA6y1MjIFr5TYvnGryymqoKYTE/NrUJuBAI2c+xnRMyXMLkL7nMqbZn7P3NLwHgTS
         ZL2avjivg35iYaVc8Zanvyvv2SYjVl8m8SKtGwqjgvHiJ7a53D9YP5DvuiK/7MntNekC
         7zZW9SI1Z34ZkINkRL2WYdRVp81jZS2jb162GYcY7sQfSN9pwj2AzHng2Q4IPg/9+BSm
         3g/n7Q8kh8W16ZLz7SEB0IojMSqTJdg3Dts/eV1kPsQSiTWvwwfbhq0kieYoCESFnph4
         L1/EWmwgw/ArR1pJua2xEtWcyMHNHNqCrw6VqlN2iqDE5ViJc+z8Dc1O7JJTL09ULxXj
         TvwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dpKvgMHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24si4572295jan.109.2021.04.01.03.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 03:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dpKvgMHT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRulT-00074h-1I
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 06:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulI-00073O-GD
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:16 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:42624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulG-0002NK-Ov
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 06:41:16 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so1192088otr.9
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=dpKvgMHTPSzyIKbJhiri2sFTjWxsjGFao1XKwc+U6eEhNSxfpoO7HhWzqAGch+d7TV
 /A9rsjXl4aHUH6N4zrjhhZof+Kd06pyFSVBpgNl+Lj/FmlZtMxEf5gMQtAKGPk8Jl0d8
 NREr0VOGv4u830hUNq18l0SWNdEWal6zrLckKCUzNWlCCSqWgXvyZ9yCEVOoixnlLZQl
 ocG1uyHZv4AVKqJyHTjqKH38Oh2HsRdXp0UlxyqtNkM9XrtfoBf3EFQLlfapItdUJojs
 q3MLJIHDhZAAZkLPab0eGzG37trWEDyO5+sRrEUVIRn9Sir/g5nhLjwrWpnXdVKeANZI
 b/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3J/atxW6sPYnXqaJSp9SobS3v6A+MNQfu9eol6wNQ30=;
 b=kCKFEL4QCsYQ4s165Rbq82jtWYmltFp1oXdS5vlh3wEGM1cuBdaMYdwieGoD6SXs1c
 ANYdAd4SkdwxtOL+dkJhY7WzABwhXuAe8efz1Ne9wdblwvAPPhovsErW0d/hXHekIW2p
 EbwZNaRoHTGV62X04dDVra9PUdjnUKarGAXmvjhuBcEXDrMsGGezCeA6hfKYW7lTIvUv
 NSQCqV5hCeuiD3PILtZ5kqa6uMstx/HEO9q5EdCvyldWPQ93yPCI3roxlzVRvHKLhe/q
 42QA40knS6QGS9AARGE9qJZbMWu5NAIa4npoU56BLBrJOaUoXg6iJK0lkeCkphMe9Wdu
 8JjQ==
X-Gm-Message-State: AOAM530uJ2/IKj9844QboecXSWSSSQi0g74WE6viu7PliJBOpcocVZuW
 FsGyqpDyiCM772pqoLxYSb4b
X-Received: by 2002:a9d:798a:: with SMTP id h10mr6297800otm.170.1617273673703; 
 Thu, 01 Apr 2021 03:41:13 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:13 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/6] target/arm/kvm: Add helper to detect el2 when using KVM
Date: Thu,  1 Apr 2021 10:40:54 +0000
Message-Id: <65b8771bfecada08bf02c9cf87c2f0f9cdf943b3.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0B11DtbH0t9F

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   |  5 +++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..9cacaf2eb8 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -721,6 +721,11 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_el2_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..7d7fc7981b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -285,6 +285,14 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_steal_time_supported(void);
 
+/**
+ * kvm_arm_el2_supported:
+ *
+ * Returns: true if KVM can enable el2(nested virtualization)
+ * and false otherwise.
+ */
+bool kvm_arm_el2_supported(void);
+
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -398,6 +406,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_el2_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.17.1

