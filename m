Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801843ejb;
        Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh5jzJ83rnZOLbFre6XjI+dGyJ7fWnXv054rotnb5l73jXjwnx7QKlidlMsdus4eT3BBle
X-Received: by 2002:a05:6214:da1:b0:66d:17:9059 with SMTP id h1-20020a0562140da100b0066d00179059mr22400qvh.64.1697750595337;
        Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750595; cv=none;
        d=google.com; s=arc-20160816;
        b=kKazbZCiTrGaGmO3LxGpsU/Nu1cGalAwrA2sPUl5OJc7VCPmZ8goLze15/BrepezSp
         1UMKmn9dRCfdTUR3akebM6nuCeb5lrE/lGPR5rStdpdoOs3f+pGD1Wh+VFOfsomFNaOw
         tPa4pfyCmVKE43NZ+U9OlCkBntZm2ElkLtM7kWbDz4j1iMCErUWwDsnoQHD5YeDwjz+S
         y9ANGjXPaqy9/67fa1Swrz4V3+mjcTWKvBi9VNLlL7Xfw2GLspRBqLJOaiU54F82Yc6/
         7Yq55bQhkWhxiguc/djkSOP/1VNiX4GzPKCllDnRSKP8pELs0UdSxIVPCCBBjl5GBcrt
         ZB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aKYzU30OgfdGXu2rSoeATSatQXWleg69ZG3hrJerNH4=;
        fh=FBj0K5mC/xVU5vbwfI5JGuw4cH8S5NcLcEdE+Lz7jX4=;
        b=s6ci6xIl92N3TxrfhPLS7gg861lpx/CbeUdSjdg27P8jH6v2Pq7ngNjJYlSP4rgOlt
         1k+S5bTe0teJtZRBYFa19LdTtJJxRCrNoeMJyKuwYkjXT6SvsNIeYyAv19+dYpHLmOOU
         PhjsDSDXKFvYz1taXk/XgsYFF5hWcmiQ1VtYcxasLhIHPNfUC0yq9WBJ+FFROWJZ86Ge
         PTsKXtRpM+YWIBWElRdlw6RCrlqYpSe9+Yu/hy9QNu0pk0xhiHwCwxBQs4S3WlxT4rJe
         b+vw/O7Thtc3XRA9Zk8IDk873I1+bU9qD8PvD+L05CHJYsGUM2BKEOfb9dBV5VIZDS4k
         94GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PlxEt+r/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi17-20020a0562144a9100b00658900baafasi361965qvb.609.2023.10.19.14.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PlxEt+r/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaRW-0008EU-GR; Thu, 19 Oct 2023 17:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRO-0007xw-Kd
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaRL-0005Wx-JQ
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083f613272so1067725e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750422; x=1698355222; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKYzU30OgfdGXu2rSoeATSatQXWleg69ZG3hrJerNH4=;
 b=PlxEt+r/svdMkbrxk8wG1+wdNwuVipLLJJXWHnX6yJVOjki844etI704Xdzno6KFJ7
 Jxk0tcd9zdirg7ncSjEPWFckJIoPKvBHRshPBTp7vLCOXAqekF3N5dHvSyxgVemtSCpk
 qo5bk/mNrG0Pni45/yLDVeD2+gEaLJSoxNUG4XD7jllqKFLQvmaD9sbpssyRnow7fOUq
 urIUlcX6zyqtvRrkENdhZ70E0C273L0l8cBdGVeC0f9VbQpnzX8Tm1RhLS5x+6/Cj9vt
 YIn1LZAPH1tG/gryuA5kEJxbl/bc4NoPXVEk/jBJv/RSKJkhcP7OX6b4yhgRTWfyrcWH
 Kz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750422; x=1698355222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKYzU30OgfdGXu2rSoeATSatQXWleg69ZG3hrJerNH4=;
 b=d9bUjyav7s0zCv1VHqa+ea5P3hPFd9f4tPwtaw6Xa7OYd0USIjmZFWI2waMtUeHKYG
 DHWResg9YAQS32wKFb83afST5nbn0cptAlX4L7XaC1UIqzkUMNsLgS5CQaafIeLPtig3
 FmdihGBW21b0ACECAbxwfDTHTlJOUMNK0FnEFvUv0mCrBFV7AZ2WurNNz4/3kOkhe3wY
 hhDK6sLPK+v7bXzpzY8iEd4HdVeAhUzXr5VGC66YioRn+edEMMb7I7jT85IS8RxU/2q5
 PKpQRWpRmcslGV6lDmV9aUEObAPhAodRKoCb2KdN1C6LFwzZGsAX8WVAI+mW08SkB0Lm
 rDXw==
X-Gm-Message-State: AOJu0YyUkaPOx+iCMwDyson9UURXAa1S4zvJRQTLEEzqGFeYUuc1c5X5
 89OFuVo843BIBN3JaJ4llnmoJQ==
X-Received: by 2002:a05:600c:3541:b0:405:40c6:2b96 with SMTP id
 i1-20020a05600c354100b0040540c62b96mr55632wmq.3.1697750422195; 
 Thu, 19 Oct 2023 14:20:22 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b0040772934b12sm5256785wmf.7.2023.10.19.14.20.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 19/46] hw/acpi/pcihp: Clean up global variable shadowing in
 acpi_pcihp_init()
Date: Thu, 19 Oct 2023 23:17:44 +0200
Message-ID: <20231019211814.30576-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L8k37Urz4rtM

Fix:

  hw/acpi/pcihp.c:499:36: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
                       MemoryRegion *address_space_io,
                                     ^
  include/exec/address-spaces.h:35:21: note: previous declaration is here
  extern AddressSpace address_space_io;
                      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20231010115048.11856-5-philmd@linaro.org>
---
 include/hw/acpi/pcihp.h | 2 +-
 hw/acpi/pcihp.c         | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index ef59810c17..ac21a95913 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -56,7 +56,7 @@ typedef struct AcpiPciHpState {
 } AcpiPciHpState;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
-                     MemoryRegion *address_space_io, uint16_t io_base);
+                     MemoryRegion *io, uint16_t io_base);
 
 bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus);
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index cdd6f775a1..4f75c873e2 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -496,8 +496,7 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
 };
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io,
-                     uint16_t io_base)
+                     MemoryRegion *io, uint16_t io_base)
 {
     s->io_len = ACPI_PCIHP_SIZE;
     s->io_base = io_base;
@@ -506,7 +505,7 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
 
     memory_region_init_io(&s->io, owner, &acpi_pcihp_io_ops, s,
                           "acpi-pci-hotplug", s->io_len);
-    memory_region_add_subregion(address_space_io, s->io_base, &s->io);
+    memory_region_add_subregion(io, s->io_base, &s->io);
 
     object_property_add_uint16_ptr(owner, ACPI_PCIHP_IO_BASE_PROP, &s->io_base,
                                    OBJ_PROP_FLAG_READ);
-- 
2.41.0

