Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp348745lfq;
        Fri, 11 Sep 2020 15:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ3dlVvl9lKPASD9qP4BhCKsAr8lGiMGkXA1g9FWtx2Opqg6qXoq1irkRIRakEv2DN6vyh
X-Received: by 2002:a05:620a:815:: with SMTP id s21mr3538614qks.0.1599864401295;
        Fri, 11 Sep 2020 15:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599864401; cv=none;
        d=google.com; s=arc-20160816;
        b=0yZh6q+3/jC2jlCe7X7BFMs8qkDgTvbKUideIvp0hSuuRuLo+Aoa/71A2gpGFPndGe
         7hzyZ8fyZf3SBLg94s/Y5jh3Oht/EJifyHCzArFvqET4l7b/OJMaZwREyylemNqpl5o2
         dPoFkyxkuvrFNd+shpXRHC9g3E6UbOKesNOcrNa1g07nrqy1dlxDXG/B9rj4vKnKcQdH
         3vW/tlj1h7DxpSdGk3dBnjnylsC+UXH8X2MjOqenXhmzdPDZtFvka/EbqkO9RyBWT6kw
         x8LWgjAMPv3z7BGOCLxM/+MRjHhFd4JxM8600dt8fPS0qo+rrSZ2YVrtAy8Vu26/z2Wt
         Hpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=a5s99WJ6mjD+4VkGpoNBYJN9rvrJZfcckqPPJKiN9NE=;
        b=N16XREEJxFZvZYrzyxWWzVb0TuDiJ033Lx5MktbHvAcMk5LjB2BBk0+3ThANgBOTiz
         pIQqVgFnQLUrW+jdRh5anKIuZoR1g29yTxngwnsjBd6nDdr5P1ue1Hxh0M+NcGTnX7u/
         HOIbWOCl6zWmxq4qrl3ED0+HZcDlRWYt7NDiGpTpKxOxZs/LxwpESOmlWZI5rqFyvr3P
         igBIYJAjFm6JpLejY7k8ebhL+v7jqQyXMfNFemH4STASsCjTQQzJu1npizeY2xW0bvVJ
         RlbcpnMAQe/nuJKFRKgH0GKPeHt6CjEsLmc9e1oBBDYlCFBpbfW2cUTIhR8uU7crq09m
         9Jgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=puAMFbFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si412793qvx.118.2020.09.11.15.46.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 15:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=puAMFbFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGroW-0003BX-Lt
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 18:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGroP-0003BG-QV
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:46:33 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:51463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGroO-0000mH-92
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:46:33 -0400
Received: by mail-pj1-x1043.google.com with SMTP id a9so2410879pjg.1
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a5s99WJ6mjD+4VkGpoNBYJN9rvrJZfcckqPPJKiN9NE=;
 b=puAMFbFglv9PjZbL1V8YSNYiBrDcC+2PKXeLYA0a+3IDEYKLX37wDeTbNxngKuC8r9
 c10Nwt/IXBpU6lLPZIldvyxkNAuA3g7cZRQtpzbFH1hi0IWWYHPeA5u5PfmKvpECRZtU
 /glsThquFRykYwfW60RhYoV6idjxluMQoa+k78ZVrqTG21X4/sJtAxItAGhr9JknoKBf
 7JSxSkyqToUFsona32TT9mphDD8Ofv7VF5r7/j41CMC1OR94/EbokRLHt1/Oi9UQfBpm
 aydhhBip8qO2paV9GKdwQi+nEEyHLRXJAG28t9hPwlN51NYAI7y9AIvY61eKDh+8/Qhw
 og2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5s99WJ6mjD+4VkGpoNBYJN9rvrJZfcckqPPJKiN9NE=;
 b=po6D5jwNblHCeqlwh+jZ480MjsAHYnZZC+otdt1CvktMtimD7chAlMohz81N9zbm3N
 JvIzkqPZnWhaodceIgVs/RUs6xlCP9kPHn0+/Hve8BHpu8fW+NZ8VgrArEfJ6i5Qc0uJ
 Izmu/uW1xG3vvKYhX0MruKoNw3hXQsNvZofd/mUC1fcZQWLuuO5XUriFaXTy0b/otvzN
 fPqNx+ovL84oLrBFCoFP9PRuGngWyO/vjQ8Os4LRUnfDU/ewzzCqN05+kKXe/w9E3LKe
 7E4dEV1z1j4Gg5EvWNgCoO2WZv12njA1pFbrcTCYyUXWwcK/MYj8WXRKClXdhEch2/vZ
 ZoVg==
X-Gm-Message-State: AOAM53275r1v01V1qLRJ6TuaQtsDrrV+TZAduPY5tjCaG+1RR1wgniKi
 83EIVrX+AT0UcrkaBJL1fLPwVA==
X-Received: by 2002:a17:90a:a005:: with SMTP id
 q5mr3875889pjp.152.1599864390826; 
 Fri, 11 Sep 2020 15:46:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o17sm2623613pgb.46.2020.09.11.15.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 15:46:29 -0700 (PDT)
Subject: Re: [PATCH v5 5/7] hw/misc/mps2-fpgaio: Use the LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c21dff67-b771-30b2-339c-2f38795b2bc0@linaro.org>
Date: Fri, 11 Sep 2020 15:46:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I4ZFNvU5mumd

On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
> Per the 'ARM MPS2 and MPS2+ FPGA Prototyping Boards Technical
> Reference Manual' (100112_0200_07_en):
> 
>   2.1  Overview of the MPS2 and MPS2+ hardware
> 
>        The MPS2 and MPS2+ FPGA Prototyping Boards contain the
>        following components and interfaces:
> 
>        * User switches and user LEDs:
> 
>          - Two green LEDs and two push buttons that connect to
>            the FPGA.
>          - Eight green LEDs and one 8-way dip switch that connect
>            to the MCC.
> 
> Add the 2 LEDs connected to the FPGA.
> 
> This remplaces the 'mps2_fpgaio_leds' trace events by the generic
> 'led_set_intensity' event.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

