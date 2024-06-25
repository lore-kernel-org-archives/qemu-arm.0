Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp596436njc;
        Mon, 24 Jun 2024 23:38:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVF/lf7yW+w/1p4tHdLoY7dLV/lvOnGv8ia1ypm6zh/GzztJLPWXZ/XCbcqYcpcmH1wW40pxfhu+gce936w+/jJrAbjtezz
X-Google-Smtp-Source: AGHT+IGe2r41USIk5Wq9j/fBHJ2dis0Nfms2UHTLrcQ0dVd5QXiplKKVNXfdG3UWhRYliXErpRjM
X-Received: by 2002:a05:6214:19ea:b0:6b4:febe:e86b with SMTP id 6a1803df08f44-6b54099c35amr86757906d6.4.1719297522313;
        Mon, 24 Jun 2024 23:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719297522; cv=none;
        d=google.com; s=arc-20160816;
        b=iv2OZVBxKreUE8ccNVWpbdfeVZW1N4Cy5fH8R3u4YB39274L7oLHN6UT9osua+mlnK
         JHhQO26BGV9dKXDxC/sXbi923tz0xo53aIbo7Iqn7Qwchd7v50I6WWeFt/vtHb3Bd7ub
         irVXJ7Zj9tPYs5Hfj1jHkjk/pDlcA34x1in8gAJgksFl4e326gZxohyGm3WDMJ2FdjGr
         ksoagNArej00Q0XTMHQZpXOyf2u6xt0nUW1UQFun3kunRINhMR9wLhX1CTDxFpbFMUnM
         JK1sWTRp8vPmAOaW0ys6JbK2kbXkAgmBwVNBzxvJkMFIdjcERx11lUJ+fCR/sV14Qwj8
         INpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=UhjnsEnyWZWPyp7pwtPZGMdU2As0V86Gk8Rp66gQM3w=;
        fh=I8kkexGAT3JUm6pORMZbUPY0+dzUONRojkOFPvbs0yE=;
        b=aReUtRJeqU4cBiyS06UL+rVZL+w3sCasAKIPBhFG1rRTJEybwqh4AKhWTdN+emkpLo
         igAroNywIh1xFsFLXWbWYBgD3hQZ1TjTfXk7SfDXMCJfM0pnlV8ov8SlCkvo3DaTIZIw
         Lp+wsarKlgyN42bcA4BETKWwsKvrtHxNQVynQ0bwx1WnviCvFZqJlnF9MHXB4xLVkJB2
         LAFTd1EBOpUrVULWWe6YmrFXxiKtZAcZxd6C1ZxHkYoRHlMyWhLj2q9Di3gDMleFZzoY
         k4fauotNECGUEAHIPkwQT69wHeUg3gxrqxQ8B+COhbnRh/ufJoP8nOMtRFE/FdfKAS/D
         3ulA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef44491si97369356d6.520.2024.06.24.23.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 23:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLzon-0000VA-SU; Tue, 25 Jun 2024 02:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sLzon-0000Ut-3S; Tue, 25 Jun 2024 02:38:17 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sLzok-0002Hi-BF; Tue, 25 Jun 2024 02:38:16 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W7ZsB1r46z4wcS;
 Tue, 25 Jun 2024 16:38:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W7Zs63b1wz4wbr;
 Tue, 25 Jun 2024 16:38:02 +1000 (AEST)
Message-ID: <7974a26d-4ad4-445f-a3b3-71c08984ad16@kaod.org>
Date: Tue, 25 Jun 2024 08:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] aspeed/soc: Fix possible divide by zero
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 cmd <clement.mathieudrif.etu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
 <20240625015028.1382059-2-jamin_lin@aspeedtech.com>
 <24dbb79e-cdcc-4415-befa-e6351c8f29b4@gmail.com>
 <69656db3-24a7-447d-b2b2-49a938744be4@kaod.org>
 <d698609b-4760-4932-999b-4d4754021421@gmail.com>
 <SI2PR06MB50415148B5224AB52D485D02FCD52@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB50415148B5224AB52D485D02FCD52@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=+2S4=N3=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mk6J0HDXIDXd

On 6/25/24 8:15 AM, Jamin Lin wrote:
> Hi cmd, Cedric and Peter,
> 
>> -----Original Message-----
>> From: cmd <clement.mathieudrif.etu@gmail.com>
>> Sent: Tuesday, June 25, 2024 2:07 PM
>> To: Cédric Le Goater <clg@kaod.org>; Jamin Lin <jamin_lin@aspeedtech.com>;
>> Peter Maydell <peter.maydell@linaro.org>; Steven Lee
>> <steven_lee@aspeedtech.com>; Troy Lee <leetroy@gmail.com>; Andrew
>> Jeffery <andrew@codeconstruct.com.au>; Joel Stanley <joel@jms.id.au>; open
>> list:ASPEED BMCs <qemu-arm@nongnu.org>; open list:All patches CC here
>> <qemu-devel@nongnu.org>
>> Cc: Cédric Le Goater <clg@redhat.com>
>> Subject: Re: [PATCH v2 1/2] aspeed/soc: Fix possible divide by zero
>>
>>
>> On 25/06/2024 08:03, Cédric Le Goater wrote:
>>> On 6/25/24 8:00 AM, cmd wrote:
>>>> Hi
>>>>
>>>> On 25/06/2024 03:50, Jamin Lin via wrote:
>>>>> Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
>>>>> "ram_size" object property. This can not happen because RAM has
>>>>> predefined valid sizes per SoC. Nevertheless, add a test to close
>>>>> the issue.
>>>>>
>>>>> Fixes: Coverity CID 1547113
>>>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>>>> Reviewed-by: Cédric Le Goater <clg@redhat.com> [ clg: Rewrote commit
>>>>> log ]
>>>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>>>> ---
>>>>>    hw/arm/aspeed_ast27x0.c | 6 ++++++
>>>>>    1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c index
>>>>> b6876b4862..d14a46df6f 100644
>>>>> --- a/hw/arm/aspeed_ast27x0.c
>>>>> +++ b/hw/arm/aspeed_ast27x0.c
>>>>> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void
>>>>> *opaque, hwaddr addr, uint64_t data,
>>>>>        ram_size = object_property_get_uint(OBJECT(&s->sdmc),
>>>>> "ram-size",
>>>>>                                            &error_a
>> bort);
>>>>> +    if (!ram_size) {
>>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>>> +                      "%s: ram_size is zero",  __func__);
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>> If we are sure that the error cannot happen, shouldn't we assert
>>>> instead?
>>>
>>> Yes. That is what Peter suggested. This needs to be changed.
>>>
> Thanks for review and suggestion.
> How about this change?
> 
> assert(ram_size > 0);

yes.

I will send another patch fixing a long standing issue in the SDMC
model not checking the ram_size value in the realize handler. It
relies on the "ram-size" property being set.

Thanks,

C.


> If you agree, I will send v3 patch.
> Thanks-Jamin
> 
>>>
>>> Thanks,
>>>
>>> C.
>>>
>> Ok fine, I didn't see the message, sorry!
>>
>> Thanks
>>
>>   >cmd
>>
>>>
>>>
>>>>>        /*
>>>>>         * Emulate ddr capacity hardware behavior.
>>>>>         * If writes the data to the address which is beyond the ram
>>>>> size,
>>>

