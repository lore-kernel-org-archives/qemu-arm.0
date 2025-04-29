Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp71804njm;
        Tue, 29 Apr 2025 00:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU272S1w/etrO8EtN0uKdwYTzVglfoxU0fVRZBf/n0yBLvxsomIPsY3ltM/3QkGsBPfMwVplgwzTZm6A==@linaro.org
X-Received: by 2002:a05:6000:1f07:b0:39c:266c:12a5 with SMTP id ffacd0b85a97d-3a0890ab1f7mr1724514f8f.13.1745910825040;
        Tue, 29 Apr 2025 00:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745910825; cv=none;
        d=google.com; s=arc-20240605;
        b=H5uX7n3Yr9peV7peyy86cVbSZOLL9RnqFJ+69oBkffvBAE+qJt4eOQpBkDlS/s9yUy
         oQXtUMIs2DbsJVaCSgKejbXxgr9U835sg4AclclII1XPmyXsFaLXDhNG9mX8be1fy7jd
         fuRFiBE8Ym016tzX2xsbvTg7KXHzgREzp9bIHs2UGuHH8xADlOvM6DPW5jBD1diwodMk
         mirLdjOtIkfAauScmWnjU8yaheCb8gb+4Nxd19X/6X0/okGAvYVgeJhQRbF3dIuRFw7x
         y8FVRCmj2uACwgPsV0232974acSzYEZZVaU+D3h+pI0sdthEwP4wxIr+a6qsR41FNitQ
         GfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yehZmGTx7uAqJaLE76x+U27DnExTYI6sNqxGDs8Q0r8=;
        fh=jDVQcOak/uSNn7PrS/Vdg9vuIq62Dvp8nzUtPy05DZg=;
        b=J4v8IDA6ZPYaxRS+q5c/EPNh7gs3xeDLVZxShZHW0JykXgjkdwbdrKGhqKpKSG3ys/
         9ECf86rJbv83gJ366AQ4AZfC0gqJxq/75FfzuuMOHwfUmBx7p63jjRAkAoPH3eXHt4MH
         LHUxIBppV6MOeu2wCjN8AEB0Iy9bWnXiu7HscpKX+vTP38WzoGaFGK20M/JYGyROM/qU
         ovV3LX27h7ql+I0DMyoKPtq8b1iMWrNTcBS2OgIHu13izj2iYYxuNM0cDz1Utay5pKlY
         vMa6aB1WmmJ37DzDq9SDmvf4KUH26zyTF1ymyO0UNnkYqz97QIoW9obT2pxM+4JLKvqd
         XYwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UkCY1FxT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a06d505062sor3446748f8f.5.2025.04.29.00.13.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 00:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UkCY1FxT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745910824; x=1746515624; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yehZmGTx7uAqJaLE76x+U27DnExTYI6sNqxGDs8Q0r8=;
        b=UkCY1FxTlMTVvMy2Q0F5J531BqBNoqWoVQGG80BtOGxahhLem5mIRSN1xoNbrmWFWB
         bA8Abgc1bBJTiQ6cMB4iink/NlyY/RMWdI+aV7XtHVs+S/8u0uaeicEyvzsfUywwZ2Ev
         3hRtqNer/x5vXsnLJQQvLh1y/w9PteKR+oICGaZQ3zOK8eu/agCQJbP5MqExhh2UCI+z
         TqeOXSA7kFM494yGhcU5F7UoddNhORNs+xqN5C1ElT8Ze/hGb3JjiYcgCtQkY07KoupR
         zetq+N/E0CHG+EQPSHA6Rrsfxm/LPRA/Sl+XrAVDbPYjq1X8fAW2XVD0oQT96+sP1Sug
         r2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745910824; x=1746515624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yehZmGTx7uAqJaLE76x+U27DnExTYI6sNqxGDs8Q0r8=;
        b=k1NAtM8OzZwPnNTPWrceBX2NnSVf7FAW7yTvvaFEzCLrpHIdU7ij7aZxAz/oKTGhdL
         TPS0t0qnSSBi9zkjU5fL5PDd5Vadxa5ORyX4EXiHOkO8NWqtPWSqaUKnVnRosdfANP2e
         4LtAjV2lb8YavaaRk//WO0l3PTVSOBa44qGWTQfT8jxJv0zRz/iFNt4PcNt/eSqF7Sjl
         vhuBRSlP/TvgncOk6GZVdMiw4rnCPXRQd8pEyZiMZPOmoyNCmwA0f2qFeCUp9wQjAwA0
         Em1OLcr+TytUcLhg74rHKNJR5qzgvWFvGe9bYiKlKD8bLQY93VJLNZIkaP30wjFNhgKX
         1eRA==
