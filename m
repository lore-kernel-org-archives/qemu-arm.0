Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp266338njc;
        Fri, 13 Jun 2025 06:46:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhbmNrzJnrmndVKMOP4vkXcKHBkRSKwAdABNatgK8Y+IRlkY+PetcZmA5+1JHQXWE/9h1LKcq5jY2IyA==@linaro.org
X-Google-Smtp-Source: AGHT+IFd+5vuHKcTZSalw2+aN5LUlmY2UDHJnHDaO4LIqE+1JQQInWgf5zC6sKOsRXzeyvACJIRJ
X-Received: by 2002:a05:620a:1d01:b0:7d0:970e:8dde with SMTP id af79cd13be357-7d3bc49f49fmr567085585a.31.1749822408966;
        Fri, 13 Jun 2025 06:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749822408; cv=none;
        d=google.com; s=arc-20240605;
        b=d8ynCXKhrlN2ieMxPXyF5o00zjnsf4STXCppFPYTagRV9mdKEk1IZi6fTFmU37kqAK
         +sD+/kIl3g/sKmixHsfWutcKHLl6HeUbQlbX5qqYzwFcBaGGrtlFYjmTG5D+Y9WECG1A
         WSjgyMzUzoqziFyqi7QEAKGCIKfBZ7WZhNh3uqukGcNCMHDemM2xs1rzol30S9mMz7/E
         WPtOn1Wwd990K1FfZzCa+hL5OxZNQBGiCSIsYjRytFup8Nv2FiB+JjOHlNWqY4yK8VgB
         eaQ3lL+o7GRwlH2tRdtc22FLDa48SgbOuLswCw1u1Kq5H/x1DL4Tlnmjz28CwI2p/DXF
         Au0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mc8wSP+/FV9P/n2j5WAoDMSG4PUhKFwccG4V6/uG2pc=;
        fh=tSLvRDvTj1Zf44Mqqwb+0+KiaAYYid+Sre9WKMP+kCI=;
        b=d58QW58K6AwTt9RPrWf3Ju3Q+1UDDLaXmtcWZTkIe+D3GhYr9iGlnycs97wgsR4i7E
         d3S9oIVtgKWqdy8xYUQB3twSYi57pg0WWW3JIoGjfg+Edz2zYj4f6ax4gTIcZHSCV57n
         oVqAEnBGAD7AZvmJPkQA5g0P/84f7nkryVu83e8CMuCdMclDBUpgXLGlEiyxnZaC1gd0
         iGPsPWTybjSKGQ3LFejWkp5W2B+HX4qxKKpXb8GRe47QqlRo8uQoaQ4sD7Mx5nyY5b46
         xqEgCF9DSumJOo/5yjn1wg6Gc7v8zB7yiv20MLaGYQmjNYKn782QZbIdE9o/toF1spMs
         DPUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=XRazCXMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f0b471si299401285a.443.2025.06.13.06.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 06:46:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=XRazCXMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ4jy-0006Fz-Oa; Fri, 13 Jun 2025 09:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uQ4je-0006Cv-Cm
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 09:46:24 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uQ4ja-0006sq-Az
 for qemu-arm@nongnu.org; Fri, 13 Jun 2025 09:46:19 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-60497d07279so4453471a12.3
 for <qemu-arm@nongnu.org>; Fri, 13 Jun 2025 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1749822374; x=1750427174; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mc8wSP+/FV9P/n2j5WAoDMSG4PUhKFwccG4V6/uG2pc=;
 b=XRazCXMGT9bXzub8T4s+drZibUxvqW+n6GCrnWuw273C0+nkoKRKAhiAa1cgFQnSaL
 0SMdz4Cu3EmqN/UFtESNj69vR+u3WvwqBbqlckqf/S9xgSplcIvtAWLR9CmRCSdtdYN2
 nNpveOa4A6ivJMbYfHzSpZLiRjMPB5LSmR1wq23uCp2sxRc51ww+YMqhgrjreU6vmYSR
 85Zkv1hanR5uFF5/CkhrxXdWm5OKKeXB+cIfdWv+Fj+ROY9qwoqm7eu2RY8aVmvHnSzw
 pvPJDWUhWfzkMEyIwKvyNFGow40G9+VZYpCG8Bj/59Q78xhF0CZjJVbfLRVPRAk0e/8P
 MWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749822374; x=1750427174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mc8wSP+/FV9P/n2j5WAoDMSG4PUhKFwccG4V6/uG2pc=;
 b=w2YsvyYEdJDPTWC8HcUyB4JokcQILhaL4RQxwzRsEfsFALo16J37zgv2Ux00TQx8TZ
 lnwvAn5OGmHH0qVwhNQZhPvycNPg0EPldr10960PSVnT8fvjeYNxTuA5pdhJ8tK/WQOp
 kqn8cbfjZ2jT4aW71+R25p0AbYbtXR0B53fbMvh8gYhYt8nKl1tdE26o+lNzY7tECN3y
 B2T5WE79L+o3iT0BH8RfWuu3/EBfNB5Y1uA+F0jmf9SZ6LI9ABXkuItonsIzxlU3Mmnf
 SoC4TAn7wqv+O69R8gDMZtDapudRDTuVCMMUxneoqZtaX9zfgy2qnDwqFR7KzuwQRlue
 JIWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVws5Hsg2envEEro+8oWHrmHclZeuTzBh7ysuv9hpoH85ekSL4M/19QekUYcYIu3xYyWtnTTkXsgw==@nongnu.org
