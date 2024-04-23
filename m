Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4906017ejd;
        Tue, 23 Apr 2024 03:24:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLxQJoXaRmCL/7J66Dq8+NQ6SuZ2qsUhUfyT3BXjQG4G/ZKMwpH57j9ofEFrPJPEpyz3D4RFJ21vYZ4HkjQvSE3CuQ30TW
X-Google-Smtp-Source: AGHT+IE7HsnUqus7IyMKa3yw9ox38By4lLS4Q893VKkvec9dLePaS0TV9qPsb4F1CugxR93wJldw
X-Received: by 2002:a05:620a:88f:b0:790:6543:adfa with SMTP id b15-20020a05620a088f00b007906543adfamr10317426qka.78.1713867860906;
        Tue, 23 Apr 2024 03:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713867860; cv=none;
        d=google.com; s=arc-20160816;
        b=oVDjetLCH4ZbiAPw2LJjrAAvq6gUOdp6rxs3Zpw/esFFzQ4NQf4GVdha2qcgZXoZkp
         zLpC9heSLwiZDWvJSoIwROQMqAablD0d5FMlixqVr87FnKLq/qg/A1WwNwi5L5TBmHKz
         LN674YiF2SKg2n3B/pJyZf/sKuQ9c6ku6aFI4ylSqKmVuwm+iEKfIwh8RHE8aqNN3WYk
         fc/hzK1koAHwXg/QNCwFZE5tVzeA/GW50kIOUzLsmJhyMGVfY2HvAW23hT66mAVuVFIE
         EDLDi4QiqxUSXyzUVt3+waRtXIhMpzJ5BSaWGQEGq3Emofc37pGHqiOP85JT3q2rh4Oq
         J/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=45HCJilPkgfo3H58KvwQj5XoWkSoKhZoJgLNGSaJ+KI=;
        fh=xLqrRbyUji6yYibPs/X9Y7V/8CDPY4Bp1o0tvPoGp1I=;
        b=tYFy+O0fXqQk9XVlBtg63nOyKC1MVTrJ0GipLg+2zqIcZ/DY9jj/cpmrATAiaAJzqc
         vw6NJVw7HTnCUc7wgQX0zY518OSfx70+MTkQYSN0b06GdO8F/Ol4rP44jKvzStiPrnFE
         93rXRg42lza7rkxsG23PztGF6T2YICW/XUYA5kshsLgElSovECFgumsPvlQvNVXNN0mH
         fNMDqpTiI9BX9peA+TmYf3jU3soscl/WkXbbF2far56SOlQqtLeKcbmdW+LrJeT4bmY7
         bFqWPGNdlP+YJmiAzHsfsugcJz40YxZyex7nCYf/nO/daaM9wxQq4AZ+FW5/gBEf1pKe
         wwKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05620a44d500b0078f11db0eaesi12525293qkp.80.2024.04.23.03.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2024 03:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzDJq-0006Ba-TG; Tue, 23 Apr 2024 06:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzDJq-0006BO-1z; Tue, 23 Apr 2024 06:24:10 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzDJn-0001A2-I6; Tue, 23 Apr 2024 06:24:09 -0400
Received: from [10.177.233.137] (unknown [10.177.233.137])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VNyrh0K2tzyQr;
 Tue, 23 Apr 2024 13:23:47 +0300 (MSK)
Message-ID: <aa967494-d3d1-4896-8006-b5fc2252a56e@astralinux.ru>
Date: Tue, 23 Apr 2024 13:23:33 +0300
MIME-Version: 1.0
User-Agent: RuPost Desktop
Subject: Re: [PATCH RFC] prevent overflow in
 xlnx_dpdma_desc_get_source_address()
To: "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "sdl.qemu@linuxtesting.org" <sdl.qemu@linuxtesting.org>
References: <20240412081328.11183-1-adiupina@astralinux.ru>
 <CAFEAcA9wfzpc74iA_2G-YbtQtwGCA9VPQuXagg-Q0FwC92tg+w@mail.gmail.com>
 <CY8PR12MB8411CAB26257B5974DAE2CA2E60F2@CY8PR12MB8411.namprd12.prod.outlook.com>
