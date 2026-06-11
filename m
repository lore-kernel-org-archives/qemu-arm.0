Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FCACD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 15:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXgxQ-0004KV-N2; Thu, 11 Jun 2026 11:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXgxP-0004Jt-N6
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:04:35 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXgxO-0000yi-5M
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:04:35 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-660323f7b27so8399349d50.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 08:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781190272; cv=none;
 d=google.com; s=arc-20240605;
 b=XF4CRduv3x9KfnEa2L5IBwTUt2jaK2AkxAF/WLm2wZMKRhJna7dY+08pOkcSlOnS+R
 QjL8PScYsA/tI18h33H+rmAIJzDX89VkHBA/7JqYuEHOnJBNUjiLe2qoxKW3NAST0mDU
 MtRyO+7BSCwZvDDVnI4PAz/C77xO/pJ5QZgdMYwR0WKuOwbzQJe0J4r83CkPZdZgdK16
 402MGGEeYZ1nP8lgTG5vyWLb32JrEkrQcaw7Fi8nFmMkQOMrriXqJMbdkKnGrsV7BW7G
 7uGyl8cQmNDAyITEGsCK5SoKUJzpKjZ7rwuXONtl1e/o3okRlOpzj3f80kx9z6wFXkq3
 weTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=z7Vd1mUizL2q0h+HL/W06vBBTRJy+YRC4k9Z4pycaXg=;
 fh=Rcsqfq8wCgGpxYweThHr/124DXkqyHwdqxnAWVcTeNA=;
 b=XrfIr/OOru+q8Qr9zf514dm63D9aYTifhK5MD/Wz6siTQSBwLgL8eBkQ5zqY4sDaX9
 OumRl+D9XVekVnutXn0EvPOJoIeYH2Oac8Bi8gttNuiRMz0xKiGM5rEqiZ0Dnoqav0dU
 XOSyZzi6A32PwBALSNJ8bJcyFdij3FhsF5hIl5sXJsjMsUXY6HO0KLQAlaXJfyiPt1dH
 iqA+2eCDmUsgXPyjxQwWYGqrAAOW5hiM2moWODwVRNTesuPUNh9bUYT+2P2nc1sH8Cp6
 5i3fTVm5IZytFBCDWBdhF4BMZtMBAeT1AlR10qY+QWqYJ8jiFq0dlrLbbHMrmjr635HZ
 E7MQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781190272; x=1781795072; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z7Vd1mUizL2q0h+HL/W06vBBTRJy+YRC4k9Z4pycaXg=;
 b=VueSNWDQEUgKlV8K2GiUCmbSRq1QPsCdtW42ESTWUqyaT3SrrhvbG8tzij+oROCHf7
 BXcxSXlECFgmnmKClF37WUYY2AHWRsA+7F56BP5acigxCXEF2cTGwfoblPTjgSDLXOVh
 ACsstRtRkbIizqjwJy/bOeQAzDRsfZvaByaZy7nx0DhO9jDe1feCb9cw2vzLQUQhiaH5
 RVqMG/BDcMAb5ZR5H4ps/bNbJ6eyyGUsXOZU4PTaudWEbp/wkPYdp4YYYwgfr5VwDdIu
 irKHzbHE+eOae5jwtlJTjzUWkyNStWKA7Ar1J8GXEws6pnvxCzV/7CC3XXMFiHRIkYF2
 SYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781190272; x=1781795072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7Vd1mUizL2q0h+HL/W06vBBTRJy+YRC4k9Z4pycaXg=;
 b=AxsuUnb0JvumiPvFJCaQ/WxnWeWyXoVxpSFCXeKBkh+bsVJN6WtjlUufEC0pD7BtPb
 gc3L2CCkLqqLov37nJuBC6EnAcaIG/YJNVLbfSanbyuMFTiT69lyQWTgAAxEcnNMDW0D
 vjFIslTwQliLZf0z7/oBowIiGWMoab3LcJTuSsRKKguVQjOCMAiHyohgwUqVRm93Zw5F
 f7COIDKsuEBXeOSRNWqKwzVcO25dGXAiaHwXV8USzHzQ+xsD1F9IK74JKvuD7tO/Zbxk
 VdHLP9/CayL0x4yK4Y99O/O3tThKbGwFvKs5E+1SE6qkNdnqoZWStsAvym3gkQOhGgS0
 WL9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ94HRpZxID47K94mDr1VTAI8QbDlWR6hYf1J2yyTz1oD31oFfDr996tArg8w2z+rB6UiDd9JeiCeg==@nongnu.org
