Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp249459lfb;
        Tue, 1 Dec 2020 07:16:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/j8350lTI6bx7DJhrnZ/NUPzaEdIHYI5C92EWyZOjenMmZjYrYyVF2eqZCGSPuUX/D8pS
X-Received: by 2002:a1f:1c6:: with SMTP id 189mr2469145vkb.13.1606835805861;
        Tue, 01 Dec 2020 07:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606835805; cv=none;
        d=google.com; s=arc-20160816;
        b=FvYf5f978pcR+YfzmygXghDcskuTNmG4q/2cnlpIWPM7vvXMykg+0ajeKh+KA2L0/j
         bwEtoT3eJm4RSmPBBSF2c4Hu4togqMEV3Fs/lYgYIVRHLyGuod+NJtNZYnWkhrBmleDm
         nwpCKJxdg8WfIMDXS05b6mKN4ah+0D2fDHgaNUDNvRKWpn+ehn4Qo0pNy1yH4rNgAoqW
         QR4jRLdEAXljKYXzTwHSBcXAroe/NY/PC4du2+DvG0bX92aGqVWdaJDsqyLd6T+b2zNL
         os422Omj5eoCrpPFrt/p8dhFu/Zv1lZAw5XJVJUS8qR0p9Z1rCQhM8MbpZtRSR4aIeta
         s7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6VnijJvF34OysNmzUOZ15mEx4KQR1BAeNwvUYqgzD/0=;
        b=dhMhGO0+tftWHWFrGngO/we01v4zDbozG5AVlAScgausJ8+SESaFZqSXXxWk4oA62m
         dPCZQcmdwoT3n3I+r8q7jLqN67lbMsUwKjEnr0pS5qxri1rj665WY+cGgEMZIvveueKI
         Rm+2m3ln9H/Ix66WwEMzfaXq3N621bFrUFWeJFzzU/kSgqqc4Q5EmPf54Jv+hMmUrStW
         kxslTv33Bw2wqJLmoLUn1C67PwSXpGqgxuxzCENzMZOBf2CN6Xv9IdAgm5cKhNFkIisa
         iywd4/KaC+qE/fRCxOmNlM9EyjbK102KsFT5s84khAd9xJ5fQudFuPFYL1EhxiuxobFa
         HjxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ugETyM2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si451569vsf.95.2020.12.01.07.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:16:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ugETyM2b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk7OX-0001he-03
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7OM-0001fB-Ko
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:16:34 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7OK-0002Ox-Qy
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:16:34 -0500
Received: by mail-oi1-x242.google.com with SMTP id s18so2106205oih.1
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6VnijJvF34OysNmzUOZ15mEx4KQR1BAeNwvUYqgzD/0=;
 b=ugETyM2bZy96+AlNCkEHvFJvTNwPSlNsy7e9V96w06AvXcBXAXSJ9OrwBE304hYfe0
 9UIrcYuHZ2J42Vr9DTlPvmb+lsSUHEVCWVPhpAXFr7pbqRBTiBrRs4Vf2+RFphvgN0V4
 DMFYCrNZx3yw8pdHU0EQp3OSaKk1ibp5hS/IksiG34PhLNSLNLCRsxbakiBCI97Xp2S8
 Gq7t/n0pZ2xQeCjv0JL5FkijvZW/jyaZbpxPUfd0sf22k7ITd9dRgRO0/75+MpuVXqqy
 HuNNyj8ndHwC5hYVJW3au6lj2ohxgz6QhYaNcasYF6iy+4H2A5xEZ9KBD38IjluX7nMC
 QpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6VnijJvF34OysNmzUOZ15mEx4KQR1BAeNwvUYqgzD/0=;
 b=uWXzxnGIEvSzmLQS/ZlulyqTER5WgBJ/Lt92P3eBDlFPpZ6Ummy06/9jLvAA5MUZkz
 UdbGwY7kghmNQuMlEZt2ovH8TSeWIXBgbTlI2gdjLWRQYb3prpre2gTg8uIdNGJ73tzM
 cfJI4uxOkb4Pa4ZedWAuxlBCe32RBv2Lw01XxuahG9FM1T+YaYnD+TZAC8FuIFABd63/
 LUdNhbwUpwhyvTlE3T03zEm3+omYSac70QDuwHUbQXscAIB73XX51e8TpDVJ6fmsJqyi
 wA6vUIV8tUCfLNa+Ksb+e5yDe85GHWpCHDUfV5ImBHK+a+1fczNquZxCKXGamDT+6Zmd
 nMoQ==
X-Gm-Message-State: AOAM533jhZ+yeB3eMHn2Tivuw/DAqQcirgOVYkNk1adZbctqL3v+UaEE
 nwyfSlvODZwO/Bijv9BANn675g==
X-Received: by 2002:aca:2311:: with SMTP id e17mr1937438oie.50.1606835791533; 
 Tue, 01 Dec 2020 07:16:31 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id k20sm449798oig.35.2020.12.01.07.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:16:30 -0800 (PST)
Subject: Re: [PATCH v2 21/28] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c036611-358c-a824-2a27-841b8ba8d897@linaro.org>
Date: Tue, 1 Dec 2020 09:16:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qK6RyTh2Pw6

On 11/19/20 3:56 PM, Peter Maydell wrote:
> +        } else {
> +            /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
> +            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> +                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
> +            }

This isn't WI, as you're zeroing the bit not preserving it.
I think you need to merge the current state of the bit to preserve the value
for secure state.


r~
