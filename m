Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1023279lff;
        Thu, 17 Jun 2021 16:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJEMtmujaNFBucTAX4ys5ghAqgjZAOB3vgXKLwbXToLFVS620F4cw9aNqLXyqfrlE3fOA3
X-Received: by 2002:a05:6102:482:: with SMTP id n2mr3970543vsa.60.1623973757422;
        Thu, 17 Jun 2021 16:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623973757; cv=none;
        d=google.com; s=arc-20160816;
        b=n7yH9bdqaGOkz5qFsCa0svhZ9Lvh3ExpzOv0L4QoHzxAXZoWz0ScQlxca4w8X9AUxK
         jxoJln6qw8JYOPM78roG5Kqfyfdbo38rE+G1CezQYBKd49A0YqeTXkMXbdDC8vBCVOvt
         rgtLm4zjCFbqkZYc7RiV4QGWA3hY8BwrTwEFr6PrMs2mKozeNSvQq5VNLJAUu6cqZk2O
         m4yBNY0yIKFd4dlZzAOMs/JpXIS+I8Bbwqq9yWLALaVngDFhqYaXicpwPRL7MbYrEQUf
         3oZnxRHAL4EXlP69QcKG5Mia2RAWTqzmpGxnzPkPFRFmzoIcUaNXwhdYaLi4aH5ueX6h
         4cPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=k2N0a9W6NQ/964dzMDzizTRIte6s6hsFFeCvHB/iJD0=;
        b=FxbVSIJGgKJiPHXeTKaGtVCc+sWWInrQyTO+XEw8wi0B5gzda2z+vGcQHs0D63EY5i
         5Q94vnFJ5d2lj1DIsf03i5CyQ/V8ZRAUyJLpBa2FKZJ1NOhDgJAFGiRRbO5hzL+E8Tv5
         gKAK4VyyQPx0dI/eGGlLkoUFN0wrgIvux/DklBspYzddm7ykxMw1nbvnob2y4DIp5DqC
         LNpTl9YNtcEYdVEqqgiJ+thVSl18I30HAVQ85tOzFGG8nFwC/lYSoNzIZP9yDNO3ke+8
         /g1Rbv1ZtZ+epCCQp77vkVwqyxlykYxxldJu6bm3iJqiyLdwYDy5TnDZMTdvkgxDWNAF
         nYRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si5359839uad.85.2021.06.17.16.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 16:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lu1l6-0004m1-LN
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 19:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1kx-0004k8-7u; Thu, 17 Jun 2021 19:49:07 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1kv-0005VL-5P; Thu, 17 Jun 2021 19:49:06 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2F3AB7457E5;
 Fri, 18 Jun 2021 01:49:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0874A7456E3; Fri, 18 Jun 2021 01:49:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 06DFE7456B4;
 Fri, 18 Jun 2021 01:49:02 +0200 (CEST)
Date: Fri, 18 Jun 2021 01:49:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
Message-ID: <675080b9-cb1-9ee4-c515-ebd0401b302b@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
 <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
 <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-853930170-1623973742=:59666"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: cminyard@mvista.com,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GmJ5iYO73JlX

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-853930170-1623973742=:59666
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/16/21 10:01 PM, BALATON Zoltan wrote:
>> On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
>>> On 6/16/21 9:16 PM, Corey Minyard wrote:
>>>> On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> Instead of using the confuse i2c_send_recv(), rewrite to directly
>>>>> call i2c_recv() & i2c_send(), resulting in code easire to review.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
>>>>> index f4c5bc12d36..b3d3da56e38 100644
>>>>> --- a/hw/i2c/ppc4xx_i2c.c
>>>>> +++ b/hw/i2c/ppc4xx_i2c.c
>>>>> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque,
>>>>> hwaddr addr, uint64_t value,
>>>>>                          i2c->sts &= ~IIC_STS_ERR;
>>>>>                      }
>>>>>                  }
>>>>> -                if (!(i2c->sts & IIC_STS_ERR) &&
>>>>> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
>>>>> -                    i2c->sts |= IIC_STS_ERR;
>>>>> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
>>>>> -                    break;
>>>>> +                if (!(i2c->sts & IIC_STS_ERR)) {
>>>>> +                    if (recv) {
>>>>> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
>>>>> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
>>>>
>>>> In the previous patch you checked < 0, it would be nice to be
>>>> consistent.
>>>
>>> I did that first but thought Zoltan wouldn't be happy, then went back :)
>>>
>>> I'll fix for the next iteration, thanks.
>>
>> I generally had no problem with i2c_send_recv only that its argument
>> that decides which operation to do was inverted compared to other
>> similar i2c functions so my original patch just corrected that for
>> consistency and I was happy with that.
>
> But we have to make the maintainer happy too to get patch merged ;)
>
>> Having a send_recv in one func
>> allowed to avoid if-else in some places like these but if you think it's
>> better without this function at all I can work with that too. I'll have
>> to check if these changes could break anything. At first sight I'm not
>> sure errors are handled as before if recv fails but it was years ago I
>> did the sm501 and ati parts and I forgot how they work so I need to
>> check again. I'll wait for the final version of the series then and test
>> that.
>
> Thanks, that would be great!

I've tried AmigaOS and MorphOS on sam460ex and mac99 with sm501 and 
ati-vga and these still work so I think the patches are OK but I did not 
test other changes to other machines so I did not give a tested-by for the 
series just some reviewed-by to patches I've verified. (Found a regression 
with AROS but that's not related to these changes.)

Regards,
BALATON Zoltan
--3866299591-853930170-1623973742=:59666--
