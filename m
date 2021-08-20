Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1445254lfg;
        Fri, 20 Aug 2021 09:14:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTiF5IOVf6WQsbprazVIT1x/W06RELgVyYM1xBy0k3A+6f9+YGmZV2qOzc4aqCjmqz7mw3
X-Received: by 2002:a05:6102:3181:: with SMTP id c1mr17518836vsh.45.1629476046755;
        Fri, 20 Aug 2021 09:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629476046; cv=none;
        d=google.com; s=arc-20160816;
        b=enAO0JuUu7HLQ4Wjh/T0F0SYjqOFfxP3iZvs1DzglQAQOCvsS8wccK/oGNJb1lUPkB
         N7tozP9xh4JiFKWEBsNaS8LCBLi7jdIfmvUO4fypHP6n5YjXeyTxcNG8JItl63jGcz9d
         g9Bd1WNexuac6TuyyXHdqdstV6dKjT/OwiThPjD4v2UJnk3pVBRxEnRSFsUMztgVUOtX
         Hjy5ddUY/skUz38vqJi21mlq3t8GCUxMkGuxyWJchWLnQ5ZGp0n/2dFgZwpKSZB2OORm
         5GcE0KtB18KpgYh63mo0g8Qh7SBHYe3ftvOaRKsVdR5OXY/3AAvPwAOeS5Ujfxyno8to
         Q8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sD/KlcPy9DYUeD0jEzngGln9HItzOcu8A2NgwgMkkjY=;
        b=Oc/OUAQHFtVjTwn/jVLZmdKLeVEbu0GHfBGBfva+qTIylb0QN10lzWdbNW2akTr6/T
         8pmapVZlgVXdoV8SjPGC4w2kcDFxPXnQyTC4GnX301aZ6BvZFbil2S0zr6HZjD2stG9y
         +XXal5WKgSX/M8yvg3jXQTh2fLvDBHxD55EUYfILc1DXSpTX+mKeWSnP4a8N/A8fd1Xu
         A+0M/Le/dr5lSof0ZIcFfi31vPH5F91lW6M/UQEFNJ9/U6hK5d/55cuK381oGEKLynSm
         iYuBZzyBewig0t3xNH6Iav9g8167SICiL3VjqOW5F8azCH7V2B4w1K26WcfCIjUuHLO2
         6MbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=egUfkcLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si3311545vsi.222.2021.08.20.09.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 09:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=egUfkcLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH79h-0006Cc-Us
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 12:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH79Y-0006Ar-ON
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 12:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH79W-0000Fz-Vi
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 12:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629476034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sD/KlcPy9DYUeD0jEzngGln9HItzOcu8A2NgwgMkkjY=;
 b=egUfkcLDc4nhc9j1ruCh58Pi2LkzGp0WFVHShKpc6VQ/2uy1aX7A3tvkzqM0TcHPNugzf7
 QDg0MDfg/fgfjcy3aWNCRGFiB1d9n9pbGX9i9gqNe/Hh6WhvYO6lI44rILklVkJNbCO+Gz
 YSnknWmoRw9tPtCbbb+lv/8JUTZLe1M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-gWVI2hM8PzyVPo6yxC9eeg-1; Fri, 20 Aug 2021 12:13:53 -0400
X-MC-Unique: gWVI2hM8PzyVPo6yxC9eeg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o8-20020a05600c378800b002e72385f8e7so722389wmr.8
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 09:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sD/KlcPy9DYUeD0jEzngGln9HItzOcu8A2NgwgMkkjY=;
 b=ruyiv5TYa0xzgWccP6Bc7CxAt1KTQI9lEa8j3Zck+9sI75xp1+Zi30c8uGTo9Yzs/j
 Zvao8QLSdbuL7Qo0spdwcm60NKryceaE7gCFllqwcPyi7Mk/MI+8UkcTQVyyzmuN2DKy
 vSE3kNi8RDZyRdVit7WM1nAuJVMo4VoU16qNZc/wBtVWU9BLk5lx856Lg6b3zeARHOd2
 AviNfxBVNft+8goypKhVX3BJ3YDAodhgdDMw8l9f1SmHOIAtlKYdY3HIsRX7nsWMnXIE
 sRvI2Ip/hH5BNttlj/JANlqGTEdDRCDTL+PaqDH6jJAgMzZpN/b3XxAxa3zd7hxY1nhX
 3xkg==
