Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1572291lfb;
        Fri, 3 Sep 2021 12:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz27MONy/HhNPGdvsEKajOzjb14mBa2Oi3ntf6ngro3t6lkJZcgb7njAYwFgR7LeZryHWCF
X-Received: by 2002:adf:eacb:: with SMTP id o11mr545689wrn.418.1630695671858;
        Fri, 03 Sep 2021 12:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630695671; cv=none;
        d=google.com; s=arc-20160816;
        b=N9nmH6edfhTBebbQqB0I59wdrq3OBBsyOMhzIyzFlIMo7nosPKVl+KH7y3No5zUJmf
         keYbvvnAD+iDpdrT5EEkEf2aiVK5jb4qYbyqHVjT0Qfir6HFysSE9ZOO9nCJkUd7M77L
         C/8cGt4EP9puyxefX/AFs/0fegRP5+o3687Adb+53gzhVYBkcyb2rUNOreiooxhe/gn7
         oFv+1kVpjLHM59y6XVU+GhlP96IsjY2aMUPenh35EZjlCOgwuWYIvthdTY6if2FmACCt
         J07E40ZAIwKaDKTH/QHzPB7jDd5/qLAIq86KNRZFmS2jzPIvpGF0fTSkg2opndP3N0q1
         EVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VeOzXG9O5OHj8L4mETTFX+B1SCJ4Q1jx530ePd9LyYQ=;
        b=GrTVGcd3ESFVeciNvATniAxqbcAv10ttve4vZO3NgAQS/dWN9sAl3TFA1oCWpJHaR1
         Qqc9PYI8bt+bDYMhtYR823xPpsJctT0Rca5zQVg3CBWFVypE5zSpMPZA3DvUO5bLxQ8/
         Qxdbhbz/wR1ARY+tf4na7d4Fu7IQIldhEU+gqoFTA7UM9ZIOC/Hu/vK6COLyPL/RVmlI
         wOSpfIabtYuDBSJ6b/n/dGhAhrT1QYUlK8pAC86aW0hq7812E22hwRpSlYD34K7K4MKS
         uk0K/DawT7mgk99xPKesZC5X97qPRFPsCLnAuGmvjsMHF6MKtLyImiImG3yJs/qkzuo5
         hP6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wGyudfEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si239827wmi.44.2021.09.03.12.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wGyudfEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMER4-0004Ko-Vf
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEQF-0004JL-QD
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:00:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEQC-0002u9-Se
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:00:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so215187wmq.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VeOzXG9O5OHj8L4mETTFX+B1SCJ4Q1jx530ePd9LyYQ=;
 b=wGyudfEsh2G3ok8ZAP8KBYLkM5Yk4gg/3Shyct9KiElNHXEGIt2cbRRBwZWvG14xCM
 rXXDCfxc0//KSVmmlncm757lzttYElP7hO0y7ihKljLAHUzMfy4H95ErFhbn8I+gt+rJ
 Yron8y0TlEy+cNpLB6/z2pmwjtKqxH9U7ffXHsYu8fUwACTL+3mnvyeJt4g30AuCJp2X
 XF1WjFcNZU4lsEHVH63G9Ou/rpgyoxsXZtYtoFVe2NRDT/0J/MThBMhFdo2NNB/ZpMay
 8eB8x3W6peaV5DHkR5AAnlT8cgvSGT6JjnemjRs62l3pjJwU7UjBQqE2Lwwrww5oFoqi
 5kmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VeOzXG9O5OHj8L4mETTFX+B1SCJ4Q1jx530ePd9LyYQ=;
 b=LOQIWsT342T5JZlnWY7tzqCmD8mEALMP3OmsLtrp5jZwjj5RwhEaDOPuJVhsBjojQh
 AiHp9MmMTtzHstuLMtj1fnrvJE3AI9gOHLXZ3fOq2vL5BwD1LPAnaqeN0liZ6W4zmFUj
 uh8K1tiNSuaZI/c9dH3BizeBMNEol6WjS/PAdeE5/ox1E4VrNGP/r7RbRc+0KrWm1IPK
 Uum38CYSqeAuYfytoJPo781KVY9J2V5/AplVuMpYhRlu5xPGLtIU/xC7mc63rYl7yjx5
 xyMzrKxn3Kws6ma6s0E7lqKQLQiQ944gweCNNO6+aTLesw1JfI8rjbUdEuR7wjcCYlMS
 BGTQ==
X-Gm-Message-State: AOAM530qiqBnd1JXa2rftS/O5Pt9R/I+3gOuSnmuAnKqe18xKqyN/j2E
 yUOoH2Yz6UxtTTlg1/9r2zkOFA==
X-Received: by 2002:a7b:cb02:: with SMTP id u2mr249682wmj.103.1630695614633;
 Fri, 03 Sep 2021 12:00:14 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id c13sm61034wru.73.2021.09.03.12.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:00:14 -0700 (PDT)
Subject: Re: [PATCH 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a3c97bb-7eec-4387-b43a-0a7552f799c7@linaro.org>
Date: Fri, 3 Sep 2021 21:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: El4YIv0kTcY+

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Merge two TARGET_X86_64 consecutive blocks.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/tcg/seg_helper.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
