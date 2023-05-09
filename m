Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2774824ejq;
        Tue, 9 May 2023 07:49:27 -0700 (PDT)
X-Received: by 2002:adf:ee84:0:b0:306:3261:809 with SMTP id b4-20020adfee84000000b0030632610809mr10000323wro.50.1683643767199;
        Tue, 09 May 2023 07:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683643767; cv=none;
        d=google.com; s=arc-20160816;
        b=VJY9F5iHban/zwevVEVP2eBXXhhEeh6kymnEK4i0/wLqfmxBZvQkaazNmQldPz5iDO
         oSJBHSkwGkUW2japZMewkQq8srEGko48nGGFAeVpt83sl6GCP4a8npw3bz7Ui0b59Uwf
         QMhSmwuDJ4CCLV3rYQbsWzgJpwTO+QhjsuQXvOsZox98GJlg99yR/nAvXlgMzjsVAQG4
         bKILphamVcHkKzjonOzAAIPQaO4ZTEgC7/xsO9z9Wx/yz/bMQlOjdEtB5b14qL0dZ3s+
         fwefB068goEfcCGToH6Z2ewolFuyX1K5H+UM6I77w/M/QgLZ7S66eGXpAzkD8iTKFEc7
         wDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dK5ac7kkFz/UOnHQVKeOY33TI5jVnA/U63q0XWmNm/0=;
        b=KI91VvrSEGjElcuYI0mzBGSuxvGtqajzjnSlnq3y9snw7T7FsGExJS+e2VraJCdfaX
         vKpS32BozwL9HSlFUv8vcHoZ/e6o3ArYQjVreOtv2GqpXKiy3AJ4/+oH9bGJ5GBo7QO9
         APGGmDD36/Hv8mnmDpWSWyh7a0Lajq8oAA5dPNwqokim9nm0ixti8nEE/CIUM4j4WASB
         ObgbwcLgAvL92KQy2OFC6QhU2zGutUsvFmK35d01043B2ZdzJ+dlxmXmxnJ0Tj+/yAmu
         4zW3CTutvtWkqO+jAJyP9d4pQBMPQjfptjb89fINLicFUu6WSJz6+skfao6H6DRDk2nr
         xAVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvZ99HMM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f1-20020adfb601000000b003062e68a54esor3361349wre.6.2023.05.09.07.49.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 07:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IvZ99HMM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683643767; x=1686235767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dK5ac7kkFz/UOnHQVKeOY33TI5jVnA/U63q0XWmNm/0=;
        b=IvZ99HMMiYUa/XaTYS4SLk3GgO03yCxVLzgmrGXrFA6fTOvB3uL3bAXjukr6eJER9r
         j2zG5vb78pnAHvvxlLoowtUYgowhxc0eJqhhZDsvilfPg/xyKkemZjnUV74wOu4Y3dKK
         IvLpgvEKURhHRh8XBzY2zSTapvxn6dXLMDPSZwgY14UIlok89lokE7gr6kAnlgUcfdRh
         TW9QNvLTuj3u+2xtP8OANkzGn7d3zjk9dbeQTAV06GfeBxpcO1n1Zrvn+dU9fjVADZXf
         uOS0WvhclfcIxohUB2CHr5UkYS76tDIAp8vAkbOnSgu3M+PP//jFCyt46n2YwCdlMnFs
         AqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683643767; x=1686235767;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dK5ac7kkFz/UOnHQVKeOY33TI5jVnA/U63q0XWmNm/0=;
        b=U+a5h1Ui7OVZDgs6du7hAtgIvpWJ761hyslAnZFWW2+f02HWr8/b+r9j6/WmLHwNHv
         gll9NfUAsUDrYbAo9KGdi2e09LLdOCR487X6++UK0V9XYYZ4zPYvZQ3NCFyvKAdr04bH
         YS8IOEUrIp/v83mubuYrpkjOz/Rsqczjn/IboFfKJnRW36kNvrmi2455lNW0pA+QmblX
         DOgcR8x3Y55a5VkT44pIsmog0zd0RKD8ZvXnJq5Qlgjkc6vZOcGyiFSlSAadaAisNlQc
         Rjn8R2vaeyzIOtU5EFNgMbm/y7znagLP2p9ExqzBAq9SnjZdJShGkMkl6chNyWCsf2C8
         yX6g==
X-Gm-Message-State: AC+VfDx/xCEmco58k7jnVNRfkyvFeaqUL8WD7+iISYNSDudm4shpaEX8
	3LSel7ZGNfd11XdGb4+BBf1FSMav
X-Google-Smtp-Source: ACHHUZ4Hes/u25N4RLNIHrCBYePMNuD3TeiE2hG2eAY7ofEONI9ljNVQjRGZlhibduouIgQnjPIMLg==
X-Received: by 2002:a5d:678d:0:b0:307:95d1:d7d0 with SMTP id v13-20020a5d678d000000b0030795d1d7d0mr5118601wru.39.1683643766875;
        Tue, 09 May 2023 07:49:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.211.62])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm10806359wrp.114.2023.05.09.07.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 07:49:26 -0700 (PDT)
Message-ID: <d51de29f-a23f-be79-049a-f15df2be7ac6@linaro.org>
Date: Tue, 9 May 2023 16:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is
 enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-3-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508181611.2621-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YiK2hyVFqYNZ

On 8/5/23 20:16, Fabiano Rosas wrote:
> We cannot allow this config to be disabled at the moment as not all of
> the relevant code is protected by it.
> 
> Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
> KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
> is now possible that nothing selects ARM_V7M (e.g. when doing a
> --without-default-devices build).
> 
> Return the CONFIG_ARM_V7M entry to a state where it is always selected
> whenever TCG is available.
> 
> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 3fffdcb61b..5947366f6e 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -1,6 +1,7 @@
>   config ARM
>       bool
>       select ARM_COMPATIBLE_SEMIHOSTING if TCG
> +    select ARM_V7M if TCG

Probably worth a comment mentioning this is temporarily
required until <some magic happens>, so we won't forgot
to remove it.

>   
>   config AARCH64
>       bool
