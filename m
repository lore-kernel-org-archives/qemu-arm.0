Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1492400lfa;
        Fri, 4 Jun 2021 14:04:47 -0700 (PDT)
X-Received: by 2002:a63:4c08:: with SMTP id z8mr6748523pga.130.1622840686545;
        Fri, 04 Jun 2021 14:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622840686; cv=none;
        d=google.com; s=arc-20160816;
        b=sbN4aicxWD4eOu17lkFhzVRkXbue1w9b2Poau3mJNNYVFy0+AW1vY7lXNacs5oBNaC
         a1IuEojITn6A8PXBG+3mGZjHb0/m8+A54lY1bm+9hQcNKiBWZZ+c4SwFU9DsiZvSiEpU
         ksCIGJI6lIUb8KzUGxhqJYVO3hrALN8yKrd7TkTVEOKgvneMp+a/X9Yc11WvKLvmD3hq
         nrmRsF0jzVEKdl05iikJ+OIlKhOV9nawnTbBJyZpmSJPdVmMza2K5Q+t54c6aAE11ice
         vQMmJjE7aIIcWSjc0PZiiuuLBHcWLF92du2GhKsK1O9DfW6Yy/OyhDaN0q60sGc1VcoG
         TBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wwVpT+trkezOcZLISnKTm3sD8U2cNa5rP9EnrW1W8LQ=;
        b=t/B8x6bQmlNNIlC3Ys1j2lBYM4sfyd0brrMBKD2BkK9VCOadFODI8lR/CYTmhgqkqa
         nSItLTJpHn3HeienzEAMorb6oBDodu+n3OfZ+D57bN43qdyU3u4GxGSkxsSlywayWad6
         YkQb+9Ry2NjQXDCYdi3fK10JBlL8fIsJ9Bn77px5K1cXgo9A4h916ou6QYbWCGTwKBd9
         cJUwLUTavdXy1QQhcpUJSK7OXIjZ7chz2cI2rkD3ypo+e7NBQP0wdd7r6vwUHij2Ml4U
         I2ykfhOA0va926dgI7BG9TKlW0tOKY+GtSA8i2+WEA6l/PCMhYTMQuanHyQvFIb4iEaf
         OszQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xAmk1+6K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u14sor1816599pgl.12.2021.06.04.14.04.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xAmk1+6K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wwVpT+trkezOcZLISnKTm3sD8U2cNa5rP9EnrW1W8LQ=;
        b=xAmk1+6KJZiNl928dz/NJtMs4c8PE6kH+Kb+OoeZHlChjDmRGq0a2kiYJlI6EW0JI/
         Z6iXga1lFvjCu8tWPLRIa+eDOFR10A17AbBWoMVEbe5aFI761/sX/tvlaRsqvAkxSDix
         Ll2F/309J4KcTlWflMaK70ppj06OU5TM9hPlg6kp6ysemdob5JOIOAbKXVn0dO8x2Nb8
         N1E6Z0IOInILFLZ7EGjXT5QMRAByVlytQvto1a4BoAYf8cV2XljhrHkwWshe59mD2xwE
         F2MozSW+rcXhiFOm1+nyjVtms9o8XG1yu/1fpECbB0fndVDYRTPBBc9X8eHOIMQVgexh
         rGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wwVpT+trkezOcZLISnKTm3sD8U2cNa5rP9EnrW1W8LQ=;
        b=se5J+JQw02rBhNfoMBTagAr6oDs5JnlHlosGf0FfFTBofUDdhm42u7a0ueRTPYEs7X
         6pWFFbw7dnySgkgKj3RsaX+UHiBZNKxctCi3zheKiIMSPjbj4nCk2jgzNVQaVFKybTSl
         p3IFNERlPSUvC781tbZGUxmgDVH81qboeaXr8D2U9Am9AXlnux8ofHOMfN+DPyAZizwy
         6fa5xsCCukuKM38OdvrZxaCBAHMGCOxm7t90YCYHe4B7x67ARuEn2dGLiESj97tAzxSR
         RGktQXD+ZJmZphmLuNysj4UmWl/q+lzzEi0dWJpBiFYzp0eYYojPdpusxMq+bDgVSoVE
         0tbQ==
X-Gm-Message-State: AOAM5329SoiyyhWCgb5ykjw2u/4Ac3fD1eAUjZ1MtjubEe6LT9EZJh9U
	PNeYTF6+kq9Mxe6gQtOJ1kUnu2uF
X-Google-Smtp-Source: ABdhPJyyzryUjPCwYCtMOuyrtFmTU+uUsTo5ScdSmua1+9jkVfRpddYLQJs9mZIgl3RDq/s201iqhw==
X-Received: by 2002:a63:4386:: with SMTP id q128mr6959727pga.397.1622840686079;
        Fri, 04 Jun 2021 14:04:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id z15sm2902611pgu.71.2021.06.04.14.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:04:45 -0700 (PDT)
Subject: Re: [PATCH v16 07/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b430cb5-b01e-8740-0507-53aa0c7c311d@linaro.org>
Date: Fri, 4 Jun 2021 14:04:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: D6CTGQejdK2X

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, only run these tests if TCG
> is built into the QEMU binary.
> 
> Suggested-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-8-philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
