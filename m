Received: by 10.25.85.209 with SMTP id j200csp788645lfb;
        Sun, 12 Jun 2016 06:58:30 -0700 (PDT)
X-Received: by 10.237.48.45 with SMTP id 42mr9879725qte.7.1465739910285;
        Sun, 12 Jun 2016 06:58:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si3749418qkd.80.2016.06.12.06.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Jun 2016 06:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bC5uH-0007m8-OL
	for alex.bennee@linaro.org; Sun, 12 Jun 2016 09:58:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bC5uE-0007lx-Pf
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 09:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bC5uB-0002lb-NH
	for qemu-arm@nongnu.org; Sun, 12 Jun 2016 09:58:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bC5uB-0002lX-HP; Sun, 12 Jun 2016 09:58:23 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CBD90275BDF;
	Sun, 12 Jun 2016 13:58:21 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5CDwGsI014503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sun, 12 Jun 2016 09:58:19 -0400
Date: Sun, 12 Jun 2016 15:58:16 +0200
From: Andrew Jones <drjones@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20160612135816.unnyoyk5wmizympf@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<575BB2C6.2050603@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <575BB2C6.2050603@redhat.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 12 Jun 2016 13:58:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 00/16] Rework SMP parameters
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, pbonzini@redhat.com, dgibson@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMVCDTOiF9gA

On Sat, Jun 11, 2016 at 08:42:14AM +0200, Thomas Huth wrote:
> On 10.06.2016 19:40, Andrew Jones wrote:
> > This series is a first step in eliminating smp_* global
> > variables (the last patch gets rid of two of them!) And, it's
> > a first step in deprecating '-smp' in favor of using machine
> > properties, e.g.
> >  qemu -machine pc,sockets=2,cores=2,threads=2,maxcpus=8,cpus=8 ...
> 
> Why isn't '-smp' good enough anymore so that it got to be deprecated?
>

cpu topology is machine state, and the QEMU style of providing state
values for objects is through properties. So adding properties brings
cpu topology descriptions more in line. Keeping a redundant (not "in
line") command line option could confuse things.

Also, switching how the command line is used provides a clean breaking
point. -smp assumes values when none are provided. This can lead to
unexpected results for some machines. Rather than trying to code every
assumption possible, it's easier to just require all properties be
specified. Machines are still free to provide short-hand properties to
get defaults, if the 45 character collection of properties is too
annoying to use all the time (I agree that it may be).

Thanks,
drew
