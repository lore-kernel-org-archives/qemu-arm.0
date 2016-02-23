Received: by 10.25.208.211 with SMTP id h202csp1654045lfg;
        Tue, 23 Feb 2016 03:00:17 -0800 (PST)
X-Received: by 10.55.212.1 with SMTP id l1mr14583004qki.93.1456225217490;
        Tue, 23 Feb 2016 03:00:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g51si22462574qge.96.2016.02.23.03.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 03:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYAhV-0002o4-23
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 06:00:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aYAe8-0005ZN-Es
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aYAe5-0002YR-Nk
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:56:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aYAe5-0002YN-I7; Tue, 23 Feb 2016 05:56:45 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 0B58D155DE;
	Tue, 23 Feb 2016 10:56:45 +0000 (UTC)
Received: from redhat.com (vpn1-6-142.ams2.redhat.com [10.36.6.142])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1NAudnW018362; Tue, 23 Feb 2016 05:56:40 -0500
Date: Tue, 23 Feb 2016 12:56:39 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20160223125604-mutt-send-email-mst@redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
	<1456217512.29896.78.camel@redhat.com>
	<20160223104839.5a51df9a@nial.brq.redhat.com>
	<1456223945.29896.89.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456223945.29896.89.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
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
X-TUID: yKZj8AvZfwT/

On Tue, Feb 23, 2016 at 11:39:05AM +0100, Gerd Hoffmann wrote:
> On Di, 2016-02-23 at 10:48 +0100, Igor Mammedov wrote:
> > On Tue, 23 Feb 2016 09:51:52 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > 
> > > On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:
> > > > On Fri, 19 Feb 2016 13:20:24 -0500
> > > > "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
> > > > 
> > > > Gerd,
> > > > 
> > > > if you are going to apply it, you'll need to update
> > > > expected tables for acpi test (rebuild-expected-aml.sh)
> > > > as a commit on top of this series.  
> > > 
> > > Sure?
> > > 
> > > Applied the series, ran "make check", no errors.
> > it's a warning so far not a hard error but it's still there.
> 
> Checked again, no warning printed here ...
> 
> Also "git diff" doesn't list any changes after running the rebuild
> script.
> 
> But when booting a live iso I can see the new QEMU0002 device listed
> in /proc/ioports.
> 
> Any clues what is going on here?
> 
> cheers,
>   Gerd

I'll look into this Thursday when I get to this.

-- 
MST