X-Gm-Message-State: AOJu0YxdB8Q7FRBk6zZ8fZzqOik24Hvhu90yAxbh85T+RvF4/H3sfU1e
 wqW1I6QsXwlSQvkBvOXENHvgihXGItfS06YWkKMjsLRWQSCWFRVLeprG0jW12jNbLIGQEbdDEUC
 2/c7r0fRPBA59B2GBO6tkOHfhr+k4OWV8ahqGpArWQQ==
X-Gm-Gg: Acq92OFs/Ec9cXvA8STyzWDhY3iv3ZwyadkVSkRpm2WPrMaJ/At7KgSBI86FLtrkMmS
 wqH5p3L5PPWZKVpmFj6yJY5PPB+AoXAsY8dv1Lx7hf5WtqpRFd8ezQVqVlFig3OKAKLCOJHESoG
 6ElwtcpAI/h/7MNbdOJcbitIdYUO5QmZbaVxge/s+6OPPJpmEjP5CVIBsMw3ve/evsmFLA0dlZ4
 drecn5YpaXW2lfif0aue5G7YCFQCr+Q12phoA1iUSNjhUoufUl0qQcyJ7i8FIuynLH77fLKBQMz
 w/ea4vqx6cRo5ZORfVkcW9l9YtCa2hf0nB17QvMrbdsisJQ2MbmgQZRnhCkZuLbSb1Yuxn26YHh
 MHA==
X-Received: by 2002:a05:690e:d86:b0:661:37ed:647b with SMTP id
 956f58d0204a3-6626961fefcmr2609278d50.14.1781190272360; Thu, 11 Jun 2026
 08:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260608001821.850921-1-gshan@redhat.com>
 <20260610041036-mutt-send-email-mst@kernel.org>
 <20260610183046.GB121666@fedora>
 <20260610165710-mutt-send-email-mst@kernel.org>
 <20260611142022.GA202155@fedora>
 <20260611103513-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260611103513-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2026 16:04:20 +0100
X-Gm-Features: AVVi8Cf1q6PHGCBY3IjSA6p-timpIk4iVHgEYZh43i0FueWDdcJcGPGQYG1aUpk
Message-ID: <CAFEAcA8RAsmrAArKz0X7NU6sCnKTC-e413TgwLp1gt2vJGLgPw@mail.gmail.com>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jugraham@redhat.com, shan.gavin@gmail.com, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 11 Jun 2026 at 15:46, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jun 11, 2026 at 10:20:22AM -0400, Stefan Hajnoczi wrote:
> > Gavin posted the lspci output:
> >
> >   Region 0: Memory at 661ffd000000 (64-bit, prefetchable) [size=16M]
> >   Region 2: Memory at 662000000000 (64-bit, prefetchable) [size=128G]
> >   Region 4: Memory at 661ffe000000 (64-bit, prefetchable) [size=32M]
> >
> > These are prefetchable memory BARs, so I would expect them to be
> > mmappable. Why does QEMU have no way of knowing upfront whether they can
> > be mmapped?
>
>
> They can be mmapped.  The issue is just that after mmap flatview uses
> memcpy/memmove on them, and that might not match what guest driver is
> expecting specifically for 1/2/4/8 byte accesses.

Huh? The guest driver has nothing to do with it, surely. The
problem is that for some PCI devices (like the network card
mentioned in 4a2e242bbb30's commit message) the BAR is *not*
safe for arbitrary access (because the actual real host hardware
inside it is not RAM). That commit disabled direct access
for all vfio MRs, which is safe but overcautious. Would
"direct access is OK if this is a prefetchable memory BAR" be OK?
Or do some prefetchable memory BARs still have restrictions
beyond those of real RAM?

> Removing mmap is one solution, this is what vfio does now.
> Fixing flatview is another.

No, you can't fix this in flatview. If a BAR is not safe for
direct access then it is not safe for direct access.

-- PMM

