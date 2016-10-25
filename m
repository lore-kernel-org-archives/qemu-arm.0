Received: by 10.80.166.35 with SMTP id d32csp3043121edc;
        Tue, 25 Oct 2016 00:33:40 -0700 (PDT)
X-Received: by 10.237.43.163 with SMTP id e32mr18360802qtd.158.1477380820026;
        Tue, 25 Oct 2016 00:33:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u78si11039019qku.191.2016.10.25.00.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 00:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bywEt-0005cK-GX
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 03:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bywEp-0005cA-SE
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 03:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bywEm-0006Yc-Pb
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 03:33:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bywEm-0006YL-KF; Tue, 25 Oct 2016 03:33:32 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8055C85365;
	Tue, 25 Oct 2016 07:33:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9P7XRbw007567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 25 Oct 2016 03:33:29 -0400
Date: Tue, 25 Oct 2016 09:33:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<20161024084920.5qrrwa3wfdyr5kn5@hawk.localdomain>
	<155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 25 Oct 2016 07:33:31 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	abologna@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 60tIwjY7LwfQ

On Mon, Oct 24, 2016 at 11:39:59PM -0500, Wei Huang wrote:
> >> V6->V7:
> >>   * change has_pmu variable type from OnOffAuto to Boolean
> >>   * only add "pmu" property to CPU under kvm mode, default ON
> > 
> > Hmm, if we don't allow the property with TCG then switching a guest from
> > KVM to TCG will require more than just an accelerator switch. That's a
> > bit annoying and I think we'd have to teach it to libvirt too. I'd prefer
> > 
> >  -M virt-2.8,accel=tcg -cpu cortex-a57         NO     NO
> >  -M virt-2.8,accel=tcg -cpu cortex-a57,pmu=off NO     NO
> >  -M virt-2.8,accel=tcg -cpu cortex-a57,pmu=on  NO     "Warning: PMU not
> > yet supported with TCG" (or something)
> 
> I am fine with this request. But note that, if we enforce
> pmu-default=ON, we can't tell "-cpu cortex-a57" apart from
> "cortex-a57,pmu=on", implying that we have to print the warning msg for
> the case of "cortex-a57" as well (this was why we switch to tri-state
> before). To solve this problem, we have to switch from pmu-default=ON to
> pmu-default=OFF under TCG mode, something like:
> 
>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>         qdev_property_add_static(DEVICE(obj),
>             &arm_cpu_has_pmu_property, &error_abort);
>         if (!kvm_enabled())
>             object_property_set_bool(obj, false, "pmu", NULL);
>     }
> 
> Then we do:
>     if (cpu->has_pmu && !kvm_enabled()) {
>         cpu->has_pmu = false;
>         if (!pmu_warned && !qtest_enabled()) {
>             error_report("warning: pmu not supported under TCG");
>             pmu_warned = true;
>         }
>     }
> 
> This will work. Are you and Peter OK with this solution?
>

Yes, I prefer it to not being able to easily switch a command line from
KVM to TCG. Granted, right now we mostly need to run with -cpu host for
KVM, which also needs to be switched for TCG. However that will hopefully
change with Shannon's work.

Thanks,
drew
