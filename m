Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp945220njk;
        Fri, 24 Jan 2025 09:00:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNH4ZT5YcSweyn3WXhAKebf3mUcGe2OEDhkeOimo78EX2T0CkAXZOXPa720839zBi64tbihrvP9X1GuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGX3ItAvnPJXegTPWfN6ZaMl/DUmuPrhMZ2UA9AjOn1EGKbBWWU5orCg/ODh1ItPFoikeDG
X-Received: by 2002:a05:620a:2404:b0:7b6:dc4f:8872 with SMTP id af79cd13be357-7be6328a9famr5083686785a.56.1737738016866;
        Fri, 24 Jan 2025 09:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738016; cv=none;
        d=google.com; s=arc-20240605;
        b=XYMU6vn/L3D9zhUYd6FTrzPsyNa5Wi9BwAHsWIycpHK9/ujGWvgD8QPiQxAyKMhET3
         A2qtNjM3aatPl7ew0iAIuQ0OQsLGt7VRlXM+0wW413B8I8WLjiu68jmlB8Z1bwqY4fDG
         jQox9DcwD3JWO8yN3K0FBfu/dmpOOGQsFOIxmFDx2ecPK9dL2C6+GbDAXGV8fbHKmEBu
         7fT/yi7CUjChgEVd6MyAfvbpABCSJMRT5gEJLfCgFGo0IW4BHcxZUxZyw2dJsUCAbAZd
         TlG89okJOZQ0dH6x+4AH03wnTAxIkb60V7HDWZPmHPkvV7uVjNGGph+bgGL5aO/EfYU0
         iyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EyzSLdrnSlaoLoH41d7rkDSokRQub3XCHwJ1/lPMyoo=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=A3C8AlbiskneuFsAq0BQXUNMFuJ6dUG2Sjh8t/DGRh2U23gA4To7LiLzbYfzWl1cTB
         70imjaAPwFBAs5+RbYYCePAQvTLFIuNee2NHtz75F3QHadeDuL/Az73h07vxgpv/tFi0
         EmdOyOSc32Tol6YSKB+K5mubQjE1y+7nN+SGd78FGfdJT3c1fpcAmMvzIg2haLNlAc8I
         ZLJLXCciiaim5drhnYDH9ZGH+xAkQ0+GJ3xpgypXHwpoV+k59L9g3XOyMsg/dSJUVV5v
         Tpd6IHTHLyZ6u23rxMZgodFurrc+RVSEpKNhpA7x4vT2nP8aOUBWqRqXtP40rY9ZLstQ
         lUmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rPYo7O+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae94695si304194185a.167.2025.01.24.09.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rPYo7O+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbN2U-00064G-Ib; Fri, 24 Jan 2025 12:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN2E-0005oP-E6
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:59:58 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN2A-0003nZ-CD
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:59:57 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2f441791e40so3345443a91.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737992; x=1738342792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EyzSLdrnSlaoLoH41d7rkDSokRQub3XCHwJ1/lPMyoo=;
 b=rPYo7O+E5o+E3v27qPXz6j3mePiRSHT5oEhMzMsveR+wPja7Xzslei/Cdj/5IHrabz
 y3yM38OW5/kVGIymjO6zO8wGe1GIn47qn2lm7yox62ulr4c6i0oQHo43cp+UWpH5aVWs
 qdd/YxCKGZMRRZyyBtPaeCMbvv4VfLsEjaYcRAPgREdE6mxx7Wd+3ub0RjQ7kF5zC0mC
 sdeUcVX7E7ohS2Gz0rJslpOQSgm2YLCgTzf20UG1bvL6pvp8ubMF1ADw4VkznZ2HZsV2
 P8atb4Cs6IqewB/90XVMMQQcrcjYUU49UrDF4qWgJlnKauDYJ6XVddw6S1IW9QcBh1Ew
 wbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737992; x=1738342792;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EyzSLdrnSlaoLoH41d7rkDSokRQub3XCHwJ1/lPMyoo=;
 b=LM9RTrnvBsX+s4KywAl7ET5DjqDHCmEyieBWz83mZLXNeo927zYO+7UWk86zPM4rpi
 +/9cmjGyGp4/9H+4kLnLff1bIUJyVSq2i8Q2wYvnwoHFmrlwRFX2C7gQq5vp5mXXUQOC
 v8qDoLkTGRxFXONPmh5aYhQvs5idP6RxOKrRITJrKIFTiInVVP0uhL5RFELLsZbunR0q
 FizKBYNClZkuJS2AcTviMYH4Ex1ROfiumh/WJkWTWYkhbXNcdpIAlx+VAPCtl6FMtX+t
 JL37p7D1HiLHsnVxfbruDfHjXGu2LTIwd0uUeOqSQPJ0YVbkGoOGDYItd2Co6cUXQKhh
 EPUg==
X-Gm-Message-State: AOJu0Yz3atsBzLvThYtTuhoXwerfo5RT3Mri3PzAmfsTxl1L5Vem4Y0V
 L5NTHxv8l22t/vESy1h5QiH1hMOw9jGNQ5qEjuZBB09gjEra9b+QWZuR55DBMNs=
X-Gm-Gg: ASbGncu7TPBj+5PAOE6w0+vCzLRhoXZriIDNbmi6JGqquNiz203zI/6rlqf+e62lfp/
 x2jl/8U/iF/A7mtJuo30Li3Y5drAIQtHP4fggh2EDaDEeIDrO2HuB6LxnECx29zWoLfSQTHcUvk
 pSI+/xe/+bTGmqyH+xEpvlcUkeYHtgwOqEO2cJqlN1A0bPJWYHL4bN8hrZzbVpiA0dYIm7RLVNF
 N5VfD/nZsAvi7hQvlco0qqphrBJQOgUUWadgn0Knt03ozRR0mYEvHUAmBrKZ332k+kh/0YjG04H
 AqLDZxaP5//s8zN34IDenw9Y
X-Received: by 2002:a17:90b:3a05:b0:2ee:c9b6:4c42 with SMTP id
 98e67ed59e1d1-2f782cb68fbmr48395990a91.16.1737737992611; 
 Fri, 24 Jan 2025 08:59:52 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa5700bsm1990591a91.17.2025.01.24.08.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:59:52 -0800 (PST)
Message-ID: <9afcb089-2d40-4b0b-84fd-479e8cef831d@linaro.org>
Date: Fri, 24 Jan 2025 08:59:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/28] cpus: Un-inline cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: 7VmywFEMOiY6

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> In order to expand cpu_has_work(), un-inline it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 6 +-----
>   hw/core/cpu-system.c  | 6 ++++++
>   2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
