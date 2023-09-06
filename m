Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2492760ejb;
        Tue, 5 Sep 2023 21:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiOkRWdBuuulW24VUIW3GMqeELIG3Gadar/PBSbsgpAbTJAkRc7dgNaOh+N02cf0MbR+In
X-Received: by 2002:a05:620a:220a:b0:76e:f496:1928 with SMTP id m10-20020a05620a220a00b0076ef4961928mr10734340qkh.72.1693975905379;
        Tue, 05 Sep 2023 21:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693975905; cv=none;
        d=google.com; s=arc-20160816;
        b=x++bIY951sOZQIJGBpv0+7UjdheO/j+ItHgERaGhuZxr/9NgIg5SkXm4rTbROd8O1x
         UZc+3UlqWiRae9nFr8whfsnKmtoxnlVVjb+Na0JP015RX4AjwABqY7xv/p6+GQdFYJ/H
         NjYF0Wrunjxh2LYipLVDug8EHbUF4uH+++apF+MNiijw218j2VR140eGzEppNMWexEQS
         WAX0iTrlOn6GVdV0qNMpD8zC6iLuWuPOH8cWmcO4AYN35TyWKp9BwaljsLKBh8fq3GOW
         lSfK8qKLpHdLcMxhtau+DE/gAiVbrqKnLBzRb1+pZlhZ9ye/buZbaMm0/Qa8g050vAM/
         IPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GJF3UY/JuLIz2OU5+2WU5a/vhYsEmegpdXsjok268SM=;
        fh=iCc4Oq+t5Jnw8MmOQkc1W79MvPt3+IQGaaYWogkRS0c=;
        b=KmmQohqFLZ2QkLzUKINhGUqdwftpsRd6Y1kCq8CEo9nYFs97yRVsQ/fTC53WN74/g4
         2coH+unbXBESQNFlcgy+s6MfJjzb9TYJvFpEGo0LEuD+sbbeSXwMtGdhkdf7NRgLiWNp
         02+Dr44x4phNhg1GXR6L8trH9MdBFrihusSJUBqTHaFf7D5RXG9IcP0AFjs9VsZLEwqf
         ofxjsJZWRvFhEOEWfkk+BFu1pRo40oe4OB/Fnul4K2Jdr9zWbe377LlhKCaDrR3cImdT
         9Y1gYaHcQ7B51FBv+VrsYeWdwjfk8LLsdiSeWW0Y8omncAu5aolIok03piSju7LSu/aY
         kNJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lQZLT265;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05620a280900b0076546589998si9823740qkp.347.2023.09.05.21.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 21:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lQZLT265;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdkVS-0001xf-Mi; Wed, 06 Sep 2023 00:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdkVQ-0001wg-Kh
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 00:51:08 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdkVM-000627-68
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 00:51:08 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c93638322so112236166b.1
 for <qemu-arm@nongnu.org>; Tue, 05 Sep 2023 21:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693975862; x=1694580662; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GJF3UY/JuLIz2OU5+2WU5a/vhYsEmegpdXsjok268SM=;
 b=lQZLT265k72onWqi/RSk8rZZnB3sMcl3mcUoEq6xWGDuQRkN8Ajqh2s+p9JM5vF29o
 Cljh/IY2mV6ynalZQ6rnxOFeAmMbcUfZtStLIPoXt7z0CPD8uwShSJ4DXX0gnFVo66RU
 E0POPPdDHnElCl45OOF+nhfzYE0/91Npu6o1BEjMqOhYrLB6OPsGTTDYI2npSaxbyoYz
 iJP9cCcwtSg6l8qkJ4ffCzSgPV1iYywjg39FsD2671vzlXi4crqhVcC33DSW4+JsAGn+
 kK0oUYeAo7QVRedEsamxav+h3Q3vqZklE/XyMr2dK3X5jgvPMIbLVyCyxJrT125NNVrD
 VoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693975862; x=1694580662;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GJF3UY/JuLIz2OU5+2WU5a/vhYsEmegpdXsjok268SM=;
 b=X+XCc2ZadD53KDEixu/2XfQCuZKRg0H04f2IdBVs+Vvj60Yjktz4NwH9/6NFpzJPxP
 ia0uLsAcz51uNDqwNgO/tneB2R7Lu+qhwYSVMhs4W/j7SUtNysR+1VjRcJ98+6aiLyBP
 TolFMjiVM941Xpk5ZA/Zxosf5TFIyupXouS8AdKwrFdZNktadTPelrlyOEb+Bi+guoIf
 krkrUwp/F7KPHMCpocKDLmjvuOkoxfcUZQifDm8nBSiLRcRMjH2MUzVcbY5zVpx6RyNw
 MZWWvOfKZpvpa2+q1dgVrE1fQBgn/opr9CO/8nsrUolUYDbCVzWgyPvK4Kfw5imH3gxi
 1bIg==
X-Gm-Message-State: AOJu0YxYF4Gd6zcPQINuZO9YeyqAaOnaO3NDGsKCQZAK5nrn7VEHS0MG
 fPVuI60gTrp2/TdiaWNo2E+3pA==
X-Received: by 2002:a17:907:97c6:b0:9a5:962c:cb6c with SMTP id
 js6-20020a17090797c600b009a5962ccb6cmr1849581ejc.31.1693975861712; 
 Tue, 05 Sep 2023 21:51:01 -0700 (PDT)
Received: from [192.168.69.115] (cou50-h01-176-172-51-223.dsl.sta.abo.bbox.fr.
 [176.172.51.223]) by smtp.gmail.com with ESMTPSA id
 d19-20020a1709067f1300b0098748422178sm8402417ejr.56.2023.09.05.21.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 21:51:00 -0700 (PDT)
Message-ID: <8539de89-6a8b-ebac-a82c-2d09ae58202c@linaro.org>
Date: Wed, 6 Sep 2023 06:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [RFC Patch 1/5] hw/display: Allwinner A10 HDMI controller
 emulation
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230905201425.118918-1-strahinja.p.jankovic@gmail.com>
 <20230905201425.118918-2-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230905201425.118918-2-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: TNgf73t5k1GR

Hi Strahinja,

On 5/9/23 22:14, Strahinja Jankovic wrote:
> This patch adds basic Allwinner A10 HDMI controller support.
> Emulated HDMI component will always show that a display is connected and
> provide default EDID info.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   hw/arm/allwinner-a10.c                  |   7 +
>   hw/display/allwinner-a10-hdmi.c         | 214 ++++++++++++++++++++++++
>   hw/display/meson.build                  |   2 +
>   hw/display/trace-events                 |   4 +
>   include/hw/arm/allwinner-a10.h          |   2 +
>   include/hw/display/allwinner-a10-hdmi.h |  69 ++++++++
>   6 files changed, 298 insertions(+)
>   create mode 100644 hw/display/allwinner-a10-hdmi.c
>   create mode 100644 include/hw/display/allwinner-a10-hdmi.h


> diff --git a/hw/display/allwinner-a10-hdmi.c b/hw/display/allwinner-a10-hdmi.c
> new file mode 100644
> index 0000000000..0f046e3cc7
> --- /dev/null
> +++ b/hw/display/allwinner-a10-hdmi.c


> +#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
> +
> +static uint64_t allwinner_a10_hdmi_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    AwA10HdmiState *s = AW_A10_HDMI(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +    uint32_t val = s->regs[idx];
> +
> +    switch (offset) {
> +    case REG_HPD:
> +        val = FIELD_HPD_HOTPLUG_DET_HIGH;
> +        break;


> +}
> +
> +static void allwinner_a10_hdmi_write(void *opaque, hwaddr offset,
> +                                   uint64_t val, unsigned size)
> +{
> +    AwA10HdmiState *s = AW_A10_HDMI(opaque);
> +    const uint32_t idx = REG_INDEX(offset);
> +
> +    switch (offset) {
> +    case REG_DDC_CTRL:
> +        if (val & FIELD_DDC_CTRL_SW_RST) {
> +            val &= ~FIELD_DDC_CTRL_SW_RST;
> +        }


> +    s->regs[idx] = (uint32_t) val;
> +}
> +
> +static const MemoryRegionOps allwinner_a10_hdmi_ops = {
> +    .read = allwinner_a10_hdmi_read,
> +    .write = allwinner_a10_hdmi_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 1,

Per REG_INDEX() you have .impl.min/max = 4.

Otherwise your patch LGTM :)

> +};

