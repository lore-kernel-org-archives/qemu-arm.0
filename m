Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DF0D3E768
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 18:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTPCK-00077P-MV; Wed, 10 Dec 2025 13:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTPCH-00076i-K5
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:45:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTPCE-00048Y-Mb
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 13:45:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765392353;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMS+Q+wF/hCn/MwWLwr4ed1U6EOVDi5hMKamvBt1DII=;
 b=hcLe448UywQAiy08Yg29Ch/t7a4/hnpr1IOmdoYFqCqdFPnsG/TX2P4gir4LpmUabo8jL6
 14y/A+AOFn8WnHmDxVvh2IG9xv/A9hgp8a0duMT7Hg3gH7TgnN+PZpzewbbxBqPQ52UJJE
 HttdumtHw4cd86qoDWu7Ba2lhpWziPI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-4Sc-v6xPNAOBEemkE_vk-g-1; Wed, 10 Dec 2025 13:45:52 -0500
X-MC-Unique: 4Sc-v6xPNAOBEemkE_vk-g-1
X-Mimecast-MFC-AGG-ID: 4Sc-v6xPNAOBEemkE_vk-g_1765392352
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-340ad9349b3so299436a91.1
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 10:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765392351; x=1765997151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMS+Q+wF/hCn/MwWLwr4ed1U6EOVDi5hMKamvBt1DII=;
 b=J0JxrzacOXP4LzMyuqYpF5CWQndHFlNEcfPvoCaRHJLSXlaIlhmU6umD2ju8L6WA+p
 eB77K06pYHAU1S0xuzVvxdP9AzifFAeK4vcrFd02j5Eewluo5BMNl2ZJ0TM5AXuG2dK9
 ohJTDNAMSE+rnDxGZoLzrlBBxvgA9htP3stiiW1whJgd905JV9MU7JSLn4aDAOZt1ODl
 RbV7d+u/TND5I3L5qymFNu4ZVgwOl1jLVkRUtnVDpMzQVsGJzwQq0IsZa9fyxHKL4F0L
 SZGoZ446ZOT8qOl1a+WICvb0AJx4+0kC4LPT/dXDcnuv3ca2O/9ziN3TjmQasM/viSVy
 CiRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs7oc5oYptAsKIZMnhICcA+2D10CHw7XE3mlJ9yTJE6nEiwLdZqdO5UzANeDnab+On3RQoGM7uzw==@nongnu.org
X-Gm-Message-State: AOJu0YyBjrXew4fTRm5c0Fcq32Iu4x2rJG6XxZ3LQOkp/hCc5huqZGWX
 pMn7FujUo9/PnA1Nfol7XZXdXKuGYyj266NnzoBIEnkCgnP/i0pTdwAF46f1I0Bt1vrODzfn4GM
 tBNMSIVyN+3NQkNJWm4m+e1N0oz6JrThGSewqMBuVmcfECQ+YcgYROw==
X-Gm-Gg: AY/fxX7gDXM9vDj5161AUMkg8sQQ5Agv929Pb//9KWlotlXj3bw/SG1qMonaWg41YVb
 uz85/9O2wW8Oic2v5FKvK96kb0/klJnUpGLovktsYcFnL4OXCYXdoPdf39dKDRti57s7rCUUb5q
 iG9Z+J+aOpVy9+fU4bYKNfkzv/u6KKC+RXIta/3p0h6p9j51uTNujiGy4A3duvHRZdAAlBu/0XX
 DrDhu+HyIm/AkCiqhB4IYvGQg8RCK9GcXLZ8IprteKYAUk67bltSdd4UKUhHrUiAT/LkWhUCIhi
 KeAzSdGCfnRlv3iQQI0mS59MgYe+shutMUXTRzvqal/vYKKdIWf39wUWIUR61Khi4QJWs9GlBN4
 INC7CiwcVrZZSswmOq0tK2u0xFH+0pV7lM55iyRkF1CJJpTdI/jZhqc+Mjw==
