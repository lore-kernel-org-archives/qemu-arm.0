Received: by 10.80.166.35 with SMTP id d32csp1100827edc;
        Tue, 18 Oct 2016 10:08:32 -0700 (PDT)
X-Received: by 10.237.33.147 with SMTP id l19mr1530488qtc.58.1476810512067;
        Tue, 18 Oct 2016 10:08:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e19si929547qkh.234.2016.10.18.10.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 10:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwXsN-0002qZ-3B
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 13:08:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwXs3-0002iF-V8
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwXs3-00074g-3d
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:08:11 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwXs2-00074N-VR
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:08:11 -0400
Received: by mail-vk0-x230.google.com with SMTP id b186so227186258vkb.1
	for <qemu-arm@nongnu.org>; Tue, 18 Oct 2016 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jqSe+eL5BgpttSwwL46wXa5CwnNj3PDlMLHZ1FXKTzk=;
	b=IFuLk65VqJ7NGu+6B+yWtYV1p9SIXl47u5LmypaO1hFGvo6ANewpQ0fYz3ydfhhmiX
	yo9nARGjHm9/N7M6WUjizCQgTms+e5Xnz99vethhJvikfB+9WN7SQDd8ZQkfQqxDN+Gu
	sEAIEGNJ9xQ12hMjOCp0Qn0qEbi2Cc3c6Gbo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jqSe+eL5BgpttSwwL46wXa5CwnNj3PDlMLHZ1FXKTzk=;
	b=lZANFf8DBnM7o62M8b9kQrbbkCQlm68RcKj+dWDtHrNSlQCn3rFNkY+72lu2qmME8I
	ZnbtO14AH/P2tMDHWXId0HGf/SQ1zCHpcC3TYvO6qYcnpy9izFlJV7FFf2e0liMa5694
	GhCBNzLvfj2k26BsDuy0kK9ov2cECO0HVEsWDmoqBLxMGCsnU/lT5YSOFhOrchugaz53
	myNFrcdkXvl4wcRMjKTJfxO1wuyH/hDiYaaz1ByOKB5OF8nMyhbEU7yLzNHKt+woUnsF
	IhY2qXOGoS/rJjVIEbOmO7oNnq7+DBFOK8n3qNbP6t+jG/kGFIoePgutIk3PPu2tTObP
	/eBg==
X-Gm-Message-State: AA6/9RnWOcOSucZfP7frc/5C3nZB4oaA8U7JsA6DYL4A+pFRunR6eR2R6M44ZuEeca3dreZhUUWrcu80ofpBmEpa
X-Received: by 10.31.16.73 with SMTP id g70mr1620458vki.175.1476810490203;
	Tue, 18 Oct 2016 10:08:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 18 Oct 2016 10:07:49 -0700 (PDT)
In-Reply-To: <20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 18:07:49 +0100
Message-ID: <CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] exec: rename
 cpu_exec_init() as cpu_exec_realizefn()
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cshDEW3KO1h/

On 18 October 2016 at 17:22, Andrew Jones <drjones@redhat.com> wrote:
> I'll note that it's
> accepted to reach into machine state through current_machine from
> the machine's devices.

That doesn't sound like a great idea to me -- where do we
do it? A quick grep for uses of current_machine in hw/ shows only
hw/ppc/spapr_rtas.c, which is a bit of a weirdo thing because
it's the implementation of a bunch of hypercalls, not an actual
device.

We have lots of code currently in devices that looks at bits
of overall state that it should ideally not (but which it can
because we have a lot of global variables). In an ideal world
we'd clean these up so that the devices were initialized with
suitable properties instead to tell them about this global state.

>> > I considered that, but if we un-property ARMCPU->mp_affinity, then where
>> > can it be initialized to "MP_AFFINITY_INVALID", which would be ff000000?
>>
>> Property defaults are normally initialized on instance_init.
>
> OK, so after this series goes through we can un-property mp_affinity and
> add an mp_affinity initialization back to arm_cpu_initfn, but one that
> only sets the initial invalid value.

Note that mp_affinity is a bit awkward because for KVM we can't
get the right values out of the kernel until quite late (when
kvm_init_vcpu() is called).

Why do you want to un-property mp_affinity? Eventually it would
be nice for the machine model to be able to use it to set up
a specific NUMA configuration.

thanks
-- PMM
