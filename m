Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6664357wrt;
        Mon, 3 Dec 2018 03:23:03 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VwgHI0yDurrpToI4Ybri4fAO8FbcGM3qFdsdL2F+4yw8JuSGXfsOUHa+rGums5FsKI58Rx
X-Received: by 2002:ac8:90c:: with SMTP id t12mr14557220qth.335.1543836182998;
        Mon, 03 Dec 2018 03:23:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543836182; cv=none;
        d=google.com; s=arc-20160816;
        b=fKRS75Z9O/qXWd1IrPUbPxsuATdx5LHQiDrXeM3F1nqgjutmuc8N/ypL/62eqhm0mB
         VLp2HBfQi7vzjlFOfBEuJaLiKMAPZmxIZQpkro1jPU97052W/k1YAx1mU1SlOROHA6Ad
         wa35RWxyGrN1rGyw0J0GM9dV0HQkcA9GlT8pJXElYJOp5RH8z2XF0sJNEHSdXE3H4lTj
         eD+0Qa+jC1tnWLwACTTQN7CIYE0widG6n9nSBnJ3gO7NmyTRlUo0OkK1BY4V42TeM+0F
         JdcUnvXwO7guC1+EgCHD4RVIggbFRyc6ZS3rGpzgNG1b2boN3qS4Xvry0QCeiRrO2qwM
         hOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=pgWqGmfPQ4IV4gQIdhOJbOukF82RPZmAMvlqnRwGV4M=;
        b=swMla1DwuoHhg5rfwYxLubSOkt4BDdRxwpyYpniVE8Ut/hzZ5WWtRxP8UhOhtvWnxV
         PR5su8EAGvvcXzcycs781tX9wx41N/oR4LqOhvRElmNmdJmB9FXJXfX64EcDnA3dRrXC
         RLcmw50p60C3ezgm8uAAY0GegLwmQuvQfGsUOh+WYexIlCNsSYpTuqn4tXwkeIlj5B0B
         HncMITBL3Qj+GQvPj2o8eKzXXAIxpcxap9FXxfaTwhIhGmsw3s6lO+C0SnGGbfq/EThp
         8lGCPlFOQ+E5IkpfXWykaoU7F0ENEUvct+P0CwRoB6GxTISOw0R09SyRxfQUZzZjfDFI
         iPIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9si2480815qtl.386.2018.12.03.03.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:23:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTmJa-0004vM-F3
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:23:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gTmJL-0004q6-C7
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gTmJI-0006Wa-6D
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:22:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gTmJF-0006Uc-M5; Mon, 03 Dec 2018 06:22:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4489430832C7;
	Mon,  3 Dec 2018 11:22:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0F46717B;
	Mon,  3 Dec 2018 11:22:35 +0000 (UTC)
Date: Mon, 3 Dec 2018 12:22:33 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181203112233.j2xjnrezrapgqm2b@kamzik.brq.redhat.com>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<1543865209-50994-7-git-send-email-peng.hao2@zte.com.cn>
	<20181203111836.qqfzcfwazk2g6kvr@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203111836.qqfzcfwazk2g6kvr@kamzik.brq.redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 03 Dec 2018 11:22:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V11 6/8] hw/arm/virt: add configure interface
 for pvpanic-mmio
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: smEg8UeMD0wa

On Mon, Dec 03, 2018 at 12:18:36PM +0100, Andrew Jones wrote:
> On Tue, Dec 04, 2018 at 03:26:47AM +0800, Peng Hao wrote:
> > Add configure interface for pvpanic-mmio device in virt machine.
> > 
> > Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> > ---
> >  hw/arm/virt.c         | 23 +++++++++++++++++++++++
> >  include/hw/arm/virt.h |  1 +
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index a4541fa..fdd3f20 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1655,6 +1655,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
> >      vms->its = value;
> >  }
> >  
> > +static bool virt_get_pvpanic(Object *obj, Error **errp)
> > +{
> > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > +
> > +    return vms->pvpanic;
> > +}
> > +
> > +static void virt_set_pvpanic(Object *obj, bool value, Error **errp)
> > +{
> > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > +
> > +    vms->pvpanic = value;
> > +}
> > +
> >  static char *virt_get_gic_version(Object *obj, Error **errp)
> >  {
> >      VirtMachineState *vms = VIRT_MACHINE(obj);
> > @@ -1884,6 +1898,15 @@ static void virt_3_1_instance_init(Object *obj)
> >                                      "Valid values are none and smmuv3",
> >                                      NULL);
> >  
> > +    /* Default disallows pvpanic-mmio instantiation */
> > +    vms->pvpanic = false;
> > +    object_property_add_bool(obj, "pvpanic", virt_get_pvpanic,
> > +                             virt_set_pvpanic, NULL);
> > +    object_property_set_description(obj, "pvpanic",
> > +                                    "Set on/off to enable/disable "
> > +                                    "PVPANIC MMIO device",
> > +                                    NULL);
> > +
> >      vms->memmap = a15memmap;
> >      vms->irqmap = a15irqmap;
> >  }
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 937c124..7d6d1c0 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -113,6 +113,7 @@ typedef struct {
> >      bool highmem;
> >      bool highmem_ecam;
> >      bool its;
> > +    bool pvpanic;
> 
> This hunk should be squashed into 4/8 and the respective hunks of 7/8
> should be squashed into 4/8 and 5/8.
>

With the above changes

Reviewed-by: Andrew Jones <drjones@redhat.com>
