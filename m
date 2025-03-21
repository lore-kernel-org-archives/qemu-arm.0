Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp403627njc;
        Fri, 21 Mar 2025 08:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjuFZWg2Xeu90hS9DMErxSvS9oulqRpXPmNME8Zyc/3EQr9JjMpUvPsikWYbK6QE6zO8/gTSgoSV0hFQ==@linaro.org
X-Received: by 2002:a05:6a21:e8a:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-1fe42f55828mr7302565637.20.1742571390063;
        Fri, 21 Mar 2025 08:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742571390; cv=none;
        d=google.com; s=arc-20240605;
        b=cqVC5d7Kvbud1y8kEGVpofaoA2i0gUv5ghCDOlqkFSuT0lI8SZZ4azKwVy4RfWEAuu
         7KCvmWZ5/V0lJO4rYp9lSUNkTgnMLUIRaD5NERH5YyEbp/7l+sGI1sLktONKZlxphNWM
         CbpHRd+5nSAuN8Wl19FHx9GLupTuqcGRduq+a57mPpizEAbLlM0xrPbAIN3XUC+Cw3j1
         nrdubxQBZzwmiNrop2YSFw43RwW2U+1zgiIUzgxJAnd4PhVyrk+VsDHsnbGespF5aRw9
         biCIvCGVPjQvDQUuiz11bgPRnMoutlXVYDYQxcO+t0LRgrQ/z5bTaDQuwvMdnIUe3cNN
         N5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1XrcnI8/sSn+DKJfn9g/ACfk6EsflbS3NmSa9fiFXcQ=;
        fh=s5tl4bOvqwnxT+KbhCLDvLD8OnUPXvm14jb3dFQqzTY=;
        b=OM97f3soi7tYYfg06qqYdQ7k86IkXJfwinn/wWElCxM7xDPqB284qSdxJAhnHcmiG3
         kPVeI4UC2SzhZfGeBW5edhTDYHoutt6IjdYThMdFhuCNFLeWfn+/JYnX0fWQGBMcXQi7
         F+wSycnb+RuAjk0RRLZDZLxjfx838mQy8JVBezC/0ad1OY14MnVEGCv54VJ3neXYr83L
         jFs1qMJvj5MrrhRfFtPmP9iEe8EHMTAgmnUIGL2gcFHVsPMMJDqLtVqYrtBSwobEpMoR
         RV65ZhRzRoI6w65yxzm37uz6z7tnsWtwN3ewWAehi0KPL55kYUeTPpTYPfNB7H6/IFzN
         BpuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxrQKQI2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2914aeasor1397213a12.3.2025.03.21.08.36.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 08:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxrQKQI2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742571389; x=1743176189; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XrcnI8/sSn+DKJfn9g/ACfk6EsflbS3NmSa9fiFXcQ=;
        b=SxrQKQI2MoJNQDDpEUh6udlImzkfybKWGAebcoqZzulVIVpd2DZwzrZOBI7MRQRtK7
         IOYSpKcC5c15cIGoHF1b5Q/fzqNCXdsXOcwynV31sXSHxXECQh1CrxJNimCPzdsaDADO
         cUxyen3GnegBLpbfak71d1ll5H9wId4vcbkNb760X2OVjoQ8v16hYtXZ58pKRILvbTNH
         pnzuY02xdUJ6g3dKbQgXE5JOCVxhTFyLKCaC7/+I+mWom5ANIzskV+5LBZnfMsLgy1a4
         40X1TgxcB7IAP5PBMDPBQnlISU74bYmksrn9Jbxkl4Cjc4hpHAYCxwTWomqi4X1Gepq9
         O1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742571389; x=1743176189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XrcnI8/sSn+DKJfn9g/ACfk6EsflbS3NmSa9fiFXcQ=;
        b=KJ5d3t+59TVAtk51Nas+lBZhmQAmEUpsOrZTl9ycgPGoazrBtsNEIlFvDGk+Dih9rs
         Ze6++BITHPd5BEOpJc+6Hrb9RfTEl9XIjbukN/js6/xB6d2nyKKSeXyFXSwn55/LHq9a
         Q8ICrNNYgrrixeRGd3lkMoPNgRtbFPLOI9tXwKpB6W5jZtJ3OqFpUXhmWEJi6GS7sW+8
         zSflT7/THvlMu623nOU2chKH//pSO0hkxMu4jZac2fw0vV7NyQ2QxY1GLGv6vcpHhUPr
         e08p4brVGiw1dwZ9Cmd88+DhkusHlAqOZPsLYdyVxIpVERWwvykR4pTVjO6YPte66xno
         HiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgWvm36s6AR2HS8XPzyIQMUvudxpkXy5EMUYVaq7EPweCWJFGEcJ0zX6VegweOi0jF358XKKPQjSamVA==@linaro.org
