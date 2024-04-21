Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3430308ejd;
        Sat, 20 Apr 2024 22:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5zJnOuBhRa8uOAVKNaUopiGd4REyS+4HYRnYAWrvMC5jS1yNYAeE00RBbgfBkAiujh6zi25hcjrGxxfoIXxfH7PJtYoPB
X-Received: by 2002:a54:410f:0:b0:3c6:d99:41e9 with SMTP id l15-20020a54410f000000b003c60d9941e9mr8271914oic.38.1713677333624;
        Sat, 20 Apr 2024 22:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713677333; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJ5qYxndVKQoCgkF1t19EvBE9KuotL6jh94N4fUnUu2dCQmn+vhqWrJfYR78Q3BJBo
         s+G7x4yTdWQRtqhIzLx53BiVFWmuSSlSAbIeXRtaPsdlUGnsANoVAwLwW/CoFT4x8VaP
         t3uAAX1tkbaXu3RuQ47SQs8pVXZXj9OcvzZtXm86SayWtWNmmq2AHbfW0xLdh5acMOC0
         5bN/WEK1142rBZgwUzLRAyqH6PxqUBgruQ9jOL5LdJhooSW5o/PZs0qFOdiVW53QMITL
         tcdTbFiK7wZOCMInkAf1FYZl7Xii6vVmaytQSnfaHStISK0xfkc7+NT/yTtvpcPSRucL
         OcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eZi0Zl+eRrtJlZBV9jASoIvGganpcphdcyn/Bgxey5I=;
        fh=dE/1wxIV6rjQyffGOcZ2H8DzbxQVGc6xsxY4BV84h2w=;
        b=KEwrUOnjI7zQExt+bl/prZxh4moCkg2uIrwB+PuQoxWGWURymbfGd+MMUy1hD6cGXt
         UBhL7PlwEGTNkwkMLZGVbqA1/YIhvxYgolgGo4yVonWz15KlZTkaJR/lLYq6ph0+uHLr
         c0RQJKfCq33bJB/p174Brr9rudj2dwaWT9nn+pLGNZCJwSN65hK4rGV6ZrZPVm/gQACG
         8/HkIAF5dkhb+uQgHtQ2/F+Rap/gtOO5eP+aW4+AXnS0wyJ1+VbvAPpbnFrdQlr6RZQw
         qgqNxoy0PLr7cL+oAGWxwWpFKWyt9Aj2DTlXYSADNaPkZkZP5HK0fiDpjeab/QAV/9N2
         CzZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jUShVMno;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5-20020a633d05000000b005f7e375fb51sor5144377pga.0.2024.04.20.22.28.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Apr 2024 22:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jUShVMno;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713677333; x=1714282133; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZi0Zl+eRrtJlZBV9jASoIvGganpcphdcyn/Bgxey5I=;
        b=jUShVMno3QvcZELeNDxivryoAQFOT8VFNyhAUCsu+B6tNoVPDa1cWZGZbG1a1ls84u
         PcY2xjpbpkgvB9sc8pUDps7S9JtYmrnm4tgQgQGMs1zlBuObpECAywpPqhTMZh5NrHIQ
         528LRKaBOadeR/eeYPXh2xFjbpcUih/2FlmPRIFOcCs6z9GhgBi5bhBG94gpkbcrbiVV
         QtFENGvumcNlk//zDGi60RSkukPGqrFfzArD+/WQvK76ZhZeUvYKyGjopig+L3Vg51Cu
         6ORtlJWrT6tn/Nx/b0BQIC2XNcySi6/K2rNhy2GHtBdk1zg17rx1ev3rS02knCaul25C
         gHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713677333; x=1714282133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZi0Zl+eRrtJlZBV9jASoIvGganpcphdcyn/Bgxey5I=;
        b=IPCXq0m7TQmVVgECUy2+pdQdW1EL9du9V8r2h8LbDKazEa6BjxjbbZErags98mzgCz
         kBQy7T3HVRhFUR8J1BVWcqJjN1HTTaOE3WCrD+js7pYO8XSRZP+nsl8tYhVr0it1XCC5
         R8zJ1OmA9BzoQThGk4p9vvyMiTS9OuYILW5nUDJy/dHNK0yAzVTT6P9mRwZJ1MruXztw
         QYGkn/4mC9LB0Cx7K0573IPF0PKang2MNo+wStjc1dErg4yev172g8RAze9t3UfhqBOM
         +eYQ7eIC9ZcH9u/IlBUaBw7TC5BWnEb5mFgVdOSqKkt2MznSvz70wr7qYvN+JmrH7Tzw
         XrQA==
X-Forwarded-Encrypted: i=1; AJvYcCU6ZTe68Rzx5U7FBcUDwCH5njxN6fYgLpw4w8BCpM7rFONQ8IJZ1ZdWzzRRU8daYMiXcHGYrRajyExuNJRxpUiQNWU31xpm
X-Gm-Message-State: AOJu0YyJhDZHvOg6VlfR6XmSS0OlxXtTcZxdgd6ItsdDOXGlfq0GyZgk
	HqzCdPJYBziYChsHPFebz8BAFAjJMUsPWZ7jvQ83PdP7jl9d1RhyY4OoWxEbVOK4qw==
X-Google-Smtp-Source: AGHT+IEDvY3nuWe1lMygP4ouBTDUeAn+/ljzuHiY3IePX6mA7sRzsOVcnyQdb08HLEFin9X90te+Jw==
X-Received: by 2002:a05:6a20:7290:b0:1a7:53f5:4e01 with SMTP id o16-20020a056a20729000b001a753f54e01mr7162273pzk.22.1713677333069;
        Sat, 20 Apr 2024 22:28:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a828300b002abf2057cefsm4988327pjn.0.2024.04.20.22.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 22:28:52 -0700 (PDT)
Message-ID: <126e2988-cde2-4eb8-b423-6a4de637b316@linaro.org>
Date: Sat, 20 Apr 2024 22:28:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] exec: Restrict TCG specific declarations of
 'cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: R7/epIUs6MA6

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> Avoid TCG specific declarations being used from non-TCG accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cputlb.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
