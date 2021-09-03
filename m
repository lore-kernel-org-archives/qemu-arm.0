Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1582892lfb;
        Fri, 3 Sep 2021 12:14:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8JucjU4IfncdR7R3KcZPvt7uOsLJV9nhn75YXIeU2CaNkTndLoolpy7pseGGntbqPM508
X-Received: by 2002:ab0:3a8f:: with SMTP id r15mr329039uaw.13.1630696470665;
        Fri, 03 Sep 2021 12:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630696470; cv=none;
        d=google.com; s=arc-20160816;
        b=K1xvC2aGDBIWTMVSOImKvkqhGneTXIC8mP67Qrq0F/hVaF0tVrFGM2W8wdSt88W1XI
         er8WJF8E+NHAhUBYF6T3eeNtzoBhN0h/wGQoeEY93AwxaOCb0pSCVVcuATgrGBUYNcHm
         6jP8JWfS8/GCnZ1j/LpDbx/DnoIKdlbvfDNerA81YLy86tgbdYQwkpOu5ZOAJCwwsTXU
         CBkqOjeEZAKcCYNJCBFln+BY8FUSMC32i/RL7T20SgARf4cEnLHL/2hZ5OyMoxsucTnJ
         lUGhU3rCJpf+JT3L073EU8LzNkAzbMTysJqjjrAv/3++AAivjsA/fvWKb579C43TXis0
         rG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aOkvcPJKs8rTvClyB83d3CzbFnqZ47KXj4HC+vkTlPg=;
        b=E2vNA0tQLjryVWcix0D7zlfnifYlxEUMuEw4sKFZ8aKRiWlbv/pm3r2xVgFl1u33n8
         rep5eRJR0r9P9QUA0MQ6m3PoJnMlTzk63YFU/xcr2VO/L5u70E57E8Q3raDivbTkK4gW
         ZaQXM+lpIYXMGz78MFX4C5UbmtG1ng3w3oyA7lbPdbnp54nMJzEIwZZPL58WWAlBA6Vh
         msNcjBKQ3GdNvKj5Gy+UVsNnDgVS+X6Ue/H3zZ5ljG8fE5stfxNhaSlwDuTqiFTLDOaM
         QH71oEX8foZrkVrzVUQBDpeOt2ElBEQs/RoJSbyp3uco6+GOtK5t/+KSVbrTMJNLlTk+
         wqwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LoH3SZAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az13si92812uab.216.2021.09.03.12.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:14:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LoH3SZAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEdx-0004IE-Uj
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEcg-0001LE-Jl
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:13:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEcb-0004eF-Ak
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:13:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q14so127509wrp.3
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aOkvcPJKs8rTvClyB83d3CzbFnqZ47KXj4HC+vkTlPg=;
 b=LoH3SZAbqBL+HjISumhau6zEbkRisn1HiOqzt7p1WJlXbRE7/9JNoggqVqEQKo9pAo
 0InoMKaODj4VI4sAhiuPLkDccmDyLr//EQR0PCn/Gh7AgsofiNsufm5FAYs+xU1RYxZM
 KNSOnBfsmCFOjaBtzgFF/s6bRFkfmNPEiutCD4kGoEIGL2E/xgyMBR8BhpVUmz3psDzD
 JNpgMunm54z1k//vIgSsUxS/1Wb6iumw6KP17oM14OKC6etzuE5FeG+Z0dIV5Ew+V63/
 9MLDCG8H28ejFsV5Xf5qeIu5LUjjRWSua/JPDTXFxK5Y6zsrYkdlBugFKjc6uUBFES/2
 RQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOkvcPJKs8rTvClyB83d3CzbFnqZ47KXj4HC+vkTlPg=;
 b=KDICTmUcVuYC9fOsCUTguUbksU7Rb9Qt9cXf+a5wrgd9LvkR33M/7XL7KCS/ghT7UG
 27p1x9dFrq/7A1oGZyINE0kJJvKuwfAUK+lxU6zXGqAkF0PgRyxp2bDG9Vup5dk/A4AH
 Mai2rZI/X0fjXqDZy0yjmvZWbMH2CmQ/wUkxIIzRxN9qo/XvlJFzK1eTcee5KffbGzHM
 y1shux4ZIlu+THUgKa3reRX3zrdPqsrp8QiFiGkRxjH5rM+0+qHzC0rhdwG97Xsv/GvJ
 98muFAaYl/Erl7T3FAhIkK05c6OSCgW8MHiiDbsOHqc5uFgcjE9j3nYuOq+vIY46aQBQ
 Gjvw==
X-Gm-Message-State: AOAM532MO1fj9bg4aFjVJX/QCUbDBsxAMxpPudZyWMMAA+z3bngXyJkH
 neuvzXlIOPxcZYc9hiY8DuRSxQ==
X-Received: by 2002:adf:9f4d:: with SMTP id f13mr585024wrg.169.1630696383359; 
 Fri, 03 Sep 2021 12:13:03 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s12sm101369wru.41.2021.09.03.12.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:13:02 -0700 (PDT)
Subject: Re: [PATCH 09/24] target/cris: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60569544-417e-9652-7a88-7ccbdfbc9696@linaro.org>
Date: Fri, 3 Sep 2021 21:12:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
X-TUID: NzHldKUXQbg6

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/cris/cpu.h    |  2 +-
>   target/cris/cpu.c    |  4 ++--
>   target/cris/helper.c | 17 ++---------------
>   3 files changed, 5 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
