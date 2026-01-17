Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AFAC98318
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Jan 2026 10:05:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vh3Ae-0000MQ-VO; Sat, 17 Jan 2026 05:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vh3Ac-0000KH-Sw
 for qemu-arm@nongnu.org; Sat, 17 Jan 2026 05:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vh3Aa-000554-Vk
 for qemu-arm@nongnu.org; Sat, 17 Jan 2026 05:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768644275;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4Sfo3Dj9Onxd6boMFWvvcilrVAM7fseffZ2IBDUC+8=;
 b=d2NtHezMjyZARcJh7dULE06PIvsKzhIiU16sGLShYhIENuNWMlkik9+T+X2vkGx4lSW5zr
 7wDY7ekzczaWVchbXiKiNHyFp7ZcAh7YJCwVk0+3IpjPiFg+oJ1l2K31a4nxWRkQQJl6EA
 +3HT/9kSfNw2U/xQLC+3N49/vDjwWhw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-1Npfk-UHP9uaLc7jXF0DWg-1; Sat, 17 Jan 2026 05:04:34 -0500
X-MC-Unique: 1Npfk-UHP9uaLc7jXF0DWg-1
X-Mimecast-MFC-AGG-ID: 1Npfk-UHP9uaLc7jXF0DWg_1768644273
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477cf2230c8so24644085e9.0
 for <qemu-arm@nongnu.org>; Sat, 17 Jan 2026 02:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768644273; x=1769249073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4Sfo3Dj9Onxd6boMFWvvcilrVAM7fseffZ2IBDUC+8=;
 b=quuwLCta+IviJViZSzoaS54vk0YqtY4HRkq0RTsP8sOBGepMw0wTiUCw7AEn2mkKTm
 w2pVPxiuqm+zYXUhbCXj2M1ZhPJSs7bHe1MYUS95DqVUhGl3rDrfodH7k5BmfBrvCDAa
 dl69+uLOz25kHoa/MPWeb3WKjDPboCyDqLIeWWlvqVLCgHPDn7+X3N+77wfRB3hLZY9s
 aX1iatA0emYCw2g6gebNw/C9Kzl5ybbC9/kp2f3HlnyhFPv/D9EnO4lMXpXtgcc/I/ur
 e1P9jaCqxw29YLxupxHgxp8TrUlIXoZoXSYwhL/4ZbzS6bNX5jM//Ers3SpJZKvdGY7d
 iU/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVw+OPUY8z/mn3qpL8I9ls40UucJGQjfuYFg+4MGkDI1RurtnDV20lYGoomPiXLd4bOo5urUPeuw==@nongnu.org
X-Gm-Message-State: AOJu0YzxthRFdS8Mz0gXKD87+9gxksJ/1O8jePPC651y715+qDOMnmnn
 tqX2spXRhzqezo0CpZUl4vvUxs2fCPnelvi86INRjbgFYrduriHUCz+8ptaFXn1YO0I/wbzV0R8
 fibIp0LGYhKr7QFXBm9tihFQfMnTqMfPGXAj/cuJ3APRa7ul09rB4ig==
X-Gm-Gg: AY/fxX6jz3fMdguRA0CQRv0CoR+JYlr1S6kHma9n8X+INPiu/KWv4OLLL9O5exUQsl0
 1gDL5JSm6DPCpM2X5iEebsVNigxgdtm75qT+BchEovIPT9NWw0FJYnohoY34zR87YH9jU4hHN0K
 CHMFkNCg6sGFctXajREVMuSY69KmhDHiJoFCbR9S9QCUe/jXi/xjqWkp2E2z4qjALZI96BXOOi4
 lJeXc5HTXectEyNsTLcFKTQMkTBzfila1I+yk4ikLrxKMz1IYoq9XOkB9RYY2+Q/1U5MWA2/Jzp
 nhkb/ZPpJpniNd5RJXLamkgQ+/58blhCqkCqMm0VNo3Uoe7OnCdf/vnZ5U9lOmXP+pZUxtCDNBS
 FhYypgmLQ9FCdPyGoIXLO99bKKt1oNwkAcYX5XTenFfN3tjyFpZ2hxp4Gdw==
X-Received: by 2002:a05:600c:630f:b0:475:e09c:960e with SMTP id
 5b1f17b1804b1-4801e3495e9mr69854245e9.32.1768644273168; 
 Sat, 17 Jan 2026 02:04:33 -0800 (PST)
