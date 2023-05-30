Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2109855ejb;
        Tue, 30 May 2023 04:43:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6REd3kdAGIHoYIc8Ao3BMlUHMP4G2j90NvCGY1aEt5i9GWHK9iZ1Ki/f2Ydok69FDQDzGJ
X-Received: by 2002:a05:620a:2627:b0:75b:23a1:d8d0 with SMTP id z39-20020a05620a262700b0075b23a1d8d0mr1819630qko.20.1685447028270;
        Tue, 30 May 2023 04:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685447028; cv=none;
        d=google.com; s=arc-20160816;
        b=OeS85U4ZQgjLs12sDI8KWkiKLT/mc5iqGhA86HlA/9owq2F2kIbu0vJDtiWiaNUMj0
         fynCx6wX2jr8c9louc+QgENlaAWN5QrfNKOXWd2tYGykfqh9Rd6OKZVnUdWzZqorAB6K
         u1ieE7f2QbD5NETFRdBK310OOrEPSCglIBStJ/uHhHdTargul0INPP+Bf8/kzEmv66kM
         GJGAQGTJjK1Kr66o5H2Ag3qHwRDY3lYCWx/gCIidXmtUHzn1dLl+acgFL6CGT5TwtNUJ
         1qxAmcFwKhkru1JlE3KCh3ywjXG4s8hDfw6tBLFEV7zKh/cCxMVLmo+ceFaJ6Eh+dgxm
         TwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=MfqiIdYWGSpFpQR1eWKm45i/55j6izlWS2+3bv2D83Y=;
        b=EQ45L9bzVPhv+aSBPU/m+G2wrItyniwd//7Q3UZypJpTLwsBcCFNi5JAiERBmbTctA
         XHj+fccF6thmkiU2uzNLmgaHfGVuyUl9Mn7k7lkOfTxmxT3PgAN3N/hAXYk14rBsRGPb
         ZZAms2NRtLhSYezptuwxIB9pDCxnBpYCl4YXoJ5MDc7Tekk2oJ8s7YfD9/iSEvQivvhb
         GpfaFLQvMiCkD3mzWXkdjvn9dv5v3Oglx9G4YNZZj1KEmFDv9MGGHcMHkMhsIVwXmUjP
         MMFJtbjYmWQWLpLnZX8B9jBoJLOYxc06/7bV7dtx8K63qYSDN5E1ul8FYf3XQ/j4964c
         RKaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=breM2D3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020ae9e00a000000b0075c97a62d1fsi6248148qkk.76.2023.05.30.04.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=breM2D3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3xl4-0004Ni-4y; Tue, 30 May 2023 07:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xjS-0003bz-8b
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xjQ-0005Mw-1Z
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfqiIdYWGSpFpQR1eWKm45i/55j6izlWS2+3bv2D83Y=;
 b=breM2D3dsQVhZu5QiIGGRmAVmnWJO8+4IeKY8CKXa6JRcMZCL5FJbGZN9SGh0zXUj8ez1C
 skW6kcuK4AdzYN3N9UXUpC34YW2TXFa89IsqrlusZDPHpnrOpXFfyb+6uJObrDr85K4P8M
 JVk+hBvV3QrJVbaM7T2/mUWz9K5ossM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-ML8Grc5UOaKuwjCEQ2xnuQ-1; Tue, 30 May 2023 07:41:37 -0400
X-MC-Unique: ML8Grc5UOaKuwjCEQ2xnuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5fa06debcso27509065e9.0
 for <qemu-devel@nongnu.org>; Tue, 30 May 2023 04:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685446896; x=1688038896;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfqiIdYWGSpFpQR1eWKm45i/55j6izlWS2+3bv2D83Y=;
 b=H29O8qgPvPIwpWLeLAcdcN8vE8qPLTF4IM3KgOKUenGTh0UPFE9hZEUfxWWAa47nGO
 MKlzWQx9jen8BEigxpH4hEiIfZ7b7fXUi/Vo8CRsu1OXC6UcBzQUT8XmtSQ3mXxf8JIL
 ryFGb/kYL4Zrtjpqe1YSvKqRaxjJgF+R3V6Jj9vXWq0a20n2CJZwQ7gdlrIBfZbstgJg
 X5VAcbgN0A/q6LBs3kUTorI+odn8FA7s0vuGNFi689RcQsopHoJaR4mY/e/nU0svNYeV
 OUdK/po+yteqpWr+chF73lACP+esVBx36zfKRTUz/O4qb4ve4FncgA6gQBNr5/76G/IC
 kXZA==
