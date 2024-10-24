Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp114334njx;
        Wed, 23 Oct 2024 23:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfT+p4sulLN6La173EPf0diC5axXTWVeIID2KORD0krAN10wIG/808/MnVVoS6+sFC7nZYwKAGQOy1YQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHGfXtlJne6hWMPCRoCEb+xBDBUXGcjC9zqlNRZeXhUh0kfldKD/mZ9ci8jmQmHzWpqXE5i
X-Received: by 2002:a05:620a:4249:b0:7a1:d73f:53d2 with SMTP id af79cd13be357-7b186bb8322mr70084285a.20.1729750028830;
        Wed, 23 Oct 2024 23:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729750028; cv=none;
        d=google.com; s=arc-20240605;
        b=Xz+4Khbav3MwIbwcHwqyDMH4kG8KqBYT38WKfEQiQ0Jp0ObpWCrbavEy6n8pfesn79
         svV/vHgJDu4R8jhAr574GW3kgwWq5W0/MYjeo9WwnYL70ZB7bZoMWgdLJ5YYFMsOZdoH
         tYrYp05tALy/lONM0JcTInNIZXwrME7aQZQZQIxFXbYfmjEfA6jap2M6G9d4K6u2fKVq
         6HKHQuCdkLEReiCFyjB7wVTwEfkShp6xv4AGWaWKN4TrmmtO7k88tRFrtt1huKbUX4cT
         5BHay5js0TScerQQSOuXUQEB5LLJ2iWHAQOaTmkZjsn9SetBlv0WpI6uL80ZWmlrffDN
         RDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=+VLopP6p/jWGG8K+ML4fKiAT3Kzag9GfiED9v/O8EV4=;
        fh=x8sb2JS19MM04/4tGPb1OKwjZznyZEfrXTz71XoGOcY=;
        b=OPoYwJivaiGiye1m2vMXNdic7MRO+/YKkBPZY0wnhb98vf+fMdYIDOoN/idvo3T1uF
         rGHes6XgxmViMs0cgbct47z315YkLfo3FzM5crzW/04d3cp4fSNWxHOcdoQRtfypIuQA
         Oox9EXuuCd1+fA8v+iFH6IdUVwJYzUIAy39fsaibui2BBoPX2WVorpQJvjL8NrxgCfXr
         WWUvYvxQbyM9Z6yMoAERmINeEtBV2AFmj67cM2TwjcFe4zxko1FxNWriFnqFw/bAfum4
         JxVwruc7ZyfIlPLZQ0Q+a5lu5wUleYncT87M+K1FVjgdZoLBFgFYSG7NABZJ7I7EjQwV
         CbuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a9c32dsi1110406685a.606.2024.10.23.23.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3qzW-0002XQ-Cf; Thu, 24 Oct 2024 02:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9NnO=RU=kaod.org=clg@ozlabs.org>)
 id 1t3qzT-0002VA-RR; Thu, 24 Oct 2024 02:06:36 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=9NnO=RU=kaod.org=clg@ozlabs.org>)
 id 1t3qzQ-0008Hr-Vf; Thu, 24 Oct 2024 02:06:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XYwQd35lZz4wc4;
 Thu, 24 Oct 2024 17:06:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYwQW2f9Nz4w2F;
 Thu, 24 Oct 2024 17:06:11 +1100 (AEDT)
Message-ID: <84e64626-059e-4177-bd40-2bf8fa84e8f9@kaod.org>
Date: Thu, 24 Oct 2024 08:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] aspeed/smc: Fix write incorrect data into flash
 in user mode
To: Kevin Wolf <kwolf@redhat.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
 <20241022094110.1574011-2-jamin_lin@aspeedtech.com>
 <ZxeDVTBwLZsOEDvE@redhat.com> <b682dc55-f5e8-4fec-82f7-333dbaba240e@kaod.org>
 <ZxfDYWEyMLcnMXlh@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ZxfDYWEyMLcnMXlh@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=9NnO=RU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: odHT9/Ns6P4f

On 10/22/24 17:23, Kevin Wolf wrote:
> Am 22.10.2024 um 15:40 hat Cédric Le Goater geschrieben:
>>>>    static const VMStateDescription vmstate_aspeed_smc = {
>>>>        .name = "aspeed.smc",
>>>> -    .version_id = 2,
>>>> +    .version_id = 3,
>>>>        .minimum_version_id = 2,
>>>>        .fields = (const VMStateField[]) {
>>>>            VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
>>>>            VMSTATE_UINT8(snoop_index, AspeedSMCState),
>>>>            VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
>>>> +        VMSTATE_BOOL(unselect, AspeedSMCState),
>>>>            VMSTATE_END_OF_LIST()
>>>>        }
>>>>    };
>>>
>>> I think this will break migration compatibility. In order to enable
>>> at least forward migration, it should be:
>>>
>>>       VMSTATE_BOOL_V(unselect, AspeedSMCState, 3),
>>
>> This is correct. I will fix the patch.
>>
>> Some background,
>>
>> The aspeed machines are fully emulated and the Aspeed SoC models are not
>> part of any virt* machines (yet). So migration support is a bit of a
>> theory. We have done our best to maintain some support, compatibility
>> not being a priority. IOW, it's not perfectly tuned as on virt machines.
>>
>> Also, on ARM, migration of the CPU secure mode (I think this is the reason,
>> Peter please correct me !) is not supported and if migration is initiated
>> after Linux has started, the machine will hang.
> 
> That's a good reason not to implement backwards migration for now, it
> would only complicate things. But as long as we claim to be migratable
> by having VMStateDescriptions and even increasing version_id, we should
> at least try to keep that part correct.

Sure. Thanks for pointing that out.

>> However, if one day, an aspeed model becomes part of a virt machine, we
>> should be more careful. I would start by resetting all vmstate versions
>> to 1!
> 
> Why would you reset it? Keeping 3 (or whatever it will be by then) as
> the first serious supported version shouldn't hurt and probably avoids
> some confusion.
  OK . We'll see when we get to that point. Who knows. The Aspeed machines
have gotten much bigger than we expected !

C.
