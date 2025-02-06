Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1416826njb;
        Thu, 6 Feb 2025 01:24:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwbJr582aRdERZgMeCfAc4NY7jUJLc2NLITUBZ/0rGd6Gf7SsbySExro8/BmN8q3auDWb9BHFX1f6qNA==@linaro.org
X-Google-Smtp-Source: AGHT+IENM0h1ZFuTwNozlCTK9YizQDEwovRmrmaCicSpaBAzlmQT11miSq+P70mdYE0HGL0SB1Kx
X-Received: by 2002:a05:6214:f65:b0:6d4:c6d:17fe with SMTP id 6a1803df08f44-6e42fbda535mr116553886d6.25.1738833875879;
        Thu, 06 Feb 2025 01:24:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738833875; cv=none;
        d=google.com; s=arc-20240605;
        b=S9EujpGYhvWmawkVpZtV8VJYRIfPoh3QmKXnxz0lweb4iUTPiH/yrfePvn6M4dl0Qu
         ZW39HYibbRdoOyCgMsTkZb8XfeWAJR/uly7lVSY0YpYQfjc0IYMwGRPVe2CeGPdWJrQM
         65m9uA9uVi1ela93CQsLlzmNmd0NnCRo+aUupdLRqhp2ih8hpu0eObhl05u8Mtkhz5kY
         v+HhUc9bjvRRlHHqUPd+veYBn5ev40OwAAGB96i66M230VzHONIYyG6lbtMLRhqRD+Lp
         YddMHodoypl/g1H5xlCRNd/u6jBywNOZ/FSa9/M1j5aSwIckT7VvcVnrsqweRiTzgRvc
         yHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fKNhj6bAZJIRl/H2MLmtIBXk+VXz7QFWq/juP1WJVu8=;
        fh=c8fHOSfepZpraM5kd61iQblNo+/0YhVDJmbS6Tbl5o8=;
        b=UYoHDQSSZLVDHi00zgUy70LUb484Voce9lEvPwq5a81+cewxOUM4yiMIlyZ1pPb5eD
         qYl97sKE4AQ5lQ7u0fQ24q1dphv3KSgGI4o1CWBhi+7r9c+jBu6GjOzLtint3huFHumQ
         dBH06+prBh/u311bHNJ55uSqNpoTMgySiwQC2hvp5iWWitTVYCVGyKKRepLMinArLe3B
         zCeX3A618caHRqkDamBuPMIRwLWxrMW2FFODifByIgqobR6EgLSKZv1EmZ9G/ZimrBfC
         7QIDrxOYre8laEOk8onxKGcBswGGXo0POAVVsbMXAXRAvi8LXROTaistHf9HxZm2LAGG
         R4sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GffoifZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b913ccsi7566021cf.392.2025.02.06.01.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:24:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GffoifZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfy7d-0005mp-Ny; Thu, 06 Feb 2025 04:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfy7c-0005mC-25
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:24:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfy7a-0002fo-GE
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 04:24:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso3834085e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 01:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738833869; x=1739438669; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fKNhj6bAZJIRl/H2MLmtIBXk+VXz7QFWq/juP1WJVu8=;
 b=GffoifZaQU03dHooxwU6ncupDYXdzBvzRrCCvYf4Zo8urGgqedvvtPTHcaQPEa92lL
 VTd6xIIKrq/c3MiU8kwo4XbAp/eZQS/WtGOAo5Ju432v0fiCwYsCb1CkikQydgocq6Nl
 Rv1j99PxYnvokczw3lDaX7tQD5ieDtHfT4ASyAVTs8VK8IKTMqfbckfS72FK1ersQqMY
 Rz5ip5ncORiypd2UUcmdVlUZf+WDxEjheRvXfc5wO9qNGajXwQYltHY8887BXgeLY5Rp
 GrjN3oHjdNY1+dy+gifwCMUSvUFNVRSdGUu0j3ZiplqhJRugz2UiQ0BytPkaetMYOBcQ
 pxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738833869; x=1739438669;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fKNhj6bAZJIRl/H2MLmtIBXk+VXz7QFWq/juP1WJVu8=;
 b=sYyoTu5RU3FMtPO7HmCSfX0uK7xe0pqsFQNY/uLp8vM0bsTFrQ+lZVPE19tt0jHgBb
 RPssR+RDnVYHxs91vQiogrsZIiDrV9ICSWbbFAlOWPTkzPn3avYDKGcuOeL3yWQ0+UJl
 WQp9EDlcytSYwHZ/5DSjQXtm3HSYqbq/t15UbllSNvFPEIc4XdT5GPlbMYccSOwIKawN
 /ssIJxdJKgOHDLMEHzTr2vhnLCJ95eB0GCfN04OWrAwEIaMk3IPSo25YiW2OfQp0IRMp
 jKAtQE2pF1Y2Ls0ertUXS2SkXdpimYVm+faPVAwWU4ImL83Pr5ygvxjuyV7gjQehp2x5
 b+rA==
X-Gm-Message-State: AOJu0Yx1YwDreiUll4dvfvQnqHDDmmUJ04isa7MF+PuWcRmD9xWC7EZX
 449AePRLVhTZxeZ3GV04ur0j87gatE7zrZPanoj6F5rTTNSQsX9kN+Y4Y37kyIA=