X-Gm-Message-State: AC+VfDwp1fFq1d3/L8rn6Ipl8M5pQYMFybfFFtzfytCptIS5v+wgqWEb
 hTe7HcR/J/lYZe4EiiHqdjJMt8WMtZRCPEkMF0fzzH7zGDJ8ZFsSOCjMq4PeKwwUr2CwIPO1ROM
 E5ZQDRuJfEhOFl37WEvitbaLRml/5JyptU36qYUWeBdZR7Agztu5h+V7HHgM6uiDmEbhKFNo=
X-Received: by 2002:a5d:6289:0:b0:30a:e332:a3ba with SMTP id
 k9-20020a5d6289000000b0030ae332a3bamr1350071wru.27.1685446896306; 
 Tue, 30 May 2023 04:41:36 -0700 (PDT)
X-Received: by 2002:a5d:6289:0:b0:30a:e332:a3ba with SMTP id
 k9-20020a5d6289000000b0030ae332a3bamr1350036wru.27.1685446895848; 
 Tue, 30 May 2023 04:41:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73c:d500:78e5:f448:8bef:a30?
 (p200300cbc73cd50078e5f4488bef0a30.dip0.t-ipconnect.de.
 [2003:cb:c73c:d500:78e5:f448:8bef:a30])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4850000000b0030632833e74sm3053710wrs.11.2023.05.30.04.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 04:41:35 -0700 (PDT)
Message-ID: <136b50b5-6c02-976d-edbc-16a3aacb0002@redhat.com>
Date: Tue, 30 May 2023 13:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/10] memory-device: Some cleanups
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: aQ3eeZ6AW69s

This was supposed to carry the "v2" indicator ;)


On 30.05.23 13:38, David Hildenbrand wrote:
> Working on adding multi-memslot support for virtio-mem (teaching memory
> device code about memory devices that can consume multiple memslots), I
> have some preparatory cleanups in my queue that make sense independent of
> the actual memory-device/virtio-mem extensions.
> 
> v1 -> v2:
> - Allocate ms->device_memory only if the size > 0.
> - Split it up and include more cleanups
> 
> David Hildenbrand (10):
>    memory-device: Unify enabled vs. supported error messages
>    memory-device: Introduce memory_devices_init()
>    hw/arm/virt: Use memory_devices_init()
>    hw/ppc/spapr: Use memory_devices_init()
>    hw/loongarch/virt: Use memory_devices_init()
>    hw/i386/pc: Use memory_devices_init()
>    hw/i386/acpi-build: Rely on machine->device_memory when building SRAT
>    hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
>    memory-device: Refactor memory_device_pre_plug()
>    memory-device: Track used region size in DeviceMemoryState
> 
>   hw/arm/virt.c                  |  9 +----
>   hw/i386/acpi-build.c           |  9 ++---
>   hw/i386/pc.c                   | 36 +++---------------
>   hw/loongarch/virt.c            | 14 ++-----
>   hw/mem/memory-device.c         | 69 +++++++++++++++-------------------
>   hw/ppc/spapr.c                 | 37 +++++++++---------
>   hw/ppc/spapr_hcall.c           |  2 +-
>   include/hw/boards.h            |  2 +
>   include/hw/i386/pc.h           |  1 -
>   include/hw/mem/memory-device.h |  2 +
>   10 files changed, 68 insertions(+), 113 deletions(-)
> 

-- 
Thanks,

David / dhildenb

