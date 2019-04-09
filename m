Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4567372wrx;
        Tue, 9 Apr 2019 03:43:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7wC1vFw1rbP7lD6AtrPaZLm9c0X5EMRQ6Qqo2P7sYjkTO1yoqexSpMxxmOQ3CzW813cT2
X-Received: by 2002:a5d:6a8a:: with SMTP id s10mr23482344wru.66.1554806626060;
        Tue, 09 Apr 2019 03:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554806626; cv=none;
        d=google.com; s=arc-20160816;
        b=hLyBLLzSRqH19fU1v7PBNABQgqvbRasmKY7nag6SauhtApu63g5tAcTPFZiaKTfGHy
         UcbUM7QMv1UecAAFnoiwaAqIhAGZ4D/lYaSGhlpVXbKDSIgF4yMJKw7+u8DcOzW31sJr
         fJedGWPj+ix77dlsG5HEaJxpJBUSi4nvSRjozCXp63A6Jj+DIuuq5B1BW2QmevMU0lDf
         RGa0JI6O1sRIzgPzzRikZXVnoc2HPmrEtqg45bscbaldn3xA+kum+S+u7IKEiiQG6gbG
         nJTCLh0Kb5GpjosUqK57AMIiUmWWBuDmKPNG3vsMS5gDzBph9yMxDAgn2YwxXB0UUaJ5
         IaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=bv8qIdMelCtqm2GN/nvo00P6zL25CuaL99/fOkf8iAs=;
        b=ixKRXa2RmBVD6z65sX4pEXR3pxw5leT6ErbsVGcJohwCLB+nz9DI0yFU0DHe21IERJ
         WRbOKvgBkuR1gaBvvdUXzETyogtOTqY4Fnt5bgU5+nR22XMBfpM5iSfnVxmQrcQRoRXY
         Lo4z63lYgjOJkyds0we4HY1xeoI0DYOkFi+s3eZU5y+reFQoo5IFhDzGv6zdJBTsch43
         KywKdC/3em4bGoMu0AGNXx2oIGjOeEVCFh/drpcRonMQx79XO7r3Dwf/ilgUGM1cIHI7
         xlMpJ8fMWu5arDPG2ZKd9gfXQF7dTPMlX+dDk27d4Y6Vh0QmgAWBcXmfOSY+ZMvZsqne
         RyWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si20787066wrv.2.2019.04.09.03.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDoED-0006yX-5R
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:43:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDoE2-0006yB-RF
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:43:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDoE1-0004nt-SS
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:43:34 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45388 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDoE1-0004nR-II; Tue, 09 Apr 2019 06:43:33 -0400
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 6A5F8AEE51A49630A611;
	Tue,  9 Apr 2019 11:43:31 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.229]) by
	lhreml708-cah.china.huawei.com ([10.201.108.49]) with mapi id
	14.03.0415.000; Tue, 9 Apr 2019 11:43:25 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
	feature "fdt"
Thread-Index: AQHU39PgLS6qaIxo3EqaH9uSQe0Wh6YiZMSAgAAFAfCAADi+gIAAAGKAgAALywCABJiAgIABuf+AgAACnwCAATC0gIAAM+4AgAAJpICAAD95YIAHQ2EAgAHMzWA=
Date: Tue, 9 Apr 2019 10:43:25 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83935C5D0@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
	<459862f9-18f7-0a37-dfb9-b8ca9aa6a2d2@redhat.com>
	<3de6adf3-30c7-5908-e153-2195bc6879c5@redhat.com>
	<9e939ea4-4be2-a165-dce4-47d8196020b0@redhat.com>
	<20190403114901.6e4ea653@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839353082@lhreml524-mbs.china.huawei.com>
	<ebf745ce-f5bc-be0c-c0ce-3ce25bd7afa9@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8393564E2@lhreml524-mbs.china.huawei.com>
	<20190408101132.5d849d1f@redhat.com>
In-Reply-To: <20190408101132.5d849d1f@redhat.com>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Laszlo Ersek <lersek@redhat.com>, Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: haQDFTUrmafK



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 08 April 2019 09:12
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Laszlo Ersek <lersek@redhat.com>; Auger Eric <eric.auger@redhat.com>;
> Ard Biesheuvel <ard.biesheuvel@linaro.org>; peter.maydell@linaro.org;
> sameo@linux.intel.com; qemu-devel@nongnu.org; Linuxarm
> <linuxarm@huawei.com>; shannon.zhaosl@gmail.com;
> qemu-arm@nongnu.org; xuwei (O) <xuwei5@huawei.com>;
> sebastien.boeuf@intel.com; Leif Lindholm <Leif.Lindholm@arm.com>
> Subject: Re: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
> feature "fdt"

[...]
=20
> > > > If the above is correct(with 32-bit variant of UEFI, OS cannot have=
 ACPI
> boot),
> > > > then do we really have the issue of memory becoming non
> > > hot-un-unpluggable?
> > > > May be I am missing something.
> > >
> > > I think Igor and Peter dislike adding complex logic to QEMU that
> > > reflects the behavior of a specific firmware. AIUI their objection is=
n't
> > > that it wouldn't work, but that it's not the right thing to do, from =
a
> > > design perspective.
> >
> > Understood. Hope we can converge on something soon.
> Lets try adding a parameter to memory descriptors in DT that would mark
> them as hotpluggable.

Just send out v4 incorporating this. Please take a look and let me know.

Thanks,
Shameer
=20
