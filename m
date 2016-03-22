Received: by 10.25.208.211 with SMTP id h202csp1582684lfg;
        Mon, 21 Mar 2016 19:23:47 -0700 (PDT)
X-Received: by 10.55.71.195 with SMTP id u186mr44064522qka.38.1458613427150;
        Mon, 21 Mar 2016 19:23:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v18si26076377qhb.128.2016.03.21.19.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Mar 2016 19:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiBz0-0000u8-FH
	for alex.bennee@linaro.org; Mon, 21 Mar 2016 22:23:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiByv-0000u0-Av
	for qemu-arm@nongnu.org; Mon, 21 Mar 2016 22:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aiByq-000751-HW
	for qemu-arm@nongnu.org; Mon, 21 Mar 2016 22:23:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aiByq-00074x-Bf; Mon, 21 Mar 2016 22:23:36 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D63F9711CB;
	Tue, 22 Mar 2016 02:23:35 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-7-79.pek2.redhat.com [10.72.7.79])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2M2NR9E016934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 21 Mar 2016 22:23:30 -0400
Date: Tue, 22 Mar 2016 10:23:27 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160322022327.GA26867@pxdev.xzpeter.org>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458575767.3546.11.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1458575767.3546.11.camel@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 22 Mar 2016 02:23:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com,
	Libvirt Mailing List <libvir-list@redhat.com>, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v5 0/5] ARM: add query-gic-capabilities SMP
	command
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
X-TUID: VeEe4Jqn1Xrk

On Mon, Mar 21, 2016 at 04:56:07PM +0100, Andrea Bolognani wrote:
> On Fri, 2016-03-18 at 11:27 +0800, Peter Xu wrote:
> > v5 changes:
> > - patch 2: moved to target-arm/monitor.c (from target-arm/machine.c)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Pe=
ter]
> > - patch 3: splitted into three patches: [all from Peter's comments]
> > =C2=A0 - patch 3 (new): leverage kvm_arm_create_scratch_host_vcpu(), =
tiny
> > =C2=A0=C2=A0=C2=A0=C2=A0enhancement of old one to suite our need
> > =C2=A0 - patch 4: introduce kvm_support_device() in kvm-all.c
> > =C2=A0 - patch 5: do the implementation.
>=20
> Tested on two separate aarch64 hosts, seems to work fine.

Thanks Andrea!

Sorry I forgot to CC libvir-list. To avoid duplication, not
re-sending but CCing in this reply. If anyone interested, please
review in the following link:

https://lists.gnu.org/archive/html/qemu-devel/2016-03/msg04465.html

(which points to exactly current thread.)

Sorry for the inconvenience!

-- peterx
