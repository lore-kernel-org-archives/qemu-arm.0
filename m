Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp306725ejb;
        Thu, 16 Feb 2023 01:27:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8+yZmfz0lOT3trNDok3w6t4D72SYCEIvy1Itv33WZ8rkNAzy4WFcGFT/l3XHApG6jvN6D/
X-Received: by 2002:a05:622a:593:b0:3b9:b565:981e with SMTP id c19-20020a05622a059300b003b9b565981emr8037498qtb.4.1676539671804;
        Thu, 16 Feb 2023 01:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676539671; cv=none;
        d=google.com; s=arc-20160816;
        b=UPrWdMVDt7y8sAdBgIc11NX8axSDe/TsgWgH/HOscpCUP9/TKiFwNLxg1WgrjtqLfb
         Z61McowtbX/ktsMbB5FKihTZjeJnyqhzsetZwP1YLL0837PDB82SsToJC1t/OvGqkPNp
         zclOXmyLshJnfS4dWCwUzfdUb1eMi+U6Z4F63uBoD3HJamfUgMgMMq8j2L0/H01iRkKe
         yCn9tPG1xRkRVIvwBNaeHNorPTWf7j45vSAcwUHEOmqhQ3ZwkAnOixlkkuylOqFMYVnw
         jxBtq6/WZVv/R4GO54bR782cru7RitnNEAawZ2Oo2gf1royUROrORIdboRxNOB4AX047
         q3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J+sGyp8deuLpD1Y2Uxb6QwW81ICmNmKhGqhPAzq3KEY=;
        b=Yz/VA1NTIuwM9eHNVb7nkYzIGgru1Vy9uu745IEKTQOnT4z6Q47sBK28SMMt/ZXzei
         92xctkOnVlIvwmr0pK06L/5zl7mbZifNuy21lFmF/PnKLfkfRFFG9XDCfjWJcD9zYVl2
         Z3r/XF4APagSeJ2zLGwPrs3fyjnmCw6qnBqPUIzvcu7XfppbGPMfpod5106ctwfb/KAe
         hrPYg8c6+JHkMVCVhvNYLXlMrroCFgajZ4OHTbiFAmNZu+5SGW9Sg4bSd7Mc7STC0lzI
         eqWZ2tj/320h+xlUWbRieJDMS9orELsZ0yp1hUFK7dtcR9M7uNsfCmvp+rS6rWGQMyrc
         VE/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YsEqjYas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123-20020a370a81000000b0073b8de1ae2dsi1090153qkk.505.2023.02.16.01.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 01:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YsEqjYas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSaYG-0008QE-3b; Thu, 16 Feb 2023 04:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaYE-0008Q5-MV
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 04:27:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaYD-0007gt-3z
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 04:27:38 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r2so1180977wrv.7
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 01:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J+sGyp8deuLpD1Y2Uxb6QwW81ICmNmKhGqhPAzq3KEY=;
 b=YsEqjYasZfyb+X+vzmglICDpRPN0cE9tizq+5Hv0hgx6lfUD3d/Lva+oNyXCxtOQDb
 iHL9a3C/F3rehtkAP6dkqQIQYmdPUILK36Nx8Yg64bCfelPx8jD+mBQ7iZ9T/M12Hivs
 N23JdzbqeiChCUawwnlNZIn64dcSwZSDv6NDoS7whOxI4GcineieAnUEUVWHqCByDywq
 pYAWgzTl4feCeHal0hVno6K2boew4D0fKnJzv7t21nuGgFkEEH5jmYnwlA35QyELYja4
 38JvnDIUnjacNCEqtw6njdzS/JzGJFRRd628Ct6Gcahd5xiI6FzmGoVQ5BVQGLfF1nua
 mKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+sGyp8deuLpD1Y2Uxb6QwW81ICmNmKhGqhPAzq3KEY=;
 b=6Q3IGmQaO/ZfrYI+hfBDQy3iUDlRWCBikRraF3ldL44DoXf4Jt+ohxzhpPOZKoMczq
 jXUR8UrZQaaD77T0i/w7M7FuBzoYBpmG5QQBzSEgZLBwkHOtcupoPP7XqBV1Eo0tG2rg
 eqwhD4CF43mMhs6Vv4hYdbwQypXW7orTwugoy5sJzJs2uCve57WI/LqMGTVaxZHC+Oob
 Do3RIIoRGYcqi85PFcqTfSj0S4d6HGee+T2fNdS3iKeZaijppACHcquLQY2wqoz+1mZ5
 qKn+yStazFniHag4ZH4ttoz5J2a76ZqrsVFpeiYkoOqNkBu4a20EfuBoTCN+gAxTA9sH
 PfRQ==
X-Gm-Message-State: AO0yUKUCi0yygwdKP4rEm7vhAnSSO4kgQmh35rIm01NVZTAP+vb//M5G
 GAAbJE1LJ4SOyTZ0EmJRaVsAJw==
X-Received: by 2002:a5d:4b06:0:b0:2c5:4b93:ee44 with SMTP id
 v6-20020a5d4b06000000b002c54b93ee44mr3862754wrq.60.1676539655240; 
 Thu, 16 Feb 2023 01:27:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm1010978wru.42.2023.02.16.01.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 01:27:34 -0800 (PST)
Message-ID: <4175aa01-03fc-94b9-dd7d-3e0268a92b55@linaro.org>
Date: Thu, 16 Feb 2023 10:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
Content-Language: en-US
To: qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@amd.com>
Cc: qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20230216092327.2203-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216092327.2203-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-TUID: XXZb8vYvrnAa

Oops I meant this as subject:
"hw/arm: Add missing XLNX_ZYNQMP_ARM -> USB_DWC3 Kconfig dependency"

On 16/2/23 10:23, Philippe Mathieu-Daudé wrote:
> Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
> a QEMU configured using --without-default-devices, we get:
> 
>    $ qemu-system-aarch64 -M xlnx-zcu102
>    qemu-system-aarch64: missing object type 'usb_dwc3'
>    Abort trap: 6
> 
> Fix by adding the missing Kconfig dependency.
> 
> Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..b5aed4aff5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -389,6 +389,7 @@ config XLNX_ZYNQMP_ARM
>       select XLNX_CSU_DMA
>       select XLNX_ZYNQMP
>       select XLNX_ZDMA
> +    select USB_DWC3
>   
>   config XLNX_VERSAL
>       bool

