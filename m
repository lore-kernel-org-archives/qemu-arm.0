Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2879139ejb;
        Sat, 9 Dec 2023 02:53:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzpbwvms9MkUu3EOxGyGaawK6B6fRDPCm+fPYLU2WemYnwKvzDOyXYBbO4h86z+k1X1Na8
X-Received: by 2002:a05:6214:5c3:b0:66d:28b3:798 with SMTP id t3-20020a05621405c300b0066d28b30798mr1642484qvz.10.1702119201234;
        Sat, 09 Dec 2023 02:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702119201; cv=none;
        d=google.com; s=arc-20160816;
        b=yPKdzUIQVED65rjBVusW2nRprlahdT8Qvzb8IavTu/P15OuX6zuq6hUB9K80hf4S1z
         F5t0eLchAvCS2Zw+oORkCBnM3rjh8396oX3L53zGnIsog9AqvwYQ7DKDqiMwuqa1sQqM
         I7FRtgi/Prwt7L2AVsBY7tsVsju8igAOyX4T+dJ7LgLV89qZzfEHzpDCYz2eCYHlTyyi
         wVYyEW5KaRYUyu19yoUA3tLxwU/D0o2ZRg7xVDOCVqjBvAShTAbswilGsIvffuE/Cx0n
         fS5Se9RxNebcMY0efL8Gl4dUTS4b2jT4Xn2tbN/LQGAaPYgN18ksNNDuX6pZAejYHc1c
         2D6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=APn++pN8i8GGFvqFk+Bxf6xh++SPdUNMHVLzMYNzGRc=;
        fh=zs+ipePwhQMFyU3dScwemU1aHMKCTkabwOfmqNw7wHE=;
        b=vDxa8Z4fiGhV20vTRrpFKCCfcKrRiWJtA9D9FK8GQyNpaVl6Kx3HWUzBtsnRQdWpgL
         RPLs2831LO3Zk6D1co9c/KuSv8SwXtPemfFYa8b5GimMmriNeJcL2HNl6ho3TKKA2uQ/
         c54fADAIHWLfz3gE2+CaKHAWdEDWdToD15PnaBQO4UFCRSUoufvADpP3kdC6p8MUPxFz
         I8GBc8PcFFVVT9mHawPFw6AVzYZ5YDGY/PZSCKjVrvy01H+eeGn7xXu50+stsRA8Vq99
         wnFaCJ5aU2sjorCvHErHRUEWo8dv+4o+VorZvO6JRMG86EOhJHxYwxvy0WfHr34YS41K
         MDIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kS6rRk6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a0ccd92000000b0066d1fcca1b7si3891534qvm.90.2023.12.09.02.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Dec 2023 02:53:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kS6rRk6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBuxM-0000GQ-11; Sat, 09 Dec 2023 05:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBuxK-0000Ej-9P
 for qemu-arm@nongnu.org; Sat, 09 Dec 2023 05:53:10 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBuxI-0001qg-La
 for qemu-arm@nongnu.org; Sat, 09 Dec 2023 05:53:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c32df9174so17944965e9.3
 for <qemu-arm@nongnu.org>; Sat, 09 Dec 2023 02:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702119186; x=1702723986; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APn++pN8i8GGFvqFk+Bxf6xh++SPdUNMHVLzMYNzGRc=;
 b=kS6rRk6fZBVMhVQu/hvuqlLqpM2I+SFCM+fk1PJViPb4DK2A9UJ+K8lWYpX0821B1U
 SFw8wlpmVGx8UghYfTfrKbOlPJXjbw3CZUNj0VAv5xj23wmgHYY0Cy1Q99owqoXlGD/F
 eIQ9KSAOVLTToOMtLdmw+oXQ6BRYr/MJPcDGIZmxTbsFILV3AKlIauGgUR5OzEIIlaIY
 oHLulXJIj1XGjf4iLOBS5JDum+bEqWt1V+Ylax6NURIr6JMN9y/1bPEvz0dZRkTEY3nC
 oM1Lt7mYy8SR7aiuBEkKbp1YPeNpvNB+IumLtG6TrsH7sXsCQ2/A9e/0ZyB+zjItNqY3
 J/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702119186; x=1702723986;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APn++pN8i8GGFvqFk+Bxf6xh++SPdUNMHVLzMYNzGRc=;
 b=poQZWWaIdEZ8Oh4geAgPrJQ2gQt898AMxKSJhWzUj4d4VntaiI6ff2OUaY7XmRFqL+
 3XvqTg24hySsIlFWbT1kdg8F4TheDJ90Bp2Fr3ErnSCwIUjxgWqjGIeNfQFN4Hnsr9Z0
 oY/AlM+6YKfELEzw0YUIDsysICM1THl7Y/U02/fSN01o7nw2CU1absxyhMIlk0Dq+9eQ
 OQniStB0WSdJQ9N33LnvoPKcg6fYJTIXSvUsSZ7J2KSZD1tfPCv2WUGu7vkAdkQcCvwT
 frjjrr0R4wWdy24mtdcVmoGePvBy87w8F5o1ltE7gKUJ5X/5gtBXfF4wbNie4yawE7ou
 jD2Q==