X-Gm-Message-State: AOJu0YwgYOiWj2G7BCnbZtRXKFXombMMgY2tttz/APFefolzBRDpYtr+
 EGfNVAZIRWKlKi6igUYBK3uOzElCsLmaMcekibN/1qe4uzpdHvXFiYKUVbRguLg472uvQQeXKZS
 AXAHxTpOIiDeIBhKu/ejGh+zChIIAzGTa+JX30RTp
X-Gm-Gg: ASbGnctp6AQZI9isVD+iZCKKTqC4VW5XiF28aABfBw+33yIxaANte61RTG/5GyLDWPP
 RtqJgE96h4R2z58qvOyf0s/DJygO2Qh47PbOQQQqM3JLiKZaYh0nN3nKFjedZ/oewWMY4m7UlSS
 7vT7WXGuqQQRqA4WbvsTCGJOncmBA82x1pspznCv91Vmg6Q048AeY8342NNeyTjpgQJPo9pro09
 z5BNg==
X-Received: by 2002:a05:6402:2115:b0:607:ec09:d462 with SMTP id
 4fb4d7f45d1cf-608b48c758amr2887829a12.7.1749822374469; Fri, 13 Jun 2025
 06:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250526085523.809003-1-chigot@adacore.com>
 <CAFEAcA-2fnu9hsGirQ5FJGqtNktNX2X52UgQBu4yYN4WjeSVQg@mail.gmail.com>
In-Reply-To: <CAFEAcA-2fnu9hsGirQ5FJGqtNktNX2X52UgQBu4yYN4WjeSVQg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Fri, 13 Jun 2025 15:46:03 +0200
X-Gm-Features: AX0GCFuTHFrLMQWmQj1Hpk1c4MVGv7bN_bui-dYiv0vfvKVT1lWpTZv93IVj-2s
Message-ID: <CAJ307EiPsrCDP2_5urEROOZj-3TRc4rOAQA-wOHEGUuhO3T=7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] xlnx-zynqmp: add support to boot on RPUs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=chigot@adacore.com; helo=mail-ed1-x52a.google.com
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
X-TUID: tT0G8M1HQmzc

On Fri, Jun 13, 2025 at 1:58=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 26 May 2025 at 09:55, Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
> >
> > This series enhances Xilinx ZynqMP support to allow booting on RPUs and
> > ease gdb connections to them.
> >
> > It was validated with home-made binaries. FreeRTOS was tested but witho=
ut
> > success: outputs/IRQ seems broken. AFAICT, FreeRTOS is expecting Xilinx=
's
> > QEMU thus I didn't investigate further, but I'd still like advice
> > on the 3rd patch ("wire a second GIC") since it could be related to it.
> >
> > Changes since v1:
> >  - add doc for "first-cpu-index" new property in arm_gic.h.
> >
> > Cl=C3=A9ment Chigot (2):
> >   hw/arm: make cpu targeted by arm_load_kernel the primary CPU.
> >   hw/arm/xlnx-zynqmp: adapt cluster-id based on the boot cpu
> >
> > Frederic Konrad (2):
> >   hw/intc/arm_gic: introduce a first-cpu-index property
> >   hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5
>
> Hi; I've taken the first 2 patches in this series into
> target-arm.next. I left some review comments on patch 3.

Thanks a lot. I've just sent a v3 addressing them.

> For patch 4, I still feel this is something that should
> be dealt with at the gdb end (e.g. gdb should support
> "connect to this target and connect to remote-inferior 2,
> not inferior 1, and don't fall over just because you
> don't know the architecture of inferior 1").

Yeah, I'm totally fine with that, I've removed it from v3.

PS: I'll be off for a few weeks but should be able to make a v4 if
needed before 10.1 soft freeze.

Thanks, Cl=C3=A9ment
