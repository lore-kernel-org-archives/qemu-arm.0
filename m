Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2428896ejv;
        Sat, 30 Mar 2024 07:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzapFp1A46pSPjXZ6d6X4/2vGe+9hpUvdiAaqWcY4kgr3LJtGDbvuNCxjonaci0/DhmTYeML8hktvtotIH2dWc49LFUKqu
X-Google-Smtp-Source: AGHT+IFKDp0ewUjwoQfSxAngAf6Cb4vKwxVC9QvOyV7MptkvzBK0eaAstG5TT5cyJ9NeZuLA/K+V
X-Received: by 2002:ac8:5b85:0:b0:431:f7ff:d222 with SMTP id a5-20020ac85b85000000b00431f7ffd222mr6210563qta.52.1711809989215;
        Sat, 30 Mar 2024 07:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711809989; cv=none;
        d=google.com; s=arc-20160816;
        b=oFqvXn+S+Zx1vM9GzVF+/YrhHG/ewV6JwFzsczoSzC20WMZlzpXiEtxrp4A4raO4vN
         cq3DHhIBJNkGmwmyqfwGD/NawbJ4xUvf6Gewd0RN51rfoPrMz+eMygwWpvlnltFggy27
         KPixwQuwzJJJLjKGQSX/hEyWeYjbavvM8+G6Y1GmjCgvi4fR6Gzz1em4u4LtNMK/k0TH
         Zcg5F5keiIamqU7sGWCR+/17J4yiElmykpLUZKKz1PWBKJJWpolDB0JsdDJB3WKdicDD
         uecASrTxF0KuvJJUUVi8IM4pK8f3O1d/FCaqvzmSKY7FTKV3kgpYbyUuoXRhisJvrSK2
         engw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nNPc0eeoM57+4ZxGVd2Kl1v5HU4Qrp3mNQIggcCRaf0=;
        fh=OhImUova8Vu1FL2SWpHtfGWKc9v8ZlPgdtOe9cXzZyc=;
        b=rxIiu2z+Cyke1dZWSHLOaBq+mVZWT78guaCntKBKHGY5ecrD00qXaU25H91yaw9jVg
         Doxzza4VRKdNjsz7Pc3mC1fqaOlamk0rnBR6+EGLt9EBiBqQvCWdANy64BUvj5qzCSSA
         Oj6Q8880/w89hqyEkt0OENHpi0RP+rRxiQz/hb9eNNwi7vft8EVdGhqu+oIZClqQDMBm
         bfiQHzgrAYiZ+R3LAAsKZ1hc4XojI8jVp+3ohkY+ffjfUkYk0HWy5Ml0NOfV/dafeSmB
         GE+8ytbZ+FOH03FV/A2rVmqYATuDBR5GC35TxRSvGu5mCMXIQWqr9mBkEduIid5ZR4so
         38pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9aVEoen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020ac85c4b000000b004312833ae5csi5925325qtj.629.2024.03.30.07.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 07:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9aVEoen;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqZyJ-0001D7-NC; Sat, 30 Mar 2024 10:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rqZyD-0001B6-Vh
 for qemu-arm@nongnu.org; Sat, 30 Mar 2024 10:46:09 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rqZyB-0006Qv-2y
 for qemu-arm@nongnu.org; Sat, 30 Mar 2024 10:46:09 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56c583f5381so3139834a12.1
 for <qemu-arm@nongnu.org>; Sat, 30 Mar 2024 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711809963; x=1712414763; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nNPc0eeoM57+4ZxGVd2Kl1v5HU4Qrp3mNQIggcCRaf0=;
 b=P9aVEoenuY7BivVUiR19nMXjyr2OZuFoEVFsyhZG/5i7LbEquEFdXM95ZzxHd/bgOC
 6+jVS44a0U/2FHIjDe7nUith3ubcesGWQqsxPH0ktUywGO6VZKHk1YJ1eI6jsf8EIc+D
 GUK0dVLt78N3hDnwiemblwyKVidi9/O+r4uKBPiRZdVe+wGeb0HK8w8kRf61r/PTjbZc
 aZEs8+G5u0YCEm1D6B7XtTcsKhJZKqOCwSeVkaIoVO4hVxSgd141xAlH2y0VN0wv7iLk
 r779TN8tspw8gKo9tGJRzOBKcfla6ovMrocTK4HDe5E14PR9XahNu3frDR+LZvCAAUK/
 4ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711809963; x=1712414763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nNPc0eeoM57+4ZxGVd2Kl1v5HU4Qrp3mNQIggcCRaf0=;
 b=DC7XQCwsi1cHgP2QwGYPUOB3mP7E676m+hDyQ3YC1yPe7q4aCLUG7enJPqFzjbz+LA
 nzJX1b6m4WXe7K7573PxZwQjA9ANhvlXp4tA8GbZeO1qTqIfEnE2QCxbYoV0N7/TpEX1
 uZgJeKuS5blPjVX16z+m6kqMf8bSbV22m+QfmECvEp/2rDVlJRdpUlKz30R4c8oCl0Op
 BaSMrNJ60E6DbpsZZ62oNv/lZE1qsBFkkCDfP51NDWAxpzpVBAeZHBSZ5F3y4WOlv/fN
 EWAUjhDpXanhb0eh2PBIsBxXj6tbYb7+l0GN8BWPvSic3jvrSIGt4ANkGIoyLzKPVOI4
 9jNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAMrep19E0zeYthVtwTcekyPaPEs6cicgoNeNvYPW7gW2mmYF0+ZYr4kZijNLFXVfKX9+B15seIKByL1mEz85oywYq
