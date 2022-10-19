Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp221661ejn;
        Wed, 19 Oct 2022 03:47:09 -0700 (PDT)
X-Received: by 2002:a5d:64cd:0:b0:232:d08b:8e36 with SMTP id f13-20020a5d64cd000000b00232d08b8e36mr4715496wri.692.1666176429535;
        Wed, 19 Oct 2022 03:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666176429; cv=none;
        d=google.com; s=arc-20160816;
        b=CsLHRtw2v1SdksqrvixYt/lKXCD67WuiPbuNl4bIsk9leovoIAlqBGjSATchaP493N
         l8LIJPKsz6EoHU6PsuF72Ochrjpw49h6F66U2+v6/tS9UfhT/+u6WSFTjhGtamCGOeOr
         z4QOwRGJaNsAUQiR6GreJ3JWuobU2+TEER12DkvgtFl69qJ6nCENjZQTR217Lr7t938a
         0RIGbi6XNdYECa+X3j3GsOjen8egbwurNNkTJETugK/PdErcpfbnGV1c8XYBamc3qita
         OV+0l6gExr0SBlLcIz+rueTESQVl5pTkiJFN0jQDG03Mnxq8JRlWjQ800/9/f+VhLyBf
         nsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=N5rEVJ4c2G9081f8Yj52mU6DFoYB3xzbCM8r8MoWZv0=;
        b=pd4gOR7O1v6qXYFlI2cpyGekdBE97QzVCe8Ecur6epJVwBRAw/lOkdcPkCknnGKVmd
         Jew9C2SczCaWBi8RRYvXJGlkPEL+DgNDG2tL0ZVv3iTprp2qgj4vfsvLjPp3XL3Zvcka
         kjwqBMBDRY/zAZrIrzlqAdRABEXUeYlSf2V1dz34FYymwRGNp/K1x9VuJU051vqFfQSQ
         /7onBPFwJ1Lnev/t9uCRzmqnKrSMLxnXq6CZCEZHkABs1DSvt5iKiv9naQTv1C6bTOvW
         0KNylmRkdWdrIKMzbgTscWDK5d59Mu/wQbIJP2vNegnZj6vsuKtJtjREsX9U02Vvvs4Y
         YLMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PHDkasHI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k20-20020a05600c0b5400b003b338883606sor6047801wmr.14.2022.10.19.03.47.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Oct 2022 03:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PHDkasHI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5rEVJ4c2G9081f8Yj52mU6DFoYB3xzbCM8r8MoWZv0=;
        b=PHDkasHI+rm/0UsoT/j4tsT0ShsHkKhcKC1Vv5/ykBOtyVbRlVGGl6XpmnYJp2nsyF
         Z60eWFFSkTwIojpA/h5DGPp+1wztLf4PpP0hSpj9ZLDOziRHBGcJ+bvA5ILCvHJ2UTmS
         /q/sbLIEoq8A+JXHb7y/z7N/IdBvcHRuNMDLSo7y/HeDItgwLnurDGSu81KAvaFN10cf
         7PZG82wd6oXA1JJ3oRA2iuK6eaPIGTFMhx7XJRJ7/fA3BYNtMKrzxfRtMTOgKfuQUeMf
         UUxpSVjS4TmLl/C8j1YGxWpwUVy7AwaofY7NEDQnumc15zjgtMam3Ix4VTDQaZThopY/
         nCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5rEVJ4c2G9081f8Yj52mU6DFoYB3xzbCM8r8MoWZv0=;
        b=4breJHCBl3AoUQjC/FEmTVUOO5ph3MMbQ1DBKqkRBwDdlfkDIHqUp8aS4PArOiiW6x
         kTfV997UruwCrb7fY+iUBVCwyvcM8a5gyJVSxFxvp3K0P655SJu2vOHIKcVNTQQWxS6n
         U79CpAvs+aQfqQpC0zX3TB2mFEZx05IAFuZJl7wgfdmdOIuQkWy0JGsvXsbWo+EEdEHn
         1w9j9jpyXFGUQMyyhMfyyZB8/+yUZnE9fSW4Uc4KkNgd5TjA5agVk2d1g4cUc/QlAyij
         ZuzORpkw92bKQmKZgQ7b+I16rHOFVzBG2R1n7QvAPd9KNPlOxYeKeTct9SDR1Di/Ae14
         waPw==
X-Gm-Message-State: ACrzQf0xWlMaALNcbiTDjs/0kw/Iv5NI9R2aGu24pINNlPDNqhOKvv1W
	OLkX+R80K8rSFqxCFExr/Yk52e7wqo0hI0qUqSE=
X-Google-Smtp-Source: AMsMyM44ril6wo8YgRXNgSAb+HwPp8ad3ZMFNUjF/brFM7bKd5Rm89bnd8glGNBNA0ZbpjDQodAfmA==
X-Received: by 2002:a05:600c:4e52:b0:3b4:a828:1d84 with SMTP id e18-20020a05600c4e5200b003b4a8281d84mr24870413wmq.143.1666176428824;
        Wed, 19 Oct 2022 03:47:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id q13-20020adfea0d000000b0022e3e7813f0sm13408657wrm.107.2022.10.19.03.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 03:47:07 -0700 (PDT)
Message-ID: <64fcba4f-c816-b77e-fb8e-df7232425657@linaro.org>
Date: Wed, 19 Oct 2022 12:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 11/15] gdbstub: move into its own sub directory
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /k093hXAco4v

On 27/9/22 16:15, Alex Bennée wrote:
> This is in preparation of future refactoring as well as cleaning up
> the source tree. Aside from the minor tweaks to meson and trace.h this
> is pure code motion.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   meson.build                    |  4 +++-
>   gdbstub/trace.h                |  1 +
>   gdbstub.c => gdbstub/gdbstub.c |  2 +-
>   MAINTAINERS                    |  2 +-
>   gdbstub/meson.build            |  1 +
>   gdbstub/trace-events           | 29 +++++++++++++++++++++++++++++
>   trace-events                   | 28 ----------------------------
>   7 files changed, 36 insertions(+), 31 deletions(-)
>   create mode 100644 gdbstub/trace.h
>   rename gdbstub.c => gdbstub/gdbstub.c (99%)
>   create mode 100644 gdbstub/meson.build
>   create mode 100644 gdbstub/trace-events

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
