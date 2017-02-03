Received: by 10.25.77.65 with SMTP id a62csp567935lfb;
        Fri, 3 Feb 2017 03:39:55 -0800 (PST)
X-Received: by 10.55.87.198 with SMTP id l189mr12520181qkb.106.1486121995303;
        Fri, 03 Feb 2017 03:39:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si19091081qkh.103.2017.02.03.03.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Feb 2017 03:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cZcDa-0007jH-OG
	for alex.bennee@linaro.org; Fri, 03 Feb 2017 06:39:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1cZcCN-0006uF-6U
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 06:38:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1cZcCK-0006F9-1p
	for qemu-arm@nongnu.org; Fri, 03 Feb 2017 06:38:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1cZcCJ-0006EO-SR; Fri, 03 Feb 2017 06:38:35 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFCB63A7687;
	Fri,  3 Feb 2017 11:38:35 +0000 (UTC)
Received: from pxdev.xzpeter.org (ovpn-8-19.pek2.redhat.com [10.72.8.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v13BcSUp019720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Feb 2017 06:38:30 -0500
Date: Fri, 3 Feb 2017 19:38:27 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20170203113827.GS5151@pxdev.xzpeter.org>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<1485422381-29019-5-git-send-email-eric.auger@redhat.com>
	<20170126100643.GD2083@work-vm>
	<9bd0a672-d27c-f232-6ba0-67ad5c1e6f23@redhat.com>
	<20170203095529.GR5151@pxdev.xzpeter.org>
	<20170203095704.GA3208@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170203095704.GA3208@work-vm>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 03 Feb 2017 11:38:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 4/4] hw/intc/arm_gicv3_its: Allow save/restore
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	quintela@redhat.com, qemu-devel@nongnu.org,
	Vijaya.Kumar@cavium.com, Auger Eric <eric.auger@redhat.com>,
	qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5OPZemUNx3IY

On Fri, Feb 03, 2017 at 09:57:05AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Thu, Jan 26, 2017 at 02:30:17PM +0100, Auger Eric wrote:
> > 
> > [...]
> > 
> > > >> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > > >> index 1a22887..ebd755c 100644
> > > >> --- a/include/migration/vmstate.h
> > > >> +++ b/include/migration/vmstate.h
> > > >> @@ -188,6 +188,8 @@ enum VMStateFlags {
> > > >>  
> > > >>  typedef enum {
> > > >>      MIG_PRI_DEFAULT = 0,
> > > >> +    MIG_PRI_GICV3_ITS,
> > > >> +    MIG_PRI_GICV3,
> > > >>      MIG_PRI_MAX,
> > > > 
> > > > Can we keep this commented so it's trivially easy to see the order, something like:
> > > > 
> > > >  typedef enum {
> > > >      MIG_PRI_DEFAULT = 0,
> > > > +    MIG_PRI_GICV3_ITS,    /* Needs to be before PCI devices */
> > > > +    MIG_PRI_GICV3,        /* Must be before ITS */
> > > Sure
> > > 
> > > Thanks!
> > 
> > Besides above: is it possible that in the future other platforms
> > (rather than ARM) can leverage these new introduced priority? If so,
> > would it be nicer that we use general names (like, e.g., INTCxxx? or
> > better?) rather than platform-specific names (like, GICxxx)?
> 
> Yes, but the ordering rules on other platforms might be subtly different.

I see. Then I have no problem in either way - we can rearrange the
defines until one day it is really needed. Thanks,

-- peterx
