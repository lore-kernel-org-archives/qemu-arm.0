Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2334177dye;
        Mon, 30 Jun 2025 01:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEdrIq0As2jrmRDSJkaDCb1dFb0ibgZmb5/QrDZCcdylRffI17tiM9syax2ODDlKR9sptkC3Lklig0kA==@linaro.org
X-Google-Smtp-Source: AGHT+IH6i5cgYxMpGWjYzmor0RWTPfegX7wivLJxDLKPfJ80jmfjWbxlqOdBZYViRCNRC7t5xmeT
X-Received: by 2002:a05:6214:268e:b0:6fa:fb4f:b582 with SMTP id 6a1803df08f44-6ffed7a4732mr166462876d6.6.1751273929372;
        Mon, 30 Jun 2025 01:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751273929; cv=none;
        d=google.com; s=arc-20240605;
        b=HRF17ZYsVN9BgCL0ZD+NI7VI5ImjrmhK7FPd3GfjwFkn3WvFmlnv/cV1Zh7e33dI2f
         9lazutzO51i8OYVkBJuZY6T5E2vtXw2vV7NeuRq7h8snnv+ED1OgFeH6w5iqdxVwFpMF
         hBIiSsGfv0KfGuimhhTG6n/cBBpbAnNSN0x+2mzOd/zgEIMQs6Aj9bCtTmE5Tt5wKCRY
         6LLmluFa8ojoribVyF+Cd436wUeWa8La4lkrqBgaHCotAYBpZ2zrmPEkmWpcwhFx/h70
         IC8jKc1/G3EK+OMka3Dh8mjmhmwPZ2B8P7ELjvw9p3SF3ZyCfIIfcPPitLxV2+FLnVXz
         vcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oHWetuynf3dOSfzPJHS+bo/GlNX8xbsdHnA7jAMx9Fo=;
        fh=HicLOWjTYFGm/w59SVfx2YKtfVEQCZnsJyTEaxhmonI=;
        b=JO3b6Sv52V18TB6TXmI4sBkbmvjXtgEaUBN5XR3IBhb/lfi1RMKrKCrGDexgiP2+KA
         RgsNsa9uTYLGIFaQc8Vhr1eXZqRqWgNIRik84h8dwWwL8TqZXh0aIh3MX5QDVGut2kKv
         cu6UG/mdR7pdJHoy8KUaMxqHdrakyrlavo3zBICD2pOycAO1r9L3/yNhTpOd67hwsv0K
         97O86x2gUQO0pVNFseYY2ih3o5yQGEh5KOzhxYJYVSxlxC+cIBWdvXBqBVQ/WUg1cAU8
         jDhvPbPmrc0lPCdPxwIkTDUoeVcBeUSjEhGGomfWfPUoDAtG9FyWbk8e5QecYs8Sd791
         sfSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXoz9v9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44327c839si752208085a.481.2025.06.30.01.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 01:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXoz9v9u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWALQ-00066T-4r; Mon, 30 Jun 2025 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWALM-00065l-UV
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 04:58:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWALK-0006Xa-W5
 for qemu-arm@nongnu.org; Mon, 30 Jun 2025 04:58:28 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4537fdec33bso10924035e9.1
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 01:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751273904; x=1751878704; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oHWetuynf3dOSfzPJHS+bo/GlNX8xbsdHnA7jAMx9Fo=;
 b=gXoz9v9uWzBjpYZ6XHcxUZ4aqslm9ppU1/1oNKK4NqUyFlRJc4POFg7c9l3xluj272
 2IrJSojTV2N/IPeHGQ1G1F/dSqdwLngMaO0C5GfMVquHvV6Nz6T3oRXxZmS9chCotIc1
 Vxl+TdKdLO0zhF846uW7W/VikaA2Q6BMnmPf6SaPlA1o97/LZFv/ZXWPo/Cb68yb/y1E
 lkTt2+DT0m7c7vNIb4DR3mAuLBKbDMHlMeAWr2JQw4fAASf+Bgutr2dZSGAzzXoZfmnL
 mkrGeyqwM6TSjM+2xtOXXu62gH5eVBnmaye7BPIHk7hqwg96OO+jE3ktoko6HXeoqESk
 coXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751273904; x=1751878704;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oHWetuynf3dOSfzPJHS+bo/GlNX8xbsdHnA7jAMx9Fo=;
 b=tn3z1bt39vSuzx6KOJvDy9g545X6qbbJagWyaPlRbS0EX5BVaL4WRt4Et+dVL1Fg9a
 xD5zc1Ln3gt3BA9zs/8pXJgVEk4FIPc3VsuLQrI06MgD3FMpfIIyocMd/wsZQ7j3FTpD
 tDXIQEGOtOPUpl+U5/MhslZLlQIZMbXx4qDFiWDaExMco/TJcw0OYzWPGiSaC/LoZWXq
 PFlDf5p5KFciYwWdAkgeJpNPVERC6C9g7EbLMI+wJp5KXzoxTHGLCaZjHwKd21VJQDsB
 HYi4vkvr96OxVKLfR4lJ0x+D9Oylmatrbf24AwCqtVXVoja0an25s94SZrhRGcrEmITW
 9wBg==
