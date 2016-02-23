Received: by 10.25.208.211 with SMTP id h202csp1569416lfg;
        Mon, 22 Feb 2016 23:07:33 -0800 (PST)
X-Received: by 10.140.105.195 with SMTP id c61mr39022537qgf.40.1456211253781;
        Mon, 22 Feb 2016 23:07:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si32801612qka.72.2016.02.22.23.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 23:07:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY74H-0004kv-0M
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 02:07:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aY74E-0004kn-JC
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 02:07:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aY749-0000lh-Kj
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 02:07:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aY749-0000la-FJ; Tue, 23 Feb 2016 02:07:25 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 10A72C0006F1;
	Tue, 23 Feb 2016 07:07:25 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1N77N9U029336; Tue, 23 Feb 2016 02:07:24 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 03853818F2; Tue, 23 Feb 2016 08:07:17 +0100 (CET)
Message-ID: <1456211237.29896.72.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 23 Feb 2016 08:07:17 +0100
In-Reply-To: <20160222220400-mutt-send-email-mst@redhat.com>
References: <1456144729-17196-1-git-send-email-mst@redhat.com>
	<1456151216.29896.63.camel@redhat.com>
	<20160222220400-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"Gabriel L. Somlo" <somlo@cmu.edu>, qemu-devel@nongnu.org,
	Michael Walle <michael@walle.cc>, Kevin
	O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
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
X-TUID: 8izy/DifEh6P

On Mo, 2016-02-22 at 22:12 +0200, Michael S. Tsirkin wrote:
> On Mon, Feb 22, 2016 at 03:26:56PM +0100, Gerd Hoffmann wrote:
> > On Mo, 2016-02-22 at 14:41 +0200, Michael S. Tsirkin wrote:
> > > Useful to send guest data back to QEMU.
> >=20
> > Use case?
> >=20
> > cheers,
> >   Gerd
>=20
> VM GEN ID at least wants to pass address of some blob
> in guest memory to host.
>=20
> Apparently, that's also useful for nvdimm.
>=20
> A reasonable way to do that seems to be to write it into
> fw cfg file, this way it's also migrated automatically.

Both seem to be about acpi aml code talking to qemu backend.

Not sure fw_cfg files are reasonable for that, given that you have to
fetch the directory listing, parse it to figure the entry index, ...

I want see a patch actually using that before going to merge it.

cheers,
  Gerd