X-Gm-Message-State: AOAM533fIXuGMPAAFpzAQQP0rCJUbjeBdSAa8NKJO5WJ+NiIwUlTzGD5
 ZAZbooBcL0b+TqFR+T6he6EfYUYzlShLgVg7pxkR7RKaroIW3cQ5gz1PqoUx3r7YQy/IvwTtD/R
 Sn5w2ePV0JdSqeKNYpWxAUc4P5J8dImnm3SWLsitjqqkwJFmcpvCqrGzv3LzOyg==
X-Received: by 2002:a05:600c:3b91:: with SMTP id
 n17mr4743594wms.72.1629476031562; 
 Fri, 20 Aug 2021 09:13:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3b91:: with SMTP id
 n17mr4743551wms.72.1629476031234; 
 Fri, 20 Aug 2021 09:13:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b201sm10471017wmb.6.2021.08.20.09.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 09:13:50 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Igor Mammedov <imammedo@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
 <2bcfd8a3-5049-5496-0ca8-a6323c4388e7@redhat.com>
 <20210820180835.77fd29d3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3007d467-40b3-4319-4512-d483de3b10e1@redhat.com>
Date: Fri, 20 Aug 2021 18:13:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820180835.77fd29d3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5P0DkaL/zzgy

On 8/20/21 6:08 PM, Igor Mammedov wrote:
> On Fri, 20 Aug 2021 17:53:41 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 8/20/21 5:47 PM, David Hildenbrand wrote:
>>> On 20.08.21 17:44, Igor Mammedov wrote:  
>>>> On Fri, 20 Aug 2021 15:39:27 +0100
>>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>  
>>>>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com>
>>>>> wrote:  
>>>>>>
>>>>>> On 20.08.21 16:22, Bin Meng wrote:  
>>>>>>> Hi Philippe,
>>>>>>>
>>>>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>>>>>> <philmd@redhat.com> wrote:  
>>>>>>>>
>>>>>>>> Hi Bin,
>>>>>>>>
>>>>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:  
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>>>>>> with QEMU head.
>>>>>>>>>
>>>>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>>>>>> allocate memory  
>>>>>  
>>>>>> -m 40000000
>>>>>>
>>>>>> corresponds to 38 TB if I am not wrong. Is that really what you want?  
>>>>>
>>>>> Probably not, because the zynq board's init function does:
>>>>>
>>>>>      if (machine->ram_size > 2 * GiB) {
>>>>>          error_report("RAM size more than 2 GiB is not supported");
>>>>>          exit(EXIT_FAILURE);
>>>>>      }
>>>>>
>>>>> It seems a bit daft that we allocate the memory before we do
>>>>> the size check. This didn't use to be this way around...
>>>>>
>>>>> Anyway, I think the cause of this change is commit c9800965c1be6c39
>>>>> from Igor. We used to silently cap the RAM size to 2GB; now we
>>>>> complain. Or at least we would complain if we hadn't already
>>>>> tried to allocate the memory and fallen over...  
>>>>
>>>> That's because RAM (as host resource) is now separated
>>>> from device model (machine limits) and is allocated as
>>>> part of memory backend initialization (in this case
>>>> 'create_default_memdev') before machine_run_board_init()
>>>> is run.
>>>>
>>>> Maybe we can consolidate max limit checks in
>>>> create_default_memdev() by adding MachineClass::max_ram_size
>>>> but that can work only in default usecase (only '-m' is used).  
>>>
>>> We do have a workaround for s390x already: mc->fixup_ram_size
>>>
>>> That should be called before the memory backend is created and seems to
>>> do just what we want, no?  
>>
>> Or maybe more explicit adding a MachineClass::check_ram_size() handler?
> 
> On the first glance, just max_size field should be sufficient
> with checking code being generic, which should remove code duplication
> such checks introduce across tree. Is there a specific board for
> which call back is 'must to have'?

Some boards have minimum or set of possible values (i.e. 2
or 4 SIMMs, each a pow2 between 8M-64M).

We could have few generic helpers and reuse them in each
machine, instead of open-coding each machine:
  machine_check_max_ram_size(),
  machine_check_ram_size_in_range(),
  ...

