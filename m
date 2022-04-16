Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp629224lfk;
        Sat, 16 Apr 2022 06:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd7P1tG0fxngSjhmQRtvGqJn4KbJHky+Lnr8H27QI/uUg0Bifrmiw3+ZANzXbgtJb3vUYX
X-Received: by 2002:ad4:5dce:0:b0:444:54fc:4ca9 with SMTP id m14-20020ad45dce000000b0044454fc4ca9mr2559838qvh.3.1650114179609;
        Sat, 16 Apr 2022 06:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650114179; cv=none;
        d=google.com; s=arc-20160816;
        b=OHRe0ZloCJqKZHBEzcUWaUqqkaWGVPQUrNq9taTsN8Vg25mnfp/gdmjFupHz1Rfsqp
         zY6Oq1k1ubh49iyXP8ZExqNh8a1TGFJ1/ytOyZFF/ioKdeRjSkGtAa6J3TA6h7G5/X5P
         evtPt/1UPXjWxUMbewTyaU3eWuhAZtr0XKgzgqmejScUjh40++GD6IBn7/yjoa+10RZq
         TC2PVGkaz+T20wxxPpfwsicynmDLfrqswDWcpFIQlGAAng32MmoW6bhvWxDX/C5Rs9iq
         mvuwwmho7gH6gla287ALvE/L3OkkkPOs3WRJgJAr9CHw+RQqaPx+wwIPknHTH/FJBnJJ
         Z4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=89X9JZBikQKEptDKslhxRhbzZPQv11hruf7SbrggjfM=;
        b=qIaDU34xwcWy0QPnBENZ0C40uYQoSIbhxDdlGuuAkNoO2rwHilYv8IJUTdpwaDQgA+
         SgEOJ0gT7Tz1uqugPb/A/Pp2y12FovLsWWIbqJcRH95EJ9jOMwL4JbQkYRfBcNEw66Tu
         zy9PnDNzgh0I/WErfmeTPSrwFd//DMzbIOGnjlaXEU1RWr0wlu8OuvPLB/EMAYyCqgXc
         0IWlJsJMsKGfPHRq8pCc2H2qZQTstS0NX779Nx62GrYrpu5uEacbNF1kFYUybE5Y5qq+
         /gbUNrp7tqSz9Bih/6gPKzdUBa8zTqas0B5zD5SN4oM/FwTfQ0E60mlslYWeDVCsUBx8
         CBuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b="kCZQ0l/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi3-20020a056214248300b004463cae800csi1255125qvb.145.2022.04.16.06.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Apr 2022 06:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b="kCZQ0l/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nfi4p-00006J-4y
	for alex.bennee@linaro.org; Sat, 16 Apr 2022 09:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nfi4Y-0008Rw-2g
 for qemu-arm@nongnu.org; Sat, 16 Apr 2022 09:02:43 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nfi4V-0006vF-7a
 for qemu-arm@nongnu.org; Sat, 16 Apr 2022 09:02:41 -0400
Received: by mail-qt1-x82a.google.com with SMTP id a11so7397417qtb.12
 for <qemu-arm@nongnu.org>; Sat, 16 Apr 2022 06:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=89X9JZBikQKEptDKslhxRhbzZPQv11hruf7SbrggjfM=;
 b=kCZQ0l/xswg1Vyrms9LsxLiJOloBE+SgCltwVDXGLxu5UNe3bUrwAeb7FzirOsU3mf
 2+gsD/qlAVg5QvYOhmTI3ZVQQ5lQSQJjTqDywBLcCIG7o+M7bBCrQeIXsgvNAnXM3Kap
 9TKun9mDNFMNN9X3zKnHnzj+5zhcuZ5kTYitI9+yXMujwpbzu/xguQsP//r6BejjRrHP
 nAXXqrNkrCMGJNtCUNXYTNDsNrC1fdcZeky/rdDmH20pLSiWOwDm4i5v84tXOxNsvKY3
 wlEgN8TnlLiqe08vIX6mbntXsgrh63oXsD81r3YdecJ5/TiVLAZueeU1KlZ5vbh/kUu7
 9Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=89X9JZBikQKEptDKslhxRhbzZPQv11hruf7SbrggjfM=;
 b=B3/sRtHYcLqisfsFb00uKJahxVIgs/QIhS0RBTMxf+6EY+oGi13+R2o2RltL0k8hB8
 bkEGztTRzOLOlfprYaToJQJFvdOrg2oSIHpSfpRpZcTV7mHeYmtIcJNxsXyoC0Wtb7+B
 gM/cs70Ck8TbeUxeRXZ94z66SrrqPf+ZsxA+gND96BOlx4aZlp6+B+ohSn+p9xAob3mI
 S+x1r20MTVNnn25XGbCBX6CQ81uf/oEeZkJ2tehb9P4ryyYiuQO1aL3R8oAYrQ2JLkts
 1B85qazqFAcYpLD33YghZe0IcEw76qDHcVsXkLrf0HMmuQ4pQD/LOn1DNOWBJ4eqp2Qt
 SMMA==
