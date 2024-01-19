Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1071987ejg;
        Fri, 19 Jan 2024 09:04:31 -0800 (PST)
X-Received: by 2002:a05:600c:1991:b0:40e:8f44:68fd with SMTP id t17-20020a05600c199100b0040e8f4468fdmr40077wmq.3.1705683871477;
        Fri, 19 Jan 2024 09:04:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705683871; cv=none;
        d=google.com; s=arc-20160816;
        b=XceA2DtgNyXQv+ldRjOR6Unxp+myzXiI7lzHzHOrtkniQtCEdFVp2YBVo6+886TI8c
         a+lR3OAEIxEkqgb8572tDrAsqDd+lKV0clzH4R45hfOvXNJe3k1e9FErLjMotUpb64yV
         e51sofD+1rR1KsuB/iRtWVAUpiHGDkdZEVtb0KKAK+mlbJUFUQe4BNx/8A57qMd6yfH3
         uJDGdm7tG/uxyPruG2IxVfcAIV0JEV4cVdbTgTcyHkJjxl/+Cx3rfHhxrUTTXbhBV4aR
         ldkepShpxNKSCsOSi7LnrhOHBCJ1JgjZqOKS8F4Y95gpEGYd85kTRBOmCbb9rpdbVVfI
         IswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qc2Peb2JtOjy+B1gVthMdZe/szYQ6eQYqtZctt3o1nc=;
        fh=gN7tP2RJF6R67uHDD41ooZSyvekC+MCfHBb1bZmZwmo=;
        b=f6XZ2EOoXMxmAPMs1gajDtivvCcY4PM+KDkKyg1erMRGDlRsyW5COpCtkrgofcvjn/
         IkAiHTWjpPBXB99bX2XTAXcTdkSTvkHKEpEjZmRfDCl4CVosw9zYaBjMIuypKI971BiL
         E1u6ukTLzcy8GQLDquY4aF/RtpXhPSnYbpLyAMn9/yRHysE9QEx1EVRcZ5+MIuxCTgRt
         iDerdvNl0UBVMWPfeG1PK0C8LeoPXsSS0iI5xJ5kBlKpeHFKNCqwO/DnbxZaZy45IpM5
         qBXUR4NosbKa6jwfw1mloqn3Tf0DJmOFM84JIXBVuS2jJDMP2DoK9nflU/8//4GtBW1w
         Yqnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mDuirnwy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h4-20020adffa84000000b0033739d761c8sor526036wrr.2.2024.01.19.09.04.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 09:04:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mDuirnwy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705683871; x=1706288671; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qc2Peb2JtOjy+B1gVthMdZe/szYQ6eQYqtZctt3o1nc=;
        b=mDuirnwyA8ToAk4Hsf8f6+IbFQIsASn3t7rTJdntdLxkXbhUhKZo/5AiX6S8GahZ9m
         JrnrTyA8zpv+Ju+AObICacnD66lalyCeuilMqnE81PG2heaERATJf58IBMgrdhVGvdmk
         6hepbNSw3Qiyw3BQ0x0M3RGBwASaXn3xTqrjCanT+xk1DxOwRVjQhkCL+oe3CwKDTgzD
         Ybf7bAIROgupflzVPepKV58pnCJGHyEwR3VfuQu3k44+p6x6RYeHep1nPGpT9fMxDGry
         05NOvhirXQvPzGFjUWHffN2TmuFlFLzHdGmq7rvcRbKCj/Za4c55/6CDGM4/c0eiv5MS
         y1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705683871; x=1706288671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc2Peb2JtOjy+B1gVthMdZe/szYQ6eQYqtZctt3o1nc=;
        b=Nu3obmkLeoRh4/bUQnmB2tTGZToKq4Oo3iFM31iiJEXuL0NrrnFD243lYGUqATl3ms
         CiutP3dr1jPhuHhrVXzHuCc2VH6PL0sSVnWE+wdZ34vNHvXTDT8eTst4/2iLN8qBOrOo
         k756TEojhL5vQBBE2sA6QCqECQk0qay4C3GTAqIsydDcyxBWVsWbmum/eE8QkoLIj+zn
         Ur6DfSi69Y9HfIcWpfHfR9hrFc8moMGViAA3nREJWYmf0eb/9xn4XJn6LRdigY4LxyW3
         XxofEMj9onLS9UCUo0p12KQDOB/Mmu711w4N+6BpFthZWtGmX56zdL3lIot7I3RGwhQu
         Irkw==
X-Gm-Message-State: AOJu0YxRyo/P+1AtKwHfjc+H2PlV2q6MN6h+dhlgSr9C3dHQaMg5+j3j
	6u/Lu/Ic+XJGVdvPgPIQwgO+C99Tcap6xdK6Ksrh3iuCMiGSPdgRotHq3Laro0BKdw==
X-Google-Smtp-Source: AGHT+IEDul5qUywMEJN+jSpZ6HXwnoasyUWK6xBsr0YM5aaNwbaNPCRkpy+8DrtQEvcE2bjVbOg8uw==
X-Received: by 2002:a5d:654d:0:b0:337:a7fb:90d6 with SMTP id z13-20020a5d654d000000b00337a7fb90d6mr5721wrv.79.1705683871090;
        Fri, 19 Jan 2024 09:04:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.67] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id o9-20020adfe809000000b00337bf81e06bsm6914635wrm.48.2024.01.19.09.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 09:04:30 -0800 (PST)
Message-ID: <e25f2ede-1264-4c74-bc10-df7d9f874d47@linaro.org>
Date: Fri, 19 Jan 2024 18:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] hw/xen: convert stderr prints to error/warn
 reports
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
 <bf5504369023dc115f0d7a756c4c5254fa9cd10d.1705670342.git.manos.pitsidianakis@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bf5504369023dc115f0d7a756c4c5254fa9cd10d.1705670342.git.manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IFQHkYoQqGbO

On 19/1/24 14:24, Manos Pitsidianakis wrote:
> According to the QEMU Coding Style document:
> 
>> Do not use printf(), fprintf() or monitor_printf(). Instead, use
>> error_report() or error_vreport() from error-report.h. This ensures the
>> error is reported in the right place (current monitor or stderr), and in
>> a uniform format.
>> Use error_printf() & friends to print additional information.
> 
> This commit changes fprintfs that report warnings and errors to the
> appropriate report functions.
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 12 ++++++------
>   hw/xen/xen-mapcache.c   |  5 ++---
>   2 files changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
