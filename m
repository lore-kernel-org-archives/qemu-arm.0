Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1579058lfb;
        Fri, 3 Sep 2021 12:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyN+UP5dVVTYOgDbDFa3JHbhpewpctFuhOl38O0J071kKLfteCoRv546Yv9PVp4e2236D+
X-Received: by 2002:a67:edd7:: with SMTP id e23mr541467vsp.14.1630696177641;
        Fri, 03 Sep 2021 12:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630696177; cv=none;
        d=google.com; s=arc-20160816;
        b=d+wGHf9ik4CATCxJw2dMQp0jOSQFr2GDoLyb8bOJBMYXyKVl0agIZtlXI2lPzbT7hl
         IjQNrpkT38esUSMc48ml6U5McnBeWUKhyGWpdFDySjUZsC1gJqukwi9GZFl3WGlS1vaS
         qltvbEQ54ZDQ4SrDEJdxQ6h6g+qHp2Q6DX1IJpe0zeTPSsAMwTmZU4dOT9vFyURgRg7D
         hJLRWzaAm8bjh9CuuKQrUFORm302b1bOdh3Y/t/i+CpfgqAiFN8ZTuAArLXj6CWKlyus
         KK2MZ7Y8NevFX/LovBLS5DbBosiPzYXBxN2+ZsO8/uofnAFOj1zBslPzOSAjj/fya82M
         /HfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
        b=H3mhL2MYRJKwO8mnuskOgdyfEcbOz6MlN5lPitkHwHtf+C9m677MkpG6oZH7yZjcLs
         7alId7CE+j9M9gqap6NrT3cy0/e7bpMYQRZfz43Tsn3UbQLuCdppGqSGsQrsWJPaAPFy
         js87T7Oj6KdD2cqMYLqkAKqBNE+d4P3JT2aqQ73u0LScwnQGGcnxUKWdj3KEK+hs/k/c
         +TQEhRWv0zTpf2PQrjjJDV6slNjaje0rcfVpKwasmoJfwd6aRmz4Ex2zS4iiP9Uhb8Ix
         rqRp7A40aq6PWtQElJRXtQP3+1A+YcTsZdP7HFx2E20xUV9x7sZCUoywo8CvFwKv6Vb6
         39EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=blyy2Qcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si86433uaf.146.2021.09.03.12.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=blyy2Qcq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEZE-0003QA-E8
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEYd-0003Ly-7u
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:08:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEYb-0001Kn-0Y
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:08:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id b10so156405wru.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
 b=blyy2Qcq3ys7NOCvDyC8LIH2WNtvRXNUBgIwD/R7GSOUVE9wYVoYzHJGPK69ZYwCjA
 /S+Qc9/SdTZlxmOIBExVgufjoLdFU4+jgy3FXzLa4+tyhGho9wBXZlcoEIVwOUJFCD3F
 mgy63j0TY1qxnocUld0trkmVqpIKL6cVxSttgmPwtQl51Hg/RP9gK747OSfHVrizYbwd
 Micckh16om7iN2OIXLNXwMa3zoWgNLx3sBg5GepSQ4b151h1FUxRi90O3ywDB1/4Zeef
 /aU+BgTBjwOp+y3dNUFgFNT0evBnmbIcdE1aMrJjbf676wCa7Jm/8Lc4P/eQjyPluN1U
 eAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bNawZA+iiFWKHVH1C9qcUdpIzLY56k93AuR3hOCtsAQ=;
 b=aj3Ap8nAntwWrKNKgSDA35CB3qeMXGVHqHSTY6naf9ogbqCY5dYnzql1nyy82O4ouT
 X4qQQaUPaRlM5toNxhU2qJxsHYHFNJv5Sm+mDYUwtEIBIQoU/Q7RvN3qG2N6fSkRZWMJ
 X5RQq3ZhH9TE40LBiR7RiF3cMwbogfbdS0X1Y9WpjTR0nN4huUkVaIhcsQNrSnXOQXAo
 30h7rPCHzERSM2WoW/v2q9xrCVWv99Yse7bkcWckjwg+4dadA/JJqAD/wfyJ8lKPg4a1
 w4NRozCBmRyben6o6ESp5KilChCIkCwNH2+/0tyte598lB6jl+dXl1zvs5UYOz3kqoyP
 9Aeg==
X-Gm-Message-State: AOAM531NgNtw8y9UIVXXRGMF4YfF//WP4mHARDaTQfz7WeGXBWX9VYli
 5a94yEn/Wao5neVmVUAoSfU4JA==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr543312wrz.369.1630696132260; 
 Fri, 03 Sep 2021 12:08:52 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id d24sm166620wmb.35.2021.09.03.12.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:08:51 -0700 (PDT)
Subject: Re: [PATCH 05/24] accel/tcg: Assert most of cpu_handle_interrupt() is
 sysemu-specific
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ce44beb-77a0-30dc-d4fa-9c47865e86e9@linaro.org>
Date: Fri, 3 Sep 2021 21:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-6-f4bug@amsat.org>
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
X-TUID: JCa/HB3b3FLz

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> To prove TCGCPUOps::cpu_exec_interrupt() is limited to system
> emulation, start by asserting it is not called under user emulation.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/cpu-exec.c | 3 +++
>   1 file changed, 3 insertions(+)

Eh, sure, I guess.  I meant this merely as a diagnostic aid.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
