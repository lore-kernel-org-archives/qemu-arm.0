Received: by 10.25.208.211 with SMTP id h202csp1812694lfg;
        Tue, 23 Feb 2016 08:26:52 -0800 (PST)
X-Received: by 10.55.197.76 with SMTP id p73mr17048631qki.75.1456244812806;
        Tue, 23 Feb 2016 08:26:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12si12877503qkl.118.2016.02.23.08.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 08:26:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYFnY-0001JP-70
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 11:26:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aYFmg-0000G1-IW
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 11:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aYFmf-0008M0-66
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 11:25:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aYFmZ-0008K6-Th; Tue, 23 Feb 2016 11:25:52 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 710F1C00F1CC;
	Tue, 23 Feb 2016 16:25:51 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1NGPlUq006043; Tue, 23 Feb 2016 11:25:48 -0500
Date: Tue, 23 Feb 2016 17:25:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20160223172546.340c0d45@nial.brq.redhat.com>
In-Reply-To: <20160223175357-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
	<1456217512.29896.78.camel@redhat.com>
	<20160223104839.5a51df9a@nial.brq.redhat.com>
	<1456223945.29896.89.camel@redhat.com>
	<20160223165216.78714f25@nial.brq.redhat.com>
	<20160223175357-mutt-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, ard.biesheuvel@linaro.org,
	matt@codeblueprint.co.uk, stefanha@gmail.com, "Gabriel
	L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	pbonzini@redhat.com, lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-devel] [PATCH v9 0/5] add ACPI node for fw_cfg on pc and
 arm
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yp58ygbiQ10q

On Tue, 23 Feb 2016 17:54:33 +0200
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 23, 2016 at 04:52:16PM +0100, Igor Mammedov wrote:
> > On Tue, 23 Feb 2016 11:39:05 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   
> > > On Di, 2016-02-23 at 10:48 +0100, Igor Mammedov wrote:  
> > > > On Tue, 23 Feb 2016 09:51:52 +0100
> > > > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >     
> > > > > On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:    
> > > > > > On Fri, 19 Feb 2016 13:20:24 -0500
> > > > > > "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
> > > > > > 
> > > > > > Gerd,
> > > > > > 
> > > > > > if you are going to apply it, you'll need to update
> > > > > > expected tables for acpi test (rebuild-expected-aml.sh)
> > > > > > as a commit on top of this series.      
> > > > > 
> > > > > Sure?
> > > > > 
> > > > > Applied the series, ran "make check", no errors.    
> > > > it's a warning so far not a hard error but it's still there.    
> > > 
> > > Checked again, no warning printed here ...  
> > it works for me, I get something like:
> > GTESTER check-qtest-x86_64
> > acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-66EZCY.dsl, aml:/tmp/aml-MBFZCY], Expected [asl:/tmp/asl-N1N0CY.dsl, aml:tests/acpi-test-data/q35/DSDT.bridge].  
> 
> is iasl installed on the build system?
> This test is skipped if there's no iasl.
I've tried without iasl as well and it makes test fail
with error, so it's not Gerd's case.

> 
> >   
> > > 
> > > Also "git diff" doesn't list any changes after running the rebuild
> > > script.  
> > it work for as well,
> > just a wild guess, may be test for some reason doesn't use qemu with patches applied
> > that would result in test not seeing any changes.
> >   
> > > But when booting a live iso I can see the new QEMU0002 device listed
> > > in /proc/ioports.
> > > 
> > > Any clues what is going on here?
> > > 
> > > cheers,
> > >   Gerd
> > > 
> > >   

