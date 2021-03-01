Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3227509lfg;
        Sun, 28 Feb 2021 19:48:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLJYKvM6CCGn53l552IYQa4gvQmS9/P0plDaF9Nlgwtdgc+51ksIny/5kRxYDP+GYdW843
X-Received: by 2002:a05:6e02:ca1:: with SMTP id 1mr11468423ilg.242.1614570527513;
        Sun, 28 Feb 2021 19:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614570527; cv=none;
        d=google.com; s=arc-20160816;
        b=LtQTveFpJvQjdQTUZGxo66IwQZ36RKwQ97Ze8Sj9Kw75RuuM2pVEf2AaAvn4FvPBFa
         M/GTvjuphn/Nd1qUPPcBQzG+MhlBmYXcg93WsOwd37UsQ6J7xfmQVYompIUMhNvcE5of
         +rbaKJYycW/TZLab5FhVyg/L45yfXwMSD35wWGH+EjWLYEWOcN2O3SDUET+zg8Hj2unw
         Y9hR+6Fq1EOWbILn4uzn73crHIPw7Wfx7Hc6iymP09PIma1l4z9FtImNcG383gkAKsLu
         Q+Lbce0T/QT77zcjQhYKZaAyTWLjrqYZMZ5CO80++wRHTvA0gHN+Q5JD8KVCSx6j92dE
         wUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MLshKv5jexDJ7qDnJ3Pg+1o/G6nYTxL/ZZ4kOisLSdk=;
        b=dLNZpHEfs7B/LQJWyW+ydjYEpvdekcb6avAgeLxLVq9WfoifHfblGLiTPVn+a23Cqp
         4CRHee7fD4pS8h0HaShIaDDLC/OUtU20Sa3FT764SzClzj+vA4AMtiGAueYxC4futpfO
         DQUIFPZsIz64nKVJcywN+P5h0r8MPtXePSTcA6sTN+S97lWDvXsKLO1x3Kx7viKJXOii
         ACPeXSYrzhMRt1jlmMRZcVmJd+j1T688onniRiVmknQhyQVyIUoRKnfysIvQavOz+Yg+
         4HSmbg2KOC6uY+Xh+ZJ4j6iE9iVq1jSVReUJ3yzq+1uchbKRRikvHJ6rO0KLsS+5QXIw
         5JUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dhc7AzPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si13500235ilq.17.2021.02.28.19.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 19:48:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dhc7AzPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGZY6-0003I8-SJ
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 22:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZXz-0003Hb-5O
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:48:39 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZXw-0007sy-EF
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 22:48:38 -0500
Received: by mail-pf1-x42f.google.com with SMTP id l7so6359910pfd.3
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 19:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MLshKv5jexDJ7qDnJ3Pg+1o/G6nYTxL/ZZ4kOisLSdk=;
 b=Dhc7AzPm+vJKrF/QV6jD15Ie8fC9THlUA0+H29FqHY9IMD8y5WHsLDvO/f2vOyRpoB
 5yoJjYdo4V4U3s782soX0QbstpFDRZ3x8mfFEBi44sGm/Y8w7WsTBt5YgHZgll+U7anI
 NrHMz0AqnYJ2X0GbbKetJ35bO3ICzhblB7Z4/p9yYJvzmmgCJMQzfsuu0QPaNZzDSOkw
 tAKd525uiWU9niO2wPLDuwpe7dEWc6FNr0EWqi80bUcENid8thrBQSUeoJ0KYEuK6jNr
 B8mgaAfikGPoo52mnR8gh4GQDetOJqqfYbIf4shb/Gi0JwUXIA4CGwnvtME8QcV3/OEz
 +Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MLshKv5jexDJ7qDnJ3Pg+1o/G6nYTxL/ZZ4kOisLSdk=;
 b=Fjrl2mijffFtGGh2zGh6jXKFlG846uENt/80WYNj8yiWYDp31a3GkhgpJZoJcMQisQ
 TbaVXY15duCYmShYkJIwT79VfJNE6Yt1cGfvHApz560SLEIYLGA0nEr4J8xZuyB1f5F5
 SJ3bYM5tFfHkcEOxhU848wL0GWGLFl90gHYh+kU75s9AioTY0ZXBM2QrCFEt/1JxpuUI
 sNifFe5UdOAyOZ1v/3ftqTBuYQpHebX922qu3CBfMg5y7vMO9GrLdlyqUDGC6CwA8IYN
 lE9cYFqFP2OTQGMzwxVT4Miz+ZC7tlKM1hZ0g0p3yLJNuGX3mFXvzc1TauKhaY+sN1uj
 jSuQ==
X-Gm-Message-State: AOAM530LX1OSr5WNzVuP4VYmhFZn/wBM22aUqKunZ4FSEDaVuJQKDOkf
 EC7PDQeYf6Ts/n8LZb1wurgXug==
X-Received: by 2002:a62:7a88:0:b029:1ee:174:7c22 with SMTP id
 v130-20020a627a880000b02901ee01747c22mr13008953pfc.35.1614570514682; 
 Sun, 28 Feb 2021 19:48:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 72sm15330317pfv.5.2021.02.28.19.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:48:34 -0800 (PST)
Subject: Re: [PATCH v2 11/24] hw/arm/mps2-tz: Correct wrong interrupt numbers
 for DMA and SPI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6b5a8f2-1ed1-24eb-5feb-040c75b45c50@linaro.org>
Date: Sun, 28 Feb 2021 19:48:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EO9JR8hq9ZTv

On 2/15/21 3:51 AM, Peter Maydell wrote:
> On the MPS2 boards, the first 32 interrupt lines are entirely
> internal to the SSE; interrupt lines for devices outside the SSE
> start at 32.  In the application notes that document each FPGA image,
> the interrupt wiring is documented from the point of view of the CPU,
> so '0' is the first of the SSE's interrupts and the devices in the
> FPGA image itself are '32' and up: so the UART 0 Receive interrupt is
> 32, the SPI #0 interrupt is 51, and so on.
> 
> Within our implementation, because the external interrupts must be
> connected to the EXP_IRQ[0...n] lines of the SSE object, we made the
> get_sse_irq_in() function take an irqno whose values start at 0 for
> the first FPGA device interrupt.  In this numbering scheme the UART 0
> Receive interrupt is 0, the SPI #0 interrupt is 19, and so on.
> 
> The result of these two different numbering schemes has been that
> half of the devices were wired up to the wrong IRQs: the UART IRQs
> are wired up correctly, but the DMA and SPI devices were passing
> start-at-32 values to get_sse_irq_in() and so being mis-connected.
> 
> Fix the bug by making get_sse_irq_in() take values specified with the
> same scheme that the hardware manuals use, to avoid confusion.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

