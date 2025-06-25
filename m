Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp751080dyb;
        Wed, 25 Jun 2025 03:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+iTM7fxZMWf3kkXavY58a5HytgeULgEOXWU80Rryscj/TbKNmKXeSJt4wuMTJnBXf6LM1NWNDT4drDA==@linaro.org
X-Google-Smtp-Source: AGHT+IE8cuA2NCwP2Q+GDL4NlPwiYemY0uDHqEmgnav9a4iLsxJpSFyqRzYhTvei2iQOrunWlw0V
X-Received: by 2002:a05:620a:410f:b0:7d3:90e4:1581 with SMTP id af79cd13be357-7d42974c4e1mr295925885a.42.1750847215261;
        Wed, 25 Jun 2025 03:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750847215; cv=none;
        d=google.com; s=arc-20240605;
        b=PIgLHJ9SedrARaiup1AUgPjxxiXAW4qUaerZUIzePwHk05XKiR6oKP1KFNH8Hpji2i
         e6Azz7kyaf+GUR4cxjxY0NpO1DXlm6Qz9juwHpavNV5r997HhHsFfePUYHz2bVioAPzP
         CaVS5S83fua1GEsm2eAcK222Hlzr+N0JmSli5V/glqRBSnLDMkFsdwPc31uCLC9LpM4c
         VpmGXMUKJUysDDM+r4G6S6rzlNjVA7011v11yhDtWUO3vG54A0rG4+Sru55J6F+yw+2V
         Lg+3kn0LYDvRgyi7lkXoMh2UELqsROO15hSlKO8Nu5q1WUkErj/dMLOL1htY9wz/K9VP
         pcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NSXeXYYzfwYyuvQlnP/dxqPNFRa7HWdTUao3PH64I3E=;
        fh=+VDWOlto7KYYEEi7NCZHTsjW41EmsLdiTgPT/WIHoGQ=;
        b=AAbus/LRkTWy52Vtcpaqh9NMVZQPwu2X4waVeroo/pTtFHEYh5FH0NKRiRjHZeRz2f
         GaHUWypvWHGthE82BmUDw7GoTzOUAOgHGd12qFh3rtrHjBYQFzf3NjbLdiRDIozod/Q2
         NR1w8kDy7vydGAZA+/gnkwytPBWgTY4M9kFkwBqGZvXtYOlFNLytoMIOfLg+w5HPIELK
         KRl4W/V5//ZAZ2bmhGO/sTI99IhbOu7hBH8e7IHdaGqD2/d0TIdLQnlAExA0cxmftwqE
         HSfFFLyz6/dgXNWFMmBIXtmbpkk9Xl3HmgQUgtzGCwERvH3sANvfi7bSiWJ3VL+AAZq+
         9QPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6NWXpsu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a09e78si1127038385a.423.2025.06.25.03.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jun 2025 03:26:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6NWXpsu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUNKw-00071A-D0; Wed, 25 Jun 2025 06:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uUNKu-00070b-BU
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 06:26:36 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uUNKs-0006VY-FL
 for qemu-arm@nongnu.org; Wed, 25 Jun 2025 06:26:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-710bbd7a9e2so60611257b3.0
 for <qemu-arm@nongnu.org>; Wed, 25 Jun 2025 03:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750847192; x=1751451992; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NSXeXYYzfwYyuvQlnP/dxqPNFRa7HWdTUao3PH64I3E=;
 b=S6NWXpsufcYb02oedlRJBymZCnmoC3l1JqAgChZj/TDX76PwwPjknflSoX0hEIoOi7
 +eHsZY6hpKKMwEXymi4O9HNbEJNM7HCZP3yR30D8lFajXhwaO/0PoL32yP2J942w3f8j
 WX7E8sByehj3ICZtxxE11JKqOuHq23lQ+IaHQAzgCWjp5eK9OQrhaujJN+4hwCY4mSep
 rjhW52IKAuojSpBK+csb5F9O5AQD1UQbfyyjm1+4D1bKkBfG2x1jEVANmT1MFDSU8RMh
 +/IBam6njKi6DOWXLGLv1Trn6Tw6sWRzAtMZ0p56bW4SSsC82DCU2hHwpbE0jHbxg6LP
 sg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750847192; x=1751451992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSXeXYYzfwYyuvQlnP/dxqPNFRa7HWdTUao3PH64I3E=;
 b=H9KhH842KQUghqfYopSfjVPgI4BHOVeJAkQDA5iFh/I/k1zd33ANfmSSgAOlpLMujs
 bm1kXcDZ6QcSuXJMYaVXYC5SfMuHPbFgIF5C9KaDpA0BaF+c/iUfELYmK/PaMf0LHrCW
 sAVp3vzTIom2WuE7PHet8bRfbpsDV/pX7If4/9dAM2HpvIHjCrEYx5jEeVgXpyj9PCTM
 IUEZ68HwVcpZB3bwkoU5ozGlSDwXXOqntNQ+zOPHMDIOcBQ2aLbXHhJW2bccohygyDDi
 gMUb4xKyj8cAAP737tn6gxUhzM5WCzKeLI3ZijhkLVL9bBp1euB27NBmT+/kcTbL/ICX
 zTZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdabD3EYa5nhObQNLTfzEw0NdpuRM16G6qhY89f9J5sV3b8BYOk3lT9gsYeEjMxT0xIfJdWArFWg==@nongnu.org
