Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp543771ejb;
        Thu, 16 Feb 2023 06:28:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8T/gqG6119T59bHAmwRmYF9Qy/HZ+ZrBMvMgE3S4CAtvnpzHnjPqmxiaAv0/Y+MOgxNPtw
X-Received: by 2002:a05:6214:509c:b0:569:abb6:f09 with SMTP id kk28-20020a056214509c00b00569abb60f09mr11039059qvb.40.1676557698198;
        Thu, 16 Feb 2023 06:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557698; cv=none;
        d=google.com; s=arc-20160816;
        b=Qi5x8EqtNO+KsPpdh4i0D6+5eAVnhLwtTeZJ5niqgT4m81CAl05xcdUNAH5SoTR/Or
         8YpD9zfYEZHet4gPyO4aV/OjpkdQ7RXvTIlmh7r99tz5rgU5cmEBBYc810cSvGaN+OWS
         896VOJoOBXcuiAGvBqijHlEunHcpiR3bd62d10VeI6TriBwU2MehLevBVFe4rGH0pyDe
         ymMDxZlEcDoQotBwaByC/O/xlCgN8/3eNANhPlptcSKSh5z8VEXkVxWnYPrRZkGJrxJS
         mfYHa5q1U244aK34jwfE2qInImjzkeJ7VXJr7968TMa6k7pvWdDOnZ9IKmrWzL5z/zTh
         2S5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=UphD501LV9nRiE7X4Zi4rgSHUT7gzWe9G/z0VbgkVlc=;
        b=KIOYYW4RWJkBx98ocBV3eQlTQso/c3cNqgu97jktTqv56NGhHgREijM+Oc09DUqeT7
         Bve2w3CyQqei+1UNsebEGr7OudCB8IlJLM9fF7HA99ybsJIX+2J1lOU984bGrTw1IKzT
         KMVhB5yRSQzPfKtx39mQHv7evmiMIWb9ODBiCl1Xu51+awKtkBwhEcF41YsrGHq6jzOl
         iGMxURWsb8D5ykqngorTvu37AOsyxB21nWOWAdCIbXr6dgSGCNrjPw89x/Xng3mbTuUp
         F5CsPoK39kTVAQL3xryTN0+6mo0uD8bFw6LySqwpIQdYHffEvOuojIWBubuz8QhbojxE
         /vqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkTXtDI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a0cf0c9000000b0056bf0b14487si1203774qvl.511.2023.02.16.06.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 06:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkTXtDI6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSfEw-00046e-Qk; Thu, 16 Feb 2023 09:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfEu-00045Y-LJ
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 09:28:00 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfEt-0000q2-4s
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 09:28:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so1845108wmj.0
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UphD501LV9nRiE7X4Zi4rgSHUT7gzWe9G/z0VbgkVlc=;
 b=hkTXtDI6XADzChw2XtPD5Uiwr4VxVKL86PJiHLyfH+xqqHdaAzln5PMDdLr119cZTh
 D1XJT7Ajx0ZHMurSTTUdOX6bkmbkGoiCkn84gFe5TVpnBQIEldUs0vliehXZlclMUy4P
 J2ypWwW/lS2kE7xFohOhoMDjVd1VC9z/Yp1xIhooWm9KeDj2vxj20MqEWAPSQ0XZZDkj
 KRvu6GkB2e2TkWRkIH+AAY39nD4DeZ8Yj7txw5d+PLbhWoFscRlxb9gTO1ea3a2trG7W
 Qn1TwlcTYD5sfJ9oN2OsuCSDiAyGDwxc4dtg8DSGO+m3sdnt5Rg2bBO9fVpQokmRwgWe
 S0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UphD501LV9nRiE7X4Zi4rgSHUT7gzWe9G/z0VbgkVlc=;
 b=ZohNOpTTzk5PSktH/0PNve1OXA26lneh4o71cg/uKbXXWPBIQKVsN0UUNUNA+zGi3v
 fyCTFXIQjak4Ucdta4biBIjjD7X5nfGRUMw9Qh+m4itwjz7yWUjSlteEDb/mAGovfBsV
 65mdfR6YQCHAnHjlksVCjpiHfYU51NTfD80+rNGTzMp6N02cVUtpyzhWtVS/BbBVnnWF
 N850m71fOOtS1KaLvcSyjJIg5f6ryxYGQzKMaMiBdXecMNnsEKrxbQIxLYNtVt4eMwjs
 jHdN3fq4Lgryo87nTEtjmkzjQpDUbAsmk1T25LNUbSxuI5E/pKLxTvDElZbWzdoTwocr
 3IEg==
X-Gm-Message-State: AO0yUKXvdt9AAyYdHEvsDsEUpe5fbqJI4KrUoPghsYaFUtdInDuSTumq
 C8c6kaey+Tw5yI4FQUyen2t9mA==
X-Received: by 2002:a05:600c:992:b0:3e1:fff7:e970 with SMTP id
 w18-20020a05600c099200b003e1fff7e970mr4931701wmp.30.1676557677644; 
 Thu, 16 Feb 2023 06:27:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c378200b003dfe5190376sm1894071wmr.35.2023.02.16.06.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 06:27:57 -0800 (PST)
Message-ID: <2e46db2f-d48b-bc6e-85d8-1fa80ef4082c@linaro.org>
Date: Thu, 16 Feb 2023 15:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
X-TUID: 4czs06R7PNdL

On 16/2/23 14:33, Karthikeyan Pasupathi wrote:
> This patch support Yosemitev2 in QEMU environment.
> and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
> along with the machine support.
> 
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c        | 31 +++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h |  3 +++
>   3 files changed, 57 insertions(+)

> +static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
> +    amc->hw_strap2 = 0;
> +    amc->fmc_model = "n25q256a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->i2c_init  = yosemitev2_bmc_i2c_init;
> +    mc->default_ram_size       = 512 * MiB;

Odd indentation

> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);

Here too. What about:

        mc->default_cpus = mc->min_cpus = mc->max_cpus
                         = aspeed_soc_num_cpus(amc->soc_name);

I suppose Cédric can fix when applying, no need for v4.

