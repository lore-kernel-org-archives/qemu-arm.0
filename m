Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp55734ejb;
        Wed, 4 Jan 2023 20:55:58 -0800 (PST)
X-Received: by 2002:aa7:9559:0:b0:581:7b3a:198c with SMTP id w25-20020aa79559000000b005817b3a198cmr28074233pfq.13.1672894558529;
        Wed, 04 Jan 2023 20:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894558; cv=none;
        d=google.com; s=arc-20160816;
        b=IoTRQfydHrbmVKXvkW20SwXSkpqScKvehoKIngNrYISgWL1ZAEXjQAFYGaD7vQn9Hj
         JEqe7H+l99FWwTD708Z2XbcgSo4hnXvLCTM8F6raDRmApL9pUy19BopqXLzddReLwHyO
         OykpAsxjLDiWTazJF/U+YghP6KupsqtkB1z9y0J9B7Upp4EVgmhF7uEPTq6I4uwyUrus
         6Mz6J/QxK/3GSm8Kn8Br1manETri5oweKHUj4eeXMnI0mtYpHPFtmA5O7IApfkWZBAb6
         mPASDDtgcMtHL4qnipRGOSaX+4glzKn/FE7T4TIGR0ZRUaHamTAqFkjjoOWJs1pJoTPH
         0ShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ikcn1eL9lUlqNzBJJya+olf4qITBLo3o8+simmK6nDE=;
        b=GZbHDxUSQL+xlxi2eGLZPObWe70PqZC29uj3CE+6kwqb6q0z0L9YmgzvAqEW7GFZgH
         w5xtN1cSIss6of/SUbb6G85Kdg2Vg4QmquEQc9FpUWgTPDERqWw6Q67qVhsjRoBEiNWP
         YT9LaX7JkbQbBqfAUxrshbpL6+m8Os2wGdE7HTv7STgjoKqjmNoo0eVcFBpuptq5s21U
         aPdT0PRdKZTZ9c0DdNPENIoXlBi9rnQxoB7Kj5MPwlKO6PkrMPnEGbXxEI4juP6NL20G
         hriKVr0OUtH1rVZKJ3YYsnAwbWSPUivHj8xcvnMM0859UAhY6JvOnffVJx4Ru8m+tN5c
         0lqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OZqvC5+3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u31-20020a056a00099f00b00580e6a35dd5sor12358782pfg.70.2023.01.04.20.55.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 20:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OZqvC5+3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikcn1eL9lUlqNzBJJya+olf4qITBLo3o8+simmK6nDE=;
        b=OZqvC5+3jWf2iDgi/bSy8tpVZxtNuricQNuhpeyplQtj+/OeoA7Zei1c508cYYNAg4
         nb8lgagweiO6AmrpNImVp3VIgMWPp1opRk6bkH3gTzWoynFOa+MxfveA2IwaXX5VxaZl
         uT3jQKtXaZJcMmbCEISSnARyqUi+SkGljB5/fhAulXZnNLVrdDSf3iRqmroakN7lYyDl
         t4pkvMvSQlkw9SeWvtry3UlZnV/z+Kwc5deYFC5zAIRvaDrKNBwcIYwb6Erov2hofgyB
         imjh63qr7HbRwVapJQmC3dhzqQehAVtLDFylQyyPibE8znOS2Dbej1OsqbPJNHTPbJ3W
         0H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikcn1eL9lUlqNzBJJya+olf4qITBLo3o8+simmK6nDE=;
        b=gOizLC7gDUpNcjZp8pTurmq59Dco385XYDby7bBf9RGD9V36gQEWV/WGYV4KkhARNX
         gvxI9TGsiYUFL2qRg5Kj+46pNlJUh/R5mmVAq39cqlUh/WdK0J12awPHmUpLpUFNWUne
         lVSuEFTmrW0ZMT3rjsn3wRk02kYQxPPmogWcoDsOGCTA2sW4a1D8iSaSMVrujLF2/eZx
         BXvhYa6797G/H4KvslndzAvjstVVhtjXV/VDJnfBO5/6T+w4mMSviWxl5xCEttUNxzYJ
         7qdLzmkiD9TazWRF/j9BoSUnP/XSYfPNhFJdt8+4U7Q6F/zk7oHS8YB8WEWBBGBQyCZF
         8Aag==
X-Gm-Message-State: AFqh2kozVPmYg2XHHmBaI9NnyhH5T8lJ70amKgpGevumsjqiirwZVr4P
	NiKAStCPt8KGxm0yBznSwHFYfsWX
X-Google-Smtp-Source: AMrXdXtDUtmcrgprinje/GJw+w1UdC01gIrYF8Wa0zVd+ju83aezUNPZDWyGJHawSIZ8lJWz8zXsbw==
X-Received: by 2002:a62:b617:0:b0:577:b52:4ec2 with SMTP id j23-20020a62b617000000b005770b524ec2mr46784564pff.29.1672894558046;
        Wed, 04 Jan 2023 20:55:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id h9-20020a056a00000900b00581fb8e665csm10886271pfk.67.2023.01.04.20.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 20:55:57 -0800 (PST)
Message-ID: <bfa16e80-799e-a6b8-a469-4665c43f8c93@linaro.org>
Date: Wed, 4 Jan 2023 20:55:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 18/27] target/arm: Move cpregs code out of cpu.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-19-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-19-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5pNGXBu9hOQF

On 1/4/23 13:58, Fabiano Rosas wrote:
> Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
> a cpregs.h header which is more suitable for this code.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    | 91 -----------------------------------------
>   2 files changed, 98 insertions(+), 91 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
