Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp608280lfb;
        Thu, 19 Nov 2020 10:29:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQUBgPsiehYFrNrUxByqlbCK2wJEnQWFuqmL+f+e6L4/KOx1WxEDYJL7ve3+U4aBucdAo1
X-Received: by 2002:a25:e092:: with SMTP id x140mr10197393ybg.476.1605810569989;
        Thu, 19 Nov 2020 10:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605810569; cv=none;
        d=google.com; s=arc-20160816;
        b=LoT6s+T5/LwH8sbQT3tsickwonqT55kTDdBlR9KlHEQ3EHsZtfkcxcfEctWG73n9SF
         7hY6QDDYyPYWkowtWf506rt8SESvJRCOrsAyyJRb/OG5GNhRRaSecWoLs3BG89DTMN7u
         X7WumdIRQPP5ahvUDJKKfSCg9FKoS1FmaCRuvgvtDbnT+bJvETIojs7H15aDvL5uTqN3
         Sd6kM3S/mX2a2XK8pdtiMmCglJEt6LJP23HPY1VeafNX0m+xinH/JFdPnXtt/qd737fi
         ibpHzIo350qM4VyY8nshY9tV+rteplhi/dg6McULTmz6Zism10rOg8Y8zQ2Er30sy/AA
         pSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7XkyJxD+vCPYAqI/HIyIHvi+MyCG8Ym29xbg4hkgHGY=;
        b=0zzPp3NDryUHuXUxsUc3/QnMwt6ijeEYeN29viIguM8MrY6Fej6bz2oRMdu7p2zKNC
         Txy8AI/MkwCXY68srj1OKoS8Al5Vw6inj4vEnwtRIv7ef2UKGzMFN27E17vn0edie/FX
         Ru3V0Jd5U/x2OwxSpP5FSOGCNWreIoXOfk6OIwv8cbkA5H0LR6orfq2xEvW10WetSeVO
         03I3vW+Y6fyNEPPYdzXhxKlJNTMaGPYdA8sw7DV/d1X9JdduuBRWMoqAUoKk8pMj9y+g
         90eaWWee9mHz835SX9SQKHNNgnHBtQL2nLKPQUL/M4+owEJ+Lr9ZCJjggn3eaV4sx3S0
         M7Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UMgPtGB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d139si302022ybh.204.2020.11.19.10.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 10:29:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UMgPtGB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfogT-00023X-CX
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 13:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfoeL-0000HG-7t
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 13:27:17 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfoeG-00048f-Kv
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 13:27:16 -0500
Received: by mail-pf1-x444.google.com with SMTP id v5so1244511pff.10
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 10:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7XkyJxD+vCPYAqI/HIyIHvi+MyCG8Ym29xbg4hkgHGY=;
 b=UMgPtGB0TjbN8Wyfin0zvx8VAQY1SHb3bnW3eVU15SM19ZV3cqEcxozLPnWAxOcqpM
 aMe3xqGInZvQsGlfZ0NenH4Uf/2RAC69bVhL4CfPlxAesUkUO9RUHH9+7wWCiC+Js4EO
 sS9h/QIOPPDR1MQ30ZSBMK92K7h7A4Bm4TaGJHWXgslfC5Wt4g2EZ96VvgRXpb60YknR
 qRpmVuzpdAcxrW8TJKRTfgyWA6fp/fzdrkr6OyYbTBbfmm8PCJG1Zz1XmgStK58TIdpO
 NkXTOjzXCOIeoA1QYd6vPRwUkG8KuNEXTYc+DY/m5YQ2kKs6X3q4D3SXJzrUA16NONwi
 yb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7XkyJxD+vCPYAqI/HIyIHvi+MyCG8Ym29xbg4hkgHGY=;
 b=enAdkmbwCMbW4nwQnUSIbXw88JuQeTDlb7BUBOfhHDy/ii4Gn/JZc+e7yEk29r06W+
 8DOQtjdbBfClG2ouh5dP6nqfiyD+7NQmAHkjUdTeZJkwo0bp5XfHPDnoUQUaGVnHw4N5
 1z1VpEVZ5cP7/ln2TFWlrZcHp33f8Yo81xZ4POyW6OEHGGaho646bPAxqjgmOccMQeZg
 2xij/KN0otcCnzLZ0E2kKPPgffJDAtqQhnLa4LWf4djgC6ysYyYZvYBDPco3xLYDgUYc
 Rz94JYeg35blCv0Xan6VFUpT5vu7yRrK0pFoUW/UKQOf/EZYgR9t5LlctKgxt17pdqaY
 umZA==
X-Gm-Message-State: AOAM531/HRaljZ4K8Cz6yTj4LgL+myB0n93fK9IAWKykxoC1B/uPISrn
 OE9ADfHCDVpcMzbMaNGyZofLdA==
X-Received: by 2002:a63:3111:: with SMTP id x17mr13647373pgx.329.1605810430241; 
 Thu, 19 Nov 2020 10:27:10 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l190sm489741pfl.205.2020.11.19.10.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 10:27:09 -0800 (PST)
Subject: Re: [PATCH] linux-user/arm: Deliver SIGTRAP for UDF patterns used as
 breakpoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201117155634.6924-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6fae2e37-525d-5dc9-c9eb-ed482813891b@linaro.org>
Date: Thu, 19 Nov 2020 10:27:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117155634.6924-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qlq5xEwIELiC

On 11/17/20 7:56 AM, Peter Maydell wrote:
> The Linux kernel doesn't use the official bkpt insn for breakpoints;
> instead it uses three instructions in the guaranteed-to-UNDEF space,
> and generates SIGTRAP for these rather than the SIGILL that most
> UNDEF insns generate:
> 
> https://elixir.bootlin.com/linux/v5.9.8/source/arch/arm/kernel/ptrace.c#L197
> 
> Make QEMU treat these insns specially too.  The main benefit of this
> is that if you're running a debugger on a guest program that runs
> into a GCC __builtin_trap() or LLVM "trap because execution should
> never reach here" then you'll get the expected signal rather than a
> SIGILL.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is not a "fix" for LP:1904210, but it does bring QEMU's
> behaviour into line with that of the real kernel on that binary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
