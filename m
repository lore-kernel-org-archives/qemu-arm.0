Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp1504819qvb;
        Thu, 7 Jan 2021 14:02:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo8T0NLijOJiZPTc7XRbshRApnUo0SmFnrb2GLfgFMYYRBABZbmIPU4ZPG0T3iv5FRRMOU
X-Received: by 2002:a25:d2c3:: with SMTP id j186mr1337193ybg.386.1610056965922;
        Thu, 07 Jan 2021 14:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610056965; cv=none;
        d=google.com; s=arc-20160816;
        b=xlnhxiWNdp+dUmIWujDp8uBowA5SLCCj97wSWgrFZvEfhcOsxhhQl34i3EYGdEPCWZ
         Dit7F/4MUYondYEO65HuihBW0kxfrkX5iWEz7gy4xYTNpIH3RwVrbALxHxgZV9RhF9b4
         uufgOmaC8vobbRpTnWsDA25IBivr3xRsXGeQ8AOtOG5w2pvLU91eOR8qa9YKeT+/3zI0
         4a8hE/r/+DUaFG+Jle8vVrffeP2m7yq5+4xP9k49MjZmY9LdmLhXiL7Tkg3qOoD9XZA8
         Gbq/4ge6Y/T5Ki5+gYudic+FpY6wdvBKNRd5i3RR6Yav4bzW3Yl0HqAJd+5Rmc9M0E5g
         t2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wIrYqelWQrLF7t7DOjYcFcQd5x0pSDtWI74x1YUH7vU=;
        b=sHZ1evdjHm/Meoz4pBdd4gOjgAVNtCA3RilrT5YA17vxmWvzwZGYXDPua1fDGc0Esr
         olcEov/kjVcygxOeJP92nAJaVH3dNqKTrqrUTk7e80XwxUSMYUYag9UJEcncmD4KYlxQ
         JccBEAdbapswdG7MIILZYB8yxle8JldEz/w2MVF9Xh3W2K3cCaTFOnYXEaRU2Mv8XoLN
         rLjB/L8NJysDuHDH119kEjxDnuJhtOP9ffYg39EQIa5oTJm3ssoiRwkuKjycRmhv+lym
         43woDfwOpiefzgFh9C1ExQly+7vab2VwxRfybCiUYPNyBdPKVg1Ikw8HD4apUSD/QtVY
         BHSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bp06FwBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si6789716ybg.47.2021.01.07.14.02.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 14:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bp06FwBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxdMj-0000Bp-F4
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 17:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxdMT-0000Ba-9e
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 17:02:29 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxdMR-0005Kf-FA
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 17:02:29 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x126so4889520pfc.7
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 14:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wIrYqelWQrLF7t7DOjYcFcQd5x0pSDtWI74x1YUH7vU=;
 b=bp06FwBEyhu+gPAoNzPGfdGXUet9fejNyoQ/sZKBPKsf9HfN5xcwb5fS6UoMGqsTaA
 ohube+8/boY1JYepgr1f2m/1BZAKnm/E/6cQDF+gXR56WVrH2Pznp9kjySK1K9+0gPUk
 5uAgqdQHYpNm/KbZmje9L6ZR501CgTFwmCT9W//azkMsAFkMabXBjzsLxYAfPL1Aa3vE
 xGkWT4YCYdisrkLns8in1mkRXml2uFlo+nAVbmAn9HtDiatkri5pQOdAJLU0t/2SQlxF
 pI4ikh8tRf1qK3W9kF0aUaxDRFp4gGlngota3iZe2IX0lD44vT0thlMhJvpk7Yd69lHl
 21mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wIrYqelWQrLF7t7DOjYcFcQd5x0pSDtWI74x1YUH7vU=;
 b=BHaEJvfaaxNfIqxLzL98wyFVpMnGxfrCXrzfuKSdJ62Fwsayt5zvHgSG4JACLIcmSg
 44CPvb+z7IgAt0r0M6jTZ6JkbWijPPyCbN50a9wTxgy8iQiiuRXr1OFfy0fZabE0R+hu
 lxkTHbQ4+1lkcAkART9ddKgKohnz7jQR0WepSvrGeVJyvJX3OCJxqQh1+QwkHdEuVlyj
 7AJ1xp7FLoB1hlyLJP0W+iIsxbSm5VS73WrX9nGKWzdjRIA1Z7cjUgPj31GFyHsvxmQg
 MpgFb1gOb0WjQpxlU9SUJWn/u5qc2zEcwPHn4gOlB6NZLpwatdUB0GEU22bAAHmvC5vP
 KZZw==
X-Gm-Message-State: AOAM531g7PORC3fYodPW5m8SlK2eYTzra9A8D51DOtxCxD/kVFczANcs
 AvIjj6DiGJev1/slEUiEy4dUKhBZB7cqkQ==
X-Received: by 2002:a62:7858:0:b029:19d:c011:1cfe with SMTP id
 t85-20020a6278580000b029019dc0111cfemr547178pfc.47.1610056945802; 
 Thu, 07 Jan 2021 14:02:25 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a4sm7972298pgn.40.2021.01.07.14.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 14:02:25 -0800 (PST)
Subject: Re: [PATCH v2 24/24] target/arm: Enforce alignment for sve
 unpredicated LDR/STR
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-25-richard.henderson@linaro.org>
 <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ff3c7b0-9254-2e36-89e0-e9eb59fd6e7f@linaro.org>
Date: Thu, 7 Jan 2021 12:02:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y0LBbzIhF/Ft

On 1/7/21 7:39 AM, Peter Maydell wrote:
>> +        if (align > MO_ALIGN_8) {
>> +            t0 = tcg_temp_new_i64();
>> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
>> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
>> +            tcg_gen_addi_ptr(i, i, 8);
>> +            tcg_gen_st_i64(t0, cpu_env, vofs);
>> +            tcg_temp_free_i64(t0);
>> +            align = 0;
>> +        }
>> +
> 
> Why do we need to do this (and the similar thing in do_str()) ?
> Most of the rest of the patch is fairly clear in that it is just
> passing the alignment requirement through to the load/store fns,
> but this is a bit more opaque to me...

What follows this context is a single memory access within a tcg loop.

When align is <= the size of the access, every access can use the same
alignment mop.  But for MO_ALIGN_16, since we're emitting 8-byte accesses, the
second access will not be 16-byte aligned.  So I peel off one loop iteration at
the beginning to perform the alignment check.


r~
