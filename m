Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp495887njc;
        Thu, 14 Nov 2024 11:16:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3sUWQyOxog+n47cMR9Pl/t+xtKuiXp3gS8Xpc6PTiECWVROYAJmoinO1dZxxRrL0ptk+ccOn4uzySCQ==@linaro.org
X-Received: by 2002:a05:6870:7196:b0:288:4313:a3f8 with SMTP id 586e51a60fabf-295e8d51887mr8007805fac.13.1731611810798;
        Thu, 14 Nov 2024 11:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731611810; cv=none;
        d=google.com; s=arc-20240605;
        b=cJZ6C8c5jVGbeNfQ9jqQb+ees8203wl8guqRLbmjTXt1y/gNqJHo33y+dF/SENBqP6
         8S5rCXkP97QrVBBoa8qn70hcjJdzp6CkmpkPzzATrmLOFHQAOTom4ePqO5g38GwaIyZv
         VA7ou05/0iAqtA7azfuU20PKDXwB/0ZgfzWrIYH8/qUBrGIvnsM2yAvfhr5ljaF1rQQz
         xzYaiitLGb4qb82A7zlFaQUxzBRjER46tPHxZoeJQe8TLRZoF7Uqci6ESiH08W4WcI97
         gMWrxZk1eVE5dlMuUQDJG41R0vi8ochShf/C21zY7NbjVG5931aYZn2xWQwhRD/L/2GN
         d/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eZH2DVANAG+P+eSPg16nqAoHHKBm4JbZrp1eN8ibWPI=;
        fh=cZeR65ab1d4jCHH4R0tZc9095WNodc4cMVaGr29/ONk=;
        b=k/O2VMLYp1Yypa+bQ5j1FRufMOunGFU7DLEEwjpjlPKXytVF4bkJDbr63BfrdbpCO9
         EN8IRKyRQN0I/Jd8nhvEktw1Ejy1qumruAGRlidxooyxGY+ALUXhAil291gqnhukcJ2I
         zgSSuyacn6HMN1iRRfEfNC3nQkKM9r50dY60K5UVpLE3vxPw3PpOunASXKn1IIteyuuP
         kD7eRt4zThsWhtkSlLAHWFPrF2vow+x8ndoeYwjTLsEv5GSvnQvvVVAv23hrR5tYtGxb
         fOd6aOi6ACSOKYpf+MKM0DyA5T/ViStP9MxfQJjeW3j1uyG+UxLjIRnNyGiuoZV057kM
         yy9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPbKGEAu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7f8b3a269a1sor1272563a12.6.2024.11.14.11.16.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 11:16:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPbKGEAu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731611810; x=1732216610; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZH2DVANAG+P+eSPg16nqAoHHKBm4JbZrp1eN8ibWPI=;
        b=xPbKGEAuioHzRk3V4jQMuQtCoWBUj8+fhTm2Tm8QA9bUSwlbg5ui/Y+EbYNWtm+Cg6
         eI0mLADaWbq5AbmTw6FKw7yL4lBMLpANdiMIkmFBCEo4rV5GUG6xlI9j+UsYDHlqPDLS
         KWYyMkdLRhQbAeDBYQD7AbV1mF+ifW+1T9mk3eUGJHfW3e8k0e7FBVFREk8R45YINXtB
         BXeIw0qkXQfEHQW9+mutnSTVwSb5xHTS2OsUb6kTNdGmOMraD5E1keph3IupFV8vyX6N
         +Lm0K5NblRbdTPJS13s+Qh+i80hEiBBNf/SppK+QIDyVNaba/P+crrj08pi99/JJ7C20
         TdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611810; x=1732216610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZH2DVANAG+P+eSPg16nqAoHHKBm4JbZrp1eN8ibWPI=;
        b=edb0nYeV95/YVD2ZgzKxc0tDTG9X3M4e+fXXVmhQSFwi9PFZ1QvKn+kxN2q0BMjNiX
         E0nH1/bioKc061bCUxyd3UYFuI6CATNuP2MLg4wWVsWJPVh93bDsr97juGEzbXpAVHKB
         McmYbErb3eHwBgVxZLUv29W0Xg4KeKU6PK3FDT4v8kANHphKUa4A603Cg7LVtjPZdL/H
         ivxNg6cYbg2sFvtY+SNCqHCgejq5qYLQ9i4eaAa5FxANehtUN53jp7B5jt6ukkPaI+8d
         OpKrfxCK/O6p/ypPQOt57xdrF36qnMDjiIo/+fEKPjRu4lksLmPDDlLKE6qGw61l+yJg
         IpIg==
X-Forwarded-Encrypted: i=1; AJvYcCXc5XqsY/ha2h1dYHfSCw1aDz+K9VIlF+gUBIvuskCsdf0uC5sgPT4ilW8TBeffTGiXsiGIHep4EwNqyQ==@linaro.org
X-Gm-Message-State: AOJu0Yw1ExSQYwXqX8igsks85aFRI40PqBSItf4h07H2g/wA89W8B/vd
	6z7VRN0QVlNl0JP91PJK7Vb/11vLGlkW9scqsuw5I20gLmfjbFKlPXKquAKvFblK6Q==
X-Google-Smtp-Source: AGHT+IG2WSy20tbd1WlDDd2eLCFXNIER4y+7/RAis5HfZoesliPPN00wgYPkBLb8EtO4vn4Yjri2iw==
X-Received: by 2002:a05:6a20:1594:b0:1c6:fb66:cfe with SMTP id adf61e73a8af0-1dc7039d061mr11177170637.21.1731611810338;
        Thu, 14 Nov 2024 11:16:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.136.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b3563522sm1455253a12.0.2024.11.14.11.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 11:16:49 -0800 (PST)
Message-ID: <ac704a1a-9738-4531-88f2-e8e9584682c2@linaro.org>
Date: Thu, 14 Nov 2024 11:16:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] accel/tcg: Have tlb_vaddr_to_host() use vaddr type
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
 <20241114011310.3615-13-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iPKUvB0zgdtL

On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
> abi_ptr is expected to be used in user emulation.
> tlb_vaddr_to_host() uses it, but can be used in
> system emulation. Replace the type by 'vaddr' which
> is equivalent on user emulation but also works on
> system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu_ldst.h | 3 ++-
>   accel/tcg/cputlb.c      | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
