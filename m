Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5668798lfq;
        Wed, 30 Sep 2020 09:17:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh0duQ0hNxNrsh1f7pwl0xySxhx4I0subPjdqR9rjI/qeASEDwd/nwMw+5iUD/pgcAJolJ
X-Received: by 2002:a25:abc2:: with SMTP id v60mr4556754ybi.467.1601482650523;
        Wed, 30 Sep 2020 09:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601482650; cv=none;
        d=google.com; s=arc-20160816;
        b=e4cQ+vETsivx9FiuUpLmRvWdrp8cORrp9jrxjgQTPzXalDHQVhfN5ic+4uAiqjdXVy
         H3nCJ6ZI5JTzEPppsjqSE5WvNP9gXRONJnYDjL1lLZZ4giwVs+7l8vMvTbkWRg+qBalG
         lZULbylu0XKDoBThUqJ46aB45wgQcXlVdfkufBorlgN2onATE3jZREwNIs5pyuo++Znv
         CBqqTl5sWDUXypZMOhIbvyd+0BmP9p0w72ZK/DO6mfvIvGZbbXgle9YCZ7c5KV3iQHgj
         /hHb6TtjGtpI6OCM8VNIxWJsOgJcX6ZhYuIj19b1CS3egQWFCZRiVO1oaW4FXuB53zfW
         VCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=zE4/WyurK5yQ4i1ZCyTvcfzgw23AZ3fmpBgVSNh9/Vo=;
        b=Yu/TE7KVVpl/pRDRT0C8LYhLa7eCI9kI2swUgEwDfLC7ug9MiECEGFh/XjcVQpOUne
         iKOKypEcCX4Zi253+DYHStnc2+U99gesEdWysiBmJXoumKHCamkujXocruE07d0MNReq
         wT73mgkhDpkrEWeOs8QP2YH0p2E768QCOjiRnsjfdkedYiPExgrOPSIEJ4WArkUU+y3b
         3My5doyroLZGlSQktQB5Je+fZxSxC7Ttar/PFdcgcIH87lDrQy0Rdw6t7ostXcaiXBlq
         0IUWdz2C0srR+ToxMCcsJa/FtvofSBYZpHLZd+zOtRUx6QLX769D9aCiTImyGgHTsg3U
         xxUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=duEyk0Pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si2147145ybs.243.2020.09.30.09.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 09:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=duEyk0Pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNenJ-0006pL-S3
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 12:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNen8-0006p8-GS
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 12:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNen6-00047n-A9
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 12:17:18 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601482635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zE4/WyurK5yQ4i1ZCyTvcfzgw23AZ3fmpBgVSNh9/Vo=;
 b=duEyk0PeCjyaJYnXGsZ/8xbAEj7dHDi5V7UibeOUzEuh0gQ18KuQSyLfDWdeqJpy/zmV1T
 NuLzqZzHl84PEb9eBXnNMdSnCkTpNZMRzS6Dz8xhmwJUv+70cFeFqqknc0sh/9L8OA6Vkt
 jj+frdawtjTHgGdsFGoXWyiJmi287rw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Reg0Q7n0PbudJT2oyiTvRw-1; Wed, 30 Sep 2020 12:17:13 -0400
X-MC-Unique: Reg0Q7n0PbudJT2oyiTvRw-1
Received: by mail-wm1-f69.google.com with SMTP id r83so22533wma.8
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2020 09:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zE4/WyurK5yQ4i1ZCyTvcfzgw23AZ3fmpBgVSNh9/Vo=;
 b=MicT7QaUlsvqZVJKC7AJWWCt/IZ5FrdMgsi2IDwaac5eLsC6PIrSop8t2kFoCROD5g
 c+iqA9UeInVS//NtscEdvsKP5sf0G+1PmFxzpsRqCoyYo65KO8KmwVb7X7ZfARkfg7o7
 fOhi/kWgu3O0293aeIePhVmS7kOaWJZk21OER60rfU9qj2XMIfLsDHwC7kl96S1Qeo6C
 oTct9+AHfHrsdTFFMLLeQf/emzblu/IDRe/yI8t5wwtcr28jdugsbBfyVgZtEIbM8Xi7
 yL0zl2AXEPRIWJ9ywDP5WcH3qq+j8vwFeOYOux+W14zXvqsfFe8YjU2RG8EPrEAOztWW
 /Q2A==
