Received: by 2002:a05:7022:6b88:b0:48:25f4:1512 with SMTP id dm8csp1144515dlb;
        Tue, 20 Dec 2022 17:23:35 -0800 (PST)
X-Received: by 2002:a05:6a00:72a:b0:57d:56f1:6ae7 with SMTP id 10-20020a056a00072a00b0057d56f16ae7mr341689pfm.33.1671585815294;
        Tue, 20 Dec 2022 17:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671585815; cv=none;
        d=google.com; s=arc-20160816;
        b=fQAdfiPSUD7VQXmrDMCIqOFfKhCTq3mk/u6yvCthhnDv5OVulxu+zv992boLZktVVv
         XPP1bBeGb8x9W96rCtAdkfDedFnfGJsg+aIPPLOfZ7IvNgQufrILxenlxmejMwiqGRiU
         8s6r9nY3EFs1w/9zk0CmM4sIZjBo/lmTVZSKr8hThjlLDYjnHl1mQ3iS9TEQrgToTqBo
         OJ1Q/KYb7UY8bApIescsKYUu396zNjraqtmRVrHPKLBr7yfKTBqxCnXYJMnVYmNnk5jj
         ueCoZ0H7DLqIyeZ9m/5/2FxHaDj9muioQfYiu/r4W5l6xJVuWWWH1wa7wJjkT6y+Swjp
         vP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uCkp37zRSFjLG/vM79nxx1drROk+Rt3/OhdwamPp7PA=;
        b=PFAz8yCxJy6W/H8tllk/OEspkVXEcUo2axGkUYn1fWvyNaxzmO3LYnuUIE2ZxS42Um
         zjfKnqila88JKHvYgQ78nmq+tRGde0gx5OhBZbSfgqofWIUVtzCy/7b5LjcQluzl8kQE
         bH74xO6C+2xW8+Wrtt0NAvdKra6Xqgm8TZYo+CHaJBy3RAV4JQ3XK7HgMeEKBtFbW3VP
         KGvCRNa6NhUdRSw4N9cud0O52J+KKKs5gf1g437NItUdTqZAhQZhSK0kTm8PoxsFirWo
         cyQ9jsV3LgGBiLTvpKi1Wz1jZxNh0VbzDb5XQrosk0+Qf88JfWd3UhIsd6FyAIs0UfEm
         7qDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmNA+hwn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g20-20020aa796b4000000b0056ddd2b6069sor6097334pfk.60.2022.12.20.17.23.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Dec 2022 17:23:35 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmNA+hwn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCkp37zRSFjLG/vM79nxx1drROk+Rt3/OhdwamPp7PA=;
        b=jmNA+hwn9beXvoFWUk/HALWv8RqFRBUvi7mLM5zL80VLQtBuR3cezbZA5Nea4wEqp/
         wSbEfSObTnjRXjuycAbX6Hk6RzzSHlwe6VEt5d97qyPetx69b3+FOfsaqurHWsZs+QnB
         rSZCWSFy/aLA4y2oxUhiakN0V58v+rx//Wo1rEEhyNrdCcW+lbVEREMnToLIL7JpPBWE
         SBr7N4yU+qPt5JD7fY/wDXc9k9O5WDrx8VbnwQeW3T5/BqWUFUbDtqmRESPBE8PuitZq
         50P0WcdCGPDRy9duOGY0mec3lYfEfa2bFmRQVUMyhF6vk1HTCpexwwVVdJoktJu2i1Rl
         LF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCkp37zRSFjLG/vM79nxx1drROk+Rt3/OhdwamPp7PA=;
        b=f4jSppq1oZlBtArZNG77bQ2oSqqwYcQI6gmgtt70g7oJg7bIwLFwzLVXIH5Rrb+sdN
         dS0jz0MLOvJHEVJEmqcSJ6MofSbBLmiKIYTWHHNTYsldQy5hOQ7lIIiPeL+pXDpUYIxW
         JGOAutuKmaAJC3xvmkWv21bNQUxBzjMRXttMeMyr3mxi9Wmm2L6e4mQ2hos1k9VYe4pw
         7ti3M8mmSGEBJB9mSeaqpiFqme9b2y1rLceserloy0zVW/GumS3zF8NCCLi+5VaCpVl7
         1z1FGEF55NEkgmKk8tVwz1qFxXw9Pt4LUMKB2BoY2mdvushjYqlc8Ju5R9sy5dVTF78f
         ICWw==
X-Gm-Message-State: AFqh2kr71HXm2FkWSUd3AofD+CEJ2TbKScpv5f+kEuM/v3/d7GQzAgeA
	Z4ntibWt+REyAj/QB2ih3ThWRB9k
X-Google-Smtp-Source: AMrXdXv+N5BHgswNINYH9uD+4vvDGjvja4pjkh/93gMxAisQHx929xoRpECQp2bh0T+RNyJ3bSBwmQ==
X-Received: by 2002:aa7:943a:0:b0:578:202d:a33e with SMTP id y26-20020aa7943a000000b00578202da33emr539348pfo.20.1671585814943;
        Tue, 20 Dec 2022 17:23:34 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0? ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
        by smtp.gmail.com with ESMTPSA id w7-20020aa79a07000000b0056c2e497b02sm9536409pfj.173.2022.12.20.17.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 17:23:34 -0800 (PST)
Message-ID: <767c0371-50d1-424d-96d0-9ea47c2bbd6b@linaro.org>
Date: Tue, 20 Dec 2022 17:23:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] target/arm: only perform TCG cpu and machine inits
 if TCG enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20221220220426.8827-1-farosas@suse.de>
 <20221220220426.8827-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220220426.8827-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: r9bR/2xgEoPp

On 12/20/22 14:04, Fabiano Rosas wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> of note, cpreg lists were previously initialized by TCG first,
> and then thrown away and replaced with the data coming from KVM.
> 
> Now we just initialize once, either for TCG or for KVM.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> [moved arm_cpu_register_gdb_regs_for_features out of tcg_enabled]
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
> Originally from:
> [RFC v14 16/80] target/arm: only perform TCG cpu and machine inits if
> TCG enabled
> https://lore.kernel.org/r/20210416162824.25131-17-cfontana@suse.de
> ---
>   target/arm/cpu.c     | 31 +++++++++++++++++-------------
>   target/arm/kvm.c     | 18 +++++++++---------
>   target/arm/kvm_arm.h |  3 +--
>   target/arm/machine.c | 45 +++++++++++++++++++++++++-------------------
>   4 files changed, 54 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
