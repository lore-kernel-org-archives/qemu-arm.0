Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp3049104lfg;
        Tue, 2 Aug 2022 02:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3eO8VrW/VjJMsRX6TnxcNdXTSJYYE+usgjAyLS3xSKiGk6606J/OY2vZkFCt3r9iWtaO4
X-Received: by 2002:ac8:7dcf:0:b0:31f:9fc:fa93 with SMTP id c15-20020ac87dcf000000b0031f09fcfa93mr17776884qte.185.1659433296273;
        Tue, 02 Aug 2022 02:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659433296; cv=none;
        d=google.com; s=arc-20160816;
        b=CiIu/prA4TBHwqiExxSPnzJ0tre1DIbqQOAO5NfhGab3gZPqj7kE1EATGwI0JboUEt
         mFT/cZ5s1fiu9Fh6o6uqRdp/2fXeOgLnpqOBIbfF63FihIjYob3+hHrQ78yT+h2bXL5p
         wncv3LYwxvSmDX4r3F0cA4ZZ3DGeyL6gT6e98qASpWzFvfUFLFuEKGteqKYlLf5mFtlu
         mypYnP2IWGLnkPXD++HhVny+9ZKhy8iWbRU/Y/hPTPjBbN+wGyTPKsMwPjumatuu2ZXz
         GVvMccBnqxqmSk5ypjnqe8o8CRFlZ3iY17AkraC2UZlSEKNZKRiTMP+gESUWTryLlKwE
         Tovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dcS7wR86v9QRbiEB59dTOPyqPoZmvNKhmB9srERWZiI=;
        b=OTolZm1c3tgw1yl/Q0vgoZAWdlRyLIN7DrpMNkZs9vLRHqYgFJxAHUJo5LRxqHyHLd
         rvccXOZDtxkxsuUnoNiS46+1B4vwZSaa9qwx19X43KfdO8ZhKXqe7tx060DLT/EjMPBj
         C6yU+FO7xxtbVLxWpBwcSlTvTnjfL/dT+tSTYqPZ1ViITNAlPrYYXOdSHTSfu7zBxcnQ
         3MVCflpp4DuSIl4i+r6CLjR8wcdgz5mIiO/45+lhTX1cYMgMenEPS36eFhlHtrCR6lsi
         Kxkyo4M6cMqJ2pFCkR0cd4+79hgHXUnMprzVU74+txwOaXEdBvyVVtYnrcTeHKpmEkuO
         sGyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+kG6dMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140d0e00b004737906ac89si1137932qvh.438.2022.08.02.02.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Aug 2022 02:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+kG6dMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIoP9-0002fY-PX
	for alex.bennee@linaro.org; Tue, 02 Aug 2022 05:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oIoOt-0002dr-1I
 for qemu-arm@nongnu.org; Tue, 02 Aug 2022 05:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oIoOq-00005I-Hk
 for qemu-arm@nongnu.org; Tue, 02 Aug 2022 05:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433274;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcS7wR86v9QRbiEB59dTOPyqPoZmvNKhmB9srERWZiI=;
 b=N+kG6dMoyzwp966lN4ALftLpG+08kofppoZ80bW0Ds8gwKZVBWyDUgXYXTP3N8T0e0e1sC
 DBjg93Pi3quOWCXVoyybqI2BzfknkPLf7JOsh01j04uUl1F19PXVZ9mX9UKcrUXF81a5yn
 Ml2MHWWTPjaA8nsB7GGTlsne92yx23Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-1G1eSUE5Ni6vjE40eaQNcA-1; Tue, 02 Aug 2022 05:41:13 -0400
X-MC-Unique: 1G1eSUE5Ni6vjE40eaQNcA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b0021e564cde06so3329043wra.17
 for <qemu-arm@nongnu.org>; Tue, 02 Aug 2022 02:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=dcS7wR86v9QRbiEB59dTOPyqPoZmvNKhmB9srERWZiI=;
 b=VYgrfNokrnVHF+lJHaDmAqqAPrdldFgY+0nVMT7DyvvdfMt2wF3sy69lwCO2yRuumr
 TkyTy9VOCeabQeotgmPTLfWxekFyOSbr/3+q6sHB4LMNLc1Vu82D6kgIRxRkivfVKTMb
 8O9EJniNim5zyXbVjtv7Rh2n7JSsE/BUspO2g9u4f4nG7Vaful64wUCHH6OUbABCWpA0
 LUMSAe17BMZG20dV76NIe3K7JOqK59uFHLXMFbZjV/UuVJsRNdFhnRLmSIfSAmbM5RXY
 mh99FyC2XNLDcM9YQKYrJdgzJlWwWxWdPk3hnNjhgSr2SVu29NHEnQvEXfgRKmaIeboG
 PbgA==
