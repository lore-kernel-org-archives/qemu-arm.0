Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3758916lfb;
        Mon, 23 Nov 2020 08:55:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSUg0G5aEq1zQxRS+AmUfQSE4cT+rdWayuR5fNQOWWJ9ZXBL4ppFDJkqrnPT8rwjDXn94y
X-Received: by 2002:a25:491:: with SMTP id 139mr387530ybe.206.1606150548387;
        Mon, 23 Nov 2020 08:55:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606150548; cv=none;
        d=google.com; s=arc-20160816;
        b=JCwooroBopbStzONx2Yi33jpDtb7rEpYUZmLDIY2pEDH6mvvA1A11Zz6X3Lhko8uvE
         PxnGOeXmudToCn/mBbF24S3suVZHgpCITzYi8Sx15Xm48KvkJI+a7dNQxzZd6Zlaq7nj
         h0AOjGX25AwZo6je6hQ7FtBczv5nbomBrfOCzKnNhtA6tOXlJbcXb93CidwMys18w7ct
         YIvMuZ0Lb7gXvj2cw64StCn/zApaw/BlqTTfMCosYxAhrBb2Otd1zPFKZR1VqoyDyKb/
         0kxc0SReRSr6DxH367zineJv+Dc72SPkdTUgxi0rP6UuJH6zqwTZScknFOi6nzXCW2HB
         ifYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=H3tzq9LRo2rgBolwZlf83AmxIs12lnB/P0a3l0TrCHo=;
        b=qsz2tSc6zXp/BjbHVrfklJPl/hs2TgLM7m0WwhA5ApbH/AB3dp0hEMWbjakvkN5IEO
         VNB/Pf4nJC53hYmi94NYNteoGn5R8x15HSJILZ7Y5dVvShf0cZpnqS8JrquydC3DfD+5
         jHNLqfKjePNCNT6t9LTdrm46LwJ8OWahTtAp9y1aWr8EyvMrMnhsvgXr6xtIwUu1fZK/
         Yemrqz5GIJgcR+KPiolZXUClTmIC+JtRc2wfymlIZeilxyPxItawNUHCSbJfhvoD/ro9
         YPFJzlUkXpm9Zo1at2kefje/QrmJ1EwwOs1bRLxSYDdntJFjFM4lGALZ3lJhRhRf4o9r
         nknw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NjY0diQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d185si12153933ybh.22.2020.11.23.08.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 08:55:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NjY0diQn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khF7y-0004Qb-Lr
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 11:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khF7r-0004QK-AA; Mon, 23 Nov 2020 11:55:39 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khF7p-0002GO-MJ; Mon, 23 Nov 2020 11:55:39 -0500
Received: by mail-ej1-x634.google.com with SMTP id i19so24278827ejx.9;
 Mon, 23 Nov 2020 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H3tzq9LRo2rgBolwZlf83AmxIs12lnB/P0a3l0TrCHo=;
 b=NjY0diQntMYc5gaxaIRY46YKeQCx4VK2ZisQvCkF1kip6K4YNBdUdYRNxk+GGHr2Bs
 L65AWTUur9SqDTCtqlv6AQ+cURdH/7IozncHHXnA1kC5uXBmj7GI0mC1W49UGHz8wUus
 5ecGJP3iVWGBrT/8uGFduBWaG4mPw23QgKJe0DwP/IwFJuCQWU7lBorxjqr9zHezsWGg
 vla+00VVshnbevn2aoKgaze3k2T4tqCf+MiVFyKfZOXJX9z86uqnFt+de7q5NOHUm8wU
 q6nfS1BBDDfyRdbA6xSjVZ9bCGo9ttTLvz0+CteFiMitF0jICQH2hd/ron6xWY2c87gB
 W9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H3tzq9LRo2rgBolwZlf83AmxIs12lnB/P0a3l0TrCHo=;
 b=e33wGj1pYAV2WWQ8Gu+X9akOz3qMWp0S46IsmrM1GjZHiAIEt88sTQdkcdcjp6qFj1
 uA5v8HrC9Piv+Pwhn3+fd5tqHf+PY627Xt/YZXhnG6LSMMhoc5du+izcPgGPQeeFehu7
 i8G3G6gGdoZkPPCIbAwUBS22N2GT1A43MQqSjQV/Uw3aecf+kz1m1R/CiALexTGBbxWt
 BJkmdCk96WgAGYDVNRXHjw8f7YnT5jJV1Lmt2eSSqr7eeJu/xaB67yeyA4iAAY2M/Flg
 nb7OhUXhZWCsOGGTfzABjvooM1LEAkI7MCRQO5XCydGIZZhP0J58yBSVIX0VXx0/09y7
 j/Ow==
