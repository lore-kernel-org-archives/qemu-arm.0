Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2917512lfq;
        Tue, 15 Sep 2020 00:04:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuT1twkntRM7hBwOe8b8EVFRi7zuV7K+HtA/ng289t6uehvX4uHNG73qYEv8zbUI8QPbb4
X-Received: by 2002:a25:c688:: with SMTP id k130mr12346767ybf.132.1600153446541;
        Tue, 15 Sep 2020 00:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600153446; cv=none;
        d=google.com; s=arc-20160816;
        b=hIE4bSm6V0rHcK58vNp5A720ucSDIcFDqHcm2QqF0yjj/WMhaifgVaWQTdmP/lmda1
         4q9TWV+HOlScfjYesg8/I6LR11L+0uyD4Sz/ref7+chLp0lB79quT6vu5BjkwqGxdHsd
         4HnxhIsZHHC1IcAOkP63Zd5hgUTJTnClIwVFgW0kw3Z9I+e39mvLcDpWPa3YnxTP72GV
         lGMKbXkwfraJCQH5yaEqKnQtbHJbBHYeqxz/cO/FbH58mFmaWJHnO3+4u5E12byQE5o1
         f+qk6D/E7Ok2d/qsjGutvSZvnamdUUSxKcqaCu+kRQL/iGR6tL77I0ymoijHK6R/Ar3O
         3RJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZV+LKtuke5ktqAOa6s8VZ03TBrNFczJt3tAnhtD+fE=;
        b=Tahtk/aUaGnGG9GHvsghslh72soWP95MiDaktRZW7m+nao5tDxtu+RLnHeHl3t1jJJ
         IyHeiVACiABng77xY4Xi4Mpe+cJGYDPMqJmCQrXDtvaBhsO9mMD6T+aUUab4nSPvfTVO
         wSlrqHC74CWIpaXHVZHfC9vB+azXl20aRxY6lQfVhiTCyBfRW/jO1K5dGmraSWhS+YYk
         yxebb55crYGeHP1Mr2Xazrh1r9PydzKZpIfSI5Ff1GKMgfbbbczyS5JMDe3RE4oWbl9F
         R3iMKljD18rymxmbm++ZOl40ly6LiMDRKsbb8AzOj5sy1PAQ0aYEzAqpfp12RPv/B+rY
         sUyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ysfZ5tAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e76si11786568ybb.54.2020.09.15.00.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 00:04:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ysfZ5tAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI50X-0002OY-VL
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 03:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI50L-0002Mv-02
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 03:03:53 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI50I-0001ez-Gm
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 03:03:52 -0400
Received: by mail-io1-xd42.google.com with SMTP id m17so2948556ioo.1
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2020 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZV+LKtuke5ktqAOa6s8VZ03TBrNFczJt3tAnhtD+fE=;
 b=ysfZ5tAjrSHaQPrWuSGyriIftNKNgVLkh4zDDHvVURWNrJB5OL/bO77qBhBQJIbeyb
 o/icB97SrXyzaKJHD/ECXWWHUUA3xbfra83LFBzbhigw6ldfVUIx7X5lKg2RunnhHPVd
 x8dQD6bpV06qE4rV7X0TubdnMwsz5xOy/7Gs//2DII5FGCh7dhtbUIcNyDy6MvDuwFfl
 gAitivQoKS6fgMrQ1oLKHnPR/tbLEn6zJ2X3A7n4bogoouXH8CwbeAxSegaEo7sV+qby
 upc7bIfbfJKL/UBqkC14pAPuwUdRiXV3Oa8zW1KN5ceJ76dyaesguIWThfD5vTVPSqLF
 dgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZV+LKtuke5ktqAOa6s8VZ03TBrNFczJt3tAnhtD+fE=;
 b=BgOLAcKHIXugPNl4/9sMkwGre6ZvRtm/XDzRYQlG7gL7kBdEGkmFVULppf6MHlrKwT
 ChTtwr1Q6dIcklZZ4G0BMEH4NqBFP58ZDKLZxdUjhiMqT5C2WgZhxOer2FBe3Tio6IzN
 ESSyYyXYzAdzrO4tl+lR9m7mo5RCqaGYR7iMA99yF3u+NX58SDVaGWdQRmfAD95/7zXa
 eK7izXRQG0vlj732xVouYtZ8mxa+06Ph63n3QSwp+Bashty1ZeXp48OfoB4fFuJJfcCv
 OmMuXWazMucVBGLDZmWM9oQUCpSftmlzCupRbaTpgOFFqgJZF785mo8gCvrUkLUoKqqp
 /NCQ==
