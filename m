Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4668629ejc;
        Wed, 18 Oct 2023 07:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3cbHE2Cc+TsjNPYjwtE8tgORB8OXB/AvHiBvLyTQz6w23nfIt9F6qqbYOThKJ5qxgYrg1
X-Received: by 2002:ac8:5704:0:b0:418:111e:790f with SMTP id 4-20020ac85704000000b00418111e790fmr6462578qtw.65.1697638375725;
        Wed, 18 Oct 2023 07:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638375; cv=none;
        d=google.com; s=arc-20160816;
        b=gzQ+S4crFwI6zDNcnXWoCCTMNX2jUbOCqkW0MmTvUa7ABP7qBRRlJdepWbDWYkv/dl
         gve4OWf94k6eVyyBD6ghlXIPbchRuCG5nzp9lOgS6+2rxgF0tPttasAb1rFkmjVxV0J4
         SgOOfJ7libQnlYSu7r0BxNjQK1BvQc6CMkLBsJTofEAL7WFI4ztBEKyuY5qekqXMmzK1
         6mYThCTsweKom971fveW1aZ+U2E6P2/DKvD22Pmgruhfaerw3f5BMxUpTo5OoqzkCB0S
         SqxYhm91BftwVqdTcxwm8/KzTNinyN6aU9ocXYQ9sbkUSGDpC632Vk/73XCBxEhN2EH/
         oc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ehToEO0OS6e+ZoKHCVyGegzWxdjPGpE7iPcfW8fCv8Y=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=IZUX9EvKgmBvFGjyKjE9XN51M9fOe0GdhosZUxBzT1pkIeNp2eCHL85P66/79meIU1
         JQUH7RdWWUa1svrh9WIm7t5ZqzYxoSobbiJ/zx/CPxUqpBsbs0TJ/SCO3k1VpgKZtOYo
         6AaOtuz3zjCaT0MRrBkBX+dV8YR8oO8UK5f4SDxHP6iUTFE1szqGF1EYwLEjnfwzZ13N
         39A7RW87hBZd7st2o5MVbfzZ0WJ5IZLNetOBZ2RTmVpRkEYei6RZou8YZdi3wKBM1uth
         ZN43UL1arVh5qGoBq2bmNjLOIreW1m/exezXtL97oGbfYKU72FiT15HgokSWE4Er3Cuw
         A3Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRyJI27i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020ac87610000000b0041cb481b946si1988452qtq.389.2023.10.18.07.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRyJI27i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7Hc-0006aB-18; Wed, 18 Oct 2023 10:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7HN-0006NM-U1
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:09 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7HK-0004lu-RD
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:12:09 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9be7e3fa1daso728829866b.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638324; x=1698243124; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehToEO0OS6e+ZoKHCVyGegzWxdjPGpE7iPcfW8fCv8Y=;
 b=PRyJI27iRVjAL4qoajKCnKH4BOcJr8fFUCpFwhYOqsvClwaQzGSUdFS3AbG9UmcezV
 wy8WSi8x2FlR4WyaqRo4IIHcxR5wkgZyr09v4tAeWx0Xvx419wULGrpxPRvgZbs3cTVr
 Z9vEaTgA0xzYzeaPNVuKR/08G98yc16/OaIMnc27KpetuJQnB65Xvh4NMN4OZHejCcLY
 KRkAHTFHOZ1rjnGaio97xvX8+vQ8vqXQSnG3fMVqPP7o9GvCEFvtVdQAA38sYP5u2zKh
 AwCjCJVQccPObSWzFiw6iGepsZMafTo7+wZWV5GdTLiREWtApDFalB1/RLHv9kNh4v0N
 F/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638324; x=1698243124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehToEO0OS6e+ZoKHCVyGegzWxdjPGpE7iPcfW8fCv8Y=;
 b=pVoDQgmR5AKDJWTt8608S1h7Q5l3JQYC8D/Re0f5qVMsidr1emBA13FOV+Gz+fRK4B
 QzQBLrmLZJGmR9B3l2Z2jdbjmp9I7SX7FjhEPppLQqWJiaaNcVzdyf1WmSxH0ORWUHmk
 QnCERklMbcguAbAFwJMIX7fTlhwsf8+7TTrAJ7WAN/I7gD1zZnMK+GsL9lrzGLVJDfWP
 LMTDGgfMqlK8zlVYBPcrfgGndVXTJgOjCG5oHOE1SIk70+87UWgGg4qFrKL3gRxpswsQ
 gVvUCaLCh71VQIL365QAd+yOCXNd528v6F7QWW55lEvmif9ATbnZN7OakCwA9vp6S2Qm
 JvRg==
X-Gm-Message-State: AOJu0Ywf0M+ruSDtGUi8wIuxygokepY2JWwQkze4r2/EMD3XqCtmRITb
 ziGhJa9mr4/lXOK4MMI6H8Liog==
X-Received: by 2002:a17:907:7ba0:b0:9bf:20e0:bfe8 with SMTP id
 ne32-20020a1709077ba000b009bf20e0bfe8mr4137350ejc.9.1697638324267; 
 Wed, 18 Oct 2023 07:12:04 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 j26-20020a170906255a00b009c503bf61c9sm1746799ejb.165.2023.10.18.07.12.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:12:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/12] hw/i386/amd_iommu: Do not use SysBus API to map local
 MMIO region
Date: Wed, 18 Oct 2023 16:11:39 +0200
Message-ID: <20231018141151.87466-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: zg80Ia7qqHXx

There is no point in exposing an internal MMIO region via
SysBus and directly mapping it in the very same device.

Just map it without using the SysBus API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/amd_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 8d0f2f99dd..7965415b47 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1579,9 +1579,8 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     /* set up MMIO */
     memory_region_init_io(&s->mmio, OBJECT(s), &mmio_mem_ops, s, "amdvi-mmio",
                           AMDVI_MMIO_SIZE);
-
-    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
-    sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, AMDVI_BASE_ADDR);
+    memory_region_add_subregion(get_system_memory(), AMDVI_BASE_ADDR,
+                                &s->mmio);
     pci_setup_iommu(bus, amdvi_host_dma_iommu, s);
     amdvi_init(s);
 }
-- 
2.41.0

