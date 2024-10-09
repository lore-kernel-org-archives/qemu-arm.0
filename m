Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1055608njl;
        Wed, 9 Oct 2024 11:55:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9hiFi1LuCaiqSyxVGa/YQCOUNrhd4qSUgqbcUWKjG5bAvZMaoxTos/tKPFRW922rA/DWfjgG2vcs4Yg==@linaro.org
X-Received: by 2002:a05:6a00:2295:b0:71e:69e:596b with SMTP id d2e1a72fcca58-71e1dbb5b09mr3804878b3a.17.1728500143471;
        Wed, 09 Oct 2024 11:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728500143; cv=none;
        d=google.com; s=arc-20240605;
        b=I5UzucBLs4uEUZmL59G7tFVVlxuBxmMhBLRqArw/cj3LZuZfkcPzB6cY7QcwStD/kQ
         7qsj3v2aJO0wpIIMIp1iCeaM7W35idP5gO4AzdE9e8gU3l3k274TQRkjdJEd0O7Stp0X
         4ZO+zc27chkGEEMsPeDyjG5HLnVVGJ1i5woQuw2AGAL1hz7mFx1NvFneMhn0Mx5BOaz7
         4F3oDeK/7NkyX9zc5u54BL57vpuBlX+H6KS4khYaL2ufnelsars+NJJgSy7YrNS60qzD
         s6RJ8LS/esTZhZruiuvml+7HKnHPvZKR7VVcVN6N3su8Irek82TVH2C1ekisihMDIq7N
         XEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Tc6VkZnx60BiTg2WXO4EChgnJa2XgmHv0c0PzLUQ2g8=;
        fh=ncH9QQehDCXfh7fC4Zyvjh7VOarviSQDnOAmGIxQlTk=;
        b=dEPkPs256G9WRHcKfWhhvqiQSjV4BrgnjxGfxFgq1kqjE5Q4uVrQh7BmBErIcUXbFk
         NOngepO+wgWtqfanW+gpbhKc2T/t8/e2suQ0FOHQmsStwoudHDUXB88YKMelyfP1KHab
         qvidP9lWGGRvxPYJrfUDAXcFhEP4NET3T341uNDZyniNHEnNLLY2E9RGnmfdQfg1ybNZ
         a14GyuDHyt6BFElw+inCRo6sup1iuoVAYhE9847vGCziDDy/Oyb9S5XbvTyrzmMOms94
         N74v5OnEEfxVbgyrt/lYXScKnzDcWAWsieG0PehXLWpexaJaBQT+RCh/EmVPAhHa1stO
         9vfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9UuwpSk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71df0ce13b9sor8414265b3a.5.2024.10.09.11.55.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Oct 2024 11:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9UuwpSk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728500143; x=1729104943; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tc6VkZnx60BiTg2WXO4EChgnJa2XgmHv0c0PzLUQ2g8=;
        b=Q9UuwpSkgH3hfRBzNciYtllqMYqQPz94zwTIY6kR1F6+RDGyFggtJ0MYxccH7tgp2u
         2jM8OeHddgrhGURI4G87hRfLiTz6lnmESbn3wnGCkyUcj1tYaTtVqt9pzLJL+ceurIjU
         +gWCj6AFiQuaaB/9T5lqE9hjCdrOKBW2+Mt4uQzi0cODaYd7701ofd1o6SYBqM/J0Mkl
         GttO0+/uK3va+Tcvg4DnO9RqGBvzjq2Vw27AW6QHlltH4ccA4Si0EBD/XFDTvJ1x5kUD
         MnLk5My9iikU3BiIAIlKWNknFOOzQWOpQhqIH5h+ZLlEjaVuBOrtAphjGwOxMPbuehZe
         CMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728500143; x=1729104943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc6VkZnx60BiTg2WXO4EChgnJa2XgmHv0c0PzLUQ2g8=;
        b=b1yLP+lkU84JjHlsSF1xOpH1CNhJfk3DycqxUS4QmXCYxWlvdoE/5lXljjzrxR0xQV
         OOvJ9z/DGH6BqkPLJfKWY2IcolmEqvFTY+t/LpB87VnylxP7Lbf7LTlgDcitt4z6bTJN
         0LanrpYduGoatt7nyJfH+pJ7et9aZuh8wUX7TzE90/D4FxGE+oYI47rZU1Vg68zfAz2J
         4Mhk+ak4eRsCQdfzT6kBurPCrSq+GqGcDSc8wleQdyN6jUgFhsJDDAqpyJqC3l+/VUvd
         xQ9VYV9sRghSqFezmih8Gh/XFZA0WxidUJTnz/YMS9STachE7Af2tEGI6+0biWLPT7uq
         nU8g==
X-Forwarded-Encrypted: i=1; AJvYcCWR4YQawgHeuoyEYBSFO59JVjX6ItfpRWDuEFkpeqqTnhiIazanqQNiHs7lcF3NXmlEwvOtvg6d++MUCQ==@linaro.org
X-Gm-Message-State: AOJu0YxJ66jSKfS0sykEvy28w/+YT+9FQuUbY88f/nBS0fdntRCwMv8B
	y/qSh6BV5gB7eonHJwzih5w+FbtFyLahRX+wdbBoQcG6ecPp8Yjk3DUjIgyWD03Kgw==
X-Google-Smtp-Source: AGHT+IHFh34X8FwppPdPD7NUkEI4OdCjpJWkeGjLIJ1+Gvz2oVK0sToQsbnPoVjVfsaH8OQ5e7yGTg==
X-Received: by 2002:a05:6a21:9d83:b0:1d7:fca:7b46 with SMTP id adf61e73a8af0-1d8a3c49baamr5989989637.31.1728500142944;
        Wed, 09 Oct 2024 11:55:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.100.35] ([45.176.89.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e03288a37sm5592380b3a.155.2024.10.09.11.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 11:55:42 -0700 (PDT)
Message-ID: <dcdb157d-c9ed-4786-a58b-b31357cc51f6@linaro.org>
Date: Wed, 9 Oct 2024 15:55:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/20] include/exec/memop: Introduce
 memop_atomicity_bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241009000453.315652-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cyvhvWAfua4d

On 8/10/24 21:04, Richard Henderson wrote:
> Split out of mmu_lookup.
> 
> Reviewed-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memop.h | 24 ++++++++++++++++++++++++
>   accel/tcg/cputlb.c   | 16 ++--------------
>   2 files changed, 26 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
