Received: by 10.25.208.211 with SMTP id h202csp1350280lfg;
        Mon, 21 Mar 2016 08:56:25 -0700 (PDT)
X-Received: by 10.140.128.21 with SMTP id 21mr36111123qha.59.1458575785436;
        Mon, 21 Mar 2016 08:56:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e13si24553996qka.120.2016.03.21.08.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Mar 2016 08:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ai2Bt-0004Al-30
	for alex.bennee@linaro.org; Mon, 21 Mar 2016 11:56:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ai2Bp-0004AP-Mv
	for qemu-arm@nongnu.org; Mon, 21 Mar 2016 11:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ai2Bm-0000pP-H2
	for qemu-arm@nongnu.org; Mon, 21 Mar 2016 11:56:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1ai2Bm-0000pL-Bv; Mon, 21 Mar 2016 11:56:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id E85F664453;
	Mon, 21 Mar 2016 15:56:16 +0000 (UTC)
Received: from ovpn-200-31.brq.redhat.com (ovpn-200-31.brq.redhat.com
	[10.40.200.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2LFu8mf010235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 21 Mar 2016 11:56:12 -0400
Message-ID: <1458575767.3546.11.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 21 Mar 2016 16:56:07 +0100
In-Reply-To: <1458271654-23706-1-git-send-email-peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 21 Mar 2016 15:56:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, eblake@redhat.com
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
X-TUID: e1PAgxq6DG2e

On Fri, 2016-03-18 at 11:27 +0800, Peter Xu wrote:
> v5 changes:
> - patch 2: moved to target-arm/monitor.c (from target-arm/machine.c)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[Pete=
r]
> - patch 3: splitted into three patches: [all from Peter's comments]
> =C2=A0 - patch 3 (new): leverage kvm_arm_create_scratch_host_vcpu(), ti=
ny
> =C2=A0=C2=A0=C2=A0=C2=A0enhancement of old one to suite our need
> =C2=A0 - patch 4: introduce kvm_support_device() in kvm-all.c
> =C2=A0 - patch 5: do the implementation.

Tested on two separate aarch64 hosts, seems to work fine.

Cheers.

--=20
Andrea Bolognani
Software Engineer - Virtualization Team