X-Gm-Message-State: AOJu0Yxh57WyTekXrjFqMcMizvvy5Q/+Eu3F4fyeh8d6Fv8eOciE15UR
 FUHuPDmogsRt/g8UiaZ8IkeEsqQ+jxUH352+WuVmuzBsujVxSSB/LbawCeiWMvLoAdiKsNkh5j2
 R1Z0i/wXAhwh9iUWCpsSxrYSr/1UvXkAcv63GDLdQag==
X-Gm-Gg: ASbGncsb2GFded/IgqVgRE2WOjTUNl4gNg7e7DeUrbkznXlnXg2jcDrjZvLGzUaU1SC
 3uQ3yllke3rRR+jxhMgEbu9VStW0mcUnzBWsTTQYKvK9MlzSnFuY8IfGsVxcbBBzbqehXRwwP61
 v+7kVvr8qyoISEnusdpjShGiU+6Kr794U4nXs4pB55deXKVIfquh5jxfk=
X-Received: by 2002:a05:690c:5506:10b0:70c:bb54:cd05 with SMTP id
 00721157ae682-71406d9c227mr23704047b3.19.1750847192050; Wed, 25 Jun 2025
 03:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250624022219.3704712-1-kane_chen@aspeedtech.com>
 <20250624022219.3704712-2-kane_chen@aspeedtech.com>
In-Reply-To: <20250624022219.3704712-2-kane_chen@aspeedtech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Jun 2025 11:26:20 +0100
X-Gm-Features: AX0GCFuwqyXAweUMPZQdbzrRBYG3pm7MInO6RuM1zhrLLFPhuBWUUFzF84WFzPw
Message-ID: <CAFEAcA-Kpg1YjdQ9toU6cYmhpo+6GRgAxxF2ny1SG8C2wFz29g@mail.gmail.com>
Subject: Re: [RFC v6 1/3] hw/misc/aspeed_otp: Add ASPEED OTP memory device
 model
To: Kane Chen <kane_chen@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l7C8ikydQWBr

On Tue, 24 Jun 2025 at 03:22, Kane Chen <kane_chen@aspeedtech.com> wrote:
>
> From: Kane-Chen-AS <kane_chen@aspeedtech.com>
>
> Introduce a QEMU device model for ASPEED's One-Time Programmable (OTP)
> memory.
>
> This model simulates a word-addressable OTP region used for secure
> fuse storage. The OTP memory can operate with an internal memory
> buffer.
>
> The OTP model provides a memory-like interface through a dedicated
> AddressSpace, allowing other device models (e.g., SBC) to issue
> transactions as if accessing a memory-mapped region.
>
> Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> ---
>  hw/misc/aspeed_otpmem.c         | 85 +++++++++++++++++++++++++++++++++
>  hw/misc/meson.build             |  1 +
>  include/hw/misc/aspeed_otpmem.h | 33 +++++++++++++

Our other otp-type devices are in hw/nvram/.

You should probably look at whether there's any kind of
already existing conventions for these types of devices
that this one should follow. (There may be nothing
appropriate, but it's worth a look, so we don't end up
with half a dozen devices that are all fairly similar
but all do things in arbitrarily different ways.)

thanks
-- PMM
