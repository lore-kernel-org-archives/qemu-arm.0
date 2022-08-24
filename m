Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1974354ejc;
        Wed, 24 Aug 2022 01:07:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xPF/2rLJaoxihJLwdLc9VlTbS+mPj/dj3TCZHbcF8Y1QeV02oLXd0r5sxhQmPUkDE+G8D
X-Received: by 2002:a37:755:0:b0:6ba:fcb7:1949 with SMTP id 82-20020a370755000000b006bafcb71949mr18588612qkh.590.1661328453065;
        Wed, 24 Aug 2022 01:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661328453; cv=none;
        d=google.com; s=arc-20160816;
        b=Lrrv5kBWWWgGY0Adc8hT8czmPnhO4iSSlW39tUGLCvIr822X0VS/MP7xgO7JiayE1e
         l3hRaIqQZNRwnpmC0aK18o9Uchats2bE3QACt0GX/Fa9TByggQQzWXAXj3vEHu46dEXP
         sysNl/OdiFvAk+Fh7CN19kmJwKJnyRZ4p0vA2lmaA5JHXjWnxdv6R83/NkhiVfR9cj4y
         mHjCEK686De+VYG/DoXdVgrHAPrQGhwdWmjSbNuVsV55rAhOLG65C+dfrBC+3KrUefCe
         rS/eReJjxZlTkpOvIJARSK761eIAzPOV2+D43QA6mqG0xb64ln2O8COhOWkseo342WX1
         Tv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=agflgaflTBOwGFb0gjJzF7s1UfuruAV9dLoW+MoUvow=;
        b=i4bIw4z/aIq86y2w3nWKGQlD2fX+xXG4XJdrw4i/94ri0M4vsWZzgCn6d/JQdoVGZs
         BEda3H9jGK9UE36V7jKlXR2jRmQMGqEPDPRCEcA4SiE9wr6k41LZGoBggGoOnpD1n9Vc
         UZjR+4upYUWOegTEBOurIA+uUUPhLF9uEtFIDSA70zXpM4x6Y49RCK0Y4if8+zW1f9tI
         j3BUjgUdcYQyn+v/7bOA4VD9cK/qHH+PQfFWKbHv7QLOE3JLPOoXflzM63KNuWkMwjhA
         RnBSRwcmYsDqO13drwKzUPgA6uLGcWRFsBgTiF1J0THf4tnv0Se+7FqUTrfAa/8okJ6P
         liqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hIvB00HG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de12-20020a05620a370c00b006bbb8c42abcsi7194159qkb.352.2022.08.24.01.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 01:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hIvB00HG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQlQC-0000Gl-Cm
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 04:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oQlPV-0000FH-NR
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 04:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oQlPR-0003qi-Rl
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 04:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661328404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agflgaflTBOwGFb0gjJzF7s1UfuruAV9dLoW+MoUvow=;
 b=hIvB00HGcNjmpKkUVC6P03MFKLHDB9OVW86e3OGB7CctwjURkMf3mBOgZcu4DASQwGp3r4
 h70PyPA4gSic237wDokbk50jU74JUZtQerKxQuh6jlIwgDKHl6miTy/F7PyMwmNSY6nAtb
 KkehFNh6pAroO8XFDlR+8HcsroTAOk8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-z7ufQfLZNIqN08P1qEdWJg-1; Wed, 24 Aug 2022 04:06:41 -0400
X-MC-Unique: z7ufQfLZNIqN08P1qEdWJg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r8-20020adfbb08000000b00225239ce4deso2589032wrg.1
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 01:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=agflgaflTBOwGFb0gjJzF7s1UfuruAV9dLoW+MoUvow=;
 b=VsmEuTLPNxdRtg28FylvcWnBX+UIU0jkqD2OhoEF1DiDPypQcHptwlUGM2/ASNmltG
 ct+oInGC73q0nSV7FCiZYoVYkCqa/YaHKyGwdM7wKPG2mIV0EGczixGW9SQLTnkd5BUk
 66smiWZxeCvpib7mmPNNd+S8PVCv6Xgw8cjWW7fTDH9HQ78M+5+E7FuL7wpVPVwjThg5
 Vns7WF3mnfFQCIN1d/AVu7W/bTUXAlA1QOICWA0l3dLRL+xbZggt6bXhZkyquCzp13lC
 ifbTPXDN+69S1nXl29NMhm3XE9s7x7te8em2giGbqYdrssdB5mIA6AUO1/3j2yZLtCVz
 /pGg==
