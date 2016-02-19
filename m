Received: by 10.25.208.211 with SMTP id h202csp1001043lfg;
        Thu, 18 Feb 2016 23:08:50 -0800 (PST)
X-Received: by 10.140.148.83 with SMTP id 80mr14818721qhu.49.1455865729858;
        Thu, 18 Feb 2016 23:08:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si12812805qhc.14.2016.02.18.23.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 23:08:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWfBJ-0002sR-02
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 02:08:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aWfBG-0002q0-UY
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 02:08:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1aWfBB-0007cb-VX
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 02:08:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1aWfBB-0007cU-Pk; Fri, 19 Feb 2016 02:08:41 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id B69398E760;
	Fri, 19 Feb 2016 07:08:40 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-34.ams2.redhat.com
	[10.36.116.34])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1J78dlx024332; Fri, 19 Feb 2016 02:08:39 -0500
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 6238B8080D; Fri, 19 Feb 2016 08:08:38 +0100 (CET)
Message-ID: <1455865718.29896.1.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Date: Fri, 19 Feb 2016 08:08:38 +0100
In-Reply-To: <20160216234959.GA25564@GLSMBP.INI.CMU.EDU>
References: <1455228365-13666-1-git-send-email-somlo@cmu.edu>
	<20160216234959.GA25564@GLSMBP.INI.CMU.EDU>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
	lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [PATCH v8 0/5] add ACPI node for fw_cfg on pc and arm
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
X-TUID: kn+CqrQ6mvuz

On Di, 2016-02-16 at 18:49 -0500, Gabriel L. Somlo wrote:
> On Thu, Feb 11, 2016 at 05:06:00PM -0500, Gabriel L. Somlo wrote:
> > Generate an ACPI DSDT node for fw_cfg on pc and arm guests.
> >=20
> > New since v7:
> >=20
> > 	- edited commit blurb on 3/5 to match updated content, i.e. that
> > 	  the ACPI node is now inserted into the DSDT (no longer the SSDT).
> > 	  (Thanks to Igor Mammedov for catching that!)
>=20
> BTW, regarding Igor's question about Windows starting to search for a
> driver: Just for grins, I installed Windows 10 (with qemu git master
> *before* this series was applied). Then, after applying the series,
> DeviceManager was happy and had no unknown hardware listed.

Igor?  Could I have a review for the acpi bits?  Then I can prepare a
fw_cfg pull request early next week with this and the fw-cfg-dma
migration fix from laszlo

thanks,
  Gerd

