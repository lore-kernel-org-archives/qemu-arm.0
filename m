Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2336981ejs;
        Mon, 3 Jun 2024 08:46:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPckaZ8G6u/EphpAuOQqH5QHcSi4VHU+p3yd+l5Fll5Rdxq+dy8RWu/LcqZEU0mClF8uh3rN+x5b4HyoZLbWUGaS1mIhrH
X-Google-Smtp-Source: AGHT+IF/WhOSnZlZFPLYOck5QUD+NNhoHHYKqui6PRCqqqHu5njbGOTrqiuST0SvSU6nn/2VAPOG
X-Received: by 2002:a05:6870:d248:b0:250:ff1e:7498 with SMTP id 586e51a60fabf-250ff1f166dmr160508fac.51.1717429579875;
        Mon, 03 Jun 2024 08:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717429579; cv=none;
        d=google.com; s=arc-20160816;
        b=ThLOk2rP69bkh9Nvh8HimvpHcCMrcUoAsWOT0JJhO6+GBmx2RsbLVfeoMe+ShY1eh9
         ZPqrokJxD/fKb+yFQBtLw5eHca5jpIGZ0+DgBoQ7ILTnP91GzO0IPZI2veufPVgJVxHq
         /10Su+d86R8xGyXHoEv4bEPiBTbkKYSdk4YU9KDgyV7OXD3NGw8CYA9PKQLe9f6NcX8K
         MDHcfXRz70hNhA5+Ez4LwJw2L4quJkdPu8Q8H67jv8IJYU1ti07GcAiV4IrxHaDhrqV1
         QMRt9AWcb+mWwOLQgMWFWBGlrLH1R4Ag8ELbvLDrm18odDP39hTV5aPKmyzu9TJ0UuoG
         DrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7Q4z+fdqmLk6WGblwhy0RyA2rPi84ZSa+o8Rfuc0Zhk=;
        fh=sHSNURk47vs5rapqs1fE2QggVLpChJZwLxKxNqSk2Go=;
        b=VRKL5iHgwpiCuaX6EBzzB+9ZQYtaQXWlgHnHGoGzWwifttwvhzpBn4aTTq9Af89LOw
         GSMhb2dj78XHqc8VX2h5/rt+MlwQAhIgSwg/sw/ilwwgyx65h48/lFAxXPox5wfp5TPo
         pVd3CRGGEGjxNZgobvGLp0SDj0VUCL9MBr/cYqBJAEPBQVbtCO6ItII5ynjZZfTjjIbk
         eElZrlXPEOxscl5fcBEjjeQX+Tapyn6b4RcZgMl57H7jMSc537DFC7ONFvW15P67GfrA
         e+KnmJZLRteqp60roZqvslSEhbp1zJlUn4oRH0oYUcrC8WLVOxx5JnnkzlEfkpButNM0
         o/2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0LnDzVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-80aded6d3a2si1333450241.90.2024.06.03.08.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 08:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0LnDzVe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sE9t0-0003BU-Kv; Mon, 03 Jun 2024 11:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sE9st-00036g-3x
 for qemu-arm@nongnu.org; Mon, 03 Jun 2024 11:46:11 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sE9sr-0003HC-0R
 for qemu-arm@nongnu.org; Mon, 03 Jun 2024 11:46:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63947so3831194a12.1
 for <qemu-arm@nongnu.org>; Mon, 03 Jun 2024 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717429563; x=1718034363; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Q4z+fdqmLk6WGblwhy0RyA2rPi84ZSa+o8Rfuc0Zhk=;
 b=U0LnDzVeD768r1AbGrqI4G1LNmINKlchsE2sMYijnW6lYZaZre3P3W58jEKFfs8FnD
 ow5UkcX9tizeGRk8aCKMcakzNQtwuY3o/vFoL7zmG8f0xV5BlYiyP/YNW73KR41Kx2TZ
 hLQk488q9hpojeUsjFgx8VuCms8hi/HpPuH+83EzkuQq7qwuiHIzXQZyP9c1ET4kGKzY
 JzZvAkoNga+2wVVPTShYJvJ0EyAuOtCmngytP8Y1dB5RSsm6IAi/XBy+/dLLNSpdAVOc
 ExBHfFE0PsPEWxUK1Tyx6398LUL4kyrY80ZYidLsYexu+pbNqB9WB3W6ETDmRI3Ad4pi
 RQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717429563; x=1718034363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Q4z+fdqmLk6WGblwhy0RyA2rPi84ZSa+o8Rfuc0Zhk=;
 b=jqg/116OKnL+y26MrAs+EzAuSidBQew8MLszutBSIkaLyeD+mqcrEtVP1LQLB6p9zx
 AJoXYRW5vYt3NrrHm2o4ohOo5XYNDB4E9UCHdYxx0WmmuImLRiHpTR5FkBA3cwLXUcuD
 t7DwziO/Sp7e3SFWbBmVOWm5Xnfjt0NjtJSDSj4Fl+wA73BRxR7poLAxlYlM9MvTAkbY
 aAfMXMURfAOc9wBbPvXwBmE1AEkHmnJZTARCDDF5jwvP9KFiK9DcNwJInzrOgkS+n40e
 hSy59Pc0lXJaG7UqY8IKCGB4D3FJXy9hnKbmNs9ZyJNfTUz6x7t536O31v/AzkbZ0WDg
 PKtQ==