X-Received: by 2002:a05:600c:630f:b0:475:e09c:960e with SMTP id
 5b1f17b1804b1-4801e3495e9mr69853965e9.32.1768644272703; 
 Sat, 17 Jan 2026 02:04:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f42907141sm141789755e9.9.2026.01.17.02.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jan 2026 02:04:31 -0800 (PST)
Message-ID: <0b4b21e5-40e4-4d09-8624-7507dbb220e3@redhat.com>
Date: Sat, 17 Jan 2026 11:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 7/7] tests/qtest: Add SMMUv3 bare-metal test using
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
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-8-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251224034647.2596434-8-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lc3gujRGf-G7qniQiaNZW9njPksefMzQObVv2cdtdVA_1768644273
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Tao,

On 12/24/25 4:46 AM, Tao Tang wrote:
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
> Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  tests/qtest/iommu-smmuv3-test.c | 121 ++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build         |   1 +
>  2 files changed, 122 insertions(+)
>  create mode 100644 tests/qtest/iommu-smmuv3-test.c
>
> diff --git a/tests/qtest/iommu-smmuv3-test.c b/tests/qtest/iommu-smmuv3-test.c
> new file mode 100644
> index 0000000000..b612f5ca6c
> --- /dev/null
> +++ b/tests/qtest/iommu-smmuv3-test.c
> @@ -0,0 +1,121 @@
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
> +static void save_fn(QPCIDevice *dev, int devfn, void *data)
> +{
> +    QPCIDevice **pdev = (QPCIDevice **) data;
> +
> +    *pdev = dev;
> +}
> +
> +static QPCIDevice *setup_qtest_pci_device(QTestState *qts, QGenericPCIBus *gbus,
> +                                          QPCIBar *bar)
> +{
> +    QPCIDevice *dev = NULL;
> +
> +    qpci_init_generic(gbus, qts, NULL, false);
> +
> +    qpci_device_foreach(&gbus->bus, IOMMU_TESTDEV_VENDOR_ID,
> +                        IOMMU_TESTDEV_DEVICE_ID, save_fn, &dev);
> +    g_assert(dev);
> +
> +    qpci_device_enable(dev);
> +    *bar = qpci_iomap(dev, 0, NULL);
> +    g_assert_false(bar->is_io);
> +
> +    return dev;
> +}
> +
> +static void run_smmuv3_translation(const QSMMUTestConfig *cfg)
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
> +    g_test_message("### SMMUv3 translation mode=%d sec_sid=%d ###",
> +                   cfg->trans_mode, cfg->sec_sid);
> +    qsmmu_run_translation_case(qts, dev, bar, VIRT_SMMU_BASE, cfg);
> +    qtest_quit(qts);
> +}
> +
> +static void test_smmuv3_ns_s1_only(void)
> +{
> +    QSMMUTestConfig cfg = {
> +        .trans_mode = QSMMU_TM_S1_ONLY,
> +        .sec_sid = QSMMU_SEC_SID_NONSECURE,
> +        .dma_iova = QSMMU_IOVA,
> +        .dma_len = DMA_LEN,
> +        .expected_result = 0,
> +    };
> +
> +    run_smmuv3_translation(&cfg);
> +}
> +
> +static void test_smmuv3_ns_s2_only(void)
> +{
> +    QSMMUTestConfig cfg = {
> +        .trans_mode = QSMMU_TM_S2_ONLY,
> +        .sec_sid = QSMMU_SEC_SID_NONSECURE,
> +        .dma_iova = QSMMU_IOVA,
> +        .dma_len = DMA_LEN,
> +        .expected_result = 0,
> +    };
> +
> +    run_smmuv3_translation(&cfg);
> +}
> +
> +static void test_smmuv3_ns_nested(void)
> +{
> +    QSMMUTestConfig cfg = {
> +        .trans_mode = QSMMU_TM_NESTED,
> +        .sec_sid = QSMMU_SEC_SID_NONSECURE,
> +        .dma_iova = QSMMU_IOVA,
> +        .dma_len = DMA_LEN,
> +        .expected_result = 0,
> +    };
> +
> +    run_smmuv3_translation(&cfg);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/iommu-testdev/translation/ns-s1-only",
> +                   test_smmuv3_ns_s1_only);
> +    qtest_add_func("/iommu-testdev/translation/ns-s2-only",
> +                   test_smmuv3_ns_s2_only);
> +    qtest_add_func("/iommu-testdev/translation/ns-nested",
> +                   test_smmuv3_ns_nested);
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
One question: since it can only run along with VIRT machine, how do we
make sure this only runs with that machine enabled?

Thanks

Eric


>    qtests_cxl +                                                                                  \
>    ['arm-cpu-features',
>     'numa-test',


