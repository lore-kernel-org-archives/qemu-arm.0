Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2434159lfg;
        Mon, 2 Mar 2020 05:21:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9lEhmx+jUZMhWgUFk2fulb4UONzxZ3zEfOcbJ/Ot0p6DwzERUiJTI0XnUqIiQH5GkF8ex
X-Received: by 2002:a37:96c6:: with SMTP id y189mr16031539qkd.150.1583155314614;
        Mon, 02 Mar 2020 05:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583155314; cv=none;
        d=google.com; s=arc-20160816;
        b=w79KkAAtjmHQrP+qae+VNs8wZFJVW3xL8/Mt94kYne4eAsw2wClGR6FhU4/KE1+VCP
         cWqc0mxZezorf2vHTFSvfYCdmErRsnaR6UVtEUY9PaWhDCdgAfJFVfOZwrWqllINTb3O
         uzHyBthfyjYSsAzUuCZ5VvBzj4WVY6czogttQuqwogFBJUSDiRkXBCW61FgzzsMldpzB
         Hhue3DoMAaTl9TRwusEFM1R22qf2bxM0M8vPD6pAfTRzZw+uaEC2AIC67EMkLdKaH8B0
         fhe3jlh2V2SvxPbUafTYcN2MxHJjGo0phsyMYoD2s4Tvbam2XJmn61/etYJ63h5Vi8tl
         UFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lgi8huHg7JypWseRljj3J6mY8B1BwBwq3IJ94gGxoA0=;
        b=F1C2Zk21uvYP2cmWhZaNVD17fY+c9XXNlnnFvfchEuz6gEjfqaj1c8v+asvr3Q6go3
         g8ua02RkmeCaSAMDkTMhF0hLCqNfdUQ9Obokv7/6mYI6RxlTEQmpRgsZMaE3UXqN0Ug8
         7nTdX4dtT66+cgWcLYqjv2hTsbtY8l2gwoJLJYyOFjAPD4+hydd1fgruJqBzpA2YWln2
         dlEBCW08aVP1Z5Hvz9guCrU9/0rwlYH8xb2IoqjeP5vz691Qa2y3RpTwqGpVemJdKBlL
         56xdYE2Yi3VX2rNmgd8ZUyW8yp+aO1l5Qzhjca6HYeFnGOMNhn7OSYZLZiDzbl8SjRtK
         HdYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xb2Ovmrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s23si5837310qtq.163.2020.03.02.05.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 05:21:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xb2Ovmrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8l18-0006eC-2H
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 08:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8l10-0006dx-4V
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 08:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8l0y-0006sG-Tf
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 08:21:45 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8l0y-0006rf-Nv
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 08:21:44 -0500
Received: by mail-oi1-x241.google.com with SMTP id i1so10212836oie.8
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 05:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgi8huHg7JypWseRljj3J6mY8B1BwBwq3IJ94gGxoA0=;
 b=Xb2OvmrmYu9aAncfEJ3FXgchR8e6EecGnmNUXBG6Ok3T2ViMI9ws6DXys8b8jXaXXA
 /fCwfq67aZNnFJzLUFyRu8BRB3Olno2JFv+LLYDj0fTtMSvEmRWtIR43l7fiD5zCpeho
 BrnFfM1ydCr/ooWvUaB9CSa0LGj+kHAukOmREbLVr6sNbuptr+EWjnax5VDAcc87kSg7
 dIDv6x3CcUoRo6SXebg5eaNLNnkOOsAoYOBtQFOMzu8urXCXjZZjZfeTRLyxWpR2HLKm
 63KZoWfVTD5EtGSmiqkZ6yMJJQDgJS//eO/hUUVd3BgVj9axE8pAf9qb8Pi2s0Ck9uLW
 5HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgi8huHg7JypWseRljj3J6mY8B1BwBwq3IJ94gGxoA0=;
 b=KBJWzDLaWmb3fLSPjyA+4WQK7JWsLhsctPu/mUdVK39yr3y90/G3KggcfvHlOC9DDx
 zJjjzQMCwJs67Mt1xLHn1UUPaRcQ7HvVKDua184jWpD/tHlDJln668DWgfEbf/FIDgpP
 7uKwrpMay+3cjyvKfyS93qyz7FKJviCMypRdsFvJ9GRkS3+nKGHS74pMSGtMR9TKh5rS
 nqCxfFyttegdHFVVA+4uoClqmwInh1plqXWupWcCTUuBljWx9JhPRiwMsf6e5ScsQtpl
 iUdKvD11wWCV7hm1FI8MpzjK+ZZ4SthawsxNgAdFgQ6o+2TFgD20qzjHrdvNeYU3zToc
 cnJg==
