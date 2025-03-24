Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2220243njc;
        Mon, 24 Mar 2025 13:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU32cfopHTaB89wGfkuZhxtnhS9iff85v3Z57iW46NvXXugUIUQ2ols6s4ny01FiWPPK8bjlufjq/Oz7w==@linaro.org
X-Received: by 2002:a17:902:fc4b:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22780c689f7mr268127875ad.5.1742849692884;
        Mon, 24 Mar 2025 13:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742849692; cv=none;
        d=google.com; s=arc-20240605;
        b=DPZMikEmxnyFtON80csWQnDbrSr+d/mAEVvn+ZLh0Ce1EIhnwzaBobrwPd1sic/rQc
         kCwBy3iyMLs7xeEst6O2vXrZTzh+kOK2cM1LhFmagXVrLh2GgQMxJrlnXbHHLavCn3Tc
         AO47Y9W8mejAvYn1dWVNM+BQTrARCZS5urcMdbJyPUxZiDYOCxyKvWNfrtqJ+Rdow14c
         JeF837f2Mx9tTeTUm4v3/g/xyyh8IiZr3ckFpCcZQpdkeRBfp7H1hbth28Svp6sHu5f5
         6YH9gUSyvUv+XsRxeh/4VcOWEVu7WuML+2GrF0s9bgtc2FmM5WOlCaYZDkWvDwQKnxIL
         ypLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IjcUgPK06/izKZfVvH05gncc+9DrDMjLcc2e2JeXhy0=;
        fh=i8uw7f/c2ugkErosfD3pCsj8XQ4/EizqG7t/t2MH7rA=;
        b=MMPld3qwAPlg/gx3c+eIgq/vBbmZ4Qv9nKpAzIi6NaxTcCKPn0O7U3130qPqEHaM61
         x+bIvLncx/ErXCH4F0HBrNeqmOk8aA+fCtCWDJ2/2HSgkO9yGmD3STm3CD/mWq7kBhnV
         0AVZSWvm26msW89aqPmXtyffQWBp/PcfVcnIpOlR+Lvs7x/HFZODx697a8Tv7pA757UH
         w4NujEjhzi4eJ25mEYaNZA2sWtusMcS12S6dfWX4QBs3MSO1nnjK2MEabP8KoITFHXHv
         cm5gWmlC5A8BUWya4yy/+bFgjEdB8MRz+iyCr+7KB4i+EHIaRrColjuHa9y/hP2wschB
         vFvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HrGSWR3J;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905fc9070sor4094214b3a.3.2025.03.24.13.54.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 13:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HrGSWR3J;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742849692; x=1743454492; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjcUgPK06/izKZfVvH05gncc+9DrDMjLcc2e2JeXhy0=;
        b=HrGSWR3JP/LZKgC6TX16jja1gm1ckHZShwZuh0qwtybMneFBUf5WMxDLU3qL3lZ13Y
         kHx/Ww+FRgLAaWQta38LOXg9vFZcbpCAc+KlVaIX9dWN8ONNjNvaImCCLA7rANJyHmlk
         EXyBKTbWWww2Ly1kzkx8/KL90+vsNQ9owzcfIlzahRiyc62ruAf+yI8sqlD9p4EWtd1z
         UqTTozDYBqd2Ik9u0yqPVwpFCt9u+2y/Dst5oJcnXT+SifCcUtqJnUemv4j1OZFJK+bK
         /DCW/5k2uKzbBmxHxMbH4ZKwyhQbvj1HSyHu+B78yxNKdLHkoNFBCbSgc/aSh0sW74YA
         T+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742849692; x=1743454492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjcUgPK06/izKZfVvH05gncc+9DrDMjLcc2e2JeXhy0=;
        b=CgqkttEbBuo0SPJ6+SD3zDBIX+le5TtpFIoBCAsV2/3y4rNkKIx4w8V8CaVWCEfMGU
         SkbXyA/ycTRmxksxqcsVi/6//N4WXTaIYQ2oyV3J3GjOBfenLjb5s9+7toIrOgzO/duy
         /Ycd8zbfq+4z89RtVwBB3fofa6CCNU2Q8Xvq12kQdiDDoxNjMnfC9OVNJB6g2gnmBfcm
         XCuHGAzHosmukyyhVqrsys8mK02yVQJSlysgAIqEi2jGTMut1HpB3FD7aX5qqWpd0Fvg
         /jn1fwNL2eOhhCCvlpQCjkeSNGaedJe8vWDcaclULljLJLCMJ9jcgP0DzYQnQnXjag9G
         96vQ==
