Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp494111ejx;
        Sat, 9 Sep 2023 13:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLk83NKer+ArG2KvNfrJB8d3VJJt6Qw51rY7Z9yggQPUehudOj+VvPYbu5RiVDrlPQpZuI
X-Received: by 2002:a05:622a:1a9d:b0:403:aa3a:36d with SMTP id s29-20020a05622a1a9d00b00403aa3a036dmr11610152qtc.5.1694292642304;
        Sat, 09 Sep 2023 13:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694292642; cv=none;
        d=google.com; s=arc-20160816;
        b=fsFubdOE8UYUzfnYpJZ3/dhIQxVB2zYDmfix22oKbXcMSJdhttX3PIf03P7zEbpBDC
         cxqr9lJ9/XcFxZgSZDYTSmUVY6eW2mqkThIXJ2MV3Sv3Fd3ztSOFMP5+RnPXdZlDZYrT
         mvFgZo/6YEE9uyl6EuIhJrqK9XOB2lTF6rCtXqK8Ze1b9Dpv6zmSHuc0wnJiRGcx0Kgr
         wsh+YD4N8hIyoM9WbkFV5neO624SJ7tMsJ16Pgk1IDx24zX65Vk70V/vLzMZqpUXJxoh
         hnCwPLaKgCg3+Uj8sW9dtv8e8apunaydCAb44a0iYyJ38fi0MUUX9j6FS0yyCpq56U64
         NUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CmshPNdUVElJqrEmTM9WrvVoAh0siLxtF48XC/Y0VP8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=If7r2qWe7m8MBXBqzBPM8+cBB/OCeb+/ytVcL9F0UvwgvmcK5PNyqqg6l+/rXU8/cR
         dnkFarVbxvOMM567pq7dUP0iKCDO224fkUp1lk3KFYG/5YIggrMhD0zDKYhCzR0xJfCp
         QsSlFgOAPSpbikY6VNOT6Uiy+Jbj4EqY5uI5WTVPeHGvYBm9JltnuKFz6tkK9KfNFC2K
         CKpIZIRweq13DqEYMEI9b5UQEcNhda+UN5PsU3OwKDAmayy7J85DESwG/mVPTBfmzcjW
         C5bZRU0FUVVV5bKkexx9N1awuuzbSEvkvm7MQHkw/7+oe9MIodQ2lNdaykUgXP9bIBAh
         NQbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oMxRu5nX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020ac85c45000000b004120206dd06si2975912qtj.50.2023.09.09.13.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 13:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oMxRu5nX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qf4uL-0008BO-EP; Sat, 09 Sep 2023 16:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf4uJ-0008Aa-PQ
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 16:50:19 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf4uH-0007Cg-7c
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 16:50:19 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so21647615ad.1
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 13:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694292615; x=1694897415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CmshPNdUVElJqrEmTM9WrvVoAh0siLxtF48XC/Y0VP8=;
 b=oMxRu5nX2v/iKseAzA63EGN6TVgrkbcxcXmtcN1TApK9qxz2SdV6uciGuuzcO3TOlw
 5h6nUxFqgajw1qVFNL1HKYVN3aWp30xZM8TRl6cNlKDmNvMEcfc9LIHkgE1ujwckWepp
 lnZ9d9pwRJsHIBeCIUz9ccq6xFesnYg66wd9tX7/NAlZLQvOybMUwXZ0TwzmWLS7yIl7
 w5/K5cKjkOjxUyWp9OpcwK4FulA6vlJd4IwTEY0oXsrUSNlKaKsBTDfsukgRlLnQ0BRF
 A/XT3HSVxm+/rcfnTc3DT/ca99bB/SOK8tYLePLJk+05fWfpo8syECgqlm5VxSvynrpe
 w7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694292615; x=1694897415;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmshPNdUVElJqrEmTM9WrvVoAh0siLxtF48XC/Y0VP8=;
 b=lL5TfDSqrYsDxvnZIIw6HiQvcNrzxGR2ib/dDRrQOQYTZ1XZSEMHx7cF45WDYcBQQa
 mQKC5mV1KHTKfwGrBM5FvdLFOJgOGFq3sME93bxWrb6KRH/CDXhtj52ibUxtX4GgLQp0
 ExZlfEuPxVPXjLbxk1sh7syfy9ey2NKaXvoZ9AVYk21XfmXfviJh85ssDHs7OD2sgdBo
 wpmqJNWYdt39VYgURHVSbsT9ozfwmLfDNWjL2UwF63sd2ZjO0+ryOC+okCy4IuHkuX/l
 n0RAUA9T2KzlAJLEEAIH7vj8e6QLJdrjPHEAQGZvJJEOsegTSjWQCBS0oj85eBQ6Vyfh
 WbaA==