X-Gm-Message-State: AOJu0Ywju9oR8gH7nVmnehgSY33RTThYGhTy9IS1X2PgKDrsAM2nF1Ph
 GEIWnNJxREnhHYicDr+roU4fj0YnqAtessAzDo6kQ6hZw+p9KPZ1AwTfnAK5aUyGn2kTR4xWbzX
 mxH3TFS66wHCwiXeRKXjCKz7ZxsrLotpVd+Clmw==
X-Received: by 2002:a50:a401:0:b0:56b:aa17:813a with SMTP id
 u1-20020a50a401000000b0056baa17813amr3558727edb.21.1711809963061; Sat, 30 Mar
 2024 07:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
 <20240325084854.3010562-15-ruanjinjie@huawei.com>
 <CAFEAcA9go1xe+UOBjH64nsRx-n6Tz3sp71qjb0Je=9r8nHBbuA@mail.gmail.com>
 <88013343-6734-272b-c5c1-a12878b8a9b7@huawei.com>
In-Reply-To: <88013343-6734-272b-c5c1-a12878b8a9b7@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Mar 2024 14:45:51 +0000
Message-ID: <CAFEAcA--iRQiGby22gUg51X6udJ_7tRG6d-Bf125b5RTUJBN_A@mail.gmail.com>
Subject: Re: [PATCH v10 14/23] hw/intc/arm_gicv3: Add irq non-maskable property
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: Q57GxA3JJ/qQ

On Sat, 30 Mar 2024 at 01:42, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/3/28 22:54, Peter Maydell wrote:
> > On Mon, 25 Mar 2024 at 08:52, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>
> >> A SPI, PPI or SGI interrupt can have non-maskable property. So maintain
> >> non-maskable property in PendingIrq and GICR/GICD. Since add new device
> >> state, it also needs to be migrated, so also save NMI info in
> >> vmstate_gicv3_cpu and vmstate_gicv3.
> >>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >> v10:
> >> - superprio -> nmi, gicr_isuperprio -> gicr_inmir0.
> >> - Save NMI state in vmstate_gicv3_cpu and vmstate_gicv3.
> >> - Update the commit message.
> >> v3:
> >> - Place this ahead of implement GICR_INMIR.
> >> - Add Acked-by.
> >> ---
> >>  hw/intc/arm_gicv3_common.c         | 44 ++++++++++++++++++++++++++++++
> >>  include/hw/intc/arm_gicv3_common.h |  4 +++
> >>  2 files changed, 48 insertions(+)
> >>
> >> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> >> index 2d2cea6858..be76ae0be6 100644
> >> --- a/hw/intc/arm_gicv3_common.c
> >> +++ b/hw/intc/arm_gicv3_common.c
> >> @@ -164,6 +164,24 @@ const VMStateDescription vmstate_gicv3_gicv4 = {
> >>      }
> >>  };
> >>
> >> +static bool nmi_needed(void *opaque)
> >> +{
> >> +    GICv3CPUState *cs = opaque;
> >> +
> >> +    return cs->gic->nmi_support != 0;
> >
> > nmi_support is already a bool, so you can
> >        return cs->gic_nmi_support;
> >
> >
> >> +}

> >> @@ -238,6 +260,24 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
> >>      }
> >>  };
> >>
> >> +static bool needed_nmi(void *opaque)
> >> +{
> >> +    GICv3State *cs = opaque;
> >> +
> >> +    return cs->nmi_support != 0;
> >> +}
> >
> > You already have nmi_needed() above, so you can use it
> > as the .needed function for both vmstate struct definitions.
>
> The input opaque pointer seems not same, one is "GICv3CPUState *", but
> another is "GICv3State *"

Oops, you're right. In that case let's give these two
functions names that hopefully guide the reader towards
the difference, like gic_cpu_state_nmi_needed() and
gic_state_nmi_needed().

thanks
-- PMM
