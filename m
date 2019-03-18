Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2479880wrt;
        Mon, 18 Mar 2019 08:18:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoXw17FyK5U1IBLsPM24jcZ4UeuTnzPzQgExhyqUFxAuaXGlQ4JItCU8auhLCGVTJek95l
X-Received: by 2002:a7b:c257:: with SMTP id b23mr731459wmj.83.1552922284668;
        Mon, 18 Mar 2019 08:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552922284; cv=none;
        d=google.com; s=arc-20160816;
        b=OU+5IEGJwD9qRlai1XyqFxuLqKUhYWLpGYJ0u6KrBlBNgdkOPebVDWwjudWhqG/2/2
         igpa9l7wtECuIj5cm/ATzjKCZAKqxvRfhNWUMiygPoECo6+RFzgcTYv4NcL74EqSMTfg
         DofjqC0/+cPorfiADJvxw7rGrDF3vLmHhvNi+KmWDRzGUU8qGovIBqACC6q9JpYEl/uO
         qMk7yCCe+c7D4Dcwu28vVWZskwOHKoHgiGen1Rz491AFTP0BFNFMJu/A7762SqKmH9dD
         fjnkEhqxH8ibt4I3tz4tB6AYQFrDerrtA06Tqbk2Qn3c8xpKihFNlShlXhOlJ2NVslzk
         vE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=VwnKy20+sIbeJ5Xag/C68HS4vEW4ZDbKQ4ad5SnSGgM=;
        b=kSUYEBQsZtdU5vOcEGWnL6WDBBXqhmAID7EhgVI9o7axvkDdACthdwcXeeMjCRj7F8
         tqa45R5knuCcYQzn/lxFJMBHRY6DBArzLDI6v+qlV+QNvQzZGwOoGe0ko01arJa1unqE
         Cg2189zTWgNNTcIv9ASE48TPzM6vhT54ztSGbDKcAMa/12ERvoz6sAVmrJBipYVp3abn
         ILR4FgMCHkaa3pxLTXvfiPHcyVe82j7Qc4rIzgnl5ns0ymKgLECX2VQdxgqdga33I/jh
         VhblibeMxbASOoHE4MXXGhoIIm/hqbQhsLAwzBRC6HRY1K1NYlxso+P88IZ4lTygJB4Y
         ocaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si6574915wrx.79.2019.03.18.08.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 08:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5u1b-0002mN-Mg
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 11:18:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h5u1D-0002WK-PU
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 11:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h5toh-0002x9-QC
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 11:04:48 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45372 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h5toh-0002rB-F8; Mon, 18 Mar 2019 11:04:43 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id D60062A99CF61BCF8245;
	Mon, 18 Mar 2019 15:04:37 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.154]) by
	lhreml703-cah.china.huawei.com ([10.201.108.44]) with mapi id
	14.03.0415.000; Mon, 18 Mar 2019 15:04:29 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event Device Support
Thread-Index: AQHU1aRx6gB8pew2Zky+o/nmKSdgvKYRYDWAgAAqb/A=
Date: Mon, 18 Mar 2019 15:04:28 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839316F30@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-10-shameerali.kolothum.thodi@huawei.com>
	<20190318132601.6cf82e50@redhat.com>
In-Reply-To: <20190318132601.6cf82e50@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event
 Device Support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPdGaWxa4HLN

Hi Igor,

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 18 March 2019 12:26
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event Device Supp=
ort
>=20
> On Fri, 8 Mar 2019 11:42:16 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > From: Samuel Ortiz <sameo@linux.intel.com>
> >
> > The ACPI Generic Event Device (GED) is a hardware-reduced specific
> > device that handles all platform events, including the hotplug ones.
> > This patch generate the AML code that defines GEDs.
> > Platforms need to specify their own GedEvent array to describe what kin=
d
> > of events they want to support through GED. The build_ged_aml routine
> > takes a GedEvent array that maps a specific GED event to an IRQ number.
> > Then we use that array to build both the _CRS and the _EVT section
> > of the GED device.
>=20
> I'd this a part of "virtual ACPI device"

Just to confirm, you meant, instead of separate virt-acpi.c and ged.c, move=
 the
contents of this patch into "virtual ACPI device" implementation (something=
 like=20
hw/acpi/generic-event-device.c) ?

Please let me know.

Thanks,
Shameer

> > This is in preparation for making use of GED for ARM/virt
> > platform and for now supports only memory hotplug.
> >
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> [...]
