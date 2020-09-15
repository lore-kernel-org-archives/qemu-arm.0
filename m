Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2933941lfq;
        Tue, 15 Sep 2020 00:34:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV0CMW/5AR6oufpdbqGgj4oBNmn82nMpcYiDLmozQUWWyPMfT4uVCZf0MRSVCRYYfaulQl
X-Received: by 2002:a37:8ac2:: with SMTP id m185mr4194169qkd.84.1600155283122;
        Tue, 15 Sep 2020 00:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600155283; cv=none;
        d=google.com; s=arc-20160816;
        b=PQzKoUTWFwo1+RoPHyHdAXWH4JOeelh0v7+fPS3S5QgJIzJKdKtj1/A+eW70D0Yavy
         LXKYcxooKuqOuLg+12g7aNVvYkq9ALrinj7v48BxeHKk1jOGGUKzGtvRL9x3t7+NBv5t
         cVdHEYBDTOhu9LMvPSN5u4Ytsdgx0Jdzj1ilXKwZZkgeBqzYtqIFIG9tczT2FnXO3Xi3
         pvI7dc5bLKsdMFBUfQuzTsXlgVlrBbcTfRDwVBjTd+NTDFKnTmdBgYN+nKDWEkUfK89p
         lrcL24uadp19B7XNes60JRa1jWA+HukVGOIGJM1/zBpbJVMHVaFY2anBB8ZgEZFElwt1
         BaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yB66n3VLIS18YfZaD6U5F9r5sDIuAlqz5I9fzVyCvw=;
        b=XN7TKq+vWDJll/9nRcIEgxm8T1qRBSghbXGm9Lsluc9zS3Uog55NZ28xV+fmbMkC5+
         eBipSyBWgz4x5U5yaqHJM4EYdyZ43ZG8NJNOWxCMAjRTVt8dCec9CfbFqGW/r9J/4Su6
         old1kqemHZ+37omOz8R0ME/8XY+lxnUf7LB8asF6LTggZQ6dJN3m65hEvz0t+jxPYm4g
         B63dUI9PkLYhF4Idr8DtvemhREeryq+vY/QtXicKUDZhd0HMvx/G0Ipecp2Fz92h8MJa
         yVmV0j3PycpwR8FO69xUtKbse9vcdn2FqY7HR8gYSBw+8QnBPz+dedID9Ox2WVs5heA3
         CI1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SyhvTMpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si9082529qtc.379.2020.09.15.00.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 00:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SyhvTMpc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI5UA-0005lS-K6
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 03:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI5Tq-0005jN-Q5
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 03:34:22 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI5To-0005LC-Pf
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 03:34:22 -0400
Received: by mail-io1-xd43.google.com with SMTP id d190so3010718iof.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2020 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yB66n3VLIS18YfZaD6U5F9r5sDIuAlqz5I9fzVyCvw=;
 b=SyhvTMpcKBvlqfRlp5YKqi5sHped9UcXJvRgQB2N7tJA2TBX3I9kJTwDaIW2gp28p0
 P5orAUkXDabml5nJtAIDOMJV9YAm0qxnhJuA6sPjxQQixUNVuQTE0sN59yrgo7UbDRgM
 Xe7uo889cjxYwC0+4euwrtuUQFO/eDEvPnlyFWl6ovLEymlmgOIptuZ0J5svplCVNmQU
 /OctwoHAJKxFbiUurODeiEZQNO2tcK62ZgydTNZBl8EmxTku6PpcDrPe3LdQG9MZmdpH
 JuJ0NJkkHEF/tde/F0aoNrGgE30pN8nAOETREPNalnSIvx39hjFMGh5GAqmLGWeuyplk
 ITYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yB66n3VLIS18YfZaD6U5F9r5sDIuAlqz5I9fzVyCvw=;
 b=inMsUoDaDH/kxbDKcDca5NNAnTV8jDwNQVZIYeh9gSLgtVb+JmdI31hlwU6/mI7Jq+
 h9GTjvCnVLi8YUZyx9QrCyeS1XuWBTtbb0y0mK4cu4FPb2cYeElJ2Ze4+94iBQszKFVz
 51Yd5U72o+bY4363kRX7SO0I+0kqWdqAdbN2LqmsEfzYNwrW+jLbj+TdYmhFG4QC5ZR+
 2tKrqp+sCYxJz/ovcrocUBrEwrcYxwXNF4VL73iVdOibA0mlfxZVM/smrp09rJZJM3uy
 S2JRvwO6To+VKcdo9ho2L5vQuwLnfRJTrJakgICpvrOgi2VheFYZF5CDtTr+rCVJi2Oc
 nXUQ==
X-Gm-Message-State: AOAM530SYOZbRG9xjB5nx6jgBye9LazIKPQ/fJ1Bt8vRA/fY7HPwGsD5
 iUV2ig2/Ab+/uz1hVh394YDzlNMdK9jIH4pu1xgU
