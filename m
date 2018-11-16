Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp860528wrw;
        Fri, 16 Nov 2018 13:07:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5fGjx96QvfDSoDnuLaaUFdN6faVIF4D6vQbnccn5IE5M2mS4IoR/AnFGQc0h+6jQnWtr5rE
X-Received: by 2002:ad4:4391:: with SMTP id s17mr12023422qvr.32.1542402420968;
        Fri, 16 Nov 2018 13:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542402420; cv=none;
        d=google.com; s=arc-20160816;
        b=o9JOslWyNE9/l7KIoUmXIkt95ZfoHMw23ErIPolDY2mToKhmJrRTaEYfd+VLzq26kC
         Z7NIgsfPXaP+XV/dTGIBrevF9Ckw416bGdHX/wjh7QxAFDAyH4Lqb4++8M+9powq8/MZ
         cFboLkJ8CBGrpZbHrVoHZ4zPCpSVOAtmKaY/8f5IDob8VXdlnzsZAI41rcSAhf2FDTYB
         m1hSC2pVUXb30MMYGhWoBSNRR7GpGPT+20hU+RFqBfRhqCPTO0ucbQc8m20VaTMERLGr
         CJfkAx5JD+yMj3m2GiMj7uZSxxciz72oqMGNl44KIKDCXbkXCQqfXXuu0y4Q8SxnPt9D
         77HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=+Xo8IAvhZN9Ta7j3F3i4iJP/7r4V65tj40P5L8RDd2w=;
        b=v1zWH993ffaEQL3rVRKrkyJFrzv7CEot6AM0FQC91LngfA3qWQ/bbZtudQU7HGe6qS
         qIWKCXAfeEWdqscxX4RU0MwU8WK0/ZUvAeX5t2LR6jcTbru8GMSXddKmehaaUuqFqq9Q
         1BcFy0w3ivosa/SlrJFDHH+0yAUmshPNcwLXt1gxN6olXgjDN+YIzs8K2L6Mt+mxG+Nz
         NEQWuzQHbTZWo3pdyeZR883UQ1N5Pq5w33za2ZXMpRPkEWgGIp5hsC02dr9+s4Yn07fs
         25Y7quTMslKDyv6iWW59RRKZFDWpF/BLsQ4z8mQuc1YMpbgcG2rDIvke5YVtJVxkmCi8
         CGQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=n8Yi0z7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si4916743qve.150.2018.11.16.13.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 13:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=n8Yi0z7r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:46995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNlKO-0002XX-A4
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 16:07:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNlKG-0002XO-W7
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:06:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNlKC-00031J-2q
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:06:52 -0500
Received: from mail-eopbgr780108.outbound.protection.outlook.com
	([40.107.78.108]:36960
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gNlKB-0002zU-Pd; Fri, 16 Nov 2018 16:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+Xo8IAvhZN9Ta7j3F3i4iJP/7r4V65tj40P5L8RDd2w=;
	b=n8Yi0z7rFSGi1nbRrJnOiaw1omVzNZ4XJKT4nhkrvPPLB1/XgBQXR9vqEd/L8GW8EhfViGZa54MxEHjGbWeZNTPmstKIKVGI9xv2rsf94v6y7/2P6ga8djGLEFq6YvgYJDD9KSG/vLUaqQ+lLOJAVnSjBJ+KV7zFBOVSGlSpBQ4=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5195.prod.exchangelabs.com (20.176.122.32) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.20; Fri, 16 Nov 2018 21:06:44 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.045;
	Fri, 16 Nov 2018 21:06:44 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v7 03/12] target/arm: Swap PMU values before/after
	migrations
Thread-Index: AQHUdTie+eZYbSFIzE2VUuP1qr4hf6VSjcQAgAAVNICAAAnqAIAASTCA
Date: Fri, 16 Nov 2018 21:06:44 +0000
Message-ID: <20181116210635.GF23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-4-aaron@os.amperecomputing.com>
	<CAFEAcA9va2QarkMFPWNMf43u_GRDoajM-=E0dwinVEgaqRgjHQ@mail.gmail.com>
	<20181116160909.GD23658@quinoa.localdomain>
	<CAFEAcA-FMcrYXfD97G4ezSOpvWExA5s8X+gVzbV1ojYg9vq_gw@mail.gmail.com>
