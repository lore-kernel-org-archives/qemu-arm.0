Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp494302ejb;
        Wed, 1 Feb 2023 04:22:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9O84hfek5bgQQBZCeBe/T9DICoRnvlNZFqB+aOXVnITRWW6t+pHJwfYRvAecoullGaj2Ah
X-Received: by 2002:a05:622a:4:b0:3ab:ceb9:10fd with SMTP id x4-20020a05622a000400b003abceb910fdmr3724298qtw.25.1675254130259;
        Wed, 01 Feb 2023 04:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675254130; cv=none;
        d=google.com; s=arc-20160816;
        b=TrL/XKMPyD5cLikTxzHs7E1uoFSHqD37+Jp6JP48wrg1Plp30/zRY7NL+ieMZXmQyW
         adiborRS5gt+7eAUKRaqRBHT7pFYjkAkduBULuyT0S68RaEHX8osQ8o8ip4yTjJ3SkHz
         sQg8LXmNUrrt7ufQoqI7ROXo6s14PZsrgxgC65YqQa9zKgkp+J1dNX4UMZZsccFSAJvS
         3xJTcsl2GJzEr1oyKEKJV9th6AhNhRY0teyLQbjmi/iVJP0AUbDDuwqsTFragIIftL5H
         N/v+CQ2UIhaUbKgq2pgx9tpnfEhQg3xkho/gMs7veTrdloUVgzzDbQi8xe+TLjgsKjiz
         MTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QmEwDIIXbnJQWe/vywVkIYSUouwOkGUSZz05T7U9oB0=;
        b=LCw2A3+ZIGEsGEBhmQsDJ/UYiwDqvSq0z008L/Jvp8acM4jOkSrawpYQ64eDJ4fY3D
         0AeEEdlTKvscTCKk9FduUFkz5tmEKkUMB7uAfC8i/wj1zaWDqVrPkuTLM3fTi232iSin
         WPzHHzKjRpYvQrbuPNntJt78lYOb0g1TlQcsL6K5R1ei6sjNDkySJfbqYVeZLRP/ruRQ
         O6neVxtYyD8y3+lYc3FSM3rpg8sEEvaJ5ojV0+1YXKZejb6HFvKLu7nuyolXiS/nkcSc
         hw5q1Fo7Wfz01DqPAoQFUP1sgv7MvfmQ0Z2FKnuaOVo4qOIY26X3HIvgDC5lfIPo9ptQ
         5Nog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcw+Kge3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ac8414d000000b003b9a6d90602si3034817qtm.423.2023.02.01.04.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Feb 2023 04:22:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcw+Kge3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNC7g-0002kL-F6; Wed, 01 Feb 2023 07:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC6P-00026U-6R
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 07:20:38 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC6M-0004IJ-VV
 for qemu-arm@nongnu.org; Wed, 01 Feb 2023 07:20:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o18so7652929wrj.3
 for <qemu-arm@nongnu.org>; Wed, 01 Feb 2023 04:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QmEwDIIXbnJQWe/vywVkIYSUouwOkGUSZz05T7U9oB0=;
 b=qcw+Kge3QnCwNoKDVJ/gwR+DY4wMkyWQafRMQP1lYyduZHVPG6UuRWg0+Rn8zodZr6
 cyhAr7X/y0VdYqlESy9kpm4p9fiJ0u8hizsMyaiAvT0GpBkxD7lS8pXLUFfrIOol84j7
 Q3DNvH7qCxJAI4v2o2aACx6W5RceP9QsU9QPqIcSkUWhlnY+vCqO97UCopbFPZy0fEqd
 NPKcyYA5tC101uHmdjZHm3E05Ie5G9TOcAHUnQI22JOTw1S0Q5ut6aoYmspxmFjWAWac
 o7ocTivCa5Y5Inm3jkEHQ5rLo0Y/zBXMHABTlk71Wv9BogXt7SX0bQU4z9iIyFHlRVer
 AaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QmEwDIIXbnJQWe/vywVkIYSUouwOkGUSZz05T7U9oB0=;
 b=5Ead4urPgDpiLd7yIWRDnk5g8ADBHnNAh7qxhbK3XfTHZdgtTajBh9ftmGYjUJ9BcV
 QrPEoKO2mVzGn4ikuWvi85Er1hYI4SwjlhahUMATz31wf6SRt2+Dej/dJpbvAVfkCinl
 41NuHS4p5HvyoH0o/SIR8JnjNtiiu/nJd8noCutwVOCBkBxz9SkGCTC938D+vtgiinP6
 Jegjbzn12EpzKG2BrnSpYwKW7oSPUIsYlwKbhbd2omPdYw78KMKJAw80oS+qj/pYIkTh
 JzB8D4J1lilcyZ6ypKQBW43McOIoGMdfSuYJyP6H2A9cLEQ8I8zyvNaB5Hg1GceAOgLP
 D3Dw==
X-Gm-Message-State: AO0yUKXD1hzwAfgZ9aswqE3YBYK6a0meCX3z1gAjdWvM0CTnBElOHouR
 API0SBQ1rXhzK2PEFrnbVsGZHh0b8EYrn45vWp8=
X-Received: by 2002:adf:ee87:0:b0:2bf:e288:6289 with SMTP id
 b7-20020adfee87000000b002bfe2886289mr2335035wro.15.1675254033296; 
 Wed, 01 Feb 2023 04:20:33 -0800 (PST)
Received: from [192.168.242.175] (107.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.107]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d50c6000000b002bfc24e1c55sm17241228wrt.78.2023.02.01.04.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 04:20:32 -0800 (PST)
Message-ID: <a1955947-8f04-42fb-f2bc-57fd0561ee5d@linaro.org>
Date: Wed, 1 Feb 2023 13:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 08/25] hw/arm/boot: Export write_bootloader for Aspeed
 machines
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-9-clg@kaod.org>
 <CACPK8XfW6peVF27_YthCubp-9J8aGpKp5x15-2-qpusnV=4Dzg@mail.gmail.com>
 <131c30d3-5ada-8f94-8c1a-84419c39b461@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <131c30d3-5ada-8f94-8c1a-84419c39b461@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cfQSygZn3bq1

On 1/2/23 08:58, Cédric Le Goater wrote:
> On 2/1/23 06:45, Joel Stanley wrote:
>> On Thu, 19 Jan 2023 at 12:37, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> AST2600 Aspeed machines have an home made boot loader for secondaries.
>>> To improve support, export the internal ARM boot loader and use it
>>> instead.
>>
>> I didn't quite follow why we're doing this. Is it just a cleanup?
> 
> It comes from this discussion :
> 
>    
> https://lore.kernel.org/qemu-devel/20221222215549.86872-1-philmd@linaro.org/

Joel, see:
https://lore.kernel.org/qemu-devel/CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com/
