Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp56642ejb;
        Wed, 4 Jan 2023 20:58:54 -0800 (PST)
X-Received: by 2002:a17:90b:3758:b0:225:d698:69b9 with SMTP id ne24-20020a17090b375800b00225d69869b9mr42621520pjb.17.1672894734463;
        Wed, 04 Jan 2023 20:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894734; cv=none;
        d=google.com; s=arc-20160816;
        b=AGQ8FWbv66Gsmvge9UepFj8+Gq4/QBGj9xcV8QybREPGaHmjhMGMrC8BSjH7gdjHSw
         DuN+U7TP7Be6jiJ5YT30fQhyUHkjgOeUySBsDJfbnpCv7Opur+AwT4T7p7sMhfFWkP2Q
         J84ZqSbdV5mDZCX7eIeFsHpa8isRPKySYc3NcPbX/48BIQIaksZfvzlsOwFjW/oTGY09
         L2+04rrQ1BIZN2bQTuLsMRNO0O2gaaMMMoqMQ6X/HYN3zoVhzc38L5tCVaGSuJH1vulJ
         ncPvZpIlZxxNbc/PKAAf8Z/y4KezkLO8YK1szfZs8bB0pUp047b7pDo4kW7v0EnA80TA
         DKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cSQYyO0J5jDt1kMA4Vqftdcrd+GYsrnUON288QLbQT0=;
        b=EE5hi/aLZpfhdIWkkm0CdDv2CMq3hvXtz8eMp7XYBh9isB4bm0YwGWgB0kwNTFatkp
         Xjm55CJniNaHXyvQI5wDI06QlMJmY447NGXUfXTjijEp5sAZQk6/U+VuR/Xw+uNewd6C
         9Cz884fQsoY5n5yPAT/PM7rh6ZZpDxm72hWV9+h/pQwNAAM9/L3VTB9eif6a91xTWGPP
         CmzBzpMIdBbCpp4pnx0eFu0xKlqOBG3i7RU2eHe4o6N6Vf0kHEfKvpAGQk8zcUNH9Dzx
         3wDDmyinbEwppSKhBQ+OXaZ5TIpjofQJAwUFRAEjrqj2hxH5cg2bfoYv1uo9WZzfbncK
         FKsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJMwj8CI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1-20020a17090a688100b00218a1b69d22sor407456pjd.9.2023.01.04.20.58.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 20:58:54 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJMwj8CI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSQYyO0J5jDt1kMA4Vqftdcrd+GYsrnUON288QLbQT0=;
        b=tJMwj8CIbDP+ReB7sc7ttfaspWDsfFRhVG4zFyhXmZsvWQyesOF7CBDPcNGhYVh2yd
         qnUVHIg5iiLxkQEx/4bbPgPYMeFF0Ovrw/iVVvuBGH0J2XMsh6lwtUHTq+Fx8/0IcF74
         GQXSevSeAPF1ZezzUUU3MuS4HiVaSYJ9e6LPoOYMEPgb2M2DSdeZOJfzy/WEYSJjFvhm
         Aasw8aL6pZYLsC64Ay2fTCRHGLWvFq/PaTF2Ih6ihIW+amYLcYT4MOGVscNkmqQd3Crw
         yq1+rN4qm0GmCrDJXFpE0UCVKR++/Zk6boSFRECpZyCSTXITJH65Ji0WvquVX89l0MrM
         I7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSQYyO0J5jDt1kMA4Vqftdcrd+GYsrnUON288QLbQT0=;
        b=3W0ShwmD6FBMUkEw+N9FtU6AlOJsXq2wQwyhBJhLEUYy2A3GNiCPY/0pg9YXHAQqea
         xKfhLPIeX3d91lsdyMeOiWcqiRJcYZ2kXtIFsK947Oc9ppSHHuXmkaP2GxdFQIYvtXK2
         J0kPdfNQTWb2Epwu+OFe7aofUpAj2ljj8inG3kX8++e5L1ZyNe7ioTXtaHOApKXYjCAn
         3SjNG7W0thj16xPCBO256avlK/2nzrF4m1Rn+f6z2pcUuuLOgqTbVdb7MMS57stDhxxG
         IqEai5xZA/4cjH1Svpft9LwcRpjlvsC/s+HXmt57iSJMb++qEaEJxCcUF66L7lydZ4R9
         wrLw==
X-Gm-Message-State: AFqh2kqr6uNkhqUYt+FcyA5Fp0ilfPCgqc6gg8xRY0RmeX2oddtccmth
	zdn9/zbfadNdYyqw4Dqe8OS0k/7+L6upulZdDgY=
X-Google-Smtp-Source: AMrXdXsbfvCR0b+lvDUD8kQMsH/0Lu9tWBfqmj1CiJfDpt/1dH3jfEnDwqSEAnTJhJ78re23y7+Wsg==
X-Received: by 2002:a17:90a:917:b0:219:49c6:5385 with SMTP id n23-20020a17090a091700b0021949c65385mr52495672pjn.45.1672894734032;
        Wed, 04 Jan 2023 20:58:54 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id z21-20020a17090a8b9500b00223f495dc28sm415467pjn.14.2023.01.04.20.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 20:58:53 -0800 (PST)
Message-ID: <2b66b91d-aae1-a94a-053b-05af0d5d59a7@linaro.org>
Date: Wed, 4 Jan 2023 20:58:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 19/27] target/arm: Move common cpregs code into a
 separate file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-20-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-20-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6BaQSeGdBJ/4

On 1/4/23 13:58, Fabiano Rosas wrote:
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Extracted from:
> https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
> [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
> ---
>   target/arm/cpregs.c    | 482 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/helper.c    | 472 ----------------------------------------
>   target/arm/meson.build |   1 +
>   3 files changed, 483 insertions(+), 472 deletions(-)
>   create mode 100644 target/arm/cpregs.c

Ok, now I'd like to know what the intended difference between cpregs.c and 
cpustate-list.c.  If it were only write_cpustate_to_list and write_list_to_cpustate in the 
latter file, that might be one thing.  But get_arm_cp_reginfo definitely belongs in cpregs.c.


r~
