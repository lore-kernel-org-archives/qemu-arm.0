Received: by 2002:a05:7022:1189:b0:66:6ee3:fed6 with SMTP id ov9csp406204dlb;
        Wed, 14 Jun 2023 06:05:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/cuMG08oFf+b9MoY76vAnioKiiZa3wlxALtzgjfk8aifjMJTE7lLE5Y3objcLKinjsYq/
X-Received: by 2002:a05:620a:3984:b0:75e:c3db:10a4 with SMTP id ro4-20020a05620a398400b0075ec3db10a4mr16025961qkn.65.1686747909796;
        Wed, 14 Jun 2023 06:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686747909; cv=none;
        d=google.com; s=arc-20160816;
        b=D5ew9j9RgPTvMrmfEcI2TUVeulr1Ua+GpCJoCpX6YZ6IBLJqbiC8g/SGQoKKdETICZ
         SqabX4j48+09QSmSF4Qa31YWyqNhIinWpctULhLIxxT4dRojmMpumoG+U3VEC0WyrsXx
         170Pmdy4Zt1AyT9duJHje+DJ2u0zTi+DIeELRO3zwz6ow2goPrRb/YDFJe/3yN6W8UC6
         UIfFyKAAMFMrgh1KTBaLKj1cIJVYUkSzxUxuvC+7SlpAxwctEyGwzDsNQkbFoPRtud9O
         iCH6acfr53U6MgmaxFxqPF94ozStdVJQMi6HF0tS3vugDOiPrrQHoqXZbh1exkFRtVGN
         BxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FNaq1i0YN4QmhH/IAuk4ARL3xays8BeSAQO3C7F6BBw=;
        b=mnGXOrPakTnLASVVc92Wt+6/hA1Y9vctIE7W8lz3ejkS61phXuR0I33byOlHDD3Nct
         fnpxmQqzll3UhJj4YRuZuap+Qi7G8Ux9uZPAkrnF5G04OQK+5b+7VddVeDQADBvykf7Y
         2XYi0wIIUQ/T5xR6c0FsuWBGMPlb2phV6+BKdqvx57StaXFU7X8khjDoy6FCBjZQJfD1
         EkQSQFZBmN7miT0kY5QK2M4JvMxV66nfkMsrMNJ6LS4zrLu4EdB+GbO4lzuo6DR6Xz3U
         PcYyHsxb2IT6EBqVu1/NMNSuhl1mWHLb+lyWRm/FXKslxIP9dT8Yy3Lmieu+zpfZQWB3
         WhPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Hjc/SAs5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a37de12000000b0075b2f6649f6si8455624qkj.741.2023.06.14.06.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 06:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Hjc/SAs5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9QBF-0007DL-3p; Wed, 14 Jun 2023 09:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1q9QBC-0007BV-GA
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 09:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1q9QBA-00081f-RF
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 09:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686747888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNaq1i0YN4QmhH/IAuk4ARL3xays8BeSAQO3C7F6BBw=;
 b=Hjc/SAs5ZFNmmRL3CPlyivX2NdOKltp6nxxSWkeFte4ot9aXDMSaYnVgXv1T1d+fMzquy5
 h4kLapnMbiJtmIid+XXqm4CRhcRXbmkHgYIEgORscF71mqjeTinG8Zp+x11rmLLvlEjk14
 elR1p9GL0sZDI1weCqcI69Iv8N69Gdw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-Y7VDnq67OYG39KN9-iBNEQ-1; Wed, 14 Jun 2023 09:04:41 -0400
X-MC-Unique: Y7VDnq67OYG39KN9-iBNEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30c5d31b567so2652778f8f.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jun 2023 06:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686747868; x=1689339868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FNaq1i0YN4QmhH/IAuk4ARL3xays8BeSAQO3C7F6BBw=;
 b=ZtmDjOh6nET0TnqyOnzoM5sAkMdezuTzDySKcDtljpnePeaUXI7cLUdVPwfugjY0zr
 5suHnIoOQKW9toyTmg8p+XODiUx5VkcFgqDVo1xy7PFB8BaHUwvBBPlGjOOEeKNBxci7
 vczCw7FTbq4pOaNSN5w6jLVpxt6CXB6NrfJl9g6GfDflZX59/Y1EdemgX0tSB0zfdc14
 YtDQipmNNwgQ+/UOrv8X/b+BJua1xx6jdpcJOBKoprYCfskVc/gVqifKLux5XNL+1sna
 8+GifhkVG9yF20gI2eaheWq70e7NcIDSHZcCITGpF1SuMzd9367pLTLEVxn1fZzBqPCv
 1Spw==
X-Gm-Message-State: AC+VfDzJtcKsHjx5BslCpIecMw1KYr1tymwF4BWAOku+fNziZq6dk96W
 xcndOY2G1DkNUKtyw1nWxNjWb+nQjDNzOweSmufMjnWUoRmJYVM+463KJJWrdQVqIo7kbO1BQJU
 xNPy3Bn2qIIoYBKk=
X-Received: by 2002:a05:6000:100c:b0:306:2c16:8359 with SMTP id
 a12-20020a056000100c00b003062c168359mr8206208wrx.39.1686747868538; 
 Wed, 14 Jun 2023 06:04:28 -0700 (PDT)
X-Received: by 2002:a05:6000:100c:b0:306:2c16:8359 with SMTP id
 a12-20020a056000100c00b003062c168359mr8206187wrx.39.1686747868251; 
 Wed, 14 Jun 2023 06:04:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 o7-20020adfeac7000000b002fed865c55esm18321002wrn.56.2023.06.14.06.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 06:04:27 -0700 (PDT)
