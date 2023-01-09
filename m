Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2111913ejc;
        Mon, 9 Jan 2023 01:28:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvOeESHkSuChRtV+8is5N7eiXP8fwkZwpSkzgaUIBVtXpj9b69CkZpmqxdrkGOlIR6fqm70
X-Received: by 2002:ac8:44d4:0:b0:3a8:11ab:cacc with SMTP id b20-20020ac844d4000000b003a811abcaccmr84470211qto.17.1673256519195;
        Mon, 09 Jan 2023 01:28:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256519; cv=none;
        d=google.com; s=arc-20160816;
        b=qWg1hyzyE3+9bORDGolWR2iSKWGNZsyt1/JiVfpC/kaKpLwC28BRQgTXd13W5/uj1/
         IFnDMZYquAk0DyQgAmtVYxMsgJb8SkEvp3b071Hfr88K9dZfiwQ67AuUVwih1Y/oXKuD
         tIZuN1Ihdl6KBB4z2ELt3czLLAUDsFZgCDNy5Zl3cXRwZ+vjHCz0a03fBcr3gHuAsPJX
         VGgkH7VER9x6oxcNU9eYavl9dk53si9PuZvSrmZt6EN5OHVBkzGfTD/BvNYqzRhKfLYS
         TrI2LDczoVPzIpVfipm/ZlT9huVDfsvLUFYce3Eu061xDLH0UidQj1pa1sUaRAOA/Tz8
         3IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lSI1q8Pr7ikyNEHE0ptbDijcSvsZa7X5vhrpcvBH7wI=;
        b=dgbdiOVqA9pxydgpj1tbD36bnVVfv7eBMlkIaU1Qy4+jjbj36gt6Vh02nCYt6KiDev
         dHsn3X8WAds8XhjR4TsPQFCVKqIlCbt8OvuwhKUunLR1Af+dW0kV08aeSZBh5JFFtb1K
         Q7m8ZMdGgcR32BrbPiV9N4xDa9M/kc80/lXJjzsm7SFliy4w7mdXvAdXEqCF9JXYrS8d
         SIRMnyNycXRlzDpFwkOOynZZA3UTJR+PgTHNLh4+M80ioBJZCNCR+NmNz+JeJ5uZIoG4
         8BgbtPBPLWLs6T7c1Frtilbjj4I3UvxWNJgc4XyANjdeHFLQpWvLdmKzEQyPyhtT7nWn
         78ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PupitDtL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a05620a424700b007023a700d33si4259302qko.617.2023.01.09.01.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:28:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PupitDtL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoQw-00048A-3z; Mon, 09 Jan 2023 04:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQu-00047e-65
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:27:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQs-0005Zz-GC
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:27:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso3140826wmq.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSI1q8Pr7ikyNEHE0ptbDijcSvsZa7X5vhrpcvBH7wI=;
 b=PupitDtLY7UghG6gW4N1I7E1STzB5G8pOzgskfDpFcRYuZwfJe8ZKSUTyleOJrXxUC
 26x+hvdXdg4GUermlxOi+IbsxnL+REoNdkcETJ+XzA5NuqwheVrAd/QJ54m25LoxFmvQ
 X0UeQDajIOU75/tK/D7e6s+PmgAMpoVinxtPmI04UeYh0VjXTMhdUIzvQid1Aoe+QPCe
 hpU0DEqefpi2wP0r9bq/RrvTmZYvjgQdF9AWfUkh9+99o5NrqrQWYeYTY4lJAGCJsS16
 ygg/+niSmnveo3hvClsBNEyzLOX1opS3Xt2s9qGXu3mC1y46k9cGrfUxvaSG/s7mrSgd
 M7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSI1q8Pr7ikyNEHE0ptbDijcSvsZa7X5vhrpcvBH7wI=;
 b=Mky4V5k5VFySwVnYthDxtdIDLdvatTts/IOnqxS7RCF5rsPkV9/rlQX6mLq16Fdaps
 Jxo6N7BIqNkzUeIe9YastNECnBU9n3Ioc4YXR+9eis9TF7XRVCokPSKgd2j0ob4BhOlY
 9D4FF0hutNbgyku9gyXq+p40zIlAcpwCdPMQOyOHF8Ad9tvxUNz0DcYN6xNfEcSFpQau
 PMLYc1RAWcTbMtqM2BcvqEt9OPKKFGAkits0uhPegIDhwIYn25dKnmNHRHtXXtkuWfGu
 2ddlYcfQ7QUIwDFRLji0ScRyOBEZu4t15udRFOhXh9LXQiGyT6LGTM3uIPEhVe9y/sZb
 pLyA==
X-Gm-Message-State: AFqh2krg4Rr7/UwY7R0ky6BnMbkudCycescp4UKVXTQh6WomurGCDVUd
 4EU1X2ejSWNB92Jyg8XwjBWTHQ==
X-Received: by 2002:a05:600c:1f12:b0:3cf:8155:2adc with SMTP id
 bd18-20020a05600c1f1200b003cf81552adcmr46860643wmb.33.1673256425207; 
 Mon, 09 Jan 2023 01:27:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1c5403000000b003d35c09d4b9sm15151704wmb.40.2023.01.09.01.27.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:27:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 9/9] hw/i386/kvm: Convert TYPE_KVM_CLOCK from SysBus to QDev
Date: Mon,  9 Jan 2023 10:26:17 +0100
Message-Id: <20230109092617.80224-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: zgp/TEe83WY/

Nothing in TYPE_KVM_CLOCK access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/clock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index df70b4a033..da0984b5a0 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -35,7 +35,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(KVMClockState, KVM_CLOCK)
 
 struct KVMClockState {
     /*< private >*/
-    SysBusDevice busdev;
+    DeviceState busdev;
     /*< public >*/
 
     uint64_t clock;
@@ -322,7 +322,7 @@ static void kvmclock_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo kvmclock_info = {
     .name          = TYPE_KVM_CLOCK,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DEVICE,
     .instance_size = sizeof(KVMClockState),
     .class_init    = kvmclock_class_init,
 };
@@ -338,7 +338,7 @@ void kvmclock_create(bool create_always)
     if (create_always ||
         cpu->env.features[FEAT_KVM] & ((1ULL << KVM_FEATURE_CLOCKSOURCE) |
                                        (1ULL << KVM_FEATURE_CLOCKSOURCE2))) {
-        sysbus_create_simple(TYPE_KVM_CLOCK, -1, NULL);
+        qdev_realize(qdev_new(TYPE_KVM_CLOCK), NULL, &error_fatal));
     }
 }
 
-- 
2.38.1

