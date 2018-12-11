Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp668655wrt;
        Tue, 11 Dec 2018 06:47:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UWGoTHG4Tj52ozm3tnD2t7yiPhm0zQig4hGMGxTKbJqcK8CEdWC+Uplvcd054p3rB9FK9n
X-Received: by 2002:a37:c12:: with SMTP id 18mr14382265qkm.317.1544539640013;
        Tue, 11 Dec 2018 06:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544539640; cv=none;
        d=google.com; s=arc-20160816;
        b=hvHdBwuNfjX23U5GHorQnZZC6rMohY+OkYxQ1NEhVTwAWCxQ7INmCoEQb2IyHzsJFk
         pgfJ6Zmww5eDEj5+71p/wx/8VzWI36oVQRNpqPGI9Jzg1XNPDIoLmSs7+Qn+QR3hI0fF
         dwKmtAV5xClhT25K1u4Jibj0CEIJ8z9LCjsldTX8h7rfCkO6ZlPV5Rmh+lZOqfTtx9TO
         lFPvWiB2hxZb2acROYZO9Oj9PpUzOIM7cFo88T3e4twPw+vlu5JyoRtn5u6c9FNpOMk1
         sJzxCYs1qHwKHX774xEXAwazaV9fiv87vqW/Hq1ZehqLz9NawTXbXQ+H7DcJmvxBK4gR
         agSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=jfNFL54LX/+aqFNSbBXPwDDIaKroibQxR71+2lHWVo4=;
        b=XnN/bQHILMC3ksVbYvy6cwtRemBMndBQX/pJpEKAfNB+oVn5/0sDJo/wG1QkmSDTNj
         FufwZIdu9B/izGLvaXRUIheseKbIgskQZ50I7fO6Pl6afmFgT3uvIFL+tod8N4xpd3cd
         3Z5vBY6Qrg85mIvpoMMaM6IF9znyNas5l8/XVphMSTFoVOaAeYnqZjYawXbfELsBlSTP
         yo6hcSbRCJzvGInd3kxE2hh8nVqZFlKQrIIXTy/cp6YDbDPjZ8HBlKHSXt/CUx6dbJTl
         pUbyaHwJrciDRVBhZeGmf59nPMWBLtGzA2oRgO2F2TufKUzQXZouQ4qk7mED9HhmbMFV
         /j1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=O9TweudI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n27si1514708qtl.90.2018.12.11.06.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 06:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=O9TweudI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjJf-0001MS-Gb
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 09:47:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjJQ-0001LA-Te
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 09:47:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjJL-0002HX-Tx
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 09:47:04 -0500
Received: from mail-eopbgr740118.outbound.protection.outlook.com
	([40.107.74.118]:7712
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjJL-0002GJ-KZ; Tue, 11 Dec 2018 09:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jfNFL54LX/+aqFNSbBXPwDDIaKroibQxR71+2lHWVo4=;
	b=O9TweudII9az4BAb/vCVVg2RoxoFcm4nbLgWpwv+3ctSoglglyKpyiDZHGs4/Yu3acR9Rmkgr5hkHJIJkt9OvvUg0Gf1EBoiRRg/2TjjTkjrpksxjMXCMCZOrMybJcaPJwsQ1CEvcoGl/SlwG4keHDxCLz+RhbAVVc5GUpZj1mA=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4778.prod.exchangelabs.com (20.177.218.83) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.22; Tue, 11 Dec 2018 14:46:55 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 14:46:55 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v9 14/14] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUjKCBH4+nEctsG0urLUKE2jCLcaVx4U2AgAfGIgA=
Date: Tue, 11 Dec 2018 14:46:55 +0000
Message-ID: <20181211144648.GJ5549@quinoa.localdomain>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-15-aaron@os.amperecomputing.com>
	<CAFEAcA8Tt3ygYCZO7ZYkZPwmPQniBu6fLnr+RjNUAmgZdTT0kA@mail.gmail.com>
