Received: by 10.25.208.211 with SMTP id h202csp1614642lfg;
        Tue, 23 Feb 2016 01:09:53 -0800 (PST)
X-Received: by 10.55.71.66 with SMTP id u63mr39871883qka.67.1456218592928;
        Tue, 23 Feb 2016 01:09:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si6164475qki.19.2016.02.23.01.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 01:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY8ye-00007k-C6
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 04:09:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY8yO-00083d-OG
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:09:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aY8yK-0005F8-Lh
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 04:09:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aY8yK-0005Em-Gr; Tue, 23 Feb 2016 04:09:32 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D0C7AC000718;
	Tue, 23 Feb 2016 09:09:31 +0000 (UTC)
Received: from redhat.com (vpn1-6-142.ams2.redhat.com [10.36.6.142])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1N99Q8O018577; Tue, 23 Feb 2016 04:09:27 -0500
Date: Tue, 23 Feb 2016 11:09:26 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20160223110710-mutt-send-email-mst@redhat.com>
References: <1456144729-17196-1-git-send-email-mst@redhat.com>
	<1456151216.29896.63.camel@redhat.com>
	<20160222220400-mutt-send-email-mst@redhat.com>
	<1456211237.29896.72.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456211237.29896.72.camel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"Gabriel L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC] fw-cfg: support writeable
	blobs
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
X-TUID: SD2cvtIV3XAT

On Tue, Feb 23, 2016 at 08:07:17AM +0100, Gerd Hoffmann wrote:
> On Mo, 2016-02-22 at 22:12 +0200, Michael S. Tsirkin wrote:
> > On Mon, Feb 22, 2016 at 03:26:56PM +0100, Gerd Hoffmann wrote:
> > > On Mo, 2016-02-22 at 14:41 +0200, Michael S. Tsirkin wrote:
> > > > Useful to send guest data back to QEMU.
> > > 
> > > Use case?
> > > 
> > > cheers,
> > >   Gerd
> > 
> > VM GEN ID at least wants to pass address of some blob
> > in guest memory to host.
> > 
> > Apparently, that's also useful for nvdimm.
> > 
> > A reasonable way to do that seems to be to write it into
> > fw cfg file, this way it's also migrated automatically.
> 
> Both seem to be about acpi aml code talking to qemu backend.

At least not for gen id - there will be a linker patch
to initialize that.

> Not sure fw_cfg files are reasonable for that, given that you have to
> fetch the directory listing, parse it to figure the entry index, ...
> 
> I want see a patch actually using that before going to merge it.
> 
> cheers,
>   Gerd

Absolutely, this makes sense.

-- 
MST