Message-ID: <bf83446d-f6b2-f605-7e7d-bdb9635b3b73@redhat.com>
Date: Wed, 14 Jun 2023 15:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 04/10] hw/ppc/spapr: Use machine_memory_devices_init()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20230601121447.272487-1-david@redhat.com>
 <20230601121447.272487-6-david@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20230601121447.272487-6-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.098, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DTwvA6LOPZ/R

On 6/1/23 14:14, David Hildenbrand wrote:
> Let's use our new helper and stop always allocating ms->device_memory.
> There is no difference in common memory-device code anymore between
> ms->device_memory being NULL or the size being 0. So we only have to
> teach spapr code that ms->device_memory isn't always around.
> 
> We can now modify two maxram_size checks to rely on ms->device_memory
> for detecting whether we have memory devices.
> 
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/spapr.c       | 37 +++++++++++++++++++------------------
>   hw/ppc/spapr_hcall.c |  2 +-
>   2 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index dcb7f1c70a..b53aa4b5a8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -546,10 +546,8 @@ static int spapr_dt_dynamic_reconfiguration_memory(SpaprMachineState *spapr,
>                                   cpu_to_be32(lmb_size & 0xffffffff)};
>       MemoryDeviceInfoList *dimms = NULL;
>   
> -    /*
> -     * Don't create the node if there is no device memory
> -     */
> -    if (machine->ram_size == machine->maxram_size) {
> +    /* Don't create the node if there is no device memory. */
> +    if (!machine->device_memory) {
>           return 0;
>       }
>   
> @@ -859,16 +857,23 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
>       int rtas;
>       GString *hypertas = g_string_sized_new(256);
>       GString *qemu_hypertas = g_string_sized_new(256);
> -    uint64_t max_device_addr = MACHINE(spapr)->device_memory->base +
> -        memory_region_size(&MACHINE(spapr)->device_memory->mr);
>       uint32_t lrdr_capacity[] = {
> -        cpu_to_be32(max_device_addr >> 32),
> -        cpu_to_be32(max_device_addr & 0xffffffff),
> +        0,
> +        0,
>           cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE >> 32),
>           cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE & 0xffffffff),
>           cpu_to_be32(ms->smp.max_cpus / ms->smp.threads),
>       };
>   
> +    /* Do we have device memory? */
> +    if (MACHINE(spapr)->device_memory) {
> +        uint64_t max_device_addr = MACHINE(spapr)->device_memory->base +
> +            memory_region_size(&MACHINE(spapr)->device_memory->mr);
> +
> +        lrdr_capacity[0] = cpu_to_be32(max_device_addr >> 32);
> +        lrdr_capacity[1] = cpu_to_be32(max_device_addr & 0xffffffff);
> +    }
> +
>       _FDT(rtas = fdt_add_subnode(fdt, 0, "rtas"));
>   
>       /* hypertas */
> @@ -2454,6 +2459,7 @@ static void spapr_create_lmb_dr_connectors(SpaprMachineState *spapr)
>       uint32_t nr_lmbs = (machine->maxram_size - machine->ram_size)/lmb_size;
>       int i;
>   
> +    g_assert(!nr_lmbs || machine->device_memory);
>       for (i = 0; i < nr_lmbs; i++) {
>           uint64_t addr;
>   
> @@ -2866,12 +2872,11 @@ static void spapr_machine_init(MachineState *machine)
>       /* map RAM */
>       memory_region_add_subregion(sysmem, 0, machine->ram);
>   
> -    /* always allocate the device memory information */
> -    machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
> -
>       /* initialize hotplug memory address space */
>       if (machine->ram_size < machine->maxram_size) {
>           ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
> +        hwaddr device_mem_base;
> +
>           /*
>            * Limit the number of hotpluggable memory slots to half the number
>            * slots that KVM supports, leaving the other half for PCI and other
> @@ -2890,12 +2895,8 @@ static void spapr_machine_init(MachineState *machine)
>               exit(1);
>           }
>   
> -        machine->device_memory->base = ROUND_UP(machine->ram_size,
> -                                                SPAPR_DEVICE_MEM_ALIGN);
> -        memory_region_init(&machine->device_memory->mr, OBJECT(spapr),
> -                           "device-memory", device_mem_size);
> -        memory_region_add_subregion(sysmem, machine->device_memory->base,
> -                                    &machine->device_memory->mr);
> +        device_mem_base = ROUND_UP(machine->ram_size, SPAPR_DEVICE_MEM_ALIGN);
> +        machine_memory_devices_init(machine, device_mem_base, device_mem_size);
>       }
>   
>       if (smc->dr_lmb_enabled) {
> @@ -5109,7 +5110,7 @@ static bool phb_placement_2_7(SpaprMachineState *spapr, uint32_t index,
>       int i;
>   
>       /* Do we have device memory? */
> -    if (MACHINE(spapr)->maxram_size > ram_top) {
> +    if (MACHINE(spapr)->device_memory) {
>           /* Can't just use maxram_size, because there may be an
>            * alignment gap between normal and device memory regions
>            */
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index b904755575..1dd32f340f 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -31,7 +31,7 @@ bool is_ram_address(SpaprMachineState *spapr, hwaddr addr)
>       if (addr < machine->ram_size) {
>           return true;
>       }
> -    if ((addr >= dms->base)
> +    if (dms && (addr >= dms->base)
>           && ((addr - dms->base) < memory_region_size(&dms->mr))) {
>           return true;
>       }

