Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1562527ejy;
        Mon, 19 Sep 2022 22:16:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7L300sk7tn5R/88Z5A+XG/ozVzyRg4q/YWo1gaBaSo+9I7WTCkkB7gSrSnbuZBGkW6F7ON
X-Received: by 2002:a17:90b:4f4b:b0:200:876b:c1c8 with SMTP id pj11-20020a17090b4f4b00b00200876bc1c8mr2050887pjb.32.1663650964681;
        Mon, 19 Sep 2022 22:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663650964; cv=none;
        d=google.com; s=arc-20160816;
        b=rOF4Aj9PNDRR6zF+zlvkBMuCc7SrXU6hRY0A+ka0RfNI1cKbKls/Zj34OtuMXhh+AN
         K/Sqj7EdIM363q58irpJldRX/hF64PHYKb1kkEoDkjX20Sam280uP5Alu5EfpHWcJ3d3
         Qmhe+JxImzyZ0qGrj7Ve09SX1JVFrz9VkOh+zei0UwJrqZZxzBBoAycC38Hdv5HI0oqs
         4U5kBzU4VPOtInAJz4zK0wDoc9blmgDxtqDWtmbmr6RbAnwONxrhj+u2WzEhnxOTIFmm
         MH2pswMz0i3AzzuUvcLaLDxyAOQ2mrNqX81Spm2kuDGPe9XU0u281TYOnW0wF8Q9x1LM
         jnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:dkim-signature;
        bh=zoCj17/FoLXwtexZcC8HC08ap2gyp0m31eL5ZvThkKo=;
        b=iKpo5crrgocE6fonBHD7/A+bLZBhT8ZWNs+qtWx9G8ts0pICJ8nZBQyaRngosPNwWd
         ZYGJayBAoMZM8kuoSP1dawavg3/Tp7JmdT9nkmeS8M/X+PLN35tp1Gf2WavfZV5RP5oj
         er/ZGJNh6qYqrQQc4YZA5OTfIXknwqWfD8YwbTuAeQwr95/dpz//XuHSfF4tMr2GmXeb
         NkYnyegiQMRARGxh59VD7KGF9ke0WQunD2DmvJTwTiCxZp0GYP7ConScGoocHX+bEYUA
         /eseI15QTCP+A3yS5ANk1nlJ/EhL80AJH4VTMJcy/stoF5TucEkdVb+NViUEKOFCaG1j
         LH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=R32rY7NS;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id z12-20020a6553cc000000b0043882f3e747si623555pgr.619.2022.09.19.22.16.04;
        Mon, 19 Sep 2022 22:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=R32rY7NS;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiITFQD (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Tue, 20 Sep 2022 01:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiITFQB (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Sep 2022 01:16:01 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C9C49B74
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 22:15:59 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r7so2424839wrm.2
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 22:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=zoCj17/FoLXwtexZcC8HC08ap2gyp0m31eL5ZvThkKo=;
        b=R32rY7NSj7Fx9wnIFsIakEDibCO9xnK1hZUIT2HKqPdw/Ary8UunlhchQEe50uZAKt
         IcHwDoHg8BNyr+4XdYGESfHcm//PXvOEVjvXhZPD7y8P5Fpsvk8XUpPTrNV902a8L/l1
         kcrrndYyNFP2f9XhMPsIOO8AQ/iM1BglRxvcvsKItT0E660ecmBZDaSsn0HIoqSf61pq
         K8m/cNkANRYMDuR3+HLK4MzuEAvEdEvPrSnSDqRQAwpf1NMYx6hw3Df9VJdBqPRBqe1C
         BtFe2Lxkcsnodwk0vjI79xEIH7dEOtyIxG8EM0q8g5XNnP9vD2TPzFgVglIz9uW5QTr9
         RzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=zoCj17/FoLXwtexZcC8HC08ap2gyp0m31eL5ZvThkKo=;
        b=YHLaR9rl0EhvlWmx9Jk0tCJsgsvguVtyJMGYkVQ5+gPisMuuGpYJTqfXozdg0n96uJ
         DKHQmK/GWzxj3DRn8qkUxgoidzxwXodmkpIh/3h/MgDz4jAyn3Y1jNCiMcPa3k1FljTd
         FMNaJEmvBSeL0d2rx/DoTVqAqBQOiYx4KH59IOVTtN30nxGYSq8Sn1Qjx13YDgdz9O/s
         afvZarKMPmVzpKCEcKijpIfs79Kuqfg4b3Cy/hsk/00Nf0vEGwfJODF9AOF4v4f2d4mM
         UiFyLXoCeDTtZXZg/wXtO+tGQ09+P0MEW8uBFWLe2k7UKHfn7pg4AaoysM0Vm6qw93zd
         OBUA==
X-Gm-Message-State: ACrzQf3gII3kIIpTb7ttN7R5U/Z/VhYvJAhHr/S8lpYXKJHuM0TPEz9Q
        XFs92WMVgqylN71avCXEgpE=
X-Received: by 2002:a05:6000:2a7:b0:22a:f98f:b75f with SMTP id l7-20020a05600002a700b0022af98fb75fmr6627886wry.373.1663650957809;
        Mon, 19 Sep 2022 22:15:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id t1-20020adfdc01000000b002252ec781f7sm480793wri.8.2022.09.19.22.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 22:15:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Message-ID: <e1ef18a0-6a85-e536-1fbd-9f8794dc0217@amsat.org>
Date:   Tue, 20 Sep 2022 07:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 9/9] exec/address-spaces: Inline legacy functions
Content-Language: en-US
To:     Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Bandan Das <bsd@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Sergio Lopez <slp@redhat.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Xiaojuan Yang <yangxiaojuan@loongson.cn>,
        Cameron Esfahani <dirty@apple.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Song Gao <gaosong@loongson.cn>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Greg Kurz <groug@kaod.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Markus Armbruster <armbru@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
        Eduardo Habkost <eduardo@habkost.net>,
        =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
        qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Helge Deller <deller@gmx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Havard Skinnemoen <hskinnemoen@google.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Alexander Graf <agraf@csgraf.de>,
        Thomas Huth <thuth@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Eric Farman <farman@linux.ibm.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Alexander Bulekov <alxndr@bu.edu>,
        Yanan Wang <wangyanan55@huawei.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        xen-devel@lists.xenproject.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Snow <jsnow@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
        Qiuhao Li <Qiuhao.Li@outlook.com>,
        John G Johnson <john.g.johnson@oracle.com>,
        Bin Meng <bin.meng@windriver.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Alistair Francis <alistair@alistair23.me>,
        Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-10-shentey@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220919231720.163121-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: uCNx7MUjET3O

On 20/9/22 01:17, Bernhard Beschow wrote:
> The functions just access a global pointer and perform some pointer
> arithmetic on top. Allow the compiler to see through this by inlining.

I thought about this while reviewing the previous patch, ...

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/exec/address-spaces.h | 30 ++++++++++++++++++++++++++----
>   softmmu/physmem.c             | 28 ----------------------------
>   2 files changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
> index b31bd8dcf0..182af27cad 100644
> --- a/include/exec/address-spaces.h
> +++ b/include/exec/address-spaces.h
> @@ -23,29 +23,51 @@
>   
>   #ifndef CONFIG_USER_ONLY
>   
> +#include "hw/boards.h"

... but I'm not a fan of including this header here. It is restricted to 
system emulation, but still... Let see what the others think.

>   /**
>    * Get the root memory region.  This is a legacy function, provided for
>    * compatibility. Prefer using SysBusState::system_memory directly.
>    */
> -MemoryRegion *get_system_memory(void);
> +inline MemoryRegion *get_system_memory(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.system_memory;
> +}
>   
>   /**
>    * Get the root I/O port region.  This is a legacy function, provided for
>    * compatibility. Prefer using SysBusState::system_io directly.
>    */
> -MemoryRegion *get_system_io(void);
> +inline MemoryRegion *get_system_io(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.system_io;
> +}
>   
>   /**
>    * Get the root memory address space.  This is a legacy function, provided for
>    * compatibility. Prefer using SysBusState::address_space_memory directly.
>    */
> -AddressSpace *get_address_space_memory(void);
> +inline AddressSpace *get_address_space_memory(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.address_space_memory;
> +}
>   
>   /**
>    * Get the root I/O port address space.  This is a legacy function, provided
>    * for compatibility. Prefer using SysBusState::address_space_io directly.
>    */
> -AddressSpace *get_address_space_io(void);
> +inline AddressSpace *get_address_space_io(void)
> +{
> +    assert(current_machine);
> +
> +    return &current_machine->main_system_bus.address_space_io;
> +}
>   
>   #endif
>   
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 07e9a9171c..dce088f55c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2674,34 +2674,6 @@ static void memory_map_init(SysBusState *sysbus)
>       address_space_init(&sysbus->address_space_io, system_io, "I/O");
>   }
>   
> -MemoryRegion *get_system_memory(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.system_memory;
> -}
> -
> -MemoryRegion *get_system_io(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.system_io;
> -}
> -
> -AddressSpace *get_address_space_memory(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.address_space_memory;
> -}
> -
> -AddressSpace *get_address_space_io(void)
> -{
> -    assert(current_machine);
> -
> -    return &current_machine->main_system_bus.address_space_io;
> -}
> -
>   static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
>                                        hwaddr length)
>   {
