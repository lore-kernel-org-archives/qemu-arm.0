Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp447447lfc;
        Wed, 3 Jun 2020 05:16:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw22uqYqQXRRc4uYBgLpmp4k0/PE87xNrWWOr5da4Z3qleAaEiUkyU3G62ympXfIFw3Rzqh
X-Received: by 2002:a25:ac8:: with SMTP id 191mr49070494ybk.390.1591186595098;
        Wed, 03 Jun 2020 05:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591186595; cv=none;
        d=google.com; s=arc-20160816;
        b=kpADOF2AffyZSOc2bEeqcNpQQh2cC//MmT/lhW9V2SmXPa0jmandDO+sDXquMplGXv
         1mD3YMzx+n/xE6q8IlGDJkbONEQiuEBCPQSGXIwwHfXHggoE851csnzkYXYy+Dr6/DlW
         VMXjel7sTu5SxGjG0ofq2v52O5BaYRcGfI1B5J0ELS50EAh/VYq57mNM9GXG5ItKKc2P
         obCkFpn8c855DvD9bImgRaCbs0FsEoWR7bHxDTWLmaxf7EcNYMjRVeh9TEqsP7BWE38r
         JZH9r/6nOp7adYt3Pf4PIMZicBdeuqFDX+z01KmKy+E62e4z+d/IRqPnPUW68xhReQXB
         HeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hoHEzGpH6bSPhWfRRXOU8VlmxhtKDd7jGf7vq6j+uno=;
        b=GiSReS7d0zIvm0Q/hAPVE+3rS8NUfwJwBtBwgzolsOYx3QVOGPyIIlf2pSNw+0HHI3
         uUrjnvEnXiaOVGmz7F2ty0oyVm7c15juWrxkLiGXsmliU5zyIEkqK6KhBoV2bQPT249P
         FxRM9RN2KpxzxTGYo8IoXgii15kLyV8rA5KORCJXVQbO9oM+LVrDLPiMMFdkvr+2iogj
         EuFxgDY24JnCMMJP+JWdeggGsiz46zBw7zsrwOMQrghUz+SMRExbRVT8eERs2/8zxR2x
         rVy3xQrqDyrhbYzlX919SsZmMiluH8KhyqIZFnmAcRWPIB3qNSBmD5GjYY3twLit1zwp
         IXqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rj5A0rkI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p131si1554711ybg.301.2020.06.03.05.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 05:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Rj5A0rkI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgSJu-0004T7-Ct
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 08:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgSJm-0004Qq-Cg
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 08:16:26 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35750
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgSJj-0001T2-8N
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 08:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591186581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hoHEzGpH6bSPhWfRRXOU8VlmxhtKDd7jGf7vq6j+uno=;
 b=Rj5A0rkI5Xx9LAx2G/WXiGcKKNCpqA+BfR3gDNSmt6KcH12fIZcYzJCMQmbUpPFHifHZnY
 G5heYxdADRgcGTYxgV99GHQGH6zylMTxcSA3vsnJA7w+W+3UI+uOFmnJWVL9xBpFuO1LAT
 aTWHN6X4IdoGLvZdR6G5RJvwqrnrJTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-8kYjKiyXPw29hQKfAmISjw-1; Wed, 03 Jun 2020 08:16:19 -0400
X-MC-Unique: 8kYjKiyXPw29hQKfAmISjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DBB108BD09;
 Wed,  3 Jun 2020 12:16:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.196.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB671579A3;
 Wed,  3 Jun 2020 12:16:08 +0000 (UTC)
Date: Wed, 3 Jun 2020 14:16:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Message-ID: <20200603121606.bj3mjlqsstzbu7py@kamzik.brq.redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <6bacdd359e504ed8924e67ed125bf15d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6bacdd359e504ed8924e67ed125bf15d@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYrOPiDquMwh

On Wed, Jun 03, 2020 at 11:45:22AM +0000, Salil Mehta wrote:
> Hi Andrew,
> Many thanks for the reply.
> 
> > From: Andrew Jones [mailto:drjones@redhat.com]
> > Sent: Wednesday, June 3, 2020 10:38 AM
> > To: Salil Mehta <salil.mehta@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; Peter Maydell
> > <peter.maydell@linaro.org>; Igor Mammedov <imammedo@redhat.com>;
> > mst@redhat.com
> > Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
> > VCPUs
> > 
> > On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
> > > Hello,
> > > I could see below within function fdt_add_pmu_nodes() part of
> > > hw/arm/virt.c during virt machine initialization time:
> > >
> > > Observation:
> > > In below function, support of PMU feature is being checked for
> > > each vcpu and if the PMU is found part of the features then PMU
> > > is initialized with in the host/KVM. But if there is even one
> > > vcpu which is found to not support the PMU then loop is exited
> > > and PMU is not initialized for the rest of the vcpus as well.
> > >
> > > Questions:
> > > Q1. Not sure what is the logic of the premature exit and not
> > >     continuing with further checks and initialization of other
> > >     VCPU PMUs?
> > 
> > KVM requires all VCPUs to have a PMU if one does. If the ARM ARM
> > says it's possible to have PMUs for only some CPUs, then, for TCG,
> > the restriction could be relaxed. I expect it will take more than
> > just removing the check for things to work though.
> 
> Got it. Many thanks for this info.
> 
> During virt machine init we take cpu type from (-cpu <cpu-type>)
> option and it should apply evenly to all of the vcpus. Therefore,
> I can assume all of the processors to be identical for now. This
> combined with the KVM restriction you mentioned above means for
> PMU we could only have Enable-for-All OR Enable-for-none config
> for all of the vcpus being booted even though we at different
> places do have per-vcpu specific check like below available
> 
> /* MADT */
> static void
> build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> {
> [...]
> 
>     for (i = 0; i < vms->smp_cpus; i++) {
>         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                            sizeof(*gicc));
>         [...]
> 
>         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {---> This check
>             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>         }
>  [...]
> }
> 
> Do per-vcpu feature check for PMU even makes sense till we allow
> heterogeneous support of processors or relax the PMU enablement
> on the per-vcpu basis within the KVM?

It may not be necessary now or ever to test more than one CPU for the
PMU feature, but without a good reason to change it to a machine
property then I'd prefer we always to the N-1 pointless checks. The
feature is a CPU feature, not a machine feature, so, IMO, it should
remain something configured and tested at the CPU level, not the machine
level.

> 
> 
> 
> > 
> > > Q2. Does it even makes sense to have PMUs initialized for some
> > >     vcpus and not for others unless we have heterogeneous system?
> > 
> > I don't know, but it doesn't sound like a configuration I'd like
> > to see.
> 
> 
> sure. but in the existing code we do prematurely exit after we
> discover first vcpu amongst the possible vcpus not supporting
> PMU feature. This looks abnormal as well?

Are you trying to configure heterogeneous mach-virt machines? Or machines
that only provide PMUs to some CPUs? If not, then I'm not sure why this
would be a problem. Indeed it's likely a pointless check and, instead of
silently returning, it should output a warning or even assert. Otherwise,
I don't see a problem with it, since we want to be sure we're dealing with
the type of configuration we expect, i.e. one where each CPU has a PMU if
any CPU has a PMU.

Thanks,
drew

