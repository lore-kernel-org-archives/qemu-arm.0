Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp57924ejb;
        Wed, 4 Jan 2023 21:02:04 -0800 (PST)
X-Received: by 2002:a05:6a00:2165:b0:575:fd73:fc94 with SMTP id r5-20020a056a00216500b00575fd73fc94mr49690137pff.23.1672894924357;
        Wed, 04 Jan 2023 21:02:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894924; cv=none;
        d=google.com; s=arc-20160816;
        b=kK4914W7AfTLfYwnYdxplL6ApIMI8pqAC2tzDQ/dtXkVgGPmQpgJ7qFgfX8VCCnpU+
         VkEBJMT8WwigEvdsc41BdCzs35DAahJm04GRZH6TKnGMELLe9OsfJDHJ9J9h+ORSK6NV
         8nb54LdifinSVhYXXsU6PfZ7ciJJ0n8GvLmBwTndGEPM1b3udyMZMsFWsxTFIXvJWO5T
         PPC6KTlHY1s9bRuB7pGDxZHOhf8uaQ4iJaC+iATehtkopKSkGuPMb1Bcqzc/7yhIPvZu
         Jn1fzCj5UdvW0krdW5x6FryhxfcrXPiOueL7sidnaCOKU08JJdrDTrzLauL1dNuxe1jI
         V0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FDqHkaS4SoyIvU8MSHBLI7CDBmsmoFUCtxNjTVdj2n8=;
        b=vF3iitjX9tkj/PvMK38y1ldWsqA0BPjGOIxA0hzGIeJz5uX42JRY6uEVdp0rAfch9W
         Se6YU8QDCRy4XrdBrddBx6O0LhpEGiiui16Ubgx7wYbqimD+w2SqF9MutT0w+pMLdyzR
         QUx6zZaVkgKQsIsfZ5E+IpED+Vpji6GS7TySbK4FlqOyrW7seDwtCDe8zqYUeoY1zcIp
         mLxln1zSFeTjuP6lfs28JI/jhSLa5w0KNghZXxd8fdBnfA7sJnloRRjAM8LntbWko14G
         vODl/z+D1KsyMa7k9kYyQ5WUIeeK/f59NC+znh4iqHvHN0Cpq+8UWfzX+3DCPBU+gQK7
         peUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ppeQGvf5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j8-20020aa79288000000b005773b38be83sor14360880pfa.22.2023.01.04.21.02.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 21:02:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ppeQGvf5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDqHkaS4SoyIvU8MSHBLI7CDBmsmoFUCtxNjTVdj2n8=;
        b=ppeQGvf5acZmlyE3796oGaWSnoAlpDJxSMxbzBvfDK2QDPK/wFD237EQNMw5emsppl
         IJ+IAOVGfp6/rXYVyB4Ig1HREZKN5Xzx/mjnZGfaFmk2NAey8uprq/5O8qzHM1eBSPGa
         xmGOezWJidaI/tQksSQ7zdmM7W8F9wKuD5gpXtb7Frhuyh6xgzDy3nOgh1JWr3IThc4y
         h/UxGlZNStWn5AHQLlcYSKEB8uROZPJTsk6vl/WJih+xMYiMTdPVr7n+jmgdl41kxOrD
         IvQ85hJveHTdlQuIBl7SCZhpfSwHJvKGH7XdcZVGGQevyY2vPVnCulj0fAGFBjelPAzl
         gi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDqHkaS4SoyIvU8MSHBLI7CDBmsmoFUCtxNjTVdj2n8=;
        b=MJBA2D1BFQYGlSKUDLnyh5hGwKGWT6J9plc4jvm6bfWIecgSjme9tEuXLJ7XhN8wk0
         e0l4RUqpWj48XjgxRSbmKQXvDGI5NDUfKuWyV31j7/eWfaPdZdmpBVdeh7MVjEaPNpb4
         Vg+/Aao+Hd0zaQQR3UHmAzI36NA7iT0zD/OMRz/KajAhNBFCULN3uqil95nDcSMlk7gk
         1dK4aBeyYFtlLpH5FBnFk/nt/gL2pDrGZNRswAqAhBz4diUJ1gRxudRDy03feS7tByuv
         XZcpvFpAZDYORGrGIABso/dHRhNBYEGUB4f7QjmLeknk1j/ubmadwk0CrXq3xaVe2Gsq
         AOKw==
X-Gm-Message-State: AFqh2korI9zXnbYScVrifzqRZJsqq+7xtztYH38CmtcTanf18DPRxXhF
	wkaFN3n/1AROLrWJhp6hySmFTY7m
X-Google-Smtp-Source: AMrXdXvAwY7Kyt+hAExwenTfJwKKsMe+mYFgMRm+von3qrGq2PQ4I8ADpLvHfF1KtsDiyEiTSiNOdA==
X-Received: by 2002:aa7:9eca:0:b0:581:f654:a374 with SMTP id r10-20020aa79eca000000b00581f654a374mr22819570pfq.24.1672894923894;
        Wed, 04 Jan 2023 21:02:03 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id 128-20020a630086000000b004a099a12937sm8414366pga.84.2023.01.04.21.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 21:02:03 -0800 (PST)
Message-ID: <704cbb1d-f7be-e472-de02-dbced7d616f5@linaro.org>
Date: Wed, 4 Jan 2023 21:02:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 20/27] target/arm: Move cpregs definitions into
 tcg/cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-21-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-21-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7UCyEakJT28w

On 1/4/23 13:58, Fabiano Rosas wrote:
> Code moved verbatim, except for a couple of ifdef CONFIG_TCG that were
> dropped.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpu.c               |    1 +
>   target/arm/helper.c            | 8081 -------------------------------
>   target/arm/machine.c           |    1 +
>   target/arm/tcg/cpregs.c        | 8088 ++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build     |    1 +
>   target/arm/tcg/op_helper.c     |    1 +
>   target/arm/tcg/translate-a64.c |    1 +
>   target/arm/tcg/translate.c     |    1 +
>   8 files changed, 8094 insertions(+), 8081 deletions(-)
>   create mode 100644 target/arm/tcg/cpregs.c

No, these data structures are used by kvm too, via write_cpustate_to_list -> 
get_arm_cp_reginfo.  The code movement out of helper.c is desired, but the cpregs.c file 
should not be in tcg/.


r~
