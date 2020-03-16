Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp491057lfe;
        Mon, 16 Mar 2020 12:57:53 -0700 (PDT)
X-Received: by 2002:a17:902:b285:: with SMTP id u5mr779860plr.208.1584388673619;
        Mon, 16 Mar 2020 12:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388673; cv=none;
        d=google.com; s=arc-20160816;
        b=R/cs/W+JR03B91sfOLd0jJtJOFqcUgUFrDrAgeGxANgSqMCGf/lWuZRGRvDCzfb/R/
         NiNRu3/kS9h+3aXqLAnyDH15qBKXUjtSQhxzHAxMT6dbKQayBuCMwNo3uItZM8vw8uIO
         Ad3oc+BOWwxotwEfYEIRwFu8S9KJqd3gx6eneLY3pbEQCORnNyfMj0ICxefIWRlcXNGd
         v0Nk4Kypo53zHDRgdjIgDIhHCdcr3KmY6V85efvj6FXKDx70+zFWEcSr0kUprjuqHpUU
         529ER8F4+eC8YNvvZqYwWABiJymfy/aI3CACc759YoRTHYTc3NTZV8LOHRS2e8W8xH3B
         arSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/ZD6IBSncn3hFN7wdM3J8776A5oAwPcS5286HEhKUro=;
        b=PA3CZwrOmNhb0+0b6uC8OJQ2T2d3ijmyymPTmmGJGQiN06sTw68I83OJ1wzZGLw4i2
         SmFiRpr+BgSeseQdiu8Z0h0C9qMQkokUGEnyGe0vtSFnuMXTGbC3PwU6d1Iv+1LMQT0d
         XJE0dmF3sDjXzvefd1vdlKziAkDLIaUslwtMAaDWWOKBaZYWvhJbDsMFAfYPP2KBXUip
         Aex9JW+qsr0VP+NSNA7qYqT1kCi/hEoCujKdM+No41fPpaQpCDF8jI2Ec/ai+cAg4dQe
         lG8324uXmgiV/HsVofCUTCe4f57U0Qj5vFrUcLtf3uKmor/qIKs8Q77cuVpLn8bf8OsG
         biZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6zk68e1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e14sor1222753pfi.27.2020.03.16.12.57.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L6zk68e1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ZD6IBSncn3hFN7wdM3J8776A5oAwPcS5286HEhKUro=;
        b=L6zk68e1i+2AgxptxWZqB+tahbSclBRmjTHT9k7BmgQbeRJtpXFgoVql/JY4saECMo
         +Tz3UYILj7ci6nVxw4AOYExOQ1HCuTC7IjuYYJ/pDFbfJ/8Gn93bYiDUUhubSs93yY2A
         CDboSlBf8/Vn5p8VSTphl8VpaNoTChZbMrD+fgDv6jflEpFmqLhRVXgNtm3bnI+fZ9OH
         +g54ozdmT9CoMZ43w1f8W3Rw30Ve3JFzSyTCeAxHoYpv1FE4hbFhC50twXHKV7IgkqhX
         2GBGr/18eVmWaLwOTf6FuwTPcKI7LY2yhFOG963t11jEdL/4AhdC62Dvq9FpAdEVuVX2
         7F8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/ZD6IBSncn3hFN7wdM3J8776A5oAwPcS5286HEhKUro=;
        b=RiUXyeVeZQJxLxOeVEZpBmmAMDADhRE+f5631Hj6jWaL8+IlgeuuMZxETi4ysqmJsS
         g0wjNt2mV0k/iseCTLRGMuuJFMmSj8ukEJ9CtCa8Yc76e4wMttcA5m3e7LvtWO0Qy/hf
         V25+0iewtM6u0tssBb1W8jyNocNxu2CxUa7JqifyS+XKfilNdQJze/oQ75rKKJL7yQ71
         pPp2+BWydiavefLKQN87HIC7SxPRkgIJMrEGsIVvqggsP/yjetikwDnVIW5l/n4oNQCZ
         y4p+R6B5VfHM2y7UEk5qhfd5H/hWhDNSHcLAVs9rYZ3klmf0nyLgFR3F13raPn1NwUvy
         jQPw==
X-Gm-Message-State: ANhLgQ04jhD7lma/fz7u8Kq72ha6irJYg6SufVt+UgPAHoIiGnx9RFRr
	vib1nFZYs2Dyj9XRE6yvNV5IQ8r2rUXHEA==
X-Google-Smtp-Source: ADFU+vtAxoh3oD0q0HO9joInGqS1LhMAVfwaEPgsfQZbtnWC293MC0TDFomQja9Ca3QFZvEm1fy0/g==
X-Received: by 2002:a62:e505:: with SMTP id n5mr1351882pff.189.1584388673109;
        Mon, 16 Mar 2020 12:57:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id mq6sm575473pjb.38.2020.03.16.12.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:57:52 -0700 (PDT)
Subject: Re: [PATCH v3 14/19] target/arm: Restrict ARMv7 M-profile cpus to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-15-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b3493eb-2e15-a5a1-5034-785345420a89@linaro.org>
Date: Mon, 16 Mar 2020 12:57:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2hKBwdKr5OUc

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +static void arm_v7m_cpu_register_types(void)
> +{
> +    const ARMCPUInfo *info = arm_v7m_cpus;
> +
> +    while (info->name) {
> +        arm_cpu_register(info);
> +        info++;
> +    }
> +}

Likewise wrt ARRAY_SIZE, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
