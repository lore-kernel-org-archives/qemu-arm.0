Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1204499lfb;
        Wed, 1 Sep 2021 23:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfjDY8qIQTC/l1SPi9Co7zJ3YeF2c78hI+Z2fyNF6T2B7ajsE4AS3CXK7OM24xfc3t+8lc
X-Received: by 2002:a05:6e02:ee1:: with SMTP id j1mr1092684ilk.61.1630562997927;
        Wed, 01 Sep 2021 23:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630562997; cv=none;
        d=google.com; s=arc-20160816;
        b=FSztxH7pL/QmqzxmaFTPCXt8H0VK4g6I3bKYa8FND/jDR5i1Zmi6vrgm5Cz50W9AZZ
         qSeYlLIEOBRZiKdg6kwl3C2n/cnFJN/rYnEIH5ufdXIkRGJODvCTQ81/fng2PpxatvAw
         SndcesiKVgYYGwyGDSM1vuR5Ijaybu0vFyVRio95FdjPIcZcNYuwFqfeRWN6lIbEO0E1
         qqsvindw2rg6063ofn9nHVaCzxXYGvrPuOxIxRhFOEqBd/zsSFQAohZnksAnw7FhbYmt
         EvGx/IBDMRsunawaB1sBOdPZ6//6tjOLsrYXlc7MV7WMKnAVO/uRUAMWELtnVLyUf/fE
         57tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9yMdc3ZgdregHxk64PfpT7+RIpYun8vN/FxJFEbDhqI=;
        b=UB3xKnSINl5AtfqRFgO9c3+DcgYMwxP/gKEgzQvAuCXuXq238x1Km3vmR0GFrzcKZa
         keX/Z/RKvqfE6dFGtWbSW7VNkmIPQ8TdimBXC5wH/eDFoLDRhjC0KM/qac2Fp2aRe8eU
         kASeJu99Z7qCwFdz6KiEFupI5d+Mp4Ze2/HSrSRW/zLUXxigooZYGAhnta88qamCTU6e
         Zc+V0MEBmynyMAZwiY+5JfYaqYmx1RBgDnUiGUVK+ayX0ivsQoX54JgEn0W1QD1mh3yF
         OHcGj7738teg7hNr7mW6mKqLNB+Bk221qGAGBnae0dEdx/H9tenQjm2qa/kEEUmHRhpY
         w5uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=fQBJUt8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si1330307ilu.111.2021.09.01.23.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 23:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=fQBJUt8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLfvB-0000X9-7u
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 02:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfuo-0000WI-6Z; Thu, 02 Sep 2021 02:09:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfum-0006Cm-KT; Thu, 02 Sep 2021 02:09:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v10so999299wrd.4;
 Wed, 01 Sep 2021 23:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9yMdc3ZgdregHxk64PfpT7+RIpYun8vN/FxJFEbDhqI=;
 b=fQBJUt8qbiBi0soJ/D3hzBKLD0vgRYHsWLf6LgVoqdrsxe2wjs+t17pLdjPLBC4cMu
 cvanY4Rrfyim6m63dnvWRFUHfz2kBwbKftvTskW5NOG8Hi9CeTUJsJycZ2x6wKhl4mRr
 /YZWy/r7j4ipwDQAP4vGSi/qkFHi0LZkd84WsVhGh+Gnf5R1pVsJgP//fCklCb9S5mZa
 /ksrcwMRkbMKffyQIg+U4V1/GlxhX/iyk0pZrcSIxshLaLybQbbhbtiI4Cp2ekvk5R/S
 a3mFYcAAPotMBiANfN53lWluUzJOgSGT1hn5t0HPBsamVyBHnI7CX/Vaw5a009ziNjzp
 arbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9yMdc3ZgdregHxk64PfpT7+RIpYun8vN/FxJFEbDhqI=;
 b=LIsw4nlSUancXIxV1T6XG0mwxIteCrGDmXttneYwU1BO2WL+wv6iy3t2OcIIX2G/Zq
 Dhdnfv8/DYB5H3gzb/7kW8w9p4o/GcIOhMN6p1CNcFXzgzVlHrD/M31O2EM5LYxoKHMf
 6j3v76JgRm9CW6a29fdphIlihlMEy6yQHMD8aUmrVQdquahMpyuBRfuhGS9GAZoQnnn6
 pxoATCPV++B6zISp3N5/lpOGqPyPYrQzDlGp1rxhUjAD6227cQOXSPfybQRk2BHfQ3O9
 QOCvjGYKzX5njmk5rWVfe8NhUfoztt+oo/Yk0Nwfz/s1XE4v+5BtyrVHATQsd+1DdlMs
 jU5g==
X-Gm-Message-State: AOAM530UTY9AwEnmPRQeK5WzIijhM+iDoGD0JDo8MuI2SdROKANY6BaM
 0tmZGu6aTOp5YVnMWXp7XFcXYUXpkJc=
X-Received: by 2002:adf:d0cf:: with SMTP id z15mr1606061wrh.356.1630562970364; 
 Wed, 01 Sep 2021 23:09:30 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u17sm628928wmm.33.2021.09.01.23.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 23:09:29 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read, write}()
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <869636f3-6e6a-d5d3-e377-1634f8165aa4@amsat.org>
Date: Thu, 2 Sep 2021 08:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901032724.23256-6-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UfpG+Sdd03D+

On 9/1/21 5:27 AM, Bin Meng wrote:
> Read or write to uart registers when unclocked or in reset should be
> ignored. Add the check there, and as a result of this, the check in
> uart_write_tx_fifo() is now unnecessary.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - new patch: hw/char: cadence_uart: Ignore access when unclocked or in reset for uart_{read,write}()
> 
>  hw/char/cadence_uart.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
