Received: by 10.80.166.35 with SMTP id d32csp1129570edc;
        Tue, 18 Oct 2016 11:13:20 -0700 (PDT)
X-Received: by 10.55.212.221 with SMTP id s90mr2056336qks.169.1476814400480;
        Tue, 18 Oct 2016 11:13:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i32si21709606qte.149.2016.10.18.11.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 11:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwYt5-0005br-Hw
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 14:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwYt0-0005bQ-4X
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:13:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwYsz-0000OC-CK
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:13:14 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwYsz-0000Ns-79
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:13:13 -0400
Received: by mail-vk0-x231.google.com with SMTP id b186so2506914vkb.1
	for <qemu-arm@nongnu.org>; Tue, 18 Oct 2016 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zd4BWFDass/4dmj6yEd61HGWQ+urUvuxuV8abB3En+Y=;
	b=eeYgj1v17O/YDtl8IN+V42TXcCppMyWF7PU9LFeUIJJZNLIqtddeWjwcyrs6xaXtLg
	vh/mSXd31xGX0iefixSLqi2tWDiGdB8OVmiib9FFuXLPYv5Gee5CtmKjYH5vej6gcPKR
	K0GaxD+kzi1iCpVJWKHHnIxYiaosi57UaTUTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zd4BWFDass/4dmj6yEd61HGWQ+urUvuxuV8abB3En+Y=;
	b=JGS3WcXNchQd1chGCwH5igjcyNwsbK3o0twEj+hEZMeybiBXZL4t1bYIBCKkYgitIf
	B25jdOkOCuJXIaZiqEawbaHMvvjjpTkSx+lEPceT9caAVdZQrIvuoDbgQy/2do1P9DD9
	+6OXFuEc5W9kHuGzf9i2tZXB1PqNbejoHe6qbcBWm8nbi+Xx5Tln4fk9ACRk+QbnhVUr
	FHfg+/TE2ZNs5Z8ewUFwyPnq5wDh2wpFhj0wW2rATX0tnvAs06UhtT6XDibivm6bGvB1
	vI+dGU0ExQMtmQYqNRKNiGsGeCK1/H5veqj6g+AFywYNHKvO7O8Phx/Iooip0WLoj5AQ
	DHxA==
X-Gm-Message-State: AA6/9Rm68Zn7HikIqW6Bph1JBRBFZtJWYZZl0mNDZrL3EwcXWVuUZaAIh/ZqXISSTwpX/8QqIcnl6EHDAoIdc4up
X-Received: by 10.31.64.75 with SMTP id n72mr1708048vka.170.1476814392514;
	Tue, 18 Oct 2016 11:13:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 18 Oct 2016 11:12:51 -0700 (PDT)
In-Reply-To: <20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 19:12:51 +0100
Message-ID: <CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
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
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3FniWb9PPenr

On 18 October 2016 at 18:57, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Oct 18, 2016 at 06:07:49PM +0100, Peter Maydell wrote:
>> Why do you want to un-property mp_affinity? Eventually it would
>> be nice for the machine model to be able to use it to set up
>> a specific NUMA configuration.
>
> I thought about that, but I think we'll want to specify machine
> properties; nr_sockets, nr_cores, nr_threads and use the -device
> command line for the cpu to specify which socket, which core,
> which thread it is. This would be consistent with other architectures
> and easily map to the MPIDR & cpu topology hardware descriptions.

I was thinking more about "modelling board X, which we know
always has 2xA53 and 4xA57 with these MPIDRs".

We actually have a concrete instance in the tree at the moment:
the raspberry pi 2. Specifically hw/arm/bcm2836.c sets the
mp_affinity for each cpu to 0xF00 | n (where n is the CPUID).
Currently it's doing that by reaching in and messing with
the mp_affinity field directly, but really it ought to be
doing it by setting a property on the CPU, and what it
wants isn't somethnig that can be expressed with a simple
nr_sockets/nr_cores/etc scheme.

> Anyway, atm, I don't know of any reason to have the property user-
> settable, so it seems safest to keep it hidden until we decide.

I agree that it doesn't make sense to let the user mess with it,
but it should be available for the board code to read and write.

thanks
-- PMM
