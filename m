Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3714735ejd;
        Sun, 21 Apr 2024 09:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQoXHTqLfjOskjxpy3SuAVT+gloQtJ6mxkzAx/pdF6tD3Sxk21lcnH225Y9gmCIXtTT85+KxkxflxLa+gYfmd5cuQ65hzp
X-Received: by 2002:a05:6a00:139a:b0:6ed:1c7:8c61 with SMTP id t26-20020a056a00139a00b006ed01c78c61mr10962126pfg.12.1713717395358;
        Sun, 21 Apr 2024 09:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713717395; cv=none;
        d=google.com; s=arc-20160816;
        b=bBhgykYrC3KvBnljSOMOmrVD/vYmeu+LTWWCMLpyhUH6PsQqIZEm/q+DbCWHc1u7vF
         lYM+MshgtcyIgaPFsJnje1WJRWtW2HF9Vg1LL8UU6O6+SC/2YFg+fC3hmQFql2HPM9ly
         uPUgxROJMIhKrHE5Jt7O8sfwZNuZRA7SVwtkv9G5XP6jvqknZPX5DgoaqFGcQb4IZ2yL
         mEvQlT5ddznwOjvud+WAr8QNapFBMsbv5GwND8QeZb5smniwBhi9L5r+XH7ZzjAYuPU/
         30PRyD/rhSSrmmSQ2EcclnyKgGlsf+xJ87gJ6lS4Jc4mQQ/7/u4remay86J6cfY7jMVm
         XBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nkXglo0SDqCy5Sv7qTCxjByr3WjPttpM3Agj+6LK07c=;
        fh=0vWsEGQvfTyedZI4K56uf+EMtknJM/MGcw0PbTbCL3o=;
        b=ntDqEROpV1L/p0gfEkpvFqsluiwvbmASy6jJD6O2P34/fTm4RqCtmEAJ31BuprxEc3
         ZhbzJk3QBNh4hCKqsFoRSvLyhAu3Bld5ZmhV+GKwg16sbRUWHUsb7MF2KlyvD9G1ed75
         bsZD6y9cH7wSlVeaX+AG7KFLSx6FRIPIHdTV4vRb/tQby2bj1Qim/GFSBfhIS9PJpaBm
         UzZVrWhLp0h6T3GnFOE6zEc+ooRDBQq8i9iRsspqDm8LAOMK7dYJc1YrQ13g9qHNRjqR
         bF/hlD1u0IhLLxg547VA4BMWZsNRM4yxwqhnhqUC2D3if/qMAIP/x+5Yp9ACqDiu5sgm
         tq1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdHyOXuS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i127-20020a636d85000000b005f800655cc8sor5580366pgc.6.2024.04.21.09.36.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MdHyOXuS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713717395; x=1714322195; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkXglo0SDqCy5Sv7qTCxjByr3WjPttpM3Agj+6LK07c=;
        b=MdHyOXuSFYXf3aKXQio8f4US7O4HAnsDLu0e3nVlOYUn7pe9u1hcn5QCLYGLXRNsat
         R8t16IAfb6+7yKO3663kjRzZpJ6ozBvtg/g2WiCdEbXO+ie6NAe3vj5D22EW+9oouj7H
         QwymNQQz2r502yYbcm5ZhmxxXm4QuA04FE3uxGc0CykPrK93xOJ8ig4ngjwemDJHiyMu
         maOw/AD1zwp7TJqBdDPU0rcAqgDjCf9Offqp8Kao5pVnAYIm6Klee0NaulUwev5B3wid
         08hjjTixfAuXacocAulfPPiuXiaNF+lHNbQ/p0Y5T3XuKlhp9+wrDNu1AQcbb+LvsBCs
         HBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713717395; x=1714322195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkXglo0SDqCy5Sv7qTCxjByr3WjPttpM3Agj+6LK07c=;
        b=LRMEqBWfPWRla5+n9OnpKRUtVp9ZVvW6bAzhowiKEP/7UQI0cbB11wm42v5SSl5URG
         kBqjznzPlNzBeMOZHX2rb+Ubd3vlqJ4tfQ1y7rMBkZz9Ox/4E9WL5abaFAOv7cFltsBV
         OOyJLFoJlJCHUsSPMuDgUK2GOlgn8VJlBXnw3dDBX12tZMhNBpop+p6YgJ6SCEceI1MT
         f3xSiLfr6YCga/SWJocITiv3vtC1MzS3yGmZUuDgGhY6kA8HfeE75j4eXbXLDAGpgeRM
         KF2ogQnvk1gTsJ4r+YK117zhwDfui8Mq3oIYgmtL9pdpkiIw76J5gWvyd9CXQcyOQmvQ
         npsA==
X-Forwarded-Encrypted: i=1; AJvYcCUZp+NrESSyJsJKv7CK4poZBfP9urOYamxYkkHa8PjqkWk5bP1swtdZvX3Fht4UvPibaau+GPf5YVcHs2MFx9Qw87lPT4RI
X-Gm-Message-State: AOJu0Yyic0IuLN6573RUg46FpOY5HYialGNyZIpz0X6rANV4o2V0fY0y
	8myvWfnz1/CbjbBPOnnPSp9wov/b5PceTJ1LU5Eb36CmniVh69RggH/DYH1jA75jNVGU0Qxjt+C
	bpYA=
X-Google-Smtp-Source: AGHT+IGXt7Sa27+S5/L2k57srA4K09RsQxja6IL9SAbabgU+eQP9G+Ydc70B+4gH5g13DhBKS1Ov/w==
X-Received: by 2002:a17:902:b607:b0:1e3:dbb4:2c90 with SMTP id b7-20020a170902b60700b001e3dbb42c90mr8167330pls.64.1713717394813;
        Sun, 21 Apr 2024 09:36:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902e89000b001e8ab6b927asm5279578plg.39.2024.04.21.09.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:36:34 -0700 (PDT)
Message-ID: <bc5d2dda-7826-49b4-b567-c9fb3b387da4@linaro.org>
Date: Sun, 21 Apr 2024 09:36:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] exec: Reduce tlb_set_dirty() declaration scope
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LTDagFQgH1y7

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> tlb_set_dirty() is only used in accel/tcg/cputlb.c,
> where it is defined. Declare it statically, removing
> the stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/exec-all.h | 1 -
>   accel/stubs/tcg-stub.c  | 4 ----
>   accel/tcg/cputlb.c      | 2 +-
>   3 files changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
