Received: by 10.223.188.70 with SMTP id a6csp1026221wrh;
        Wed, 23 Aug 2017 11:00:53 -0700 (PDT)
X-Received: by 10.200.49.157 with SMTP id h29mr4936432qte.269.1503511252843;
        Wed, 23 Aug 2017 11:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503511252; cv=none;
        d=google.com; s=arc-20160816;
        b=DovBm1zQe8VPyhtbkgsWjsp/ROjSchHQVntikSI88I1rLAa39+5CBsfrOOsJNFZNOU
         ZlGhu5sKcp7SaOsdK8o/+IiJeKzIY5lMc3wE8ac2SYtQjXFyBnavosy0notjGsgGU2AE
         0WlBsTQTGjIekds0yNaWL9Hw0Md/KZa6S6PQ8O1Dzs/6ajrbs+uKHDx6W7avbUj2mdgC
         zT1AR7SfxHOPXymr3W2U0OuqRAXnS2m9323KkAE+wl2xmayJGdaf9KwTHG3AopQxSNlC
         9z4Ks24LQN9NTB0hIAJV1z2sLWHruFJ63c8ZPqNHffVj5urQglQ1Jzw35WYbrexcSg4e
         QKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=cPPDmcUSNX24JWEVybpEuPmFXd4QqqW/jLGU4uwSZ1c=;
        b=K65jLSwSF4/vbRM78Tc5vPCQchpcD4bUpIsdwmNtiYm7Fo5gHT17rRx3w7vKB2UIdi
         gvky1xIlvbYQSmKyWGRHQCLQn3WNTi7Oi7vqoxjsVCwiKzoqDh7ceJnyqbO5ChZLvUDm
         /dS2N+EfwJYxWUfQQMha7A8UyeXE+EnOjVY7CQx1b38cwP5jjXk2m4eoxQFB/aF9T6nj
         U+yaCDzyPB/INsdRRbUSMCQprjdj26kkZwJy510iZ7tahmLZ3WKLqcMfXwFbSTEbvuNn
         rtgYjI2VQFpFlqERyUkoRe+YF6U6eluxjdbsHHCiBGVxg/qQOn1lsTOYGHlUCSnZL+so
         oyrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z85si1934368qkb.282.2017.08.23.11.00.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 11:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkZxS-0007Se-IG
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 14:00:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dkZxN-0007Qs-63
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 14:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dkZxI-0002xd-CE
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 14:00:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dkZxI-0002xJ-6N; Wed, 23 Aug 2017 14:00:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 113D2C0587C1;
	Wed, 23 Aug 2017 18:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 113D2C0587C1
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9065D98B;
	Wed, 23 Aug 2017 18:00:38 +0000 (UTC)
Date: Wed, 23 Aug 2017 15:00:37 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170823180037.GU19998@localhost.localdomain>
References: <1503416789-32080-1-git-send-email-thuth@redhat.com>
	<20170823172118.GQ19998@localhost.localdomain>
	<CAFEAcA-DoQtTwCBFq-_JKPRMxcGq8-2QNnEJBu9STxtPWkB0bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-DoQtTwCBFq-_JKPRMxcGq8-2QNnEJBu9STxtPWkB0bw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 23 Aug 2017 18:00:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/allwinner-a10: Mark the allwinner-a10
 device with user_creatable = false
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 11cx2pFw91g0

On Wed, Aug 23, 2017 at 06:51:28PM +0100, Peter Maydell wrote:
> On 23 August 2017 at 18:21, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Tue, Aug 22, 2017 at 05:46:29PM +0200, Thomas Huth wrote:
> >> QEMU currently exits unexpectedly when the user accidentially
> >> tries to do something like this:
> >>
> >> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> >> QEMU 2.9.93 monitor - type 'help' for more information
> >> (qemu) device_add allwinner-a10
> >> Unsupported NIC model: smc91c111
> >>
> >> Exiting just due to a "device_add" should not happen. Looking closer
> >> at the the realize and instance_init function of this device also
> >> reveals that it is using serial_hds and nd_table directly there, so
> >> this device is clearly not creatable by the user and should be marked
> >> accordingly.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  hw/arm/allwinner-a10.c    | 2 ++
> >>  scripts/device-crash-test | 1 -
> >>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> >> index f62a9a3..43a3f01 100644
> >> --- a/hw/arm/allwinner-a10.c
> >> +++ b/hw/arm/allwinner-a10.c
> >> @@ -118,6 +118,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
> >>      DeviceClass *dc = DEVICE_CLASS(oc);
> >>
> >>      dc->realize = aw_a10_realize;
> >> +    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
> >> +    dc->user_creatable = false;
> >
> > I assume this patch will be replaced by one changing TYPE_DEVICE
> > to default to user_creatable=false, based on the replies to the
> > hw/misc/auxbus.c patch?
> 
> user-creatable and hotplug are different things -- most
> devices are user-creatable, many fewer are hotpluggable.
> So the tradeoff for the default doesn't *necessarily* go
> the same way.

You're right, I mixed things up when reading this patch.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