X-Forwarded-Encrypted: i=1; AJvYcCULXSX8AYSJFrJ6gLy9Qlk93ov15elMEPyzgnng7SndTw8iF8qKFUPlGkC+G4GrlBg2YlrJDacp+qcvXw==@linaro.org
X-Gm-Message-State: AOJu0YyBSxKDwMsGamfNLYZnFUoznk8idtbV626lXUUif7bZ4CBtMPsi
	ma3AAzwtSO3tJbFCkK2Qaquwc3q1jNa/BpDWx9Wkr8WgOb/TARv5Cr2dZonCE5rSQQ==
X-Gm-Gg: ASbGncsPNU8lZmfnh5QIMRR1EfxcWCwwb3E+gbZqKA9zg2uDta8zlOhU7Gqgb5x87JE
	bYH3N1IsVIZsYqDktUJKlHR3bPIlgrRlXn72kuuUFeU1wytLJjGw5Hx0EUfzgdvWkhLJzRB2fBL
	fqZ9c26bPORKjTHVfHxH/7yYOF+VgxZHXQLIUvyHOtptBtew7hED8Ok1ry5DQnC4uE6GpTQWND+
	YvGpXaVY+TW6zXyi/4voVnc7Z0vAGehm7IwTyoT7UlQDJ7J2gINxFZBfO0MGGo9JmAQN3Omqi1g
	9/BzvhXvHnoxB2jE1/z78V6ttRtimbWseHAn21gC+mGtsSOXa5VLstFCGGKmCCVFxKz3
X-Google-Smtp-Source: AGHT+IGJzNx9IZ5b2eNR9WIGYzP1pk30sz3PbrZFL+zU4w+xOKfS1nIh78+kz3DyaBP6HUlThar6YQ==
X-Received: by 2002:a05:6a20:c901:b0:1f3:345e:4054 with SMTP id adf61e73a8af0-1fe42f32676mr25724414637.14.1742849692427;
        Mon, 24 Mar 2025 13:54:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27db8e5sm7724126a12.14.2025.03.24.13.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 13:54:51 -0700 (PDT)
Message-ID: <6a3f794d-3403-4e80-8fd4-9449a78a4ceb@linaro.org>
Date: Mon, 24 Mar 2025 13:54:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/30] exec/cpu-all: remove BSWAP_NEEDED
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-2-pierrick.bouvier@linaro.org>
 <61f1bc3a-abcd-4cf5-9d56-1132c8fc3ba7@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <61f1bc3a-abcd-4cf5-9d56-1132c8fc3ba7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NSs7NaI96O4B

On 3/23/25 12:26, Richard Henderson wrote:
> On 3/20/25 15:29, Pierrick Bouvier wrote:
>> This identifier is poisoned, so it can't be used from common code
>> anyway. We replace all occurrences with its definition directly.
>>
>> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
>> ---
>>    include/exec/cpu-all.h    | 12 ------------
>>    linux-user/syscall_defs.h |  2 +-
>>    bsd-user/elfload.c        |  6 +++---
>>    hw/ppc/mac_newworld.c     |  4 +---
>>    hw/ppc/mac_oldworld.c     |  4 +---
>>    hw/sparc/sun4m.c          |  6 +-----
>>    hw/sparc64/sun4u.c        |  6 +-----
>>    linux-user/elfload.c      |  8 ++++----
>>    8 files changed, 12 insertions(+), 36 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~

For information, this patch was already merged (by Paolo who cleanup 
bswap_needed from hw/*).