In-Reply-To: <CAFEAcA8Tt3ygYCZO7ZYkZPwmPQniBu6fLnr+RjNUAmgZdTT0kA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0024.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::37) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [65.190.6.212]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4778;
	6:0AAmUjN9GYSP5yYG98xr6nQkeUlW6+FsNKfMb4VHkAa4tAXARb92GGk1XiO8lymecpSu3c3H9mMoB/8QvuKGezvTsQ6c9SNjG0GZv1qAty/WvYGB8fl8rHIYWHOAEVyuBdYr1NMeEueNvPdC0Y/wCYoeLhUuoAQbvX0rQtr67N5YiqFDax9K77OZIniSY7ZXdEG7sEM6+L+lBSrlb+IhrPRaheZYyjmPOPyLjlYutLJaubZ4CeOj+bw/o4KzYti9fWfVamFuZ/kFrQ59nkux1ZEWY50pFv/boiUar8i2E8SERsLs7SLTPRg39oxbYhzbnXq6Da1NGPTRvvJPqsLERADhhqCpad5I4PVFtrTY+ZD2WwVbKKAC1YWJ1IpyJCgOEeGJsaDsmDY5lYBx+WUxVbspEiLVVPq2zGnWkVjFguhc5+pLVrDlD/XysRgl9lsUXOB96FA2n/z7GKvD1Kxdsw==;
	5:r0t+kKb2DkXkfPxoFyvQa/zgmOHkulo3KqeVTtxcKFsv4dJLBKZz+HvHwFfyTL/k5robL+exKTH7nUWWMc8TgYZCGtt1Zc6EMc0rV/i5FAC2kSXOavOVuNENVt5guzHRe8UHe4u2sOCYy92ITHMp5FHkRs0h5P5BzOLXT5OE0Y8=;
	7:o9K6FmRiUzQB67eLEftKzH6j7/GzMVgfsRO2OhXHqQZ1bSWfRfLUwX1EhPUfXhTsLTol7ikXIvkVi8dU+ivUxUrznA7SiC1H08wXX0CRnmK2vsDcdgA3aGgeXQ1OD88W4k94ArsjBYcnOQL81Xb/fg==
x-ms-office365-filtering-correlation-id: 1c17e56b-af17-423e-2672-08d65f777eb5
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4778; 
x-ms-traffictypediagnostic: DM6PR01MB4778:
x-microsoft-antispam-prvs: <DM6PR01MB47781E65EF59ACAF130088238AA60@DM6PR01MB4778.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4778; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4778; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(5660300001)(6916009)(8676002)(81156014)(97736004)(305945005)(71190400001)(33656002)(6436002)(81166006)(8936002)(39060400002)(1076002)(3846002)(6116002)(2906002)(6246003)(25786009)(6512007)(4326008)(229853002)(53936002)(6486002)(478600001)(256004)(105586002)(9686003)(102836004)(26005)(186003)(316002)(54906003)(99286004)(52116002)(386003)(106356001)(33896004)(6506007)(476003)(486006)(11346002)(76176011)(446003)(86362001)(71200400001)(7736002)(14454004)(68736007)(7416002)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4778;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: Uuc0qjfdzH76ukZp88PgUCY14dQ5uyVmwpPmDncZOHaka/2Jb/Uvqn6KcSd1z2eCYchqsyebNVyo+XPWD5rOGuddHVrfIbWNjvdbP9Uhw+9qP4+f5+X0eY8MnQLTvpwPHAef6iifR7csi6NGu/TdwYB3riHCP/3rCXOwludW1woE50MzilTOo+4uymlNGJjFJ3yPbWufrctUL/N8/Mt5AbXAvCtuiXcPd27kw0njHBb4Zm0jX+Yp7FHcN91yNOGEsnrx79eE/ynwciGAwqetuD7epqrNk30oYJFvYmB2JjC3+tVLEXwp5WSUPGK4i0Px
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3D4C75ADAC02D0448280294E5599843C@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c17e56b-af17-423e-2672-08d65f777eb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 14:46:55.6051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4778
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.118
Subject: Re: [Qemu-arm] [PATCH v9 14/14] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tTWm26B7ELB1

On Dec 06 16:03, Peter Maydell wrote:
> On Wed, 5 Dec 2018 at 13:44, Aaron Lindsay <aaron@os.amperecomputing.com>=
 wrote:
> >
> > Setup a QEMUTimer to get a callback when we expect counters to next
> > overflow and trigger an interrupt at that time.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---
> >  target/arm/cpu.c    |  12 +++++
> >  target/arm/cpu.h    |   7 +++
> >  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
> >  3 files changed, 139 insertions(+), 6 deletions(-)
> >
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -733,6 +733,8 @@ struct ARMCPU {
> >
> >      /* Timers used by the generic (architected) timer */
> >      QEMUTimer *gt_timer[NUM_GTIMERS];
> > +    /* Timer used by the PMU */
> > +    QEMUTimer *pmu_timer;
>=20
> We don't seem to migrate this timer state. Is that OK? If so,
> a brief comment somewhere with the rationale would be helpful.

cpu_post_load() calls pmccntr_op_finish() and pmevcntr_op_finish() for
each counter via pmu_op_finish(). They handle setting the timer
according to the restored counters' state. I'll add a comment here at
the definition unless you prefer somewhere else.

-Aaron
