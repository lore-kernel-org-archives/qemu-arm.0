Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4792973ejc;
        Thu, 12 Jan 2023 05:52:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWhFpoxjTLjKzHY4MaX7hEt4YNOahxda64LRqq5PUlI6spfW1dbV+yv8gH72chpv/asJ33
X-Received: by 2002:a0c:ab03:0:b0:531:c116:33c4 with SMTP id h3-20020a0cab03000000b00531c11633c4mr49543409qvb.0.1673531566387;
        Thu, 12 Jan 2023 05:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531566; cv=none;
        d=google.com; s=arc-20160816;
        b=oI4t0+uonU6HPjUre9OekkowvGJF0oX8/g/JpHCPP0JRccNHGd5kw3OPkPvWy3yHc/
         QaCN/6xBj3wyBadL2NpzpdEwgcXO5INtFt35Fjuyvji/ISDb6KoePGmcgAfNL82k4PR+
         DqBicY8FsbgXWa0urfPyQT9wWjSqcNDyrn8OJHl82I91C12+vPiOU17sI+zlGaONh7WP
         l1YxIdTMScudzYG9v4Y6Br3Yq/5S6d4UmQv9WaikrFrCK2+tXzyHn5L1ReEdZyGJGkij
         wvU35wGtbkf5GpKpBIdQ4/9IfENTPZBvOoh4kuai6BuH1EmGlRwSHEcVb5hYml1eXpr3
         mY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5IPfWe8G+/qKGh7TbmAXHIxm1VelMnk3+8Z99FZRDSc=;
        b=OlAqOfxFyarcLoxwg1cUY+LP1DC2x1kVUuW4Qt47ojPrLmSCLblZaXCpLvLv9wY2hC
         vJ25rpbORxIFbEtvNcPJKe35JKiQb2XB8ESYWHEw31HeNTaKScrKYx5XVtcrnPIxWeVq
         TDxCGL6t2J9NkVWnVnlpewYC41vy+UFm/Q4vuCdF5a5IeymEVOWMCScQDAS2t5WAEMnO
         wlZkzEawh6G6H1m9w3Oq82X9OViJf3BbWE49RzK7wCshpak46cLZg+J2fL+knuOWI8su
         /2fjlRlnMBEgq9PNA75HS1Xcf4BPXGQdeUGpzmkPZ+LOtJyT6SZ/ubp1QnhZUZSxT/x5
         gpkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NN0AWuNo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id 14-20020a0562140d0e00b0053216803d28si10084460qvh.344.2023.01.12.05.52.46
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 05:52:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NN0AWuNo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxxl-0001le-Oo; Thu, 12 Jan 2023 08:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxf-0001cB-2P
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxc-00038M-Ia
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IPfWe8G+/qKGh7TbmAXHIxm1VelMnk3+8Z99FZRDSc=;
 b=NN0AWuNoPFDReKezcFSXHeUCTFRSKVOS2C90gs1qePxgv7Y99eF6/rCLZfbEH0Cdz+c2I6
 1NpiuXI+Ios3DX3rsykYV5Ox2YADShWVN6X9RwtHXKso2qPbUnT4LWO2c+DDf6/hw/Nrpx
 j6lX/HG3JQHrM+zPEAdL7SJHbzJm0hE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-SGyeN3NBMkioSguLy1fBPQ-1; Thu, 12 Jan 2023 08:49:38 -0500
X-MC-Unique: SGyeN3NBMkioSguLy1fBPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F393858F0E;
 Thu, 12 Jan 2023 13:49:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AED540C2004;
 Thu, 12 Jan 2023 13:49:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 6/7] hw/intc: Mark more interrupt-controller files as target
 independent
Date: Thu, 12 Jan 2023 14:49:27 +0100
Message-Id: <20230112134928.1026006-7-thuth@redhat.com>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
References: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QeuTBO3vN5cE

Seems like there is also nothing target-specific in here, so these
files can be moved to softmmu_ss to avoid that they get compiled
twice (once for qemu-system-arm and once for qemu-system-aarch64).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/intc/meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index eeb45db58e..ad8953f3ed 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -12,6 +12,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3_its.c',
   'arm_gicv3_redist.c',
 ))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
 softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
@@ -19,33 +21,31 @@ softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
 softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_gic.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_intctl.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
 
-specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
-specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
 		if_true: files('openpic_kvm.c'))
 specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c', 'pnv_xive2.c'))
 specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
-specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
-- 
2.31.1

