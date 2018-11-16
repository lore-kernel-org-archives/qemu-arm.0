Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp565633wrw;
        Fri, 16 Nov 2018 08:10:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5dTJiky4U1/XRz3jSraB6S3hPw1RTnyrcNZTpArLxygFnN5I3njqJ93aaIJ3xzrZJYF6Nt6
X-Received: by 2002:a37:27d2:: with SMTP id n201mr10910611qkn.18.1542384607907;
        Fri, 16 Nov 2018 08:10:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542384607; cv=none;
        d=google.com; s=arc-20160816;
        b=CHtxxKk41kUMgVaKmOYxF07lG/+D5UWDhEdNZkpYTqYQZ9VpenrwtjPX5k+v9d6Zsd
         AT8EQbNLiPZtGJPTBnkQ5FhFneJ1vXJIfyJtt/TMx5kyPXp/PNg0dxtyIgh2i0P/nkXl
         jn+0fWrqFY0ezKvnvruYMXbMcIC/5vh22hwgVRkeWsHMcNfxEV/iGH0Gks8JpniYgF5k
         4ZkqWI6Ee/dTbYGl/aLXDwB1dDTO1NKGIp2rFUweudLMFXL+cgXtA8xImy+N6nQnw4wl
         p6uONmOlGudQvsai89uBSV87RMWFnLJ/Qk9ir+rGX8nvT7pIuCzghiynU0qsdC7fwQji
         Ge0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=ZuVNCzrjKcJtKTI9G+KSyKFeWGTcJhmq9PaR0g8LwbU=;
        b=O4SfLAN4EGxWn9UleBKyuZwtA1COcyY9RxmEfYqnb0rdDTIChTDMJmyFwXapPA24YX
         RoNmJqFWpQmBbm/QbUgrFhp+TQpmi0X3hcNCUNDjRj69t1O7gKNhcjPG8BR+ehy3WDBl
         v2EFz5FzOK9mqFUuMezm1PY2zEZxrqgXCN4GBPIg2fqunD3eL6ZNxNb0Ltk6B9Q1Obng
         18T0D9Wlp2TctE131gQcFpve40c1kcL7Qm3f0WOyIDXWjIsRj6An8crJiCHK489YF39o
         Z33M6JM6GR8gFtILpt8dBuJ/LUOzXb4qOIx/IrtqcxsIIEi2ViEYFYfBhjF4USFE+Jpe
         FQTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=nkNuVMlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si424092qka.50.2018.11.16.08.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:10:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=nkNuVMlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:45523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNgh5-00074M-5a
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:10:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNggo-00072r-5p
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:09:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNggk-00018u-6s
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:09:50 -0500
Received: from mail-eopbgr820111.outbound.protection.outlook.com
	([40.107.82.111]:4368
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gNggi-00015S-C4; Fri, 16 Nov 2018 11:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZuVNCzrjKcJtKTI9G+KSyKFeWGTcJhmq9PaR0g8LwbU=;
	b=nkNuVMlMWuag6IQvcBe+DBsIMoOttXNbdgrChbekH0X5gCvNg+bYR4AbVL/lJka89couf43qUYJS+RwWOWCXoMr8MZlxxzGEmMhomfBPQHoSQ6TsxKMpm+vztM6autMtJK5jmG5Thsl6y5eeIx3tBSyufae4oq6pVbn5aMGaVIY=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4076.prod.exchangelabs.com (20.176.104.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Fri, 16 Nov 2018 16:09:18 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.045;
	Fri, 16 Nov 2018 16:09:18 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v7 03/12] target/arm: Swap PMU values before/after
	migrations
Thread-Index: AQHUdTie+eZYbSFIzE2VUuP1qr4hf6VSjcQAgAAVNIA=
Date: Fri, 16 Nov 2018 16:09:18 +0000
Message-ID: <20181116160909.GD23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-4-aaron@os.amperecomputing.com>
	<CAFEAcA9va2QarkMFPWNMf43u_GRDoajM-=E0dwinVEgaqRgjHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9va2QarkMFPWNMf43u_GRDoajM-=E0dwinVEgaqRgjHQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR1301CA0018.namprd13.prod.outlook.com
	(2603:10b6:405:29::31) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4076;
	6:FNTuPhbta5s3IxOZw86aPczxMRcqRP8l7lxmcv+FTHvSckVP6jPG31J/6tbX+9lVfxKAqrzOgORrLINWPgkcZw3KHhN5Boy+E//cvgTp2JbahOiss/pLPZ1dlAw4as3Y5ho/7NQe6FE30R4Z6fpnt9FszSS1jBA96UcZycGE70z6KEQEiFzZ2UzQFnKhG5IYlnbgYWTPHIjhJR/Xs+01hEwqWIJ7c9liPD7mTGWF40M4i2yhbRUX6fL1MIVEXJM8MZxqWepKarqxZm7zid1lZAxNKEV/L1FAZneG4CUTE7sj8LdDyqMlhhx6aDbd2mOAijwZTIpmfX/FknPaobg7JK/SywhSs3BAlNu8PlbXyLmAGNpb83HCiXwJXwmlw8jcoPxnghzZCH58RU8hXq6y8ATTGww2LqvduP/FAxa9etv5webyOWzkvmYBeCbczklcVvgXsreNlp7vd4pXqb7gnQ==;
	5:PiKnEvbsHsNDggLObFHt9JJRDRUtnLn04SbUqR3NCv/7efFsy+UhB4tJRBJqj0TQ4O5kRyUeO0deXE11rwKdZQ+q/jBz/JROebq8GIPCkvYZ+jljWrRVKDovo8xF4mPTDWjl5bcd8pd1PIlyHHMJVYioHvxKRRj5ksE/02hDje0=;
	7:4C5s3ysUDhzOELx0Wveby3hgPdulENZoXSOENCYwA3kA8Yp5TjbmsoEypU1v53I209j2wnHYYtOg0ojhIhC1lZ+tXePVVgsH6IWBtn8Z/06mMN+L+cn9030v10kmeIJICEgCE3RzpmCfCpS+igqPSQ==
x-ms-office365-filtering-correlation-id: 86b8751d-73b2-4bfc-d8a8-08d64bdddc87
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4076; 
x-ms-traffictypediagnostic: DM6PR01MB4076:
x-microsoft-antispam-prvs: <DM6PR01MB4076D29033FBA6F58D5792428ADD0@DM6PR01MB4076.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(35073007944872)(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231415)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4076; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4076; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(376002)(366004)(39830400003)(396003)(199004)(189003)(6246003)(86362001)(81166006)(66066001)(8936002)(14444005)(478600001)(25786009)(256004)(39060400002)(2900100001)(6486002)(4326008)(8676002)(229853002)(11346002)(6916009)(476003)(106356001)(81156014)(7736002)(7416002)(5660300001)(446003)(486006)(305945005)(54906003)(316002)(26005)(1076002)(68736007)(6116002)(105586002)(14454004)(2906002)(53546011)(9686003)(186003)(6512007)(6436002)(6506007)(3846002)(71190400001)(71200400001)(386003)(97736004)(102836004)(53936002)(33656002)(33896004)(52116002)(99286004)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4076;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: tyF6TBdLQlQm/q7m0MlQ/znDQvD3yn0lRLFRN79ZG/TOlLYXI8ayJfhjssheFBK6mtbpZNsEEC47eLMNNS5++DPalwxHMY1BhfMA2V07Paw1p+hoqsuQ2vDdMIlEFS9wO2Wht00Me//HvGhMAQozhqbZ7v6RgOaWAlIfKiTs6FqC+9jfoofnuc6/0j7JKe+8nWg12Tcc92gYRglJ3oki4X6xJz+H79GhwJn/VTOXZPUHXVzRhKVb74jtm2lSDRvnw9NthNBYWUQZPWNV6DFAA1gozDUWZgm8h+rzOKD53I2olyWwJxTsiQeFqzA5qJJlPa0pYGyuOr8GKXrnqagC0qhLt6SQd9YsBULq2NMBRoA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <83E306323E4A534A827D85B60C263480@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b8751d-73b2-4bfc-d8a8-08d64bdddc87
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 16:09:18.3624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4076
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.82.111
Subject: Re: [Qemu-arm] [PATCH v7 03/12] target/arm: Swap PMU values
 before/after migrations
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: otRqgGLrMDCF

On Nov 16 14:53, Peter Maydell wrote:
> On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com>=
 wrote:
> > Because of the PMU's design, many register accesses have side effects
> > which are inter-related, meaning that the normal method of saving CP
> > registers can result in inconsistent state. These side-effects are
> > largely handled in pmu_op_start/finish functions which can be called
> > before and after the state is saved/restored. By doing this and adding
> > raw read/write functions for the affected registers, we avoid
> > migration-related inconsistencies.
> >
> > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
>=20
> > --- a/target/arm/machine.c
> > +++ b/target/arm/machine.c
> > @@ -604,6 +604,8 @@ static int cpu_pre_save(void *opaque)
> >  {
> >      ARMCPU *cpu =3D opaque;
> >
> > +    pmu_op_start(&cpu->env);
> > +
> >      if (kvm_enabled()) {
> >          if (!write_kvmstate_to_list(cpu)) {
> >              /* This should never fail */
> > @@ -625,6 +627,20 @@ static int cpu_pre_save(void *opaque)
> >      return 0;
> >  }
> >
> > +static int cpu_post_save(void *opaque)
> > +{
> > +    ARMCPU *cpu =3D opaque;
> > +    pmu_op_finish(&cpu->env);
> > +    return 0;
> > +}
> > +
> > +static int cpu_pre_load(void *opaque)
> > +{
> > +    ARMCPU *cpu =3D opaque;
> > +    pmu_op_start(&cpu->env);
> > +    return 0;
> > +}
> > +
> >  static int cpu_post_load(void *opaque, int version_id)
> >  {
> >      ARMCPU *cpu =3D opaque;
> > @@ -672,6 +688,8 @@ static int cpu_post_load(void *opaque, int version_=
id)
> >      hw_breakpoint_update_all(cpu);
> >      hw_watchpoint_update_all(cpu);
> >
> > +    pmu_op_finish(&cpu->env);
> > +
> >      return 0;
> >  }
>=20
> This will end up calling pmu_op_start() and pmu_op_finish()
> even if the guest is running KVM and we're not using the
> TCG code. Is that what you intended?

The counters are still stored in their 'difference' format for KVM, so I
think this still makes sense. Or is there something I'm missing about
how this will interact with KVM? I'm much more familiar with TCG.

-Aaron
