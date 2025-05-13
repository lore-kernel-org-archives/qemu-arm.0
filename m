Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688828njb;
        Tue, 13 May 2025 10:49:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn6LRpMzJGyq3QqepiTLuWcT9qs7RexG8IfP7yyhW5Ff/CTZiKdL2FIrv5lMgODkFK5V19szsAL5FGPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFG8/dLKeKvxt4Y82MLb0uCj/aVV7tYC/cCTzQUu0aVi4E3m4uH8yIAa+UNqT/sjUU9cG7P
X-Received: by 2002:a05:622a:17c8:b0:477:41f1:285d with SMTP id d75a77b69052e-49495cd3561mr6204531cf.19.1747158552072;
        Tue, 13 May 2025 10:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158552; cv=none;
        d=google.com; s=arc-20240605;
        b=E3z/mKfIKNlYBBwwvbC4EzHaQSdzifrj4MD9ko3YaMQVIFUuB39xgGdSgxzJz90UAL
         4wA1Z2NSmibvqzvGSe+KON/q3+IweNfUqz0Mq7kpbKU94lBKpMLht4wIP7H6UqyPp3Q7
         2bVSWkrA+T2QxySdG6cnmA76noRpVCZ1Jsn7RhxU49uoc12GPJfL1VEmxot2Guj8zU0J
         bwfrstkMxkOa+9r6aJaGrw6gNA+wbJoXjO1hRcNoPXMBjtVDcwt58REZGB+ZVzmo3sSs
         js2rGMAHdn+yTrN3vkWmpGpuUNqR+hC91kBb2t4yezlRbJAah7LBVHbuPIWPAZTjZr3m
         Iexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AdJyj/3YunQPgnoavXNfU5+nphnaMTFTvEkxD36KHXw=;
        fh=Hwj35q3gEvHWOOQ42ujcvwo7tkyd0tze4NwQBLEr5HQ=;
        b=D2MWa8xMV69Pt5itw+965lJu82exvTPGkzLbo8/vChWyzesbi2Yv1GbQ/VSrSnvfQt
         Lw8PyOuhuNP6YotWQ5r9lWK0DUueMnic6r+MACOkvRP/7stWIfE7xXjNJbIoSJRtHYQp
         USGOIz7IMz8RKHigQE8/gBi7Nhc0wwMijeuPcCQDoDRTO2P2s2bCIz7jlDC2XhqzuNMl
         uXc5ZAKrfosiKeN2LxPCe0uhT1KcgUk0jQfQf19fSAYkxV9axaN9vgJAd0C3uW89jH+w
         R0vRpXHWz5upxzfKD08qQOTSYaMqj/geM44xkH4WDqHhuXGnvaLTQDnB2FZs1zsD2KdG
         Fh4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WosqhyHu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945255d89esi121593731cf.237.2025.05.13.10.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:49:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WosqhyHu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtkU-00035f-TL; Tue, 13 May 2025 13:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcp-0000u9-9x
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:41:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcl-0003Ri-39
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:41:05 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso60988135e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158061; x=1747762861; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdJyj/3YunQPgnoavXNfU5+nphnaMTFTvEkxD36KHXw=;
 b=WosqhyHuTW9SZYrhIMsj2t/V8Ky42HEyYP5a0EAvkvBeiibBd4434yZvC+O9mJtCgu
 8Uj+kui23PYh2By/90bOgN90II4s5nJU1GKQ0guJ7Z2WnG8NRmVZ1MPDKcYd4m0dv+2C
 WOPo/FDLi6i5Y3dgkyokVFbGEhJ+Kfw11s7luwCwA+VREuJGZLlcGcbaKUY/FKayZ18q
 9V9b2OruUozHSOJXN1GBbQwwRjUvijOU8jBYJZOnaQw3g0bhioiaRp9/WMJq0gAP+wdO
 cd3PqLdajaSJaWhr7dOjqfOoLiRicexGcKHfHrqev2l9r2gRjaZy+EzgyQJrOKNgK8ip
 dK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158061; x=1747762861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AdJyj/3YunQPgnoavXNfU5+nphnaMTFTvEkxD36KHXw=;
 b=wvwVKidWeOUAm2Ro1H7iQO+lu/Qj3/8+NcxMCJ0uE2Pl+a+fHu/AIzbwKOem9VvmXd
 qecsI5TIAaU66GgcLbQolRcrJDQONRrvG0AERPbH2MSTjxN3ycohT9ecQ/Ye4MKHTAF1
 Ou+zMdizMjo8KBVJHHAVbh/cXrJRFjYPgHxCLjkHzR9fZVU528aHEAIIdwopf6rf+Vmx
 fMxBZsxrcMiYVoWcf/YScOrzvhrlQn/sYJ4GWJ+S+Qp86MNAByGAG5uIaBLC14wTL+KJ
 lbwBmRlX3rsXAW1U1FqtQhaUYg75UtVmrVaqjwL89mBr8xq/mRGp1dXW6TN58DwLZEA7
 kwbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsH5Xvf8lHapwi9Hf71AopAU8Xf1vPR3+vBodr5mKvwVCsZikezNMNxmMnFOBdNfV9pbyzuKAI7w==@nongnu.org
