Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4792288ejc;
        Thu, 12 Jan 2023 05:51:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/uJFGobULR0jozuQ2QIOE750rSq2GUdJFA1v4r//2xiHz0n8GCyPK4WaIzzNOISqW2AQl
X-Received: by 2002:a0c:fd87:0:b0:531:bfb3:7eeb with SMTP id p7-20020a0cfd87000000b00531bfb37eebmr8592014qvr.11.1673531499025;
        Thu, 12 Jan 2023 05:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531499; cv=none;
        d=google.com; s=arc-20160816;
        b=NlBa0hOkTYOz9fnZJ+Cw7omzem6Atwf3zj31UZuHErqgbNUDKz6FapANLZiqR1eFZv
         3G8zDmR+saJ72ZF4c3fOWtQGn/Olr2ae0ttImmkM9Bu2XIUyc7wc+XvLG8H+qrti3p91
         xqTdI6HFkBVYWSNH7oekOxAGyoRorC+1XagMh6Wg+HOdHIjH7RGa2lkd1t8jOaUHZxuq
         oRQReWzp+DCFKy+90X7zHx2K2008kH/6RsiwNpXpaEwhhyYJ0Yb9+h9hnjR/W0dYqMO7
         bN2DjcYXyEDiNL1wASnkwqEDMsWm3mI+zmSQCD+rukzXizVc135rzbssP6MDF2bcEUcF
         uNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vOQJFkscjh9Ma+HtAaeij+iWQQPW9lxux+5N19vSX5w=;
        b=e4CKOG52Fmtxweck6QVOnGpGC8hjcLfn6LoiA4r+PAcegePBO3XoaAJrui47pktuJv
         y6E7J9ZGPGQIkvUEaqITqjiHPrwvR2lHNwxZ30TW5Ld4hYA36Ijo9aVD7A6q33KAGHau
         XPOHbD8s1k9JqAA3XE2i6Atg7aQgPPp2g2p97NDfoSqbnKRx54jrBv7g7QUjlJ5IsBNa
         +F2XsMY5ntVnwgE6EUhVGVkBhV5s2Un0LqHZDBm4bzzSE0cGeFfRU+SbDPxthKqM+H8k
         whozrKMfJAIwVFzBaG//2h2XXxy6w2N7gQKd3YL3xoLJkptI21HDhC5bIqMgtch5ZGsm
         i6HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BfQgwWQd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id im8-20020a056214246800b004c7047c04f6si9959331qvb.127.2023.01.12.05.51.38
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 05:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BfQgwWQd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFxxh-0001fg-Sd; Thu, 12 Jan 2023 08:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxa-0001VM-Lu
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 08:49:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxY-00036K-7m
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 08:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOQJFkscjh9Ma+HtAaeij+iWQQPW9lxux+5N19vSX5w=;
 b=BfQgwWQdYipSNwSll3MGvzTbZLYizwYyrfNV8mHCQZppISLMfR9zL5iawg91o1UyEWSiT0
 pPK/1vgDD6Vrp7pV8RIL3ij+bK0RRq4ZMNVWqrlk11K/h4hfG2FEeJubNSlNgqLFxAUYvU
 O4zGZGCWWIH9XuYXCgCGd2vRvlTl/7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-u-LP_qjpNbKq6iHEiRhR5Q-1; Thu, 12 Jan 2023 08:49:34 -0500
X-MC-Unique: u-LP_qjpNbKq6iHEiRhR5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC488101A55E;
 Thu, 12 Jan 2023 13:49:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1563340C2064;
 Thu, 12 Jan 2023 13:49:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 2/7] hw/intc: Move some files out of the target-specific
 source set
Date: Thu, 12 Jan 2023 14:49:23 +0100
Message-Id: <20230112134928.1026006-3-thuth@redhat.com>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
References: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: qbOPx+TBErHl

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The Goldfish interrupt controller is not target specific.

While the Exynos interrupt combiner is only used by the ARM
targets, we can build this device once for all.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209170042.71169-3-philmd@linaro.org>
[thuth: Change patch title, and also move 'exynos4210_gic.c']
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/intc/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index bcbf22ff51..eeb45db58e 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -13,6 +13,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3_redist.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
+softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
@@ -33,7 +35,6 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
-specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
@@ -60,7 +61,6 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xi
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
-specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
-- 
2.31.1