X-Gm-Message-State: AOJu0YwPNemAS5yG/JOc2pf10rzcofK/0emZahh6wo7ItbFmZlmdFAnZ
 y5NSPf+GrfPqKUT4iLCyl5f9Tnx414iEghmRrlXm7wW549jbiiMsMfs40gUQW3hIvVGC1l3WAKQ
 98Py19/1fRTVPkmKw7EGbiHHqehqGAoj3UiKvD+/9AniY+uZC
X-Received: by 2002:a50:9518:0:b0:57a:1924:a9a1 with SMTP id
 4fb4d7f45d1cf-57a363b3f96mr6205544a12.1.1717429563145; Mon, 03 Jun 2024
 08:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAG3SUFynWvXY2bAbV0zeAypGL-=d4p6YV6KYpi3ho6TYnxQp0w@mail.gmail.com>
In-Reply-To: <CAG3SUFynWvXY2bAbV0zeAypGL-=d4p6YV6KYpi3ho6TYnxQp0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Jun 2024 16:45:51 +0100
Message-ID: <CAFEAcA8zBEiV1XLvM3HPDA2kxV1rrmBqhgc1_9_W5+phUCkGLg@mail.gmail.com>
Subject: Re: Running qemu-aarch64 emulator inside Termux
To: Eboubaker <gpscrambor.4862500@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: T/1gWRYMzhf8

On Mon, 3 Jun 2024 at 16:41, Eboubaker <gpscrambor.4862500@gmail.com> wrote:
> Then I noticed I can get better performance by using aarch64 instead of x86_64 since my phone is using arm64 CPU This is what i tried:
> ```shell
>
> pkg install qemu-system-arm
> qemu-img create -f raw alpine-arch64.img 2G
> wget https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/aarch64/alpine-virt-3.20.0-aarch64.iso
> qemu-system-arm \

qemu-system-arm is for 32-bit CPUs...

> -machine virt \
> -m 1024 \
> -smp cpus=2 \
> -drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-aarch64-code.fd \

...but this is a 64-bit BIOS image. It will never boot on this
QEMU command line.

You need to use qemu-system-aarch64 and specify a -cpu option
that is a 64-bit CPU.

If you want to actually get the speed improvement from the
fact you're running a 64-bit guest on a 64-bit host then you
will also need to tell QEMU to use the KVM accelerator,
with eg '-enable-kvm'. Your phone's kernel will also
need to support KVM, of course. I don't know how likely that
is but I would not be too optimistic.

For pure emulation, there is no particular advantage to having
the host and target CPU architetures the same.

thanks
-- PMM
