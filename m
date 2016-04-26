Received: by 10.25.208.194 with SMTP id h185csp1442086lfg;
        Tue, 26 Apr 2016 04:18:34 -0700 (PDT)
X-Received: by 10.141.42.71 with SMTP id t68mr1574329qhe.102.1461669514714;
        Tue, 26 Apr 2016 04:18:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m131si13207851qke.164.2016.04.26.04.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 04:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1av10k-0007Cw-4A
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 07:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1av10g-0007AA-OE
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 07:18:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1av10c-0006co-CL
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 07:18:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1av10c-0006cX-5S; Tue, 26 Apr 2016 07:18:26 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B79E62645;
	Tue, 26 Apr 2016 11:18:24 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QBIKdn013963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 26 Apr 2016 07:18:22 -0400
Date: Tue, 26 Apr 2016 13:18:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160426111820.qupirzbhbihbwylj@hawk.localdomain>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-4-git-send-email-zhaoshenglong@huawei.com>
	<20160425124232.zdjgvmwrykkrouas@hawk.localdomain>
	<571E205E.3040508@linaro.org> <571F4C29.8030503@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <571F4C29.8030503@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Apr 2016 11:18:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 3/3] hw/arm/virt-acpi-build:
 Add PMU IRQ number in ACPI table
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
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3xGfGwvcUQJR

On Tue, Apr 26, 2016 at 07:08:25PM +0800, Shannon Zhao wrote:
>=20
>=20
> On 2016/4/25 21:49, Shannon Zhao wrote:
> > On 2016=E5=B9=B404=E6=9C=8825=E6=97=A5 20:42, Andrew Jones wrote:
> >> > On Mon, Apr 25, 2016 at 03:11:46PM +0800, Shannon Zhao wrote:
> >>>> >> > From: Shannon Zhao <shannon.zhao@linaro.org>
> >>>> >> >=20
> >>>> >> > Add PMU IRQ number in ACPI table, then we can use PMU in gues=
t through
> >>>> >> > ACPI.
> >>>> >> >=20
> >>>> >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >>>> >> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> >>>> >> > ---
> >>>> >> >  hw/arm/virt-acpi-build.c | 3 +++
> >>>> >> >  1 file changed, 3 insertions(+)
> >> > Question: for testing of this, did you use
> >> > https://lkml.org/lkml/2016/4/12/755 ?
> > Actually I didn't test PMU with ACPI since I didn't notice the patch
> > series you point out and it's very obvious for QEMU changes(adding ir=
q
> > flag and irq number in GICC). I will have a test later.
>=20
> I have test this patch series using ACPI and guest with the patches you
> point out. Guest prints below logs and perf works well in guest.
>=20
> [    0.000000] ACPI-PMU: Assign CPU 0 girq 23 level 0
> [    0.000000] ACPI-PMU: Assign CPU 1 girq 23 level 0
> [    0.000000] ACPI-PMU: Assign CPU 2 girq 23 level 0
> [    0.000000] ACPI-PMU: Assign CPU 3 girq 23 level 0
> [...]
> [    0.094782] ACPI-PMU: Setting up 4 PMUs for CPU type D07

Thanks for the additional testing Shannon!

drew
