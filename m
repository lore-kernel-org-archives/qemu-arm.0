Received: by 10.25.208.211 with SMTP id h202csp1630358lfg;
        Tue, 23 Feb 2016 01:54:05 -0800 (PST)
X-Received: by 10.55.79.79 with SMTP id d76mr40195696qkb.76.1456221245401;
        Tue, 23 Feb 2016 01:54:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x142si33139309qhb.99.2016.02.23.01.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:54:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY9fQ-0008Ht-N5
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:54:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9fJ-00087A-I8
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:53:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY9fF-0001aT-CV
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:53:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aY9fF-0001aP-5B; Tue, 23 Feb 2016 04:53:53 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id A80CDBBB54;
	Tue, 23 Feb 2016 09:53:52 +0000 (UTC)
Received: from redhat.com (vpn1-6-142.ams2.redhat.com [10.36.6.142])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1N9rmT2021553; Tue, 23 Feb 2016 04:53:48 -0500
Date: Tue, 23 Feb 2016 11:53:47 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20160223115206-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
	<1456217512.29896.78.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456217512.29896.78.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	"Gabriel L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 0/5] add ACPI node for fw_cfg
 on pc and arm
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bwMa5kdtipIE

On Tue, Feb 23, 2016 at 09:51:52AM +0100, Gerd Hoffmann wrote:
> On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:
> > On Fri, 19 Feb 2016 13:20:24 -0500
> > "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
> > 
> > Gerd,
> > 
> > if you are going to apply it, you'll need to update
> > expected tables for acpi test (rebuild-expected-aml.sh)
> > as a commit on top of this series.
> 
> Sure?
> 
> Applied the series, ran "make check", no errors.
> 
> cheers,
>   Gerd

It's a warning not an error because of all the false positives it causes.

This is mostly an ACPI patchset, so my tree seems more
appropriate, but in case you prefer your tree,
I sent a Reviewed-by: Michael S. Tsirkin <mst@redhat.com>.

In that case please do update the expected tables.

-- 
MST