X-Gm-Message-State: AOJu0YwNySf5pzCRf2TIH73eFfnokqJzZkhR98RvTPyrradZk37C9qqu
 fTUMEikJnv655BoiCMMJ6B6PWBEBgIFx+w2+a9rCkUP9aGg4ttjzfsZvG3qRH53jMmznNHa1KP8
 ULtw7
X-Gm-Gg: ASbGncuO9XfGEpUyU6/Y5Mv4pH34lED82Uyp75PsTc1qMKC3TQ1GbcyUUJryh3OYUcS
 perVzQe6NyocVethoAuQmLTGQHEfQGp9lTbfdaX61puRnXFgW/ZkU/+CspIh3V8/x/pFVLjns2+
 ihoHNrzOev+IfVm2ydBwLpeCgSD8oXamQEs425RTBdGQyuSgPyk+GUzLuhCEukRZs0ZOZ6ZYWLO
 eRj88bFl/yNP7u8JIF14ZO78ir2RAmm1zYQHze1IzjV9IfvIUEUsD8ALfToyLDscG6EdXA1iuiL
 vXB/5nhxEz7ap5LaMj5C5YBnvHp/OLjQdr/s3JDehVqLW+lN1rKItV4UE1kXulTAFwx1bBw+/ob
 xXxouOY9ZP/vXupiw5QPp+tKp5pIyBQ==
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id
 ffacd0b85a97d-3a8fe4bd16fmr7344603f8f.40.1751273904251; 
 Mon, 30 Jun 2025 01:58:24 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3b3213sm126914845e9.18.2025.06.30.01.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:58:23 -0700 (PDT)
Message-ID: <44960792-ac07-4b93-af85-643f2f438798@linaro.org>
Date: Mon, 30 Jun 2025 10:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/imx8mp-evk: Add KVM support
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250629204851.1778-1-shentey@gmail.com>
 <20250629204851.1778-3-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250629204851.1778-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: P3ItQjZ+IIqt

Hi,

On 29/6/25 22:48, Bernhard Beschow wrote:
> Allows the imx8mp-evk machine to be run with KVM acceleration as a guest.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   docs/system/arm/imx8mp-evk.rst |  7 +++++++
>   hw/arm/fsl-imx8mp.c            | 33 ++++++++++++++++++++++++++++-----
>   hw/arm/imx8mp-evk.c            | 11 +++++++++++
>   hw/arm/Kconfig                 |  3 ++-
>   hw/arm/meson.build             |  2 +-
>   5 files changed, 49 insertions(+), 7 deletions(-)


> diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> index b3082fa60d..30eb57318d 100644
> --- a/hw/arm/imx8mp-evk.c
> +++ b/hw/arm/imx8mp-evk.c
> @@ -95,9 +95,20 @@ static void imx8mp_evk_init(MachineState *machine)
>   
>   static void imx8mp_evk_machine_init(MachineClass *mc)
>   {
> +    static const char *const valid_cpu_types[] = {
> +        ARM_CPU_TYPE_NAME("cortex-a53"),
> +#ifdef CONFIG_KVM
> +        ARM_CPU_TYPE_NAME("host"),

IMO 'host' should be kept for 'virt' machines where we want the cpu
type with the maximum features possible.

For this case where a real SoC is virtualized with KVM, I'd keep the
SoC CPU type. If the host misses Cortex-A53 features, KVM will fail,
otherwise it will disable the extra features and only expose a A53
to the guest.

> +#endif /* CONFIG_KVM */
> +        NULL
> +    };

