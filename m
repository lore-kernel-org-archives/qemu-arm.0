Received: by 10.37.56.16 with SMTP id f16csp198915yba;
        Fri, 3 Jun 2016 05:13:46 -0700 (PDT)
X-Received: by 10.55.120.196 with SMTP id t187mr2804339qkc.6.1464955679804;
        Fri, 03 Jun 2016 05:07:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si3281431qth.43.2016.06.03.05.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 05:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8ntO-0007Kk-Oq
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 08:07:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jdenemar@redhat.com>) id 1b8nsR-0006tv-Me
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 08:07:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jdenemar@redhat.com>) id 1b8nsQ-0001Km-N4
	for qemu-devel@nongnu.org; Fri, 03 Jun 2016 08:06:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jdenemar@redhat.com>)
	id 1b8nsL-0001KL-6e; Fri, 03 Jun 2016 08:06:53 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BD5AA0B85;
	Fri,  3 Jun 2016 12:06:52 +0000 (UTC)
Received: from virval.usersys.redhat.com (dhcp129-192.brq.redhat.com
	[10.34.129.192])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u53C6pLX014072; Fri, 3 Jun 2016 08:06:51 -0400
Received: by virval.usersys.redhat.com (Postfix, from userid 500)
	id CC7B0100B4F; Fri,  3 Jun 2016 14:06:58 +0200 (CEST)
Date: Fri, 3 Jun 2016 14:06:58 +0200
From: Jiri Denemark <jdenemar@redhat.com>
To: David Hildenbrand <dahi@linux.vnet.ibm.com>
Message-ID: <20160603120658.GF40539@orkuz.home>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<201606022044.u52KaKfW029022@mx0a-001b2d01.pphosted.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201606022044.u52KaKfW029022@mx0a-001b2d01.pphosted.com>
X-PGP-Key-ID: 0x8A42DBE1
X-PGP-Key-Fingerprint: C19B D9A8 AFC9 613A C61A  D8B1 C073 42FA 8A42 DBE1
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 03 Jun 2016 12:06:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O3Q484BjsatK

On Thu, Jun 02, 2016 at 22:44:49 +0200, David Hildenbrand wrote:
> > Current CLI option -cpu cpux,features serves as template
> > for all created cpus of type: cpux. However QEMU parses
> > "features" every time it creates a cpu instance and applies
> > them to it while doing parsing.
> > 
> > That doesn't work well with -device/device_add infrastructure
> > as it has no idea about cpu specific hooks that's used for
> > parsing "features".
> > In order to make -device/device_add utilize "-cpu features"
> > template convert it into a set of global properties, so that
> > every new CPU created will have them applied automatically.
> > 
> > That also allows to parse features only once, instread of
> > doing it for every CPU instance created.
> 
> While I think this makes sense for most cases, we (s390x) are
> currently working on a mechanism to compare and baseline cpu models via
> a qmp interface, to not have to replicate CPU models in libvirt
> every time we do some changes.

BTW, we don't replicate any change to QEMU CPU models in libvirt. We
merely add new CPU models that match the current QEMU definition.
Existing CPU models are never changed. And while the CPU models are
currently used to check compatibility with host CPU, we will stop doing
that in the near future and our CPU models will mostly be used for
detecting what the host CPU is.

Jirka
