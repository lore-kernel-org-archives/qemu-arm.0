Received: by 10.25.77.65 with SMTP id a62csp2532226lfb;
        Thu, 16 Feb 2017 07:52:07 -0800 (PST)
X-Received: by 10.237.43.167 with SMTP id e36mr2595239qtd.169.1487260326473;
        Thu, 16 Feb 2017 07:52:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l33si5483055qtl.327.2017.02.16.07.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Feb 2017 07:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceOLl-00042P-R2
	for alex.bennee@linaro.org; Thu, 16 Feb 2017 10:52:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ceNiS-0000ko-5o
	for qemu-devel@nongnu.org; Thu, 16 Feb 2017 10:11:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ceNiM-0007re-Hg
	for qemu-devel@nongnu.org; Thu, 16 Feb 2017 10:11:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45782)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ceNiI-0007mj-5J; Thu, 16 Feb 2017 10:11:18 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AA5D81227;
	Thu, 16 Feb 2017 15:11:18 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1GFBGIq009602; Thu, 16 Feb 2017 10:11:17 -0500
Date: Thu, 16 Feb 2017 16:11:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170216161114.220260cf@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA_NgmdDCfbPy+DnHQBmNGmQ4tj1z4ci+OP7+x4tHLLCxg@mail.gmail.com>
References: <1487253461-269218-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA_NgmdDCfbPy+DnHQBmNGmQ4tj1z4ci+OP7+x4tHLLCxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 16 Feb 2017 15:11:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: fix cpu object reference leak
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zPTzj83ZiUT6

On Thu, 16 Feb 2017 14:18:05 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 16 February 2017 at 13:57, Igor Mammedov <imammedo@redhat.com> wrote:
> > object_new(FOO) returns an object with ref_cnt == 1
> > and following
> >   object_property_set_bool(cpuobj, true, "realized", NULL)
> > set parent of cpuobj to '/machine/unattached' which makes
> > ref_cnt == 2.
> >
> > Since machvirt_init() doesn't take ownership of cpuobj
> > returned by object_new() it should explicitly drop
> > reference to cpuobj when dangling pointer is about to
> > go out of scope like it's done pc_new_cpu() to avoid
> > object leak.  
> 
> I've always found the object reference semantics somewhat
> confusing (why does realizing a device add a reference,
> for instance?). Do we document them anywhere?
I'm not aware of a place where it's documented.

currently device_realize() sets parent thus increasing
ref counter only if device creator haven't set parent
explicitly.

> 
> thanks
> -- PMM
> 

