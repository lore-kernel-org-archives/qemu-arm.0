Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1376712eji;
        Tue, 2 Jan 2024 07:09:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf9hXCFtk3Q1x4K5qOFu8Y4dj8W7zKrNoxhX8Am6H2AMiJvYBZEkhlITeQXleGPyMnDUp1
X-Received: by 2002:a05:6102:5792:b0:467:8821:a581 with SMTP id dh18-20020a056102579200b004678821a581mr916838vsb.10.1704208181435;
        Tue, 02 Jan 2024 07:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704208181; cv=none;
        d=google.com; s=arc-20160816;
        b=vnDiiRV3hs3Yfx+1Fi8Dq+/ZH9GUSs7zz1eZhJaSr9Bp5C+dADz/13JC/ytpd3NPP8
         t595Bq9KKaoCdlY/cmOpdzSiOcc7sNsIJvWEtiP5++ILhueCTfrl0Ja/O0+xlrb8WSgO
         Cj8D+71xxMl1tlj/rg9CLgw2Yd5HLLb3c19aOvxGzEtbKTzblDhrObKOimLmle4rikis
         un1eAMe7XvxyUkgRRmu+B0s9oklYhtWpQFEni6DdWiFn9E6qDA7Ika8zraK8pdr9XCwy
         UPjesYa27WlsH+RAi8+gPoMNxcJIQYsMJEjZdQGXN9H/zC7AsGzsJUWt70SU/a1bV1Nh
         u7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J7Tq9QtgITf1V5dEA4XQbNPEPX/yCoTUWLmNnJyV6yI=;
        fh=bZWtE+2IYxYY5nVIcnTBLmLrldSNpLHGpP1RcWIpNhM=;
        b=OPU+jYffZer+anrTj3luf1tSBJMoN3TZpyRf9JqBoQJQ7BER7LKhW2LKvzO1PIrlvT
         jaeHBCsrUpE8BhfCkih5COz6JtjtYkoDYYXKx2UVJHr2CHLtYGJ5cwdiIB/AuuNcxoXF
         IN6SipNUoJgM2H49BuHqh1vx+uM+1BgrdR7IhGEziwuV62yV0lMfr/RY834wwk45ocQ5
         wi5tz3vH6Drdo1KNB+/sXm6mre+khSo/WHQa+1AdboeiOGyA1gJhzVf/dT9oFYvPu3Ea
         FeFZchVFOvHNLZuyDaMAR1INHzrgnE5u08Mhc2p32EXv9Wy74etEJD5iIAhTVLzasssP
         8sNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNY8KlsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gt11-20020a0561022a4b00b004678811c928si224061vsb.635.2024.01.02.07.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jan 2024 07:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNY8KlsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rKgO5-0001hy-HZ; Tue, 02 Jan 2024 10:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKgO4-0001hB-G6
 for qemu-arm@nongnu.org; Tue, 02 Jan 2024 10:09:00 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rKgO1-0000wl-JL
 for qemu-arm@nongnu.org; Tue, 02 Jan 2024 10:09:00 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e759ece35so7205199e87.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jan 2024 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704208135; x=1704812935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7Tq9QtgITf1V5dEA4XQbNPEPX/yCoTUWLmNnJyV6yI=;
 b=xNY8KlsCiKdR/dKI88opLPrm28l03/ZElUnU97UeTexmMT54aXcSSrKTWJ1bnqI0id
 CbeIe6HadrhHOnVlPWRjsXgTfh4IQKleRJDeIGB4MKisQKKGhkmnZZhSkLPgqgnkg5gu
 lNkm7h9iJfyX+gudtrahOusLSeLxwhx8gvraJX6HtaSMTkVljBWnE7BJjJWFuclLpqZn
 FQ594P2swLbcfB+JggZ7ip2NtPgFVWOLeKwQTU1yn7n3PQq0rm96YpTmLrRq0uNJ/DFr
 JnrTBHmtG6LoVb0l+FE83O2uqnjqltzjtNJfyB3fc24lEBMRsRM99wm01b5bFY/mb/Fr
 D7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704208135; x=1704812935;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7Tq9QtgITf1V5dEA4XQbNPEPX/yCoTUWLmNnJyV6yI=;
 b=plxwAtb9dTClHiZuYyG2soHibHDlxVVgl13hi4oDC04UN93XkxiD4E3dHcOSTfjG9B
 3+dbKIfUFYxZ8n2n5sAHMFohm8gn3VRD33j2Fq0PhL8XLxZyl8Ggt27BLdnvF8ftI1V0
 8afKRWhqS11euoGHa3xU7f3IeKTB6J4n+algtHkoEkuJ0qwZguN282XNHv81adXr22z9
 8CSldW2T9PGwTqcozV9+DZ8xVg5QH9spzAXkS2GzuypAB68C6Dw4Dpoj8GYfMYQdxRuB
 mNoyDXi9DCpwqlRyPWVU0zqGhkJFJVlPaP8DAVGG62C+MYxJzq84+vQAkZUMkXqB7JLl
 2ztw==
X-Gm-Message-State: AOJu0YwCdAOad7giTmPPL4ZUXtaenVAHqllcjzFmRNvVQe0UFRYQ02gC
 uZRE5g69uZFCvVego3aA4YgWJQuj5wMB4g==
X-Received: by 2002:a05:6512:3b83:b0:50e:7b37:d110 with SMTP id
 g3-20020a0565123b8300b0050e7b37d110mr5949366lfv.16.1704208135402; 
 Tue, 02 Jan 2024 07:08:55 -0800 (PST)
Received: from [192.168.69.100] (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr.
 [176.184.16.71]) by smtp.gmail.com with ESMTPSA id
 qc28-20020a170906d8bc00b00a279b182e42sm4026491ejb.171.2024.01.02.07.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 07:08:55 -0800 (PST)
Message-ID: <985e87d6-0f8c-4127-b425-f1efc6034879@linaro.org>
Date: Tue, 2 Jan 2024 16:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 8.2.1] hw/net: cadence_gem: Fix MDIO_OP_xxx values
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Luc Michel <luc.michel@amd.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20240102141803.117631-1-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240102141803.117631-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: REiI+wHxRW5Z

On 2/1/24 15:18, Bin Meng wrote:
> Testing upstream U-Boot with 'sifive_u' machine we see:
> 
>    => dhcp
>    ethernet@10090000: PHY present at 0
>    Could not get PHY for ethernet@10090000: addr 0
>    phy_connect failed
> 
> This has been working till QEMU 8.1 but broken since QEMU 8.2.

s/till/until/?

> Fixes: 1b09eeb122aa ("hw/net/cadence_gem: use FIELD to describe PHYMNTNC register fields")
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> 
> ---
> 
>   hw/net/cadence_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 296bba238e..472ce9c8cf 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -199,8 +199,8 @@ REG32(PHYMNTNC, 0x34) /* Phy Maintenance reg */
>       FIELD(PHYMNTNC, PHY_ADDR, 23, 5)
>       FIELD(PHYMNTNC, OP, 28, 2)
>       FIELD(PHYMNTNC, ST, 30, 2)
> -#define MDIO_OP_READ    0x3
> -#define MDIO_OP_WRITE   0x2
> +#define MDIO_OP_READ    0x2
> +#define MDIO_OP_WRITE   0x1
>   
>   REG32(RXPAUSE, 0x38) /* RX Pause Time reg */
>   REG32(TXPAUSE, 0x3c) /* TX Pause Time reg */

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

