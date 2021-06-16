Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp664903lff;
        Wed, 16 Jun 2021 13:01:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgWf2dzhIqiK7+f5gRTY4+wZ0fo8K64P3lRjBnbw9kUMbfIP7vAAQ2TMKgZ5QpNAoFfv1Z
X-Received: by 2002:a2e:bc10:: with SMTP id b16mr1347195ljf.347.1623873700219;
        Wed, 16 Jun 2021 13:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623873700; cv=none;
        d=google.com; s=arc-20160816;
        b=xeGARclLdTYHPWKBP2Yckz4r+bbCZH9ZpZuh9dd9f/ViwHcPGcvig1bA5JzMTtdI9r
         wIUvHKDuCCoBnC9uqTuS8wsnAz0ait/6Pn+vTdBqGijTlgRTyCmSoYueXNGQJPsajFtl
         ML70mf+ZBxhhh7Mz3qXI7ckECD9AhzUIzMX2i3DEhKj6/DLqrK9LDsNtlPqgQDuRzBNB
         68ZBhs8xs8mHa4xKzIVsWCGvzTLocuXwIFd0J1VfzJq+M22JpFEI1F+MHPzinZ7ppu7u
         lxh+6oVKOQm9d4fGAg0/EB4XDs9UKRPFvIE/2rAtCV3Rcpu3+L1dPIh8ndD1DQuKKSr6
         w8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=uz8vnCE0HOgpZaLiukBHOnxrOcRJfRCyuPILYNBaP34=;
        b=dXigiSjaOgdr5Oq5wIhe8wn7a58pKhcGVu8yjts+igxkKvXo3iK5mh53PXaOCLGl1R
         NZrVKg+IPbSHDPkkqim2hEvI4pUnADXrkyttF5uiP+uM6gTO3PfYYjVn+lwBjm4lmkov
         zkYrRYIMkKMRzqYDuKTUxYLJM2xldVi4IBsEHFkZ0x9qiIFLvVVz7y5yo3IRTE4rgmAR
         eNDqZq+EMe+OarrSgU4pAsqW14FWSDnFlsWBjBh1/NJvbv6ZBGqw3MtdUK+4l3HPrWiB
         waj8dkyS8rSNPpldIXe0F32aSJNczgwfblXo3k8APcD40kSwKXH1HZ5ZqXgSUvzz5nZW
         i6mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si4619802ljj.40.2021.06.16.13.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 13:01:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltbjH-0000vr-7o
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 16:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbj7-0000vV-Jq; Wed, 16 Jun 2021 16:01:29 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:50359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ltbj4-0006Av-7T; Wed, 16 Jun 2021 16:01:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F20C774570E;
 Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CEB5A7456E3; Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CCF637456B4;
 Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
Date: Wed, 16 Jun 2021 22:01:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
In-Reply-To: <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
Message-ID: <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-882278050-1623873681=:48693"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: cminyard@mvista.com,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V1qo3LMcWmDB

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-882278050-1623873681=:48693
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
> On 6/16/21 9:16 PM, Corey Minyard wrote:
>> On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
>>> Instead of using the confuse i2c_send_recv(), rewrite to directly
>>> call i2c_recv() & i2c_send(), resulting in code easire to review.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
>>> index f4c5bc12d36..b3d3da56e38 100644
>>> --- a/hw/i2c/ppc4xx_i2c.c
>>> +++ b/hw/i2c/ppc4xx_i2c.c
>>> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
>>>                          i2c->sts &= ~IIC_STS_ERR;
>>>                      }
>>>                  }
>>> -                if (!(i2c->sts & IIC_STS_ERR) &&
>>> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
>>> -                    i2c->sts |= IIC_STS_ERR;
>>> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
>>> -                    break;
>>> +                if (!(i2c->sts & IIC_STS_ERR)) {
>>> +                    if (recv) {
>>> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
>>> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
>>
>> In the previous patch you checked < 0, it would be nice to be
>> consistent.
>
> I did that first but thought Zoltan wouldn't be happy, then went back :)
>
> I'll fix for the next iteration, thanks.

I generally had no problem with i2c_send_recv only that its argument that 
decides which operation to do was inverted compared to other similar i2c 
functions so my original patch just corrected that for consistency and I 
was happy with that. Having a send_recv in one func allowed to avoid 
if-else in some places like these but if you think it's better without 
this function at all I can work with that too. I'll have to check if these 
changes could break anything. At first sight I'm not sure errors are 
handled as before if recv fails but it was years ago I did the sm501 and 
ati parts and I forgot how they work so I need to check again. I'll wait 
for the final version of the series then and test that. I remember I had 
to tweak these a lot because each guest OS had drivers that did things 
slightly differently so if I've fixed one, another broke until I've found 
a way that worked for all.

Regards,
BALATON Zoltan
--3866299591-882278050-1623873681=:48693--
