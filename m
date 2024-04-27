Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1116830ejb;
        Sat, 27 Apr 2024 07:47:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgzR35WUA53e2UdiW0cSyP1lDizbOetcfN9iLKWwL6vQAfjid38HiUBy7ot3qbrMztO/u+AbOP255lBFgZI0LufgsH+fA0
X-Google-Smtp-Source: AGHT+IHfRPONxCSStA4Eljas2KI81oWmEZv3y+YRed8/6YDV4Ort2Du56bTHmAAQUGYO4smFlH4D
X-Received: by 2002:a05:622a:b:b0:43a:829d:2ac1 with SMTP id x11-20020a05622a000b00b0043a829d2ac1mr5216728qtw.61.1714229266379;
        Sat, 27 Apr 2024 07:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714229266; cv=none;
        d=google.com; s=arc-20160816;
        b=KRyL5oU4mKwZ9dIZt1lNzESdf9QXYQEEZMxYIITs8Whr2TNEypWg+YST8liEqHMq+7
         37wl/J+0swcNDHSLJqjXIzyiU6z9mM7Z4mmA8MHRA3kTwiBiGmySdQhDmMMX2FHkQjas
         qZm0CWy/NBgPBmscTfpM9rMfSW2CmTkn9VCrc3Cdss2f1wnterrwexvj/jBhqRlca45J
         5Nn6WpBuE+7XW1uaRu/IlXPOsnKoXbG+s7dA70g+dIXeQcF9imz/2ibrZM+0FHa0Xv0a
         7G4MMigaG4IOKrEBv2i4BxrU59YHB82tPbopIilzPOncAsZ0Js7EJx5/1vdWPFMzATUK
         Gz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6wcbJVsApLjFvrfZlLIEnscXA61H/LQylnHzp959vKo=;
        fh=/jJVGraV4woJlaoLPXLHw4VCh+ri9g4K1DGkRL54DrQ=;
        b=fZqIkvm3rlzFW4YAdZ5LaGEq9znyKphJ492ewYWHCX6Rglf+OJO7CYpJiL6lZZgLwH
         eVoRA9xuNUKM82oz24psQlb7ubWX3OvOt+geJ+rUJu0D0aBd49N6OrzNBGQNbh8x3nRj
         jkkw5zl3/gmoUgW3yeWDK9tGZGyRQgJdi9Eek+xvSxE4mz80RB59bbvLn0VFhbjqT43s
         LVHKatAyL6E1SDBs0UmpTgB3naBcCNr0y23GhOiFrTJFNqRP+pDz9T74HKiP6Lf7+C/Y
         sd7UZmZ/3mD9L1/w0iMJ0k1+1EUT7rDxdfN4dldhHTk7sD7CR1NaSA2zaRDuDNkZk989
         mwUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5HZgU4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020ac85f11000000b004347c7aa34bsi23030109qta.445.2024.04.27.07.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Apr 2024 07:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5HZgU4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0jKz-0000VF-80; Sat, 27 Apr 2024 10:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s0jKs-0000RF-J0
 for qemu-arm@nongnu.org; Sat, 27 Apr 2024 10:47:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s0jKp-0008GE-6f
 for qemu-arm@nongnu.org; Sat, 27 Apr 2024 10:47:28 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5f7fc45fe1bso2439792a12.0
 for <qemu-arm@nongnu.org>; Sat, 27 Apr 2024 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714229244; x=1714834044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6wcbJVsApLjFvrfZlLIEnscXA61H/LQylnHzp959vKo=;
 b=Y5HZgU4sA/zjqpsAB3DxRLIjmp/xxad6nzY0c8nHBhWkwBIzk0yewFpM326TZ9m5fy
 VxNPeqH3kC6kAmirVagPg/19NR/aoxtLY38MXM6M6hXrhVSnmrwApVGiFrlqoS5gRzLc
 4UfvCG2hucuL6uOM07fIPGGKVKSWJJr6weMPNvwNajXm3/ahtsakhAAdLogjyfFIVdMR
 dDZj+UZYlt9ByMYHiWBHQynNZqBMyFO/19GPtqKyGVFACvkHS6BGOCgq3dT4ybDsWFxe
 bsM020t0QFzF7C4sxSRVMqM0lKHX8t+CUC6oObm5ZGuNXbTsiPi3R7ZhyvNxrYQzKU4k
 HDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714229244; x=1714834044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6wcbJVsApLjFvrfZlLIEnscXA61H/LQylnHzp959vKo=;
 b=rhf8+XfEJ14zLU+t3i3PgwweEdTG1lIIYDaTY7uW4POv/gPLaP3Tty3D+oL0vREx/V
 kDuKvTxM+HNwpQzRgLlrk79loASFkGGpgZ/6fMssk0jTC9HgIBJNT0+/y1SweGzbOi3R
 jzg3ThQAOamNtQtuVJdOFfcjab6efVyQy5gZdPTRQZED4O4lz1d9jWLG98wwUTOPi2pL
 2yibnUTEqTSNjQAdR43wY3SEshRe5crpttO5B19/W8LrhEV8Vj6tEtMeGtMifbRZC0xL
 gjYSHmaZhabKaIT3LRwcf4S74pzS1lmbn4tmhypTcL4zlHPX0ko6/EKRPzi1KtojNKd9
 Y7pA==
X-Gm-Message-State: AOJu0Yy2FsCGjCLiz5rpR1N52a9WPOrCHP473J7fZUTUmfumUBECHEbX
 cmRWT2B7/GEFmB2UqoRL6iPSDEr6q4QfQVeUDjS9dRlF5y1sBAgTxLDD2zhX29c=
X-Received: by 2002:a17:90a:d78b:b0:2ad:e004:76e6 with SMTP id
 z11-20020a17090ad78b00b002ade00476e6mr5231493pju.7.1714229244449; 
 Sat, 27 Apr 2024 07:47:24 -0700 (PDT)
Received: from [192.168.91.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a938100b002a706910b05sm16194208pjo.9.2024.04.27.07.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 07:47:23 -0700 (PDT)
Message-ID: <040db071-6406-4270-969a-c98d6fb33caf@linaro.org>
Date: Sat, 27 Apr 2024 07:47:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/38] Exec / accelerators patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20240426194200.43723-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: RsS/v37y+8y+

On 4/26/24 12:41, Philippe Mathieu-Daudé wrote:
> The following changes since commit a118c4aff4087eafb68f7132b233ad548cf16376:
> 
>    Merge tag 'hw-misc-20240425' ofhttps://github.com/philmd/qemu  into staging (2024-04-25 09:43:29 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git  tags/accel-20240426
> 
> for you to fetch changes up to 671558d290ffb93752d3245e7c5604b04b6dcdf2:
> 
>    plugins: Include missing 'qemu/bitmap.h' header (2024-04-26 21:36:19 +0200)
> 
> Selfish PR, painfully tested commit by commit.
> ----------------------------------------------------------------
> Accelerators patches
> 
> A lot of trivial cleanups and simplifications (moving methods around,
> adding/removing #include statements). Most notable changes:
> 
> - Rename NEED_CPU_H -> COMPILING_PER_TARGET
> - Rename few template headers using the '.h.inc' suffix
> - Extract some definitions / declarations into their own header:
>    - accel/tcg/user-retaddr.h (helper_retaddr)
>    - include/exec/abi_ptr.h (abi_ptr)
>    - include/exec/breakpoint.h (CPUBreakpoint, CPUWatchpoint)
>    - include/exec/mmu-access-type.h (MMUAccessType)
>    - include/user/tswap-target.h (tswapl, bswaptls)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/9.1 as appropriate.


r~

