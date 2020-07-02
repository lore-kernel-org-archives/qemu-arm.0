Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1377112lfm;
        Thu, 2 Jul 2020 04:16:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyogYfbz6mHBq/DrMrF/cJhVoiIMVZ1E8n6d2FlUrRkpuBcRLNx+kKIEnF2Z2Ki22SITGss
X-Received: by 2002:a05:6902:1021:: with SMTP id x1mr49059660ybt.464.1593688569583;
        Thu, 02 Jul 2020 04:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593688569; cv=none;
        d=google.com; s=arc-20160816;
        b=jBzQDaE4N6QVKVPleF4OLrjk8sxEQcDimujmThxiwGnGk/q6CtZWRXgRxVat/wYRF8
         YmpkzdW4WiOiYfbAkXfvEP1gnque0lTGc2Xsy6L998fiLZiatk1aNma3kyIPjYVyoqgk
         nRc3fQUzWQqiSTfLJx5QLqAmhbySXYXmeHinyEJ4UnYPXAOvRV3s2rotvDxdT6TpQXix
         cSPApn/oFShtpG8DSrVR8kgwNnAe3XXXpVPUz4NsV9IJl7YI1fbKGdfLL9eVaiNiHqTI
         Bf6yZ3+OQ6gvc7wMUG1fqd2JkCWBfgnJoQKWr9qb8eu2zv4LA+O62NLZKV9aSfkkeBRh
         n8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HCxxtboNDokO4Wc9tJBfsrGFpSi3z796NZHR8i56lzI=;
        b=NvusALi3NNGxIzpaAmaT0Wf8nBZvIWn1HlfLdVh4Qg27F/lknNljSqINu2tL8A5hyK
         7MLrvUL2l/JRxa9cEy0AYdScghJl1dloMqkbL/tq5qJ/gL07ChpsiveynPvdlUZyDFob
         5UnQhj2egHC5Nru7T3FCIGkO9+3093nep1r252dA+CmkBuRMB/ZNFmz03bvdzkuABrxb
         FyvwE2s45M5N75ZX5D3SJwS2AU4vK5hMuMOMW2wgwdwLqfj5zxwgbkFe4mn1MJZGRC7x
         ylQwiOw+rgKSptsc8VtyWwuR/vk0B8ihcEmNQ6Gdf9CGfW1HfQzfGdl61hX/JIaN+aHd
         KDzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pgf5dx4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si8185108ybo.273.2020.07.02.04.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 04:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pgf5dx4p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqxCK-0001Ze-VR
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 07:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx6G-0006ri-AT
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:09:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40955
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqx67-00010i-IR
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 07:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593688182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCxxtboNDokO4Wc9tJBfsrGFpSi3z796NZHR8i56lzI=;
 b=Pgf5dx4p9CH41fZaXmTEGmdz/Vpq/J+KO9LQKYntk9xppntPfg3uC5yO97I/rhialcMysa
 RQ1ICGBOpo+IiUB7IwxyEzP9ysQ2FAMMfB+l7qGYDhpd3PT/zOS1TlRAiOsnOA4kcLTeSm
 iwDd7XVcBhZb6v1N6cR2cYan1yfiz8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Na_dhdWNOFOC7gadiE9e5w-1; Thu, 02 Jul 2020 07:09:40 -0400
X-MC-Unique: Na_dhdWNOFOC7gadiE9e5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150748015FA;
 Thu,  2 Jul 2020 11:09:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA708741B9;
 Thu,  2 Jul 2020 11:09:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 322E01138484; Thu,  2 Jul 2020 13:09:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] arm/stm32f205 arm/stm32f405: Fix realize error API
 violation
Date: Thu,  2 Jul 2020 13:09:27 +0200
Message-Id: <20200702110931.2953148-25-armbru@redhat.com>
In-Reply-To: <20200702110931.2953148-1-armbru@redhat.com>
References: <20200702110931.2953148-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: woQIUMrUfpnF

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

stm32f205_soc_realize() and stm32f405_soc_realize() are wrong that
way: they pass &err to object_property_set_int() without checking it,
and then to qdev_realize().  Harmless, because the former can't
actually fail here.

Fix by passing &error_abort instead.

Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200630090351.1247703-23-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stm32f205_soc.c | 2 +-
 hw/arm/stm32f405_soc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 19487544f0..56aef686c9 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -154,7 +154,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     /* ADC 1 to 3 */
     object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
-                            "num-lines", &err);
+                            "num-lines", &error_abort);
     qdev_realize(DEVICE(s->adc_irqs), NULL, &err);
     if (err != NULL) {
         error_propagate(errp, err);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index c12d9f999d..cf9228d8e7 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -172,7 +172,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
     object_property_set_int(OBJECT(&s->adc_irqs), STM_NUM_ADCS,
-                            "num-lines", &err);
+                            "num-lines", &error_abort);
     qdev_realize(DEVICE(&s->adc_irqs), NULL, &err);
     if (err != NULL) {
         error_propagate(errp, err);
-- 
2.26.2

