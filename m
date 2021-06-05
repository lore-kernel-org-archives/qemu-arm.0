Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2131112lfa;
        Sat, 5 Jun 2021 09:32:28 -0700 (PDT)
X-Received: by 2002:a17:90a:d590:: with SMTP id v16mr10955356pju.205.1622910748780;
        Sat, 05 Jun 2021 09:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622910748; cv=none;
        d=google.com; s=arc-20160816;
        b=UHoc47/CSsr071P5qvApeAkjEYkuVq7RWOynf8FFI+/zSHD4/7+lRRss0VmZZ5ELr3
         k8SPSbn2QFnUqvhbFsC+PlxV2jGmmXv6Ufoebyi2grE3f+Z9Vf5paDhQVcohMo1ttWgz
         Z5Yk3Ju1m47oyx1WDk7DDoBCqwvbIqL2EjGm/UoJkLzTBTzpCgUcQuRdYajoQ0OwdKlY
         99jiX3l6qoBBFYavxMlCmveoHRPEW8cwaNtTLoO+oND3vUGCReLLPPa0K4tLyuZBLaH3
         BPWmDV2hO2ogrbFcf+9fdtCRnB16IyWuWpB/n91syPzqQGHBSa4Nmh7SxZDytuuD7FVb
         yBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gG4e7Uh9+IJ15/BlXfh6KJGlCMUHqhEZ3fJEfi6uFqY=;
        b=An8nJpy5gpllr4VwqY/ZIvC6HIS7iEVhVukYEXf6dofY0/8YWvr5qpXaUz/i5sbgrS
         7pDqhOMlptYv3twFCdRKwqTU/UFDCDhAY1vUw64lYQZPfumuzOmUFQV3OQ2CdHOuyyjw
         R3tvu2rGuVyjTPpH8vfGy9NHmeXnDApcGKHwe3D0DoachUPSUAursY4nZoj1xdUds/91
         eNb5bYg6KWzqwYuQMHbYQp6I0HIYstVCLeS+dM3PnTDVipsZIv8pvzcfBuCGwE/tysa6
         RENRm4pEUTYXmQ4Av1sY1mDuiEhrdIca3q2bR0YxVGuBV8yWbcEtTa+Zs+9jKPhHDjOU
         YByg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5t6RPPo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gb4sor1878005pjb.39.2021.06.05.09.32.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 09:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o5t6RPPo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gG4e7Uh9+IJ15/BlXfh6KJGlCMUHqhEZ3fJEfi6uFqY=;
        b=o5t6RPPo+F2Lm0GOQZKqYa0kwD/gJUycTnvCy3jCthHKqofSRemjH7V4SU03HFoy4m
         eDtW65SCHfIFqC4gMKEL3HQ5xhWCFEvPr5P7EAtTIYxjZUl9UDJ3pgsghe+1QAAXENL2
         tKd+v5DPwA58+F5lOf6dyZKQkgv4GetFkGryZbnUiUw+xxRZCUPkvXUpuqnl3iNauJRk
         lw5UkroEViGc5K077ZU45Z7iXI1UTNSdbXiLY20xqujrAwJieX62/MGthCbDIfo6K38J
         7rsdSB8cyZX0qypN0dM8qaFnZaOcybH6qD0bgip6d/bnkMxf5P3Qu12J2gkrP+6FJ9us
         6Enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gG4e7Uh9+IJ15/BlXfh6KJGlCMUHqhEZ3fJEfi6uFqY=;
        b=b7pk8HT+VkMsIWuVl8gpsMgZYNtbjVIpnJ5crF8/F8nff4OTZ1ECjy22JPXOnaZW1B
         Fyy4NVaQ0o+KgYbQX7wFy/rWAOn9NCxnH6176lbs26kNgnlVDPNCiBvk02FSvI8A68iS
         qyzYgexIgYmxLFzX/bLEXY67ogSxqs9jPfvDgdGkjQNot3heQRxHJGzIhC0zVyErmHoh
         P+jo9Ey2dNCLYlrRL/8DpzsZjWVRdQECLQuF/Tm2ppnxRbdE/bFznEOpdHnBpyVvTIuf
         8AwsebmQUYvzbaqHDDQQ/j6oRGafoK970zAxd0qkFwmM1TSDWsIaHUYoMXd5DxDK+niU
         LYhQ==
X-Gm-Message-State: AOAM530y5ys50wy30EZ5oJjHUdzPX6WycFm72Ua9/twnSNeSZqeKr6Wb
	j1oS+Kj+Mu/12iTm29xZN9oEhEPW
X-Google-Smtp-Source: ABdhPJzaDbTcHf4mMZTidtz11rlPIgPln1X4/ps+cYBs2SqMBHuGQs5af6C8wn6cg67d+XBq4XRznw==
X-Received: by 2002:a17:90a:de07:: with SMTP id m7mr23301197pjv.100.1622910748376;
        Sat, 05 Jun 2021 09:32:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id s23sm7248663pjg.15.2021.06.05.09.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 09:32:28 -0700 (PDT)
Subject: Re: [PATCH v16 66/99] tests: do not run qom-test on all machines for
 ARM KVM-only
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-67-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb4a45cc-8cd8-b5dd-a767-50a4e17d9cd3@linaro.org>
Date: Sat, 5 Jun 2021 09:32:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-67-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bdw/LXvsQ6Eu

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/qom-test.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

Similarly, qtest_has_accel.

r~