Content-Language: ru
From: Alexandra Diupina <adiupina@astralinux.ru>
In-Reply-To: <CY8PR12MB8411CAB26257B5974DAE2CA2E60F2@CY8PR12MB8411.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttderjeenucfhrhhomheptehlvgigrghnughrrgcuffhiuhhpihhnrgcuoegrughiuhhpihhnrgesrghsthhrrghlihhnuhigrdhruheqnecuggftrfgrthhtvghrnhepiedvgfdtudfffeegleevheeltddtffejtdfgveevgfehtdeujeejgfdtteehgeejnecuffhomhgrihhnpehlihhnuhigthgvshhtihhnghdrohhrghdprghmugdrtghomhenucfkphepuddtrddujeejrddvfeefrddufeejnecurfgrrhgrmhephhgvlhhopegluddtrddujeejrddvfeefrddufeejngdpihhnvghtpedutddrudejjedrvdeffedrudefjeemheejgedtkedpmhgrihhlfhhrohhmpegrughiuhhpihhnrgesrghsthhrrghlihhnuhigrdhruhdpnhgspghrtghpthhtohepjedprhgtphhtthhopefhrhgvuggvrhhitgdrmfhonhhrrggusegrmhgurdgtohhmpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtohepvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhgvmh
 huqdgrrhhmsehnohhnghhnuhdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepshgulhdrqhgvmhhusehlihhnuhigthgvshhtihhnghdrohhrgh
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12626735,
 Updated: 2024-Apr-23 08:25:08 UTC]
Received-SPF: pass client-ip=51.250.53.244;
 envelope-from=adiupina@astralinux.ru; helo=new-mail.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3DtdHCs2ABJh




17/04/24 13:05, Konrad, Frederic пишет:
> Hi,
>
>> -----Original Message-----
>> From: qemu-devel-bounces+fkonrad=amd.com@nongnu.org <qemu-devel-bounces+fkonrad=amd.com@nongnu.org> On Behalf Of
>> Peter Maydell
>> Sent: Friday, April 12, 2024 12:07 PM
>> To: Alexandra Diupina <adiupina@astralinux.ru>
>> Cc: Alistair Francis <alistair@alistair23.me>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; sdl.qemu@linuxtesting.org
>> Subject: Re: [PATCH RFC] prevent overflow in xlnx_dpdma_desc_get_source_address()
>>
>> On Fri, 12 Apr 2024 at 09:13, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>>> Overflow can occur in a situation where desc->source_address
>>> has a maximum value (pow(2, 32) - 1), so add a cast to a
>>> larger type before the assignment.
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>
>>> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
>>> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
>>> ---
>>>   hw/dma/xlnx_dpdma.c | 20 ++++++++++----------
>>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
>>> index 1f5cd64ed1..224259225c 100644
>>> --- a/hw/dma/xlnx_dpdma.c
>>> +++ b/hw/dma/xlnx_dpdma.c
>>> @@ -175,24 +175,24 @@ static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
>>>
>>>       switch (frag) {
>>>       case 0:
>>> -        addr = desc->source_address
>>> -            + (extract32(desc->address_extension, 16, 12) << 20);
>>> +        addr = (uint64_t)(desc->source_address
>>> +            + (extract32(desc->address_extension, 16, 12) << 20));
>> Unless I'm confused, this cast doesn't help, because we
>> will have already done a 32-bit addition of desc->source_address
>> and the value from the address_extension part, so it doesn't
>> change the result.
>>
>> If we want to do the addition at 64 bits then using extract64()
>> would be the simplest way to arrange for that.
>>
>> However, I can't figure out what this code is trying to do and
>> make that line up with the data sheet; maybe this isn't the
>> right datasheet for this device?
>>
>> https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/ADDR_EXT-Field
>>
>> The datasheet suggests that we should take 32 bits of the address
>> from one field (here desc->source_address) and 16 bits of the
>> address from another (here desc->address_extension's high bits)
>> and combine them to make a 48 bit address. But this code is only
>> looking at 12 bits of the high 16 in address_extension, and it
>> doesn't shift them right enough to put them into bits [47:32]
>> of the final address.
>>
>> Xilinx folks: what hardware is this modelling, and is it
>> really the right behaviour?
> Looks like this is the right documentation.  Most probably the descriptor field changed
> since I did that model, or I got really confused.
>
>> Also, this device looks like it has a host-endianness bug: the
>> DPDMADescriptor struct is read directly from guest memory in
>> dma_memory_read(), but the device never does anything to swap
>> the fields from guest memory order to host memory order. So
>> this is likely broken on big-endian hosts.
>>
> Yes indeed.
>
> Best Regards,
> Fred
>
>> thanks
>> -- PMM

hw/dma/xlnx_dpdma.c defines a dma_ops structure
with the endianness field set to DEVICE_NATIVE_ENDIAN.
Doesn't this guarantee that there will be no endian errors?

Alexandra
