Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2890272ejc;
        Mon, 9 Jan 2023 21:37:36 -0800 (PST)
X-Received: by 2002:a17:902:7e8f:b0:192:ef83:7976 with SMTP id z15-20020a1709027e8f00b00192ef837976mr20646501pla.46.1673329056159;
        Mon, 09 Jan 2023 21:37:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673329056; cv=none;
        d=google.com; s=arc-20160816;
        b=Ci6RNBIYfkXh3Y0oNUywSWE4IQVTsZ5QhdEqlM+hhbZE5/Ww3X2xo8dalT73TViZov
         V4WZaz4NC3iSar5J3L8vx3s8hwTB8WI5aNRbaYd/d53+Xx+h3yzZOoPNU8rWL3j8d/QU
         wm+p8qVdT/sPU56j2z4Q1/eJzodQpaTTi5LzJxNKobp6AidbcrQN+vyVUsMAgNpwTdEH
         09uHSDetXMNbcA8GCQoXWcsSLHEVZOxSSxPwsXuUQ0DdYS/W18xQ5no0cO43mP+o0ucQ
         bbnSCt1rvzGO6gcph6V4p7YuiSIIMjvHRCtzBnP5GPXkIyVrZGOTFp5kuE1LG0vLQO07
         iliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Z4M+M7Q4vK+c/tLWBjrETXUl0PEhAhKao/mOyAJMqvI=;
        b=hC/mg/1wrLEstp0fsJ408SXe3W/Z9OtocXB7rrhsPP8ATkbPk8WEPHLNzM+jtDdmgq
         Xfa2t4nUFXYLARRHfoslKHqxvojG0AvDGio3I3Bno7Fa9rFL4yg4wX8u3/tQVjXGBwR1
         gvXqnzSGm6FD0t7g3+C9qc2Cm5URQLcyoqFhBMLhq6ilDx3eeTwjdwK3yI9VBao6lhyB
         6xRlMiMGeSps/M1t6Dlh6TXk+jANIeFzJhf0wj+hYfkp/6MFOaim5YfrM0SsMS/y/lyx
         Lar9zFVWgYX7pLOPfG+zcwsHZ4yrCfk99uJhGYX9ydLyccUh4xGEDkSMnrBdac1Nw2VN
         X0OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Itdzru01;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u7-20020a170902bf4700b0019309dc5befsor4894973pls.133.2023.01.09.21.37.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Jan 2023 21:37:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Itdzru01;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4M+M7Q4vK+c/tLWBjrETXUl0PEhAhKao/mOyAJMqvI=;
        b=Itdzru01jrOIjqxlTSTA6eCEFg0q9BDavME4TsSrR2HErJTPy/a4Qwzp+nWO3UgD8N
         2YO+DJtDMD3sQW2emI3PHAr7pdeSqKAluTH8o8o2W/WOJXcFOnfjlfUE0BMF0DcCueX8
         RKVnU+jnQF9NmJoekWxjUPI3dcTvUWOtrtg/3to/nU+zjfJLkDMjQzrPMJep7SnGHeW/
         FrWcJNag2U+i2zTP1Ex78aLerQEfllZRDh4/AVEsrfZfUIRGziebWqxvxk8t4l8O/mLt
         YAsHUlLcHSUzSko/PYVaLfdkC7GO8syDl1/7h8hFB636olB2xzmb5kV1Z5VAec1re4iU
         2HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4M+M7Q4vK+c/tLWBjrETXUl0PEhAhKao/mOyAJMqvI=;
        b=2OC6PwfrWw/aziR38DSzo+JXBs2Db8WGj9lW1MIokC7xNatvjSDQrCEoCCWocv48qk
         XC9erbWNVDAR9TnshzgcOq2YddCzxhV5L2+MmZIlM0Xr42A+aUBLuSVldRyoouUgSxSw
         +UxQJJGmyGGM+wofuZBBqDaejK61HL/Q7ISsfFoR24tumKcxUl3uzHPWK/jDOhadqtgK
         Y4LYBtxdmE/jsbc2qmMcskbpoDiOYabTNaIvk6PWeeW5qPdu5rN9pWZnAyl8mhEtE0YK
         vSZGT1LgeF+ap6A7723S8bveKTr1WUGq9asXn/5Wkj9nTvNgvB9J+3gTUjSd4V3G28PR
         z34g==
X-Gm-Message-State: AFqh2kqu4ABSngtHEcz8rvYL5YIPbDXvlhrSiX/YyycBMixKr4+FlRkH
	7T5PCUGNGu1cxmNPcHy9+Ucp1Bqnp5CopHXfMPM=
X-Google-Smtp-Source: AMrXdXtSvOLUpa4OYQtf6gSdt2AEM0xmwq6I4OQNvfMQoNJNBk4GQObF3dfkH7hLtM+vc/uy2etS3A==
X-Received: by 2002:a05:6a20:b91c:b0:af:9dda:b033 with SMTP id fe28-20020a056a20b91c00b000af9ddab033mr68113368pzb.37.1673329055614;
        Mon, 09 Jan 2023 21:37:35 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:fbd5:d294:fb18:71f9? ([2602:47:d48c:8101:fbd5:d294:fb18:71f9])
        by smtp.gmail.com with ESMTPSA id l13-20020a654c4d000000b00496317241f9sm6018758pgr.51.2023.01.09.21.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 21:37:35 -0800 (PST)
Message-ID: <5ba2a9d6-936a-e3fc-511e-af9866a001dd@linaro.org>
Date: Mon, 9 Jan 2023 21:37:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 05/19] target/arm: Move cpregs code into cpregs.c
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-6-farosas@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0i+cHJpzJgBs

On 1/9/23 14:42, Fabiano Rosas wrote:
>   target/arm/cpu.c           |    1 +
>   target/arm/machine.c       |    1 +
>   target/arm/meson.build     |    1 +
>   target/arm/op_helper.c     |    1 +
>   target/arm/translate-a64.c |    1 +
>   target/arm/translate.c     |    1 +

These additions of #include "cpregs.h" are unrelated to the code movement.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
