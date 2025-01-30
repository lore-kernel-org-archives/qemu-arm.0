Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp139779njl;
        Thu, 30 Jan 2025 00:02:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWRjOw5GVun6qsVfcBweVNj73dsCI3uok7UiG+CaxAV8cr7T0NXGpttMfztM6AQ9MJBVPGVbXYeYpFaMA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJ7J+9/FaPtwUKIi5cXtYVgOrW7cvnq6cqygvzRrLAT0udQ4VpQn4I5eRVB9EpQJYazoI2
X-Received: by 2002:a05:620a:454b:b0:7b6:f1be:4f7e with SMTP id af79cd13be357-7bffcd0e8a7mr855058485a.26.1738224163068;
        Thu, 30 Jan 2025 00:02:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738224163; cv=none;
        d=google.com; s=arc-20240605;
        b=Uexel+G6gvOyQk0VGxcMyEYZq3a1S+gTFbPXACsy/0H1oeTMWH7nshdUyFj1aCI410
         4jgR0x5S5UK+gWLpcz/Z0btmiL4tKRLrY3Rky2SNNCeGtPM+Hc8aXC8ly5kCIcsDeRUs
         n7qgkISm7QyTiA/6iPBbtVBx2st7MIs+Bj76Lho5OkPiSBF+TbiaonbDMJv9NWNB7sdk
         XjEXzjj7p4xnfFyWk7US9M/biPR36c+5/kio0Kmwyy46/OTPif9q2jECEjZlFwAIL096
         Ob6soVBWOr5cGIzP+83ybXEQ7CLtUDVuxXULSx3dk8pmE/B4SSEbfbID08ncnBmSGxc/
         gccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=h1gyGHoWLpogsrxtvmbUqgU4U/GVHFCS8iqpU/X+1tQ=;
        fh=HsAOMmLsyxFzUkbWEmVStgqr8dPh9bIkfS2STUm6ZmI=;
        b=LQUnHoFtnQsoRTDJfrD3Qw3ALmMnbh+AtumllyTB905HzMB9vm+wiKlvlOeULgF675
         FFs+vg7uiqQoT95655VpPnL3tN36dVPywVg/sM2TFAbfa1HRqKR8uDX6SZUrvOTQG77N
         kth6Lc4CI+vtcjZqSP2TbYHf2uKnuvl5NIwpwqh3wk8LPhEvsUi6llGJogtcM0J+5PuY
         lgzq+Ercgt1YggtJFSTWYHW0FrcwBNMZJPq+hQjUPY0qp/AAKrKB0QVdEZE2qI9F/9Cj
         kRe+YTuKr4uTlovrV2wcPFH2jvSzbMzekUvgUXpdog317WnmehxKVToWpYa43qPzZewk
         1c+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRCrVNeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a90c6cesi117738985a.358.2025.01.30.00.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 00:02:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRCrVNeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdPV7-0004S6-Mt; Thu, 30 Jan 2025 03:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tdPV4-0004Rg-Am
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 03:02:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tdPV2-0002FR-JG
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 03:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738224127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h1gyGHoWLpogsrxtvmbUqgU4U/GVHFCS8iqpU/X+1tQ=;
 b=WRCrVNeED0m5SDutVvLtDyErsYJmZWlhYVoWzRw1CLNjLherWRZgeaNy4CY1QrQv69juHj
 WngTkEOkuzwEHOGmlKoh/Gh7c12kUKdz1qqpuVES0Q3qAQOkQ7uTzDgk3ZNbDPviVj5UQo
 Gvp1bOzSh6mCbALA1SJg5kKN9uYum+E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-evKlyM4nNr-6odLpYLELeg-1; Thu, 30 Jan 2025 03:02:03 -0500
X-MC-Unique: evKlyM4nNr-6odLpYLELeg-1
X-Mimecast-MFC-AGG-ID: evKlyM4nNr-6odLpYLELeg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385dcae001fso223755f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 00:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738224121; x=1738828921;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1gyGHoWLpogsrxtvmbUqgU4U/GVHFCS8iqpU/X+1tQ=;
 b=LfPBJv6Xeaecl6+4fK/aAP4BzWwYuE7FlvRVqrmq9M9av2GSIqp4FcHLG4lLaPNSrc
 HxAn/gV4K3euy8n04fHQsboh1P4li/ZiLNMjFI4f9qW+ZWQyAntFj+W7RnteBAsC4Au6
 i+pYYT00vf2tKu1EwloPO/mkI1lC3TzukDs09Ald7bRY7TMz3o2HRB3cafPslyGFDOnD
 p4zm4Xa5EFA/2bddzwGWRNWxN9aCFUpw2PXIlbwe4nMnLspBjHdDztDFtut7RiKelhRu
 w5dUZzCt5SgXIdoUj9VHjrEeuJaHnrP14K3bas7D6i9NeWIKdHq4ZYl7a6ec39Rbh2GQ
 xO7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbe+dkjsVAfbJ5vhoqjzilzryx6ysqH8bOchTtzzXJl+P+/NfSp+0vi+c7bfAIEvvwdSasxprcIA==@nongnu.org
