Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1731568lfb;
        Fri, 13 Nov 2020 13:37:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGuF++oAlmaZzVfWGHBHJ3pxZBuuLQ1jZ/KlWsEPxaOSz4oSB2G40utJQwF6gH8153r14P
X-Received: by 2002:a25:c346:: with SMTP id t67mr6099524ybf.369.1605303470193;
        Fri, 13 Nov 2020 13:37:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605303470; cv=none;
        d=google.com; s=arc-20160816;
        b=VFcyTphxuxp/xeUi/YA8gcNGRnrJKquQ/0PI2hSX07xxHI3nv+NdfoQu9mXxjJPmYR
         tV5RMnjqwnSSnU7/GNCgwgCqESgWty81qNBEdtu+DoPFA1ia/7IXZKug248HL3twi9yw
         QdLVWH/1CJ99Hu1dBWLGBznh96is9zPYRsNTsXEKSHLNjg0B1j8fciItpKIEgO01uKg3
         gt/FxzAHOhKe73Z0gDmT6fCOyXZySoKV5q4KTxdrhjFTVhcNtQg/PwjMoHgTJgP0yyTK
         tGiRPkIILboUlkY8y+FijKSrgivu/p4DXwWBddtOav8trP8krP8/iY6yaz0HTXYjawlv
         1kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8DIIYGkGVU+UWKtk2QW2/EiJ0+H+gUj3LpHi52ISySs=;
        b=j2y3dcAkjnEGuetrOAIy/IYGBkBBvAI13sVIHewzPs2dEvt/C5wmts49xjO0fEc0cl
         f4YchhoCCPdfxpKmwRvEZhP6YEgM/RfUfz7I9iAFQCno9HD9MQ6k6hnGm20vRtujcUiE
         x+pCV/IvpuZyiFasHecEbHaq6AgFPn39wXtb/ZTgG/TK0fJ5p3d6H/KqH3LcW5HP8ddh
         w1tl7mcmxwQEYypp8UQa+T67vr5KKBAo8QXHOcDHL4W4T24WYLUkTNj+76uUNzk0S8dc
         6mLucH+x5PUd1ubVNiMvxuTgDnydsKzChXYV9ma7EbAQXxiEx2shdIn05ll2V56Az5R9
         NPpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H1hNBUKt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si9126724ybk.265.2020.11.13.13.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 13:37:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H1hNBUKt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdglR-0005ld-JO
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 16:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdglI-0005kZ-EN
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:37:40 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdglG-00080S-Jw
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 16:37:40 -0500
Received: by mail-pf1-x443.google.com with SMTP id z3so8714549pfb.10
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8DIIYGkGVU+UWKtk2QW2/EiJ0+H+gUj3LpHi52ISySs=;
 b=H1hNBUKttLOTQ7QdqZj6bSkmBwyDvPNRiWe+WjYP2kc7U4qAn9sgFTbNdaP0lLgsDU
 Yot8EIQFWw1D2Vb4Za2XTlss0cmp7UdC1wQchUuNknqMRvDOhbRjSHQ/e6ANpMMHCePg
 kUgK9thh29a/WWglOQc1mmZ85wxn3dTR+3VouQANBQhD6Q4kBI/JmCuamozZTmmd1RPI
 S9X/TOZaN7/0sv3aJiSgzBrhxQVcVnJ9SjrgAgr3/lLhSdvDaLFrFwOviFoYzIMn8iEx
 egxgYXJT4kXIq9dpGYTBYGwIPP/K95AUGK4BFOUaLzByUawKWB/l7U/4IGOkVcW1aiCr
 joQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8DIIYGkGVU+UWKtk2QW2/EiJ0+H+gUj3LpHi52ISySs=;
 b=ZFGPsR0Zz149SVrg3/fnaajks2bzx1SzRxQ4bvHMECxj7LHuRH3QJsrPDz4jUR5CsD
 SQBSIW/ziyn7cybuPORrelzc9gU/Nx/HSne7EBo0LMzkmOfn+YE57ZhecwPc/ZCXw3R0
 Uw/h2w9kmIA9LR4yqqAa/A1JpEMTPbL7FhAcK5ZTnSS85SY1t6ec5zUG1f2v5UxeR1uQ
 A/pf1i5EKH3Pdh2voWH8JcPSdabp+WLlmXUojCC7eH3GA4myJyhm3I9G+ZgnIUUR9COi
 GCs+oVoOOO32Mq0CwKEPr6g0mrFaDlU7AFSAZWPvCFMA8bRiVrLN/+NIctSTM690+z5M
 VzHg==
X-Gm-Message-State: AOAM530AoRjjznJIHn/2aNkJbllwtQT/ilFxtL207VE7YB5H0yBp5ibU
 dY/sUoGTJiq5b6Jtk9xadOmtZQ==
X-Received: by 2002:a17:90a:b118:: with SMTP id
 z24mr5063526pjq.108.1605303457083; 
 Fri, 13 Nov 2020 13:37:37 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h5sm11820813pfk.126.2020.11.13.13.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:37:36 -0800 (PST)
Subject: Re: [PATCH 13/17] target/arm: handle VMID change in secure state
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-13-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e44d7b3e-089a-1101-df2c-27096cc0732c@linaro.org>
Date: Fri, 13 Nov 2020 13:37:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-13-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yxbY0btJ68tl

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> The VTTBR write callback so far assumes that the underlying VM lies in
> non-secure state. This handles the secure state scenario.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
