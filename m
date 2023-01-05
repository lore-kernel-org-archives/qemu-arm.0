Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp63332ejb;
        Wed, 4 Jan 2023 21:16:51 -0800 (PST)
X-Received: by 2002:a17:90b:a15:b0:226:23c7:bb39 with SMTP id gg21-20020a17090b0a1500b0022623c7bb39mr26737924pjb.44.1672895811676;
        Wed, 04 Jan 2023 21:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672895811; cv=none;
        d=google.com; s=arc-20160816;
        b=AO650PolyMVtoyhrh5rUNJAQT/9Bv2UuIKh258WjlirnT7ODXZBAUY4K49ve3w0vcx
         NYXWjV5xEfqc00glH2KaVG4JXCOMO5/X9fhyNXM0ZpcVbjSGgdmXcpxIPP3sl32hzLlU
         0UL5w+1tMWfGoiVWgSL9PRb4tgAai3O0I8m4Rm53XTcRchYn1g1Kv5l5Er89cISWnev4
         Mf95aMbEVs/MEBf+MgLBNbN8mGdW7CpM214DBmHe9aSMcxDe6JVKuCw8nYQs7s3OZEoj
         gleCLvRd7A7fLR15zgvWJUyYvDbSANiexqT4lZoIuA2EglpaksXJeDyLynYAQVS+2H+Z
         iT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AvDCK3v/YAIQ5dVj+jc/0Dp9A6RoPuFTEl+MPJ7HJ/k=;
        b=EWxE9ElN8+SFl98X84rz3/wnYn5R0XsQTwvT+llRf41yddluGvGTENt8Tg/Z6bClTS
         kbwVIwxITH3vcD/dY1YLhfQD+WFUIuHUlKFRHIfwMNlnV8p996TR2GManaj0cFvAxDj8
         BxjtBLtiyF8xdh+FPEZBPj3uceDogBIYFHmWPg0gmuw2uQ84V72KkC9JvkRZawJ3ECaA
         hAENIBnkUxtmMqXWCRZPpMKkySpzs9nljMrRuA6uVShYJfCGXYum029Ulw1ossPc3bPJ
         d/2Idsx45+nQzuIeQL29/eHuYZrsKkOrSIi+cDN1X22fKn+HHUO7YIV/gAQn1ASlX7Cu
         Lb3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K5gn7/Cw";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6-20020a17090a030600b00225cc1ab378sor398124pje.41.2023.01.04.21.16.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 21:16:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K5gn7/Cw";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvDCK3v/YAIQ5dVj+jc/0Dp9A6RoPuFTEl+MPJ7HJ/k=;
        b=K5gn7/CwdLJqQX88CfJILSfT5Ma1Yo+/4YZMZDf0huATPeTn3eFjmimiKTQGkkCn2Z
         PgCBpxRuOJ2I3mNN9u95pp8xgSAKTcLAF2WeCTwvDQ3PTdgIUkYfrVW1kg/PNp4o+WJ+
         0Hy/0ZQLWrIkIxDGkVqa1NzaY1uPxgczCejNj1klaVt/Bnrm/R/HSCw54EZmuRa5zEUX
         ogZmTgln7p0fijmFtZxDCp3Dqd3mp5Kl/XcsZzHLqwpE0QqXYYN9VFBYXdiIxyDIxzNH
         FjL6d5hkmTa1XP9D6XRAOuw6uiXJVsW5pBm/MKXkq4cj4J7U6wy6uJzt+1cf1bmEF9Jb
         hjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvDCK3v/YAIQ5dVj+jc/0Dp9A6RoPuFTEl+MPJ7HJ/k=;
        b=P8Em3X6FH+VPqIGhpKQE/5qITop2qxb5XZ4X+ZMC5m5oP8SJmqjnVLRV2ASaygvrGo
         ySd79f2sLfvOvQ9hLm+MKj+Vh7zUyVoB9a75ndj0wj0lzmQc7N+KVRPzW4ZhODsEXVBV
         EsorX2GlDGlUsEG0MbAxIoKCoJ6tjjZSjiA/GVieI1MZnlrW7mG5/tMP4KhtbIwFXDO4
         /8Q0kBp/bCwEUGHiAT/VQF4Lf94GywrgoFS2r2wjPA90qDAMs3bhy7RUE/TSCqljUJKy
         ix1rDdVA/TcG9Zh4hvkoH10KwWyJNt2GZZjOxS6w7v7TCJDRLHjRpS4MSw+F/VldytGP
         aXvw==
X-Gm-Message-State: AFqh2korsLQ76hy+ThLLmTBSIAIsFVhVFkhRlwMiObtLmPKGzE4eJM0Y
	0UG30Z4mXPAOAD1LY41IN7IVeRMs
X-Google-Smtp-Source: AMrXdXsIaDindmYGJoPfWIlPHwi2GjsFHyOMyg3padDUXISJkn9JxYUwNWV7lzZ+Fk6B2nLfe65t1A==
X-Received: by 2002:a17:90b:2688:b0:225:f8ce:5cd8 with SMTP id pl8-20020a17090b268800b00225f8ce5cd8mr35826463pjb.4.1672895811201;
        Wed, 04 Jan 2023 21:16:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id on16-20020a17090b1d1000b0020b21019086sm2660465pjb.3.2023.01.04.21.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 21:16:50 -0800 (PST)
Message-ID: <3a3842e0-9d1b-08c2-6a25-ceff8d80a640@linaro.org>
Date: Wed, 4 Jan 2023 21:16:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 26/27] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG
 code
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-27-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-27-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Rxs9Yk81IfMg

On 1/4/23 13:58, Fabiano Rosas wrote:
> This struct has no dependencies on TCG code and it is being used in
> target/arm/ptw.c to simplify the passing around of page table walk
> results. Those routines can be reached by KVM code via the gdbstub
> breakpoint code, so take the structure out of CONFIG_TCG to make it
> visible when building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> This is the least painful way I could figure out of doing this. Let me
> know if there's a better way.
> ---
>   include/exec/cpu-defs.h | 6 ++++++
>   1 file changed, 6 insertions(+)

I take it back.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