X-Gm-Message-State: ACgBeo24r1hdtX9NyVewiOeOt5Ov/3XK3rjsnCZe9cT8wgSEZnQt5MYv
 b33Tqd9c2gcsS8CUhNh2C6q2I7Y7noLJQVDI49HM0Un8qGNufJdza9GrXyn15pgo3p4KCjfLV0m
 bb6hgqw0S4hj0
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr16482613wrs.358.1661328400401; 
 Wed, 24 Aug 2022 01:06:40 -0700 (PDT)
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr16482593wrs.358.1661328400149; 
 Wed, 24 Aug 2022 01:06:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a056000023c00b00225213fd4a9sm16175683wrz.33.2022.08.24.01.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 01:06:39 -0700 (PDT)
Message-ID: <67f44b09-7c9a-fd83-d222-f505a91ca99e@redhat.com>
Date: Wed, 24 Aug 2022 10:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, peter.maydell@linaro.org, richard.henderson@linaro.org,
 shan.gavin@gmail.com
References: <20220815062958.100366-1-gshan@redhat.com>
 <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: j4jEbOZGjPJB

Hi Gavin,

On 8/24/22 05:29, Gavin Shan wrote:
> Hi Marc,
>
> On 8/15/22 4:29 PM, Gavin Shan wrote:
>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>> are floating on highest RAM address. However, they can be disabled
>> in several cases.
>>      (1) One specific high memory region is disabled by developer by
>>      toggling vms->highmem_{redists, ecam, mmio}.
>>      (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>      'virt-2.12' or ealier than it.
>>      (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>      on 32-bits system.
>>      (4) One specific high memory region is disabled when it breaks the
>>      PA space limit.
>>      The current implementation of virt_set_memmap() isn't comprehensive
>> because the space for one specific high memory region is always
>> reserved from the PA space for case (1), (2) and (3). In the code,
>> 'base' and 'vms->highest_gpa' are always increased for those three
>> cases. It's unnecessary since the assigned space of the disabled
>> high memory region won't be used afterwards.
>>
>> The series intends to improve the address assignment for these
>> high memory regions:
>>
>> PATCH[1] and PATCH[2] are cleanup and preparatory works.
>> PATCH[3] improves address assignment for these high memory regions
>> PATCH[4] moves the address assignment logic into standalone helper
>>
>> History
>> =======
>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>>
>> Changelog
>> =========
>> v2:
>>    * Split the patches for easier review                        (Gavin)
>>    * Improved changelog                                         (Marc)
>>    * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
>>
You did not really convince me about migration compat wrt the high MMIO
region. Aren't the PCI BARs saved/restored meaning the device driver is
expecting to find data at the same GPA. But what if your high MMIO
region was relocated in the dest QEMU with a possibly smaller VM IPA?
Don't you have MMIO regions now allocated outside of the dest MMIO
region? How does the PCI host bridge route accesses to those regions?
What do I miss?

Thanks

Eric
>
> Could you help to review when you have free cycles? It's just a kindly
> ping :)
>
> Thanks,
> Gavin
>
>>
>> Gavin Shan (4):
>>    hw/arm/virt: Rename variable size to region_size in virt_set_memmap()
>>    hw/arm/virt: Introduce variable region_base in virt_set_memmap()
>>    hw/arm/virt: Improve address assignment for high memory regions
>>    virt/hw/virt: Add virt_set_high_memmap() helper
>>
>>   hw/arm/virt.c | 84 ++++++++++++++++++++++++++++++---------------------
>>   1 file changed, 50 insertions(+), 34 deletions(-)
>>
>

