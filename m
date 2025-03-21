Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp498687njc;
        Fri, 21 Mar 2025 11:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEr8tG37MqBDZKvJU0yQq8CpdTIG6wilxhZs0KCebr0iYjySxUIgoZbNPCcomw2jS1S/P4Q1ZFFxvI4g==@linaro.org
X-Received: by 2002:a05:6a00:2e24:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73905a65919mr8534888b3a.24.1742580357556;
        Fri, 21 Mar 2025 11:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580357; cv=none;
        d=google.com; s=arc-20240605;
        b=MZYkvIBxoIh2FQfClwLvffV5vx46R9WfdCzqdB7aNJbPIKiKwReUj7fczfJvLEq2D6
         P23OiZyuHm0mRjGcO7kdWUxVRN6sU4/Qmys5raUdX3shZs3rkIkMj/4e/UtZ9CsSjXI2
         k3s7E6K2bvAguCOnz5rcDhkeclxCLKzE3crdiRKlLTWQrBQ/VUNF+sVFEGJ35Q1Lhqh1
         tKO0nTFfmYWlxAJK04AKIRhirwvG1Er01xqM46gFGi/jA6ClgdnBi+AwT69qBISDyOGX
         ljgejZzED3jZw0xT9f7PZWl25kTnoCzVy8LG+C4vOGwwb27csT0O2LVY1Zd2ScQSRSy0
         aUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fcsRCqIlZYhLkJXmi9uJeXTy/LuuCnSzcHfkPDugb3c=;
        fh=n777UtwlHFGOa8sRu2vaa0LS6ZSe6lIELesyayf0z9U=;
        b=O0C6wJ8MpAaPDvfdlhZ6u0JN3lzSd8Pybx8WRMYn4i0y1mN8CAeB/nCfwB17y36noT
         x7R4lgPVtljK1dDPHXlmMkGWQS5cD1IRZUDYeDtesMPnyglWUlifvexXC50HIH8kBfnC
         XP9gKzl7fVAOYeBGfW8ALNMmYjObpUcXva6+wDpeb3v5ukaeOQS30XXbN4WF3UDtiaOl
         XK6d507ESDUZwWDeLaJAzF1FYc3Mof0UDyHJ6dhaJ71RizqjCFFovLHP1zlOX1j6hF/Q
         K7i2IndrxhOqz0wALvEyfP9VI+JPCOC3jZuXxKQOahfrt3rtdltEy/HbaJiMhNteQbR7
         1VXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PInLNQ1p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739060579a3sor1515638b3a.8.2025.03.21.11.05.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:05:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PInLNQ1p;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580357; x=1743185157; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcsRCqIlZYhLkJXmi9uJeXTy/LuuCnSzcHfkPDugb3c=;
        b=PInLNQ1pKdcdKK+8R/uo+QQ1gMag+nl4V/1TqpXczRbtGfByYISclNje4NJkNA5kyA
         ukzYIu2hT4rC1BXw4Xcs13ccHGX/Z71Ye+W7xnJScURdavcWPNBz3Iecek7MOdeGvvff
         R6fTgy3AKjo4BwXMduOs37OkQaKcfFkqcYQReTcjV5a1mO6OuIq7YwKcgBencBlAMrxV
         skMLLASkEo4ir3KPGcPqCuKqg/EjZsTafap1NVmMqos4FdD586ObmwLoUgEBMlQ34bKc
         C9Cap+8rWLbnt015nDrMSPGvPBYxYd1BXkpex+HiURRnktbYwNlPMffoRWP2s/RJGdUS
         1Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580357; x=1743185157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcsRCqIlZYhLkJXmi9uJeXTy/LuuCnSzcHfkPDugb3c=;
        b=B59SOMhAH9UsR+Iy1Dhzjdvfa9P7MIzREgVa+WlKMnv4lDxlLO5tw+oXHg9Ci1AtWW
         tkTnY8ToVnS4XkKZ5fZfZDcwqMrRSzQwpCDOmelI10UJHzxCdhdcBmDYwQdZjkGMIVpv
         xTRWHxCXhqvanFdLP+W7Xm/thfHP5O0x1Q424seEJqxctsCZtacfOYkWqIeqygOyabmf
         LAys/KFR92BRJq5/D5cNGq9ScDsy+Az4j6ng4BHuhNpXFWb1Uy9Gh9k3eeB0fnzuZarf
         KnoXablqJ7a3skoLvyc4D/Ze3wgpddZm2VmBE3kD4lJ2ojLbs4kvWJRdP535O5RHMfIv
         795g==
