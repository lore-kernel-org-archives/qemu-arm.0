Received: by 10.25.208.211 with SMTP id h202csp1646727lfg;
        Tue, 23 Feb 2016 02:39:15 -0800 (PST)
X-Received: by 10.140.101.147 with SMTP id u19mr41790492qge.71.1456223955636;
        Tue, 23 Feb 2016 02:39:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e95si22429405qgd.14.2016.02.23.02.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 02:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55837 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYAN8-0006qq-T9
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 05:39:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aYAN5-0006nN-MW
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aYAN2-0006Zu-Go
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 05:39:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aYAN2-0006Zi-Bh; Tue, 23 Feb 2016 05:39:08 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B096B302491;
	Tue, 23 Feb 2016 10:39:07 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1NAd6fR002640; Tue, 23 Feb 2016 05:39:07 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 109228227D; Tue, 23 Feb 2016 11:39:06 +0100 (CET)
Message-ID: <1456223945.29896.89.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Tue, 23 Feb 2016 11:39:05 +0100
In-Reply-To: <20160223104839.5a51df9a@nial.brq.redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
	<1456217512.29896.78.camel@redhat.com>
	<20160223104839.5a51df9a@nial.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	"Gabriel L. Somlo" <somlo@cmu.edu>, ard.biesheuvel@linaro.org,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, pbonzini@redhat.com,
	lersek@redhat.com, rth@twiddle.net
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
X-TUID: z+plz7dhRhW9

On Di, 2016-02-23 at 10:48 +0100, Igor Mammedov wrote:
> On Tue, 23 Feb 2016 09:51:52 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> > On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:
> > > On Fri, 19 Feb 2016 13:20:24 -0500
> > > "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
> > >=20
> > > Gerd,
> > >=20
> > > if you are going to apply it, you'll need to update
> > > expected tables for acpi test (rebuild-expected-aml.sh)
> > > as a commit on top of this series. =20
> >=20
> > Sure?
> >=20
> > Applied the series, ran "make check", no errors.
> it's a warning so far not a hard error but it's still there.

Checked again, no warning printed here ...

Also "git diff" doesn't list any changes after running the rebuild
script.

But when booting a live iso I can see the new QEMU0002 device listed
in /proc/ioports.

Any clues what is going on here?

cheers,
  Gerd