X-Gm-Message-State: AOAM531sboRhyb7M/lpuioouJhFOa3eud+Z3uCS7zMR5yI/PcKStzhh6
 6UaTVXxpl1ZSO4KDmxoKYfhWKw6BvrR5FNPL0gnpl2CwFB9FZLklfgHgeKJnZliBgwObnX/yMTK
 lb3GzyAN75p3w
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr3913606wmf.20.1601482631753; 
 Wed, 30 Sep 2020 09:17:11 -0700 (PDT)
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr3913583wmf.20.1601482631546; 
 Wed, 30 Sep 2020 09:17:11 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id b8sm3595152wmb.4.2020.09.30.09.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 09:17:10 -0700 (PDT)
Subject: Re: [Qemu-devel] [PULL 04/28] hw/arm: Express dependencies of the
 highbank machines with Kconfig
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20190505135714.11277-1-thuth@redhat.com>
 <20190505135714.11277-5-thuth@redhat.com>
 <f2489790-8fcd-a9c3-4ec3-c8a72240f172@redhat.com>
 <b56334d8-e165-4aac-2092-2912d442e6a9@redhat.com>
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
Message-ID: <72ee8d49-eb98-8fe3-208b-67d8e093e9ca@redhat.com>
Date: Wed, 30 Sep 2020 18:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b56334d8-e165-4aac-2092-2912d442e6a9@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: doo5WOk05qmV

On 9/30/20 6:10 PM, Thomas Huth wrote:
> On 30/09/2020 17.38, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 5/5/19 3:56 PM, Thomas Huth wrote:
>>> Add Kconfig dependencies for the highbank machine (and the midway
>>> machine).
>>> This patch is slightly based on earlier work by Ákos Kovács (i.e.
>>> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  default-configs/arm-softmmu.mak |  9 +--------
>>>  hw/arm/Kconfig                  | 11 +++++++++++
>>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index 2a11e76cc7..50a4be3cad 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=y
>>>  CONFIG_PCI_TESTDEV=y
>>>  
>>>  CONFIG_EXYNOS4=y
>>> +CONFIG_HIGHBANK=y
>>>  
>>>  CONFIG_VGA=y
>>>  CONFIG_NAND=y
>>> @@ -45,24 +46,17 @@ CONFIG_PLATFORM_BUS=y
>>>  CONFIG_VIRTIO_MMIO=y
>>>  
>>>  CONFIG_ARM11MPCORE=y
>>> -CONFIG_A15MPCORE=y
>>>  
>>>  CONFIG_NETDUINO2=y
>>>  
>>> -CONFIG_ARM_TIMER=y
>>> -CONFIG_PL011=y
>>> -CONFIG_PL022=y
>>> -CONFIG_PL031=y
>>>  CONFIG_PL041=y
>>>  CONFIG_PL050=y
>>> -CONFIG_PL061=y
>>>  CONFIG_PL080=y
>>>  CONFIG_PL110=y
>>>  CONFIG_PL181=y
>>>  CONFIG_PL190=y
>>>  CONFIG_PL330=y
>>>  CONFIG_CADENCE=y
>>> -CONFIG_XGMAC=y
>>>  CONFIG_PXA2XX=y
>>>  CONFIG_BITBANG_I2C=y
>>>  CONFIG_FRAMEBUFFER=y
>>> @@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=y
>>>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>>>  
>>>  CONFIG_STRONGARM=y
>>> -CONFIG_HIGHBANK=y
>>>  CONFIG_MUSICPAL=y
>>>  
>>>  # for realview and versatilepb
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index acd07b2add..0ba377ac18 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -18,6 +18,17 @@ config EXYNOS4
>>>  
>>>  config HIGHBANK
>>>      bool
>>> +    select A9MPCORE
>>> +    select A15MPCORE
>>> +    select AHCI
>>> +    select ARM_TIMER # sp804
>>> +    select ARM_V7M
>>
>> Hmm I missed that... This machine doesn't use a v7M core, right?
> 
> I think you're right: The machines seem to use A9 and A15 ... so I guess
> this was a copy-n-paste bug ... could you send a patch to clean it up,
> please?

Yes, will do.

> 
>  Thomas
> 

