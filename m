Received: by 10.25.44.15 with SMTP id s15csp5931360lfs;
        Tue, 18 Jul 2017 05:39:03 -0700 (PDT)
X-Received: by 10.55.187.134 with SMTP id l128mr1799866qkf.90.1500381542973;
        Tue, 18 Jul 2017 05:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500381542; cv=none;
        d=google.com; s=arc-20160816;
        b=QxDgJrcJDpUwjekv8EJ4Ixj1EY5O2zIAhE395IYAAhdqS6RFAW4JVxoJFdacUUIX0x
         IfGFZAYL5C21Q4t2OeIXowvFNoevB+6FUoXVaoeRZQNP+jHoWgGPsHURWBk7ksXFROMe
         tdXq4YTl+X4b9bl0AmuZe1b+rCveQ86Z8zlMXikdHSTFcSbn/fL9U3f58JDuVeVdEUX7
         xqrAq/oDCtSYaUzgXL6e5GI+FzaOf0VQ90FV+NGTNB4fcHfhY9nfvBTD5br2Gf1hT2oc
         XxyQbGOLHNw8D1qkZrYISdgoJikF0hzQG4paj6QLAyEhmkKFZw4NSfzzRcpjNA9EcY1R
         mM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=MEikWSjLDiplRSBRMf+q7356so7yrvm7fHwNO+DFQU8=;
        b=L84TjOWYNhNZur5Q0cibN2c+iAywnItEQDV8n2JgSx3zowzSvSw69Rn0m97OtTr7Vc
         5UbcvKfSBli0mNfxP8+yu91eIOsYt+Zm+Mc/+haiiZbV/ggIPrVq163z+7ahEG2rqpV6
         SoGljD5Kr7ma1pXMGt/FK30ZjVD+8ugmtSdHHM5VL5KpYWjEgWlR7RO8RCQ7Oy5XhsF9
         tzt+N9Iv/AxLAB1t9CTZgbiO2nlzvz0MxdR26nVeQ4QOWE09X0llqfJMAYKwG9YQ37bF
         HzITWX9wtyv+kOQNo+xRzR2EYFOSAg5GzHJoIBxwo6nvg5c1XT+15XD87J/K7cVnoECP
         vzVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x188si1994841qkc.108.2017.07.18.05.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Jul 2017 05:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXRmG-00066V-8h
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 08:39:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXRmA-00063s-7L
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 08:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dXRm6-0003Kl-Ak
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 08:38:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dXRm6-0003Kd-4V; Tue, 18 Jul 2017 08:38:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 893DC5D68D;
	Tue, 18 Jul 2017 12:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 893DC5D68D
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 893DC5D68D
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6B77EF69;
	Tue, 18 Jul 2017 12:38:47 +0000 (UTC)
Date: Tue, 18 Jul 2017 14:38:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170718123845.c2g3t4m4pyqofk2l@kamzik.brq.redhat.com>
References: <1498927637-14496-1-git-send-email-drjones@redhat.com>
	<1498927637-14496-3-git-send-email-drjones@redhat.com>
	<CAFEAcA-CQm1FuF7eyveSbSchRD1PkB-PDVNyMQhVny+bmWWAvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-CQm1FuF7eyveSbSchRD1PkB-PDVNyMQhVny+bmWWAvg@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 18 Jul 2017 12:38:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] target/arm/kvm: split pmu
 init from creation
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S8ZKGikHPlMF

On Mon, Jul 10, 2017 at 04:27:35PM +0100, Peter Maydell wrote:
> On 1 July 2017 at 17:47, Andrew Jones <drjones@redhat.com> wrote:
> > When adding a PMU with a userspace irqchip we only do the INIT
> > stage of the device creation.
> 
> Can you explain why? My assumption would be that either
> (a) we don't need the kernel's PMU, in which case don't
> create it at all, or
> (b) we do need the kernel's PMU, so we should both create
> and INIT it.
> 
> If we do one but not the other then we've left a half
> created and unusable PMU device in the kernel, haven't we?
>

I should have renamed the 'create' function to 'set_irq', then
it would make sense, because after the split done by this patch
'create' only sets the irq, which can only be done with an
in-kernel irqchip. Both irqchip types still require INIT though,
see kernel doc Documentation/virtual/kvm/devices/vcpu.txt.

I'll send a v2 that renames the create function. But, before I do,
assuming the rename, do you have another comments on this or the
next patch? We might as well batch all the changes :-)

Thanks,
drew
