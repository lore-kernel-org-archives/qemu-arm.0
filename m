Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1499428lfa;
        Fri, 4 Jun 2021 14:15:28 -0700 (PDT)
X-Received: by 2002:a17:902:9b8b:b029:ee:bb74:7d46 with SMTP id y11-20020a1709029b8bb02900eebb747d46mr6222861plp.65.1622841327966;
        Fri, 04 Jun 2021 14:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622841327; cv=none;
        d=google.com; s=arc-20160816;
        b=nMHmGcKjsIrlUY4EHGK5boiKGIdQDahsdtOQUp+t2TIaB09htCB4wxTUo/ZhsMZdcC
         Old4pgRIdGe0rdsXECPc9La+9jZ1cjJ6hDbMc23TdKHREFkSlMcbjPgxJZORsTxC1W2q
         CHudgdOCyiga5vkiJQ6lZzWbTbo6+Xz7kyPkvmFlbKHddPLUp1ypHlEvXMR4Xm7IOkjO
         1sJi+6BG/W2+WKGQexWwZCmSN/CbqJeUkaoygXO9rBE+yXAUodXcpU3JrVaUOe/eHRsN
         c4YBbnpEHh0hcfK5d6a0KU+GUelWY4L0YlZ6RD5KnLMgMm4gVQKvwF3Oe2L1HU7zan/1
         AwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SxA1KrB5NU5q226UHX6i7G6cMoM5NJ78Uikrd3XcY4k=;
        b=FvTESKVDp6aj92K2767JiiA+2zcm1Vz5BMZCVnBcyn8n64/G4JK61lbNzWUqLYrrm6
         KAEYO9V/EJqdRgB9q7/hJuYDhXinBTLif1oMSHZBMQg7WH6DPAVk+RRA6wET9kYHBdw6
         F8/qFE5LB3F/in/WkePe+4JzfSHZvTv/oSgGLnYe0eBKG2xWejNwDJwCPzrmcj77+Cpg
         FMOSSTUEQAAc0+ututcrS5/ae8BQ0pXzSrF8GosiPGFOMlw4+qNYgO+ybo4Yyf9g1ULK
         fyb8n+fJAzEFFXhoUj/RNwP7yaNwx36+lqcDUr2su+jqeEvcI31kB/e3cETrVD3SkYNi
         7svg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daoFys+8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s38sor1833345pgm.81.2021.06.04.14.15.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daoFys+8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SxA1KrB5NU5q226UHX6i7G6cMoM5NJ78Uikrd3XcY4k=;
        b=daoFys+8/euf1akcd85CTHrBKx6ENQvyygOJ/HiCV5P3lgL6wT7Go6FZYaNFuLElnQ
         tkIVUPAwnSGyzKCtOB370RjipqIHdorTQNbtA5Ut3+hfx71CyhRffXA8GRJGPi46gWwS
         aYv9HmA8kL8kqLYSqOlc4tSGXztmytfdvCK0SSWEeByY345XFJ9oy/eHpCgssN+39n8j
         /wIh01nN14jDHKfyQ5Fu4dFjRRz5CgvgC6kiOmJANIyV9z0IofJ7uGBmg3VdWRHWlWg7
         hZnP798PYx3rv6DFS4HApLZ2tPTP9O/Bo+Gof4QO0g1nx493T7YOmeycfePqiAOB9nvb
         AF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SxA1KrB5NU5q226UHX6i7G6cMoM5NJ78Uikrd3XcY4k=;
        b=EcNTw/eHwH0FWX4k9/C3vrkfMn0FOH+hrPcFTxgm6WniaeBmARQq6tH9Ql98oGkFzn
         31BfVkvW+0B0MXxolZY/uXCvfprP8OQ6VcLJOgiDqayvRz1VkLQTtWx3RiY6+//2yS54
         L//q4WRblaB+K6BvbUR6GBxof9k2I8Q9NpNcrzIN52weVhU7ethrNzKao1wc0tXrC77d
         rDKXzrQHSqA1FqZxGXXJaeHzznTdvwdKyLFANj90aZQ7+Az7Il2DDMXfdaWwNULRwbdn
         jtSza7luP2YB0yVNixSBl64fMl7WT5hb907H/Xumw3K3BLNMvXDHacEYuOBmUNNN3GVo
         G8ZA==
X-Gm-Message-State: AOAM531TsSwg2Fgs9Q7QBCV5uxdj5T8Imylb/5gsMyYQhALljWc5tFAr
	Fjz6D25i7WoFS6Xw1lWUmdzZ+UThclMEFcxJ
X-Google-Smtp-Source: ABdhPJzNJ2CcJrXPCq24PObXbXGDByVFQvvyYaVANv1rLnBts6cencqiDPX7iglB3CP+RZLeDN7LJA==
X-Received: by 2002:a63:b54:: with SMTP id a20mr1015370pgl.407.1622841327519;
        Fri, 04 Jun 2021 14:15:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id i8sm2732477pgt.58.2021.06.04.14.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:15:27 -0700 (PDT)
Subject: Re: [PATCH v16 12/99] qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f90e54a4-dfc9-a749-b356-6af96dae348e@linaro.org>
Date: Fri, 4 Jun 2021 14:15:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Aet3R5WclLbF

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Tested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-13-philmd@redhat.com>
> ---
>   tests/qtest/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