X-Gm-Message-State: AJIora8Way5cIVVQjuT3PvxtpcTa7tsff/VsrzKs+i9x8/CY3THvT+M5
 c/HhRYzbMzhRbkP3/7qkZSbD/h7zamTeBItYIeUJGvhf3d5pQLdmkhv3zz1J7aLojKjcF86vm2C
 mQLQEIbJk9Y4I
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr13567083wmr.11.1659433272644; 
 Tue, 02 Aug 2022 02:41:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr13567072wmr.11.1659433272424; 
 Tue, 02 Aug 2022 02:41:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b0021e084d9133sm17260368wrl.27.2022.08.02.02.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 02:41:11 -0700 (PDT)
Message-ID: <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
Date: Tue, 2 Aug 2022 11:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220802064529.547361-2-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: caxOP3D6rX58

Hi Gavin,

On 8/2/22 08:45, Gavin Shan wrote:
> There are 3 highmem IO regions as below. They can be disabled in
> two situations: (a) The specific region is disabled by user. (b)
> The specific region doesn't fit in the PA space. However, the base
> address and highest_gpa are still updated no matter if the region
> is enabled or disabled. It's incorrectly incurring waste in the PA
> space.
If I am not wrong highmem_redists and highmem_mmio are not user selectable

Only highmem ecam depends on machine type & ACPI setup. But I would say
that in server use case it is always set. So is that optimization really
needed?
>
> Improve address assignment for highmem IO regions to avoid the waste
> in the PA space by putting the logic into virt_memmap_fits().
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 54 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9633f822f3..bc0cd218f9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1688,6 +1688,34 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> +static void virt_memmap_fits(VirtMachineState *vms, int index,
> +                             bool *enabled, hwaddr *base, int pa_bits)
> +{
> +    hwaddr size = extended_memmap[index].size;
> +
> +    /* The region will be disabled if its size isn't given */
> +    if (!*enabled || !size) {
In which case do you have !size?
> +        *enabled = false;
> +        vms->memmap[index].base = 0;
> +        vms->memmap[index].size = 0;
It looks dangerous to me to reset the region's base and size like that.
for instance fdt_add_gic_node() will add dummy data in the dt.
> +        return;
> +    }
> +
> +    /*
> +     * Check if the memory region fits in the PA space. The memory map
> +     * and highest_gpa are updated if it fits. Otherwise, it's disabled.
> +     */
> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
using a 'fits' local variable would make the code more obvious I think
> +    if (*enabled) {
> +        *base = ROUND_UP(*base, size);
> +        vms->memmap[index].base = *base;
> +        vms->memmap[index].size = size;
> +        vms->highest_gpa = *base + size - 1;
> +
> +	*base = *base + size;
> +    }
> +}
> +
>  static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> @@ -1744,37 +1772,17 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      vms->highest_gpa = memtop - 1;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> -        hwaddr size = extended_memmap[i].size;
> -        bool fits;
> -
> -        base = ROUND_UP(base, size);
> -        vms->memmap[i].base = base;
> -        vms->memmap[i].size = size;
> -
> -        /*
> -         * Check each device to see if they fit in the PA space,
> -         * moving highest_gpa as we go.
> -         *
> -         * For each device that doesn't fit, disable it.
> -         */
> -        fits = (base + size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = base + size - 1;
> -        }
> -

we could avoid running the code below in case highmem is not set. We would need to reset that flags though.

>          switch (i) {
>          case VIRT_HIGH_GIC_REDIST2:
> -            vms->highmem_redists &= fits;
> +            virt_memmap_fits(vms, i, &vms->highmem_redists, &base, pa_bits);
>              break;
>          case VIRT_HIGH_PCIE_ECAM:
> -            vms->highmem_ecam &= fits;
> +            virt_memmap_fits(vms, i, &vms->highmem_ecam, &base, pa_bits);
>              break;
>          case VIRT_HIGH_PCIE_MMIO:
> -            vms->highmem_mmio &= fits;
> +            virt_memmap_fits(vms, i, &vms->highmem_mmio, &base, pa_bits);
>              break;
>          }
> -
> -        base += size;
>      }
>  
>      if (device_memory_size > 0) {
Thanks

Eric