X-Gm-Message-State: APjAAAXfSjPs6l1ZF+dvZIQxDtnl9GVyIaaHkcmzcSPniN/l9RI+FeIJ
 QHnM4lTlsw8dScpO1h3JCq+VYtZd+UuMRy5LS652bQ==
X-Received: by 2002:aca:b2c5:: with SMTP id
 b188mr11625368oif.163.1583155303743; 
 Mon, 02 Mar 2020 05:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-6-pannengyuan@huawei.com>
In-Reply-To: <20200227025055.14341-6-pannengyuan@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 13:21:32 +0000
Message-ID: <CAFEAcA8yvrYrBONtW46iswbEvMF-WC-j7fHOOfcoEC_RV66BkQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hw/misc/mos6522: move timer_new from init() into
 realize() to avoid memleaks
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Euler Robot <euler.robot@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 876CraSk81fr

On Thu, 27 Feb 2020 at 02:35, Pan Nengyuan <pannengyuan@huawei.com> wrote:
>
> There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.
> Meanwhile, add calls to mos6522_realize() in mac_via_realize to make this move to be valid.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
> v2->v1:
> - no changes in this patch.
> v3->v2:
> - remove null check in reset, and add calls to mos6522_realize() in mac_via_realize to make this move to be valid.

Hi; this is really fixing two bugs in one patch:

> ---
>  hw/misc/mac_via.c | 5 +++++
>  hw/misc/mos6522.c | 6 ++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index b7d0012794..1d72d4ef35 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -879,6 +879,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
>      sysbus_init_child_obj(OBJECT(dev), "via2", &m->mos6522_via2,
>                            sizeof(m->mos6522_via2), TYPE_MOS6522_Q800_VIA2);
>
> +    object_property_set_bool(OBJECT(&m->mos6522_via1), true, "realized",
> +                             &error_abort);
> +    object_property_set_bool(OBJECT(&m->mos6522_via2), true, "realized",
> +                             &error_abort);
> +
>      /* Pass through mos6522 output IRQs */
>      ms = MOS6522(&m->mos6522_via1);
>      object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),

This is fixing a bug in mac_via where it failed to actually
realize devices it was using. That's a dependency for the bug
you're trying to fix, but it's a separate one and should be
in its own patch.

You also want to pass the error back up to the caller, rather
than using error_abort. To do that, at the top of the function:

    Error *err = NULL;

and then here you can do:
    object_property_set_bool(OBJECT(&m->mos6522_via1), true, "realized", &err);
    if (err) {
        error_propagate(errp, err);
        return;
    }

The existing code which inits the mos6522 objects and
calls object_property_add_alias on them which is in
the mac_via realize function should be moved to the init
function. (init should init child objects and set up
properties; realize should realize them.)

This is all fixing the incorrect creation of the mos6522
devices in mac_via (which has been wrong since the mac_via
was first added in commit 6dca62a0000f9), so that can all
be one patch I think.

> +static void mos6522_realize(DeviceState *dev, Error **errp)
> +{
> +    MOS6522State *s = MOS6522(dev);
>
>      s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
>      s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
> @@ -502,6 +507,7 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
>
>      dc->reset = mos6522_reset;
>      dc->vmsd = &vmstate_mos6522;
> +    dc->realize = mos6522_realize;
>      device_class_set_props(dc, mos6522_properties);
>      mdc->parent_reset = dc->reset;
>      mdc->set_sr_int = mos6522_set_sr_int;

The changes to hw/misc/mos_6522.c are good, but should be in
their own patch.

thanks
-- PMM
