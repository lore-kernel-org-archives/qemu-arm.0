Received: by 10.80.166.35 with SMTP id d32csp3324432edc;
        Tue, 25 Oct 2016 10:57:24 -0700 (PDT)
X-Received: by 10.176.65.133 with SMTP id 5mr8229653uap.144.1477418244516;
        Tue, 25 Oct 2016 10:57:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f66si8229120vkc.176.2016.10.25.10.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 10:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz5yV-0003cL-P9
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 13:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bz5xY-0002s8-4Q
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bz5xU-0002RA-Qy
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 13:56:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51226)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bz5xU-0002R2-KQ; Tue, 25 Oct 2016 13:56:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4959B121A81;
	Tue, 25 Oct 2016 17:56:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9PHuFer008154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 25 Oct 2016 13:56:17 -0400
Date: Tue, 25 Oct 2016 19:56:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20161025175615.jhkf236jvgiywg3q@kamzik.brq.redhat.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<20161024084920.5qrrwa3wfdyr5kn5@hawk.localdomain>
	<155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
	<20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
	<CAFEAcA_xEd9ic-s+R8Fp8WrbwC1cF4Tf3+7_MM_21CF3RhyOmg@mail.gmail.com>
	<e695dbbb-8f9f-695d-1403-4cd1a1c649a8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e695dbbb-8f9f-695d-1403-4cd1a1c649a8@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 25 Oct 2016 17:56:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V7 0/2] Add option to configure
 guest vPMU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NAeUEoVSLt9F

On Tue, Oct 25, 2016 at 11:55:05AM -0500, Wei Huang wrote:
> 
> 
> On 10/25/2016 10:26 AM, Peter Maydell wrote:
> > On 25 October 2016 at 08:33, Andrew Jones <drjones@redhat.com> wrote:
> >> On Mon, Oct 24, 2016 at 11:39:59PM -0500, Wei Huang wrote:
> >>>>> V6->V7:
> >>>>>   * change has_pmu variable type from OnOffAuto to Boolean
> >>>>>   * only add "pmu" property to CPU under kvm mode, default ON
> >>>>
> >>>> Hmm, if we don't allow the property with TCG then switching a guest from
> >>>> KVM to TCG will require more than just an accelerator switch. That's a
> >>>> bit annoying and I think we'd have to teach it to libvirt too. I'd prefer
> >>>>
> >>>>  -M virt-2.8,accel=tcg -cpu cortex-a57         NO     NO
> >>>>  -M virt-2.8,accel=tcg -cpu cortex-a57,pmu=off NO     NO
> >>>>  -M virt-2.8,accel=tcg -cpu cortex-a57,pmu=on  NO     "Warning: PMU not
> >>>> yet supported with TCG" (or something)
> >>>
> >>> I am fine with this request. But note that, if we enforce
> >>> pmu-default=ON, we can't tell "-cpu cortex-a57" apart from
> >>> "cortex-a57,pmu=on", implying that we have to print the warning msg for
> >>> the case of "cortex-a57" as well (this was why we switch to tri-state
> >>> before). To solve this problem, we have to switch from pmu-default=ON to
> >>> pmu-default=OFF under TCG mode, something like:
> >>>
> >>>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> >>>         qdev_property_add_static(DEVICE(obj),
> >>>             &arm_cpu_has_pmu_property, &error_abort);
> >>>         if (!kvm_enabled())
> >>>             object_property_set_bool(obj, false, "pmu", NULL);
> >>>     }
> >>>
> >>> Then we do:
> >>>     if (cpu->has_pmu && !kvm_enabled()) {
> >>>         cpu->has_pmu = false;
> >>>         if (!pmu_warned && !qtest_enabled()) {
> >>>             error_report("warning: pmu not supported under TCG");
> >>>             pmu_warned = true;
> >>>         }
> >>>     }
> >>>
> >>> This will work. Are you and Peter OK with this solution?
> >>>
> >>
> >> Yes, I prefer it to not being able to easily switch a command line from
> >> KVM to TCG. Granted, right now we mostly need to run with -cpu host for
> >> KVM, which also needs to be switched for TCG. However that will hopefully
> >> change with Shannon's work.
> > 
> > If the TCG default is different from the KVM default then you
> > will have problems with switching it anyway, because it will
> > silently change behaviour underfoot. I think we should avoid that...
> 
> Compared with V7, my proposed solution above isn't so different as we
> thought. Details below. In V7,
> 
> * has_pmu=off by default. It is turned on in target-arm/cpu.c (see
> below). Apparently it is turned on only under KVM mode; UNDER TCG, IT
> REMAINS OFF.
> 
>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU) && kvm_enabled()) {
>         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
>                                  &error_abort);
>     }
> * We then remove ARM_FEATURE_PMU if has_pmu=off. The rest of code will
> know if PMU is on/off using arm_feature(&cpu->env, ARM_FEATURE_PMU).
> 
> With this implementation, V7 can
> * disable PMU under TCG mode
> * print out an error when "pmu=on|off" property is specified under TCG.
> 
> Drew didn't like it, he wanted a warning when "pmu=on", and didn't want
> it when "pmu=off". This is fair. To do that, we need to add
> arm_cpu_has_pmu_property for both KVM and TCG. But, in this case,
> printing a warning message only for "pmu=on" isn't possible without
> tri-state, because we can't tell if pmu is on by default OR turned on by
> users using ",pmu=on".
> 
> To solve this problem, in my proposed solution above, we still add
> arm_cpu_has_pmu_property under TCG, but turned it off (see below).
> 
>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>         qdev_property_add_static(DEVICE(obj),
>             &arm_cpu_has_pmu_property, &error_abort);
>         if (!kvm_enabled())
>             object_property_set_bool(obj, false, "pmu", NULL);
>     }
> 
> Because has_pmu=off now, we remove ARM_FEATURE_PMU under TCG. THIS IS
> SAME AS V7. If pmu=on is detected later, we know end-users turn it on
> intentionally and can flag a warning message. With this approach, we can:
> * disable PMU under TCG mode
> * print a warning when ",pmu=on" is specified; it remains silent under
> other cases.
> 
> I think removing tri-state and printing out a warning only for ",pmu=on"
> contradict each other. We need some trick to solve this problem. The
> proposed solution didn't change the behavior underfoot as it might sound
> like. If you have other suggestion, I want to know the details.
>

I'm a bit lost as to which proposal is which now, but what I didn't like
was QEMU failing to run with TCG when the same command line worked for
KVM. If the property doesn't exist when using TCG then QEMU fails when a
command line including ,pmu=on/off is used.

Peter says he's not worried about the PMU not working for TCG right now,
and thus isn't worried about warning that it doesn't work. I'm not sure
if he was proposing to keep your v7 - fail for tcg when the property was
used, or if he was proposing to just not worry about the property for tcg.
I believe the later case would be the proposed change to v7, but without
any warning.

Anyway, whatever you guys work out is fine by me. I can live with changing
the command line between KVM and TCG runs. Eventually I won't have to when
PMU support comes to TCG. I'm also fine with ,pmu=on silently not actually
providing a PMU when run under TCG. It's like Peter says, many things
under TCG don't work, but none of them warn about it. Only, in this case,
I feel a warning for ,pmu=on would be better, because the feature would be
getting asked for explicitly.

Thanks,
drew
