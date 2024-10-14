Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1828251njb;
        Mon, 14 Oct 2024 05:48:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhTOz3NF0ppj9/u+nC9Zk//WDbZC4Pvn1xR6ACQZWIniTZo0hwNuwHi7hezA9ZP3KzJfBs2OCdMBPrdA==@linaro.org
X-Google-Smtp-Source: AGHT+IGotsr5Bn5ZaG+830lDkaRg6I05249dqrCpmom0wBiK38IjlAamGKfygZ7mzrWIZjPPna9t
X-Received: by 2002:a05:6214:5b0d:b0:6cb:e52c:c8dd with SMTP id 6a1803df08f44-6cbf9e9f4ecmr131729806d6.53.1728910111546;
        Mon, 14 Oct 2024 05:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728910111; cv=none;
        d=google.com; s=arc-20240605;
        b=dWvIGhuB+XXzKVf0GdCvllMejBnc1lTXtOFMCFencV/D0x4laA5ofCniVszDmIj0M5
         R2pruNSHXjagrV9DtcJQS0nkY/Xkk668RV/rx1R0HmV4XKc6SPwShdbGcbTO7y/zA3vC
         kAjX0ZV4RkSkMH4XW1IDpmcfaA2qkM9APHPXe4gYFALEAGRrtcZJSAZj1SLfDjPARGgX
         w119P1tz5mAKZE+fEGq1eTnnK5GucabPMJBO5JbDA1XmwBtYFSuHX9pn/b61OIG7qBsu
         wGARlIeH30lR2wgxQqPkEoQPIzPLTy+ZIHPoAPSMFShCpIDelDhoCH9LhSVmfA1T1gZ8
         ID1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kM79TXHsfWWOp3PAaFsigm/WkHWpSm/qj9ntAPFzurg=;
        fh=2qP90IoVOn0f1Kh9SYvKAiBtA90Pqo8zJfcGedOcAxo=;
        b=ka6IVAgm4ffEv55CEB0F+qHr5YRBUODD6FZm8gE5GgMJRqO7S0UnBLemHVvdrCZy+v
         WfVwPf2wlzOFjktCVApabpxEPSJYIg8B3CaSa9rlO/s0B/zBhQeawpCH+icSjdwXSCgp
         rTtUiE6AFn3mslHTxgcNToR/Oh+HtBK265GYS0OuTYBp1im05Eg0liXfE35idu7CLx8t
         OQiypQlsToSskI75QS3tWhBFtnGM3DLK4115Al1tpL1Tb6CdQY/bCKoQlXeho/yQoPXE
         ICbHyDu13+m9wDBZcTVAPj9xSQm2fQdUjsolRLU44h3T+5OTv0lpUDEIcAGJrNfgPOO7
         y5kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v775J4tS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85bc4c0si104498176d6.42.2024.10.14.05.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 05:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v775J4tS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0KUe-0002sc-3W; Mon, 14 Oct 2024 08:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0KUa-0002s8-7I
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 08:48:08 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0KUY-0004rC-IR
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 08:48:07 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fb498a92f6so12152981fa.1
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728910084; x=1729514884; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kM79TXHsfWWOp3PAaFsigm/WkHWpSm/qj9ntAPFzurg=;
 b=v775J4tSb4kZ8xSxq//YE/A+ATsbgWGmb4S5UAdb4aniZ51N1BnO5qIyHDWZUzDnJ2
 GnFwNdyGcN8jZ46sZk7l3ch7PVS6DX89QRsSYuvTBpAeWkLVIGYoVWATIWWuXaTmdMez
 L7+hjpCKjqvm5Y8ChGIyKY+B9QEPuVR6MJFkrxX+UUvMzhzSPpp3FOff4d6tvoo0aVqw
 haxmqyGZfoB3JVyT+jhpwvzsHp+6s3qcAtIgyHqnyMlyK9mTDprL3z1ePCUsQIfka6+c
 Wcyx3FnjG/Gk8X6236+Q0XneTc1jY5DGRe+vhaz8qfNAEFKELPEWAtW3jtOzzvaIknWV
 q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728910084; x=1729514884;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kM79TXHsfWWOp3PAaFsigm/WkHWpSm/qj9ntAPFzurg=;
 b=InmEzbqquowUNB44Ikd/b0QZ/oiP7+RTXbr6+Vs1zd4xC5bX35ZPCjJVEDp477AxWc
 x6p4rnUbnrmjrnAdjxWeWFZqQBNrl089RJgd/vfopVS2fV6H90vfZHsiXaUFnnj7oQSl
 7IAuEU9UDrv1q4cbROyqzZMvEcdt2iJQqVtDrKkVS9Xmve0nlMyHrkmygSCrlOvVQv/g
 WhvIouVRx3DRjPyGDQbQNpdrVOyYXaO9RdRgbfSZHySDY9KuUdNIHh4icQxzmEIeotSN
 Q3t7bJD+Yj4k3KbGyp5WKiu/d/kfJzt+Z4yLzWYkGSn78Yn86pIfrAfL48jm9ldndPmi
 vBgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYdOoXgcem83L1GZKK9fFxNar2Cnf3oU9xsAfqoYiy+s4a1tntERbGJ98aFOINKMB7t3XH56b8Xg==@nongnu.org
