Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4793007ejc;
        Thu, 12 Jan 2023 05:52:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOaFU4qAu444w9lWJFAa1oAnMF8QWYJBTMtA51dZGDEYFv6pcc+L2WvVIY9YKogOfwkU1C
X-Received: by 2002:a0c:f8cc:0:b0:534:738a:a9ad with SMTP id h12-20020a0cf8cc000000b00534738aa9admr446106qvo.45.1673531570074;
        Thu, 12 Jan 2023 05:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531570; cv=none;
        d=google.com; s=arc-20160816;
        b=kkeE9FTUOn3Xy0rmI23vavL9v4M7ZbysW6KWNK37N/jzWD1OQJ35OOR8Y36SlJHkKs
         VYWaDE8EH9KBikP3WLgNYtlbcV5c6t46+RnR/FTOSEvsBzN6VtLt0HzACKQGK3u94cUJ
         LQyLPBz7I4TNm9siT1ts5CzuYja4EcIo6B0OkdGmGX4CfQOILJ8F+6s2P4OgIckIm6kQ
         Slw29fw29GIatjhZRFEC/RfXfOkTjAQ0IQOvgWm8B7gsMFa8DjTJsd4ZyUG7RP0ATGPP
         XdgJeFxLEjISjuoOIVo1V1Sf8AbNoQTzMZ+ChzYL8gFNMYzhP8Xnua8rKzGOXTEDoIIK
         M1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1KUTSENUDqoXrb8Lk8ln5lSj0uVJXRa4hAjhpEkVc1k=;
        b=0TPpMo19NXDaJys2muVaQRWL/JmV9uMsPwiQn2/q/ejae9/6sgOo0H2jA5p1JQVU9M
         1B4udCUbsXEwAr59wjYHYDMCmCb24xFN5jNgyfC4fCVry1YqoNVd5M8GxdV8Xldo6vT2
         lZKb8M0dGFFQDYdMlJqA+uMpAoGlkbhs/ogCV9/OzxOaFMdvXtfKa4+1eQsSrYptZwYa
         YnNHEIpxtrGrHsBRVqPzTl4WC5zHQBKvl+oWd1+laPTM5HYmnnyRVOVu70rf+BIbWjKw
         FAWSxbS8GeUx5EOPq8wypx1CwIxvHlit7vMrOoSOJMxVMrT7mhEvt+jbsPPbjqPfP+qb
         Cwbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oey4ZVIA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id gy3-20020a056214242300b00521dc1a214esi10500915qvb.301.2023.01.12.05.52.49
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 05:52:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oey4ZVIA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxxk-0001k7-V9; Thu, 12 Jan 2023 08:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxf-0001fP-TB
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxd-00038k-CM
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KUTSENUDqoXrb8Lk8ln5lSj0uVJXRa4hAjhpEkVc1k=;
 b=Oey4ZVIARU78xuAIo++X8sxbIbLbDqV7FXQRUMdnP9anoxT8YX1k0qJqXyWSL+ki/wXwDj
 mtA0QAsdBo+L9bL/H7x9flDxnjajnXD7YC1/AicUAfcHBD1S+KMX5pHH5Q0dAKO2iKfV+0
 rqvivKULDRyanX8aBSVqOcvwOWzWZ8A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-Nzq2B019O5GOMTlinKwguA-1; Thu, 12 Jan 2023 08:49:36 -0500
X-MC-Unique: Nzq2B019O5GOMTlinKwguA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AC8D811E6E;
 Thu, 12 Jan 2023 13:49:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49C1040C2004;
 Thu, 12 Jan 2023 13:49:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 4/7] hw/arm: Move various units to softmmu_ss[]
Date: Thu, 12 Jan 2023 14:49:25 +0100
Message-Id: <20230112134928.1026006-5-thuth@redhat.com>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
References: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fMTwkmJCG0nR

From: Philippe Mathieu-Daudé <philmd@linaro.org>

arm_ss[] units are built twice: once for 32-bit word size and
once for 64-bit. The following units don't require any word
size knowledge and can be moved to softmmu_ss[] (where they
are built once):

 - smmu-common.c
 - exynos4_boards.c
 - bcm2835_peripherals.c
 - tosa.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230110164406.94366-2-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 92f9f6e000..4babaa8dfc 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
@@ -18,7 +17,6 @@ arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
-arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
@@ -38,7 +36,7 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
-arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
@@ -59,8 +57,13 @@ arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
 arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
+arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
+softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+
 hw_arch += {'arm': arm_ss}
-- 
2.31.1

