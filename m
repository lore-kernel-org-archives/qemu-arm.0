Received: by 10.80.166.35 with SMTP id d32csp207278edc;
        Tue, 25 Oct 2016 23:54:35 -0700 (PDT)
X-Received: by 10.55.159.140 with SMTP id i134mr45447qke.172.1477464875185;
        Tue, 25 Oct 2016 23:54:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si433184qtm.110.2016.10.25.23.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzI6c-0000IL-M9
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 02:54:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bzI6Y-0000HI-N2
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 02:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bzI6V-0004Iy-Jn
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 02:54:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36528)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bzI6V-0004Iq-BT; Wed, 26 Oct 2016 02:54:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77AA7C00B70E;
	Wed, 26 Oct 2016 06:54:26 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-70.brq.redhat.com [10.40.204.70])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9Q6sM5J015894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 02:54:24 -0400
Date: Wed, 26 Oct 2016 08:54:22 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20161026065422.dtyd5n56lsvlan74@hawk.localdomain>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<20161024084920.5qrrwa3wfdyr5kn5@hawk.localdomain>
	<155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
	<20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
	<CAFEAcA_xEd9ic-s+R8Fp8WrbwC1cF4Tf3+7_MM_21CF3RhyOmg@mail.gmail.com>
	<e695dbbb-8f9f-695d-1403-4cd1a1c649a8@redhat.com>
	<20161025175615.jhkf236jvgiywg3q@kamzik.brq.redhat.com>
	<b2fe2a33-a7cb-d051-7a3f-95f92a9a8b22@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2fe2a33-a7cb-d051-7a3f-95f92a9a8b22@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 26 Oct 2016 06:54:26 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NnuvRMWf2N5H

On Tue, Oct 25, 2016 at 01:50:01PM -0500, Wei Huang wrote:
> 
> 
> On 10/25/2016 12:56 PM, Andrew Jones wrote:
> <snip>
> >>
> >> Compared with V7, my proposed solution above isn't so different as we
> >> thought. Details below. In V7,
> >>
> >> * has_pmu=off by default. It is turned on in target-arm/cpu.c (see
> >> below). Apparently it is turned on only under KVM mode; UNDER TCG, IT
> >> REMAINS OFF.
> >>
> >>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU) && kvm_enabled()) {
> >>         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
> >>                                  &error_abort);
> >>     }
> >> * We then remove ARM_FEATURE_PMU if has_pmu=off. The rest of code will
> >> know if PMU is on/off using arm_feature(&cpu->env, ARM_FEATURE_PMU).
> >>
> >> With this implementation, V7 can
> >> * disable PMU under TCG mode
> >> * print out an error when "pmu=on|off" property is specified under TCG.
> >>
> >> Drew didn't like it, he wanted a warning when "pmu=on", and didn't want
> >> it when "pmu=off". This is fair. To do that, we need to add
> >> arm_cpu_has_pmu_property for both KVM and TCG. But, in this case,
> >> printing a warning message only for "pmu=on" isn't possible without
> >> tri-state, because we can't tell if pmu is on by default OR turned on by
> >> users using ",pmu=on".
> >>
> >> To solve this problem, in my proposed solution above, we still add
> >> arm_cpu_has_pmu_property under TCG, but turned it off (see below).
> >>
> >>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> >>         qdev_property_add_static(DEVICE(obj),
> >>             &arm_cpu_has_pmu_property, &error_abort);
> >>         if (!kvm_enabled())
> >>             object_property_set_bool(obj, false, "pmu", NULL);
> >>     }
> >>
> >> Because has_pmu=off now, we remove ARM_FEATURE_PMU under TCG. THIS IS
> >> SAME AS V7. If pmu=on is detected later, we know end-users turn it on
> >> intentionally and can flag a warning message. With this approach, we can:
> >> * disable PMU under TCG mode
> >> * print a warning when ",pmu=on" is specified; it remains silent under
> >> other cases.
> >>
> >> I think removing tri-state and printing out a warning only for ",pmu=on"
> >> contradict each other. We need some trick to solve this problem. The
> >> proposed solution didn't change the behavior underfoot as it might sound
> >> like. If you have other suggestion, I want to know the details.
> >>
> > 
> > I'm a bit lost as to which proposal is which now, but what I didn't like
> > was QEMU failing to run with TCG when the same command line worked for
> > KVM. If the property doesn't exist when using TCG then QEMU fails when a
> > command line including ,pmu=on/off is used.
> > 
> > Peter says he's not worried about the PMU not working for TCG right now,
> > and thus isn't worried about warning that it doesn't work. I'm not sure
> > if he was proposing to keep your v7 - fail for tcg when the property was
> > used, or if he was proposing to just not worry about the property for tcg.
> > I believe the later case would be the proposed change to v7, but without
> > any warning.
> 
> I think Peter means the later case, which requires a fix to v7. It will
> keep the same command line for both TCG and KVM; but TCG will ignore
> silently without a warning when ",pmu=on".
> 
> > 
> > Anyway, whatever you guys work out is fine by me. I can live with changing
> > the command line between KVM and TCG runs. Eventually I won't have to when
> > PMU support comes to TCG. I'm also fine with ,pmu=on silently not actually
> > providing a PMU when run under TCG. It's like Peter says, many things
> 
> I prefer the second 2nd one. If you are OK, I will send in a new spin (V8).

Works for me.


> 
> > under TCG don't work, but none of them warn about it. Only, in this case,
> > I feel a warning for ,pmu=on would be better, because the feature would be
> > getting asked for explicitly.
> > 
> > Thanks,
> > drew
> > 
> 
