Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3786614wrx;
        Mon, 4 Mar 2019 08:27:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+ndtmecB8j8n2tf/PA796oiBCQJLWD95+qbL1PMHjtjIhR89oKVLHF7R+1zYs5bPvIPIk
X-Received: by 2002:a25:3bcd:: with SMTP id i196mr12874335yba.442.1551716874346;
        Mon, 04 Mar 2019 08:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551716874; cv=none;
        d=google.com; s=arc-20160816;
        b=y30XJL+HNyeTQdsipsYD9qxrdiiBzZtRaSzjD9V9ykPnPNZOlMdyDOVvOZH/Xyax3e
         SkkgIQYO6ga6mbJy8iVeyGKYsFZ5o/IyuFySOXLoeWAXwWRi45mptPk4E777ZLzZMnVX
         8nfN4zo9U9IJcYvXpG5jEoYIs2D7yRUx4v/uV4txis+r/wZ71mBqxY9z2U5bjFD1P95Y
         yCuOBQecLMc9DDVqggwDX2suoMjCS0AVjWWSuhpEcbWA2K3I2V3nmzF+0348SQZu6iq/
         dU83fGAUpqKwDEmFufIM98Jwe/G5EOrs/8RfUytFSZoFe+oiSlw01OaqI5NsD79VYkf0
         NZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=JKHpvDbWeV4dl/EJkhDl3PIQa4FiQzJYotHCG0KUnUs=;
        b=aeq+l9oy8BrAfDYf+ZvV1y4VIR/20qcXTav6mAezoJ9ViZ6HSRgJycXdlaPKIkzum1
         TtPFQdY20MSMllz0EmHuXYFqCLzTsYctYPOudLGK+xi2XcuJthOuOD8iVnAxIaP/nbHi
         m4OYnjuP4ijXnjb0/g0SsCK5D2Hbdgq7YwyWdHz0TJmqTGxf9i01PK1+AbdbDvuj+no/
         wVDJK2gDbFBwP5amQ8gcbw3DRYzQsHRGzNqt7TQF2/aXdYi85fuuOlzAtbq1RJpEK1p3
         IW1/HEbrjK+Ay2XM9HiRoqlPSY+P00O2gno7vFpMzIeTqUj9Ajibd21D+kIheylGZ+Ct
         zDOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u83si3283230ybb.19.2019.03.04.08.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 08:27:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0qRV-0007iw-QL
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 11:27:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0qRG-0007ey-9Z
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 11:27:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0qRF-0005tT-A8
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 11:27:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56424)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0qRC-0005mk-30; Mon, 04 Mar 2019 11:27:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51FED85545;
	Mon,  4 Mar 2019 16:27:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F405C2EC;
	Mon,  4 Mar 2019 16:27:25 +0000 (UTC)
Date: Mon, 4 Mar 2019 16:27:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20190304162723.GP4239@redhat.com>
References: <20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
	<20190304142432.GM4239@redhat.com>
	<20190304161932.0438c880@redhat.com>
	<ae0335fb-9201-e09d-80ad-5e497365267b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae0335fb-9201-e09d-80ad-5e497365267b@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 04 Mar 2019 16:27:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Ca1fLmkPggs

On Mon, Mar 04, 2019 at 05:12:40PM +0100, Michal Privoznik wrote:
> On 3/4/19 4:19 PM, Igor Mammedov wrote:
> 
> > Then I'd guess that most VMs end up with default '-numa node,mem'
> > which by design can produce only fake NUMA without ability to manage
> > guest RAM on host side. So such VMs aren't getting performance benefits
> > or worse run with performance regression (due to wrong sched/mm decisions
> > as guest kernel assumes NUMA topology is valid one).
> 
> Specifying NUMA distances in libvirt XML makes it generate the modern cmd
> line.

AFAIK, specifying any guest NUMA -> Host NUMA affinity makes it use the
modern cmd line. eg I  just modified a plain 8 CPU / 2 GB RAM guest
with this:

  <numatune>
    <memnode cellid='0' mode='strict' nodeset='0'/>
    <memnode cellid='1' mode='strict' nodeset='1'/>
  </numatune>
  <cpu mode='host-model'>
    <numa>
      <cell id='0' cpus='0-3' memory='1024000' unit='KiB'/>
      <cell id='1' cpus='4-7' memory='1024000' unit='KiB'/>
    </numa>
  </cpu>

and I can see libvirt decided to use memdev

  -object memory-backend-ram,id=ram-node0,size=1048576000,host-nodes=0,policy=bind
  -numa node,nodeid=0,cpus=0-3,memdev=ram-node0
  -object memory-backend-ram,id=ram-node1,size=1048576000,host-nodes=1,policy=bind
  -numa node,nodeid=1,cpus=4-7,memdev=ram-node1 

So unless I'm missing something, we aren't suffering from the problem
described by Igor above even today.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