X-Gm-Message-State: AOJu0Yz19jBIRs2jJS2aHpxLinDN6Wz0vg0TYqPbMg+Pq10Xf+n6/hrm
	oNLDOyWuQ48GKgcLiSnwDqOeFmnTlZqjhspv2JpnAeD9+476QeGq9DQmZG3CN9BARA==
X-Gm-Gg: ASbGncsMN/JFU0WfbAHsbAWLK99lbpKHQP7LCmZPS4lWUcTNwA5cd5US4bzuseaTV8L
	VURUMIns4Q+U0tQyoYghEV9Cx0b9wE1Y12/0B4FA5SkpXksyuh3czhcGJqSuI8hxVA3cZkWGDqj
	e7nXP3u5iQ8eNvq5Uzt83naCeBLA4RutuB7DuCueCRHfuwbxAfsQ/O63QZb733TibFg/16yX6Q/
	zmvkLYer2f0HsaAyrgrcFnLg+v1sylZ1Wa6Vv5QwsSyNl9bN2CHcB2QsUMWkXt+0uriSY4av67Q
	bWKhWxO0w3zT1vf/UgDBNBwWIlDK0YmYkNGhgRsuMM6Os8lIX2GGd1fEFn9Bh7fgUFnN/sHCWeb
	ofZrQSMqQ
X-Google-Smtp-Source: AGHT+IHJWViTwcKfPKoLy1dU4C8myvJLYRcls55PV5nSU6Vmh6oW9S11ryDhM4HtSbU3j2AR+5qbTA==
X-Received: by 2002:a05:6a20:c997:b0:1f5:7c6f:6c8a with SMTP id adf61e73a8af0-1fe43311d2dmr6722330637.35.1742571389478;
        Fri, 21 Mar 2025 08:36:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a28467e9sm1611739a12.37.2025.03.21.08.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 08:36:29 -0700 (PDT)
Message-ID: <85f93712-7612-4016-9fd3-4f8f135da95d@linaro.org>
Date: Fri, 21 Mar 2025 08:36:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/30] exec/cpu-all: move cpu_copy to linux-user/qemu.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-4-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-4-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lYebavrCARwh

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/cpu-all.h | 2 --
>   linux-user/qemu.h      | 3 +++
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index d2895fb55b1..74017a5ce7c 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -32,8 +32,6 @@
>   #include "exec/cpu-defs.h"
>   #include "exec/target_page.h"
>   
> -CPUArchState *cpu_copy(CPUArchState *env);
> -
>   #include "cpu.h"
>   
>   /* Validate correct placement of CPUArchState. */
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 5f007501518..948de8431a5 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -362,4 +362,7 @@ void *lock_user_string(abi_ulong guest_addr);
>   #define unlock_user_struct(host_ptr, guest_addr, copy)		\
>       unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
>   
> +/* Clone cpu state */
> +CPUArchState *cpu_copy(CPUArchState *env);
> +
>   #endif /* QEMU_H */

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
