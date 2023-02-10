Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1874342ejb;
        Fri, 10 Feb 2023 05:53:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+VWWlie1y2oxG13I/wDOGBKtUpblz1AFxblXQB1NUworaZBgm9ht7JjxRDosP1M3F3wIGp
X-Received: by 2002:a05:6214:c43:b0:56c:2352:92d with SMTP id r3-20020a0562140c4300b0056c2352092dmr12839715qvj.10.1676037214110;
        Fri, 10 Feb 2023 05:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676037214; cv=none;
        d=google.com; s=arc-20160816;
        b=qmV++I0wSbLFzxMi194Smm1wKt9GPDrdikfX/wx1YxRFfntNLRSiwWtfFJ9qi94ib7
         +LQlBvuSTwkFQZsXcUprgB70Pe3qtu8RdcGSbjR2ZHlqunrnQeURZ6Vpw7rMLAK+auuq
         Ls4YAnjVcE+jp9Bx/xPcC9xbGC/FOFJlNrgp67DrfjSiC9//KWF4rapoS4Pn91WbKtr3
         rjbjq5FQtBB0xWZJx0JjyKFUJJdMHaeJWBMbRPEW7nS2mkm1phQ2FtYiVIbj9uI5JWR0
         xu2chRdUsYZpfFpQvvJEcNr0EA/zvFXYVN7Jrka5tlHC2JVGrwB/rJanLhSAqVTf/WTi
         qWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uScA4mz6AfaSrTRBkOSunfzjc9Xo8y/z+vRr1Vkzyak=;
        b=YcjqR5atBFQ/EfOTAsh0tiwckwpK5jGz6oJyi9wzEw7InutamTh4xlbZO7kyOr00um
         mamjJCe+6aovGpNXe/n5ABrgZ7HTW/wlRYZzJnoSM0lujini06C5btZ7eeURnF9f9E79
         4qEIT1QRFYSsNp1s5Ic6ULEjgywJuTgwr8p5dKdHzN9XV0SwiqbUkL/8pAlMyySPTJlB
         E7x0pi6NY4O2ePQRd9BLC0KHKqBEMaPcUeSQjcRWzk7DxlXx975RTtHAmzNou7kfhM2l
         LERuGY13ZK9xoIFUknYpWmFlbJlbHcZHMSsM955PcKqsyy7r+x+SX08BSb7lruLhu1CH
         FNaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kX8DW2xr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a0ce313000000b0056c210a46aesi3732391qvl.100.2023.02.10.05.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 05:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kX8DW2xr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQTq2-00077A-8i; Fri, 10 Feb 2023 08:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTq0-00074m-BE
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:53:16 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTpy-0001zW-DD
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:53:16 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 gj9-20020a17090b108900b0023114156d36so9418049pjb.4
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uScA4mz6AfaSrTRBkOSunfzjc9Xo8y/z+vRr1Vkzyak=;
 b=kX8DW2xrhS9fgEQP35BRnswpu2ifkww8ZyFmykUOG3m1fghA7GUGQkXJ9RorR6AmSh
 jZ9bm/e6TTGX51MvNHfcJofYNflYVh4Z0gh593zCLCcTYLwv7JIS5wzHJMvKpK6ccjOy
 lvuz0A0l+Q265hSb1gdpFFGsf7knb9GBZnG68p11yRncsTrWPpfO01PhiO6naIKnTWRr
 bKR4+oTlbpPiEIu0mGJIjiKeyN3KNsLZ6ZRMs7Jc0h2CV/S+AWj2alGV25TXLJWzdFuh
 IDEqMmFHUB9ver+eHXaVI0joTfTNg1MLr0YID1F8Wcp5sEnva2oKzaER8PIfxtREGYO+
 JnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uScA4mz6AfaSrTRBkOSunfzjc9Xo8y/z+vRr1Vkzyak=;
 b=nl8VTtV8YmfWnjBwcXeSNMHwBpw2zyGQUZv3Zo/TUAZAewcCt9xwFMYrRpANH3r2zg
 LsN/LvVEzyfFtxL3A8kweqOZHs5hv6qZmYz2PHTUKVBHaYRz/PMLaXYXNnKaP/a0SEhh
 xo0QRrgLlq/hRZ1SvSiKdvzOCXpSnD3HQ9II2Nf7KRngwKcXgNqxu/Mjf+i1LkftrQXi
 ig+4RDH8n1baMahkO4AGhhc78A3aQEczjtmv4UDMl5Wji4MTpMYExCestbNvUEwV3LJG
 NEj/s1W7LHeH1utKWaTyVprwJEHO6tmymZ5LnfxMUIjR7CIGfDjCAeAEU3z2MpvMw825
 nA1A==
X-Gm-Message-State: AO0yUKUoELQ1A15KaSaNHtPG5ivboXuT++68J2RyTjgYdkUE/E/SVzjh
 xNXO+Q+Svx8it9mgQt3m6SlN/53gVDo0MmwjVPZWfQ==
X-Received: by 2002:a17:90a:2c07:b0:233:48e0:95e1 with SMTP id
 m7-20020a17090a2c0700b0023348e095e1mr892328pjd.137.1676037192874; Fri, 10 Feb
 2023 05:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-20-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:53:01 +0000
Message-ID: <CAFEAcA9Dxsi8ejgUkk2Er51QcQL7JqBfHiC1VLc6Ry2T6V_9JQ@mail.gmail.com>
Subject: Re: [PATCH 19/22] target/arm: Implement GPC exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: xvuYaIsnW1z8

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle GPC Fault types in arm_deliver_fault, reporting as
> either a GPC exception at EL3, or falling through to insn
> or data aborts at various exception levels.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>




> +static unsigned encode_gpcsc(ARMMMUFaultInfo *fi)
> +{
> +    static uint8_t const gpcsc[] = {
> +        [GPCF_AddressSize] = 0b00000,
> +        [GPCF_Walk] = 0b00010,
> +        [GPCF_Fail] = 0b00110,
> +        [GPCF_EABT] = 0b01010,
> +    };
> +
> +    /* Note that we've validated fi->gpcf and fi->level above. */
> +    return gpcsc[fi->gpcf] | fi->level;

GPCSC is 6 bits, and you've only put the top 5 bits in the
gpcsc[] array here, so you either need to shift that right
by 1, or else have the array entries all have an extra 0
on the least-significant end.

The comment says gpcf and level have been validated, but
the code assumes that GPCF_AddressSize implies level 0,
which isn't validated.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