In-Reply-To: <CAFEAcA-FMcrYXfD97G4ezSOpvWExA5s8X+gVzbV1ojYg9vq_gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR0101CA0032.prod.exchangelabs.com
	(2603:10b6:405:2a::45) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5195;
	6:yLh9SxUNSe5mGFO2ZLvh+LuQGjlP5PQLqwJR6xu6uwVRMc7TSdzJQKL2jrbg4Kn9Kpa5BbEHJ8OkdgHq1w08Ct29rMe2FICi9Vb2orTbC1FoZfNEvn1Fn7pidlpaKK4AH1CPXkoDkLY2haxfO/zXFMKsWr9uRDSwi130btBRXXNQppm4nqzC3MnDFt9VtLyY4uaQ51fGh7vyJErxUqlLbAoKdwQrr4AlZE8kUG0fLfyeXAoYO5fQ9nQHtWHVe383YqJDO5/ilnkBOwv9soDLndJxGc/Wz9E3s/B1h6lIYDS/jbK5kEeYilemfYrbWyt12BX9PuV47qkcQWOYdlNunjQkBCILHbMGDtFA90GQ1FC+sJ++wCXuVAkQZVeD1An0TVB43GRH+GlL89/UVnTB/lcKmuOjdCQKLnLuJZ3M5DPdAn6t4pqOVdSkaNcEKjIVhbH6orG0bbu5skWjRfbFBQ==;
	5:1OARG6gAA9JjquJGh+vJSu7a/c8fjTd1zArlt4TdgfMvXaKXPLbXArN+akUJv5+VE7JA4/KURDBL7iqE+6D9XYnOTpNZTRJwNQd0TVIoSZ28YS1bDvT7Jb/UuprxppG1yCBa0sNqv5c8T1fj53tzmd+er137lYl/7Q9LOg2DLLY=;
	7:3qsi+CNbZnDgpJ39VeDWhLrENCAcIO6qzvaojDoW1p3Z09/x69xlbkz7gFgazV58GzUGQjRkbOMyvzGSnpaS+J5256z2ZgX6b1HkMJoeCujqHDolGGFKnEUwQ2XnnAXVINe08tnYIAiQG2h5az1vhA==
