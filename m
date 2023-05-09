Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2769620ejq;
        Tue, 9 May 2023 07:40:39 -0700 (PDT)
X-Received: by 2002:a5d:4004:0:b0:306:475d:92ff with SMTP id n4-20020a5d4004000000b00306475d92ffmr9979934wrp.3.1683643238865;
        Tue, 09 May 2023 07:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683643238; cv=none;
        d=google.com; s=arc-20160816;
        b=YhGqEIR5a8c6d2G4NERTVcQj+7wuqk8xzjSN3MHHecW5KlGQLFMuO2ipxfeyt0y3dd
         Z0SRcxb/Ad6hKd+f2LaxCtpCWFUY077bOFficXPAddmxba7YyERCK8g2p5eirL2Wx1BW
         6CQFUuQjsM22fJD4rE6M+EDZZLwfvv2Gbwx453V9INkDEOY+NUaW7QMANEFEfo4o4MIN
         FfZ8dkhpaMAE1OZWwBu+8AT5Vf8wyUAMPeJ9EWRQka/M5fE4TE0rh5OjCvaOaejbnUsi
         hW6wfYOuMrZjIpvXhIshm/Tl5am7cZw5HMa7D/BtzNuT0tPc7s8czrAtTFiXMd8T65vn
         tevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vCvRusGfcWdrz96aV7B9WcqfyYwNN+N/9pd6x/tT/xE=;
        b=j5aC2SdMbnktwK2syywZ9GDkmMQ7lV+YFdVOHbLwdXUnomu1Ss32jG1eAyh2iS/Kdp
         QQTOQ9vSI35dAGeohQxpO5stEQEe54M2Ifbz5jn+Ik1U2p4iHw1d4YsFmdfpMI+cbvRl
         5huAY9kV4bejeq0EdEhPpvASZ+hB8OszpUg3WFVAcC8lqRPhkWxJbJKT4EcVm0mmjfUv
         7c6nr51NnYXe+yE5cTdSLLQt9BCXpqfFs4pjk8TmSg/pkHKUphNDcMSjcctjrXCCM2dB
         wnMqZSo6A6l9Tt0uwPDVrNKuTYHiqvFpkcWT0C7x4D4Lz26EdUFYlNerzfqHXDAojBIK
         3tiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/RvIxdc";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i3-20020adfa503000000b0030628302489sor3150848wrb.7.2023.05.09.07.40.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 07:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/RvIxdc";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683643238; x=1686235238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCvRusGfcWdrz96aV7B9WcqfyYwNN+N/9pd6x/tT/xE=;
        b=G/RvIxdcTSu/WB8gzqxA3LTifn5D42XRVVpbFebPinGxiGjX5ANxD+v12xVNN7Z8Mi
         3LmekJ9sSpAiK6eZJRQnoWkP3nImJJnpkdk8V0OU40J3n5OWP6De4TBJBPAi6CiDe5Jy
         noZUcdmWQL6engtpyfEKIQ5EbSjFbDkFENa2es1nhBEftdxm3P+nVuUcfLaV1vk7uvPx
         PB/x6lI2kL5Xtg8gaZtDcuCCKNZAVwALyS2Kef5GF9m1j9wl8spCvJIVA0Ola2mUeZHU
         LvbPJjLoxDaCodAzzRbOuDzYBX+8ytIBCLV3T5qyzQKfkfT3D4NGVsrNrNKg8W5GiWh2
         DlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683643238; x=1686235238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCvRusGfcWdrz96aV7B9WcqfyYwNN+N/9pd6x/tT/xE=;
        b=U2oQgXZqAPC8ozbksO+Osa4cExZQjDOUsb+wm0XPQ+YocC239/ScF+UdNtHlNstXut
         +hYq61iRsUyQcvpsANC2msx8bkfWPIaMB6dSMwQ5wLBwfjTDV15LuBrf3cgG6oApNG8r
         AAWyuydWuiQ0r/JKuopRe+mGKsGa5fT+HygaEtTjO+pplLCq0Rmb65NWGTOSDU0OC+oq
         D90RzSAessZLtSlmwhND2wUpQuvmiiVRgVrsh06lwR4WW98hwxcTbFBY/QL43J0ggE1V
         t0Uulq2p14Qmb7LmHH+QyfPa0FpdbMa0TNPEvvWBE7Y17HF2y79Rml7t4QVxTG1TnEr1
         ie4Q==
X-Gm-Message-State: AC+VfDy4bp0ajkYlzdBVzN2/RWHE7Jvg1Ojte69TFO5S9+fts0DvfW9t
	4u6fjPtFxzL/TYY4jdc1RYMr4+Ht
X-Google-Smtp-Source: ACHHUZ54nhTBKiY0pKdSAQILSqyS/76klJMztLlj9TMdFufaReiRCcjH5IZSqZoJ5d1sTusCmGe2XA==
X-Received: by 2002:a05:6000:d2:b0:306:3afd:ed8f with SMTP id q18-20020a05600000d200b003063afded8fmr9389943wrx.25.1683643238476;
        Tue, 09 May 2023 07:40:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.11.23] ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a15-20020adff7cf000000b002f6176cc6desm14614071wrq.110.2023.05.09.07.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 07:40:38 -0700 (PDT)
Message-ID: <44d12192-6083-1064-1871-8e8ca6c76034@linaro.org>
Date: Tue, 9 May 2023 15:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is
 enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-3-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508181611.2621-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 305osTd8cFYZ

On 5/8/23 19:16, Fabiano Rosas wrote:
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
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
