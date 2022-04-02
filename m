Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1319868lfb;
        Fri, 1 Apr 2022 19:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1J4/lAAzKQlwGpcV2Wf4dSj/McvvktT5bgWpwQIqdmTwlUNOg6orjOFUb497fD1Peq12P
X-Received: by 2002:a05:622a:14c8:b0:2e1:d626:66ea with SMTP id u8-20020a05622a14c800b002e1d62666eamr10655349qtx.58.1648866782088;
        Fri, 01 Apr 2022 19:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648866782; cv=none;
        d=google.com; s=arc-20160816;
        b=VYbffcrvZ1TqHxDWLMU2j8mge9ioI9gMJ2+BSS8h1gUSAHh/5k6EXPHFfJkFJuxLB1
         cKwPUDUkSP5WvvSbDqQHs1fntH7zKC3C7llISGk24h4uJEAUjj6ZdhhHi862GF38EXb1
         39q6Bax246BYhKVFYBeib8Duj6K4Smm11IJh8YnYKXwp2CZ1Bj09Efp/6KSRMaT5rZGH
         rG3+nDey64sbzmWMfhIIYcDdEr5FqqmvFkxVEgOo+xrHi8Q18FKEZDiRWqbTIv7NWXEZ
         ttzW570CCVHPq+05RIjob8DgnpR1OVUH7ZaKxl9AsPmJNnd+ZQYkyCwkp7Csyeo5nn/3
         54mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFPEQ6m5J3JKVjna0NTRVy76Qf/w2j9vhAX5r+npR50=;
        b=laxYYgf+eiUqhBp5O2184SPuGREOopHR/1jDdIUKiNsQ4/enkoVY9tG8gKyij51Ciq
         TWprExIqICsFqYkGXjunrpex4gHSAREYHIv+K6l2ZoIS2kWFzPqX/xk39ly2Th1UmU/c
         URzQKfBVnPQGZBZwmtCGlsbZtp3czFN9jrGZxI1YioIggI0+FKpnkAV4+FxC0j1otUNR
         KpAqQHQ87D6D69zqgFNsLUE4esuBzIZLgzpFlWkXJ7RTOi15ZohHSPxd2u9Msx1W3AZ7
         jChv/jjB770HhWvre9Nm9npBlRc9DxM2u0Wf/pua2Uu5DgWU9AYtjgjfi12YNqKL80uy
         tdFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=bZCE5vgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z27-20020a0ca95b000000b00440e46a7b7dsi1293452qva.27.2022.04.01.19.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 19:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=bZCE5vgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naTZV-0000GF-BJ
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 22:33:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1naTZM-0000G6-U7
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 22:32:52 -0400
Received: from [2607:f8b0:4864:20::82a] (port=41701
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1naTZL-0001Sf-5S
 for qemu-arm@nongnu.org; Fri, 01 Apr 2022 22:32:52 -0400
Received: by mail-qt1-x82a.google.com with SMTP id o15so2277422qtv.8
 for <qemu-arm@nongnu.org>; Fri, 01 Apr 2022 19:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFPEQ6m5J3JKVjna0NTRVy76Qf/w2j9vhAX5r+npR50=;
 b=bZCE5vgAeFRRIf8lb3pPk6qQ9Z0ysrrQQQqu2UksSOMXfY9OCsJ+l+j7sbt3xMK+Fq
 dovveJHdtE2GhMyFPlc/gVm6fByV1cys4QLDYuuId5kNQvvlzU1tni6sBLwCVwx6mZwN
 Ht9UaL3ErDltPDoPQmD5FkCfrn2re7OoEbyPq741bFJR4cJRXXDNQiF/L5teh0JO/qKl
 NwSMFm9S74FoRhxgN0FI/TwaEFo4qo8XXo9nsrQK2yAQCMIfsZDqp+TTbDMxiux6seLi
 B5NMeffuXDGHjw91k9sJGLcD5inTHAjxcnNsO8TR1J1Teyegyi6GiDjCDdBk1GBG6IWf
 /heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFPEQ6m5J3JKVjna0NTRVy76Qf/w2j9vhAX5r+npR50=;
 b=sPNWCeX5vFFK5AmFd8sjj8JWAsYikeTwmMGpT94flAZrutVT1H6H5DJ8ro1cj2HbYw
 7KxESL29g9z1ZM++FVKat44gLRLtejldsgyuf2g6LqxTXuj/f+95r/UMvmJ/Qk01ihhD
 Dxjeb2u6uK52lXQyP4WhtlPpMbqk0ElUvku69HQoOxNI8qMUty0TmAb/cGtgDIMrGpeJ
 34Mxb54eSjX4zQ13zzEx3pIyxHd1idA0uceCXB/3Kq4En8yczFV78PJcBk/5NlGk81Fc
 qxR4NEZVfW3IlSPJHn46Di58gydd596TWwMZmq9eDQuXnYYXAStao9d6KSyjO0fhxl3w
 /F3g==
X-Gm-Message-State: AOAM530U2/r4hpVlDd3H9T6gYnEzpV6TciXTGYP9WYjxw45bPkGqsqNZ
 yswtB7BHgISmwzIkXAfZUmLShQsdbVG2TmY+PILp0g==
X-Received: by 2002:a05:622a:1997:b0:2e1:a678:4edf with SMTP id
 u23-20020a05622a199700b002e1a6784edfmr10632506qtc.525.1648866769945; Fri, 01
 Apr 2022 19:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
 <77de88b4-9fb7-d1c6-4f2a-55b7b5cbc9b4@greensocs.com>
In-Reply-To: <77de88b4-9fb7-d1c6-4f2a-55b7b5cbc9b4@greensocs.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Sat, 2 Apr 2022 10:32:39 +0800
Message-ID: <CADXGpuczVFmWawvm=vUj=-E9oa2OYUj4+cB_bWFpYuR6xLb7AA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::82a;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6wwVyLEJjof

On Fri, Apr 1, 2022 at 9:17 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 3/24/22 19:15, Zongyuan Li wrote:
> > Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> > ---
> >   hw/arm/exynos4210.c           | 26 +++++++++++
> >   hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
> >   hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
> >   include/hw/arm/exynos4210.h   | 11 ++---
> >   include/hw/core/split-irq.h   |  5 +--
> >   5 files changed, 126 insertions(+), 33 deletions(-)
> >
> > diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> > index ff8852f407..eb485dd7a6 100644
> > --- a/include/hw/core/split-irq.h
> > +++ b/include/hw/core/split-irq.h
> > @@ -42,9 +42,6 @@
> >
> >   #define MAX_SPLIT_LINES 16
> >
> > -
> > -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> > -
> >   struct SplitIRQ {
> >       DeviceState parent_obj;
> >
> > @@ -52,4 +49,6 @@ struct SplitIRQ {
> >       uint16_t num_lines;
> >   };
> >
> > +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> > +
> >   #endif

Some language servers may complain if we use forward declaration of
struct and typedef.

Regards,
Li
