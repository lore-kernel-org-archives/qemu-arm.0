Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABD3CCD183
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 09:12:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9K2C-0007OO-PG; Thu, 16 Oct 2025 05:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9K2B-0007Nk-2E
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 05:12:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9K27-0007Y1-Oh
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 05:12:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so3630865e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760605944; x=1761210744; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xNfv9xsmmhteqxadkVhT2+fkyYPSah+3ICpJbHA4auM=;
 b=fYWxzTg75xkyqxbMA+A2hRj6d6MJ++WASzMcmYxTRgZ8gJkfnmlczf0HinOpRbDOfa
 k3bnXyPzNQrFlYhXlw1WfLprZ6rlwK0Q3oGXlA62p4Vsc5K8tpt8N0NA4KUlqzvhVub/
 Rf2wCinriQ8CM/hygso8KzvkvfLZrfc8yiqr+ugg6Nv6lyptboF/BrOx9ccbMkyRNi+P
 aUTHncu4Ya7WB4AyIlSI27xSkZBVoPKu2O2wTQWwk5ZwClD3b069bycfFgRK1j8DNPG9
 pOONqR6A2T3pQ5cEHvW9E9brdw9671HKC4qsxZGLQgUk4OHaAT/K8XlkCrjP+CCTvqhS
 0cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760605944; x=1761210744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xNfv9xsmmhteqxadkVhT2+fkyYPSah+3ICpJbHA4auM=;
 b=wL6hYQ0iUBiPI1pa+QqktQ4gzCBWk8aMBdTG4/VWmTD79evp2aAoboEvMWkJniR8QO
 s+EWXzeU7W/kvuS38/zG8p/EDhnSKRgdmq2MlixdMYTdVe/Db5bQMm+q1VDsfM7n5tMg
 9SB4gMzhSZi4FIfQekkhV6y1c/Hv5SWo7Geg8mmEb3px2YeQNHAU/AZJ/jCaWoutoEK8
 hLP+Pnfs7qH7naq2K+R4ewudhT6qWE4rVcCMqL3/HAlenXWNT8gh3aU9CqJsIetbfDkC
 iimnvpekokUikYZrvjup1Px+POAHVEioxiZNPMjN4aifa+wWyOrl8sGMt2SFsbnv3bbh
 uVLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3Nyf5BDmQxP/GBbdadlaGmcG0qx4Z8RVIyjSN4J96oaYWGKBZfvQSBP0GQMA1TbACAVbQfBigEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzfbh+pWLYnY9vIB7lYi7lxGnlqOOannLaFBw+sbl2lz77GYkL6
 1Eyjc/X1H5OpGn4F9eoeTYR7AJFybDeCiXcvRghJy6whfA++50NCArsSVDZR7CeioJE=
X-Gm-Gg: ASbGncuYwuuAvGC3nIhc9x+MARqnBuAY+33Xk9u6uFvP5ZhOZomUlEVt8R9sBc8dmbE
 cZoy5xwqX62jFT+dNwOKo8AatsRetsM8DK9dnbu74hgX80geg03+BC/M8IYujVUb2v2vCGdGb2E
 M0um3x6lx7upji5GE63rZJCMrG3rxqxr2XbCkzI0YR0P3m6AEFeUnTQWaQoh3T5bD++LqohcGwU
 oxRBN3wwu2AMvwGG0XgdLr25zmj1f3V9RQ0jOEsdFpK8MBWunxGizTP3deDK4qxe/QMEGicGx+5
 dFMbgfZqO0zORRxltMRcNcb3+aH4a/zqyhElGidw0NiUF6kfJ50yO1CPYEK1FgR3PVP4SZbZYhF
 /0kgswzNNMwvRgq/foAqwtv6cUOjELPZKXLhXbS4Zgl1JPFGg1X4RzG2mPmkZ6zsfw41/538XjW
 +5/nJ53kYq/Cwxa2i8NGC8AdwGnwfRxWiC2O/uDAsFaBsgjxnvyxU4n4LmUw==
X-Google-Smtp-Source: AGHT+IE80TJxnu4thgS5f+era764aCpK9tGSrOOZRfaWpeLL3Lkv72yXnMKHQ6DPJ379DWca9g9xvg==
X-Received: by 2002:a05:6000:258a:b0:425:8bc2:9c4b with SMTP id
 ffacd0b85a97d-42666abb51amr16517178f8f.6.1760605943892; 
 Thu, 16 Oct 2025 02:12:23 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cd833ebsm16015305e9.3.2025.10.16.02.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 02:12:23 -0700 (PDT)
Message-ID: <ea10c781-d15f-4346-a092-78d203f2f0c9@linaro.org>
Date: Thu, 16 Oct 2025 11:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: aspeed: Split the machine definition into individual source files
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "'qemu-arm@nongnu.org'" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: 'Andrew Jeffery' <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, 'Jamin Lin' <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Patrick Williams <patrick@stwcx.xyz>
References: <e2df1ff1-3ce4-4233-b32e-2bc680725c71@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e2df1ff1-3ce4-4233-b32e-2bc680725c71@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 19/6/25 11:23, Cédric Le Goater wrote:
> Hi,
> 
> This is a follow up of a private discussion with Patrick.
> 
> Aspeed modeling started nearly 10y ago with the palmetto-bmc machine.
> We now have 5 SoCs and 25 machines which are mostly defined in
> in a single aspeed.c file. Multi SoC machines, fby35 and ast2700fc,
> are defined in fby35.c and aspeed_ast27x0-fc.c respectively.
> 
> Since we started separating the SoCs :
> 
>    hw/arm/aspeed_ast10x0.c
>    hw/arm/aspeed_ast2400.c
>    hw/arm/aspeed_ast2600.c
>    hw/arm/aspeed_ast27x0.c
>    hw/arm/aspeed_ast27x0-ssp.c
>    hw/arm/aspeed_ast27x0-tsp.c
> 
> We could do the same for the machines keeping an 'aspeed_ast<rev>'
> prefix (and maybe avoid the 'bmc' suffix). I think this would ease
> introduction of new machines. We would be able to get rid of
> aspeed_eeprom.[ch] and move machine custom data in the machine source
> file. Which seems cleaner.
> 
> Timing is about right for code reshuffling, still 3w before soft
> freeze, no important changes inflight, but if we start doing this
> conversion, we should do it for all. See the list below for the brave.
> 
> Comments ?

Good idea, but please split ASPEED_SOC in Kconfig accordingly.

Regards,

Phil.

