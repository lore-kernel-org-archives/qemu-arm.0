Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp523076ejl;
        Wed, 15 May 2024 02:47:34 -0700 (PDT)
X-Received: by 2002:adf:f705:0:b0:34d:b9b2:faf7 with SMTP id ffacd0b85a97d-3504a20b0bcmr10713085f8f.0.1715766454547;
        Wed, 15 May 2024 02:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715766454; cv=none;
        d=google.com; s=arc-20160816;
        b=p8uvYK0KsngdcE0+NzLZnrDM3fYOeQyQ8JHlytcTjE210JFgQ1xpbuS5n9GzO2Eszt
         OsT1uuFZLWTQG5R3UKKpCHWCklA6YnLpgBH3jVZH0hZs5QmcQy6+CEJ2/O1xeSidrGKV
         v6uEQ437GRaOKnjkz+IlJcGSD19P3ek/xmhv8MY1XZIhFDAFo8hLYy92h8r0mJetqEPu
         T9++XMBiidMtG75r0NLPuxLim2+BBhKmjKueJx4WTslGz/yxyOwHQvaAzd/ligoz/IW1
         jKrISm4lIjC/OnOPmpThPSzKuSgXDXbx3TwVVJQRrBOTsHaPzJ5frq9pZ9jBdFuKIj7U
         njMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=z2fkCCi5OTlHU++n9KvsFlA4A48en9qPiK/ktEXSDJM=;
        fh=Cs/fbuvFiMkLdTGG5mnddmq74k2WmtJg3cMNRFm0Bsg=;
        b=yEj1TmMchHVGCoG48UI5O6+lD04gvCbtJiygjSDrSqHbQodNLTmjzjHtQI6Pm/6ofB
         XuGl4d1AHw1WMkDVwtExe8I0yf8tn8V4H+53fwi6NBzLpdCYZvvBmsFsEUECz7OzEEYT
         Fyx2Ew8jz9ZcrCcgMLO67OmlRjX0awyaJlSIBkqqV3X18lVzUsO08i3AmU/DVtfU0uEJ
         VuzcogcsDYcIyB6vyfAvGs58U3XvYZqYuKWWpasMUWjojfGOm4ANl7Vs0kzChO/vvtvj
         2VFBPmVI/ioAHgEtYDSu78npYLzAPq3fR1o1gtwJ2d+Z4UhMiCCspFmpyTB+qhV72k9T
         61IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5YImsuo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3502bbe1195sor3167473f8f.5.2024.05.15.02.47.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 May 2024 02:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5YImsuo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715766453; x=1716371253; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2fkCCi5OTlHU++n9KvsFlA4A48en9qPiK/ktEXSDJM=;
        b=n5YImsuoYmGQrjocGCS+nb/PnGGwMR5mERJax8N70NzHBbfoRA1e32XZkEezTTF1c7
         Mlq/7G9oSc9GncUPj5Bam8u//tS46UHMCdyeZru3dXq5K/EnQTrc0jjKXU1IcWXWH+Sj
         jV9PY4o73CDL7ercep1qG6vLaGVOkyjIzfZ+s/xXm1Oy4xFyGHL0G/j8zz3oXUqvIQdE
         Imjz4FvE+iFr8D1pXyw/dGXCEkpNYD971aQKvBug+wQcS9ZgAbpSvqVf/SLh9IEYURO2
         pJIM/eQL3c7bDo53PeNxOi3R0aCkwHm6+dFLH746ZjNsRVVy6iW1xALJJTwaRzxmt2nB
         zcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715766453; x=1716371253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2fkCCi5OTlHU++n9KvsFlA4A48en9qPiK/ktEXSDJM=;
        b=I8qH3gdkHh1CIcd4IXfmp7xw3zORqOBva/kYEhPi7OXrR9qZwyIAVP98+oL+7bipTp
         nC36WwwNtceirGUUOwydCaDAXDto/QleC7a2wf9yOidZoZZjNpcvi84GUjoqd7634l9w
         QS82j6i/OccZmMKWFxgpV7R9NRJL5G7gxhu271AxCEj+dKMi7YCpnvxtXsKHEWWvi/az
         hDnTgwqi2/ghBAOvnNQzxZYP6hKQ3X4klMpvco3fkK8VweLNvTgHDHQWM+mYa4nSUQo5
         ZAaIhCsbhZ000g93oLwwAZZi+JgHv0/HzOpNkXH74iCxwp5USqOzQ1JzxZQ4ZbZvN38+
         7l7g==
X-Gm-Message-State: AOJu0YzQ0+Z76Gr0vkUSXjD0Db+JOa+mkcPIEUC0EvQMyYr2nSgJnZct
	ss2ENyTZYFIP0+e9etPPZ8MDaKLrow2uQqEaL6m9e/0SlWyi7aLefuYAx2Z9a/w/nfKx+ySguwr
	bYqY=
X-Google-Smtp-Source: AGHT+IE0kuQH5bzp0YecBgnoC7uo/jlGSzN+A29sDXKOoDbwHZ2jvcOWwn6QGw/Lx9y1EGdLmube6Q==
X-Received: by 2002:a05:6000:12d0:b0:34d:bbaf:27cf with SMTP id ffacd0b85a97d-3504a96a4b7mr10708705f8f.51.1715766453549;
        Wed, 15 May 2024 02:47:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.91.1.102] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a8454sm15963982f8f.56.2024.05.15.02.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 02:47:33 -0700 (PDT)
Message-ID: <28c98f1c-835c-4767-aa8f-44161f5ca744@linaro.org>
Date: Wed, 15 May 2024 11:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] plugins: extract cpu_index generate
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
 <20240514174253.694591-11-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240514174253.694591-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LDyGd9sXU0j4

On 14/5/24 19:42, Alex Bennée wrote:
> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> Factorizes function to access current cpu index for a given vcpu.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Message-Id: <20240502211522.346467-9-pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