X-Gm-Message-State: AOJu0YxB7wDDmAlN3WDOriEvJYUIka2rvf6qTIFJZQ4DAU4fVax6JAa/
 qUJKYsoNYZYZV/aAb1IVXlAOwztZ0BYYZwXM7Og=
X-Received: by 2002:a17:903:32d0:b0:1bd:e258:a256 with SMTP id
 i16-20020a17090332d000b001bde258a256mr7807635plr.32.1694292615141; 
 Sat, 09 Sep 2023 13:50:15 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 5-20020a170902e9c500b001c1f0b3e900sm3619234plk.229.2023.09.09.13.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 13:50:14 -0700 (PDT)
Message-ID: <88a0cad9-a742-01c9-af7f-b7b0c09a20cc@linaro.org>
Date: Sat, 9 Sep 2023 13:50:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 0/4] tcg/aarch64: Enable BTI within the JIT
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230816142516.469743-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230816142516.469743-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FSeBDE9kFwpX

Ping.  Patch 3 still missing review.

On 8/16/23 07:25, Richard Henderson wrote:
> Patch 1 is cherry-picked from
> 
> [PATCH v3 02/14] tcg: Add tcg_out_tb_start backend hook
> https://lore.kernel.org/qemu-devel/20230815195741.8325-3-richard.henderson@linaro.org/T/#u
> 
> here used for a different application.
> 
> There are not as many landing pads as I had imagined, so the
> overhead here is really quite minimal.
> 
> The architecture enables the check only when the PTE for the
> jump target is marked "guarded".  Linux implements this by
> adding a PROT_BTI bit for mmap and mprotect.  I have isolated
> this within a host_prot_read_exec() local function, which
> seems clean enough.  So far, as far as I can tell, Linux it
> the only OS to support BTI.
> 
> 
> r~
> 
> 
> Richard Henderson (4):
>    tcg: Add tcg_out_tb_start backend hook
>    util/cpuinfo-aarch64: Add CPUINFO_BTI
>    tcg/aarch64: Emit BTI insns at jump landing pads
>    tcg: Map code_gen_buffer with PROT_BTI
> 
>   host/include/aarch64/host/cpuinfo.h |  1 +
>   tcg/region.c                        | 39 ++++++++++++++++------
>   tcg/tcg.c                           |  3 ++
>   util/cpuinfo-aarch64.c              |  4 +++
>   tcg/aarch64/tcg-target.c.inc        | 52 +++++++++++++++++++++--------
>   tcg/arm/tcg-target.c.inc            |  5 +++
>   tcg/i386/tcg-target.c.inc           |  5 +++
>   tcg/loongarch64/tcg-target.c.inc    |  5 +++
>   tcg/mips/tcg-target.c.inc           |  5 +++
>   tcg/ppc/tcg-target.c.inc            |  5 +++
>   tcg/riscv/tcg-target.c.inc          |  5 +++
>   tcg/s390x/tcg-target.c.inc          |  5 +++
>   tcg/sparc64/tcg-target.c.inc        |  5 +++
>   tcg/tci/tcg-target.c.inc            |  5 +++
>   14 files changed, 119 insertions(+), 25 deletions(-)
> 

