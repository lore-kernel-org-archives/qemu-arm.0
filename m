Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3710811ejd;
        Sun, 21 Apr 2024 09:29:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT8vMNGCqMo8A9dkNNgE1gV3KJs/tWDkjm9OwHF7fLVO8QQ+xdMJRjdHbB24B206zbuENGOtPkcVN00rOizXC77n1b6Lb7
X-Received: by 2002:a05:6a20:3251:b0:1a7:697f:fb9f with SMTP id hm17-20020a056a20325100b001a7697ffb9fmr10555112pzc.49.1713716947239;
        Sun, 21 Apr 2024 09:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713716947; cv=none;
        d=google.com; s=arc-20160816;
        b=dU5DBojitlpRq6iKVopdqo09CeCArCoWMxnSNcKVIrXbLy68w5in7NMN18Wb2CT8Xk
         4b/pRN7Now43piAV7C5cdDyZRAHt3YXfRXpgUO0iUKPSxN0hoTpDLXfITOIRClkVm+Up
         VnwNr7pi5aJzc9UoWmK5fYLn421y19L30wXb8yl5kMlrseRmxe6sJjqfdmj5zPjdyCxa
         7y4xtx5onDZd94NhjXC3clGKa0OsyLyKlpZMJL7NhWgPnrcbeZUKG4apaoPxKWChT7Qd
         0ryOSLkD+VT5LkWB2dDgW+/wc8jt7VKYRXZY2r6SShtV3kiWr9zcJXXJCcfaQucalzoU
         u/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NyfnQy3RE7q1hQCupGmQCeese//ndHVvXWIzLeIq5PM=;
        fh=t8Filu2jjNHmhPEXIJuJSqk4QR6AF5LC01JkOZGpUb8=;
        b=x1Bpvivc50/cjkbGzciV+lxCg+cckNK/9k4PrhEqrX9FKbZLbgZxk9o9yEzp01ooYD
         nBGoIi82kW3odB3QN8bMkC7V7ixNhPBIzqIv1xbZBaTmIi2Xw2hjP5j1qVld4DxZRLSX
         h0N52DMf17e3NgZvkogiw29OSg+mjDquSywdeS42CakTMOyTxYUAZjJ7A7XLhAfDKOSe
         ahTAC1MCXTN1rywUmkevMfE3+k5l1nLsySQmNrd3F8bVa/95DWNHHOsa82V5oGX0i8a+
         dzX1LQHrSs0ykZCjx5WpTHfIqy6Z2yzSa9pWj5fYjiyX9dciIZOzqzMQYlHL7GW2oV43
         KhAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCCJPBiV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e16-20020aa798d0000000b006eaf401b77esor10053390pfm.3.2024.04.21.09.29.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCCJPBiV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713716947; x=1714321747; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyfnQy3RE7q1hQCupGmQCeese//ndHVvXWIzLeIq5PM=;
        b=XCCJPBiVUfUTsqnKPKuhVJFFb57QiBxhrrDMzdNbmB+Dht6Y1xC4mFTIQn0Lp8xade
         VTsUQd+LIl20updmSLdnrTvcCPMKWuaAuc0CSlwXPlpg/2LBkLAUjvjMqOlu09jerLjB
         37vXWqLLJSZ5VDAoNSizO8kW732cLG1l8edBN21mpCmHgmD5dQEH8BLP4dRy3f+DBhSs
         r9XXmdY5uFDCj5sn7SZS+vjz1ZLDM8Fk/iqO2YrrIQhiwfbmGWskpXoocBpEE7h3e7AF
         Rf2LPlSVmOfjbyzCB1aWqVZKWZR220UBL/b5rx8Dd7wnopJRNRLTuN2TRNJYflCE8l4m
         QipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713716947; x=1714321747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyfnQy3RE7q1hQCupGmQCeese//ndHVvXWIzLeIq5PM=;
        b=uDXKJxc8u/BwN0MuqCWjHXURllbPKm6BKrdg0jrG0jX+X6CtxHOcTnIFRRNXQqSeGp
         BvtJvGXM0jgbWUY4Dy3ExHaxdE2oqlZDZbYlmyul8JLjPMoAbL52LVJKgvX2lQSUj3y0
         xt+T/XXl7Fvi4Cfyl2g8Tno8IoG4p8PPMTCYM7I7S9xGJCmmfccTGXtrcsrX5+OndK7x
         XUXzBnXbkBb/V/QEHAPGpjQ9mZqWprxxWvxsgsOOMVkrdJ5y+Oa0QIlzya87VJupE2T1
         Q+l5Dh3ubWXAlV0Cp1sp23t9xmI0XFhWhrNiXMMu/p+3NBGaqJPOwOS3eZM25E+cvjd2
         oJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4PzDzeN+YQmMvnDWrTmtOfAbWkY+iUxPPO4gtM88Q9xTo3DaWfsvbJ562CuVvEgPWfFeU/lsmTKtqs/TEFweOnYmVkT9u
X-Gm-Message-State: AOJu0YwL5ucKhC8cFkAiYCy0KBZXeaxg6agpu/FiIlXUm9zzWunXNuek
	iTfIGBLbP7KQnSlOUVDwmR9GtTCwnKTqXLciGGK+HijIUyayUl6gzAf8nMZOdNitEQ==
X-Google-Smtp-Source: AGHT+IGUEDGMuAojfCufYunpafSYxvQZm30nJeqD2YE41fGszRVNuV24xTsW+KklMwVPNV6KuETgZg==
X-Received: by 2002:a05:6a00:9383:b0:6ea:e841:5889 with SMTP id ka3-20020a056a00938300b006eae8415889mr11446034pfb.33.1713716946688;
        Sun, 21 Apr 2024 09:29:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id v28-20020a63481c000000b005f7536fbebfsm6004020pga.11.2024.04.21.09.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:29:06 -0700 (PDT)
Message-ID: <ab3c8740-463c-4764-9e8a-9a2676366de2@linaro.org>
Date: Sun, 21 Apr 2024 09:29:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] exec: Have guest_addr_valid() methods take
 abi_ptr/size_t arguments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NA/ICmO2fbDG

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> abi_ulong is target specific, replace by abi_ptr which isn't.
> Use size_t for the @len type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index f3c2a3ca74..63186b07e4 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -92,12 +92,12 @@ static inline void *g2h(CPUState *cs, abi_ptr x)
>       return g2h_untagged(cpu_untagged_addr(cs, x));
>   }
>   
> -static inline bool guest_addr_valid_untagged(abi_ulong x)
> +static inline bool guest_addr_valid_untagged(abi_ptr x)
>   {
>       return x <= GUEST_ADDR_MAX;
>   }
>   
> -static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
> +static inline bool guest_range_valid_untagged(abi_ptr start, size_t len)

No, this needs to remain a large type for 64-bit guest on 32-bit host.
(When will that ever die...)


r~
