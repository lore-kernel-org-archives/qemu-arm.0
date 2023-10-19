Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp804298ejb;
        Thu, 19 Oct 2023 14:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXLsqKHTzoMNkqOosWEb2WFLn8qF5TKbXW59/grSOIobZE1W7DvQiZLI3NMMAXQZVW7Jcw
X-Received: by 2002:a05:6214:1c49:b0:658:3680:5185 with SMTP id if9-20020a0562141c4900b0065836805185mr91173qvb.36.1697750913244;
        Thu, 19 Oct 2023 14:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750913; cv=none;
        d=google.com; s=arc-20160816;
        b=dpx0omDYQmEuhh7+Gzvf9Izthw7oGuRAALRNGjX+0r4RWRC2I8Z/+eUCHRh/Zs2/tk
         hf/5Z9rmWLwtjjDByfvFRLJv4sIHd2tkOPTkswGE2rzfi8wCuQ9AEA6R48GuJI+EcbRd
         MfqVXZQEZfadmUlfyFE2IGXV0n/2b58X8IPtOeMVDqSNmP8ua2Xoz9EMZ67piswIj9Qz
         oGwF1dN/uTMGAakc3SVtVsDo4YQMeADRRJvz4RhoIWmVI6zb6qBlqtjsMtNqiwUpOceB
         OYtxUI2p8Z0rdHMOt1iSxQr+VCFb4qVd2R5wdTscxzLZTqUVwaLr0wtxApu7C5F3kgFZ
         jTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GRoMhCaNSLoeo2bCOvsej90/UgtOEEDsrN+Oqu3oygw=;
        fh=0n9Ul5Af6CQEypHJkwrx20ZftP3RDkV5SLmcw1OKgCo=;
        b=laRQJDo7H9l+NEmAmJZi+zR2WloZ9clDu5sLdqfRx75OOAfZW1Z8i0wnf/vBFJ8OXr
         pLgWQEfKB/tvUUCZFa+2I6DJdFKuG1UBeAHjyFioHCwnYjR8SGxMk08Z8y8ne3RTgQYs
         rHOu51rktGA8l/XhkSVtgVXj8a17dV/nq38LjAzsQKvKh1/TsP/vTaab7VStPQf/o7jE
         VLeWFxtoD1k+/nLOKK8RoYknC0o8z4CbxEFHzrwkxH/XeGBkyqphkb3AnJmJBR7sCQwI
         feSipBgVoT8Xkl4UX3FNZ0TjHvbaW1ELDodiBgut/GDjmHBnDZJim/6+3fQKjRz2/TVn
         fVZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEzuygD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id df17-20020a056214081100b0064cc98b83fasi341825qvb.604.2023.10.19.14.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eEzuygD1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaSr-0001ui-Ov; Thu, 19 Oct 2023 17:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSq-0001pH-GX
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:56 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSo-0007eV-22
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:21:56 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c5028e5b88so1499911fa.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750512; x=1698355312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRoMhCaNSLoeo2bCOvsej90/UgtOEEDsrN+Oqu3oygw=;
 b=eEzuygD14V4Bjz6l9jkbHWxWoZOs3s/R3M//pTleJmFON0ATvt5w1b8WSgZ5QwxOnt
 XYVXVa4XmRJwM2QiOKrMbiO63+YRtUPYlYMmFES7RR/vVSgWKpzEmvliIPNy8cDlr6sn
 +XDrBGmZPy5YaoR9KWjCn+uAPVF41b7Ck3IhK2cTzR0jj7B3/bZUBIXwU3M5RBPy0s5k
 YijqI1+/yHcCJWYaly2asA76BHh/Prfu8w8KaUX/XZlQZmvQH79lI4dCKX3MG+IL4u2m
 3fr8QKIGN4d4zEJVLEWTI8FEe/2LG9f57xjWqpQVXiukivPJs2HBKomTxbv/GhUY2hkY
 0kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750512; x=1698355312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRoMhCaNSLoeo2bCOvsej90/UgtOEEDsrN+Oqu3oygw=;
 b=VBpq0fmTNWfHqVWoyQ5vEZJQ2OH1FYAeByLG+8lMClMTBVNOaTc3X1xuJCgqR3lFEy
 BQloyS8FV8+CVj8KlQi6TUsIZqfH8pjR7/qhZDxMuTp1twM3oTq7HyzUCmG4fLK6sum9
 0GNRR8LMg7E84HYYCcjpkvoxSv/bQeieH7AaldrNgKPmnR0iwbqfm3oUaCDmlF/Sh6VW
 OirOnocl7Q6n+/en6HF4tdYhUTOyQxC/nbMaJvFL5E3X4/cBlod+QFSzOD5JxZWQsNM6
 Xy6T8BkSkeeS5f3iZvxsMdMw2d230oBQONUyOEjDTcZLMXfB9z+FJQaT+xGljwroemHc
 qL6w==
X-Gm-Message-State: AOJu0YzI7VkIA6CWv7QpcfZjLy6TUsG1ASSrQaOURBIfB8eAMHu0IUj2
 biw9kM8MENHiZeSNs6oNFp+EYQ==
X-Received: by 2002:a2e:9c8c:0:b0:2c5:70f:614a with SMTP id
 x12-20020a2e9c8c000000b002c5070f614amr99024lji.17.1697750512157; 
 Thu, 19 Oct 2023 14:21:52 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003fe61c33df5sm5415202wms.3.2023.10.19.14.21.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:21:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 32/46] hw/i386/intel_iommu: Do not use SysBus API to map local
 MMIO region
Date: Thu, 19 Oct 2023 23:17:57 +0200
Message-ID: <20231019211814.30576-33-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: BNRkM11HRggT

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
Message-Id: <20231018141151.87466-3-philmd@linaro.org>
---
 hw/i386/intel_iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 2c832ab68b..e4f6cedcb1 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -4134,6 +4134,8 @@ static void vtd_realize(DeviceState *dev, Error **errp)
     qemu_mutex_init(&s->iommu_lock);
     memory_region_init_io(&s->csrmem, OBJECT(s), &vtd_mem_ops, s,
                           "intel_iommu", DMAR_REG_SIZE);
+    memory_region_add_subregion(get_system_memory(),
+                                Q35_HOST_BRIDGE_IOMMU_ADDR, &s->csrmem);
 
     /* Create the shared memory regions by all devices */
     memory_region_init(&s->mr_nodmar, OBJECT(s), "vtd-nodmar",
@@ -4148,15 +4150,12 @@ static void vtd_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion_overlap(&s->mr_nodmar,
                                         VTD_INTERRUPT_ADDR_FIRST,
                                         &s->mr_ir, 1);
-
-    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->csrmem);
     /* No corresponding destroy */
     s->iotlb = g_hash_table_new_full(vtd_iotlb_hash, vtd_iotlb_equal,
                                      g_free, g_free);
     s->vtd_address_spaces = g_hash_table_new_full(vtd_as_hash, vtd_as_equal,
                                       g_free, g_free);
     vtd_init(s);
-    sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR);
     pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = vtd_host_dma_iommu(bus, s, Q35_PSEUDO_DEVFN_IOAPIC);
-- 
2.41.0

