Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5638422lfq;
        Wed, 30 Sep 2020 08:40:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw++KA5OaqolYclp9VTJca+EHbfeaPObM0/IxfK2JZswAnNhS7J7LIk6woRWwckg9u5BC8V
X-Received: by 2002:a25:6848:: with SMTP id d69mr4027512ybc.205.1601480436280;
        Wed, 30 Sep 2020 08:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601480436; cv=none;
        d=google.com; s=arc-20160816;
        b=O5JanE8qyc6n95BRnHP0ffO50VrerG/WgDNKCTpGFu7cli7S/34D4IIgOwz8bZsiR7
         bJlbdbUf84KEa0hEgvhnXrxLbwymp2uzYmb7GoMQMBuV5sc3Xk4QmQsvbbNIcGL0PBnv
         f2wg5OIWWJHtRYRE3dvUqOIULJLmqXTR44mQd2K0ZNMSh44LGmQPwFkduadOUEVbaQrH
         Nccg7ACQ8MuDNlx4Dyx+Yoxptcqgwkoi7u4Txl2jACwXju0ou4KjdYjms+2EUNGw0liA
         bVfERBPwQB6JQfAVKmooDJPNfWuirsy38c9L/+ZxOsPjK3IrpriHiiEuF9AUVvsoGKBm
         /SuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=3umxhrU/2FUwG3HdagnADTtZ7F6SDnjSihkWqnQMnBw=;
        b=ALwvilxKc16T0L1liWbbpzxJct1RSoH8Nd6CVMg+TKUhyCxMimNPMwmkr3MEOBS+RM
         FzwV/BWpoMdDyTy3wVXQVBHXFcyL8EpTgHUiYc9HnC/d6HHUJS2g5KUMUiYji1Dt/AWW
         d8ove/d0haBNsBgMmkbgkGULj1bqb3ciOSngsL/QKrZWAIM0CSESwMYAE7gwQ+TBvYmx
         zevCTnLBWUE8jrji3Uc79n8x84EBo9aaWCUYWAeyA35LXWcd9BjYYss+zukNfBNtM5j9
         cJTnlVRFJznG4lD6wJop8IoqxeYwqg6TPQ3cvPzPqv4h6ObJ3sVZCQbx9x6FsgQkNsYa
         81Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=idFjxfn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si2070634ybj.342.2020.09.30.08.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 08:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=idFjxfn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNeDb-0005Up-KP
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 11:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNeBn-0003sq-PJ
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 11:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNeBl-000052-9k
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 11:38:43 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601480320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3umxhrU/2FUwG3HdagnADTtZ7F6SDnjSihkWqnQMnBw=;
 b=idFjxfn72J+kEhdjyWFJXg0rkBxBSthDBAal2MYBP5Z/+si4lzegqsEMUURpYN61o2hPT6
 JGN2fCOZyR5NhwIwdN1EECxj/w/fgifB+jgwBrWwFIzNcU9Jvf4hBQFhfS9CmbrF9aoW4c
 f8JbZubmOsDXzwToVXVGYWQyyYIoByI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-r_CjBWXnNdWD6nfW68SKuw-1; Wed, 30 Sep 2020 11:38:37 -0400
X-MC-Unique: r_CjBWXnNdWD6nfW68SKuw-1
Received: by mail-wm1-f70.google.com with SMTP id 23so609933wmk.8
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2020 08:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3umxhrU/2FUwG3HdagnADTtZ7F6SDnjSihkWqnQMnBw=;
 b=b0iuBxKjMdeSQ9Eyo9hP2Fm+75Ir/2alobDbf61rgyaQOB1E0GncahrWbCP3lLgRmx
 sADIq3OGxuBQqhOzaoiVGQyziVMCAKfnnaOImzX8hsoiw4qDTH+OhpeJrU7I6gQgTGqn
 isJOQzuEWhU60IWjF/B6psX8CPLgimlvTbiGd/qI7sm7JEzW5EtOpMVGlZeXSTsuWoP8
 AefasQCUKE4aJa8dwFltmnPxdzqRhHmXWYWLr6UUu7WJFVg6rjeymQDRojbFc1SCufdL
 1RtPPa7zWbwBOLhKg1liqgl5SbX0oUIkM7vuOFIIHZdQrdjdyUXchAgKQdk/diAmCv1t
 +Q4w==
X-Gm-Message-State: AOAM532aKTaBfgm7x2rqkdFzOzLsU9CvEEaHwHWxhpTwuGsZxViC1N8v
 yu81Qt0YS3C/+kMJPdFATWkhwlEgwTi8MRyABfrPb2NCtdluK+uafZ9RhLGEd8rfurLYNoud84Z
 uRXI/Zpu3deeR
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr4144744wrw.198.1601480315596; 
 Wed, 30 Sep 2020 08:38:35 -0700 (PDT)
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr4144728wrw.198.1601480315382; 
 Wed, 30 Sep 2020 08:38:35 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id x17sm3937042wrg.57.2020.09.30.08.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 08:38:34 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 04/28] hw/arm: Express dependencies of the
 highbank machines with Kconfig
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20190505135714.11277-1-thuth@redhat.com>
 <20190505135714.11277-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f2489790-8fcd-a9c3-4ec3-c8a72240f172@redhat.com>
Date: Wed, 30 Sep 2020 17:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20190505135714.11277-5-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Giyv9nqmanIr

Hi Thomas,

On 5/5/19 3:56 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the highbank machine (and the midway
> machine).
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  9 +--------
>  hw/arm/Kconfig                  | 11 +++++++++++
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2a11e76cc7..50a4be3cad 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=y
>  CONFIG_PCI_TESTDEV=y
>  
>  CONFIG_EXYNOS4=y
> +CONFIG_HIGHBANK=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -45,24 +46,17 @@ CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
>  CONFIG_ARM11MPCORE=y
> -CONFIG_A15MPCORE=y
>  
>  CONFIG_NETDUINO2=y
>  
> -CONFIG_ARM_TIMER=y
> -CONFIG_PL011=y
> -CONFIG_PL022=y
> -CONFIG_PL031=y
>  CONFIG_PL041=y
>  CONFIG_PL050=y
> -CONFIG_PL061=y
>  CONFIG_PL080=y
>  CONFIG_PL110=y
>  CONFIG_PL181=y
>  CONFIG_PL190=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
> -CONFIG_XGMAC=y
>  CONFIG_PXA2XX=y
>  CONFIG_BITBANG_I2C=y
>  CONFIG_FRAMEBUFFER=y
> @@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>  
>  CONFIG_STRONGARM=y
> -CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
>  
>  # for realview and versatilepb
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index acd07b2add..0ba377ac18 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -18,6 +18,17 @@ config EXYNOS4
>  
>  config HIGHBANK
>      bool
> +    select A9MPCORE
> +    select A15MPCORE
> +    select AHCI
> +    select ARM_TIMER # sp804
> +    select ARM_V7M

Hmm I missed that... This machine doesn't use a v7M core, right?

> +    select PL011 # UART
> +    select PL022 # Serial port
> +    select PL031 # RTC
> +    select PL061 # GPIO
> +    select PL310 # cache controller
> +    select XGMAC # ethernet
>  
>  config INTEGRATOR
>      bool
> 

