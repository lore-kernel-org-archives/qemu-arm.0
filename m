Received: by 10.25.77.65 with SMTP id a62csp312066lfb;
        Fri, 17 Feb 2017 11:05:35 -0800 (PST)
X-Received: by 10.55.15.233 with SMTP id 102mr8549448qkp.267.1487358335698;
        Fri, 17 Feb 2017 11:05:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c64si8082633qkh.36.2017.02.17.11.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 11:05:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cenqZ-0002Qk-4Y
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 14:05:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cenqU-0002P6-33
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 14:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cenqQ-0004wF-Sb
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 14:05:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cenqQ-0004vq-MR; Fri, 17 Feb 2017 14:05:26 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B000C05AA57;
	Fri, 17 Feb 2017 19:05:26 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HJ5PkL028520; Fri, 17 Feb 2017 14:05:25 -0500
Date: Fri, 17 Feb 2017 20:05:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170217200522.0e8db60b@nial.brq.redhat.com>
In-Reply-To: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 17 Feb 2017 19:05:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] cpu: Implement
 cpu_generic_new()
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 227qcFMfpdX3

On Mon, 13 Feb 2017 14:28:15 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> This patchset adds a new function cpu_generic_new()
> which is similar to cpu_generic_init() except that it
> does not realize the created CPU object. This means that
> board code can do a "new cpu; set QOM properties; realize"
> sequence without having to do all the work of splitting
> the CPU model string and calling parse_features by hand.
> 
> Patch 2 clarifies a TODO comment, hopefully correctly,
> based on an email conversation I had with Eduardo a
> little while back.
> 
> Patches 3 and 4 change the ARM boards which currently
> call parse_features by hand to use the new function.
> 
> 
> If there's consensus that this is the right general
> direction to go in, then I think that some other
> architectures could also make cleanups to use this:
>  * cpu_s390x_create() is almost exactly this function,
>    give or take some fine detail of error handling
>  * ppc_cpu_parse_features is almost the same thing,
>    except that it doesn't actually create the CPU object,
>    it only calls parse_features
>  * hw/i386/pc.c does a manual parse_features
> 
> I'm not strongly attached to this particular approach
> (though it seems like a reasonable one, especially given
> the proliferation of different arch-specific helpers
> listed above and the bugs in boards which don't call
> parse_features when they should), but I would like us to
> figure out and document what the right way for a board
> to create and configure its CPU objects is...

series looks like a step back adding yet another way
to create CPU and makes code even more inconsistent,
instead of removing TODO item by doing proper generalization.
So I'm sort of object to it.

I'll just posted RFC which show idea how generalization of
cpu_model/features parsing should be implemented.

However I don't have cycles to complete it, only
virt-arm/spapr/pc are converted as example.
One who would pick the task up should complete it for
all boards to make code consistent.

> 
> 
> Michael Davidsaver (1):
>   cpu: add cpu_generic_new()
> 
> Peter Maydell (3):
>   cpu: Clarify TODO comment in cpu_generic_new()
>   hw/arm/integrator: Use new cpu_generic_new()
>   hw/arm/virt: Use new cpu_generic_new()
> 
>  include/qom/cpu.h     | 17 +++++++++++++++++
>  hw/arm/integratorcp.c | 22 ++--------------------
>  hw/arm/virt.c         | 24 ++----------------------
>  qom/cpu.c             | 37 ++++++++++++++++++++++++++-----------
>  4 files changed, 47 insertions(+), 53 deletions(-)
> 

