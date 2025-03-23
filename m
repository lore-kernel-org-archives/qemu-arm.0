Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1565894njc;
        Sun, 23 Mar 2025 12:58:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX75qA4FPRd/CaL11Kkmvyo4EAZuofi6BHxAdYkW7bfHUjDgMifKWShynE7YxEc7tIlMEy7UfPtnhEklw==@linaro.org
X-Received: by 2002:a17:903:1c5:b0:223:5124:a16e with SMTP id d9443c01a7336-22780c50954mr148209365ad.5.1742759886594;
        Sun, 23 Mar 2025 12:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759886; cv=none;
        d=google.com; s=arc-20240605;
        b=bW/OOiTWj8zHUib5+/U4l4Ey/1sCOiVORo/4xOi6O9FvdYz2KE+C4tWy+nkHVnRaeT
         WYRHCG7/BdxK1VU2Q1xy2ppFql5eTH9UaOOBTrIQOGVzCneDgX8UbH/gKzdK3ZqVF6Qq
         SPAtgXBrr2y6wsyg9dFCvg0brU+31LY0L3PZ0Fv/5AveyZY4uPpJhrzWx2dW1fEQUwGf
         VR/LnKRF/u2lXfEjnX/erHiduj2pNk+js0pjDtrUKHMcx/2lbXfDvqDTD2mjwENTAiUS
         s/kqLMxCVpJ/YK/hjOGcwrNz6qhcuz/uGAGdK0xsx6qZdk288vdXyDUzs3yq8+v17XJb
         JLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rV6w+vA/HSvcsGTSqT6d/tmonvQTsJQlJQIhHzRBrjo=;
        fh=/47sB4xyRHrzLi1jT4p2wuh2M4deQtlKF5UQAjGJPfM=;
        b=JgmP58ZJRXcVVYhZYQ7TK9zNXvMLKXKOoWnZXVNC+oTMbbQCLJT0jhDdvidrXevINs
         a6JS2bY2YCK2+gyHf3v7C7Afi0u53iPpRCGmirzuHrutluq3CP3Yy2eGmmkpH3GZbWmv
         jGcuvNwv07r4iUz+KTLUaq6XNgFH1TqkINXwLx9/cdpLbCpnAqN8NW9dI0kbTsDauanY
         Vi5GLs1BpqFxYgpQfnUXvml2CoJ5WwrJo1jJGdfvMXj+BT+Ia0xX9j8miBvgkTm3slS7
         ecadSqKPPkqxwUiJoqjqPY6oOWU8pafhdBECEr3RDpzSqtiZT9Eqj/3TBk0yJqGi9lU6
         ARHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb98eJMR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f0863esor39704995ad.7.2025.03.23.12.58.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:58:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb98eJMR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759886; x=1743364686; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rV6w+vA/HSvcsGTSqT6d/tmonvQTsJQlJQIhHzRBrjo=;
        b=gb98eJMRVBabdwSnAny9/9HJz3uGYxaHv1CLUpFrPnUUifIeSWWgTNRMCaNseaZqeV
         SwLpfHAXz4F9xZe1tJelcxGNt0jczFGZFQK/fumWuyVkxC5L8zGdz7Z7VTKh17fbTK9A
         nAlBOnXG8pRQlk7C9kE2WnOwHmdIgG7I9cxg8YtskrAtYRU2Dp++AF/Sk2M+s0GaJNnl
         EqGIB5PZSFujIHnqbGpwoLtLuyM831CwHC5de4MbO2ek/KX0WLN/Sgi3i9KAWCqtc4nn
         Q3SofUAVtnJtfk3V6jYoNeI/RWKlUk4oEZwx0l/b2MswvONmLl8ToaXV46mZFKlbz4z4
         eqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759886; x=1743364686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rV6w+vA/HSvcsGTSqT6d/tmonvQTsJQlJQIhHzRBrjo=;
        b=UqJknCuTtwcuXYx6qQ8A/oVpjQKkDwx6KiOpuTt+dtDT2vNhAMShdsP9WWDiP0c7Qi
         uT/s9rnh8oS4vzkamv1AbPnUxFFflHHwj9tFbb2uvgv9giPV7ZGE1/BXdhJoyxdhctc/
         IZf2H/glTWn4e06j4sE8qZXAkLSPvqUOUyG1363A/iyVBDcOVaNlrKGh04ce1dpCJZSd
         14QKv73Lq7XzvyuaKBUrFQab5HLDWeW7nbhSrspgLGlyS8mx46pZbufUWweTH1Rg3phv
         MEAS/US40a8QfLejLMRdVI1/1JgXPDcCef6jxIPvVoYuPaXedFrmiOUXeeMxYQmHeeEZ
         xs9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcRCoCHBzJNJV+ET6OYw8MuqO8X5s4LfCLE83p5LnU8hv6tLewOLGG0OVFFNdK0nxO2vNxqDiMkuH/YQ==@linaro.org