X-Forwarded-Encrypted: i=1; AJvYcCW8yFmVCNJiYjd9rVzj9Z++dIfOwvgIPFqc1ZrjYk1SvOL0HIq3P8+GwosFjo1SWjB/2UujTuZ+VHQBDg==@linaro.org
X-Gm-Message-State: AOJu0YwnubBSgF3+b/ILi/Lfy2X1of1Rlt3cm6cFCN6B3RYcLyrkTeNq
	38DXJRFHGKQXtIB1+x+y66UoYedwU7GuRicmRqgk0pNTIK58FW+q2KnMCXrzlACtlw==
X-Gm-Gg: ASbGnctD0U/no3Hjn744J4Z+zUvOIgRRcvCO48Tz+9QF4teOQE0sO1+i6kIb+R/6Kb/
	pXdTiAQoNIt2zP8Dr3ZkkyINUteXsSIFRPX4sbkHXJF35NiAz4ADRl6ilgFg63Db4fPIDt7crMP
	QeY+45w7f/iEq2wm5IZFHzN0zInwE8ziAC+NsBJm+B89FiPgMi1LOyg2cz9VdBZPfdwxtNV6fyj
	I3r730zOFhoKvPtjBdohC2hnHfqCz1o2q1ZHzHvZsAAnVWH6MAF7O4QMFaHTIH2ZgV8LWUfzyQJ
	9i82qqaL1lyBEvLFKmh4tNAE0+QQu87oXdhGvDGAtbB61JuUtfdniPzwDqI/8Wz4GmYJJt7I+n4
	7EJAOzE39bP/1Dap3Fdo=
X-Google-Smtp-Source: AGHT+IEh0K4m79qZvi51zXutwZPPSNgntSySIgettNINaF9oH0PHmuS8xS7yjizBrcB/q8q2pSoCug==
X-Received: by 2002:a05:6a20:43a2:b0:1f5:77ed:40b9 with SMTP id adf61e73a8af0-1fe433195b5mr8209998637.40.1742580356943;
        Fri, 21 Mar 2025 11:05:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd57d6sm2375807b3a.58.2025.03.21.11.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:05:56 -0700 (PDT)
Message-ID: <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
Date: Fri, 21 Mar 2025 11:05:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ZSLFdEf+HQ6B

On 3/20/25 15:29, Pierrick Bouvier wrote:
> We introduce later a mechanism to skip cpu definitions inclusion, so we
> can detect it here, and call the correct runtime function instead.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/target_page.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/exec/target_page.h b/include/exec/target_page.h
> index 8e89e5cbe6f..aeddb25c743 100644
> --- a/include/exec/target_page.h
> +++ b/include/exec/target_page.h
> @@ -40,6 +40,9 @@ extern const TargetPageBits target_page;
>   #  define TARGET_PAGE_MASK   ((TARGET_PAGE_TYPE)target_page.mask)
>   # endif
>   # define TARGET_PAGE_SIZE    (-(int)TARGET_PAGE_MASK)
> +# ifndef TARGET_PAGE_BITS_MIN
> +#  define TARGET_PAGE_BITS_MIN qemu_target_page_bits_min()
> +# endif
>   #else
>   # define TARGET_PAGE_BITS_MIN TARGET_PAGE_BITS
>   # define TARGET_PAGE_SIZE    (1 << TARGET_PAGE_BITS)

Mmm, ok I guess.  Yesterday I would have suggested merging this with page-vary.h, but 
today I'm actively working on making TARGET_PAGE_BITS_MIN a global constant.


r~
