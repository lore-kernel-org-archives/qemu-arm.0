Received: by 10.25.208.211 with SMTP id h202csp2663849lfg;
        Thu, 3 Mar 2016 04:20:22 -0800 (PST)
X-Received: by 10.140.42.39 with SMTP id b36mr2459523qga.4.1457007622574;
        Thu, 03 Mar 2016 04:20:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21si9543844qkb.86.2016.03.03.04.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 04:20:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abSEw-0001HM-24
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 07:20:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1abSEZ-0000v9-Jk
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 07:20:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1abSEY-00088s-PQ
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 07:19:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1abSEU-00087a-H2; Thu, 03 Mar 2016 07:19:54 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E6AE9686;
	Thu,  3 Mar 2016 12:19:52 +0000 (UTC)
Received: from dhcp129-59.brq.redhat.com (dhcp129-59.brq.redhat.com
	[10.34.129.59])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23CJmJg027253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Mar 2016 07:19:49 -0500
Message-ID: <1457007587.4468.2.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 03 Mar 2016 13:19:47 +0100
In-Reply-To: <1456993272-32292-4-git-send-email-peterx@redhat.com>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
	<1456993272-32292-4-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	armbru@redhat.com, mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 3/3] arm: implement query-gic-capability
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
X-TUID: 0pcvepXhOq4y

On Thu, 2016-03-03 at 16:21 +0800, Peter Xu wrote:
> For emulated ARM VM, only gicv2 is supported. We need to add gicv3
in
> when emulated gicv3 ready. For KVM accelerated ARM VM, we detect the
> capability bits using ioctls.
>=C2=A0
> if we want to
know GIC kernel capabilities, we need to make sure we have
> enabled KVM when querying (like, with "-enable-kvm").
>=C2=A0
>
Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>=C2=A0=C2=A0target-arm/machine.c | 48
+++++++++++++++++++++++++++++++++++++++++++++++-
>=C2=A0=C2=A01 file changed, 47 insertions(+), 1 deletion(-)

Sorry for not catching this earlier, but I'm afraid this is not
going to work -- libvirt doesn't pass either -enable-kvm or the
machine option accel=3Dkvm when probing for capabilities, which
means that, with the current implementation, it will only get
information about emulated GIC.

Is there a way to make probing work without requiring KVM to
be enabled?

Cheers.

--=C2=A0
Andrea Bolognani
Software Engineer - Virtualization Team
