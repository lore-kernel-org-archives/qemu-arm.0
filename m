Received: by 10.25.234.1 with SMTP id i1csp2052349lfh;
        Tue, 31 Jan 2017 11:07:49 -0800 (PST)
X-Received: by 10.55.8.12 with SMTP id 12mr30670818qki.74.1485889664422;
        Tue, 31 Jan 2017 11:07:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r127si12627355qkd.142.2017.01.31.11.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 11:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYdmG-0005an-2J
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 14:07:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cYdWK-00055m-IN
	for qemu-devel@nongnu.org; Tue, 31 Jan 2017 13:51:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cYdWJ-0003ZR-LN
	for qemu-devel@nongnu.org; Tue, 31 Jan 2017 13:51:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cYdWD-0003Xv-Md; Tue, 31 Jan 2017 13:51:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F3484DD49;
	Tue, 31 Jan 2017 18:51:05 +0000 (UTC)
Received: from [10.36.116.63] (ovpn-116-63.ams2.redhat.com [10.36.116.63])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0VIp2uN032647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 31 Jan 2017 13:51:04 -0500
To: Alex Williamson <alex.williamson@redhat.com>
References: <1485880595-16376-1-git-send-email-thuth@redhat.com>
	<20170131103044.66316989@t450s.home>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5f0bafdc-6bb8-d936-e38c-5be92c46efc6@redhat.com>
Date: Tue, 31 Jan 2017 19:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170131103044.66316989@t450s.home>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 31 Jan 2017 18:51:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/vfio: Add CONFIG switches for
 calxeda-xgmac and amd-xgbe
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u48q4wkBH/Vb

On 31.01.2017 18:30, Alex Williamson wrote:
> On Tue, 31 Jan 2017 17:36:35 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>=20
>> Both devices seem to be specific to the ARM platform. It's confusing
>> for the users if they show up on other target architectures, too
>> (e.g. when the user runs QEMU with "-device ?" to get a list of
>> supported devices). Thus let's introduce proper configuration switches
>> so that the devices are only compiled and included when they are
>> really required.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak | 2 ++
>>  hw/vfio/Makefile.objs           | 4 ++--
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-sof=
tmmu.mak
>> index 6de3e16..a78be51 100644
>> --- a/default-configs/arm-softmmu.mak
>> +++ b/default-configs/arm-softmmu.mak
>> @@ -94,6 +94,8 @@ CONFIG_VERSATILE_PCI=3Dy
>>  CONFIG_VERSATILE_I2C=3Dy
>> =20
>>  CONFIG_PCI_GENERIC=3Dy
>> +CONFIG_VFIO_XGMAC=3Dy
>> +CONFIG_VFIO_AMD_XGBE=3Dy
>> =20
>>  CONFIG_SDHCI=3Dy
>>  CONFIG_INTEGRATOR_DEBUG=3Dy
>> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
>> index c25e32b..05e7fbb 100644
>> --- a/hw/vfio/Makefile.objs
>> +++ b/hw/vfio/Makefile.objs
>> @@ -2,7 +2,7 @@ ifeq ($(CONFIG_LINUX), y)
>>  obj-$(CONFIG_SOFTMMU) +=3D common.o
>>  obj-$(CONFIG_PCI) +=3D pci.o pci-quirks.o
>>  obj-$(CONFIG_SOFTMMU) +=3D platform.o
>> -obj-$(CONFIG_SOFTMMU) +=3D calxeda-xgmac.o
>> -obj-$(CONFIG_SOFTMMU) +=3D amd-xgbe.o
>> +obj-$(CONFIG_VFIO_XGMAC) +=3D calxeda-xgmac.o
>> +obj-$(CONFIG_VFIO_AMD_XGBE) +=3D amd-xgbe.o
>>  obj-$(CONFIG_SOFTMMU) +=3D spapr.o
>>  endif
>=20
> I can't say that I fully agree that this is a good idea.  How many
> users are actually confused by this, versus the benefit of ensuring
> that it builds across all architectures?

Why do you want this to be build on all architectures? The devices are
only available on ARM as far as I know, so I can't see any real use for
this. And it slows down compilation time, too, if we compile it
everywhere (well, a little bit at least ;-)).

> Do we want to make platform also specific to ARM

I did not notice that one yet, since it does not show up in the "-device
?" help text (it's apparently an abstract device), so it also does not
really bother me.
But if I remove the device from the build, I get a funny error when I
try to view the device help text:

$ qemu-system-tricore -device ?
**
ERROR:/home/thuth/devel/qemu/qom/object.c:168:type_get_parent: assertion
failed: (type->parent_type !=3D NULL)
Aborted (core dumped)

So I guess we should rather keep that one for now.

> and spapr specific to ppc64?

I already tried that (with the already existing CONFIG_PSERIES), but the
code in common.c depends on the code in spapr.c, so it can't be removed
without reworking the code quite a bit. But spapr.c also does not really
bug me, since it does not register a type that shows up in the "-device
?" help text, so I think it is not worth the effort here.

 Thomas

