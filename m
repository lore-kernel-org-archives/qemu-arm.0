Received: by 10.25.208.211 with SMTP id h202csp1796503lfg;
        Tue, 23 Feb 2016 07:54:47 -0800 (PST)
X-Received: by 10.140.104.242 with SMTP id a105mr42675430qgf.1.1456242887111;
        Tue, 23 Feb 2016 07:54:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o74si14151501qki.121.2016.02.23.07.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 07:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYFIU-0000Fz-Ib
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 10:54:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aYFIR-0000FQ-M1
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 10:54:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aYFIM-0008Tp-Mh
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 10:54:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aYFIM-0008Tk-HP; Tue, 23 Feb 2016 10:54:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 00B2C85542;
	Tue, 23 Feb 2016 15:54:37 +0000 (UTC)
Received: from redhat.com (vpn1-7-17.ams2.redhat.com [10.36.7.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1NFsX9E014394; Tue, 23 Feb 2016 10:54:34 -0500
Date: Tue, 23 Feb 2016 17:54:33 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160223175357-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
	<1456217512.29896.78.camel@redhat.com>
	<20160223104839.5a51df9a@nial.brq.redhat.com>
	<1456223945.29896.89.camel@redhat.com>
	<20160223165216.78714f25@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160223165216.78714f25@nial.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	"Gabriel L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	pbonzini@redhat.com, lersek@redhat.com, rth@twiddle.net
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
X-TUID: Fz57bEpOKVjY

On Tue, Feb 23, 2016 at 04:52:16PM +0100, Igor Mammedov wrote:
> On Tue, 23 Feb 2016 11:39:05 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > On Di, 2016-02-23 at 10:48 +0100, Igor Mammedov wrote:
> > > On Tue, 23 Feb 2016 09:51:52 +0100
> > > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >   
> > > > On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:  
> > > > > On Fri, 19 Feb 2016 13:20:24 -0500
> > > > > "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
> > > > > 
> > > > > Gerd,
> > > > > 
> > > > > if you are going to apply it, you'll need to update
> > > > > expected tables for acpi test (rebuild-expected-aml.sh)
> > > > > as a commit on top of this series.    
> > > > 
> > > > Sure?
> > > > 
> > > > Applied the series, ran "make check", no errors.  
> > > it's a warning so far not a hard error but it's still there.  
> > 
> > Checked again, no warning printed here ...
> it works for me, I get something like:
> GTESTER check-qtest-x86_64
> acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-66EZCY.dsl, aml:/tmp/aml-MBFZCY], Expected [asl:/tmp/asl-N1N0CY.dsl, aml:tests/acpi-test-data/q35/DSDT.bridge].

is iasl installed on the build system?
This test is skipped if there's no iasl.

> 
> > 
> > Also "git diff" doesn't list any changes after running the rebuild
> > script.
> it work for as well,
> just a wild guess, may be test for some reason doesn't use qemu with patches applied
> that would result in test not seeing any changes.
> 
> > But when booting a live iso I can see the new QEMU0002 device listed
> > in /proc/ioports.
> > 
> > Any clues what is going on here?
> > 
> > cheers,
> >   Gerd
> > 
> > 
