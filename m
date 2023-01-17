Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2521096ejc;
        Tue, 17 Jan 2023 08:29:20 -0800 (PST)
X-Received: by 2002:a05:600c:5024:b0:3db:392:ecee with SMTP id n36-20020a05600c502400b003db0392eceemr4340605wmr.31.1673972960368;
        Tue, 17 Jan 2023 08:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673972960; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+OXGH7dyCbVJ/ejkgJVePOEL3laVqZUQtIWllT+yDFtEBp5pJLD96shKwkq9T9G56
         yQFb3rPttwEXidTtoBByhwKK7RhRqQJzDlP+jAQLa1M45IaJiJCy8qFPJmhWyKzfpgu0
         yUTh0khchOTaaT67n0OnjcQDHJl1wDCQciM2s1idNzww5hfwwImpGXp2bmPwkeFXGx74
         8/N6HixH2c1TLWL8/l0g5zVfh3iMj4XmTIrC0GGjIwbXQfDsrUZuo8Da87YOM2fSwrj/
         SKor6QwRoA58h/Wnd+05Gefvs4/jRP6lF9Xp8+p8/y6xEvnXtxop8kMpsFIJHNKw7jC5
         RQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8MX19P6jeQr9byWhI+kpLj7E59PsC9QOZctgmyipVPM=;
        b=G/Vp2B5/R5EnG/jEDY2PEv3GSZNcLadcuvZWlD86txp6u4jVQU32s5bSdoPn3bgudY
         Pb2WB6QVC+poPu0n5QgSC0rV3uE13Xjjp6Y+vPlbXgMk6gJcX4s3FmgqtLGSiN+JrbDg
         WwibKJL1WZZbi9MV68FJRTEP1H+yHlUM2FMqcBcdRg13I8UUObwAbVvANoIyJ6cSoEl+
         hHe/277KKGj6r4Yl3XWeK4py4QX1UygZtGcSr+ZbYcsobGIIx4rnsYyETToCtJ79eG81
         6o1kNYDlywS0kGJkNsu3CVDmsalxD1YTlqRMKS3YmuLDc6wxclkuofglv0MAIBTBPpGp
         DRaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GaoaYH3g;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m17-20020a7bce11000000b003d1ff8c586csor11557966wmc.26.2023.01.17.08.29.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:29:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GaoaYH3g;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MX19P6jeQr9byWhI+kpLj7E59PsC9QOZctgmyipVPM=;
        b=GaoaYH3gSTdsV4HZG2XrCKgwP1l3T+klcVxz0driAJUiU60Z4QVZwu4vvbBdKDQLYb
         KkUp+oiqBBUAGBRhd1CEANeNYD2c9QMCUyjXy9Dw960EHMDLoy0VEe7tF4ROiH623FHu
         MTkhUdyP/I3RHvRandhXmHHlNFYvnnHr/ZuAfQdt1E4sIdcdpg+sktZVj+OaMWI77tiG
         rzXlcSV8uF3WPBWWTJibIKcsEFJpOsMjPnCijAjSBH99xYI1VCc91bUZoC0bnuw1xCLC
         YeXoBExUnJ5+zMnx2Sienv49JY/Uy92D/wngJnWD1TRaCjv2B+kpO50j6PxvLqrsRsJx
         XsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MX19P6jeQr9byWhI+kpLj7E59PsC9QOZctgmyipVPM=;
        b=z9G5Ev41jt3+SjpE4ZLIcVTjWnpD41s19EIl56eAAHRXTMpf9AwDnZ2Ra7kxxLyZy6
         J7sLz84aFADFSyhPEsSyMkzmAQV7KS8PnwI7OkKC/+jHcAKePhm2X/j+zQnQu8tfIbpw
         AwwvtbL8cu5BTMv3hhGHUQd455B2TSMZ90RVtgCh9jcKEtAEwLK9+jS5/fazZtckCYuV
         cLnrXahCAScBaZR08IMdNA+93MjJllh2DVV4GjpZBttucnr2d6JAtOJp7+4ODWDpfthJ
         AyRyv7Rb3CuoazI6rTvGNSzLbz79ir2YXSWd70LD88Ky6iyMk28ZD+3dJ15kdrfRVx6a
         4fRQ==
X-Gm-Message-State: AFqh2koj2MQGk66OaivFyhdxry90aZMOkPJjd2/EiHMLKS98C3ZZvRYb
	8LgQ5+7B5k7yrWjuOH/I14IkZecz
X-Google-Smtp-Source: AMrXdXuJ16L1R8HIlXJOrq/6kAZAI8SlYr+yyqo75aDgEAqSqnMBRe13n7Z1zAWM/+KJaT5LMhuvDw==
X-Received: by 2002:a05:600c:4a2a:b0:3d9:f37e:2acb with SMTP id c42-20020a05600c4a2a00b003d9f37e2acbmr12361291wmp.20.1673972960136;
        Tue, 17 Jan 2023 08:29:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c1c1400b003daf89e01d3sm8900993wms.11.2023.01.17.08.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:29:19 -0800 (PST)
Message-ID: <06ec19da-b2f6-b3bb-7796-09e3793cc1cf@linaro.org>
Date: Tue, 17 Jan 2023 17:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 16/28] cpu-defs.h: Expose CPUTLBEntryFull to
 non-TCG code
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-17-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-17-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6+6T4Fud+oi7

On 13/1/23 15:04, Fabiano Rosas wrote:
> This struct has no dependencies on TCG code and it is being used in
> target/arm/ptw.c to simplify the passing around of page table walk
> results. Those routines can be reached by KVM code via the gdbstub
> breakpoint code, so take the structure out of CONFIG_TCG to make it
> visible when building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-defs.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