X-Forwarded-Encrypted: i=1; AJvYcCX6bhteaq/PFOF+KJoWHtcPeJoQr3siPYjpqpTcI38wueHmUUUesX9BCsp5GBWIsh+E2rzuTYz7lU91aw==@linaro.org
X-Gm-Message-State: AOJu0YyYQKGYeKqL+3VGLQ2X9GUDNDdHSkLmgGfyV1fgtn5qTSgog7hh
	+z8NPpHXp5xcHhRrV5A4p+n/SAFFapmDBmcd+QpGc9d7OlEO4GJs24tDhxVrFkhOVg==
X-Gm-Gg: ASbGnctoWznaYkhRHP91V6fQpCfOuNJMHNECy1zsCx1bY+00tEZw8z66qbN+PHSFuwr
	MTi/AWEXSrmD86Ihy1v9g81GIzTFVM/cxT9J92dL6s9QB33WLVkgi7GBfsBdXmW8jgtFtEzcjFd
	84cZVtHbjElXqjft9sEH7LKhWgql3cpiuPXrV3mIHo/kwupRJ6PhHwrOu19ZecCyyyvqJHIImVk
	Pt8C/S+VKzqr6y8EOEguFLDGt1Hm+VexCDlrn5ilR9mW2xijcUpG5oj1v9Yn6JgFNDirHzobVFc
	fGWqBpA7I8k1+yNZ+KsN6WzSswPeU2WETBSEHTNTAF8Vd7yHTThPE6s6BOD4j/KOUI2kwM6uIhT
	e/slmK6lGRTOI/Q==
X-Google-Smtp-Source: AGHT+IF3jDfaiFaE0KiZ5e+08grYBav5IRWcws2yhNnnOdNJAuGgzhyThrFzk7CHNb/gc6OX5zpWeg==
X-Received: by 2002:a5d:4884:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-3a08949d731mr1735344f8f.45.1745910824440;
        Tue, 29 Apr 2025 00:13:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm12856743f8f.3.2025.04.29.00.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 00:13:43 -0700 (PDT)
Message-ID: <e178a430-7916-4294-b0c3-60343ce6f023@linaro.org>
Date: Tue, 29 Apr 2025 09:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] include/system/hvf: missing vaddr include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-3-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250429050010.971128-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5Q5pddzm8Q2P

Hi Pierrick,

On 29/4/25 06:59, Pierrick Bouvier wrote:
> On MacOS x86_64:
> In file included from ../target/i386/hvf/x86_task.c:13:
> /Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
>      vaddr pc;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
>      vaddr saved_insn;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>      ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
>                   ^
> /Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
>      QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/system/hvf.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/system/hvf.h b/include/system/hvf.h
> index 730f927f034..356fced63e3 100644
> --- a/include/system/hvf.h
> +++ b/include/system/hvf.h
> @@ -15,6 +15,7 @@
>   
>   #include "qemu/accel.h"
>   #include "qom/object.h"
> +#include "exec/vaddr.h"
>   
>   #ifdef COMPILING_PER_TARGET
>   #include "cpu.h"

What do you think of these changes instead?

https://lore.kernel.org/qemu-devel/20250403235821.9909-27-philmd@linaro.org/
