Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp241522lfb;
        Fri, 7 Jan 2022 08:41:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeysCzDSh3g9F5e8r9M2paQ4J8hqJHyow+XqlnMc27m8PoEuhCwlQyu7cfMv63uinsDKAT
X-Received: by 2002:a25:73c1:: with SMTP id o184mr29370031ybc.528.1641573712392;
        Fri, 07 Jan 2022 08:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641573712; cv=none;
        d=google.com; s=arc-20160816;
        b=eVzkqco+aOYKcxdhMQ8jv/ki5x75tjJM+NwPKFTCK/pB5WJHACKZ2L12+c1uUCrd6i
         nwhbXUc8F7O03dwK5CIC3yEDS8c9+o7xMCbmzcfsnEh2/RUR2/hK2lzFoZfvtFDQxL6M
         ufpAEaTAJ7zxXAsylfaO/labqCzcLBOunnDSn0iTchfRJm4fhKndZ8RAH5UJRZTGSoFL
         25j6fDusPSy7GhkjX0lbZe/AsKbvvM+flgwkWtAuZShPVbv6A/U1o2Ps1BDLHcIlUeaA
         jgfgWqSENdntfTyHF5fD0nRJCCHSCN1YJL8qDTBbQ/u1YIdTRfgmDexNrYSBmB/fm8it
         FG1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iwupqIhAgwXeYrZdlU0UxwaeRSvcvKJs4B3CEOkpu/g=;
        b=JtIzgMCW1btsPUwPeHrPNq3+U1tzrwZh+aKR2QlWtizCpLve8aTn5WEcxKUmaEClg4
         +TSRXMNbkGRL5Z0fg6UfWkaLUN6XLDfzFDJdZwlwN4Gu3nJ3DeXxB1/otbf0ufU0robx
         OH+RLXxndciZsGZpexH4ZgElBheyaPyVF71HgcxxMrQ0uXtHomOq6PbsKgywI6ngGDXN
         sQyCDwySqs1kNAYMkQ5VzxzBy0amLMQ9q9Ne/EiL+E3qr4t96YYsCOQtoeYhLZwsC5bb
         HN3wZJAgbF6eQv8q4uqNeUY7CJEaSDO73b5ImrgnKPk2GI/R3rKkBq0fvWxIIbUdGe22
         d+1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gjkk1TU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si4075349ybj.475.2022.01.07.08.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 08:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Gjkk1TU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5sJL-00051h-Ri
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 11:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sIF-0004xo-3i
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 11:40:43 -0500
Received: from [2a00:1450:4864:20::32b] (port=43930
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sIC-00080k-RV
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 11:40:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so1606404wme.2
 for <qemu-arm@nongnu.org>; Fri, 07 Jan 2022 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwupqIhAgwXeYrZdlU0UxwaeRSvcvKJs4B3CEOkpu/g=;
 b=Gjkk1TU3CVQ/+fqUZkZ0k39KAiM7/xeLytCV3eBRHfm1OcMHzvXBo5HaA/8Eam4sQ2
 SxvOfcyIi5S15ZItpPgM3W159UvWsp6nl2uCzcYgAI89VjEmdy+CC2lHMV8Z7bJmdV0W
 unyUHgLEa8iMttjRB591HEl0f3Tzw1tG7QQk6P/NkskoW2fXm0JnMUZ8P3zVnA95Jxdo
 lvWcnklKMSlqq/MNjRGfI+wBIawh4GtkruZDBRnJG8WHF29xcCvRdN1K0tTdVDIi7PAF
 1bJYtycKzQ9V08LbFsIl5+dtakAYNAQnCieglBi2JmFUslEvcZbBfuC7mypdG6swi5c6
 NpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwupqIhAgwXeYrZdlU0UxwaeRSvcvKJs4B3CEOkpu/g=;
 b=60XLyWUtWRT0bpmNwY/3SeJZ9ZMRrxgr4jpFj8whuamBLEe6MQ0t4Rtqlt2qBpsEW8
 0/ANlsE4iJOOduntoNXnxs9AfBJ1Q+D5E9TXI3oJaofb1vgqKM0W5MR7Ma8tFxK3lP4f
 zY+SZhQqPTkHxfi6c+mqIEh9v68vASmpd4GwU3rV4FRi7gQoZCquOXFbdiZ1wXViShIe
 ZYv8Mj5rEfzkkB1vW83ecvqHe22CRGhi/ANM1jqWPD1qADaSYbUAwTQNB+q4oAC/qj9a
 9Vju80DZDqFCyHRoORZFzwPbsvY/sDOhptBUg1dEJPIRSgLjLy2fzg8P2VAgUA3VYYTB
 CffQ==
X-Gm-Message-State: AOAM531t+dazXem2Int+ShljK1pi3RGlkp8zkBodgia0IptQzwR4DNxY
 1uj/sSbwVjRyp1QpDqX8NYiQPqSB/O5vsyaXoDmreg==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr11796144wms.32.1641573634033; 
 Fri, 07 Jan 2022 08:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20211203233404.37313-1-gshan@redhat.com>
 <20211203233404.37313-3-gshan@redhat.com>
In-Reply-To: <20211203233404.37313-3-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 16:40:23 +0000
Message-ID: <CAFEAcA8hd000vwp8A602uw4yueea4uU0xttELcC8sn34X+N5-A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Support for virtio-mem-pci
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: drjones@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dpROIkW7ldvm

On Fri, 3 Dec 2021 at 23:34, Gavin Shan <gshan@redhat.com> wrote:
>
> This supports virtio-mem-pci device on "virt" platform, by simply
> following the implementation on x86.
>
>    * This implements the hotplug handlers to support virtio-mem-pci
>      device hot-add, while the hot-remove isn't supported as we have
>      on x86.
>
>    * The block size is 512MB on ARM64 instead of 128MB on x86.
>
>    * It has been passing the tests with various combinations like 64KB
>      and 4KB page sizes on host and guest, different memory device
>      backends like normal, transparent huge page and HugeTLB, plus
>      migration.
>
> Co-developed-by: David Hildenbrand <david@redhat.com>
> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>


> +static void virt_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
> +    Error *local_err = NULL;
> +
> +    if (!hotplug_dev2 && dev->hotplugged) {
> +        /*
> +         * Without a bus hotplug handler, we cannot control the plug/unplug
> +         * order. We should never reach this point when hotplugging on x86,
> +         * however, better add a safety net.
> +         */

This comment looks like it was cut-n-pasted from x86 -- is whatever
it is that prevents us from reaching this point also true for arm ?
(What is the thing that prevents us reaching this point?)

> +        error_setg(errp, "hotplug of virtio based memory devices not supported"
> +                   " on this bus.");
> +        return;
> +    }
> +    /*
> +     * First, see if we can plug this memory device at all. If that
> +     * succeeds, branch of to the actual hotplug handler.
> +     */
> +    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
> +                           &local_err);
> +    if (!local_err && hotplug_dev2) {
> +        hotplug_handler_pre_plug(hotplug_dev2, dev, &local_err);
> +    }
> +    error_propagate(errp, local_err);
> +}



> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index b20595a496..21e4d572ab 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -125,7 +125,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>   * The memory block size corresponds mostly to the section size.
>   *
>   * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
> - * a section size of 1GB on arm64 (as long as the start address is properly
> + * a section size of 512MB on arm64 (as long as the start address is properly
>   * aligned, similar to ordinary DIMMs).
>   *
>   * We can change this at any time and maybe even make it configurable if
> @@ -134,6 +134,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
>   */
>  #if defined(TARGET_X86_64) || defined(TARGET_I386)
>  #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
> +#elif defined(TARGET_ARM)
> +#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
>  #else
>  #error VIRTIO_MEM_USABLE_EXTENT not defined
>  #endif

Could this comment explain where the 128MB and 512MB come from
and why the value is different for different architectures ?

thanks
-- PMM
