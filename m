Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp324957ejb;
        Thu, 19 Oct 2023 00:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEGR25uoo0fVLJC6vbjUKsNzS2vnoPqQCZt3HdbF021h+T6tfTHGAJJWGJxtRFVE1YuuvY
X-Received: by 2002:a05:6122:1687:b0:49d:d0af:771a with SMTP id 7-20020a056122168700b0049dd0af771amr1291014vkl.6.1697699821980;
        Thu, 19 Oct 2023 00:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699821; cv=none;
        d=google.com; s=arc-20160816;
        b=NEMT9hIm/Uw+y/ABIrZjx1rvMHJER02+6Mgp7DgNxsx2cMhqGTiIpKO3dTWcBvsDdm
         QO7cAFUWVDAw+Do2yxx/DGGvmKUUtSTcc95RSNsd6qK5Yyzfmc/QtarBH73zcL4qzfAI
         TOkhKe5rEqtPNR5+hdhcpUtCcdorIiOeBlhBTNg2eKP89ap36oIA/5S3c18JqCA6uXlQ
         wSNrCMHlu6mEeak0ShHZF8/tBjiIvRzEIiXYj8rVHNFBVRQrxmc3RoV9COV6L2r7iIWN
         WCMhpoYT76YEi3CBonMCWctWV75o1vsTC4sZdHaP270jLMYoknEgUigNiAF7FyZWyzXO
         En1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=31IMAee+VZo6+j+lZFd22FV62NKoWHWg3TvBlA119f8=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=AfbbR67WsYVOU+AXDcS9JiNn3ovhC7uWMBjqm3+p/R8grQPgOE8w1kdZDfC9y78Nui
         w98V9g26yLvhvZDpbLeh5xg5rgv+kEmfRRs4yguDAtvzoGngxX9yD0eyNmLBN2Jdg3A4
         R4FPb4Hge1smglTGHUa6O0o0FhG7Mt3V+Vw5ZlteHaOoVBbPu/SrCufGbxBit572kz0J
         bFEPMbjkBFHN9IxxodM+/qJKDb0xdU1Yukn1BwX29+xjqGdzs15eTqhJJeABgRoPugSK
         wzVoGQELTEqtXYzs0acYxh1XZn1OxzmWwuNaMiqkluEZ1112tpLHwhpVRKJy8LdYuicE
         kkqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiiiZJX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020ac87f0b000000b0041243a5cf43si1116165qtk.593.2023.10.19.00.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiiiZJX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNGt-0004rl-Qj; Thu, 19 Oct 2023 03:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNGr-0004rJ-RX
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNGq-0003Aj-8j
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:16:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so6615509f8f.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699799; x=1698304599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31IMAee+VZo6+j+lZFd22FV62NKoWHWg3TvBlA119f8=;
 b=JiiiZJX2Ul0XFeys+tTH56OyMyqLueNy/2tqHDb0lNtj0AWpJiGsUTR1k3CXGVtbwV
 UUbQDwMxmtDknDnLBgaWXp+ByJ3RM3C750Bp1pFu1oWWbvmgrCGLxfCi4KmvaOam3iGK
 bsI8rxL/6a9kSuTNyCNY9eYarRW038iqRyfFn2Kq/cT+tYsaz5Iqkphu0yiG22EmyM8+
 hWs9p8Sio9fur8zvbrEEP0rIMc6V/GytAkHJZuJMK5nbWgGP9eP0twgyigFWKjxgmvcY
 c1Vpxcai1SPM825bZO94Dk58PbbWiIG4wW128/oAXEVh/+E5sOAby8BN/sl5R5KLtAw3
 CHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699799; x=1698304599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31IMAee+VZo6+j+lZFd22FV62NKoWHWg3TvBlA119f8=;
 b=g5tofqguC5vq2KwV4V/JPWm+3dtdovptVUNFf14NXZljejKwSFQuBvbUps1SPFwmef
 PBL+aVrYW65hjr1tdZmbt5d/wy2cgjUJqzDV3RKU/fiZX1Jkh3bUu3MMztvtxp6mg7p/
 eWHU3VprVWPCJd4V1evLtyw/342lMr9lGt8WLM2d/ubh0B274tbbTQReRVSo1E5K8NbO
 /MGZmGMfOgr3ujUgfs2E8TLr3gv07ddgwdjFMzR+eKfYd36CUdaa+LhkhLAQnO5Yn0Ud
 Zb6kT67Qdgi8pRY0vpJ1mLznhlWr3cQpHd3waRliPmTWYbinkI76+qbiLgPdqP/0vLFz
 GibQ==
X-Gm-Message-State: AOJu0YxJyVW9MSw8mVH3G5DoQUbkJ0piM1UNu1HAl8N00KO73FcVwB8i
 HalzJnJQahCCpqLMbfE6/ajwMRs17PUIeTwHnG3slA==
X-Received: by 2002:adf:f682:0:b0:32d:8cfd:5780 with SMTP id
 v2-20020adff682000000b0032d8cfd5780mr918954wrp.27.1697699798766; 
 Thu, 19 Oct 2023 00:16:38 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 i3-20020a5d6303000000b0032db4e660d9sm3755308wru.56.2023.10.19.00.16.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:16:38 -0700 (PDT)
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
Subject: [PATCH v2 02/12] hw/i386/intel_iommu: Do not use SysBus API to map
 local MMIO region
Date: Thu, 19 Oct 2023 09:16:00 +0200
Message-ID: <20231019071611.98885-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: M3D7koohWkVP

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

