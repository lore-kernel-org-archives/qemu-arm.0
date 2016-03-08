Received: by 10.25.208.211 with SMTP id h202csp1739313lfg;
        Mon, 7 Mar 2016 21:20:33 -0800 (PST)
X-Received: by 10.141.2.11 with SMTP id e11mr35345673qhd.69.1457414432956;
        Mon, 07 Mar 2016 21:20:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u82si1325355qki.124.2016.03.07.21.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 21:20:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adA4O-0005vL-6k
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 00:20:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adA4K-0005v0-8d
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:20:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adA4F-0002Eb-7u
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:20:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1adA4F-0002EH-2e; Tue, 08 Mar 2016 00:20:23 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9F1717208F;
	Tue,  8 Mar 2016 05:20:20 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-5-232.pek2.redhat.com [10.72.5.232])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u285K873012805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 8 Mar 2016 00:20:13 -0500
Date: Tue, 8 Mar 2016 13:20:07 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160308052007.GB2377@pxdev.xzpeter.org>
References: <1457324608-11434-1-git-send-email-peterx@redhat.com>
	<1457344554.4468.12.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1457344554.4468.12.camel@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 08 Mar 2016 05:20:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v3 0/3] ARM: add query-gic-capability SMP
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
X-TUID: TNx0TSUxTKcJ

On Mon, Mar 07, 2016 at 10:55:54AM +0100, Andrea Bolognani wrote:
> I tested this both on a v2-only machine
>=20
> =C2=A0 {"return": [
> =C2=A0=C2=A0=C2=A0=C2=A0{"emulated": false, "version": 3, "kernel": fal=
se},
> =C2=A0=C2=A0=C2=A0=C2=A0{"emulated": true, "version": 2, "kernel": true=
}
> =C2=A0 ]}
>=20
> and on a v3-only machine
>=20
> =C2=A0 {"return": [
> =C2=A0=C2=A0=C2=A0=C2=A0{"emulated": false, "version": 3, "kernel": tru=
e},
> =C2=A0=C2=A0=C2=A0=C2=A0{"emulated": true, "version": 2, "kernel": fals=
e}
> =C2=A0 ]}
>=20
> The output looks good to me - I'll leave reviewing the
> implementation to someone with more QEMU knowledge than me, that
> is, any QEMU knowledge at all ;)

Appreciated for helping verify this! :-)

>=20
> One last, purely cosmetic, bit: should the command name be
> query-gic-capabilities rather than query-gic-capability? Any
> native speaker feels like weighing in?

Yah, it seems that "query-gic-capabilities" sounds better. Will use
that in next spin if no one oppose.

Thanks!
Peter
