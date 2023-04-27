Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp275945ejm;
        Thu, 27 Apr 2023 02:39:44 -0700 (PDT)
X-Received: by 2002:a17:907:96ac:b0:94e:8559:b5c5 with SMTP id hd44-20020a17090796ac00b0094e8559b5c5mr1295679ejc.64.1682588384281;
        Thu, 27 Apr 2023 02:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682588384; cv=none;
        d=google.com; s=arc-20160816;
        b=hu/MFoOGiuaP9EDgX+qFDN1hklMsX0g4+P83j/1LOq9IemOxkzJ6tDBnHrfgEcz9if
         sCR9kfgVEDYlGU3o/ccZ+4ixddToaNqXBSH/twILBDXIUZlZ5luPcC7qaJIEsSkL/Cgy
         1+IZrHc81XEqyhL/NYuhVm7xJzP4Tqm0v4CV29Yh/s2h5U2oDuxPlxK3PxJ3Ba7TlUKz
         hzOnTxmDm8YezDcd9sqaM/J0BrIBRWfUWAoMivq4E2rnuAkV7rca3rRyrzX2qow0tQzP
         sli4eM+b/XNaevuelNydWXfEPpjtsr9wz3tOUX2O2d7pfOPoUdQhxWi9HzpPjBnnDgI+
         JpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XiBinv7Jr1ux3djsnJZq8dnDxnySf1F2dAjdhyiKtJw=;
        b=K4F78ENZlnQDQLZJvPe/O1wTNuQZe0bbfcb2nnIiXWSsXRwUflRm4AgGWW8BcduDo2
         dShCEEv9jErkTL9iZRjpM0VKjFgBl6eqfR5SVBA0KIKGdkEn+o8QzKO8Rrzp87d+rrpP
         kRwJnETVt2/izJ7ZrJHj3orkOTpK++I4wYUP2LUelz5nmzZdmq0cvwa4ahtC8geFNBdL
         sg3fi7iDX3hTvOwsdUFis2a3/qS3wUrRn99TnWNeWpUbMdm8nRI3FisRkY9uDAadP0s3
         SmlDiHW6ewBTtAA2f9KTg6FoJqjS7QyqXLtwkBlaqmFg3zRWeptR8LhcXmo59Tu4H5NZ
         8ISg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wz3KZKQv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c19-20020a170906925300b0094b36094f28sor9460322ejx.4.2023.04.27.02.39.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Apr 2023 02:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wz3KZKQv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682588384; x=1685180384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XiBinv7Jr1ux3djsnJZq8dnDxnySf1F2dAjdhyiKtJw=;
        b=Wz3KZKQvtWPQyRCL1LGlnZ//56GQkIFxtVgVJFtRZh2nfnUxgE1OdcYUVTersgkYc4
         o6p+mkEealMuHAe0pBVzwxg7Qs0qbjwcPOJQUGIZr15kXjdsgfdRM8bJ5e3u6ClO1zHk
         vP7XJZuTXvjcA5jhadQJWQIjvuMRI7Ma+xKHvhTGlfNNv9oOwNcASt5h8wN8SkjR6klf
         WISh8Gey5K9dfRaT5Y7UUUsfOwpxDNKVN3jjdFCwJyVvUkkJDezA4j+1VpCqLf/6+/fT
         MpqatX8sorQ0hvPG/CFg5ojO8MWDgVpePU3Q2dQBFg3qCMOO5zdHroBy7l9TDfZs7kqC
         ET4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588384; x=1685180384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XiBinv7Jr1ux3djsnJZq8dnDxnySf1F2dAjdhyiKtJw=;
        b=SRvbuvAU+I4bSscgC4vvqUzHIfFFfUb9E/L0dZ900P1tLCNCjlTS1ApFfcb2AAy8Zx
         pU6IkPcQsBcDSAgivFkCFX9NwlY5wWdeTnjCWch63y7jPMc2RkZs94zSBiHRBcPu43+l
         P1070zd0U3UBzAI9p5TlWrNl3tGuDbQsyHpYaaIxPZn8Iogn64JEsMKYObO+3uokknPZ
         WcvBNu2BQ+hIn8rHcoTbNGITcf5en9onw210hUG5NZf6LY60XzvJDvT5ez8CydskBaKP
         5DL3XtJbqqkkNmtRaEshDxqgYTDqzbGXsZz8PmBq+sNv2kDGscwcv3KXmmmWcYa/wDZg
         JDpA==
X-Gm-Message-State: AC+VfDxzVUOSiSG9HTZPiQ7v4WSX3/2ij2SXnu9GM/rOtMgP/L+UVlNd
	WT2pz2/qGzoorO+4qACeItz4uIhR
X-Google-Smtp-Source: ACHHUZ6u5I+67KOYjsNlDa2RNo5Rf5h9GjyV0d+S59hNK8jVIfw4nTBntZuWiBeW47OTBDJqwbxJQA==
X-Received: by 2002:a17:907:3faa:b0:94f:6d10:ad9f with SMTP id hr42-20020a1709073faa00b0094f6d10ad9fmr1260181ejc.42.1682588383956;
        Thu, 27 Apr 2023 02:39:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.23.3.19] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090694d500b0094efe88a037sm9367304ejy.9.2023.04.27.02.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:39:43 -0700 (PDT)
Message-ID: <c2853e95-2aec-246a-5846-d91d40329c61@linaro.org>
Date: Thu, 27 Apr 2023 10:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WqZhDDiMffZn

On 4/26/23 19:00, Fabiano Rosas wrote:
> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
> query-cpu-model-expansion test to check against the cortex-a7, which
> is already under CONFIG_TCG. That allows the next patch to contain
> only code movement.
> 
> While here add comments clarifying what we're testing.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Suggested-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

I don't see why you're changing the cpu model here.
Neither cpu will work, of course, but why change?


r~