X-Received: by 2002:a02:c942:: with SMTP id u2mr16220214jao.114.1600155259826; 
 Tue, 15 Sep 2020 00:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600135462.git.haibo.xu@linaro.org>
 <20eedb95441ecec7b23527cde78aa5b63c67b400.1600135462.git.haibo.xu@linaro.org>
 <20200915062219.dtnl6p3nan76xvv7@kamzik.brq.redhat.com>
 <CAJc+Z1Gk2pjiaMKxohj80x1YkvTw4eNW7BZxp_ztsF8E68pYeg@mail.gmail.com>
 <20200915073105.32zci2lukwgljvw4@kamzik.brq.redhat.com>
In-Reply-To: <20200915073105.32zci2lukwgljvw4@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 15 Sep 2020 15:34:19 +0800
Message-ID: <CAJc+Z1GjKPYTjFfTah1-mmjjgH7-vXPPW2qpwMAvsWrACzcGpw@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] hw/arm/virt: Move post cpu realize check into
 its own function
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uR/APF8BmChW

On Tue, 15 Sep 2020 at 15:31, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Sep 15, 2020 at 03:03:49PM +0800, Haibo Xu wrote:
> > On Tue, 15 Sep 2020 at 14:22, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Tue, Sep 15, 2020 at 03:11:43AM +0000, Haibo Xu wrote:
> > > > From: Andrew Jones <drjones@redhat.com>
> > > >
> > > > We'll add more to this new function in coming patches so we also
> > > > state the gic must be created and call it below create_gic().
> > > >
> > > > No functional change intended.
> > > >
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > ---
> > > >  hw/arm/virt.c | 38 ++++++++++++++++++++++----------------
> > > >  1 file changed, 22 insertions(+), 16 deletions(-)
> > >
> > > This still isn't the right version of this patch. You need
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg727591.html
> > >
> >
> > My fault! Very sorry for forgetting to address that in this version.
> > Shall I re-send this patch with the fix? Or fix it in the next version?
>
> I can wait. It'll be awhile before this series can be merged anyway, since
> the KVM patches haven't been merged yet.
>
> Thanks,
> drew
>

Ok, I will fix it in the next version.
Thanks again for the review!

Regards,
Haibo

> >
> > > >
> > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > index 3f6d26c531..2ffcb073af 100644
> > > > --- a/hw/arm/virt.c
> > > > +++ b/hw/arm/virt.c
> > > > @@ -1672,6 +1672,26 @@ static void finalize_gic_version(VirtMachineState *vms)
> > > >      }
> > > >  }
> > > >
> > > > +static void virt_cpu_post_init(VirtMachineState *vms)
> > > > +{
> > > > +    bool aarch64;
> > > > +
> > > > +    aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> > > > +
> > > > +    if (!kvm_enabled()) {
> > > > +        if (aarch64 && vms->highmem) {
> > > > +            int requested_pa_size = 64 - clz64(vms->highest_gpa);
> > > > +            int pamax = arm_pamax(ARM_CPU(first_cpu));
> > > > +
> > > > +            if (pamax < requested_pa_size) {
> > > > +                error_report("VCPU supports less PA bits (%d) than requested "
> > > > +                            "by the memory map (%d)", pamax, requested_pa_size);
> > > > +                exit(1);
> > > > +            }
> > > > +        }
> > > > +     }
> > > > +}
> > > > +
> > > >  static void machvirt_init(MachineState *machine)
> > > >  {
> > > >      VirtMachineState *vms = VIRT_MACHINE(machine);
> > > > @@ -1890,22 +1910,6 @@ static void machvirt_init(MachineState *machine)
> > > >      fdt_add_timer_nodes(vms);
> > > >      fdt_add_cpu_nodes(vms);
> > > >
> > > > -   if (!kvm_enabled()) {
> > > > -        ARMCPU *cpu = ARM_CPU(first_cpu);
> > > > -        bool aarch64 = object_property_get_bool(OBJECT(cpu), "aarch64", NULL);
> > > > -
> > > > -        if (aarch64 && vms->highmem) {
> > > > -            int requested_pa_size, pamax = arm_pamax(cpu);
> > > > -
> > > > -            requested_pa_size = 64 - clz64(vms->highest_gpa);
> > > > -            if (pamax < requested_pa_size) {
> > > > -                error_report("VCPU supports less PA bits (%d) than requested "
> > > > -                            "by the memory map (%d)", pamax, requested_pa_size);
> > > > -                exit(1);
> > > > -            }
> > > > -        }
> > > > -    }
> > > > -
> > > >      memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
> > > >                                  machine->ram);
> > > >      if (machine->device_memory) {
> > > > @@ -1917,6 +1921,8 @@ static void machvirt_init(MachineState *machine)
> > > >
> > > >      create_gic(vms);
> > > >
> > > > +    virt_cpu_post_init(vms);
> > > > +
> > > >      fdt_add_pmu_nodes(vms);
> > > >
> > > >      create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > >
> >
>
