Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp325746ejb;
        Thu, 19 Oct 2023 00:18:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1PNG43uUXKCez1yCoTeXoMefy41vo1qwSUqBTVkq41g3uPBUjOmGDHRgUo7N4IByoJ7xn
X-Received: by 2002:a05:622a:304:b0:412:2ad4:da05 with SMTP id q4-20020a05622a030400b004122ad4da05mr1414007qtw.38.1697699930799;
        Thu, 19 Oct 2023 00:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699930; cv=none;
        d=google.com; s=arc-20160816;
        b=Tg7RZ5NzDQwr/SRWXyZ9FwelULOcnH2qKkW361VGWmyFWL8XlnLmyvMPKHbKxFNeqr
         iM4ZpJ2fdU6egfavTSurJJjA0m5/ZZuYfEsmI2WK+InJVc6hh2Wc7q/JPQWAMqFNSuHE
         ZPARbAjI0Gbn8+Dm4ZSCvZPDTlYxG8vfQj8oHFY7clUASl+yUk5uvORn+Pwo8gjDRHkg
         IhmyqEiFiB9tWDc/ZAzOBMYci/F5fCKaxi+oyouWuHTrNGwfR6VC9F72EvCturu3Nlsi
         anCnx1wYJNKlQvu9f3LGtA6XDDjN4tOelocFMovtIfWkbTOnm0DekxYQ+0EGPZ8oCIos
         6SoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VOvC+JkvU7gWETYwa7wI+/RczFUNZ/p1uyKYV90ynnc=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=Y9ClFbZGa2GAMAgzEsA5O500IInh210rp6UOJU/bVupXM/Sx8SRexIqNwuHOcfugQv
         WWSStqoCXrwOBme/WJ7zDorX0XldVNC5cHaeVpvk0HasoBe6wN4KqYXPxi585M5vF9w3
         qbMOOsXJqmaDwl9EY6AedYPtxKOHZ8VSQ36Ou7Fr/prYEm5LOjuufkMWkL+VTGj+9l5M
         QFW8au6GUG3tJ7MmKttPnDTTYgOU2+GOXwbdSF4V/rqEZ4j18o5QIa/E80tVqiJ/tXfG
         QDS10CyDjFmXXwZn6UcBzcw+9xQ/H8pKPp4UQ89oBGrjZCNsdB9y+BO270BXMhQgqVcd
         2qmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FX42EUgY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020ac85c81000000b00416547101b3si1132871qta.720.2023.10.19.00.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FX42EUgY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNGn-0004qn-Jp; Thu, 19 Oct 2023 03:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNGi-0004pj-Fr
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:32 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNGf-00039X-PS
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:32 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso10557735e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699788; x=1698304588; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOvC+JkvU7gWETYwa7wI+/RczFUNZ/p1uyKYV90ynnc=;
 b=FX42EUgYGnz64T4a6ETBEonvlxQ+wSJEokfTz2/Ct03NP74jOP04yLpc0Vqi9x8RVg
 GJAcR6izmRcWU+h8ApoN9KvziRmhi47x18Uiso75cXAt+1VqYydGu2b17Q6GB9Letp/O
 8AxOyTVrOsAuTvAp+FHRF/IbWMfFWNkS10mGPtlJF3N3CDWqpkBqmRGZ5nwoYQBqW08m
 N9io0GOvDGB2bJ7YhqiT/urbPMiyW72zLO3nQWFxA/b7dkecNbbI4o6WswephuEBBNqe
 v0SFiR2cQc1/BkdeUZdpX1ryn7rgiAEzK73O5tVvtv/Zl2VpNvv/7PbSrjMTGtj2/pDL
 V4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699788; x=1698304588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOvC+JkvU7gWETYwa7wI+/RczFUNZ/p1uyKYV90ynnc=;
 b=dYJ3PA9ZmPnArVoPEYLgWVnKiBHjfMMwdck4oyPjllpvd7TKkCU9hoe71FEa1G2Cig
 VNY4+XPY4uDcQJVwJF2vFhTyt814NnfRSZmRxNooOHD1jJQ69zs/291xyXTujUNveycl
 svHm4Ap5S+PqPu0qUeGBpeVmCtYCIgP9OzPAekvECx7bPrn8BE4jCmiRMevDvkIpAg1a
 XI24Bn8SocyctnWTlyCW4hVQfx2m+N3f3gD1XfpVwM90STWldG2GOMtnxiJo4S5rH7zy
 uxYlo6BEV/gDKCnaK9GwvpJO2Z5vaCMuJ+nfqJlb8K1HoC2baNm4JJIkVcklo8BelBm0
 HxGA==
X-Gm-Message-State: AOJu0YwQQx0OzLzrQpoxEfU9MRRuAcoetH8RO4Rcf/UhO+goOhWq90SA
 vNl0FkPYRoo2BP/OYzN3gJK/ZQ==
X-Received: by 2002:a05:600c:358b:b0:403:cc79:44f3 with SMTP id
 p11-20020a05600c358b00b00403cc7944f3mr1168643wmq.19.1697699788230; 
 Thu, 19 Oct 2023 00:16:28 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c315300b004064741f855sm3609993wmo.47.2023.10.19.00.16.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:16:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 01/12] hw/i386/amd_iommu: Do not use SysBus API to map
 local MMIO region
Date: Thu, 19 Oct 2023 09:15:59 +0200
Message-ID: <20231019071611.98885-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
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
X-TUID: Z98ZlsTMHAwR

There is no point in exposing an internal MMIO region via
SysBus and directly mapping it in the very same device.

Just map it without using the SysBus API.

Transformation done using the following coccinelle script:

  @@
  expression sbdev;
  expression index;
  expression addr;
  expression subregion;
  @@
  -    sysbus_init_mmio(sbdev, subregion);
       ... when != sbdev
  -    sysbus_mmio_map(sbdev, index, addr);
  +    memory_region_add_subregion(get_system_memory(), addr, subregion);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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