X-Gm-Message-State: AOAM531TI7WznnXKFf8V43xKzyO+DFpUUgQYRyJZgh08UHK2+o7tHciF
 7jzkfE/WWUQAFBNmImZJGzNmq937eQd0dMWH6zCL
X-Received: by 2002:a05:6602:22d3:: with SMTP id
 e19mr13915602ioe.197.1600153429358; 
 Tue, 15 Sep 2020 00:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600135462.git.haibo.xu@linaro.org>
 <20eedb95441ecec7b23527cde78aa5b63c67b400.1600135462.git.haibo.xu@linaro.org>
 <20200915062219.dtnl6p3nan76xvv7@kamzik.brq.redhat.com>
In-Reply-To: <20200915062219.dtnl6p3nan76xvv7@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 15 Sep 2020 15:03:49 +0800
Message-ID: <CAJc+Z1Gk2pjiaMKxohj80x1YkvTw4eNW7BZxp_ztsF8E68pYeg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] hw/arm/virt: Move post cpu realize check into
 its own function
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd42.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YmYwmZLvSkdS

On Tue, 15 Sep 2020 at 14:22, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 15, 2020 at 03:11:43AM +0000, Haibo Xu wrote:
> > From: Andrew Jones <drjones@redhat.com>
> >
> > We'll add more to this new function in coming patches so we also
> > state the gic must be created and call it below create_gic().
> >
> > No functional change intended.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/virt.c | 38 ++++++++++++++++++++++----------------
> >  1 file changed, 22 insertions(+), 16 deletions(-)
>
> This still isn't the right version of this patch. You need
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg727591.html
>

My fault! Very sorry for forgetting to address that in this version.
Shall I re-send this patch with the fix? Or fix it in the next version?

> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 3f6d26c531..2ffcb073af 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1672,6 +1672,26 @@ static void finalize_gic_version(VirtMachineState *vms)
> >      }
> >  }
> >
> > +static void virt_cpu_post_init(VirtMachineState *vms)
> > +{
> > +    bool aarch64;
> > +
> > +    aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> > +
> > +    if (!kvm_enabled()) {
> > +        if (aarch64 && vms->highmem) {
> > +            int requested_pa_size = 64 - clz64(vms->highest_gpa);
> > +            int pamax = arm_pamax(ARM_CPU(first_cpu));
> > +
> > +            if (pamax < requested_pa_size) {
> > +                error_report("VCPU supports less PA bits (%d) than requested "
> > +                            "by the memory map (%d)", pamax, requested_pa_size);
> > +                exit(1);
> > +            }
> > +        }
> > +     }
> > +}
> > +
> >  static void machvirt_init(MachineState *machine)
> >  {
> >      VirtMachineState *vms = VIRT_MACHINE(machine);
> > @@ -1890,22 +1910,6 @@ static void machvirt_init(MachineState *machine)
> >      fdt_add_timer_nodes(vms);
> >      fdt_add_cpu_nodes(vms);
> >
> > -   if (!kvm_enabled()) {
> > -        ARMCPU *cpu = ARM_CPU(first_cpu);
> > -        bool aarch64 = object_property_get_bool(OBJECT(cpu), "aarch64", NULL);
> > -
> > -        if (aarch64 && vms->highmem) {
> > -            int requested_pa_size, pamax = arm_pamax(cpu);
> > -
> > -            requested_pa_size = 64 - clz64(vms->highest_gpa);
> > -            if (pamax < requested_pa_size) {
> > -                error_report("VCPU supports less PA bits (%d) than requested "
> > -                            "by the memory map (%d)", pamax, requested_pa_size);
> > -                exit(1);
> > -            }
> > -        }
> > -    }
> > -
> >      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
> >                                  machine->ram);
> >      if (machine->device_memory) {
> > @@ -1917,6 +1921,8 @@ static void machvirt_init(MachineState *machine)
> >
> >      create_gic(vms);
> >
> > +    virt_cpu_post_init(vms);
> > +
> >      fdt_add_pmu_nodes(vms);
> >
> >      create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
> > --
> > 2.17.1
> >
> >
>
