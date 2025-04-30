Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1172221njm;
        Wed, 30 Apr 2025 12:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjLhaeR6x1cFSQaUJYFKvctjziOUbXX+95c/Id8MgCU32IripKOQFoXVAPOPjy14WxNM2IbdJPkJhVug==@linaro.org
X-Received: by 2002:a05:6a00:1947:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-740477a909fmr143760b3a.13.1746039979514;
        Wed, 30 Apr 2025 12:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746039979; cv=none;
        d=google.com; s=arc-20240605;
        b=fYGUHsxzzVspfMiPwnqb1y4UWy8Km9CpqUgwGmLkn2OfGiymEDluZGrbs4E2BdC1Wu
         dPoWOYKlVONu9ICYAH8pb8zZlt0T+WcKHhsKfk/cEaimkPf+bqVzVT5XJz7H2zhkmSTQ
         FhAqGXcXqQBI+TKlLiv8KQgFRO1mHzgvy3f6p8VfIEtmzuRn/o9C3eg6qfJ+AW9xsbA2
         /ZydhTFDcDHHiM6QGpFMY+AJxnW8L5cqslsz6Dzwm33zlUZ6+IcEO3yihf4Q0fKRhyAg
         q0C7HgBboB+FHbs8ViOF0C+0MvLnPssxprO8u/lQYP3WzO4vQXx/kcNQ6TCtFXI3/P9i
         dL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OlVE7gl+CUw4uBk5E7cv6Cwlsk+3Ly8aETY/UIpTw9M=;
        fh=1SXeeDpXL5EyjEeZJP5nXYGdPJQAnsZ3Xz91+sq6Ebk=;
        b=C3AzUFU5HNDAfl1tXd3x/qNEyCzX8rkglCW8lDvIfCUv6sZBoKYjYAkWim6ZhR+/Gt
         sKB73UdF4Bys8vs7yVNbhNDdd2CY/cqnXKFlHHjTvhef8lJSlzvFkbdsT4lsZ2Es4UEj
         8Mx3n8zniLHXGJ4HgCNwqJnlNSVfKDTBmEV9t8nrTddG/gpK3FCGUUcvHnRxrt6vUBT3
         yOf4/MSZlymGQtl++sw4shw3nNOEmgaPcplSYFNj7lYHGN1Pw+NXDC8av7qGVLX/R/MM
         mmvd5VZhQm/rxpCYEuSqCV45AivZECgepvwyEnGlrwtNK+ByJtjb6XWgMHoU5nwR4JlS
         /d4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GPeaINDu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e2463dcedsor7990586b3a.0.2025.04.30.12.06.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 12:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GPeaINDu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746039979; x=1746644779; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlVE7gl+CUw4uBk5E7cv6Cwlsk+3Ly8aETY/UIpTw9M=;
        b=GPeaINDuLuLACyaadnPMHgtp0FuplYhsyVkQQRO52nxuEgWYxF8S4GrOeoNH2HKa0t
         tOShGZVDH/rLL35gauKUgLnoa09/P2CRrBM1qSmO7cSgT5cihv6yUb5jxHP7gEmNg30o
         dqCLg1Fg32sYOWYPE8K0rSKVC+GoIr54ibN0ks3Dits9INJ2DdV0VzlU5YXQX4VKhYf4
         6zE2DXjk7jICM193FGMSsxXbZhMQKA90ucx7S0pOd6dUQWP5f/9MIZK20F4GvLYLB92/
         rOT4Wu+oD1f+r45FHa+46OOyfcU5l7mgPl21bwoxkmCETW0McJc+7+u6yKDKf56eD3KB
         NmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039979; x=1746644779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlVE7gl+CUw4uBk5E7cv6Cwlsk+3Ly8aETY/UIpTw9M=;
        b=rbhVJ65X6oYNXf/0gmxAHRbyMxIDvCIpX9P1f/W+q28r9AGJTpsAD/cOQ9DEWka52j
         BgOWeFcBl8yEr6vYOYcS4D/tdj7tRCGA+w16LZ3+CMxgedTxiWK9c6XaoKCcamURsCn7
         OaOybCGU2O8TuWavp1Ofzm7b+CaO1Vd/ZojAzDNnICYyXwx4ErCjkY1gxllWIbxAPY07
         KChI/xnK1Njdnb85fUN3F0h5KUq4mcnBVjngP6S17wEK9NppusgqOcAu1gpH1ApWb2Dj
         gY18AyIwNFE+bWUeOaPap4awNCs2uiePj1C2Ybq/i1Sn2lIa56vhrePvzuHs69w5Ls/N
         5+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXVky1BUewe+5Q7xTwdDJzlRYIlHJuydGkAOE+TgXANlwdZrBi6fbwnMh1Ih/NaOzTlOLxO9e5jWOAmg==@linaro.org
