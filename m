Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3245904ejx;
        Mon, 14 Nov 2022 17:08:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf569Zqqn9j9fq4r48OGR1nILTL5ZZUyr6qB+uNIcThh6XQYg3xUY8HgP9YUIL5FfWVSOodi
X-Received: by 2002:a37:9a8c:0:b0:6e5:aa1e:717d with SMTP id c134-20020a379a8c000000b006e5aa1e717dmr13303662qke.554.1668474521663;
        Mon, 14 Nov 2022 17:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668474521; cv=none;
        d=google.com; s=arc-20160816;
        b=Ct/EWLcZsDYbQCX527brliZi6akDf7aVGjKPzxFIBBN2gy0TQz7t2wCtKHX/NIprS3
         L8vMtoY38ve/UvuSR11gotz2Vdf4JCwKBxWq6Q2t/3VuTMNHhBWViQJyQMnGMzlRp9UG
         05J9YZnzAZAtOuiFjVXIl+neU+1ShKcADYKgD2DzYHUS7mRiHoQZNBpFtdcrjh4S5Qf7
         62uDiQ6UXa16fJeQ8pc07pkY9b2GveiXqcpIHfPWhR3Co/OFCZ/vrpPM5E41u9uhM1E8
         DqXdG0jraKhj/85BJ3+hpUzylRIm3sExuNhYj7DSI9jGYCmZTWp0IwDrg9Ryh2EO+wOY
         5BxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MI3hWpAlTSXb1CTab+SpOhfxMGEgiBbmwNtFXQkfI4w=;
        b=h+ZLfjEWv3BHRQjLeNJ3wH9Pqoc6AiaK6Xdui1BrCNEjjrnkIkZaeqfCVwb9M6TO4j
         IFOBtdOHhnxN9EGBQ0oyEfXN40DDVp46JmV6BKGFwLEZrnNJ6BLQnM4OQiIRsAeTvMF4
         5gGAzsHs+sg1XYReJMf6dfV8o1Z9yWmyD4+kOudhNVbfDxqbg/iX6sM1jINhiPW4L6+t
         e6UC5YTv9mCj2OaGEplmgw5wCvIB1yFUT7FFEeDPqT5VBOhz5kp+qBeEt3AnQt972keH
         gprUseHwOyhZySaNHaktqV5VPPw1qyAG3KeudZZeJ4o9e+OexhHU97v4nX4QnmynU2pG
         D8gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkooyQJy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020ac87587000000b003a57a81c0besi6637983qtq.512.2022.11.14.17.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Nov 2022 17:08:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkooyQJy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinP-0007eI-W8; Mon, 14 Nov 2022 18:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouifB-0002B8-Ib
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:50 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouagE-0003lw-Pa
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:43:24 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o7so10517938pjj.1
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MI3hWpAlTSXb1CTab+SpOhfxMGEgiBbmwNtFXQkfI4w=;
 b=CkooyQJyDhPJEOMYiocMxWVcEYb1+eEZ+7o6w6HQ6LolK0bYh7NTcZbMWGMTJR7A5l
 PZEzo3W0vDB+cl4Zvq+vq6pWodGkKMCNkFvJrgTmbTMcSIy5Ga5eQx+TZ12H4K3f03C0
 OsBHxkAop1/CQE+fUQQ7uz+p1KL7s1C14XZpGpAhwt+dJ16DIo6/Cp1a2w8Eqyz0yxC3
 hfv5w/n2XtbAWv40tJ9U6GvAC+Rv1bCESaKd1bjkGvFtzFQWOJdia2Wp/P+g4HFwW92D
 xttiPwlqGK8Bial3vVa5FmZ70EjI2+TsW5FItAmCOF08Ak1dGKBVth8UwVvn5YO8WZjQ
 I2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MI3hWpAlTSXb1CTab+SpOhfxMGEgiBbmwNtFXQkfI4w=;
 b=VI+bz2pZoj1RhhmCsS8SX7/1VjkKoMtbPvkVIrHvn4uXpWddERwRY9uBEc60FGRqkQ
 HlifctV6XCGkjECJSTo6hne9HQN1SE9TfCwhKKprYLjJf7Vj8VJABabYnVoGpNzp8+d5
 N0O4LqJ8zfUvdJsqk8msftR16nUchA7Y9ImhWKt5yb3P7BswDI3bkjw2boQvsaFWtkUj
 emKjiFtd4J8m4pKoo03jzbrfNL7duxUb9Ev3GmqK8hD+GAmmkBeWDhqpLfFP+z1+yf+r
 W7ehdeUeced4BUhMVLI+YG1ns5YTWysr19W0OQ1FMEka34BdPthvyou84pgVe9kEgrOq
 FPvQ==
X-Gm-Message-State: ANoB5pmJvFKHAazyz7S5uq9PtS+bmr4nbL8AC9Lpy/95IPWrdvH8C7sd
 VqJale1xKQzp2VhOsrVVinv3ALMX1QbFP0BPZJsNIQ==
X-Received: by 2002:a17:902:ea91:b0:185:4ec3:c708 with SMTP id
 x17-20020a170902ea9100b001854ec3c708mr14044369plb.60.1668437000916; Mon, 14
 Nov 2022 06:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20221114133257.1752176-1-jens.wiklander@linaro.org>
In-Reply-To: <20221114133257.1752176-1-jens.wiklander@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 14:43:09 +0000
Message-ID: <CAFEAcA-ECwzbojxcjbbAketMa8NkJXg=0xsqPWisKKfiuZGPNg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: fix prio masking on pmr write
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vNULIuoNC9Ug

On Mon, 14 Nov 2022 at 13:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> With commit 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of
> priority bits for the CPU") the number of priority bits was changed from
> the maximum value 8 to typically 5. As a consequence a few of the lowest
> bits in ICC_PMR_EL1 becomes RAZ/WI. However prior to this patch one of
> these bits was still used since the supplied priority value is masked
> before it's eventually right shifted with one bit. So the bit is not
> lost as one might expect when the register is read again.
>
> The Linux kernel depends on lowest valid bit to be reset to zero, see
> commit 33625282adaa ("irqchip/gic-v3: Probe for SCR_EL3 being clear
> before resetting AP0Rn") for details.
>
> So fix this by masking the priority value after it may have been right
> shifted by one bit.
>
> Fixes: 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of priority bits for the CPU")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks for the fix; applied to target-arm.next for 7.2.

> I've only tested this patch on top of v7.1.0 since I couldn't get current
> to run in my test setup.
>
> In case anyone wonders what I'm testing, it's a setup with Hafnium at
> S-EL2, OP-TEE at S-EL1 and the Linux kernel at NS-EL1 (no NS-EL2 for
> simplicity).

Now is a good time to figure out what's not working with current
QEMU, so that if it's a bug in QEMU we can fix it before the
7.2 release. Could you try a bisect of QEMU to see where it broke?
Alternatively, if you have repro instructions and prebuilt image
files I can have a look.

thanks
-- PMM
