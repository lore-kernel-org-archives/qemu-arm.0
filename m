Received: by 10.80.166.35 with SMTP id d32csp3254647edc;
        Tue, 25 Oct 2016 08:26:33 -0700 (PDT)
X-Received: by 10.55.99.202 with SMTP id x193mr22863048qkb.62.1477409193338;
        Tue, 25 Oct 2016 08:26:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n55si13807099qta.59.2016.10.25.08.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 08:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bz3cW-0005Qg-Kd
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 11:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz3cP-0005Nr-Up
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 11:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bz3cN-0001XI-ND
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 11:26:25 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bz3cN-0001Wl-Ij
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 11:26:23 -0400
Received: by mail-vk0-x22f.google.com with SMTP id b186so179714127vkb.1
	for <qemu-arm@nongnu.org>; Tue, 25 Oct 2016 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C4e7e8bqFyWVXx9eWBSNhC+7GeOKjqfj5nsss1lv0hc=;
	b=Tv52ysXMxposntmsOrlef768v2SH2W2GyNEuRLi1CJMo9aQ+jKJS6JxIr8EZBzJ5sn
	hp+/HfYOdysHRLQ5sl10t2UPFHqnh34SFW7DuFJlOONfO4U1oVyKfZSvjX6R6rI8G3Q5
	4rbTjQVNvhT3ztafoCSZ29D+/QLFmcslUTRWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C4e7e8bqFyWVXx9eWBSNhC+7GeOKjqfj5nsss1lv0hc=;
	b=KHUtbqJ2Bd8APv3OgPFax1bpV6hDBRzpxwbQXL9qivVf0iCPiJ5KU/ZZgmKdJMFmU5
	PyYfZnrcmd5umQ4+Rrn9IaeR81KsZDI7lmpup20sUQUYUx7QE5Vuboe1DEgyxFpfZFuV
	szxXAZjrLUkFbQEaI40RgkKrxzrKcdMbI/Iiuog11/Ey7rJr9NqpvEqH41Wr2IH07oFQ
	eh1ZWO+KtdF4c/69KWbGwkVOVMFgfuZWXOwjO9rvZzaKjaWetUtw09Vh28EtmMe0R2lN
	gZQjmvvrcdkCFyPBZueVpTeFa6pv8iNuCifYbAlGkB2cHRTFOZOQTmhgZdL2iIUEsRIc
	4X2g==
X-Gm-Message-State: ABUngvcWpH4kMg0end7bT09FDduH7zx1+DWBnzgnUbeCjHisL1+gSA5zACnhP4mfEHZ4HhbqKcLwA9rihnQ7lfip
X-Received: by 10.31.64.69 with SMTP id n66mr7669096vka.170.1477409182890;
	Tue, 25 Oct 2016 08:26:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 25 Oct 2016 08:26:02 -0700 (PDT)
In-Reply-To: <20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
References: <1477086782-10479-1-git-send-email-wei@redhat.com>
	<20161024084920.5qrrwa3wfdyr5kn5@hawk.localdomain>
	<155d69d3-c8fb-4ff1-7de9-ca72d4086ccb@redhat.com>
	<20161025073327.kbbabkrdsgfuypzt@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2016 16:26:02 +0100
Message-ID: <CAFEAcA_xEd9ic-s+R8Fp8WrbwC1cF4Tf3+7_MM_21CF3RhyOmg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ulkCLSq0h1CY

On 25 October 2016 at 08:33, Andrew Jones <drjones@redhat.com> wrote:
> On Mon, Oct 24, 2016 at 11:39:59PM -0500, Wei Huang wrote:
>> >> V6->V7:
>> >>   * change has_pmu variable type from OnOffAuto to Boolean
>> >>   * only add "pmu" property to CPU under kvm mode, default ON
>> >
>> > Hmm, if we don't allow the property with TCG then switching a guest from
>> > KVM to TCG will require more than just an accelerator switch. That's a
>> > bit annoying and I think we'd have to teach it to libvirt too. I'd prefer
>> >
>> >  -M virt-2.8,accel=tcg -cpu cortex-a57         NO     NO
>> >  -M virt-2.8,accel=tcg -cpu cortex-a57,pmu=off NO     NO
>> >  -M virt-2.8,accel=tcg -cpu cortex-a57,pmu=on  NO     "Warning: PMU not
>> > yet supported with TCG" (or something)
>>
>> I am fine with this request. But note that, if we enforce
>> pmu-default=ON, we can't tell "-cpu cortex-a57" apart from
>> "cortex-a57,pmu=on", implying that we have to print the warning msg for
>> the case of "cortex-a57" as well (this was why we switch to tri-state
>> before). To solve this problem, we have to switch from pmu-default=ON to
>> pmu-default=OFF under TCG mode, something like:
>>
>>     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>>         qdev_property_add_static(DEVICE(obj),
>>             &arm_cpu_has_pmu_property, &error_abort);
>>         if (!kvm_enabled())
>>             object_property_set_bool(obj, false, "pmu", NULL);
>>     }
>>
>> Then we do:
>>     if (cpu->has_pmu && !kvm_enabled()) {
>>         cpu->has_pmu = false;
>>         if (!pmu_warned && !qtest_enabled()) {
>>             error_report("warning: pmu not supported under TCG");
>>             pmu_warned = true;
>>         }
>>     }
>>
>> This will work. Are you and Peter OK with this solution?
>>
>
> Yes, I prefer it to not being able to easily switch a command line from
> KVM to TCG. Granted, right now we mostly need to run with -cpu host for
> KVM, which also needs to be switched for TCG. However that will hopefully
> change with Shannon's work.

If the TCG default is different from the KVM default then you
will have problems with switching it anyway, because it will
silently change behaviour underfoot. I think we should avoid that...

thanks
-- PMM
