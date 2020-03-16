Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp503608lfe;
        Mon, 16 Mar 2020 13:09:16 -0700 (PDT)
X-Received: by 2002:a17:90a:778a:: with SMTP id v10mr1207207pjk.135.1584389356692;
        Mon, 16 Mar 2020 13:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584389356; cv=none;
        d=google.com; s=arc-20160816;
        b=AZbx7rJijRUOG8LYf5T1iAr/K1WcEi9o8cCwimZGHRXvXXnM7QbVuS2M1K+2fNynEE
         UZ2NJduT/fvOytAagsTbjzHfRV9UQSGQT9jYyIzcE4ijGOkOlVnWxTtZRRM6sHr15NGY
         8IABG+5A8/x4f4aEK+bwk8QM7zCkRibdLg4f2S+P4MD/qJM7L/X5UkynX+3Irjua18fw
         yodyrIWi6xG7CKEm2rv3Rm3V/FugMJskNrWJQMsCixxGosgTSu0Cg3cr5FK+shUJUtRf
         mYmP3928peORxOQGdBPfAOD2BXkEPS+IPwc70SvW3Z7hkxr1rmt5X8HfaPHT2GVIlxb1
         guMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=iHWNGHwZg0b9gZmRRuZF0ElUxFU5qu0I08unHCAlUTo=;
        b=dSEdsE9R15Hph2U5LUC52kryZHl6IAAWPNzx+TyOQOfYUTwsBy1YsEVtVxuFAS3hCy
         7v7R3xhX3zRdlM7E0hKGoormQDTJnWw09NbpSEvoWjKBhFgjNAx8Ky+Uib0A7BQSwkaK
         Y5kE+sjUb6K/yfUABCkseDJA/HXW1NxUu8+zvO81MFX3Qaamg/DxTvnGxsHPYfqRx6aE
         EpS4EZB7tmQSM0FMM1QfyChFWH/ufkWvZ+IC4Fcg7OgmGCfiLZ9YVe5jIWlfx4ukEvxk
         KLz9tnKEnIDAgftiT1uZlrrCKcRJUV4IMsB1nzPOqo/6HKyoS1PeAoWhokDiJ4qNQGfb
         37aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CmE9Y6GI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g26sor1276596pfq.7.2020.03.16.13.09.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 13:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CmE9Y6GI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iHWNGHwZg0b9gZmRRuZF0ElUxFU5qu0I08unHCAlUTo=;
        b=CmE9Y6GIRrEIFvCBFwc3pmjmYPqQ/MY52zfMZfNZMTcbUXhyZGGYlCZi0eVCmBVCIP
         UjA7lYlBipTKZTVo2Gs75p76wj/pRrheSrHYLUmItGJcc+gqetzboJpaJBUaGIrMSgAN
         0FTeLyZVjdPXRhJxsu6aNeWE1kO09Ftpzk+QceM+nx+SJOTKhUlrVD1tm8IBRwwNjTPn
         h49QreqTPOmHVcyCcpZqMeAgcqRGf1qVvtY4LK0JhEN3VxFuXWoCY9XltQgKBGVzsLhg
         yvm6EGvbW3L0mo22l2kWROnd/oYRhTsA4zusQ+fQfoCFE5QZys27szf2nvMqOxshtxjM
         BWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iHWNGHwZg0b9gZmRRuZF0ElUxFU5qu0I08unHCAlUTo=;
        b=Z+FvUg1NqXKUAvHmpjT7/D3n3mqUyko4icN+D9IFBToWhtyv9UXd1GtHUInf16SEOi
         VzIMrXHjDrzzr/rAkDVPabnVACRj9lYSvXxWDWqZkfSu+eEWIe1Pzlv9RVY5WRWcOBUl
         7IsBvQrysOpOAzf5REEP5s03lG4rRCFGBbvHqI/Mn9eEQ5ECUknntXzXt1VAdGq3flph
         E0qtWK6xwxYoQdya9PlACX+UeYtT848vVDtRasIV6AX2jfiP6z+VGC4gTnMDuoCZWoql
         d1+uAFZacL3hZrs8iJo5WT885ftlNIQxtKyklOkDCPbszG+WpkopBqGh2Sf67fIJLxcX
         tbcQ==
X-Gm-Message-State: ANhLgQ3C+dY2w7LBh9K9SNcPu+n3NLX9XUGF27Lay0Da5MzIqznfRxdR
	9hSfKUVFfhKCDU1TRCHWQq5joE1f
X-Google-Smtp-Source: ADFU+vvwIq9UpPBuFyug8mpIP8LNVAnbLWqF2AkU3+pV85O/b7C5pVFS7sPIzV+bLSU23jKDsIvnSg==
X-Received: by 2002:a62:4ec4:: with SMTP id c187mr1376639pfb.223.1584389356184;
        Mon, 16 Mar 2020 13:09:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id r186sm685696pfc.181.2020.03.16.13.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 13:09:15 -0700 (PDT)
Subject: Re: [PATCH v3 09/19] target/arm: Move ARM_V7M Kconfig from hw/ to
 target/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-10-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d09210dd-2837-1fb3-2dc5-c17c2f86d908@linaro.org>
Date: Mon, 16 Mar 2020 13:09:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-10-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Wq48QBjoLXMf

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> ARM_V7M is a concept tied to the architecture. Move it to the
> target/arm/ directory to keep the hardware/architecture separation
> clearer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/Kconfig     | 3 ---
>  target/Kconfig     | 2 +-
>  target/arm/Kconfig | 2 ++
>  3 files changed, 3 insertions(+), 4 deletions(-)
>  create mode 100644 target/arm/Kconfig

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