X-Gm-Message-State: AOJu0YwI8aHKsnjOKy/c01uoL5A9/GDQdK7IPYqEychA20uQCIju1XO0
	C7jWQRkh/eNY4U86zavJiWH/OnykKunmyxs0hz4Ze7C/BuA6t1yXOQ/+sOGDtIW50w==
X-Gm-Gg: ASbGncsMmb+zav2KrgNnR9A71k+pztuqoOqielG08pllePHDp61Y2B2Ud9Avw3M9kAK
	LzvMnqNCVy2MnmTPY1frxbww8buSHVJaAL4RQ97sMyM/LFGXTk27jC1bctiwHMmzgQUFVOVWbij
	dMkklC/kpbjNkiKIFMN1YbbVzINmOwukG9wdb/Vuy5eA/9N03IgodgjVHPMyzn6fSqtLB+mdrzA
	Ek/5f88l/QMP0arpwdos2kTpRjtoXcvBWS+dXwTjbxpO7GdHDlrHZjcAa7ZlzHyBJj8I8tKOv7V
	AgiJPiH5tXpxRDeiTndYzk8LWxEIQfpN2GvvVtlCS4Tn8+iJO5MVGiXHRtRjK1Mq05VJQsf2yc8
	b8qPvVcVY
X-Google-Smtp-Source: AGHT+IFfak5B0jGxPFefdrcBK4EUg3tVjnxOA8xxYMB9LcDAjqBf1PF95EWl+vpwBeyVmqQayJ7ZBw==
X-Received: by 2002:a17:902:f683:b0:21f:136a:a374 with SMTP id d9443c01a7336-22780e25b3dmr168091805ad.43.1742759886087;
        Sun, 23 Mar 2025 12:58:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811eedcfsm55095025ad.205.2025.03.23.12.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:58:05 -0700 (PDT)
Message-ID: <2650a767-a829-4544-99f9-42e23b131da3@linaro.org>
Date: Sun, 23 Mar 2025 12:58:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/30] meson: add common hw files
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-25-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-25-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 6C+KC270qBXE

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Those files will be compiled once per base architecture ("arm" in this
> case), instead of being compiled for every variant/bitness of
> architecture.
> 
> We make sure to not include target cpu definitions (exec/cpu-defs.h) by
> defining header guard directly. This way, a given compilation unit can
> access a specific cpu definition, but not access to compile time defines
> associated.
> 
> Previous commits took care to clean up some headers to not rely on
> cpu-defs.h content.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   meson.build | 37 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index c21974020dd..994d3e5d536 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3691,6 +3691,7 @@ hw_arch = {}
>   target_arch = {}
>   target_system_arch = {}
>   target_user_arch = {}
> +hw_common_arch = {}
>   
>   # NOTE: the trace/ subdirectory needs the qapi_trace_events variable
>   # that is filled in by qapi/.
> @@ -4089,6 +4090,34 @@ common_all = static_library('common',
>                               implicit_include_directories: false,
>                               dependencies: common_ss.all_dependencies())
>   
> +# construct common libraries per base architecture
> +hw_common_arch_libs = {}
> +foreach target : target_dirs
> +  config_target = config_target_mak[target]
> +  target_base_arch = config_target['TARGET_BASE_ARCH']
> +
> +  # check if already generated
> +  if target_base_arch in hw_common_arch_libs
> +    continue
> +  endif
> +
> +  if target_base_arch in hw_common_arch
> +    target_inc = [include_directories('target' / target_base_arch)]
> +    src = hw_common_arch[target_base_arch]
> +    lib = static_library(
> +      'hw_' + target_base_arch,
> +      build_by_default: false,
> +      sources: src.all_sources() + genh,
> +      include_directories: common_user_inc + target_inc,
> +      implicit_include_directories: false,
> +      # prevent common code to access cpu compile time
> +      # definition, but still allow access to cpu.h
> +      c_args: ['-DCPU_DEFS_H', '-DCOMPILING_SYSTEM_VS_USER', '-DCONFIG_SOFTMMU'],

Oof.  This really seems like a hack, but it does work,
and I'm not sure what else to suggest.

All the rest of the meson-foo looks ok, but a second eye couldn't hurt.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
