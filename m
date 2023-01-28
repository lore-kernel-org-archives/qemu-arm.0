Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1540278ejc;
        Fri, 27 Jan 2023 16:54:50 -0800 (PST)
X-Received: by 2002:a17:902:c602:b0:195:f265:66dc with SMTP id r2-20020a170902c60200b00195f26566dcmr106773plr.68.1674867289918;
        Fri, 27 Jan 2023 16:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674867289; cv=none;
        d=google.com; s=arc-20160816;
        b=mIQoe5UK8F7Ytzx2ncZWDpidMiHicKQ8TkaaUZLsp+OWQMN7je+mzqSO20EpkmOqO1
         7g4JrzZnUcPGDq7nJywxT+QFD5I6myS64tFtFNrpFcRSWQkuxQmpExUACoBtlISR5vlr
         NTfVxRPf520/FNROt59cDE5C155QvTqyU6hq5NurpILToV84aLcUZWdP0DRoIYRFfouP
         3y2BMkH9GkSw6x7h11HGlmRC1Yn2D/g+6WtNdrd3QoQueiYioZQh55x3iRKLYFLZxC6e
         /rkOEydbWdgwOqSo/GC29dw7jej/qB/gfwkwy/w8Mk21IxJMTAPHZoyk2oCgmCSmkNuF
         PH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6utUKMPF8zj/VdvWgeC7CFrw40S2dxRjRICjK5XCsio=;
        b=aNmpw6KB5v/KIya3ji+15wqjTvjG9zvBNTSSFDmgkzlnDhNZk4yrIeaJlFG81Pg28c
         yFS12Fqp9P+f3P7puilmGHc8FKQhqMC2l8MB+Okaw4PV38SXKWMRXq8MX2yy+6YEGnq4
         HVq+p146ADLxmLAr7LZJepMackgG010lR2glrNPpZ6tyQEakjaLIJq3SsJfPfD3x7yXX
         vs4l3hDeKCyn62XBak63VZx+67CI+GFRWWe2DybZ5EofPbvArXlZk3gidjVfzNDUVrcA
         wOrRF7ykWVTZMz3jtzblcLB+PqMhvjnHJaVp7aHD/zNYKoBTpkl755jha9KECEnYeyDb
         tHhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaTZj5tf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x24-20020a170902b41800b00193094f1037sor2762376plr.78.2023.01.27.16.54.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaTZj5tf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6utUKMPF8zj/VdvWgeC7CFrw40S2dxRjRICjK5XCsio=;
        b=iaTZj5tfOCCtvqGodDIdyRxa7E7NSL6QRxb/70idx5ERpzLrWiK6bq0hiPWEroXxUd
         8qR92aLVU6kLNxtK7hNCuu85YpdRl5yYGzqj53ml1Lpf9dRpUY+UpaccNz3byhrN4BMK
         /tXRi+yIqA3g4NBd1zHVsbwKZUp6/Pr0NUyz4eVg+dFuY6rTo++CalLlfA+oaGi5rD9B
         4eVt80wL7dn5g8xFPZW4QHnAvVVDaK9tASabRkRHuGb0+M4NSi0xZQK+bOZITiHuIKh8
         nnBh9lY3OupuzoP0Rjr9MbolStSlEx9tAeL1S8L0wWDOdru9/6ToRbE+JFdhFUN8daww
         D/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6utUKMPF8zj/VdvWgeC7CFrw40S2dxRjRICjK5XCsio=;
        b=4XM9PKRGq/0Elf+nhmS+ZrdE+bLRXeOwiL63ZBF/WmNliV/UvwEppt3cF4XcV/7ydg
         WQ3lrtDzWYf2+ytBfY86Ix1b4uV2QXvv+KVJg0xbJWBos9j6Ct0UYVQe6M+ynN3Rqh46
         PII5KbeC8VGCoaBpEN2bqq/PbQsQEUU2xlvsNRqWukrZHgRPPRU7bKMCuV3bEJoU5rMp
         hPsDpn59swdmO3xj5jtOsuVQZxyXQPRuOfJT6tu74Q1lb3Bf8QVb5BF5uK0gS6uE+ZEi
         fqCimJpFJon/2S5y3Gw1lzopHLoFTR4OsHuKaDR/Z8LcEqyCKIPmg5qBMktCMhDr3MRm
         PBLA==
X-Gm-Message-State: AO0yUKWmmUyFNp03v75dhGJrvm0gr8PLQhdltamwrUtTK/KJYhEUMymR
	0l7PMcy88n0+BnPOPAF5+7u9cyaj
X-Google-Smtp-Source: AK7set8fL60oz5b8/GLF2k+NKeHLPR/lt9JWlgzyeLcVnqT6ZCtFQXy7DVIyQkoYF9/oxJhmTMoOiw==
X-Received: by 2002:a17:90a:347:b0:229:f4f3:e904 with SMTP id 7-20020a17090a034700b00229f4f3e904mr538776pjf.11.1674867289420;
        Fri, 27 Jan 2023 16:54:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id c4-20020a17090a558400b0022bfbb26bbcsm3341295pji.0.2023.01.27.16.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:54:48 -0800 (PST)
Message-ID: <1381246a-e2b7-2810-8a4a-c1a6d6e9c853@linaro.org>
Date: Fri, 27 Jan 2023 14:54:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 16/16] target/arm/kvm-rme: Disable readonly mappings
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-17-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-17-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 24k4yyUOkcZ/

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> KVM does not support creating read-only mappings for realms at the
> moment. Add an arch helper to detect whether read-only mappings are
> supported.
> 
> Device ROM and flash normally use read-only mappings. Device ROM seems
> limited to legacy use and does not need to be trusted by the guest, so
> trapping reads should be fine. Flash on the other hand, is used for the
> firmware and needs to be both executable and measured. It may be
> necessary to replace flash with RAM in order to run firmwares like edk2
> in realms.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   include/sysemu/kvm.h | 2 ++
>   accel/kvm/kvm-all.c  | 8 +++++++-
>   target/arm/kvm-rme.c | 9 +++++++++
>   3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index e9a97eda8c..8d467c76c6 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -581,5 +581,7 @@ bool kvm_arch_cpu_check_are_resettable(void);
>   
>   bool kvm_dirty_ring_enabled(void);
>   
> +bool kvm_arch_readonly_mem_allowed(KVMState *s);
> +
>   uint32_t kvm_dirty_ring_size(void);
>   #endif
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f99b0becd8..56cdd2e9e9 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2267,6 +2267,11 @@ bool kvm_dirty_ring_enabled(void)
>       return kvm_state->kvm_dirty_ring_size ? true : false;
>   }
>   
> +bool __attribute__((weak)) kvm_arch_readonly_mem_allowed(KVMState *s)
> +{
> +    return true;
> +}

Not a fan of the weak.  Just populate this like kvm_arch_cpu_check_are_resettable.


r~