X-Received: by 2002:a17:90b:1652:b0:343:6a79:6c75 with SMTP id
 98e67ed59e1d1-34a72885eecmr3361365a91.29.1765392351428; 
 Wed, 10 Dec 2025 10:45:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhKxYByZS4f0rrYGWGJy5Zy4BJO9Wako6wTfGp19VHDrVUB4vTdDdNWG3lV6arEXR4RTj57Q==
X-Received: by 2002:a17:90b:1652:b0:343:6a79:6c75 with SMTP id
 98e67ed59e1d1-34a72885eecmr3361338a91.29.1765392350888; 
 Wed, 10 Dec 2025 10:45:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a6ff019f0sm3206875a91.1.2025.12.10.10.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 10:45:50 -0800 (PST)
Message-ID: <629e6b11-069e-45c9-9119-b310db85a82d@redhat.com>
Date: Wed, 10 Dec 2025 19:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v5 4/4] tests/qtest: Add SMMUv3 bare-metal test using
 iommu-testdev
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251126154547.1300748-1-tangtao1634@phytium.com.cn>
 <20251126154547.1300748-5-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251126154547.1300748-5-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PAs0je8F2SXbYwGCJN4MaX0LL3EIphsnYfxc11AuyLc_1765392352
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/26/25 4:45 PM, Tao Tang wrote:
> Add a qtest suite that validates ARM SMMUv3 translation without guest
> firmware or OS. The tests leverage iommu-testdev to trigger DMA
> operations and the qos-smmuv3 library to configure IOMMU translation
> structures.
>
> This test suite targets the virt machine and covers:
> - Stage 1 only translation (VA -> PA via CD page tables)
> - Stage 2 only translation (IPA -> PA via STE S2 tables)
> - Nested translation (VA -> IPA -> PA, Stage 1 + Stage 2)
> - Design to extended to support multiple security spaces
>     (Non-Secure, Secure, Root, Realm)
>
> Each test case follows this sequence:
> 1. Initialize SMMUv3 with appropriate command/event queues
> 2. Build translation tables (STE/CD/PTE) for the target scenario
> 3. Configure iommu-testdev with IOVA and DMA attributes via MMIO
> 4. Trigger DMA and validate successful translation
> 5. Verify data integrity through a deterministic write-read pattern
>
> This bare-metal approach provides deterministic IOMMU testing with
> minimal dependencies, making failures directly attributable to the SMMU
> translation path.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  tests/qtest/iommu-smmuv3-test.c | 114 ++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build         |   1 +
>  2 files changed, 115 insertions(+)
>  create mode 100644 tests/qtest/iommu-smmuv3-test.c
>
> diff --git a/tests/qtest/iommu-smmuv3-test.c b/tests/qtest/iommu-smmuv3-test.c
> new file mode 100644
> index 0000000000..af438ecce0
> --- /dev/null
> +++ b/tests/qtest/iommu-smmuv3-test.c
> @@ -0,0 +1,114 @@
> +/*
> + * QTest for SMMUv3 with iommu-testdev
> + *
> + * This QTest file is used to test the SMMUv3 with iommu-testdev so that we can
> + * test SMMUv3 without any guest kernel or firmware.
> + *
> + * Copyright (c) 2025 Phytium Technology
> + *
> + * Author:
> + *  Tao Tang <tangtao1634@phytium.com.cn>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "libqos/pci.h"
> +#include "libqos/generic-pcihost.h"
> +#include "hw/pci/pci_regs.h"
> +#include "hw/misc/iommu-testdev.h"
> +#include "libqos/qos-smmuv3.h"
> +
> +#define DMA_LEN           4
> +
> +/* Test configurations for different SMMU modes and spaces */
> +static const QSMMUTestConfig base_test_configs[] = {
> +    {
> +        .trans_mode = QSMMU_TM_S1_ONLY,
> +        .sec_sid = QSMMU_SEC_SID_NONSECURE,
> +        .dma_iova = QSMMU_IOVA_OR_IPA,
what does this mean? QSMMU_IOVA_OR_IPA

Eric
> +        .dma_len = DMA_LEN,
> +        .expected_result = 0
> +    },
> +    {
> +        .trans_mode = QSMMU_TM_S2_ONLY,
> +        .sec_sid = QSMMU_SEC_SID_NONSECURE,
> +        .dma_iova = QSMMU_IOVA_OR_IPA,
> +        .dma_len = DMA_LEN,
> +        .expected_result = 0
> +    },
> +    {
> +        .trans_mode = QSMMU_TM_NESTED,
> +        .sec_sid = QSMMU_SEC_SID_NONSECURE,
> +        .dma_iova = QSMMU_IOVA_OR_IPA,
> +        .dma_len = DMA_LEN,
> +        .expected_result = 0
> +    }
> +};
> +
> +static QPCIDevice *setup_qtest_pci_device(QTestState *qts, QGenericPCIBus *gbus,
> +                                          QPCIBar *bar)
> +{
> +    uint16_t vid, did;
> +    QPCIDevice *dev = NULL;
> +
> +    qpci_init_generic(gbus, qts, NULL, false);
> +
> +    /* Find device by vendor/device ID to avoid slot surprises. */
> +    for (int s = 0; s < 32 && !dev; s++) {
> +        for (int fn = 0; fn < 8 && !dev; fn++) {
> +            QPCIDevice *cand = qpci_device_find(&gbus->bus, QPCI_DEVFN(s, fn));
> +            if (!cand) {
> +                continue;
> +            }
> +            vid = qpci_config_readw(cand, PCI_VENDOR_ID);
> +            did = qpci_config_readw(cand, PCI_DEVICE_ID);
> +            if (vid == IOMMU_TESTDEV_VENDOR_ID &&
> +                did == IOMMU_TESTDEV_DEVICE_ID) {
> +                dev = cand;
> +                g_test_message("Found iommu-testdev! devfn: 0x%x", cand->devfn);
> +            } else {
> +                g_free(cand);
> +            }
> +        }
> +    }
> +    g_assert(dev);
> +
> +    qpci_device_enable(dev);
> +    *bar = qpci_iomap(dev, 0, NULL);
> +    g_assert_false(bar->is_io);
> +
> +    return dev;
> +}
> +
> +static void test_smmuv3_translation(void)
> +{
> +    QTestState *qts;
> +    QGenericPCIBus gbus;
> +    QPCIDevice *dev;
> +    QPCIBar bar;
> +
> +    /* Initialize QEMU environment for SMMU testing */
> +    qts = qtest_init("-machine virt,acpi=off,gic-version=3,iommu=smmuv3 "
> +                     "-smp 1 -m 512 -cpu max -net none "
> +                     "-device iommu-testdev");
> +
> +    /* Setup and configure PCI device */
> +    dev = setup_qtest_pci_device(qts, &gbus, &bar);
> +    g_assert(dev);
> +
> +    /* Run the enhanced translation tests */
> +    g_test_message("### Starting SMMUv3 translation tests...###");
> +    qsmmu_translation_batch(base_test_configs, ARRAY_SIZE(base_test_configs),
> +                            qts, dev, bar, VIRT_SMMU_BASE);
> +    g_test_message("### SMMUv3 translation tests completed successfully! ###");
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/iommu-testdev/translation", test_smmuv3_translation);
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 669d07c06b..e2d2e68092 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -263,6 +263,7 @@ qtests_aarch64 = \
>     config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
>    (config_all_devices.has_key('CONFIG_NPCM8XX') ? qtests_npcm8xx : []) + \
> +  (config_all_devices.has_key('CONFIG_IOMMU_TESTDEV') ? ['iommu-smmuv3-test'] : []) + \
>    qtests_cxl +                                                                                  \
>    ['arm-cpu-features',
>     'numa-test',


