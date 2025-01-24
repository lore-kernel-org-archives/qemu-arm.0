Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp957647njk;
        Fri, 24 Jan 2025 09:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFkvApvQbRFvZcS4HGXPO5CQNEMihjhR+GSYjqmVwNrEFnD5835VT6YSqP0wx9TdVN7gWrL0qg60/k2A==@linaro.org
X-Google-Smtp-Source: AGHT+IHvlplT32TYf1shthJxro9rwPnYC3d0Os/5Hx2t6taYZfnDstG7/gfcb35V9+bcIyDGn3Gb
X-Received: by 2002:a05:620a:8812:b0:7b6:f17d:f5a7 with SMTP id af79cd13be357-7be631e56b4mr5720552785a.6.1737738882382;
        Fri, 24 Jan 2025 09:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738882; cv=none;
        d=google.com; s=arc-20240605;
        b=KsI1ZDbO12htZ+6ZPG3yCshq8W1BNilrE7+sxpmoW8TBVj4P3LM370QCNByCWUlHju
         KF4xDRvZLl7pFOQfwg5ZsAo2+o90tAR8uGu6JIk0oTs5t9eTqzy+/zAm22rWuP6JDaMa
         kB/AC9ASanT4/1qp+UDtSehWP8riKH2DySZ7FdD9Uo3eOnFN8RLh1UcgtKtWEdbJNCkS
         jsjYConwbeiaAP4RtNmndxOf8yVVyQwAMnlVMWwaprszMnjbnQB3g3LRw1SsliZrg5PE
         EngsfgeucKU5N1kh5MfS3TQlqbIDkXymrHl1MCNrwq880XvyWr1sXWoNc0FyYaAbssEv
         SY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AFu8rllnxpiVVdMFYWTPnHZy3esr/1EOg1ioOr9VZcQ=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=fRC/YsAXqWXAofo9WWkhQQRczkIsLYx6WDwAdX7fRJ/taoEraiIH692TPDwnsrNCkA
         YCfnqvZKSASFrDVFguBE7KlPcYPb0tJLtkP3d+ofkE5mDEIYolZkBLgxR8MLaybwbQRD
         2oyQGntopkIJ+rEI3mrj2BVpwzcBs3Cu+pKF9c/l1vtT77WSG6EbWiDIOd8f11xIVNK7
         avLBSyFEdRxPFVQhzN3Z0i9n9tFpfuFb9ZwEt+CFJ6Papsp4vLiGcBes6LhHjAbklOXR
         w3shiHCOm232Iqrbqf8CKvw89AkzUu5gq5pPm6MyKySenfNQqUwXF3O3CKKi2B4bYX7i
         kp8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WIVd06L9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af12274si265647585a.523.2025.01.24.09.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WIVd06L9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNGO-000288-LF; Fri, 24 Jan 2025 12:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNGN-00027K-0Q
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:14:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNGL-0006Qj-FK
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:14:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-216728b1836so39660485ad.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738872; x=1738343672; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFu8rllnxpiVVdMFYWTPnHZy3esr/1EOg1ioOr9VZcQ=;
 b=WIVd06L9zhYAomqz6yXH4r1ONin0kStcAo3Nk35mx1Wy9cMntBNfMl0uZfe/4KkImV
 ZQtkum63r1+RmkcBBtJcxw2F7p4O1RM2MaATQK4fYAfcpj/44tVLbHUqyo4LuIsDWLmG
 cbheedNF/NSQIKzwAy23sjNYHZ+/w1+nzmzRCqD5ptsWfT8NII4/4CseNCc2uOYs3pqQ
 HpPVS1jPcPYlfV8USG/FWj/rLODPsDFrqzL7V8sCIni7UM4T5i53MTdypj5eZTCCwzE7
 iPrlYw8GvxB1jiZJ49ox1Fes/TuDa9Z4wUmTkrJ+CpVSJz0gcg0D2FQ5cHOBkw+aPVq/
 4mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738872; x=1738343672;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFu8rllnxpiVVdMFYWTPnHZy3esr/1EOg1ioOr9VZcQ=;
 b=Irhesc0jvnUrpNyL9qLR0cD29VjK7xju56kNYxbBRi4y9x4Uk4u2d6/ULxPS1Ue+8z
 nib9dEHtxRIC6tIQYdZcmfErOv/a4ixDd3n340YXrwus5xYv5U1760sicpVq3T2LdVCe
 /6cNEtceF7lv5w9RaFAVot4nklBlN7XuQY2mw4pJ/El7f4KZxfFEJSGcrtPNfYdJBuuP
 zfXIz9Ac8MmyEz/I3dSVQIlbs37aYZLGFOQ3SIoLuJ1XEWpOOjmwUn6+mzi6rW/nGzgP
 9jo9tzt5/IRcjxamFIq3XXIkCBcAPPqP3EYCw4hOFYcOTqML1ZYT5ZKGmnHEMb9LXu2O
 PwwA==
X-Gm-Message-State: AOJu0YxUwujP2IzmKVvkpIzfEyiUDndOafDMcZIlly0FQqOVO3WBMmGK
 ZYLEkh7H8YJH/NEKIG0IEUUMxRMe0abe9Sc5qSmrq0gIWBaQ5KhN4J3jI+HVT/o=
X-Gm-Gg: ASbGncuioWb5+2cHtXh8L+f/lE/RXvcUHZksofQ+xZihtA/NXYqkWntalZGneBeTwvs
 erkBo+fucEWgrJv/ZK8jBBj7S4P9q7UEjDItCj1l6os967D0khlmScsdpistuvN2QaBVzA4cSJl
 BJb6eoSTcVau1gTiL0RayOtiR9KltgrG6OKQuDMqmtDlwlifRO2sbLal7trwm/8sL9LYVYD/MU5
 Ai6ohpjdt+ICwD2kYN9+Uuyq7OKY7U8a9Qub0dJ1N2I2dSuwqvQF6CX0ysJ32+mkxab/x5ECBPg
 5ie/5UfJ0FpmWE4ySy9lsZarlbhZxoYpq5YdSYilHZJxvOi/QKBEXHN5vu9GTfzP6Q==
X-Received: by 2002:a17:902:d487:b0:215:e98c:c5b5 with SMTP id
 d9443c01a7336-21c352c9f30mr499254305ad.1.1737738872026; 
 Fri, 24 Jan 2025 09:14:32 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac490cb8bf7sm1624894a12.42.2025.01.24.09.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:14:31 -0800 (PST)
Message-ID: <bc11c46b-b711-440c-9cfc-38c542e45b18@linaro.org>
Date: Fri, 24 Jan 2025 09:14:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/28] target/ppc: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-20-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4o8WEJenDDyE

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/cpu_init.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
