Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3425457ejd;
        Sat, 20 Apr 2024 22:13:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXl8Nzkq1399/eq8BkfpL7rXTWw4whUJqMtq0rYzpehsfYBFgpddc7gHQmD+u2G0cq844+zBJI7iFJrauSnvgExOdSR4/bg
X-Received: by 2002:a17:903:22c5:b0:1e4:9c2f:d343 with SMTP id y5-20020a17090322c500b001e49c2fd343mr7952662plg.7.1713676402136;
        Sat, 20 Apr 2024 22:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713676402; cv=none;
        d=google.com; s=arc-20160816;
        b=P3MGQjLpnokFS6y4sF/GA46m6ureJhV5RPqDidt+xvVNgG6Y+8dVx/XbPvfr75KxYa
         3DpoAZGdilGKG/6ro1DggNsMIu+aPKzpbz1huzUN9Ugu+z6Bcc5Ly/sl7jC4amEA6Td/
         V4ob+mo0+mvxTHRMjXIgz9/KzNqKyCoPnNNTWuf3r+WDil/8Cto7JB8GWEAq69zn97Rz
         chOh75Y9oLaMhaez5sXXEMg/EYFhuyXApA32s6R4hQYnqYJp0UbukoPM7/0DAH8yiJSG
         K353oKWPwYRTiSxFf19J1XqRsaeWhranZzV/jLeIqpnrmQbjh/cD5jnH+86vjsndCZ/L
         qYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mTpLBWm76JRiGgj3TbPJnQwmXPjnbwHIYW3eF9O7+Kc=;
        fh=mJ9XvqCDlUspnSvbmK7gitp7SxSnCaLfnf4038pCC+c=;
        b=kpDaCUxorRYM854TEx36E5CH71b02UbNeI2XC3mKzl870OXrD3doAKt5ivj0qkMW3b
         gJEf2UcIyx2Fzz7DsXAmqERMGo6rsvLs1ThxKC+YMQy0NLBbOiHao0SUGIpTb1hzJFZM
         Oh31JwO1T0caDIo13/64jPuPEVkloPb/4euDFpcKXNmm9UbpJWVwxoIyLqDr5+rdzac0
         63QkHn+tF5Vkq+vOSuSfGqo9mPltepptKPjYc6Nf3sNCcI1ejfmMCquf/Ex2AVhLTIr3
         squ2KQUQUd8EYBo/2ooXB3xLczrReFn27IKc5WR4PMU0OXIRKEDwIpmPTz8c9WYieosv
         MxGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yzqtveSH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jf22-20020a170903269600b001e85381524bsor7066950plb.13.2024.04.20.22.13.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Apr 2024 22:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yzqtveSH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713676401; x=1714281201; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTpLBWm76JRiGgj3TbPJnQwmXPjnbwHIYW3eF9O7+Kc=;
        b=yzqtveSHmMhc6d9rmUqfM7XB32tQFtMtOEmzhiqGuk378xzURStj9RCPzVT+Hpcqt0
         vbakA9ur14logz3v/jN5NsLwhqWP71tWjC2hf3IXxkc1SuONfu50QAqok656yvqDgbxw
         iJUXopS04x90vywyz7QBnSWm8Fxpu3fJaounALdsjKl6wMLAKnE6loqkidZ+CS8m8PmW
         0rRpBq7lj1ZvIBs/7XGgW6YC742BPQPT21J5BWva8GU0jMr0WoOWb9bfUE8i3mOrChUn
         OENFc7GW25I3FtmiMxC+fRm3FDpS0S0Ne07Uo8AGgE32JT1GWXt1Vvarmy5u/s0JYci6
         QnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713676401; x=1714281201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTpLBWm76JRiGgj3TbPJnQwmXPjnbwHIYW3eF9O7+Kc=;
        b=jABwGiOvP51LqIGjfk+2e3YM2xcuhuJcGEZFq9KJ+z0bEv66HwICKogqDB92OKkeC7
         yU6Qc09SEMQBt2s9n+L4sqQxwGHTj4jQbNmCE5EHOl02OlR+d6UWCw0LcXCfYO+inFaO
         JuERIR5ivfJAqAqOqB7wxoglk7e5KvMGkPMTAOK5M8poOV7dfwhbMVeXCGyfVgjshhco
         doagU0nfFIblKTQ5M3819F8Nw/LwmbGodRmVDla61wO7SwTsFwdTV/szLBh7c9De+Zab
         yLw6xJ+doA+DM4C3DbaCL7UkhrEftmbgaYRSHh17fqkBHwQEmVOAkiWLUP/dQDTkfh36
         PX9g==
X-Forwarded-Encrypted: i=1; AJvYcCUztdaktPq8lHF1ODx6XX4vbwL4185ve6zWMWAVftjRO7/nVIZrlvdCKPPYNw7dDlJz7p2C1T6W5CUoGhAJY0x1nG+Zx3l5
X-Gm-Message-State: AOJu0YwvBOsdYD1qZ1JLdj9kC//x74fJJwUK/If4cJ2tkkyj3NP6muJk
	w/8x7FxeDSgRIvi0GqlhkIWKVF7dsElLs5z47ibpvjTj93mIjAd+P6QBY5RpiLlS8Q==
X-Google-Smtp-Source: AGHT+IEKhd29z0jAr2WpSvCxM+T6WFxH3wSzT0tYdwB+VmSVAxXcIpTxCn68pslB5olCBknBuFqJpA==
X-Received: by 2002:a17:902:f605:b0:1dd:dde1:31dc with SMTP id n5-20020a170902f60500b001dddde131dcmr8676252plg.26.1713676401466;
        Sat, 20 Apr 2024 22:13:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902a50a00b001e0da190a07sm5802110plq.167.2024.04.20.22.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 22:13:20 -0700 (PDT)
Message-ID: <292e6672-445e-405e-8eb0-effe712d0fe1@linaro.org>
Date: Sat, 20 Apr 2024 22:13:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] exec: Declare MMUAccessType type in
 'mmu-access-type.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WAID+pSMsRn+

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> The MMUAccessType enum is declared in "hw/core/cpu.h".
> "hw/core/cpu.h" contains declarations related to CPUState
> and CPUClass. Some source files only require MMUAccessType
> and don't need to pull in all CPU* declarations. In order
> to simplify, create a new "exec/mmu-access-type.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h        |  1 +
>   include/exec/exec-all.h        |  1 +
>   include/exec/mmu-access-type.h | 18 ++++++++++++++++++
>   include/hw/core/cpu.h          |  8 +-------
>   4 files changed, 21 insertions(+), 7 deletions(-)
>   create mode 100644 include/exec/mmu-access-type.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
