Received: by 10.25.208.211 with SMTP id h202csp1607595lfg;
        Tue, 23 Feb 2016 00:52:04 -0800 (PST)
X-Received: by 10.140.242.16 with SMTP id n16mr43045549qhc.2.1456217524786;
        Tue, 23 Feb 2016 00:52:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t81si32986908qht.15.2016.02.23.00.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 00:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aY8hP-00041f-CB
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 03:52:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aY8hN-000419-HL
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 03:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aY8hI-0000qi-Ik
	for qemu-arm@nongnu.org; Tue, 23 Feb 2016 03:52:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aY8hI-0000q6-EI; Tue, 23 Feb 2016 03:51:56 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 30331C00230B;
	Tue, 23 Feb 2016 08:51:55 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1N8prIn023565; Tue, 23 Feb 2016 03:51:54 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 2F93A818F2; Tue, 23 Feb 2016 09:51:53 +0100 (CET)
Message-ID: <1456217512.29896.78.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Date: Tue, 23 Feb 2016 09:51:52 +0100
In-Reply-To: <20160222133015.6eece98e@nial.brq.redhat.com>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
	<20160222133015.6eece98e@nial.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
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
X-TUID: wPau5yzyIIU5

On Mo, 2016-02-22 at 13:30 +0100, Igor Mammedov wrote:
> On Fri, 19 Feb 2016 13:20:24 -0500
> "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
>=20
> Gerd,
>=20
> if you are going to apply it, you'll need to update
> expected tables for acpi test (rebuild-expected-aml.sh)
> as a commit on top of this series.

Sure?

Applied the series, ran "make check", no errors.

cheers,
  Gerd

