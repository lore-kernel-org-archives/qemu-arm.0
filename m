Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp611079eje;
        Tue, 13 Feb 2024 23:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkNK8KotwY4xDWi7334RMD4xNQKlIfbmPtwdn/Sl4w8n4p1KEdGhRo09BIT4BRnNY9rxCasTk/BaUESY/SINEm5YYYeB+8
X-Google-Smtp-Source: AGHT+IFCde0auA3kq/L7mp2iYc+SWvKb+Ap2vA6zxFHVTbyp3dLk4zIV15AcumG9lQvnpU+TWsU9
X-Received: by 2002:a05:6808:2dcf:b0:3c0:4606:43e1 with SMTP id gn15-20020a0568082dcf00b003c0460643e1mr2480472oib.20.1707894574511;
        Tue, 13 Feb 2024 23:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707894574; cv=none;
        d=google.com; s=arc-20160816;
        b=WCH2WU6eIo9S0+OovHAw/7s3H20E5g8a4WXKHJKTiUCkX8nwV2yVkSntEES7C9sSAG
         pi6Xvu6RX7lk4coZ88pOu330vZZ3ry6z27tKO0hssgZge5GEh2+Xz5RoIurWWrtJg3Xg
         JxdG2gyBzgUMSNLNH3AvlE6GEd/Fs15zLFfwrjFKGPGf5DDf3/+tQyc1rxhdcwNum7LE
         oLwefXoPEJVf+NXaOxzm/8u8kJO97R4WOjOclnDTx/oDnvI2yddoJvPEOiWIab2I1ZqM
         fEY7Uxh8FJm2fMenbUjzCiOUGIPFP7pUSw2TAWVE2dXKe9WAuFBAlWHh6wIVhibTkl2Z
         jykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=JuGheQn359ZC3wk65A+hcjZYSvdHwCatQU8/JurNin0=;
        fh=xywO27NJ0ZJpRiinD2G7fQj+SCG/jsJQvt5DzUHBE3s=;
        b=Gh1OtqU8mpciWjhTXe35B4qTzP9Lho8EFrOmQEhg1IYp2PXYioiQE/RNilN+Q3Gl5h
         q9xEvIextNhrNQMPHYVFgAGLhq2wg0Yk6kH95uXAjMeJSNsODVbNQdQozKc2RlddQ+Mr
         hrR/6PqeaTbZNoemVCsGvfybF3vU8DGpO/8fMRltwJfnCQlhn6K49G0TMfktWmlI+ht5
         IEtfFb+ktnyw81zxkOqfmHBsLLSFgOih/37BjNveJanPxb3oFjTPRxCh1O8zebUr/wci
         SDi/DvE9T0Gx+EWc99vuqlZJsDDlVSAFNaK/NFeupyByPSaQyOrtV6t3AMg1YHFT6UcD
         WPQQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=1; AJvYcCVjhQRjEn0DRkDQ2+HmeOFSrPDvZIbpQXBWVjAXdHw8O948YSg8wQml6Js+TnLTYo5vugTR7VLrKQCKDdWiA64U8dcZF+Th
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020ad45be8000000b0068eeeabaa8fsi2611998qvc.144.2024.02.13.23.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 23:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ra9OE-0003XS-JD; Wed, 14 Feb 2024 02:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=AQUf=JX=kaod.org=clg@ozlabs.org>)
 id 1ra9OC-0003Wb-I0; Wed, 14 Feb 2024 02:09:04 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=AQUf=JX=kaod.org=clg@ozlabs.org>)
 id 1ra9OA-000876-42; Wed, 14 Feb 2024 02:09:04 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TZTnd6jvSz4wcl;
 Wed, 14 Feb 2024 18:08:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TZTnb16NMz4wcF;
 Wed, 14 Feb 2024 18:08:50 +1100 (AEDT)
Message-ID: <cd75772d-e892-4315-b97a-579b593a2cd0@kaod.org>
Date: Wed, 14 Feb 2024 08:08:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/arm/stellaris: Add missing QOM 'SoC' parent
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-5-philmd@linaro.org>
 <CAFEAcA9V7wQr=LEvv2DYT5SabPe2H3+V2RMQPHRVZ8avrse9ww@mail.gmail.com>
 <7e7646e7-85d1-40a4-8e5e-bca2fcaa6ba5@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <7e7646e7-85d1-40a4-8e5e-bca2fcaa6ba5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=AQUf=JX=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: rrD1rn5lYpnD

On 2/13/24 16:36, Philippe Mathieu-Daudé wrote:
> On 1/2/24 17:46, Peter Maydell wrote:
>> On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> QDev objects created with qdev_new() need to manually add
>>> their parent relationship with object_property_add_child().
>>>
>>> Since we don't model the SoC, just use a QOM container.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>
>> Ah, this is where the other qdev_new() calls are sorted.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> I wonder if we should add a variant on qdev_new() that
>> you can pass in the parent object to?
> 
> Yes, this is what we discussed with Markus. In order to
> stop using the "/unattached" container from pre-QOM,
> qdev_new() must take a QOM parent. I tried to do it but hit
> some problem with some odd use in PPC or S390 (discussed
> with Cédric so likely PPC, I need to go back to it).

Can you remind what this was about ?


Thanks,

C.


