Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp339244dlb;
        Tue, 7 Jan 2025 11:29:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWO+vyfUg07l3Z1Nv310T8ttuhBiZOHTA4YvdkOpDDQfGWyrsw+Qc53/W7WnbrUZT52J+jSvrwLpMl/9w==@linaro.org
X-Google-Smtp-Source: AGHT+IHVQZtMxonDDwljNWAyXMSMZ3NbwguP9s6c9cv1HGJErefAzOKT53kpmVdJQIl2e4lTrOBT
X-Received: by 2002:a05:620a:24d4:b0:7ac:c348:6a52 with SMTP id af79cd13be357-7b9ba7b0075mr8023621285a.34.1736278164767;
        Tue, 07 Jan 2025 11:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736278164; cv=none;
        d=google.com; s=arc-20240605;
        b=P1B9LybJOBrdD+FeBsn8jZfBZEo00eedqfs28OB2A9dOaPk4qq5o89fp7zy5c98moz
         FOkmEeaCOpiYTTgAlVCVQdsW/dHEJ9Zq8atkgTlz48FwmmZwSyJDy5/miKKxdaNO287e
         M1a16aH6zDyWACnAOIiUuEm+gNxTZiqpZ1rm79eYmlC6HZUDw9MpnezZq8Er2fbBvwLV
         aANOX9Si2l0tEL0VESDJW6nuGc1zr+84rvfmJZjLem6Q1xhsDNnoWH8BIgKjC9dJFC3W
         T5ASqiW17pZ+R5XXLpOL2A02rufMd4x9OldrPRdT7t09qbA/P5qVeYYMmXBMaOAngT1w
         xajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vyFFLRSOZZ/LjLvhBoGESjhVRbOb173bsmDRFnpcbhw=;
        fh=ltDXf9afy4T4/gCEOvAbbPH6hxMaF+EG7HQHlQ51EEI=;
        b=KiUGWf4nG6oBjnFxi/pvzDsC5CMa1wUT4MVpLixpkMJJWg+Nq2EpJ9pGlhViCBYBHF
         96FFfHkUyVfKpEkiaTsBYJLzG6y6Y8O079l+fXq8DAJCxmLh7WIyvjfrXt5bn3G7lUR0
         PanN/+Y+cBLAGqu52qIcJbejArOWNchR0E0sTb8dv2B/UdVeFlLa+wdR5zg9859Wggr7
         /QXDsJ/fYuigxH9RGiX63aZk6IGj9BB+k9TdbWNMW8JRemoLuWPhG1kkyYbfOX9oGUni
         BnM5aAuP8f/dI/5INMaIOLSByO47bqHIlO5UlyjRMLHycK3t8bmGlPiftD16rdLUT5Mr
         k4+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=huqhosXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2ab7a5si4524207785a.15.2025.01.07.11.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 11:29:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=huqhosXh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVFGS-0004mw-Lp; Tue, 07 Jan 2025 14:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVFGN-0004hI-3p
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 14:29:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVFGK-00085p-Ie
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 14:29:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e2880606so11558358f8f.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2025 11:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736278151; x=1736882951; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vyFFLRSOZZ/LjLvhBoGESjhVRbOb173bsmDRFnpcbhw=;
 b=huqhosXhy0Jow+rkVAKyfpl0NzMNFLEXHHWrL5g9LxaZ5c/c9EvmpTjlxW0IMZKuDp
 LeBH/Adtd+eAu4aqrUfRIrthyrFIjJYg1bBw/yaR9+DTKbHfNUsLNwzcDW8FKUgXOdUF
 RtaYKjJSES4IG/RA4G6P01XJTucRe9p3LuJj0yDWniA78Sn3DZIDXN18yVVmNYdzae62
 kwcQoVa29wXzWPghu44V5feXQ5IRCJl4u32Xn5qEewW5rIR6xkDyBngBKINkzFGn2MCc
 JvuhrTvqFDCGV0lloRYjCOIx/9tg7dqPafqZz9GPDFVwLnH50eNeJf2LawKdLTftQgGm
 9cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736278151; x=1736882951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vyFFLRSOZZ/LjLvhBoGESjhVRbOb173bsmDRFnpcbhw=;
 b=Q+NFY7LNxPa/t2ffJX0obItFu76VpVBl4s7YPlwPa2gVXh45bW4IA3HQ2dl/cLcNQ3
 Z70AdOZ0HMRDDEB0Wiwy2Y9ytBvoMqwSW12zYLM1vFqtlawaQ2PcobNVhz4OJ8dPfYvk
 4fY432yC3iawD6AxZ3iR788IndObehClAklvCdL0TcoMMnJPqhkmeNsoUuuEeqhOcZWi
 pARPRY6ceWC2Ib7Cnt63Hs9kzIWWQoR9MJnJbMY5knBebjBBOMqVLsBBTn9xAKHklzVe
 ybw1e0k/mcTxPS1aXQvNzaY89q60BlH2f6ycPLDswBeIvrvMBzw84qDI5rp/Nq36+Un7
 Zqww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYhmMxOTOWO5XtX5ANb1G3OnHSlgIVNTjHLo9iEdCZgCivIUKLTUzFs33NU8Q2zP/ahYBwv57MLA==@nongnu.org
