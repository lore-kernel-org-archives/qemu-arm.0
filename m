Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp110406njc;
        Thu, 20 Mar 2025 23:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBX+AF665oi1N6Gl61FCzTZsE5qB94fBgid2XOU/22cVbLJVjsSK3oHh3P3f4Ky2cTTpn3wRqCpx6Vwg==@linaro.org
X-Google-Smtp-Source: AGHT+IGRIqNb14DGvznPyLHwQP9kbPAZvdPPjX3KEzVKUtFnX4IBoXwORW9QXwRP+FoJFFr0OT0b
X-Received: by 2002:a05:6214:258f:b0:6e6:6a6e:7596 with SMTP id 6a1803df08f44-6eb3f34eda5mr22736646d6.39.1742538567206;
        Thu, 20 Mar 2025 23:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742538567; cv=none;
        d=google.com; s=arc-20240605;
        b=Jw92teOAemjlRg2OM1uluKcY0PgKTaC1g7SegQaY4DydYeqHQMV9MiWBaLJ7FdkIyQ
         shu2+qeD/qhGtSscz2G+yRm4flt3gxWXFWb6OhXCdvf048ORzTsn5BpGMWnaYtX3wgop
         dhymQewhd7gNhBkZRMKX4v9xiCO/ShH3f9/fi3WWzLRSg9jqQ8PfeFqqCEDTwJ58Z/n9
         lVLvw5xY2tgxdRgHHnRRvLlDXXGuz0VUU+qAH2R9mqirN6roYVzKeLV9eHzaeX6uboQt
         wwOIsS2qKfwd+hTowSz2oSyQe4Tv2sujFER9TRFQgyW3lPg7v0Z0ONUPBxdPG2SoDONB
         tQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=462Ef0UY+VeKxduextiPsvkBafdU6EmY09hReuBPmSo=;
        fh=9fSTg57Z8/5qODGkbOspMwLLIoslmI8qf+5es3qFPPw=;
        b=FE1pqPuVw4a0ObnmZXI4Yl+LBfxEDqbqMhc0mUqzdDtGKkWYyf4A6XxLbQTYvkQugv
         dkTo3Wrg4uR8zeL9xVm9Trmf54xKXs4BCBxq53s9ccYvu8zqP9ntho1egWc2nen/wOIv
         w2+ZpULhlLPL5vf3JwRlM61/Op1aGfFHmlipjuZMDigRf6VrnKrwsm1BUusdfYGZLvXs
         BnqEli2lc5D51Pm0DBJiS9kB1Z6WV87I/Yf/qt9+nep1nmCe4JfnY1lVseS12j/2Ic9z
         8tzZf6yI54L3m0hTK1TgfvYSaLqeLGPGtAqa3+BZGSxFrKvwXhgDn74FAN82MKArlNb0
         v0jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f04d4fdsi12686336d6.488.2025.03.20.23.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 23:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvVsI-0005Nz-FK; Fri, 21 Mar 2025 02:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rypf=WI=kaod.org=clg@ozlabs.org>)
 id 1tvVrw-0004fE-1d; Fri, 21 Mar 2025 02:28:41 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=rypf=WI=kaod.org=clg@ozlabs.org>)
 id 1tvVrt-0005dh-6R; Fri, 21 Mar 2025 02:28:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZJsvq28p4z4xDK;
 Fri, 21 Mar 2025 17:28:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJsvl0mgQz4xD3;
 Fri, 21 Mar 2025 17:28:17 +1100 (AEDT)
Message-ID: <1339b58c-b12c-4bda-b4e0-ff8c919c288d@kaod.org>
Date: Fri, 21 Mar 2025 07:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/intc/aspeed: Fix IRQ handler mask check
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 "longzl2@lenovo.com" <longzl2@lenovo.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20250320092543.4040672-1-steven_lee@aspeedtech.com>
 <20250320092543.4040672-2-steven_lee@aspeedtech.com>
 <f6210cfe-2a3f-47be-8ff3-568c3b2fc055@kaod.org>
 <KL1PR0601MB4180B4C4C323A2C3FE5248D985DB2@KL1PR0601MB4180.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <KL1PR0601MB4180B4C4C323A2C3FE5248D985DB2@KL1PR0601MB4180.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=rypf=WI=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AFm9xEadlmmG

Hello Steven,

On 3/21/25 03:54, Steven Lee wrote:
> Hi Cédric,
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@kaod.org>
>> Sent: Thursday, March 20, 2025 11:29 PM
>> To: Steven Lee <steven_lee@aspeedtech.com>; Peter Maydell
>> <peter.maydell@linaro.org>; Troy Lee <leetroy@gmail.com>; Jamin Lin
>> <jamin_lin@aspeedtech.com>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Joel Stanley <joel@jms.id.au>; open
>> list:ASPEED BMCs <qemu-arm@nongnu.org>; open list:All patches CC here
>> <qemu-devel@nongnu.org>
>> Cc: Troy Lee <troy_lee@aspeedtech.com>; longzl2@lenovo.com; Yunlin Tang
>> <yunlin.tang@aspeedtech.com>
>> Subject: Re: [PATCH 1/1] hw/intc/aspeed: Fix IRQ handler mask check
>>
>> Hello Steven,
>>
>> On 3/20/25 10:25, Steven Lee wrote:
>>> Updated the IRQ handler mask check to AND with select variable.
>>> This ensures that the interrupt service routine is correctly triggered
>>> for the interrupts within the same irq group.
>>>
>>> For example, both `eth0` and the debug UART are handled in `GICINT132`.
>>> Without this fix, the debug console may hang if the `eth0` ISR is not
>>> handled.
>>>
>>> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>>> Change-Id: Ic3609eb72218dfd68be6057d78b8953b18828709
>>> ---
>>
>> I think the issue was introduced by the initial commit :
>>
>>     d831c5fd8682 ("aspeed/intc: Add AST2700 support")
>>
>> Is that correct ?
>>
> 
> Yes, and the implementation is based on commit 38ba38d (hw/intc/aspeed: Add Support for AST2700 INTCIO Controller).
>
> Additionally, I sent a patch series for AST27x0 multi-SoC support on March 13th. However, I forgot to append the v2 tag to the series. 

That's OK.

We are in -rc phase of the QEMU 10.0 cycle, so I am looking at fixes
first.

> Should I resend it with the correct version tag?

No need. This is enough:

Fixes: d831c5fd8682 ("aspeed/intc: Add AST2700 support")



Thanks,

C.




> Patchwork link:
> https://patchwork.kernel.org/project/qemu-devel/list/?series=943379
> 
> Thanks,
> Steven
> 
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>
>> Thanks,
>>
>> C.
>>
>>
>>>    hw/intc/aspeed_intc.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c index
>>> 3fd417084f..f17bf43925 100644
>>> --- a/hw/intc/aspeed_intc.c
>>> +++ b/hw/intc/aspeed_intc.c
>>> @@ -111,7 +111,7 @@ static void
>> aspeed_intc_set_irq_handler(AspeedINTCState *s,
>>>        outpin_idx = intc_irq->outpin_idx;
>>>        inpin_idx = intc_irq->inpin_idx;
>>>
>>> -    if (s->mask[inpin_idx] || s->regs[status_reg]) {
>>> +    if ((s->mask[inpin_idx] & select) || (s->regs[status_reg] &
>>> + select)) {
>>>            /*
>>>             * a. mask is not 0 means in ISR mode
>>>             * sources interrupt routine are executing.
> 