X-Gm-Message-State: AOJu0YyRwB3cx/mA3T1X4XakVcsf3f13y8sBbDbZ3wnyhHk5rKYbYChi
 Qsaky0KFHdPGv6VPLr49JZ0y89LZ0/ivXCmtWAK4001nrdESyeml31RPBVxiWuZJPU3ZYtCrLOG
 Jj5jrwTyj4MkDqStaGOK7JDxrhbSrx2PwT+s3Bw==
X-Received: by 2002:a2e:4e11:0:b0:2fb:5060:7037 with SMTP id
 38308e7fff4ca-2fb506070e0mr12484231fa.41.1728910083959; Mon, 14 Oct 2024
 05:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241005205748.29203-1-shentey@gmail.com>
 <20241005205748.29203-2-shentey@gmail.com>
In-Reply-To: <20241005205748.29203-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2024 13:47:52 +0100
Message-ID: <CAFEAcA_2EU8Q+=Zm7pKJpO42=nAeGf9jpCsoM8ped1ngw66gKw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/net/lan9118: Extract lan9118_phy
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6035cDEqhcD3

On Sat, 5 Oct 2024 at 21:57, Bernhard Beschow <shentey@gmail.com> wrote:
>
> A very similar implementation of the same device exists in imx_fec. Prepare for
> a common implementation by extracting the code into its own files.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/net/lan9118_phy.h |  31 ++++++++
>  hw/net/lan9118.c             | 133 ++++++-----------------------------
>  hw/net/lan9118_phy.c         | 117 ++++++++++++++++++++++++++++++
>  hw/net/Kconfig               |   4 ++
>  hw/net/meson.build           |   1 +
>  5 files changed, 174 insertions(+), 112 deletions(-)
>  create mode 100644 include/hw/net/lan9118_phy.h
>  create mode 100644 hw/net/lan9118_phy.c
>
> diff --git a/include/hw/net/lan9118_phy.h b/include/hw/net/lan9118_phy.h
> new file mode 100644
> index 0000000000..50e3559b12
> --- /dev/null
> +++ b/include/hw/net/lan9118_phy.h
> @@ -0,0 +1,31 @@
> +/*
> + * SMSC LAN9118 PHY emulation
> + *
> + * Copyright (c) 2009 CodeSourcery, LLC.
> + * Written by Paul Brook
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_NET_LAN9118_PHY_H
> +#define HW_NET_LAN9118_PHY_H
> +
> +#include "hw/irq.h"
> +
> +typedef struct Lan9118PhyState {
> +    uint32_t status;
> +    uint32_t control;
> +    uint32_t advertise;
> +    uint32_t ints;
> +    uint32_t int_mask;
> +    IRQState irq;
> +    bool link_down;
> +} Lan9118PhyState;

This takes state that was in a QOM object, and moves it
into something that's kind of a device but not a QOM
object. I think we should avoid that, because at some
point somebody's going to have to QOMify this.

Making this a QOM device is a bit awkward for migration
compatibility, unfortunately.

thanks
-- PMM
