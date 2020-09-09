Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp55518lfq;
        Tue, 8 Sep 2020 20:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjvgVZea+jIKFNJT8/IwK5pzMstSAYP8xFvIKSkNM9JJ/xB/9BhtDvjcgA+qcmbW0kzblZ
X-Received: by 2002:a25:5855:: with SMTP id m82mr2952794ybb.329.1599621148491;
        Tue, 08 Sep 2020 20:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599621148; cv=none;
        d=google.com; s=arc-20160816;
        b=a0PtmoEcu8Oq9v5FwMKSfDNR97+MWlTdEo22FsvPsm7avyPQpxf1Cu3ppWzHvWbRUn
         ezFqvLRtRPH3FFyhGh83RN05vOQarD8NrTjw63l02mpEibo4tAa0ImogAHM2eFD06Zn2
         xomePlu3Yc8rbNFACEITZ+0H1SIkPVXvjCeMn70TBv5CWBDcBa4vvPTbJh5VtRnny8By
         Tb/0DbYzPunQMlxaPCXB7DuDds6k4KbToVOJQRjNsaHdtuVPcSgLbBoWehU1iG1phFZe
         2oTSC3PSaaHlw9PasVxs+DluFb2B0axjcLZKRjX4WSJ+tcMWBcaF7UAIIua0sB9cSGkN
         n4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yletO5DQ3uAqjd/u7Mgx8CUZLUxS9FAu0MROdwszHrY=;
        b=S7Bo2z/gmSKZXjuWJTf01ovwPvnGd3VvKrehPbpV8J2CUkNUtJU9KDGp6cpVQyL98N
         n3hgDEHDlzC+lpWAYpVWc2GoHh1JVcNWmC216EHIDK4LLlv3XDWiMnayE75h+BjEbBh3
         PUTtJVv4agYNHbfwPIJHTSjU7KbfjvC4LFuwLBjvFf0Rf7e8EF4C8lrcddQ0GsvVJJJf
         t60UjxFrpJ5BJQUG8h3+QcIUn2BI9Tj4+S9YBJn4BnIKByNkK9Jt3m2GBqD5EFJpPHvw
         VDcPto2BaIbkZux+pZX1XCUC3habTvrxb3YTsgaxrJEW3sydgpKkXoXmqoLCxPtUv+yT
         A/1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oq+cS0qa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si1485377ybq.296.2020.09.08.20.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 20:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oq+cS0qa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFqX5-0001Bv-UY
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 23:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFqWy-0001BT-Ca
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 23:12:20 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFqWw-0004wt-MS
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 23:12:20 -0400
Received: by mail-io1-xd43.google.com with SMTP id r9so1666333ioa.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 20:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yletO5DQ3uAqjd/u7Mgx8CUZLUxS9FAu0MROdwszHrY=;
 b=oq+cS0qao9CRcs7q/yMYo/4ExcoSQbtfSQQke8OBjD47vUSgKP75cZ3inYwGl03Ive
 2QvZOTalWiU3UcwWSIyuzFaTx9g81PM+1JONJLDRHPe4gS7bU+j+xf1mltWBxeLVU36/
 WbNj878UEDJo9w50G7B/jPyEeN5MmAQfehPfBHxitvnHVJhnU3zr10/2nCFAwSlMjYev
 GnWbivNvxvmnHzyuu4G5xi9/tXz46JWDSnhc/LuUzok+FnrKvx6QbGiNLu25fXGWmuda
 c43tWqn3/M3zmZeer+YhZlicwoUBgfxfYsnlj7KXB+H695h30s7iV5Uip48wOniJ5VG+
 Kfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yletO5DQ3uAqjd/u7Mgx8CUZLUxS9FAu0MROdwszHrY=;
 b=JQes/EONx592L2QqvOeUIV0b8MNGVv+2+Bz1m8pxTxq6bLHOk1X9QsVYhdReUzomQO
 s58OsSwK/iAANIoecNvFgY3yeJbVZjZn0MAwccrI9NY6AA8yyH3ACNIr9zjuCUnEzUYv
 Xnt07FgIWGaCVfA29I+YfQS4PkgmV01WgyQEQQW0VqMT3HecKq0xZ98dujM+X21zVVWJ
 xdK0OweK2YOLBHmbNqztX40fGe6m+pww655gIAhLFdzS5ClHpWlliNvR6QgJtuFHZy8C
 prfuEXJDAQssTxDqi5TZylSF1Il6XyjnW58NPb9kDUe54BI0Noq+jDu0tpk6EM/qViw2
 Q0DA==
X-Gm-Message-State: AOAM533YiexJF0DkrUAyT9YBlDuZpOxZ/OrmS8DcO4ChZQGJ8ozK346o
 E/duGVAoPuqiZd2IIDkCzPjx/PFz/tjjzpnyjfoC
X-Received: by 2002:a05:6602:2201:: with SMTP id
 n1mr1731696ion.35.1599621137242; 
 Tue, 08 Sep 2020 20:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <6aaa406b824d0c427acbc3f3abfbbe841f3bb93c.1599549462.git.haibo.xu@linaro.org>
 <20200908113458.2fdhbs7lpw63fvnv@kamzik.brq.redhat.com>
In-Reply-To: <20200908113458.2fdhbs7lpw63fvnv@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 9 Sep 2020 11:12:06 +0800
Message-ID: <CAJc+Z1EoJH3KXE65LESOU_ZRcn9zdY8hbTsye8ZaM+e==s103g@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] target/arm/kvm: spe: Enable userspace irqchip
 support.
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: philmd@redhat.com, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L/92kmawnXKN

On Tue, 8 Sep 2020 at 19:35, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 08, 2020 at 08:13:29AM +0000, Haibo Xu wrote:
> > Since the current kernel patches haven't enabled the
> > userspace irqchip support, this patch is not verified yet!
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > ---
> >  linux-headers/linux/kvm.h | 1 +
> >  target/arm/kvm.c          | 5 +++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> > index 8840cbb01c..35ef0ae842 100644
> > --- a/linux-headers/linux/kvm.h
> > +++ b/linux-headers/linux/kvm.h
> > @@ -1672,6 +1672,7 @@ struct kvm_assigned_msix_entry {
> >  #define KVM_ARM_DEV_EL1_VTIMER               (1 << 0)
> >  #define KVM_ARM_DEV_EL1_PTIMER               (1 << 1)
> >  #define KVM_ARM_DEV_PMU                      (1 << 2)
> > +#define KVM_ARM_DEV_SPE                      (1 << 3)
>
> kernel header changes should be separate patches
>

Will move this line to patch 01 in v3.

Thanks,
Haibo

> >
> >  struct kvm_hyperv_eventfd {
> >       __u32 conn_id;
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 58f991e890..7950ff1d83 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -820,6 +820,11 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
> >              switched_level &= ~KVM_ARM_DEV_PMU;
> >          }
> >
> > +        if (switched_level & KVM_ARM_DEV_SPE) {
> > +            qemu_set_irq(cpu->spe_interrupt,
> > +                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_SPE));
> > +            switched_level &= ~KVM_ARM_DEV_SPE;
> > +        }
> >          if (switched_level) {
> >              qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
> >                            __func__, switched_level);
> > --
> > 2.17.1
> >
>
> Otherwise
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