X-Gm-Message-State: AOJu0Yz313YrorI+QcxHuUAM1VXA2ZtrKJweXGnjv7b9ikbmCxmQwOwb
 3gxRl9/EL+xwUk5PVIKYHAfMMzq/S9ijruJqxry5Z/VQoZqm67Gc8Iu+JWteETQ=
X-Gm-Gg: ASbGncvyPOyOm0gM4ctcjh0Smrhc36yzMHRMRNds8So++yv/uYAuP+W2pM2xGcvSVYJ
 hPLVnV7Q3qbWPxocpETYZufHrmzMx/z4zPlxUDrut+xPwgN4Ma7mZNAxrqrx4zTgx2EcSIaJeIL
 OLjilYyl8nZR1iWFFKAmRaoBZ0CLiSq3m/pHhrVB9OMIfPpCiXDsaz8MHlfnWAx/PBPpArCUCAu
 H08dIJB4LJ0VXRmLkQSHH7ythT6kP3VrnTmvcGHF2aDFN2T1Me4IRfMyxZXdKmJDst7NOyZZPDs
 WVLV0lN8b0QyRAAmFPydoZkvLVvKW+nYG3VB1S3i/hgsJYOCDks0HoSbq8An+bxtjHVL/TZu110
 Ejiq1LULA/xcrO6T2GmucT33Agh43
X-Received: by 2002:a05:600c:524c:b0:43c:f597:d582 with SMTP id
 5b1f17b1804b1-442f20ba9f0mr1823085e9.1.1747158060572; 
 Tue, 13 May 2025 10:41:00 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f194sm221374605e9.10.2025.05.13.10.40.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:41:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/19] hw/arm/virt-acpi: Replace arm_feature() ->
 arm_cpu_has_feature()
Date: Tue, 13 May 2025 18:39:27 +0100
Message-ID: <20250513173928.77376-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: htyZ/Dm5IEgk

Using arm_cpu_has_feature() instead of arm_feature() remove
a dependency on (the indirectly included) "cpu.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/virt-acpi-build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 20dc93fbc54..cc4ec7ad465 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -58,6 +58,7 @@
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
 #include "hw/virtio/virtio-acpi.h"
+#include "target/arm/cpu_has_feature.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/psci.h"
 
@@ -693,7 +694,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? ARCH_GIC_MAINT_IRQ : 0;
-        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
+        uint32_t pmu_interrupt = arm_cpu_has_feature(armcpu, ARM_FEATURE_PMU) ?
                                              VIRTUAL_PMU_IRQ : 0;
 
         if (vms->gic_version == VIRT_GIC_VERSION_2) {
-- 
2.47.1

