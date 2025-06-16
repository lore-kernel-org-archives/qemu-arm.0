Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1863240njc;
        Mon, 16 Jun 2025 06:39:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXENfNLc70lPLlZsIqdrBYCwbhqoQKODpHp34WyeOYNQYcMaYioN+W61b1z5zCauKnXakCDf+CIDLNSgA==@linaro.org
X-Google-Smtp-Source: AGHT+IEJLclIISYoAPpIyRrdFihpwx313pr6LtvlIEGhKhzhoP1XyzPG6qgwH+XOwVXYJAid9gnM
X-Received: by 2002:a05:620a:199e:b0:7c5:5cd6:5cf2 with SMTP id af79cd13be357-7d3c6c1ee66mr1325640085a.17.1750081144377;
        Mon, 16 Jun 2025 06:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750081144; cv=none;
        d=google.com; s=arc-20240605;
        b=U59JmeUvhyWb7xXpS03k7ZqUMscztYAb+DqDQsDBiS1dAY5F9Fd80n1EFH8YcGqyXN
         4ueJdhEK+F7UPUmwK5gAs/njEpicgEZ/mtoVLgA2rPxe2XaCrwOUsAhmL8cG1WotcIfN
         1VMu+q9uSBSVKb/qt21jNQTkppK87MjD2+BFeEIm1esn1tp+u43u6BPqYd9GwOizk6X3
         6ioUMXRLuQLgvMBatzkxDVae5+VWXFz0wjH/oPfiHfn1wy6WuBz6eL/MupizD2TXlpPb
         B+Rklvb2yaYoNn1fC4HBed+7i9JNrAo0EU8AcInjuPGfNNLdsIZ06FvZjD0EqMZt2CUu
         ZK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=U+VXGy4lNl70kL2WfCsK8HdIbHKqfU4scx7537EbVWY=;
        fh=B5fYWftYhIk8QHSo0Sc6bAD7or1GAsKxNuvF5AKR5wE=;
        b=dPBHymKPQ0HLWajMAPw7cQPTqdTbUJMc6jXu9brQ2N9/CfeDUK0TXycJh3hxIhFLpv
         JWdH7io/gIqnN5AkmLZeImq4NL4CDn9f2YX8f9AVRlxdw3h2N8wHIEfArpkm4ZsHqbiX
         X1V3KJqIYDgQ09cG3rQSVum6N25FRik9kIlEryPyBNJGQlQTif1vZh3vkAvNfctXmPHu
         q8fRqP54WuBPWWk4/p0FSMeDtq/YvdvPTF/6+2v0yPnSVOk1bPF36Q73fSJ75fMxyrEu
         +ASL03QPGtpDJX69ZKvtbZ10G17n7XPYTxHKW0WAMKIaBpAyCMkI5QzUlduh2i8qV+Sa
         N30w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f5fc43si938239585a.641.2025.06.16.06.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 06:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uRA2z-0005C0-K0; Mon, 16 Jun 2025 09:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=g70R=Y7=kaod.org=clg@ozlabs.org>)
 id 1uRA2x-0005AS-S9; Mon, 16 Jun 2025 09:38:47 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=g70R=Y7=kaod.org=clg@ozlabs.org>)
 id 1uRA2t-0008EI-R3; Mon, 16 Jun 2025 09:38:47 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bLWL61BlGz4wyV;
 Mon, 16 Jun 2025 23:38:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLWKz3QLSz4wbv;
 Mon, 16 Jun 2025 23:38:31 +1000 (AEST)
Message-ID: <b5245811-8a3c-47d2-8e83-e686d55e8d23@kaod.org>
Date: Mon, 16 Jun 2025 15:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] include/hw: replace FSF postal address with
 licenses URL
To: Sean Wei <me@sean.taipei>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
References: <20250613.qemu.patch@sean.taipei>
 <20250613.qemu.patch.05@sean.taipei>
 <3aa8de03-911e-4906-a0c5-5b8ea269ad28@kaod.org> <aE_D5zVzf3qHRP-2@redhat.com>
 <accf0fab-782d-4e0a-9f13-f6a940fc86a1@kaod.org> <aE_ML3jtVgweJMid@redhat.com>
 <63d1cb84-7e65-4c60-a718-92a2807e53ea@kaod.org>
 <4b381b19-0cd2-4036-b9bc-6954869eca28@sean.taipei>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <4b381b19-0cd2-4036-b9bc-6954869eca28@sean.taipei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=g70R=Y7=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.056, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: OE4KGZKQA9K1

On 6/16/25 14:49, Sean Wei wrote:
> Hi Cédric & Daniel,
> 
> On 2025/6/16 3:55 AM, Cédric Le Goater wrote:
>> On 6/16/25 09:47, Daniel P. Berrangé wrote:
>>> On Mon, Jun 16, 2025 at 09:29:35AM +0200, Cédric Le Goater wrote:
>>>> On 6/16/25 09:13, Daniel P. Berrangé wrote:
>>>>> On Sat, Jun 14, 2025 at 07:29:09AM +0200, Cédric Le Goater wrote:
>>>>>> Hello Sean,
>>>>>>
>>>>>> On 6/13/25 18:44, Sean Wei wrote:
>>>>>>> Some of the GPLv2 boiler-plate still contained the
>>>>>>> obsolete "51 Franklin Street" postal address.
>>>>>>>
>>>>>>> Replace it with the canonical GNU licenses URL recommended by the FSF:
>>>>>>> https://www.gnu.org/licenses/
>>>>>>>
>>>>>>> Signed-off-by: Sean Wei <me@sean.taipei>
>>>>>>
>>>>>> Instead,  I would remove the license boiler plate and add :
>>>>>>
>>>>>>     SPDX-License-Identifier: GPL-2.0-or-later
>>>>>
>>>>> This is *NOT* something we are doing for existing code sources,
>>>>> unless the person removing it is the exclusive copyright
>>>>> holder on the file.
>>>> Ah. So I misunderstood.
>>>>
>>>> How is license boiler plate different from the SPDX identifier tag ?
>>>
>>> It achieves the same aims, but notice GPL clause 1
>>>
>>>    "keep intact all the notices that refer to this License and
>>>     to the absence of any warranty;"
>>>
>>> and yes, some projects have none the less done a wholesale replacement of
>>> boilerplate. I don't know how they rationalized ignoring this license
>>> requirement. It is simpler to just preserve boilerplate as-is that to
>>> debate the legal nuances of this.
>> OK. Then, let's forget about this replacement.
>>
>> Thanks,
>>
>> C.
>>
> 
> Thank you both for the clarification! To avoid any controversy, I will keep the patch in its original form, only replacing the deprecated FSF address with the canonical GNU licenses URL.

yep.

> Cédric, could you please take another look and let me know if everything looks good? If so, I'd be grateful if you could add a Reviewed-by tag. Thanks!

sure.


Thanks,

C.

