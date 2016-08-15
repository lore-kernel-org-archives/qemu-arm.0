Received: by 10.25.21.156 with SMTP id 28csp1339642lfv;
        Mon, 15 Aug 2016 02:31:19 -0700 (PDT)
X-Received: by 10.237.59.51 with SMTP id p48mr31345158qte.95.1471253479704;
        Mon, 15 Aug 2016 02:31:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b65si847197qkf.1.2016.08.15.02.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 02:31:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZEEp-0008KC-6K
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 05:31:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZEEk-0008Jr-7c
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 05:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZEEg-00075r-1Z
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 05:31:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bZEEf-00075a-Rl; Mon, 15 Aug 2016 05:31:09 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61B348553C;
	Mon, 15 Aug 2016 09:31:08 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7F9V47R001140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Aug 2016 05:31:05 -0400
Message-ID: <1471253464.3003.5.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Mon, 15 Aug 2016 11:31:04 +0200
In-Reply-To: <1471067570-7503-1-git-send-email-wei@redhat.com>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 15 Aug 2016 09:31:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V1 1/1] arm64: Add an option to turn on/off
 host-backed vPMU support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YGl+yVwlgzH7


On Sat, 2016-08-13 at 00:52 -0500, Wei Huang wrote:
> This patch adds a pmu=3D[on/off] option to enable/disable host vPMU
> support in guest VM. There are several reasons to justify this option.
> First, host-backed vPMU can be problematic for cross-migration between
> different SoC as perf counters are architecture-dependent. It is more
> flexible to have an option to turn it on/off. Secondly this option
> matches the "pmu" option as supported in libvirt tool.
>=C2=A0
> Note that, like "has_el3", the "pmu" option is only made available on
> CPUs that support host-backed vPMU. They include:
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* cortex-a53 + kvm
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* cortex-a57 + kvm
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* host + kvm
> This option is removed in other configs where it doesn't make sense
> (e.g. cortex-a57 + TCG); and the default pmu support is off. This patch
> has been tested under both DT/ACPI modes.
>=C2=A0
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>=C2=A0=C2=A0hw/arm/virt-acpi-build.c |=C2=A0=C2=A02 +-
>=C2=A0=C2=A0hw/arm/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
>=C2=A0=C2=A0target-arm/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 13 +++++++++++++
>=C2=A0=C2=A0target-arm/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A03 ++-
>=C2=A0=C2=A0target-arm/cpu64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
|=C2=A0=C2=A06 ++++++
>=C2=A0=C2=A0target-arm/kvm64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 10 +++++-----
>=C2=A0=C2=A06 files changed, 28 insertions(+), 8 deletions(-)

Did you already try driving this with libvirt? It should work
out of the box.

If you haven't, I will do it :)

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
