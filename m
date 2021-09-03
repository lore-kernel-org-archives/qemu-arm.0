Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1589241lfb;
        Fri, 3 Sep 2021 12:22:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaUEEzJVL3mWh7HeF0WL/V/ALxXxZSbppIdybpleoudtDE0tKJMvPDILJl7LUHp+mFNKYt
X-Received: by 2002:a05:6602:117:: with SMTP id s23mr430819iot.124.1630696973499;
        Fri, 03 Sep 2021 12:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630696973; cv=none;
        d=google.com; s=arc-20160816;
        b=ubxmtp6qO1S3N2Q24iGSREUCNbzjiAdeGYO2/qTC9kCRn+JnNAdV8kjMMM/8erELIQ
         ktuMruCIRVz0VeUUjiRlp7pRbKKqagPhBVem194LW7fev9aEMaa63Rb99enVILyZa3vO
         o9xGXccWs+ORgp4QryjWd5tZFvMGpN5duiWntwNEMSYuYcM/UHoNLZ6W0LgZL5WCJVAX
         ImIh4T+yH7qsRXI9gqb5kfP4yAyv9UL1Zd2RiTkeRBqLYmFRKS9W5M5qhoWEX6kmX4Zg
         bf6IduW9h3iqaPrZHbu6KtzcrZhrNzumpvUdixjE5b/7OZ6zZj/YdWqyXjYVk7uypFnS
         fyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
        b=PvCPGN6JBFmk3lxZ1ijTUgDty7RuKEWduneRsmUUy5jijRCJ3sVGOnBkBf28GAlX1t
         HnNafAdY0fFLay5xQ4+EVk+U5PsxC3FNh7rXFa3T2i3LEUOVTboN8Hrp4AW2PcWlA0I3
         X3BFBRHnsOth9RhloYBWG01AYysp1hqMMrEZxFaYwLfAQNReBMd0BBY85HgkZOC6dI6z
         DGWJuHGzYCqchkca4YRLdHi+GwfJ389qsXJ+BIGp8/rR1Y/lomi4FtN4NxCQFRG1ndTW
         ay900Z7+qnpV7UoY2xQqLmzABmgH/cTK9gtu4R1YRv94e/weRBpaVM7YvJh7y1D4g0/d
         DkyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ekz8NBKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si202516ilf.63.2021.09.03.12.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:22:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ekz8NBKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEm4-0004dI-Nb
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEgq-0002FC-9o
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:17:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEgl-0008Ft-Dt
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:17:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id u15so4148452wmj.1
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
 b=ekz8NBKCkNG5colzCqoVrdGik2xvl5PiPiUF/tiLlRM193rIeI7eFXLiBPOlv5Vp59
 Nu9a59QNxzDPXKZr+qm6fSL5vRx1H2fdPcUAQ1ZqqWAGlRZFKDl606azUJbWIMp3eb/2
 Vz9742NtKM7V6lD/ao+4RB5HmjtwLa7rYpiyhv65odSrkp4qpth6l9JxTyOuejmcIrt+
 yrz43wSPFIb6UUm9jgNwkzkXFhpiU/RyH+YZwLuw3OpNO+IvcUYqk1E+VUmrSLiIAa6x
 6f4R5FsFNhuV66ltXk3E8CseDyLIcEteqQ6yWLT6L/5LIrFtcnOhO5WApOOI5CFD7vUl
 lC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MXxKo2UCC7ElJgov5HnxrIOOIv2JepBr3hCE3i9yQm0=;
 b=SD3qM1JyN9WrqyGJ+bbBAJ8HZ+3TOImhXdPSOmcJ2kikz+Bi4jRUbae2yMhdwTE41v
 5me9TzwS2kV8/JJI//G9kTgDP4og2jybTCoZjKj8b9Ls8Oy2QkMhPcMmAkWL62yhPqI6
 uIifElVtmycUQMuWY9v2w1oQydHRTLrSIFvcAtw2rZoOYEzSscLFrEZdwDkXf2+6CSxg
 o4P3cvcuJ8x17QokbOTNd2IBj7ljFLES78UDMclUhUqixkVUyGklRmEKxawjRD6GxA4w
 WPF/K0k4cyFeDa/ZoA8CKlXxvEGsPDBwQPCFTNhyrw5L+wNq1NpFMi23rq3rA3VNOD03
 Lghg==
X-Gm-Message-State: AOAM533ZxdrIzFD4s9o4arra7oriO4rSOy6QDkxMoI3Manj3e9yGOAFa
 hWZnznKkU86g6nut86u19mL/oA==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr301738wma.87.1630696642107;
 Fri, 03 Sep 2021 12:17:22 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y24sm294760wma.9.2021.09.03.12.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:17:21 -0700 (PDT)
Subject: Re: [PATCH 14/24] target/mips: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64429f05-fe84-89c3-0c97-1f5564218372@linaro.org>
Date: Fri, 3 Sep 2021 21:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: gsC06PvdCvBz

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/tcg-internal.h      |  5 +++--
>   target/mips/cpu.c                   |  2 +-
>   target/mips/tcg/exception.c         | 18 ------------------
>   target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
>   target/mips/tcg/user/tlb_helper.c   |  5 -----
>   5 files changed, 22 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