X-Gm-Message-State: AOAM5336YmMzksfSeGE+F5IilNDQgS2N4yM2hSbHrZeliydjV4rScs8n
 R7aTyttwWSaEhiiNZ28f5tcDPmK2W+c=
X-Received: by 2002:a17:906:3687:: with SMTP id
 a7mr488450ejc.210.1606150535197; 
 Mon, 23 Nov 2020 08:55:35 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a12sm5366227edu.89.2020.11.23.08.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 08:55:34 -0800 (PST)
Subject: Re: [Bug 1905297] [NEW] Zynq7000 UART clock reset initialization
To: qemu-devel@nongnu.org, Michael Peter <michael.peter@hensoldt-cyber.com>,
 Damien Hedde <damien.hedde@greensocs.com>
References: <160614967524.17013.9714069541645314856.malonedeb@wampee.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <85b90548-75d2-4402-674a-cabd1a517e2a@amsat.org>
Date: Mon, 23 Nov 2020 17:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160614967524.17013.9714069541645314856.malonedeb@wampee.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bug 1905297 <1905297@bugs.launchpad.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eJOscdPiQQ/d

Hi Michael,

On 11/23/20 5:41 PM, Michael Peter wrote:
> Public bug reported:
> 
> Hello,
> 
> we have come across a strange behavior in the Zynq7000 model of Qemu
> that seems to have been  introduced between 5.0.0 and 5.1.0.
> 
> 
> The reset values of the SLCR register, in particular those for UART_CLK_CTRL, are such that
> the UARTs should find functional clocks. Up to 5.0.0 this was also the behavior that was
> implemented in QEMU.
> 
> Starting in 5.1.0, we found that - despite correct reset values [1] - the UARTs are non-functional
> upon reset. Some investigation revealed that the cause for that is that the corresponding
> clocks are not properly initialized.
> 
> Between 5.0.0 and 5.1.0, there are three commits  that touch the Zynq
> UART clocks [2]. The last of them [3] triggers the faulty behavior.
> 
> Attached is a patch that applies 5.2.0-rc2 and yields a functional UART. We surmise that the
> underlying device release issue runs much deeper, so it is only meant to identify the issue.
> 
> 
> [1] hw/misc/zynq_slcr.c
>       static void zynq_slcr_reset_init(Object *obj, ResetType type)
>        s->regs[R_UART_CLK_CTRL]  = 0x00003F03;
> [2] 38867cb7ec90..5b49a34c6800
> [3] commit 5b49a34c6800d0cb917f959d8e75e5775f0fac3f (refs/bisect/bad)
>       Author: Damien Hedde <damien.hedde@greensocs.com>
>       Date:   Mon Apr 6 15:52:50 2020 +0200
> 
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
> 
> ** Patch added: "0001-Initialize-Zynq7000-UART-clocks-on-reset.patch"
>    https://bugs.launchpad.net/bugs/1905297/+attachment/5437267/+files/0001-Initialize-Zynq7000-UART-clocks-on-reset.patch
> 

Can you post your patch to the mailing list
please? See:
https://wiki.qemu.org/Contribute/SubmitAPatch#Do_not_send_as_an_attachment

Note, you must sign your patch with a Signed-off-by:
line, see:
https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

Regards,

Phil.