X-Gm-Gg: ASbGncvvyQ9/tPCKE0CBDguPkWB473gPweTSRbfhRKMPnhXpa1nB3MY80dBN2ubc4VB
 eR5yvL14IbJK8U0/WIEcCUOjx5Nl4wyaEKRw2A+iT9ckyDzyt/3TMoxnqjiZ4V9XWGLkKDDPHR2
 oeZPyzU4h57eWe/d84EcW5GrLov4qBGjC703kKDgePVZ8oF+QFqjXvPxljzWhwB+N1kIpRaZ3nX
 Mnlg3mmCqXoPE7fKmDMFj6Lc4icyD+ZmPX+LDDhIqZrk++hDBIR/QFv3kIu/ODrURttBozZU19j
 Vpv9FXvPrv5DVytv/yZ1KD5ni+sJ78cJ+IZWk5YN22msO1bEfUnSCp4R0IU=
X-Received: by 2002:a05:600c:1393:b0:434:fd01:2e5f with SMTP id
 5b1f17b1804b1-4390d56f60amr48358185e9.29.1738833868893; 
 Thu, 06 Feb 2025 01:24:28 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d966faasm49362345e9.23.2025.02.06.01.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 01:24:28 -0800 (PST)
Message-ID: <5b1a3d9a-e898-4dca-bc7a-9a182556b519@linaro.org>
Date: Thu, 6 Feb 2025 10:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/17] hw/misc: Support NPCM8XX CLK Module Registers
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, chli30@nuvoton.corp-partner.google.com
References: <20250206013105.3228344-1-wuhaotsh@google.com>
 <20250206013105.3228344-14-wuhaotsh@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206013105.3228344-14-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-TUID: zb8Rexqa02pL

On 6/2/25 02:31, Hao Wu wrote:
> NPCM8XX adds a few new registers and have a different set of reset
> values to the CLK modules. This patch supports them.
> 
> This patch doesn't support the new clock values generated by these
> registers. Currently no modules use these new clock values so they
> are not necessary at this point.
> Implementation of these clocks might be required when implementing
> these modules.
> 
> Reviewed-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/misc/npcm_clk.c         | 113 ++++++++++++++++++++++++++++++++++++-
>   include/hw/misc/npcm_clk.h |  10 +++-
>   2 files changed, 120 insertions(+), 3 deletions(-)


> +enum NPCM8xxCLKRegisters {
> +    NPCM8XX_CLK_CLKEN1,
> +    NPCM8XX_CLK_CLKSEL,
> +    NPCM8XX_CLK_CLKDIV1,
> +    NPCM8XX_CLK_PLLCON0,
> +    NPCM8XX_CLK_PLLCON1,
> +    NPCM8XX_CLK_SWRSTR,
> +    NPCM8XX_CLK_IPSRST1         = 0x20 / sizeof(uint32_t),
> +    NPCM8XX_CLK_IPSRST2,
> +    NPCM8XX_CLK_CLKEN2,
> +    NPCM8XX_CLK_CLKDIV2,
> +    NPCM8XX_CLK_CLKEN3,
> +    NPCM8XX_CLK_IPSRST3,
> +    NPCM8XX_CLK_WD0RCR,
> +    NPCM8XX_CLK_WD1RCR,
> +    NPCM8XX_CLK_WD2RCR,
> +    NPCM8XX_CLK_SWRSTC1,
> +    NPCM8XX_CLK_SWRSTC2,
> +    NPCM8XX_CLK_SWRSTC3,
> +    NPCM8XX_CLK_TIPRSTC,
> +    NPCM8XX_CLK_PLLCON2,
> +    NPCM8XX_CLK_CLKDIV3,
> +    NPCM8XX_CLK_CORSTC,
> +    NPCM8XX_CLK_PLLCONG,
> +    NPCM8XX_CLK_AHBCKFI,
> +    NPCM8XX_CLK_SECCNT,
> +    NPCM8XX_CLK_CNTR25M,
> +    /* Registers unique to NPCM8XX SoC */
> +    NPCM8XX_CLK_CLKEN4,
> +    NPCM8XX_CLK_IPSRST4,
> +    NPCM8XX_CLK_BUSTO,
> +    NPCM8XX_CLK_CLKDIV4,
> +    NPCM8XX_CLK_WD0RCRB,
> +    NPCM8XX_CLK_WD1RCRB,
> +    NPCM8XX_CLK_WD2RCRB,
> +    NPCM8XX_CLK_SWRSTC1B,
> +    NPCM8XX_CLK_SWRSTC2B,
> +    NPCM8XX_CLK_SWRSTC3B,
> +    NPCM8XX_CLK_TIPRSTCB,
> +    NPCM8XX_CLK_CORSTCB,
> +    NPCM8XX_CLK_IPSRSTDIS1,
> +    NPCM8XX_CLK_IPSRSTDIS2,
> +    NPCM8XX_CLK_IPSRSTDIS3,
> +    NPCM8XX_CLK_IPSRSTDIS4,
> +    NPCM8XX_CLK_CLKENDIS1,
> +    NPCM8XX_CLK_CLKENDIS2,
> +    NPCM8XX_CLK_CLKENDIS3,
> +    NPCM8XX_CLK_CLKENDIS4,
> +    NPCM8XX_CLK_THRTL_CNT,
> +    NPCM8XX_CLK_REGS_END,

I suppose by '_END' you mean '_COUNT'. Better define
unrelated to the enum, to avoid confusing static
analyzers:

#define NPCM8XX_CLK_REGS_COUNT (NPCM8XX_CLK_THRTL_CNT + 1)

> +};