X-Gm-Message-State: AOJu0YxsykDnvmJfCi0N6V8gnZyFswZTvdG1c/XBc5AFbLk7dIfyQkMW
	8swBcVW2kljrUQpZxAEa+c2d990/PjtMk9/ijXGoFAVfPuIkHu/GYtSmwa8ZifdtMg==
X-Gm-Gg: ASbGncvwjE9fr36pqoFzMeK0TKdnGNzEwl6ueVjeB0QJzDsFozWnCzF9pEV/NySzbgV
	cU0gy404QrBds9O+BRiVByzmATy125woZoZyT4Rlvzs6bpK5JYttPFhyTavG0Quhnzp7nkmjg5n
	Bm/JSqT+Gp1D38Q0uNlByNZZSiQYAogxaio8JiFgo5/cGhYxOqsvgMTnWjFTwatg6tx2aOBTUFB
	9ebvdFOVd6DJuDwGnVGQn+IIJXCDkW49OW5y1PnQ+qu+xadWn+2IYzDWLifd2i5zhJAyIObYg/Q
	eZGg4S3JrGQzbrAiKA0bBEidnibh5MIXQdyk9Ak4KEx9HTxaxFoLtA==
X-Google-Smtp-Source: AGHT+IGj5B6+DB2NaW+I5mAxRhlLboxIrcBkEvFW6E9iaGZb6qpzUxdVqI+SAgAnfIBrFAywlTIIXQ==
X-Received: by 2002:a05:6a21:1511:b0:203:becd:f9ce with SMTP id adf61e73a8af0-20ba8e4bbe9mr461533637.39.1746039979042;
        Wed, 30 Apr 2025 12:06:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7ec3116sm11157941a12.31.2025.04.30.12.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 12:06:18 -0700 (PDT)
Message-ID: <23d84ae9-5409-4022-a65b-0b0ffa5ff51a@linaro.org>
Date: Wed, 30 Apr 2025 12:06:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] target/arm/cpu: compile file twice (user,
 system) only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-12-pierrick.bouvier@linaro.org>
 <e77b5c7d-5f6b-46e8-ad68-207ae87a07dc@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <e77b5c7d-5f6b-46e8-ad68-207ae87a07dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ISRVlsPF1e5a

On 4/30/25 11:50 AM, Richard Henderson wrote:
> On 4/30/25 07:58, Pierrick Bouvier wrote:
>> +arm_common_system_ss.add(files('cpu.c'), capstone)
> 
> I wonder if we should inherit these dependencies from common_ss or system_ss?
>

I ran into the same issue when working on hw/arm [1], and didn't really 
look for a way to do this from main meson.build.
I thought that it's a good thing to document those kind of dependencies 
next to the sources who depend on them, so I didn't dig too much.
That said, I'm not opposed to it if you feel your approach is better.

[1] hw/arm/meson.build
-arm_ss.add(files('boot.c'))
+arm_common_ss.add(fdt, files('boot.c'))
-arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
+arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, 
files('musicpal.c')])

> 
> r~
