Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp487254njc;
        Thu, 14 Nov 2024 11:03:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVu2/SS15kTjvstlwtqpSfBrRsRZDFlRLT2GySg/RX6k/dsZLtMMU88ZV7OoAZMv2GUXlupe0Aj9Y/YhA==@linaro.org
X-Received: by 2002:a17:90b:2548:b0:2e2:e092:5323 with SMTP id 98e67ed59e1d1-2e9f2d5cc36mr9833260a91.29.1731610996279;
        Thu, 14 Nov 2024 11:03:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731610996; cv=none;
        d=google.com; s=arc-20240605;
        b=XjycmAkSdH3xhcS5EYbizIpD7AZDRNYwIuy0ZhnccRgjsZala5PsB9uVPQu+sOBlfb
         FB4E8i0fz9U8YKt1RqrjyzxY2xi230D/waij4g9m2rLnXSOIZzqdbT+rDGyQIG9f3y5l
         MDahzamRPCVaGbxYFcfusS1K0NiX3hYhIpF32yyhfVNGZmrOR+DdXEB6+TJ4tnay9szK
         vTqMY3qBQGgvp/Zbpm7+D/fv8yel9zj1aYWb1S/86dzpkg5AvhuE9SWWXmQ6oR92WpFG
         4CzthxWoqWRN4x0ngVEczP+ryBiPQc0Fvb5PaqFcwTqnOKjBneZzlINQX+QITmJivp9q
         4g1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rih358wJwMiZGOQCVS2076aLPZOXo/1Z1k5jdI90a6U=;
        fh=oYF+y2C2OMqZCxywPbrQmgUZebxWZmIrUoMN3QcTUJM=;
        b=jiOe8FR0c9lb3IKa5JISR5w+k4Gkd5n8JuLT8E8vnh2ehx4Sbv/k0Yo204nMY3NfHl
         ymrqmxWjQ/KtBrIgvGD3bMB1FEjGOAJp6LFem3NuIAWBsm+u3YjnWn6k7DpGmpoq1uYK
         7PAXhR9ZRLtG1eAxHFKn5F+kM1teofLSndTg99PQWWq85sbHgwhuY0bZO8a+4p3gh0Vm
         iStkIx1ZE5WZJSDe2VdEBNTajScCcGf2s5jN2cRWCttAjfga1ZIojdQw7pelYNlyFM9W
         /PQoo7c2v/juy1HXMI0XqGjobPGNfMx8QWOVydimEnoxr3IyQhSiDdNBNiHgSDs5PyL/
         iGUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MtQy4H+K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ea07fd95aasor1398809a91.4.2024.11.14.11.03.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:03:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MtQy4H+K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731610996; x=1732215796; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rih358wJwMiZGOQCVS2076aLPZOXo/1Z1k5jdI90a6U=;
        b=MtQy4H+KXbB8Kuyp4IV4Z263BEVu1iHM0ZJEmdFk5cZ3Zpyrdmwa7b07mGrKR92DOI
         Ir8uYWQttHw5Ly1lMNtFRdZjt7AgHSG1ldQcZZK0nscBFOpihT/dMhwOM4m8HMlPoBT3
         DcK6+KOy/lH4hXcRBy6C+UFxwaxQuB4XkTLfCl+h+qZDdmUdtHG2fWi+WgxAf1q5x8n4
         apr1lbxuNWgOYid3W6MShOwgLx5zEes9ZMGORGQli2Ik1QhJbLN945preG9ePfGOnm7Q
         gsuqgvfQt2LWA/ZHdFJSCrjwdeIlHRhcdc+8V3HoKOfIqg6JibJetbrF0101MSDcZbwg
         HoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731610996; x=1732215796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rih358wJwMiZGOQCVS2076aLPZOXo/1Z1k5jdI90a6U=;
        b=Pe6Wh23QhRmu19cjfNdU7l0ifLoA26J3cHohKSUtq4FDpiTWm8l57/1WUeTx8gexE9
         FC2b80RhIs5VsMK0GqEx1HNfs4XSQpi5U3nc68e4K7mjO+1Y2uTkUCDNdrKxHB6pJsmE
         mtkEuX/AEiKIX1x8VtLCb1uV+ZU6AepiIikKqOrhyJRLCNPQm5XMbNd6hxJXsuI9T7mh
         /2LjXZ3ORUIX74/0a2GdhoK4Os/uytR94JZoG1rFLPOpPyipAUPszHvLu1E5wbPPQput
         2F2b/3Gr/VIM8uvKpF/OA7YJdksKS9iGia3oHbQN2VxpD0ZefhibMQ/vqrMl1oDoaaFA
         i+UA==
X-Forwarded-Encrypted: i=1; AJvYcCW2NSXNr3YGCEQE0tjNScUQxRZY2HgkZSz5XHlLmj9BRjHAHMSo7SCfrHd6gKUSeWYVDNTvLFL4RXAWJw==@linaro.org
X-Gm-Message-State: AOJu0YybEQi5unFNYk2/NZqXIi1aCtA3IcjvI+gl6aBrMWBGaqrLbZMN
	ntJqkOQF6Azh+mrLeQQYbPencjq/fixCPgtLdQaso2tvDFuLZTv9HN17NmMEAxvG8g==
X-Google-Smtp-Source: AGHT+IFMZlfLlYP7zrEa9dB05YZT7+BppqP7DMQmFHS+WzGkV8dx/owwo9Gyp6pIZRCLVjxGUXGpCQ==
X-Received: by 2002:a17:90b:3eca:b0:2e2:c421:894b with SMTP id 98e67ed59e1d1-2ea154f7474mr5808a91.14.1731610995788;
        Thu, 14 Nov 2024 11:03:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06ef71a6sm1533266a91.8.2024.11.14.11.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:03:15 -0800 (PST)
Message-ID: <e7fc7e52-6bea-41f3-8369-6b8e5285a71f@linaro.org>
Date: Thu, 14 Nov 2024 11:03:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] target/arm/cpu: Restrict cpu_untagged_addr() to
 user emulation
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
 <20241114011310.3615-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oUqMK/8Fwlt3

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> Move the #endif guard where it belongs to restrict
> the cpu_untagged_addr() implementation to user
> emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d86e641280..12b8466542 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3355,8 +3355,8 @@ extern const uint64_t pred_esz_masks[5];
>   #define TAG_GRANULE      (1 << LOG2_TAG_GRANULE)
>   
>   #ifdef CONFIG_USER_ONLY
> +
>   #define TARGET_PAGE_DATA_SIZE (TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1))
> -#endif
>   
>   #ifdef TARGET_TAGGED_ADDRESSES
>   /**
> @@ -3382,6 +3382,7 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
>       }
>       return x;
>   }
> -#endif
> +#endif /* TARGET_TAGGED_ADDRESSES */
> +#endif /* CONFIG_USER_ONLY */
>   
>   #endif

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
