Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3577939lfc;
        Mon, 1 Jun 2020 17:28:51 -0700 (PDT)
X-Received: by 2002:aa7:850f:: with SMTP id v15mr23414612pfn.277.1591057731362;
        Mon, 01 Jun 2020 17:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591057731; cv=none;
        d=google.com; s=arc-20160816;
        b=HtH1RuuJFCDS/KIeySSLgt6CJdDdvhTyNb9bXA1+U2+SfZXbvdsG/HMQn7C2OxerSf
         gnRWlb3UauTGmDWyf95xNY31859S+kt2vdrb05cOPxAX9LybK8CYGDg9gtmUA7e2kJLD
         kzbbTYQCqbUT/N2zxcesChjojHZ87Z/ZyeBuvm1RalCxPSlyBWE3y4j4Y/0GONl4V3sB
         sWEvnT8UWw0xlXrOIzdOvICzLWex7GpCKmatq9jXhB2OoFY67TlWxNqptUeVqWDuSo7C
         p1Qz2dlF3S9d8r3HiUMg8f9NEly1rFIon3gkuxc+MzGIMR+9M8VbWTyT2+dvMxx4+xZY
         9NlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=M0imsz9/sHNDOFivF5joyeOa325xFr0yZnXh4RIvGDE=;
        b=NWBr4PAnXxS9H7ViU3Y3/zfGc+uGNDOJy4MMTsfPCFy5uSqoJM0PLYjj7KOfGv2iY1
         cvzo+u42EFW1WFruamzdwPKcbBZfaYSH7gNapOy+XYnXS0AWsLjZsZssq1CxmYR6EuL9
         BNrJUqScrwzZzTWj7nZ2cuy0bwugPItrrrcJ3geY0KG+eLp64rzRwl9x+bMq7Umt5MnA
         UVtgKdKz7pCpus57LyUBaAEOFQvh7vHxCJ+0ufkJl6c0+feTyK3PdFV52OaUiuxWfRZD
         TufLwfPtxVn98SSj74ZRSQnlBKcc5YWOOyxViPclb9J+nKej5ZsYUr1K864MmKOzqDcw
         rzOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caC7P0Zx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l2sor942436pjq.43.2020.06.01.17.28.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jun 2020 17:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=caC7P0Zx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M0imsz9/sHNDOFivF5joyeOa325xFr0yZnXh4RIvGDE=;
        b=caC7P0ZxUmC8VLggQF675vGd66ECyEOAHB6faIoYmf4G4GvA+Dnktpl54dYvOZPwYF
         xWnEZY9Q7iODchrCF8RrVoI+9+/m9H0M+oqIt+CbPHPGupPxWrrwj1KzVxBt6TleDsm+
         F/2+yYZS18FSfE7CAG6m54K0ZMHoEIVo8ppkUlb/ayKbXPbuNigx+lhKBxY3QWYVKKYo
         iljTaeAJT8UIJqncKWAIX64DXwWvdNMxcpzU5HXDpRwMO3F7Q+/OsQ6vvh2YZASFNv/K
         Jur75bVhOztTEq+KK3L9XaW5TBS/WfMIaRucBWwDWLZQehX4FaOfEfUQQNtz7Yy3jbVA
         j4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M0imsz9/sHNDOFivF5joyeOa325xFr0yZnXh4RIvGDE=;
        b=mFkMUeHFpzrTF2+uMigTKie0KbO6VNnrcmamRS6J8t3CwGecuaFvbh0FdXdoFjXKs3
         zTIgSV785XJmwGcEiOhQPCIoB5j2dF6ov1BR5Xqdy1KVr9PXEw3WikejhF0sJN7iF5V5
         yAegewmdSFxvJ/86bDb0l/Xz2s9ubEL+3AMxV839rfOje0VnIFqASXSiDfIY0qeFX4O+
         4lwop8wmPu48hK2lfRYfFvPVMMo8lC/rpbtf98tvzu8TtbAVj0qvUgmFzlmAWLyyEr4S
         hFvzJGStE4fuSEb+zQqMEvYNofRWNVu42OS0HY5tKGlrTtOZ9JXgataBgjDq0NBdgdFt
         nJ1g==
X-Gm-Message-State: AOAM5310j/JX6MK6qseaBELq1xKgZLPHemFhtmzSqS/HdY8lC+KrjzbF
	vW1Swd2CtFzW73AbC9vTZUZjjsdF
X-Google-Smtp-Source: ABdhPJz2q6TI/hDHkJdfy22l2v+6jmIL3dfOZ24MkNNqRVe+CTfbVHOpZ7Qr+rKsJJxk63aunX2h5g==
X-Received: by 2002:a17:90a:336c:: with SMTP id m99mr2179067pjb.168.1591057730553;
        Mon, 01 Jun 2020 17:28:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id b63sm487440pfg.86.2020.06.01.17.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 17:28:49 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] linux-user: deal with address wrap for
 ARM_COMMPAGE on 32 bit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Bug 1880225 <1880225@bugs.launchpad.net>,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
References: <20200527100546.29297-1-alex.bennee@linaro.org>
 <20200527100546.29297-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <355ff6ba-ed8a-bc1e-4b74-c87a532e47bd@linaro.org>
Date: Mon, 1 Jun 2020 17:28:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527100546.29297-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /7EAVmqAIH/3

On 5/27/20 3:05 AM, Alex Bennée wrote:
> @@ -2145,7 +2145,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk, lon
>  
>  /* Return value for guest_base, or -1 if no hole found. */
>  static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
> -                               long align)
> +                               long align, uintptr_t offset)
>  {
>      GSList *maps, *iter;
>      uintptr_t this_start, this_end, next_start, brk;
> @@ -2171,7 +2171,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest_size,
>  
>          this_end = ((MapInfo *)iter->data)->start;
>          next_start = ((MapInfo *)iter->data)->end;
> -        align_start = ROUND_UP(this_start, align);
> +        align_start = ROUND_UP(this_start + offset, align);
>  
>          /* Skip holes that are too small. */

I suppose offset is supposed to mean we start from -offset?  You didn't update
pgb_find_hole_fallback.

> -            loaddr = ARM_COMMPAGE & -align;
> +            offset = (128 * KiB);

Why 128K?  Surely this should be an expression against ARM_COMMPAGE.


r~
