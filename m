Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp467757njc;
        Thu, 14 Nov 2024 10:16:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUgpfTstNb781zFVZCidropJUDE/3gdTfhqHMhrjAvvsH7wycrO9gPigKPejYTpC6xVVn5iac0wVT+/A==@linaro.org
X-Received: by 2002:a17:902:cec9:b0:20b:a5b5:b89 with SMTP id d9443c01a7336-2118359cb0cmr345688595ad.35.1731608163724;
        Thu, 14 Nov 2024 10:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731608163; cv=none;
        d=google.com; s=arc-20240605;
        b=D/Vbv9nUrf5P6cuPdk2n8yONlfNaN37oLdFhNZj8rTFXuWeEwj/wtun5xish0t1PKs
         9loVVK2QJ1jzMCoCbyis/79wgr/7PJEquBh1jS91IFmlW9uO/V2wQfZsY4DETKgLiwwQ
         UMLYsAdUykDw5A+VqZLQreW7IFuPJDKjIKR1+z1U3CvHF8Pvv9Nbe4MNBlrA4EtdfUvF
         f7ocBq4FWzH1no2yDx9I6j4x2J7DL6i8PM+GgP/uFilDyei5GS1n16goQIuUR5wnOgDD
         AYDvb2cKcmUXCP1nXwVPGUIEFmgB/+Nu8/DamjNRjgj5W8wDFJ1d8aPUmM36XoGj4fR8
         uYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5ACMR1qiUo/4HcWQZO5iGj6k58pq6unrdeYkdFr4YBo=;
        fh=9KUeEW/uQSL9GrAes+5hNS/sgGk4L+dGmxxq8wCxPec=;
        b=KGqh+L2g+W6a+TzdQV5YNAnuWs+vgHA0mpk+nAZGJ7FYGBJrbN0CZpxMc95lgaVWfW
         voAhmhE3l3bJJvRAy9dg58xiZ/fi32HKdXCRmCOovBZtUMERXTDn0807YOeTEEGhZPfV
         FK5+eyu/bUSN5+IybXLu/9IH/94YvhSV5nvGVMNGFnSkVNDDLMf2kxilR8NmEoPhBasL
         AxVNv5wMaayAfhVGnnHAAp+CzwN8bJN8flrzatfCcjaMv5/4YrCQJ7HVV8FKn5OwYzDV
         VFhnxEZ0maCK8Dwcv/+ZVin/V35/v/GjEevonms2wf1Iats7C2wVYslmrtwELyJcB+Ee
         rVOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sqairi5N;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7c643c3sor9316565ad.6.2024.11.14.10.16.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 10:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sqairi5N;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731608161; x=1732212961; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ACMR1qiUo/4HcWQZO5iGj6k58pq6unrdeYkdFr4YBo=;
        b=Sqairi5N2aYBWksKreQ273bGMXjQFBrqy+AQ+8sxk8IQwK2ZN3uy3A5fLEAKYXaVYx
         IncPaZbCo255zKcV6lYaJg3qmMCyX96Gx80Do84Ta3LXU2oj1Paj1BE1Qb9DdiTEHudy
         5I+bdYCjDkhF+WYy/UH/V1ojbwcdgZdkUbcb8h42/V8ErZh9FXR5FDh/yu5AowVtLcmo
         VXXQem+HufgmhAtPNHWeitoUdOI6lfyK8xFL+6gP8cR3appei1x2konxPYaXiUIYENyW
         4RnCx1712clNHmXp/NmsTQRfNBMtUN+Oz/otJ9aoVKlKDqvl0iy/dYNggkHFDPzDQ18Z
         eDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731608161; x=1732212961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ACMR1qiUo/4HcWQZO5iGj6k58pq6unrdeYkdFr4YBo=;
        b=IcVsk0Y9WVcb4rxH7+FbXBsv231oczMDlHH2vrkhDvoWUM2hWkdw2zkC03vfqkC6/t
         Ub0o9dVd9g//lj2zwLemUNoRW8QlHO+rY69LyVcqrhlb+Tcsv1YqSxniz7AsdReLD5kf
         ZDKdWed0w+9NoU4DlTessn3o5/AY5DSdmTvinuKanJTKUFTSzl49m6eFKik4+dSN7CRQ
         r7yy8BWFyOk/MVovlvVQc8LRhr5ctCtUkuMaD5VnMDsrb2CtYkyXFyAmMQ2D4Jz7OqG6
         L0lMctML8cPusJ50B68AxjQO3xLWjB6lJtWnY0ioZ1nkDUj/zlRFgjHehzAT86zQmLfS
         KdWg==
X-Forwarded-Encrypted: i=1; AJvYcCUDg42Upgs4sJ48QWFnIKn8z3oo6IjLaV65fYDtA3YDZUlIK14pXlDibAhbSLIs1XMVy7Yg+oesyPHy5g==@linaro.org
X-Gm-Message-State: AOJu0YwlxNRBu5SvuJvdWAidI8S1fYD+A8CNujZeAAa5ByzsJPH22wvG
	T78fbE12/6Cx6cWkCnn3nsVwvtCHbeGpSlEaDxOxzsvcG89F7KSb8n2bbvqLs4RW3w==
X-Google-Smtp-Source: AGHT+IF+ggcxp3rh9wNoo052zDeH7w6GxlluT21C7pavh3vkVdeiVUOPxkyZ1/BYaMJouBhbykXDRw==
X-Received: by 2002:a17:903:11c9:b0:20c:cccd:17a3 with SMTP id d9443c01a7336-2118359c11amr339957125ad.46.1731608160825;
        Thu, 14 Nov 2024 10:16:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d04f06sm13604465ad.185.2024.11.14.10.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 10:16:00 -0800 (PST)
Message-ID: <a0520e19-6519-4375-8dfc-dfe69f9661fa@linaro.org>
Date: Thu, 14 Nov 2024 10:15:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aiXDFaA/rcBw

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> 'vaddr' is declared in "exec/vaddr.h".
> Include it in order to avoid when refactoring:
> 
>    include/exec/translation-block.h:56:5: error: unknown type name 'vaddr'
>       56 |     vaddr pc;
>          |     ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> ---
>   include/exec/translation-block.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
> index a6d1af6e9b..b99afb0077 100644
> --- a/include/exec/translation-block.h
> +++ b/include/exec/translation-block.h
> @@ -9,6 +9,7 @@
>   
>   #include "qemu/thread.h"
>   #include "exec/cpu-common.h"
> +#include "exec/vaddr.h"
>   #ifdef CONFIG_USER_ONLY
>   #include "qemu/interval-tree.h"
>   #endif
