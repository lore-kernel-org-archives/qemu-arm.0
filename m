Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1650217lfb;
        Fri, 7 Jan 2022 02:02:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyb8jHID2E6OVmXqHt96CzC2aXQKlLUkhdfRR/yWVwxblE724YTmrbcLbaJw6nGD34eWLEC
X-Received: by 2002:a25:d44:: with SMTP id 65mr68866658ybn.510.1641549774578;
        Fri, 07 Jan 2022 02:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641549774; cv=none;
        d=google.com; s=arc-20160816;
        b=vuFagimlAjgfcWO5L5Roqi6DM8x9Pm3Uz3FJKdDdE4SIzS4VVBNmzKU/2fwf32C31L
         JZyUmj0JoFezLT6BU6E/1DDsq0nD/BLZhpui5A9YzJ5vV0HUqaBl5msR3gH8UowBdpog
         jQ9bYaxTzKIbpjGuL4tjbZOQCwGMqKGczMA3R+sZbI0NEb1kjOi+QfMyMMu3iSJAivsI
         imBOHxkIVweYrEE816rDBZByPJmPk0nsgoc4YemN6rxVpdCxuR5UgR2eyWLwzoERFF9K
         klEaFcDIi18f55IhQ4T+72zuF390k3FrUscYZDzGYgaJ0SjXhIAWA1kxxsZRCFLOqeNc
         gTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYl3eXuVtD70QvmjeluURJ5L1gspJ7DMJRdw4QVj4v8=;
        b=P8qg47dZjlCn/DzImZ/Go2fa6+wx2uw5pxHJfM2lAhn665W5yhtFF7VjaUjiClYYYk
         j82MyW0ocrQlQ9IEM7BIqn1CjGqcTk7wTtwxLbJsQ3dZc1KvHK5KN1ItnsNRJuIdT56R
         1B+qKLnWnfbC42PYfInIoiGTwUf8kcanaVSZ1a023qzgPzE0H+MPtpoyqYMi1gH3W2+E
         XRFxA8MJVgMQbTSI6rqY9G52G2Z2OI4YDLSgDCuQEZv2b6RqFdCJraQgVq32zP0toAdx
         bqbiyFoXHQTBJ3ze83aa1QcQWzQiblA5GN3kiT3EgQHy4/jmtPp6Fv22MfQ7sfsO9Uuz
         jtLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fQHVeluu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si5205850ybu.764.2022.01.07.02.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 02:02:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fQHVeluu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5m5F-0000I2-E0
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 05:02:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5m4b-0000Gu-GX
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 05:02:22 -0500
Received: from [2a00:1450:4864:20::431] (port=46847
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5m4a-0005ZH-4W
 for qemu-arm@nongnu.org; Fri, 07 Jan 2022 05:02:13 -0500
Received: by mail-wr1-x431.google.com with SMTP id i22so10005294wrb.13
 for <qemu-arm@nongnu.org>; Fri, 07 Jan 2022 02:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYl3eXuVtD70QvmjeluURJ5L1gspJ7DMJRdw4QVj4v8=;
 b=fQHVeluuhYmNXhRdYGJaO7XkUo/faThS9pkJ5Xa+zvGGgYliEj6MS8giraZV/70Pe1
 uAapzW3BOPppPLyt8J8TQzSH0PVvzKnTomlzCfGRpCyG/mb1gjRnAdMAjGzeKhEqi7Gu
 jt0f57Yvijii/+XchHX0hetTEr/r4liz0N4RqMZU8GyCo9dBVZe/s1ZLLWLtRHRDldve
 5+sOpML8x0VWZ4HiVKFUYajK9RCJMXk/yuO+Qp03noj5KEvRso3Ib48hPv3Amm05mXfr
 5iyy048Q4hUyxCB9fM2DrG24zobDvQSxR9bD3+xNQxFqwqoTRzIPb+Fmg8nLmoX3rNod
 2nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYl3eXuVtD70QvmjeluURJ5L1gspJ7DMJRdw4QVj4v8=;
 b=2zLMgxZcRs6x/+iTF+T8WmGmjM9LaUZpWzmH0mmPE/0BNvA7cjuLTWCGxHB7bybGRV
 UfW6tcI+4mysWqifsvk1hFUeHSJM6FZO3IR+mngbt1aPOVfk6IZGJpvIUKnuREH09tyi
 JugzaqUYbcJi30MPUOGD0cj726k+Vc0cllyJDJo1A+59Bm1bALaW1zL8tCPxLLYFOySV
 hiGlUIq4Pa/y88q5LFOxIM/7ddsrJ7ifvzm3gfenBgjhZd39oC9cns5FDgEs+BffpqQ4
 j7IRfRL4UhyPqXM1oirj9pJ6AILVBXCbVk8rwWZXSXvLFS/IStb9P+BGGPmfXp86iRoe
 t2/g==
X-Gm-Message-State: AOAM532lsKK4vFdmXTuHhTCBOwjyll/p3f+wmZwu7Bj05AjRqA/adN/a
 2/kZH4NvizInG8AlWEhEnGeb5Doy9STuZ/ibdKBVEQ==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr52787358wri.295.1641549729050; 
 Fri, 07 Jan 2022 02:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
 <0570193f-7a2b-9fd2-ac4e-76aeb671f2e9@linaro.org>
In-Reply-To: <0570193f-7a2b-9fd2-ac4e-76aeb671f2e9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 10:01:57 +0000
Message-ID: <CAFEAcA963frbB53toemUGL9OK9A9D1XkDKXfSHrG_SnzN1CwiQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XXuxqMqO+au8

On Fri, 7 Jan 2022 at 01:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/31/21 2:39 AM, Idan Horowitz wrote:
> > Some of the instructions added by the FEAT_TLBIOS extension were forgotten
> > when the extension was originally added to QEMU.
> >
> > Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
> > Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> > ---
> >   target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
