Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2221039ejf;
        Mon, 26 Feb 2024 10:09:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvSDoMVMQW800KfKg0rHnkYnxIIUDpvf+iN2TB2gCU/UlYTvyeLmls9TIlCEx+3KS/OKijp01ycSoyT5bjR8S4K9RTol1L
X-Google-Smtp-Source: AGHT+IEeI4fKMdHyLtk+4tuSvzi04I3M6/5tJ9lEX8Bq62SfFsuzdss2RcSGhELJJD4wVojbvmeP
X-Received: by 2002:a05:622a:506:b0:42e:76fa:2810 with SMTP id l6-20020a05622a050600b0042e76fa2810mr7817019qtx.60.1708970978095;
        Mon, 26 Feb 2024 10:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708970978; cv=none;
        d=google.com; s=arc-20160816;
        b=gi0M/cJX7zEEQdC8gUDN6QNmi1viWkfDVk/U8qbSRzWeDPnbW1MUCICJiENGFwBgsy
         U2p2Io8uFW5z6M8gS1/5uc60wRipvmpmSLJ98Oov4zguyB/+HQF6pNavpQapSv8Fh8V9
         0lYrVwTT04+JB0MDw6U3011JdH+ZTiU3Y+MMtK44qg4J0BxcL5NaYHlyoNNTe1RNGMY5
         ty74YCpsNjFF5yzhMKjGRg857K9XZSynAX2AgAeceFDK7q5jzEbfd7KFMB2ssqIF8qjC
         vAj4F9hArCTz33fsgYs2+pIq01jXWIp0NBsNTKtjeDo50v2DHhjkHxuKLCo8W0eWpBEh
         9aPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kNlpHvNe0Knj79P6hKrLjJzShYzrgiIlFsdVWAIh1Xk=;
        fh=WxHSAr0douJCho47EDhfM/XjfxwBwDauKoNbFX9eT8I=;
        b=QDvAkx2nyBrpZjJc5eUsS5Y8++EQ5ZssSMUGvj7mkAtPyTLHM9pkoowHGDDvJp3v30
         0jUhWnt5hcajB+3mJaFrF3l8P4bCzeCpWO7V+9KBSRhu03rXw2CqrMxb7NBUkxUavbUW
         9XFglChhjyCyzAAf44t30rr1XQsG4W1lQL+9LnHc3GPCcMk6StjSuyqr7X5yRSO+tymP
         VL5LFm7Z7eclwXg+/rePUDuTotxn1zfhbC1KKrd8ewYqGAPWF+junJNJh+0+GeeVBdrx
         K2J6rRUBzp8MsCBHdD0/fx2mTSUVXXbdxyD57A76aAc07di9wJjD7GOGxMXE3CN27K71
         cofw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0uNuejB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21-20020a05622a149500b0042e825795c6si3287822qtx.640.2024.02.26.10.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 10:09:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0uNuejB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1refPp-0001FL-EK; Mon, 26 Feb 2024 13:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1refPo-0001DR-4d
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:09:24 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1refPm-0004Ag-Eq
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:09:23 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so4020139a12.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708970961; x=1709575761; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kNlpHvNe0Knj79P6hKrLjJzShYzrgiIlFsdVWAIh1Xk=;
 b=Z0uNuejBLD/p0urJ+Bd+nUj92x2S6hF+aRrgSjkSaTYlKKA2ehn+rCDZJ8607Ziodk
 Rc+2Oc8fLrLOKq9VxkKFq6InmskB8Tx8RFM8cq2l0GBOm6xHIBpW3QHvNp1kIeFwbJLC
 QMhG4SP7FmdN3+8KmRQF/pZWEwYJTR03UjTWP/pJNBMD2dAYtk27s/1FBSaBbqnWUyUr
 oG+rwLXbwbPzNr0p4XZUCKhfFdCu4qsw4FjOs6pRXK3HPBGmUpL80xN0T2NR22RWOEqZ
 DLHMKgKmRf4A3EPlP5JO1rFXWrqBiRFivLEMkSGm8GQl2+KfYr1GguZ7sZem5kYzQtgZ
 EjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708970961; x=1709575761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kNlpHvNe0Knj79P6hKrLjJzShYzrgiIlFsdVWAIh1Xk=;
 b=wuS1KRjsYs31Fv1umyToqvIwpVNeXY2e1hoWaGoe9giK002sEMq1w05Mtx63RGrUKa
 Ug/KVFmfGuWjAK8XS2zjVy6/UI9O8jX6WKUTjzfoAJltLSK0wA/ABubitO6nKUEQfb4p
 z+LHF/XZvygWScX8Oy3ts73ooMEsAjqdqLh65SjupTkXShbCpWXHMlzersYsJ1GY7/2R
 ++mbrh4flHhBkv8X1W24/2Rcmo4sxLJaemPjpeqtAjRuufOCaOGZvbXPlbAqimDn+oaK
 qkgKYqVSWP4vzlAZvVWHQ/U6mys1GKjzlzuQrAnezNxZ2JOsHIy7/sJs0SSz7QOmQAEc
 Yxrg==
X-Gm-Message-State: AOJu0Yzbqh1xlDP0Xc5me4f+LeT3nBcBRYP3CmnwdqnC14M40YeZ+sxI
 vJSvLl5PN6lBzDP0n8Jj6AVKMenPWp6dFrXgzAN52M+LOGDGhhuMMqszMFGSWJblp7Cu84SAtCX
 GAOHXbyWyK13I7p2ffjOJhFEPcmcoSg0XNYH9tg==
X-Received: by 2002:a05:6402:3411:b0:564:bcb1:45f6 with SMTP id
 k17-20020a056402341100b00564bcb145f6mr5348223edc.15.1708970960788; Mon, 26
 Feb 2024 10:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 18:09:09 +0000
Message-ID: <CAFEAcA_brkckzDZh_-UJ-KFfBGvjPozPHNmG-bWFO0Xa63R0Gg@mail.gmail.com>
Subject: Re: [PATCH v6 00/41] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6xQmQDKg5E5L

On Mon, 26 Feb 2024 at 00:04, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Introducing Raspberry Pi 4B model.
> It contains new BCM2838 SoC, PCIE subsystem,
> RNG200, Thermal sensor and Genet network controller.
>
> It can work with recent linux kernels 6.x.x.
> Two avocado tests was added to check that.
>
> Unit tests has been made as read/write operations
> via mailbox properties.
>
> Genet integration test is under development.
>
> Every single commit
> 1) builds without errors
> 2) passes regression tests
> 3) passes style check*
> *the only exception is bcm2838-mbox-property-test.c file
> containing heavy macros usage which cause a lot of
> false-positives of checkpatch.pl.
>
> I did my best to keep the commits less than 200 changes,
> but had to make some of them a bit more in order to
> keep their integrity.
>
>
> Sergey Kambalin (41):
>   Split out common part of BCM283X classes
>   Split out common part of peripherals
>   Split out raspi machine common part
>   Introduce BCM2838 SoC
>   Add GIC-400 to BCM2838 SoC
>   Add BCM2838 GPIO stub
>   Implement BCM2838 GPIO functionality

I've just noticed that the commit messages in this series
are missing the conventional prefix that indicates what part
of the codebase they apply to (hw/arm, hw/gpio, etc). I
propose to add those in on my end for the patches I'm taking
into target-arm.next.

I think the one question I have left is the name of the
board: currently it's "raspi4b-2g", but should we name
it just "raspi4b"? None of the names we use for the other
raspi boards we model have a suffix like the "-2g" here.
Philippe, do you have an opinion here ?

-- PMM
