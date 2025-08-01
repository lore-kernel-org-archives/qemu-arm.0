Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E867C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 19:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhvMw-0006ND-VY; Fri, 01 Aug 2025 15:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhtjw-00073y-97
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 13:40:20 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhtju-0005mM-1B
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 13:40:19 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-31e41cfa631so2220542a91.2
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754070016; x=1754674816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxMOfao7mm3NljQf8heTfDhWODLVv1lGmwcvHpnTOOc=;
 b=GJmmGFV9omwVzpyRiMRTPGzOok9V952IXTxQnnhyICcIEjLBQvxVIli7sx8IAX1pMm
 GF6KmDaUlKBg7xwd6nNAQXbcO48HsiQg4b7JM4yliX+o657A24PO0RXHCe4/GWlaYKfk
 u9UuJ95FSrJr9srqF918VRJSX+UD2ZBjXih7zTzxQ/G27yJvkWnhforAcidoPKJwEh2r
 Cl70AiiWC1zSZ9Bo9sxEOViSIZ70bjpE6AzdLEdzTyTanVfLzs/auNE7KXRQeZK6O7vR
 hb/KU9RxvEyc435yVFXsVKEpx6sn/3B63Xe6xgDJkUzeFynwJIwRd8LP3RIn6dhWDNzb
 VD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754070016; x=1754674816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxMOfao7mm3NljQf8heTfDhWODLVv1lGmwcvHpnTOOc=;
 b=lkQXeESbMRJ/bXrXotPsaozH8glkCo98hBvYUxQjszRA8hncKPoXAQYOmMmo1lDYjk
 clKzrsV8IKdpQZq3/c+S/r4+EKANCM1FPd98gLl3J9ErPoGqrxFR27rqJRxzWhzjUBn8
 HBDZVd2BaVLaua/KLIPJpsnelwr//5k9fos0qaXPO6zSaQbt/xnqmqXIKoBTA7ppVWmi
 sYuR5jW85nKz8G9m1SA0om8uRICAgM5iUHcjMxLcoMOwjc5lWPduzCol66O3jMIIuPzS
 srP1w0iPUjZm2N7k3R8knTdwYEgNU0e6HC1PU49mVafc0UZRYgxJqJAaULS1vuKOLyj4
 d/LA==
X-Gm-Message-State: AOJu0YwmyPak2OxHHMTdqhq2/T+uW6o6DZPurKyOgV1csy3q5U7YzXUQ
 yyoizyaIfZwEp3BIUkpXaUSVYZaMgHUQYa/204z+8rzfhpL2vL5o8E9qEktJn13bFao=
X-Gm-Gg: ASbGnctP3fIfR4t4rzR8lPZhK2mxgjlltNb8L157A68Ua3kcCPDHnEs1/3KZ468VxBm
 jV0c0SYY3a7ZXhUgXb+WBzvHbgpMOF/HQ4C3aOO6bokLFN70IqRDxbncRmDLL2ARfJwr4rxAWei
 0U7BX4dT5tj2A2FeqSC0sjyG+MyyORBRXHkoSj+u3fNpf7/3GJQ0EXzFn6cav6pp3JCrFhONF2u
 3F3UjJEqo7klBIPgA8dZuIRlqR7NobaHXSKL6PVWmQXYfACKAvYVFQxa7ItnKfXvA99FukmwBL9
 0RKwUb/68V+qTZzs1dUBPWYC7hDGavRfBz132SUQyXRxvnDahrpUdrcQ+mP6MsjaLvFYlvMvp7L
 Krz0ZHF8r+P19ZNxIyuCfCg==
X-Google-Smtp-Source: AGHT+IHORpm6jJZdj1/15GdG01HdW4tMJNjFyK1NnbF+R95CKiSAGWIKZFyOPdM6NHZZyV0peHOl9w==
X-Received: by 2002:a17:90b:4c08:b0:31e:c630:ec93 with SMTP id
 98e67ed59e1d1-321162c733dmr795055a91.16.1754070015940; 
 Fri, 01 Aug 2025 10:40:15 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da6141sm7972925a91.1.2025.08.01.10.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 10:40:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 2/2] hw/intc: compile some arm related source once
Date: Fri,  1 Aug 2025 10:40:06 -0700
Message-ID: <20250801174006.2466508-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
References: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Let kvm related gic file out for now, as they are compiled only on
aarch64 hosts.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/intc/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 3137521a4ad..3efb276b6e6 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -38,11 +38,11 @@ if config_all_devices.has_key('CONFIG_APIC') or \
 endif
 
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
-specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
+arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
-- 
2.47.2


