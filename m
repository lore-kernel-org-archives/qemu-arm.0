Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1665814njc;
        Sun, 15 Jun 2025 23:19:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCYnoASqRqOvLYoers1rE/2MFCEK9npFNDmFwuOcWMIN0vephA1YV+lb1llsaGh6OK4NW+Rz9EZ5pYPw==@linaro.org
X-Google-Smtp-Source: AGHT+IG3xvY+SQIwXoC+T+VFM4qhICHMvfILQebUVpiCCJvxL3DfS9igbeI7/rQbHqG5X9sPz/yB
X-Received: by 2002:a05:6214:f67:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6fb47773489mr135868406d6.1.1750054788457;
        Sun, 15 Jun 2025 23:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750054788; cv=none;
        d=google.com; s=arc-20240605;
        b=NaVItlQFP4j/p96dH9dMEJsYjgTh37ZF1kdDyjZDqkjCEA3RE//0489qDW6Z8pzeJ5
         y4ve6etQWLM0RaFiFqvAKYDyQ8hwWvzVH9r6kU1v+2En17GwOLbbU/dA9bkt4y5VHkte
         5rRbO27r3BeSLw0DO33ZHNM2IgXaADtnl9SMcSrV48NK/2kR8dmLJAfOwo5DuRtSuGkW
         ISp0LeeReN2r00LCjXGGMMfzVnljGAIb7ZsucFZGuL2dtjeFh2W6k4qPnxLeBvALfNOO
         JCwaQmVj9bZWo+33O0zhTwMj7rHgcyXb8j9cYnBiEELId2RCETjrOjkZSR8TlulMtW8p
         FreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=5M5ML9B5ybonuAnl/YeCdH6LX4IwCujTVZKyGd6ZCsw=;
        fh=6XPaMxRZ3L/ngtVzusotL8txm2TZqSp9e/qEQo056qU=;
        b=RNlrADlWoX0RpWG1jwyQED/n9olAOEVe58dupLxEyCH1/+Ot0iAHPm2LUslugHyS6d
         cYz0+/XMJ9uqDOKB2PNAoULQyOdpt7VoGC/OqDIAcc5/GNvmbX4xpbqlMQV1dd2TS+0r
         WDynzJW2pLzx/4vRDKqhksbP5vEdomOiX/DhVs19U4StkpGnX4/9TnnkePdY+lWHY+FO
         Iavh9KmFD6yI8F2zW8W1yZfTGnTqaAOzZzDoAvsqovB/cvrZuEUa5L07ZKuQ14+8c5LD
         RniKZy5ELKqqyUluFAaz1KM7kfUUPSDmixXlCSYMOwqJZp1Qj+qOL2EL8MCNQOrzVh3J
         A8aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35c2c218si98055846d6.413.2025.06.15.23.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jun 2025 23:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR3Bo-0005Am-Vi; Mon, 16 Jun 2025 02:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=g70R=Y7=kaod.org=clg@ozlabs.org>)
 id 1uR3BD-0004x4-8Y; Mon, 16 Jun 2025 02:18:52 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=g70R=Y7=kaod.org=clg@ozlabs.org>)
 id 1uR3B8-0003Af-Th; Mon, 16 Jun 2025 02:18:50 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bLKZN10ljz4wcm;
 Mon, 16 Jun 2025 16:18:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLKZJ28hwz4wb0;
 Mon, 16 Jun 2025 16:18:31 +1000 (AEST)
Message-ID: <157ec442-1d6e-42b2-aa0d-56a2d6f11414@kaod.org>
Date: Mon, 16 Jun 2025 08:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/misc/aspeed_scu: Handle AST2600 protection key
 registers correctly
To: Tan Siewert <tan@siewert.io>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
References: <20250613181906.50078-1-tan@siewert.io>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250613181906.50078-1-tan@siewert.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=g70R=Y7=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.097, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: kJ53dSN2eKC3

On 6/13/25 20:19, Tan Siewert wrote:
> The AST2600 SCU has two protection key registers (0x00 and 0x10) that
> both need to be unlocked. (Un-)locking 0x00 modifies both protection key
> registers, while modifying 0x10 only modifies itself.
> 
> This commit updates the SCU write logic to reject writes unless both
> protection key registers are unlocked, matching the behaviour of
> real hardware.
> 
> Signed-off-by: Tan Siewert <tan@siewert.io>
> ---
> V3:
>    - Change logic to unlock both registers on 0x00 write, while writing
>      to 0x10 only modifies itself. [Jamin]
> 
>   hw/misc/aspeed_scu.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 4930e00fed..993cb800a8 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -91,6 +91,7 @@
>   #define BMC_DEV_ID           TO_REG(0x1A4)
>   
>   #define AST2600_PROT_KEY          TO_REG(0x00)
> +#define AST2600_PROT_KEY2         TO_REG(0x10)
>   #define AST2600_SILICON_REV       TO_REG(0x04)
>   #define AST2600_SILICON_REV2      TO_REG(0x14)
>   #define AST2600_SYS_RST_CTRL      TO_REG(0x40)
> @@ -722,6 +723,7 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset,
>       int reg = TO_REG(offset);
>       /* Truncate here so bitwise operations below behave as expected */
>       uint32_t data = data64;
> +    bool unlocked = s->regs[AST2600_PROT_KEY] && s->regs[AST2600_PROT_KEY2];
>   
>       if (reg >= ASPEED_AST2600_SCU_NR_REGS) {
>           qemu_log_mask(LOG_GUEST_ERROR,
> @@ -730,15 +732,25 @@ static void aspeed_ast2600_scu_write(void *opaque, hwaddr offset,
>           return;
>       }
>   
> -    if (reg > PROT_KEY && !s->regs[PROT_KEY]) {
> +    if ((reg != AST2600_PROT_KEY || reg != AST2600_PROT_KEY2) && !unlocked) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
> +        return;
>       }
>   
>       trace_aspeed_scu_write(offset, size, data);
>   
>       switch (reg) {
>       case AST2600_PROT_KEY:
> -        s->regs[reg] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
> +        /*
> +         * Writing a value to SCU000 will modify both protection
> +         * registers to each protection register individually.
> +         */
> +        u32 value = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;

u32 -> uint32_t and it is best to declare variables at the top
of the function.

Thanks,

C.



> +        s->regs[AST2600_PROT_KEY] = value;
> +        s->regs[AST2600_PROT_KEY2] = value;
> +        return;
> +    case AST2600_PROT_KEY2:
> +        s->regs[AST2600_PROT_KEY2] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
>           return;
>       case AST2600_HW_STRAP1:
>       case AST2600_HW_STRAP2:

