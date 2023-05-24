Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2405426ejb;
        Wed, 24 May 2023 01:52:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jVSqIBpIpuao2ztXyNY1JvAFbC636FYIW8gh2sWVdty4abWVcZTySZ2yf8wd7RNpbubXB
X-Received: by 2002:a05:622a:1893:b0:3f4:f3e0:ee84 with SMTP id v19-20020a05622a189300b003f4f3e0ee84mr27444393qtc.9.1684918342944;
        Wed, 24 May 2023 01:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684918342; cv=none;
        d=google.com; s=arc-20160816;
        b=0EoFyrZ2DsDxtYktEMfjeRzeg83Wxvl2/a++Rap5FJfZIdArEFU/UW0C/4PwiusDSL
         DHTG76//5ElQr/ZxNTT8AIAJZs6ICoMYiGPuW4AIMNsDCmX0iotw080QZZCOtOg/wYvo
         BV6V3P5FE725xKsD1CIwO1Ud1eMO276MyjVp28os0Eth0s2RkxygNiG3LfulDXk+zYdu
         tcfLUV8+Y+XsFF/VFL5125/3Nq8aMrelA0Bvktx2ziei4zSMxBlA2VPWxlL+10TGYMs2
         /douiA/+7QVreUjdu82zEeAoAUp6c3JhmowB/1dERkhX9jTzglbr/gr1++4+NQ23oRNM
         gFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=l8doqJFucJygx1DAUBs42oslGuibioM5nA5nbvNdNto=;
        b=qbayQfMDd6j9+ooG6NZQcwLAlLgTPLPC+xkm7FT10VPZuSJ0DbAFhbMcWV3E9RadI9
         Qpftv2jQJBvTIvEC7STlAeYoZgTOtuglZmEq9OP3JG0uRJ/mgfEsq8kohpJy48A8/jlc
         T7d+MmriPybu2GqBLgf3cCYQQNeHNhd8Zngd8Owz1BlXI8Y1h8Iuu9tDpQz2exKVS/1H
         dOcWB5Pm9gs17QWOcXgvECbiItZOLlBTjCw3GSaXZJaFCFcDPDu/B2THPOaUiQtL37CO
         nEw/FroWR/td++Mql2akirDpdlF1fvNHTGfZksStGHJ1C3yPetCMRLWXzwt28HTqKJqi
         Wdtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fzO8dOYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020ac85c09000000b003ef63934b9csi6542931qti.750.2023.05.24.01.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 01:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fzO8dOYi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1kE3-0006z0-38; Wed, 24 May 2023 04:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1kE1-0006xu-5f
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1kDs-0003XK-Bs
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684918315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8doqJFucJygx1DAUBs42oslGuibioM5nA5nbvNdNto=;
 b=fzO8dOYiYGpEAtl14YLglHa+52IRWwLRZ3E+JR7MIFWwEdd71gqMRkweD3iy/PGbILawE0
 NghD3zwawU16PYbke0LBCLPCTDMOkI7Xe5UsP1D/eKWCwI3A6slsWihRfyre06SrFc4Htc
 JIvC+bzEVwtxLPGp6ahd1UZhComUwYE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-nTBqqRSBOeCR43hHlCy4Hw-1; Wed, 24 May 2023 04:51:53 -0400
X-MC-Unique: nTBqqRSBOeCR43hHlCy4Hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f608ea691fso4229625e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 01:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684918312; x=1687510312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l8doqJFucJygx1DAUBs42oslGuibioM5nA5nbvNdNto=;
 b=ezLApY7LsJVCmG+929yYshYwkIl+269gy5+R15xQKHknsX7+RKM6/tg235JuLjKQwA
 /Df6UIrYP1h4PUt1gt/hhpuOfTsDonVXMM+2RsRgi8h/lf6p3m6ikZTSUCRueODEHB12
 8hs/9Ydlnl8/KP081Ocz2CeSXaasIAd/iLd1aU0ij9gStkaHFl4j+oYStR+anORwFRQ1
 1RiyV7Gw88xlhHhDDvxh8Z5p09sF6/1doQZNvwiwgB/uskLO8Eteyo0KRlrxPXDb0ER8
 vXw6RROwR5aS5gRUqnwmuhemif128vDE8QPt9StTggedTtRUw1tdVsWk6n+ThPqjYFUP
 anTg==
X-Gm-Message-State: AC+VfDx71Eg7l0AzbVd1shrO/pBm56MZv0CtctKhOgIkPFd95qFbECBo
 aSaxrLc14O6synRYv4jRKtyfFqXwVLpFElQiizieHGZyWOKx5gzwrLQoJhPtfthWEOnQuvSsdNE
 cLZ1nxpAddy5l
X-Received: by 2002:a05:600c:364b:b0:3f6:c7b:d3c8 with SMTP id
 y11-20020a05600c364b00b003f60c7bd3c8mr3580148wmq.16.1684918312781; 
 Wed, 24 May 2023 01:51:52 -0700 (PDT)
X-Received: by 2002:a05:600c:364b:b0:3f6:c7b:d3c8 with SMTP id
 y11-20020a05600c364b00b003f60c7bd3c8mr3580133wmq.16.1684918312541; 
 Wed, 24 May 2023 01:51:52 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 f4-20020a1cc904000000b003f423508c6bsm1525818wmb.44.2023.05.24.01.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 01:51:52 -0700 (PDT)
Message-ID: <f640fc7d-47b6-b833-16f6-14e29e09d433@redhat.com>
Date: Wed, 24 May 2023 10:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] hw/arm/sbsa-ref: honor "-vga none" argument
To: 20230524082037.1620952-1-thuth@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SoxKA33W/s3j

On 24/05/2023 10.39, Marcin Juszkiewicz wrote:
> In case someone wants to run without graphics card.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9c3e670ec6..c540b2f1ba 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -649,7 +649,9 @@ static void create_pcie(SBSAMachineState *sms)
>           }
>       }
>   
> -    pci_create_simple(pci->bus, -1, "bochs-display");
> +    if (vga_interface_type != VGA_NONE) {
> +        pci_create_simple(pci->bus, -1, "bochs-display");
> +    }
>   
>       create_smmu(sms, pci->bus);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