X-Gm-Message-State: AOJu0YxiMn6Ma4F/ezTFA4DyoXBOAC0dCe2LGN5aKS2qPZIMFZOqBrRp
 9/TmPXraI1iPRZoBay3ePkHxyZiCi/Dxemdwxh0z/mjB9lp3XmP9nQUAWJOtPMk=
X-Gm-Gg: ASbGncsGgBGWk1OCQI1us9Bc/GtZIVFGj8U4Lp9CuxcVGuYbReNg3aXidHsmhmlwnfS
 z+0S+Gcs91AYHS5tW5FnFOlywSo3aMSFdxxAV6ZXEosuGlpZyC5WEYIU7Qg5oQ5JAZp7yitMdm5
 dlrZ1r6yTtR35yYLE5aywyUEmO79QMv/W47FV0jTVW2Fk7iuWv86cRe8B0Cu/7UXRXKjC43PMcc
 ddg2Sc4s4uYnSQwwdGpBjIP5hGZ2iRVkxDscRYtRsetZpFL4EgWTozcZUIuNK37gLx5DoNhXzR1
 LOpzan/D7qZOF8heBRouEbkM
X-Received: by 2002:a5d:6d06:0:b0:386:605:77e with SMTP id
 ffacd0b85a97d-38a223ff609mr52959353f8f.49.1736278151057; 
 Tue, 07 Jan 2025 11:29:11 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828e3fsm51734282f8f.5.2025.01.07.11.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 11:29:10 -0800 (PST)
Message-ID: <a0fd5f28-42e9-43dc-9b0d-d4022fe51cee@linaro.org>
Date: Tue, 7 Jan 2025 20:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/sd/sdhci: Introduce a new Write Protected pin
 inverted property
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <20241114094839.4128404-3-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241114094839.4128404-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: dXB+J9pwmGdJ

On 14/11/24 10:48, Jamin Lin wrote:
> The Write Protect pin of SDHCI model is default active low to match the SDHCI
> spec. So, write enable the bit 19 should be 1 and write protected the bit 19
> should be 0 at the Present State Register (0x24). However, some boards are
> design Write Protected pin active high. In other words, write enable the bit 19
> should be 0 and write protected the bit 19 should be 1 at the
> Present State Register (0x24). To support it, introduces a new "wp-inverted"
> property and set it false by default.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Acked-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/sd/sdhci.c         | 6 ++++++
>   include/hw/sd/sdhci.h | 5 +++++
>   2 files changed, 11 insertions(+)

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