x-ms-office365-filtering-correlation-id: 0bbb2543-c223-486b-ec07-08d64c076986
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5195; 
x-ms-traffictypediagnostic: DM6PR01MB5195:
x-microsoft-antispam-prvs: <DM6PR01MB5195AF6A2673FE80242A84A48ADD0@DM6PR01MB5195.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231415)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5195; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5195; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(346002)(39840400004)(376002)(366004)(199004)(189003)(1076002)(7416002)(76176011)(316002)(102836004)(6512007)(6916009)(68736007)(33656002)(476003)(99286004)(6116002)(4326008)(3846002)(386003)(486006)(54906003)(33896004)(53546011)(39060400002)(6506007)(9686003)(446003)(478600001)(52116002)(11346002)(8936002)(6486002)(71200400001)(305945005)(256004)(66066001)(81156014)(81166006)(14444005)(106356001)(53936002)(105586002)(7736002)(25786009)(71190400001)(2906002)(6436002)(26005)(86362001)(8676002)(5660300001)(186003)(14454004)(97736004)(229853002)(2900100001)(93886005)(6246003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5195;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: RvP5EomjcKPLfTKEQJrQWhUTltbKzrscF9hAyyXiHA8YtCgWEsoLIP9nfZ8D//M977ztKl/q28FJhd1B6beucreoAHQU0L5Dejg55A+bbhqK0rj+dUmgbXQ1b+eaQGu51mvlrCEtg3unfnQ6xjcdeA07fabNEFsEc1xKYdA9m8XhBpWVN6OD7XA8zHFyiurHXYpFwNPT7HSS2NVXbah6Yvt+fubFtNLZYBkU93jUb6oZgIW0ZpppWuQ3FTPQE9wKUta2/t4cKbfsHfZNaxShAX3pDBlrB7tohb0TLyP+OIQVl2qVSm1uTSjd7iMLnvPcmKhrwuSCwRqKvmJS6UGz1CRxSZ00FyL0BtjNqEfphrY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E5F93F76303B544983D763443E63D25@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbb2543-c223-486b-ec07-08d64c076986
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 21:06:44.3591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5195
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.108
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
X-TUID: FgbbkggrrKQs

On Nov 16 16:44, Peter Maydell wrote:
> On 16 November 2018 at 16:09, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> > On Nov 16 14:53, Peter Maydell wrote:
> >> On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.c=
om> wrote:
> >> > Because of the PMU's design, many register accesses have side effect=
s
> >> > which are inter-related, meaning that the normal method of saving CP
> >> > registers can result in inconsistent state. These side-effects are
> >> > largely handled in pmu_op_start/finish functions which can be called
> >> > before and after the state is saved/restored. By doing this and addi=
ng
> >> > raw read/write functions for the affected registers, we avoid
> >> > migration-related inconsistencies.
> >> >
> >> > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> >>
> >> > --- a/target/arm/machine.c
> >> > +++ b/target/arm/machine.c
> >> > @@ -604,6 +604,8 @@ static int cpu_pre_save(void *opaque)
> >> >  {
> >> >      ARMCPU *cpu =3D opaque;
> >> >
> >> > +    pmu_op_start(&cpu->env);
> >> > +
> >> >      if (kvm_enabled()) {
> >> >          if (!write_kvmstate_to_list(cpu)) {
> >> >              /* This should never fail */
> >> > @@ -625,6 +627,20 @@ static int cpu_pre_save(void *opaque)
> >> >      return 0;
> >> >  }
> >> >
> >> > +static int cpu_post_save(void *opaque)
> >> > +{
> >> > +    ARMCPU *cpu =3D opaque;
> >> > +    pmu_op_finish(&cpu->env);
> >> > +    return 0;
> >> > +}
> >> > +
> >> > +static int cpu_pre_load(void *opaque)
> >> > +{
> >> > +    ARMCPU *cpu =3D opaque;
> >> > +    pmu_op_start(&cpu->env);
> >> > +    return 0;
> >> > +}
> >> > +
> >> >  static int cpu_post_load(void *opaque, int version_id)
> >> >  {
> >> >      ARMCPU *cpu =3D opaque;
> >> > @@ -672,6 +688,8 @@ static int cpu_post_load(void *opaque, int versi=
on_id)
> >> >      hw_breakpoint_update_all(cpu);
> >> >      hw_watchpoint_update_all(cpu);
> >> >
> >> > +    pmu_op_finish(&cpu->env);
> >> > +
> >> >      return 0;
> >> >  }
> >>
> >> This will end up calling pmu_op_start() and pmu_op_finish()
> >> even if the guest is running KVM and we're not using the
> >> TCG code. Is that what you intended?
> >
> > The counters are still stored in their 'difference' format for KVM, so =
I
> > think this still makes sense. Or is there something I'm missing about
> > how this will interact with KVM? I'm much more familiar with TCG.
>=20
> For KVM the counter values are stored in the kernel, until the
> write_kvmstate_to_list() function (which is performed after your
> pmu_op_start() call in cpu_pre_save()) writes them from the
> kernel into the cpreg_vmstate array. Similarly on load they
> go straight from the vmstate array into the kernel registers.
> It's not clear to me what the pmu_op_start()/finish() calls
> are intended to do in the KVM case, and they look at fields
> in the env->cp15 struct which will not have valid values at
> this point.

Oh, I had a fundamental misunderstanding and expected the registers
would be in env->cp15 when this was called, even for KVM.

After looking into this more, it seems like my pmu_op_* calls here
should be contained in `if (!kvm_enabled())` blocks. It doesn't seem
like anything bad would happen otherwise, but it also isn't necessary or
helpful to make those calls.

I'll make this change for v8 if you don't have further feedback.

-Aaron
