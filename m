Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp391781ejc;
        Wed, 18 Jan 2023 02:47:42 -0800 (PST)
X-Received: by 2002:a05:600c:1c1a:b0:3da:fbd2:a324 with SMTP id j26-20020a05600c1c1a00b003dafbd2a324mr6153962wms.36.1674038862157;
        Wed, 18 Jan 2023 02:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674038862; cv=none;
        d=google.com; s=arc-20160816;
        b=zcC0e6nKiumxxADAZmX1+EL70vsT5S7Fn36E52IqrvJA6jeACcjTFsNhIik9ahzmkS
         BCGFmPP1+BGgK+sxFUSJecx8v4SXo+MRyRrfEzFQXkJDKou9mcUFzxIy1czdfVmDAUO1
         95Y5aF9o/6iSLDx+FectNDs81u4e9PtzZoujd/7gtSff/XawFobTpN/T7uu7FHWegf13
         HFS4c/FgdAJ3jafIa/c+TYM4J42IfWjuYp98mNeVOQdaJZ/kF9U6lK0eiECEf2eoOehX
         q1eAAm9jfJkxQ8Bl3PeI9QD8wfBDWzq+XBX/PFDr9OE3N8sSo2vnTew4YzCVYgGL4KKD
         +h/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iog5WF2G/vImaly9nWHyzB47r7oe5u859s8q/Iq03KI=;
        b=IfzHe1FLXLY22HyQrC5AQJFCTpooBU7DGKJV/uoM5wAONZliuz8ebZfe0YgjLMIN4I
         gqiOBAaM7etsofOhvVFyVRGqa9yr4pCgoDtwcWgaNJ6jCndSap2JbIg6h8m6C9fUYW6s
         jGmGi219Q4gpuLtzKcWxQ6dv0fA0hCQcNbdA3ZhKlSdF8p9izJavsdN9YuDctW1y3ZD2
         yhyhqy7VX6hhBfa66WCdnIR+VGR64/fu5qSZqn1Z/c85ye0pNun0+qD/J5PhQmeOBxud
         HkehZ4JrsvByUTzVGFu3mPueosSGK53KYF6yy2eyOWh61xx6dRu6YMe/RuB+JBaXXwnN
         Q5mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baioGDKs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10-20020a1c4c0a000000b003daf671f7c2sor492554wmf.20.2023.01.18.02.47.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Jan 2023 02:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baioGDKs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iog5WF2G/vImaly9nWHyzB47r7oe5u859s8q/Iq03KI=;
        b=baioGDKsZeIOuXCxkxK0Ra7D23iWhGKshy/++/xIuPq2sQQ/+XxHH7eL05ZfU7dVb2
         7AqoIIoXkQ3xVsE3kvUoE5zXZ8Ks4Kmwvok/yBqZfkLipazMyBAzMpgCexZvYM0gtTyI
         aWlyRFi/c4jjCuFmyHmH4caIUKVQ0jBkmC3q7iozSvhE8X/bewUwpxGzkaiSAtznviX3
         af/RwQnW5GgyCe/1llnhJ+NJceFoTqSlA6e7vSrh9WphusQWeElXBH5C0jsGLTP/wrJD
         Kzae6rrRg9c2GCXElW1sSy2uqnMOalRNnHLCo7hnxR/u2rkqlh0ss/ooi/05HtSIPelW
         zreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iog5WF2G/vImaly9nWHyzB47r7oe5u859s8q/Iq03KI=;
        b=ZrfoGV1F2XQFcfAF+8SYmbI2+KinjgLax2HII1vaW0XVtfPu72cuiQZBS1h8PvMZ+m
         VU949y84zZ/c0xUG2Q0AgLjMNC0Ql4rfcMxZ7p2qCnvKMVXanEbM2TOI0u7NHF/aPPIy
         pFBkU0rNxsNHJ9J2RY6HyBBDHTu0BFwwC22p/HJ63KhqrbYQiThYTdr2Hgts1+NnPExX
         TaDOtptMzAu0VOuphbV2lzIeOAOehptQiJk3kazaAHDpVD1bIAGtcyDw4YliPXWS3hmv
         Nm6j8hn5WNLEh7I4VdefAiukUpA0KZMCvu/sRLuNKSUv6TtO1yWU3PVy4GjqYmqLSbhV
         HhTA==
X-Gm-Message-State: AFqh2kpz0idMBhnSPE8jEwkQNy5SXO/a/PAlwl///f+LgSnYNtJ7h9TC
	jij0c4f+Oz18DR9r6ZtSyEo3T4gK
X-Google-Smtp-Source: AMrXdXvFTNuzmkgTU4C300XWj40ncWfv5L7TaSZMhcJPVM9Yn3eurxfVrkPwO6s8SjgTq+Xk0eEQsQ==
X-Received: by 2002:a05:600c:4e08:b0:3db:1a41:663a with SMTP id b8-20020a05600c4e0800b003db1a41663amr197239wmq.20.1674038861899;
        Wed, 18 Jan 2023 02:47:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b003cf71b1f66csm1725100wmb.0.2023.01.18.02.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 02:47:41 -0800 (PST)
Message-ID: <29287d50-7bff-2610-afab-b7ea96e427fb@linaro.org>
Date: Wed, 18 Jan 2023 11:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 00/28] target/arm: Allow CONFIG_TCG=n builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: UBmkuD+DKh2M

On 13/1/23 15:03, Fabiano Rosas wrote:
> This series makes the necessary changes to allow the use of
> --disable-tcg for arm.
> 
> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
> 
> branch here: https://github.com/farosas/qemu/tree/arm-disable-tcg
> 
> Since v2:
> 
> patch 5: removed extraneous include statements
> patch 6: removed extraneous tcg_enabled
> patch 7: dropped in favor of "target/arm: Introduce aarch64_set_svcr"
> patch 12: removed inline
> patch 13-15: dropped, not needed due to Kconfig changes
> 
> new:
> 
> - cpregs.h changes I had forgotten to include in v2
> - moved CPUs initialization into tcg/
> - skipped tests that require TCG
> - fixed the migration tests for aarch64
> - Kconfig changes, left only the 'virt' machine set by default with KVM

For v4, consider splitting it in two parts, first reviewed patches that
Peter can queue directly, and second part requiring more review.
