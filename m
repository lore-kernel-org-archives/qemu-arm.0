Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp709931njb;
        Wed, 8 Jan 2025 01:12:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYuMQrVgaYRneSxsN1dOo/kFxe5nEBBWaDYj9DECQ33hf3EHWeIBQgYOETAVpnQhNS9uCklXTGmAcWvg==@linaro.org
X-Google-Smtp-Source: AGHT+IEnnNIhWjg2tEcwVyFgwi2DwUgeqyTKUfLKhSOjZp/u+kWOSFkNViwq5X1qVyK6d54y185+
X-Received: by 2002:a05:620a:f15:b0:7b6:d1e1:a8d5 with SMTP id af79cd13be357-7bcd8d4a966mr383564585a.29.1736327560574;
        Wed, 08 Jan 2025 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736327560; cv=none;
        d=google.com; s=arc-20240605;
        b=evmNPeh3Jo/LxwUdDluTh7zVlb9vXczz5un0AhgkMiSqvF44+nj4sjQED/ECt3ndVG
         fiPkc+fR6PuLjK95ee/5yLD6MyXzSZAKS6kdRuIxwFMrnqaL5dSLDzLHv297/808RZnO
         XUnIV8SU4PzmVXaoO9Al7JZ5gyh32Q4jjxxXTNcl5+mVIFg//Q24UF4JEknJ6QVjd9us
         BhGBbZ6Kf5lFlUwJxYonIXcODBTbToZiKjk5CK2sx0xIwMruWyHfiM7EDPeIFsVp1NbG
         XGyr+kfdAGiCmCA7BBOc3AHgQ29mlKZbUkDffceDkEFiVUYS9dtKHb2q/lJF9Y5Kneba
         nDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=8KXbjlseYv9QAShHqM3M+cp/IYZtBNZ2vBdkAn8l4Qw=;
        fh=iFTq8UVMnLR8S1ileqYzkm7lpJrIVlADAj9u0i+JzYM=;
        b=UpVlBHAeSH+gBSFoy4y8mo/727Clfp5qtj2oIVO2VnLZc0F1Q2zMGWaBkX0aNRvqsn
         kUY6FktEoY0qPD9AG44FhyPFY39e4R2XDIHMXyk5HSAEJ6XPAInxn4I7AVxHwH86CYoz
         ut6JkufYrn9Uu9cXW+jLIPAzGxvJqrT73wWy/JfQcgkVeCAeM/nUEc2jmh7Bc5DJzRrD
         d8H6KrPcwHn546wfLyx4ue3UMDbSTQKGxv2wVs45X/ldyk127cXu/9u2TPczAGnSlByt
         xBwI/hNtvyqcsQpA2byasRlI1mT4L28s65WH/SCpHyu0DJWufespcEZAVc/AcfIYRUw9
         V/3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac478ffasi4752369685a.236.2025.01.08.01.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 01:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVS6h-00012m-UX; Wed, 08 Jan 2025 04:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Rpac=UA=kaod.org=clg@ozlabs.org>)
 id 1tVS6f-00012C-7N; Wed, 08 Jan 2025 04:12:05 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Rpac=UA=kaod.org=clg@ozlabs.org>)
 id 1tVS6c-0000rm-Tr; Wed, 08 Jan 2025 04:12:04 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4YShxS44VPz4wj2;
 Wed,  8 Jan 2025 20:11:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YShxJ0klMz4wcl;
 Wed,  8 Jan 2025 20:11:31 +1100 (AEDT)
Message-ID: <bcf6deea-e1fd-40e3-884d-41e2789c49f1@kaod.org>
Date: Wed, 8 Jan 2025 10:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Introduce a new Write Protected pin inverted
 property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)"
 <qemu-block@nongnu.org>, troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <2e956389-289a-4806-8985-ab846d808736@kaod.org>
 <b520adf4-12f1-4261-a48f-bb74589bb31d@linaro.org>
 <a7c967ce-6bc0-47e0-aa25-cc89dab29cfb@kaod.org>
 <CAFEAcA9e5PFNoNh4u7paY5k5RnMgJ-3c++eGJd4u8CjjvDCvYw@mail.gmail.com>
 <53d67dbf-b595-4442-81e7-84267aa8e511@kaod.org>
 <CAFEAcA8Dz6b0fVjhEntNbbbb4UpBikUXsOmzU4WNabbrac+6Sg@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <CAFEAcA8Dz6b0fVjhEntNbbbb4UpBikUXsOmzU4WNabbrac+6Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Rpac=UA=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.24, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: Lu3AH2cGvECq

On 1/7/25 23:36, Peter Maydell wrote:
> On Tue, 7 Jan 2025 at 17:55, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello,
>>
>>> I would not recommend using qemu_irq_invert() in new code.
>>>
>>> I guess in an ideal world we'd implement a QOM object
>>> that encapsulated the the "not gate" logic, similar to
>>> TYPE_OR_IRQ. (Though for TYPE_OR_IRQ we made the mistake
>>> of making it inherit from TYPE_DEVICE, not TYPE_SYSBUS_DEVICE,
>>> so it doesn't get reset properly on system reset and so
>>> the "what happens to the output on reset" is still not
>>> really correct.)
>>
>> I see how this would work with TYPE_PL181 model but I don't
>> understand how this could work with TYPE_SYSBUS_SDHCI since
>> we don't have a gpio line to invert the level. Am I missing
>> something ?
> 
> You have a gpio line, i.e. a qemu_irq, because you're passing
> it to qemu_irq_invert(), 

This part was proposed by Philippe and is not related to the
proposal.

I am not very familiar with these devices and AFAUI, the
SHDCIState irq being modified has a much broader scope than
a write protection toggle/level. I suppose the irq covers all
kind of transfers.

> and you could instead connect it into
> a hypothetical TYPE_NOT_IRQ device. qemu_irq are GPIO lines,
> the type just has an odd name for historical reasons.

Yes. I was looking for something like this but we don't have
a "card-read-only" GPIO line like in TYPE_PL181. Hence my
confusion.

Thanks,

C.