X-Gm-Message-State: AOJu0YxPpFzHeSqTWvKZ16AtrRThjo5FaLxnt9UHP4mno2g5Lelal4Q6
 mHFalWYOQLd1L9KZKCoMeHYfww==
X-Received: by 2002:a05:600c:20e:b0:40c:22de:79 with SMTP id
 14-20020a05600c020e00b0040c22de0079mr496249wmi.226.1702119185793; 
 Sat, 09 Dec 2023 02:53:05 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.54])
 by smtp.gmail.com with ESMTPSA id
 cx7-20020a170907168700b009fc576e26e6sm2049974ejd.80.2023.12.09.02.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 02:53:05 -0800 (PST)
Message-ID: <ed5e7b40-0b98-4a08-8530-a307f5227a60@linaro.org>
Date: Sat, 9 Dec 2023 11:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH qemu 0/3] hw/arm: Add device STM32L4x5 EXTI
Content-Language: en-US
To: ~inesvarhol <inesvarhol@proton.me>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 ines.varhol@telecom-paris.fr, arnaud.minier@telecom-paris.fr
References: <170198462199.32162.284497577253427308-0@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <170198462199.32162.284497577253427308-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pnM3srG4jjSi

Hi Inès,

On 7/12/23 22:30, ~inesvarhol wrote:
> This patch adds a new STM32L4x5 EXTI device and is part
> of a series implementing the STM32L4x5 with a few peripherals.
> 
> The patch is split up in 3 commits :
> - implementing the EXTI device
> - adding tests (that fail in this commit)
> - connecting the EXTI device to the SoC (the tests pass in this commit)
> 
> Thank you Alistair for the review and very helpful answers !
> 
> Sincerely,
> Ines Varhol
> 
> Changes from v3 to non-RFC v1:
> - separating the patch in 3 commits
> - justifying in the commit message why we implement a new
> model instead of changing the existing stm32f4xx_exti
> - changed irq_raise to irq_pulse in register SWIERx write (in
> stm32l4x5_exti_write)
> to be consistent with the irq_pulse in stm32l4x5_exti_set_irq (and also
> both these interrupts
> are edge-triggered)
> - changed the license to GPL
> 
> Changes from v2 to v3:
> - adding more tests writing/reading in exti registers
> - adding tests checking that interrupt work by reading NVIC registers
> - correcting exti_write in SWIER (so it sets an irq only when a bit goes
> from '0' to '1')
> - correcting exti_set_irq (so it never writes in PR when the relevant
> bit in IMR is '0')
> 
> Changes from v1 to v2:
> - use arrays to deduplicate code and logic
> - move internal constant EXTI_NUM_GPIO_EVENT_IN_LINES from the header
> to the .c file
> - Improve copyright headers
> - replace static const with #define
> - use the DEFINE_TYPES macro
> - fill the impl and valid field of the exti's MemoryRegionOps
> - fix invalid test caused by a last minute change

FYI I have your series tagged for review, but I have been busy and
won't have time to look at it the next 2 weeks :/

> Based-on: <170100975340.4879.5844108484092111139-0@git.sr.ht>
> ([PATCH qemu 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A
> board)
> 
> Inès Varhol (3):
>    hw/arm: Implement STM32L4x5 EXTI
>    hw/arm: Add STM32L4x5 EXTI QTest testcase
>    hw/arm: Connect STM32L4x5 EXTI to STM32L4x5 SoC

