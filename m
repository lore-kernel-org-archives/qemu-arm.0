Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1151916ejb;
        Fri, 16 Feb 2024 03:05:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvCkkNwkDun76HclqPbY7dtlaatMGr1xsHKerOu1LYe52j1z8c6NLwzzpkevWBgc1ezPNrugR8AgMmo5KctlpXxKHonfgp
X-Google-Smtp-Source: AGHT+IEfhTrLCHgeN81PcQRGewT9hUx/stZgGW9lLc3nss68uac1WV0iLGhhB0MiXMH96GC+an7p
X-Received: by 2002:a05:622a:116:b0:42d:e648:e106 with SMTP id u22-20020a05622a011600b0042de648e106mr526292qtw.32.1708081532568;
        Fri, 16 Feb 2024 03:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081532; cv=none;
        d=google.com; s=arc-20160816;
        b=n/UgRvbsndb+GsDwdj+YOoXZ6n8wTnRQI4itisQaGgiGTCEgpK2pmXKk93jH8s6i5X
         9EuvuFaurokmXnSDa2aBRL0wl82BnO6GUnOTryZsZnnw+r19SGX03OO2hvzbNpqdJXMD
         6f0UOnuRHtjFHsjEBtlyF0UdSJ0jlG854t4GX0xotr9GKBe5cRg6lUoQB3hqeV8mV8+6
         45zB6WK/6XJo2M1OzswlfCy1/GtPkxvKN1LOUESClrE9/7J/kkoP3ROn0pHeDYXwx6wI
         8O5tOsZ8VsnSAeIDOvcNzWyWMoOf+QEulxHRJAZOffIAN8IUv31VMBTzhvFgtesKIjwN
         E0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wIiFm5Lc76s4egbopN+QwAc3v81IfNt4gHe1mB8rI9U=;
        fh=lo699SrpvFYJnxFLZ6omanT1M6xx54FOFadsij93CRk=;
        b=TUFTLD+Kxaw71RrCbBJ8Vr55UDsUEhxB79d+FzkttxaeFfvNyf5aa37efzFKvRr3QS
         i6jX4yMwjgPK/qqv+f/kToh2mT/muE6o5uGfLnxrbWlO20AS8KjL0r57wFP0GntVPhON
         kH82qQcgdN1UIwHe1zpRv3YXWGu+ZMuzEuqr9UjYNQS9qxzzrn4z0xyHckj8d2iQP1F6
         h3qkIpYXjORt7UaIvKHb/KwMWAQt34NgWjY6fl5yGH+R/hHzKZO7NwtJ3dPq5D9JpWEE
         031wk8TFsH/tO4LbjbKJLGEr/KzbVlF+f/7kG4YBdPeb787kspxv6Qw+LqsZaiVpMtKR
         kkQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKl4ls6s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26-20020a05620a14ba00b00783322de747si3629192qkj.339.2024.02.16.03.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:05:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JKl4ls6s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw22-0001L3-N0; Fri, 16 Feb 2024 06:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1z-00018G-8d
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:05:24 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1o-0001DN-6u
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:05:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33b28aadb28so1011301f8f.3
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081508; x=1708686308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIiFm5Lc76s4egbopN+QwAc3v81IfNt4gHe1mB8rI9U=;
 b=JKl4ls6s30yDphvgFJqbet/DnKLO6hOugNHjlqBQM4MmoyrzpXxtYqCz9RU9iLq0Bb
 wxxWr8TuJ1s8kz+aRFHPxFmQZxg0Ewv7/J62aaaKGksrO7Bw9nUxL4N/1Yr/UVXRI3QP
 x7ksVuHBMJ0mmXYDvgx8bvDKgmNuCV5Bwk/ZM6bUpVcOIBKW4LFvKa7sDsdwraNHeELm
 6vQysFkGoTrl+vurBUP5AA/THKiAx5FV8H5+qXIjp67ku1fqcXuuAOqwSbIbaNqR0BKO
 gnfb+qp45ne7y6GJLh6sOVYD1u37dTiEK/KJinW9BO3E7eVT+wN/AQG1LgJlET73ckth
 SPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081508; x=1708686308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIiFm5Lc76s4egbopN+QwAc3v81IfNt4gHe1mB8rI9U=;
 b=hkeFn8c5wuxPYK5M0Wb3NcI3TIWrWOOLi29qKTXAdO3bWln13I/JtyjVp7fdZmi8yn
 fKOeVJSti/ecyEC9FnwaznyBJTGUyQ5oYbc7eVcPM+hJYcA2Igjo++zpler1h0GXGS3J
 6yNGct4f5ApGF6KPIQ7kvXY0VpCs1KVLVqszpBov0YdJavMCMqZZINWU46y/bf0+KY3B
 hRZpyNEX8skSLgb+7QVUcK1SR/ZBxTMqgds7ugCSYnEdByeIKRdsdXTFCPAbMZ6Je7ka
 hZCWo5Fc+HMT8vP9c6P8HYYC3hjwG5iyUo7Z9srep9UH4uLuKlerhsg+PNxQ3bI1fjeC
 3OKg==
X-Gm-Message-State: AOJu0YxOL7F1luduFDSOyoHYjCUYN6jf7z6tBTvaaGriH8OUIT5XF8Tr
 88Qur1JkjOz4Xxa3jhVhJRMvevxqQFvSZeixpwmWIQgn6eP7nDySrkKH5KD9sPQ=
X-Received: by 2002:a5d:664d:0:b0:33d:157d:a7ad with SMTP id
 f13-20020a5d664d000000b0033d157da7admr1642262wrw.40.1708081507912; 
 Fri, 16 Feb 2024 03:05:07 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d40ca000000b0033ceca3a3dbsm1898621wrq.2.2024.02.16.03.05.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:05:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 17/21] hw/i386/iommu: Prefer object_initialize_child over
 object_initialize
Date: Fri, 16 Feb 2024 12:03:08 +0100
Message-ID: <20240216110313.17039-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 0GpKyo2P/5Hs

When the QOM parent is available, prefer object_initialize_child()
over object_initialize(), since it create the parent relationship.

Rename the 'klass' variable as 'obj' since the argument holds a
reference to an instance object and not a class one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/amd_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 7329553ad3..c3afbc4130 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1616,11 +1616,11 @@ static const VMStateDescription vmstate_amdvi_sysbus = {
     .unmigratable = 1
 };
 
-static void amdvi_sysbus_instance_init(Object *klass)
+static void amdvi_sysbus_instance_init(Object *obj)
 {
-    AMDVIState *s = AMD_IOMMU_DEVICE(klass);
+    AMDVIState *s = AMD_IOMMU_DEVICE(obj);
 
-    object_initialize(&s->pci, sizeof(s->pci), TYPE_AMD_IOMMU_PCI);
+    object_initialize_child(obj, "iommu", &s->pci, TYPE_AMD_IOMMU_PCI);
 }
 
 static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
-- 
2.41.0

