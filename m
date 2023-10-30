Received: by 2002:a17:906:7e1a:b0:9d0:bf65:29fa with SMTP id e26csp52539ejr;
        Mon, 30 Oct 2023 11:25:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78F8+jMP1b/kEy7JGYVN+HI/CmIqSOPmnjrCSqGGdZWWsA9bTSXlGNXKyTvC3FeAhp/3V
X-Received: by 2002:a05:620a:4146:b0:779:d939:5a9a with SMTP id k6-20020a05620a414600b00779d9395a9amr11237998qko.63.1698690300967;
        Mon, 30 Oct 2023 11:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698690300; cv=none;
        d=google.com; s=arc-20160816;
        b=dlWuLTn6nnsXkY8fOnaUByYcNOnMtkw9Z28SuYpByvnhRN02hbtdelGyJfv2oa2M9A
         X1a6PHuYLoP3g4w2RO6JK/k78ubT1gDoyCYsHAzYz4HtvoiMbVRKwCcmuPsC0bHLHNCm
         9M8yFTL4xHBWbFEENmkmS0/Ukg48gnR8eu2DVk/civw+ZzPXL3Xj46SyZOFn2H78VM8Y
         9/bNSTJvRpKGFd+FpAz4FNu53hsgqb5xJlH+Elvl1c0wa8H7LypGjelN9fEcoV6L4qY3
         Nkw92U6btOyxBB1hZ82dpQwWtV+lNNVT1F1Zu0aVe4OvuLIJebbcnCutYeEYspx/TSM4
         S57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=q/F2LVC0VT5W+c7zooeF+919O7d32953+DAfkmVd68Y=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=yOk1KNLDhou4WX4SZcEuw2Lq1dbzi8czpTyvsFp/4kv7fBVsoZ1XlEtZBnp8HzoSJL
         R64Vwsf7BbZUNPepTH7QOFjvPpvc71B749jc5ryX9vjrmRzuGcU6XH/s7JrFAeacvTx1
         M/Naf//MZZ6XZx6J8ucwK8GJZJOcMlbLPEH2c21fvPDO05cReULEpjgudlpbjQeZ8lO7
         6eJii1x1Mdw69gxpsGuhnsg3L2z8+n1T6+shfLwu6FGj2Ya9PdM4glzgzw4BFRTE6DCk
         UmZhBnWMTRGHz+xYwYNVMRPR0dscIWkb+/Va6olBEf4Y85MWna8YDLW3v9LOEVzFQ9Ph
         bvAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SYCTycqc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05620a024700b00775d0319908si5975511qkn.16.2023.10.30.11.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 11:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SYCTycqc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxWwJ-0005Ax-1K; Mon, 30 Oct 2023 14:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxWwH-0005AO-Lq
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 14:24:37 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qxWwF-0000gF-O5
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 14:24:37 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cc5916d578so6840545ad.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698690273; x=1699295073; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q/F2LVC0VT5W+c7zooeF+919O7d32953+DAfkmVd68Y=;
 b=SYCTycqc8p8obmRAcTAy4k/jB8b/tq+7u3krN+Gns6xjas8nvAjLLeyv9FMRfy0SLe
 0aymhW2m/ZrcqqGLLKVCFv/o2MlftrfK57CehA1819A2PuTCMCOCQZpUaWKFVrzT2CFS
 k1iVntG1Dvxa3OsswfnFESLLtFqHcEzBCmP4i3EtiNe8zq3aSYajjWTjnoNOiazNS4BW
 ++s/ExDzlPrq2rCLoQxm018Byiyf2d0OdhJfjauwgHOq/bvBAwAues6IojNykxKp0bs2
 39ljaptZu5T/f5FfQnhEH3bjRYkxXF3nm5TzTb74+TCPmzJ1NGsvi4MkAM9WhB1V4HBk
 jZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698690273; x=1699295073;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/F2LVC0VT5W+c7zooeF+919O7d32953+DAfkmVd68Y=;
 b=wTUBSF2tIe6RGn+QMwXKeDEC8rt0wb8IF6OO36go/UFT96mnE/jb/BWcDGdZUuRujr
 EFLwDniWnyXBABNnisJA9vv5klQSLpm9Z/nxOBmQx70yKOOKJvIiyxK5LGcAqojFTeWU
 X4Gli5urqzVWi4/cZED3jYlzdDw0AbdwEBFYGes6TmZBZ9HL4/ZvfQzpz0nCVdzOLMD3
 Gm9XyMJt5MFonrirpjfpmcF3xj4hYYm34bnD9sBOKmy8dX6sEgadjy3QEa2Kjz7QLYRp
 RunpYAhuAubFAHn05onGUJuTK+Urqvir7LN/zJU9Ia3e3OaNbD/p5ec4T/IgVIjs82DQ
 HdYg==
X-Gm-Message-State: AOJu0YxZIZGa6T5MpjpdFTi8pvXTGyscolKsTcYkfd3/NAcIEpSG183V
 U/mqFoZkqGxdFURp3JrOu36m8P7XCuDrLjHROnM=
X-Received: by 2002:a17:902:cac4:b0:1bb:598a:14e5 with SMTP id
 y4-20020a170902cac400b001bb598a14e5mr9390152pld.43.1698690272837; 
 Mon, 30 Oct 2023 11:24:32 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a170902db0800b001c9bc811d4dsm1609395plx.295.2023.10.30.11.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 11:24:32 -0700 (PDT)
Message-ID: <0a5891de-2177-497b-9489-2e2aed05918c@linaro.org>
Date: Mon, 30 Oct 2023 11:24:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] target/arm: Fix various FEAT_MOPS bugs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231030174000.3792225-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231030174000.3792225-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fQXITqNFGQsp

On 10/30/23 10:39, Peter Maydell wrote:
> This patchset fixes some bugs in FEAT_MOPS that were encountered
> by somebody trying to use it in qemu user-mode:
>   * we forgot to set the SCTLR bit in CPU reset, so all the
>     insns UNDEF
>   * we weren't reporting the hwcap bit because of a uint32_t
>     vs uint64_t mixup
>   * we didn't handle the case of SET* with Xs == XZR correctly
> 
> This set of patches fix these issues.
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>    target/arm: Enable FEAT_MOPS insns in user-mode emulation
>    linux-user: Report AArch64 hwcap2 fields above bit 31
>    target/arm: Make FEAT_MOPS SET* insns handle Xs == XZR correctly

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