X-Gm-Message-State: AOJu0YyEh616I5qwccZ1Em0NP0SjU/Ocss7M6PSHMR6FUrS7Mfd8wJY1
 XdLEAOdZd2m5mvjyLjjlifGDMN7Seas1Sb8LsO/w4P+itYI7bGTvSH3rPX+TI6/ePwmA54V1RPv
 +WYRHc6m3H41CTVQa3i5nXtvydWSO1onrNPNx85gKH7ngBpfQwQ==
X-Gm-Gg: ASbGncshItjsb9KhKplImR4vA/OCw24ksWT4nRGuGiyFNVIqkb9S70Q68KP4Nr9RlFc
 7eOqqM6tAvytoD+L3+vGIz42ZbZC12cidCqOZfSVnVtwAI+LIVcnVoBLkOPdIUcaQRm337GBJDx
 PS7Txjt1BFyybOo3+UmacWuyEIdfCPACKX+JY+IQzXmPOtUQmUr41NRzgZgSzY4JtZGBpaEmYlj
 PoZ1sXCvn8YTOO4RgYuruiPLdL7fIuXpRe2nxGCF0WOnYe0E/oemmJNYVoxYg0a8e8S7M8LWqr9
 aVpViN8ox+mgjZJG1Ykc6g3909ZzxEaQKjRCTuPkPy8=
X-Received: by 2002:a5d:5987:0:b0:38a:5122:5a07 with SMTP id
 ffacd0b85a97d-38c5194a22emr6127748f8f.15.1738224121334; 
 Thu, 30 Jan 2025 00:02:01 -0800 (PST)
X-Received: by 2002:a5d:5987:0:b0:38a:5122:5a07 with SMTP id
 ffacd0b85a97d-38c5194a22emr6127727f8f.15.1738224120956; 
 Thu, 30 Jan 2025 00:02:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0eca02sm1203507f8f.12.2025.01.30.00.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 00:02:00 -0800 (PST)
Message-ID: <3f7cb60d-9fea-4c32-b118-ae454b2b06b2@redhat.com>
Date: Thu, 30 Jan 2025 09:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tests/functional: Introduce a new test routine for
 OpenBMC images
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-2-clg@redhat.com>
 <98b2cdec-dcd2-44bf-a81e-91521e2bd446@redhat.com>
 <815ec281-f4b0-43e4-ba56-1400d16dfe21@redhat.com>
 <3fe2d7fa-0e2b-48ff-b69c-2c6d805fee12@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <3fe2d7fa-0e2b-48ff-b69c-2c6d805fee12@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fDBlMR0XoYsI1E4q0o3hsmC2pr83Q67RbUywYlwnnGY_1738224121
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yTyi5JcwHI+8

On 1/30/25 07:40, Thomas Huth wrote:
> On 29/01/2025 17.28, Cédric Le Goater wrote:
>> On 1/29/25 08:58, Thomas Huth wrote:
>>> On 29/01/2025 08.18, Cédric Le Goater wrote:
>>>> The OpenBMC images currently used by QEMU to test the Aspeed machines
>>>> are rather old. To prepare an update to the latest builds, we need to
>>>> adjust the console patterns. Introduce a new routine to preserve the
>>>> current tests.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>>> ---
>>>>   tests/functional/aspeed.py | 18 ++++++++++++++++++
>>>>   1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
>>>> index b52358bb8c61..51c821944842 100644
>>>> --- a/tests/functional/aspeed.py
>>>> +++ b/tests/functional/aspeed.py
>>>> @@ -23,6 +23,24 @@ def do_test_arm_aspeed(self, machine, image):
>>>>           self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
>>>>           self.wait_for_console_pattern("systemd[1]: Set hostname to")
>>>> +    def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
>>>> +                                   cpu_id='0x0', soc='AST2500 rev A1'):
>>>> +        hostname = machine.removesuffix('-bmc')
>>>> +
>>>> +        self.set_machine(machine)
>>>> +        self.vm.set_console()
>>>> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>>>> +                         '-net', 'nic', '-snapshot')
>>>
>>> "-net nic" is the default anyway, so unless you also use "-nodefaults", I think you can simply drop that?
>>
>> OK. Will do.
>>
>> Do you want a resend for that ? Unless you prefer this series
>> to go through you tree, I will amend before sending PR.
> 
> No, no need for a v2 just because of this. And yes, please take it through the aspeed tree!


OK. I also added the extra 2 empty lines between the imports and
the class statements in the tests being modified.


Thanks,

C.


