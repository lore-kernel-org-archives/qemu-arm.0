Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp55547ejb;
        Wed, 4 Jan 2023 20:55:22 -0800 (PST)
X-Received: by 2002:a17:903:230e:b0:192:8212:af39 with SMTP id d14-20020a170903230e00b001928212af39mr46793448plh.5.1672894522285;
        Wed, 04 Jan 2023 20:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894522; cv=none;
        d=google.com; s=arc-20160816;
        b=CR8FqwYEN31SC1YfzT3k+XxNVOiTu5s7r7NQmud28g3koNUEbwJnlkWryDAvZyzEdO
         SnRMGED4VBXWILCBXeubzjF/cnXt8vw78PoafPYnyNLNLjbHd5G8kaJdeyy0m7zycvHS
         4hz7d5GwAgJnHR6HiINgih1n8XI3tN31q7s9zckL3MYH0sr9o5qbxlKNm1tDKyQZ/JZ3
         wMLScYMDXR1f1v+4LFeghb9YQfONJbZt5IEHBDRNQqnDQAEQ/G0JBXwwxe8KWXEgmlzD
         bukNFSAk4biyMi9dg4LdRA5VVshyQlB3JyOGnIUis7Q374k9NF0l1yQArRtoUJRBUmKH
         IM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/ftMB/pycQaFCJV3z/lh6F09+awhuDC0s1ox9c3g804=;
        b=NBMeiFPKaafirKRp8eA1fI9EoETyTbF/m8hvlYXUPxU0s5pwLNsaYV3Fsshw9r11dm
         IiDy46kRVnMhOeL+IKKg2jTfXd2wCzM/nmPrSamGhBt3/Q7Ria5RVFDRuRM10tIgqdDL
         Ka8HTSbr4dQhOyVgj6KkweJOXmRihdpkcQST32+3QDohUZbbZDqlAwglzK/IvB+UKuxf
         h3yy0TUTBZyzkT2E5MJtMgd7B4vUD8W388JBaD17/i1fd7oO+atbFtjikIg1E67JlLWD
         UqJZ8oVU762sfpx98DDU49hGpALHAmqznTYa9/GJk3rwMDn9OjSNOHYWa1TKZTXN7ioh
         8vwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqurgHx2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9-20020a170902cac900b00179c095e302sor7207310pld.116.2023.01.04.20.55.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 20:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqurgHx2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ftMB/pycQaFCJV3z/lh6F09+awhuDC0s1ox9c3g804=;
        b=wqurgHx2tyNFh5ggBS9kC6/9lBJ+fOaHbc+ZEXeIWqFI4U+M0dfxbbQG5CX9j+Nexr
         aa9pGzTARatZXyt3Ep8h+OUqhr3/lD5xa4BqjGjqOwh6nHew8FFVda6afRwQQw+xW0/g
         noznQhflyEy5DwC9iYPksc8COK+wOAiMZt041aUQjhPgJnRTgZ1/caAe9F0HSFebBldW
         HHpDD7an7Ir6AkS5VF8hVl+huBfxt1mqswmAFt9RE4Ud53KgMd3eY/dEiRq0+VKhn5P8
         6gLLOu3S10p0ll4r8KZAmdY7hRQmegjtZkYIf9Mhl8UkdYmClPZ8zP6Nb1GKNXQfKk6R
         T5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ftMB/pycQaFCJV3z/lh6F09+awhuDC0s1ox9c3g804=;
        b=S9tvT4ELjWIlTSmEscZ5xqQ607wv0UDdBEdHnYphLEWHvriCpZAous94dMv3mpg+Lh
         yI6Cz9eVtSZ0NHMxh0tjcmmvsfDaliGcxs7ajJLASiBZ3vBXUF9dOjORooQ70kgup3Ta
         h8CGIygOAHAa66+SiOvEWlnGPacWCP2+LofOsLEN9X6sl8L019Aanfs8tFKTtrw7C1jN
         3fyg/kBLnzr91XCWPMYoIToEOHNCWxMFrCf0fBLY95m4su7orL2ujWsoIw4nMVRkbTEv
         Z89YQWcQtLxWsGPW0W1He5uKxx+5ByGNvT41bAA3JOJ2/4MI+3SUybAmydG5ASbUshLw
         ynQA==
X-Gm-Message-State: AFqh2koOH5By/aGh6f/gyoLtzOWua+Xrnu//3/F4mUf6oJpf1/UH7F2h
	fslK7ERU6AELnx/MNhz+ZQWRI5MtME8qI0fDnsU=
X-Google-Smtp-Source: AMrXdXt7Ask2WhIN3wcMdtBaJmzw/cF7MnvwAMZIfjgVlN/OExp7xLFC92UebpwRtxgXhBQOVO3Yig==
X-Received: by 2002:a17:903:230e:b0:192:8212:af39 with SMTP id d14-20020a170903230e00b001928212af39mr46793424plh.5.1672894521830;
        Wed, 04 Jan 2023 20:55:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id l6-20020a170903244600b001869f2120absm24903744pls.294.2023.01.04.20.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 20:55:21 -0800 (PST)
Message-ID: <908792d3-47b2-afb3-8b81-aa74950f7164@linaro.org>
Date: Wed, 4 Jan 2023 20:55:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 17/27] target/arm: Extract cpustate list manipulation
 to a file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-18-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-18-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: flQh0SZ4Fypd

On 1/4/23 13:58, Fabiano Rosas wrote:
> This code doesn't need to be buried in helper.c. Let's move it to its
> own file to keep things cleaner.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpregs.h        |   5 ++
>   target/arm/cpustate-list.c | 148 +++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c        | 136 ----------------------------------
>   target/arm/meson.build     |   1 +
>   4 files changed, 154 insertions(+), 136 deletions(-)
>   create mode 100644 target/arm/cpustate-list.c

I'd rather the new file be called cpregs.c, to match the header.
I've been thinking about moving all of that code out of helper.c...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
