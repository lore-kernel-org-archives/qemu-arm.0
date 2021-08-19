Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp391400lfg;
        Thu, 19 Aug 2021 07:42:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxySA8Gs4+vyyCsQ0i02CIeI3nFc2b5fxXxMB3JYnOANFPZ6j0yPvLhdTc/Z2fh0eKYSJGj
X-Received: by 2002:a05:6102:2245:: with SMTP id e5mr12852179vsb.11.1629384143738;
        Thu, 19 Aug 2021 07:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629384143; cv=none;
        d=google.com; s=arc-20160816;
        b=wLmh2VtxihjzU624dOOwIOOHbdlljA6jybkk3nNPDqLRmTU5SZ5DC8Tjsevl7SfLBm
         zHIM4aVGXL6HObgMw8OxotCMl7JJvtNKmg9O4j5l0yH4qwADHbRQwcI3D5AB41Wfcgvq
         gce7zF0YsyG5FnrbrUOxO0f3ddtEEI7c3XtM5rrvG5c6QZBLNpmOcgDlJ//x8oZIRN5L
         fQXO32k1eZes1K4BDGVUu2MD1wt+mKOKWnPZ0FOQooIAHZcnW/UC18AMTEoM3Xs2dwzR
         l7NSNZhAz+BNMtKg5QcQ3ttSq2hZBYGw9/qs9eBi47nFY+qWTtl1XKrHteoCEavbx803
         SqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0pZTp2mVYflip3E5nsRQNy5q7lJCW3zlxbnnjwbkQAg=;
        b=fC26rUJRxMhDhxf3pw/CBh/LDXIF9znnbiiX0PTLW0k1+4Hdpi6DlOsrEsfYCMy6Ce
         n32hUSuX0V29YTk8FrNCBo2/KY4GEL49xFWrFEam+pRNbljKJVEgs1Mvoggq2jNDFgrp
         gflpBEWGfb23MCvAaOxezjRuIKsOeumNQBbAzexBywDy1IAYP5+S/PeL01GogsmR807S
         mfvy7aHKfL+w1aWAqGzlu4vlmuDXjphQnPopyNnxhsfvr0OdOPjCLOnDIvSPStvvf00M
         s3lQpFOHmq8vCSXjqGUSY1rS60Ic5vyBcesqQ6NG28TT5oNTW7bDd9SY0maKhc8ZM17e
         JIXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NICOvIr/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si744143uam.9.2021.08.19.07.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="NICOvIr/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGjFP-0001OJ-1b
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEG-0008VV-Sp
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEF-0006p5-3j
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pZTp2mVYflip3E5nsRQNy5q7lJCW3zlxbnnjwbkQAg=;
 b=NICOvIr/gLDCH+WGytwA0EBmRVcif/FX/R+7GDipIfp6orf13jxTPkM3+LtUBKUYweerk/
 z4vD8quGPuc7kDffxcOwEVBNg6rYLaaXpE/zMXuspmRMEFxl4YLei5ijebn0Ppnmb8IjjH
 Knga+RfyfeW1j+2+9JT6SPZU+4WTLos=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-E3U5f0WDN0Sww6RYH2jECg-1; Thu, 19 Aug 2021 10:41:09 -0400
X-MC-Unique: E3U5f0WDN0Sww6RYH2jECg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so3567693wmd.7
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0pZTp2mVYflip3E5nsRQNy5q7lJCW3zlxbnnjwbkQAg=;
 b=oTFg7WxjUQIq6Hhjk92YiVorlze3e0eGgM+F2VjEWvr4lfy47wOL6sdZNx+anCG76W
 chIFA2JdNmVnMpvHgaZobPxErtnYpvF01js79+Adfnlge43SYOGgk6FF6MIyQayEjiey
 dMoCR92c08SkvPnkmFvYXGCWzuQCEslVwBciw9XwI+GQT1b7ksJm5sGbe5Bjvo7CciMJ
 j9hOBu7GRcf95Z+pxy2JZqCfehcz/x8JVaddFO+mV2IcO00arryfgcH4e9YZxytHTu/R
 1gkrAzJ97/sJOQt7iPhgvO8jIaNdZ2DhlcVhc1o0mfmzQqAw660OUYaK292yF6R0299D
 YOxg==
X-Gm-Message-State: AOAM533N7hmzqz8Qi2YzY4jTAmM/meO8J/1Skr3InueLXs3HAVZbx2FD
 v9yhQO7qUh8OAQTTelTUC2DJ1VWdeoyA74nfG0LtlvKTauezRinXygIZc7Gc5b9Oha054uR3CID
 RU19zsuwhu17r
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr4358468wrw.150.1629384067617; 
 Thu, 19 Aug 2021 07:41:07 -0700 (PDT)
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr4358445wrw.150.1629384067491; 
 Thu, 19 Aug 2021 07:41:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e11sm3103524wrm.80.2021.08.19.07.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:41:07 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
 <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
 <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
 <CAFEAcA_kB0-fHYBk1hJ87=Qoj0U-EbjhzVruhVhJKnexViG8_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0afe6cbb-cfb8-2b08-d081-e62fb6f26e8f@redhat.com>
Date: Thu, 19 Aug 2021 16:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kB0-fHYBk1hJ87=Qoj0U-EbjhzVruhVhJKnexViG8_g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ql3RZk4fDD8Q

On 8/19/21 4:38 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:32, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 8/19/21 4:22 PM, Peter Maydell wrote:
>>> On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> Replace g_malloc0() + address_space_init() by address_space_create().
>>>> Release the resource in DeviceUnrealize().
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
>>>>  hw/dma/xlnx_csu_dma.c |  9 ++-------
>>>>  2 files changed, 11 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
>>>> index fa38a556341..9f6b3fa47c6 100644
>>>> --- a/hw/dma/xlnx-zdma.c
>>>> +++ b/hw/dma/xlnx-zdma.c
>>>> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error **errp)
>>>>          };
>>>>      }
>>>>
>>>> -    if (s->dma_mr) {
>>>> -        s->dma_as = g_malloc0(sizeof(AddressSpace));
>>>> -        address_space_init(s->dma_as, s->dma_mr, NULL);
>>>> -    } else {
>>>> -        s->dma_as = &address_space_memory;
>>>> -    }
>>>> +    s->dma_as = address_space_create(s->dma_mr ?: get_system_memory(), NULL);
>>>>      s->attr = MEMTXATTRS_UNSPECIFIED;
>>>>  }
>>>
>>> Why are these devices doing a heap allocation rather than
>>> having an AddressSpace whatever field in their device struct ?
>>
>> To easily use &address_space_memory if 'memory' link is NULL?
> 
> They could do that with
>     AddressSpace our_as;
>     AddressSpace *dma_as;
> 
> and set dma_as to &s->our_as or &address_space_memory.
> 
> Or we could fix the two boards which create these devices to always
> pass in an MR to use for DMA and drop the conditionality.

Clever, thanks.

