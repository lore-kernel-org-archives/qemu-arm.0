Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1577985lfb;
        Fri, 3 Sep 2021 12:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWOK3okgoN9Q3At8STSrApc9G94A1wNwvNY0fgxYuNoRE5g8LJrWrE9D6kepJlAThDD9vr
X-Received: by 2002:a67:fd5c:: with SMTP id g28mr272812vsr.3.1630696087441;
        Fri, 03 Sep 2021 12:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630696087; cv=none;
        d=google.com; s=arc-20160816;
        b=AK1Qt0tER8lre07Nt0Er1v08mDbN/YKNX1GcggvsaVIwYKl/+Ykq0f94v7MS5LI5zK
         T4q2pjWnDTOxbud84bTHfI27+Crg2omhtQmN7GhEkYPTzVOjg1JNQL18zzIjFkAIZjQp
         N4IACiX7ghetFgecQx5BXNyB92cg8uxKlPt6qfk9pAR39uOJ4rIJfLi0YKFFUaXZcYZ0
         yeAAyTaEHGJQaCYmtOrPSeAG4MJYGI3EZN2OUfFst4EPVSGGovSPvfigfM80c4uQ/qk/
         x9BDif0aiympkUOC1lI7xLKt0cK0PEpVn+zZIDK0naWs8ZkQgy99gqe5XjmljwbJ2BYR
         cU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0NdsLuVFQiOXh+Ug01/7WslzxoTyRGDqrkPMYYNKLu0=;
        b=NM5L8XnOalOuIb2kGaH4ZtZTsROxJFVs5D1PYxHItuPN/44otO2pxbyggRsYRCYYET
         gOBa/RQkx2ZiVzbliGz25ndAZ9TZElVjxlRO7XwsDasugrin85NrhnMsrrlvuAoWPNcM
         WK01MdUkogtCvJknNYWFm0p7sfHdAw64ibQwfJaZzIEJJmmtg82Mx1IpZHbQbdPF9S/B
         U4np1+fGhP/ey3GEjC1ARPMbsANXUPlxfpLMwbF746a1TAw6UGrUM3aH0pnjX2GUGb67
         +BDKl5gfe59mFxzbC0IRucnwWk41wzMVo3Txq3dfnLkBsL+L/KoyHXyT3+x2PhvqmHmW
         IkvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bWrhcAwD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si70504vsv.134.2021.09.03.12.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bWrhcAwD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEXm-000227-Ih
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEXS-0001zo-VS
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:07:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEXQ-0000Oa-7Q
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:07:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id q11so85816wrr.9
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0NdsLuVFQiOXh+Ug01/7WslzxoTyRGDqrkPMYYNKLu0=;
 b=bWrhcAwD+6e32H7526OPNojiGlKGcJsLcTVvThqO1xLUD1uPw62Z3Y1AbyViS4Wze2
 X65hjmzwUMCy6VRKnA87cj15qpRKSJFiozipKa3TQ9tITppTq4fZ0XG7ZtEAgsOTFzZA
 wGLemVO7gAr/R2IAMV4eGMGDAuR3ptVY4R9F/NYasgqY+c0wc0m5Mnv3uk9FvOkRybGG
 /ToWAZeZnCZSTRKs0gyPccVdnXpFYTulLbBv1EwFYXYysrOXs/zQ97vYdsV8TmgweA2t
 ztCzNgZN4mtZkSeq4h1CcjWPZcVDqQN8lnJAeqnjvOSyxI1tndJp2IBQo/13PeqiKgK2
 XLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0NdsLuVFQiOXh+Ug01/7WslzxoTyRGDqrkPMYYNKLu0=;
 b=RNsW3qprwYoK74spE9ixFQxG1jLz5lc/Um1ymh4E6GYDDQinL+fAseiuLVH5EJ346Z
 EekKYU4TygrF9D+8SAVQIqymdlO5hajkfrGBJregwTx4eryfzpMUmd7my813EXC2bNTg
 lGZyCii49rMAahEoMZN9MpHjNQ+hXjXPxNz87MLUZ81e4pg/1E9pZiXqZ+RnHRdOk7fH
 YGNWNHe7dWULaBTNmirU9IGDIoMn7CQbePsi8k4kZRiR5NcTLFbzesqWvWvlZ9LRtRPl
 7UV0v4bl20b3ruGEQ3VvwJ98uh3l6vO3js8Y3MrJJlNBjWWKt+ADD76MQeryOaXvYL3c
 zJGw==
X-Gm-Message-State: AOAM531M681/R48P3NTyE3lZ0m3ZCHDJRuYDKGgSbM5uC0HG7CRF+m8F
 1K2F1wqqJNYvpWl9mmMjrygHqA==
X-Received: by 2002:adf:f889:: with SMTP id u9mr599800wrp.67.1630696062529;
 Fri, 03 Sep 2021 12:07:42 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l21sm168030wmh.31.2021.09.03.12.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:07:42 -0700 (PDT)
Subject: Re: [RFC PATCH 04/24] accel/tcg: Rename user-mode do_interrupt hack
 as fake_user_exception
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d813a7f0-95d2-e859-a8ad-c097c7654252@linaro.org>
Date: Fri, 3 Sep 2021 21:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BOhxq05P2/P2

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> do_interrupt() is sysemu specific. However due to some X86
> specific hack, it is also used in user-mode emulation, which
> is why it couldn't be restricted to CONFIG_SOFTMMU (see the
> comment around added in commit 78271684719: "cpu: tcg_ops:
> move to tcg-cpu-ops.h, keep a pointer in CPUClass").
> Keep the hack but rename the handler as fake_user_exception()
> and restrict do_interrupt() to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> RFC: Any better name / idea here?

I guess I'm ok with fake_user_interrupt.
But I believe that this could all be moved into cpu_loop.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