X-Gm-Message-State: AOAM533MHJj8CWYmrBnBH9GyU2vY5uYlxQc4/nGNP/jvJ6cznhOVuoRD
 x9/PNdaheVRw0X/7JhKmb+BSVJkqjTEwl1mE/Qruyg==
X-Received: by 2002:a05:622a:c3:b0:2e3:4bd0:16c2 with SMTP id
 p3-20020a05622a00c300b002e34bd016c2mr2123258qtw.575.1650114150453; Sat, 16
 Apr 2022 06:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
 <77de88b4-9fb7-d1c6-4f2a-55b7b5cbc9b4@greensocs.com>
 <CADXGpuczVFmWawvm=vUj=-E9oa2OYUj4+cB_bWFpYuR6xLb7AA@mail.gmail.com>
 <29d36b72-87c4-01fe-b779-b408ada693de@greensocs.com>
In-Reply-To: <29d36b72-87c4-01fe-b779-b408ada693de@greensocs.com>
From: Zongyuan Li <zongyuan.li@smartx.com>
Date: Sat, 16 Apr 2022 21:02:19 +0800
Message-ID: <CADXGpueAFWrkhDDsNRUek=cKDxxZaPXgEHJYk8DsOHguOu_eyQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::82a;
 envelope-from=zongyuan.li@smartx.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "open list:Real View" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y65l/43HL2E5

I agree. And Peter has submit a new patch to refactor the IRQ code in
exynos4210, I will rebase
this code onto his patch and abandon patch-3 in this set.

Thanks for reviewing.
Li

On Fri, Apr 15, 2022 at 4:47 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 4/2/22 04:32, Zongyuan Li wrote:
> > On Fri, Apr 1, 2022 at 9:17 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
> >>
> >>
> >>
> >> On 3/24/22 19:15, Zongyuan Li wrote:
> >>> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> >>> ---
> >>>    hw/arm/ .c           | 26 +++++++++++
> >>>    hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
> >>>    hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
> >>>    include/hw/arm/exynos4210.h   | 11 ++---
> >>>    include/hw/core/split-irq.h   |  5 +--
> >>>    5 files changed, 126 insertions(+), 33 deletions(-)
> >>>
> >>> diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> >>> index ff8852f407..eb485dd7a6 100644
> >>> --- a/include/hw/core/split-irq.h
> >>> +++ b/include/hw/core/split-irq.h
> >>> @@ -42,9 +42,6 @@
> >>>
> >>>    #define MAX_SPLIT_LINES 16
> >>>
> >>> -
> >>> -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> >>> -
> >>>    struct SplitIRQ {
> >>>        DeviceState parent_obj;
> >>>
> >>> @@ -52,4 +49,6 @@ struct SplitIRQ {
> >>>        uint16_t num_lines;
> >>>    };
> >>>
> >>> +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> >>> +
> >>>    #endif
> >
> > Some language servers may complain if we use forward declaration of
> > struct and typedef.
> >
> > Regards,
> > Li
>
> Isn't that C-standard compliant code ?
> We have that pattern all over the place in qemu.
>
> Anyway I don't think that bit should be included in this patch about
> exynos4210.
>
> --
> Damien
