Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp381275wrq;
        Wed, 11 Jul 2018 09:12:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpewYxQQrLDLsek5/nihi5/oZN794ltZk2GtYzyVSsrZ4NnRDH5WpCyeaUmkKGiWVIFq87xu
X-Received: by 2002:ac8:3676:: with SMTP id n51-v6mr28049964qtb.163.1531325551026;
        Wed, 11 Jul 2018 09:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531325551; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMZM3HjDfkci+X3TwvmADCWn06f2vJrHmKmAla2vFcgeZYWQLa0/46/gJPT1j81jgY
         zh4ZuZrfRnhb5PK8LWk+rERsroV+PW4n+05zMyVY9zLjuHkdWjX9JJYdtB/tx4y4Dmh/
         cXjVncJOGBIKsvp8aXhwHm1QMErPcaXTCAExL+fJ9HxTVjNpD/b4egUvslCLuV1cgF8I
         +y6glm2a7p0TjIRE7bg0gBt6+6mgvoSQVsgr/Mdoj42SLLuq7jMyLWsqCW+Tkezjof6p
         /DOmgHmWlrSCwsrH+bjC+vKsZrBJHRhZJP0Wg5UYZYDfmIweLDRwa1BUzGW5Xv3P+Gjb
         j+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=6x3SQQ+ZZ+E+326Cwt221cbTlaNJG6vm38HcYcwSAUY=;
        b=jbpPWDMO7EKE8kWLEFETQP5f1DndweDUz+VsZQYFGuLxKVsndbEH1zyOm9IUlCBZeH
         XGbNj/vY6CRPxCwNNzwdsbu6FJWJ/yn9m7flf4/KlcuMKY9KCWwWB+qJ8MMbio6K1f92
         NxUTviEbV0dnIHVvOxe6N/bDIMyFk/xC9Rv32yMzm04YGyjvNyfpTDxpYrw5TTduYfKM
         r5+fJd7xQT9CuvZl+ikpfqU33+EKSuCeZM8eQjysGY5hvqEkfVsJp6I6NTq82ZCdnjvh
         RL1Qj2fphtcVwzU/JI20KYt/oD9Wu9hlwSSNFmOs1IsrB66JHVwWX9lEugaIdy6yPveA
         fDrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a132-v6si2347215qkg.106.2018.07.11.09.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 09:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdHjC-00018q-JT
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 12:12:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdHj5-00018i-Jt
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 12:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdHj2-000518-Dj
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 12:12:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdHj2-00050u-5L; Wed, 11 Jul 2018 12:12:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43FD53084040;
	Wed, 11 Jul 2018 16:12:19 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9613E60BE9;
	Wed, 11 Jul 2018 16:12:18 +0000 (UTC)
Date: Wed, 11 Jul 2018 13:12:16 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180711161216.GV7451@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 11 Jul 2018 16:12:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5dVzoeYnEDyZ

On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
> On 10.07.2018 08:50, Peter Maydell wrote:
> > On 9 July 2018 at 23:03, Thomas Huth <thuth@redhat.com> wrote:
> >> On 09.07.2018 23:42, Peter Maydell wrote:
> >>> On 9 July 2018 at 22:03, Thomas Huth <thuth@redhat.com> wrote:
> >>>> When trying to "device_add bcm2837" on a machine that is not suitable for
> >>>> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
> >>>>
> >>>> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
> >>>>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
> >>>>  "'arguments': {'command-line': 'info qtree'}}" | \
> >>>>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
> >>>>
> >>>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
> >>>>  "package": "build-all"}, "capabilities": []}}
> >>>> {"return": {}}
> >>>> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
> >>>>  hotplugged on this machine"}}
> >>>> Segmentation fault (core dumped)
> >>>>
> >>>> The problem is that qdev_set_parent_bus() from instance_init adds a link
> >>>> to the child devices which is not valid anymore after the device init
> >>>> failed. Thus the qdev_set_parent_bus() must rather be done in the realize
> >>>> function instead.
> >>>
> >>> Yuck. The real problem here is that we're still requiring the
> >>> code that creates these QOM devices to manually set the parent
> >>> in the first place. It's not surprising that we don't get it right
> >>> (either parenting in the wrong place or not at all). I'd much
> >>> rather see us fix that properly than keep papering over places
> >>> where we get it wrong.
> >>
> >> Sorry, I'm still not an expert in all this QOM stuff yet ... so what do
> >> you exactly recommend to do instead?
> > 
> > I'm not clear either, but I don't think that what we're
> > currently doing can be right.
> 
> Hm, ok, so how to continue here now? Shall we at least mark the
> bcm2836/7 devices with user_creatable=false, so that users can not crash
> their QEMU so easily with device_add? The problem with introspection via
> device-list-properties would still continue to exist, but I think that's
> less likely used in practice... otherwise we could still move the
> qdev_set_parent_bus() calls to the realize() function instead, and just
> add a big fat FIXME comment in front of the code block, so that we
> remember to clean that up one day...

Crashing device-list-properties should be a blocker bug, IMO.

Moving to realize is not the best solution, but I would prefer to
do that in 3.0 instead of leaving the device-list-properties
crash unfixed.

Another solution is to reintroduce
DeviceClass::cannot_destroy_with_object_finalize_yet (commit
08f00df4f4b8b4e38ad620477cc90cf5f73832d9), and set
cannot_destroy_with_object_finalize_yet=true on bcm2837.

-- 
Eduardo
