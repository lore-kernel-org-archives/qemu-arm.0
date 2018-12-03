Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7246865wrt;
        Mon, 3 Dec 2018 12:46:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wg8r5muqG4RQLMSytNKb63KAIMwkNR9ugfSX22Nj199ZrQUzK9XMw9xqtSKjWl6gTpd7Wx
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr16508915qke.89.1543869967831;
        Mon, 03 Dec 2018 12:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543869967; cv=none;
        d=google.com; s=arc-20160816;
        b=zQxXuXimMfqSNAEDOmsdqarzxU7n6xPz8sUb3UDp1bot8DAvSn5t1g1FrBVQngy1mX
         XA4+g3ORuEmuRz0+L/AKRQFyJPno5a8fxCiFixKb7AMKJnwm7nRpgfhKJZV7ffbMhc/2
         WTsDvgYF/LlnGnjSjpkNKORaJvye0k0qW2MdvJBuxQE9pEhpeqkoqollbiOmebZOJIlv
         /UGknjhBVQEByTpQZOagnDO7j2n+M3oL/cgwLHZrD31+zVr0617+fzjgUwLP5aR573w+
         i7rxxeGStee2Dvf1GY9ur59NrQNjTBjVkSzUEBKgZAj1/uv92rsYnd7l99oXcLESM3/p
         UZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=KcbXgik2EypxTPcMeLf2oIrKd+je5vFbHgAV41OBCz8=;
        b=zR+1AmdCQJCBz4n9m4Wp+QTwgQ6tbr2shIsVQG2j6IuFKfOGaQaWNDs2OoYV0k9HZz
         qiSMpxz1LFTGLvmrWrTOTD8iaUvRtPIVSTHvRcdxEwfCiEK5ZMWo2jLImjGhZjDmgBwm
         bVCjtpTFJAkpRvPD+NZK2Lf/iQxtEBuhbfpoaMHLyFHtYmvLtuJtFmDYH62KO1bW2EG2
         pvtr01d76mSCIxuBVPOn4OFZoUJI580Xmfqw+NSDKVQVWA96U99wu7xFrxJhDpU48SHJ
         msXUb1ZcJ0aprMbfyASfgMpj1HyNSAWb7YefX9YGmsvlkyT7r4G/WhCNZBPyHw10RqXz
         YbXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ejnJiOow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si31824qtd.99.2018.12.03.12.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 12:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ejnJiOow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:52397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTv6U-0004xN-QX
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 15:46:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gTv5Z-0003zn-Vd
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 15:45:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gTv5V-0005dm-Sc
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 15:45:09 -0500
Received: from mail-eopbgr760093.outbound.protection.outlook.com
	([40.107.76.93]:12800
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gTv5S-0005Wa-31; Mon, 03 Dec 2018 15:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KcbXgik2EypxTPcMeLf2oIrKd+je5vFbHgAV41OBCz8=;
	b=ejnJiOowqxGybytqYHd1Fh7tU1IpgLIvyMRG1do/F+KS5m8Wjq9oP8zIIV8TbTYVA1FM0a5fb2A4MilcwUwh2ZO4IyVPaLSKTlPMAKVubTxrD/hUSPHtlwseU5mr0RCPdeolVn0YLaxY/2TatsEalUVoKIhVGNByqAH5YvlgMjE=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4282.prod.exchangelabs.com (20.176.106.215) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.21; Mon, 3 Dec 2018 20:44:58 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%6]) with mapi id 15.20.1382.020;
	Mon, 3 Dec 2018 20:44:58 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64 bit
	registers, add PMCEID[23]
Thread-Index: AQHUgRe6PKv4vgGF2kKNh/7lbe8jmaVojB2AgAUDxwA=
Date: Mon, 3 Dec 2018 20:44:58 +0000
Message-ID: <20181203204452.GB5549@quinoa.localdomain>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-8-aaron@os.amperecomputing.com>
	<CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
In-Reply-To: <CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR19CA0057.namprd19.prod.outlook.com
	(2603:10b6:404:e3::19) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4282;
	6:V5HTHO9yrPyYNN0u3ho4k/8BYeyVdCKKYQjATmk0SvVRUPktpuQyk0rkq8XMwOtRnus6qEP3RBMFq3BPvuMwcb23wmO3V9Z3kU8pTYEg57OLHCFjIzviDvS/uLFjPITq1rpgGodpdy0tbh3uh0NRIMfqD1fAMiVYyBSFlRUcTnQ275P+M3Zq28eE9T8WVmpojTuXgDH4qkD079sjOvs3E+AFh0PxY3U+povVhYvWMUiA2wpnJIF4Gqib5uJ15jOmMVzRPrenSf/1NNkjZIMIlWaYl5XZKwIgfapYzyS+fGWj5iEJjAdrBYLJ5BNHKjW5nH+EtKJQGm1CysNJ6oj2rmExzNX+aUvCHQnaeIeCx3FETGQRuK+3a555i3mIsw6Hy3bcWkl5spb0txtJzgpenFkNKnkQDR7WC0udxQS3RdCDs4HvgBV56q0nv/bAKhH1JR5+W0pk/8p0IkdxJn1Fmw==;
	5:VgR3y9jbTI0q64GobzWFqDGI7C6Z5PAIq+j5/j81VLq46qKkHesMBN8hG6cLPaCjkTmWF+S2dXI2AbUI5P4G0RdFpgSDP+/qrIWfQJlgNDeLQ+sgqOVeJLWLbcsMOfllHrMkABMFakG/mhdbkxNxNsTMGf//of6edm6PgQPJzqo=;
	7:tx8z9LOgS+ZjzG56uIpSSnYRDbw7opno3s61QxQ1t/3xt4ACjGsvdrhJUY5dzZCt9MBpdyghNfemrhAr7bm38xc1ENWHjekp8x6RZfYYUBDXjQ9SZ+jpWbVbXkfV0R2pmwUz4stN0vpsPfSyoS6Cqg==
x-ms-office365-filtering-correlation-id: b41e66e8-8c48-47d3-3d1e-08d65960304b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(4534185)(4627221)(201703031133081)(201702281549075)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4282; 
x-ms-traffictypediagnostic: DM6PR01MB4282:
x-microsoft-antispam-prvs: <DM6PR01MB42827C21748D6A1002F25B308AAE0@DM6PR01MB4282.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231455)(999002)(944501493)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4282; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4282; 
x-forefront-prvs: 08756AC3C8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39850400004)(189003)(199004)(4326008)(476003)(6486002)(14444005)(256004)(486006)(446003)(11346002)(105586002)(106356001)(14454004)(5660300001)(6436002)(71190400001)(54906003)(316002)(97736004)(52116002)(33656002)(305945005)(71200400001)(86362001)(81166006)(6116002)(386003)(33896004)(8676002)(3846002)(6512007)(1076002)(8936002)(53936002)(68736007)(9686003)(2906002)(81156014)(6506007)(7736002)(76176011)(6246003)(39060400002)(102836004)(25786009)(99286004)(26005)(229853002)(66066001)(6916009)(478600001)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4282;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: xBNtQXmolVwy5F6QrhJg7bxlDN1fsDextxIxC64fQLSFHVMq0JsdiUle5SgP4VX44rfPkiLOADuGw6VsZFgn7sqnIGIC+Q8JmCsUqC3MQPCKb22vaYBlNymgHJoTMpraf67E/HAU59z1z1wC82vl9jhBppqiH6h1t9qjDqgt2cePqQe7EJ3zodA/S2Bs2J1a1Cmbsk8yzNPRk+2BnXjI2jrkuPC2cyeM97qrdSqXeQQXE+zhv3h3hRDCSFdyi0CQwiIqZkt8zCOJOrwQmhSs+qSw3YjGh3wiQIekVlyEtseL9IASfJH8jW3LxLDNAzHHOzpRqWAO4Z/BCMtBkZ7A2kivDhNcSfREaH+RITBsiDk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F9ED7D8D07CE33419A5868FD84E56832@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41e66e8-8c48-47d3-3d1e-08d65960304b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2018 20:44:58.4715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4282
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.76.93
Subject: Re: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Egup7u+DuwXv

On Nov 30 16:10, Peter Maydell wrote:
> On Tue, 20 Nov 2018 at 21:26, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> >
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---
> >  target/arm/cpu.h    |  4 ++--
> >  target/arm/helper.c | 12 ++++++++++--
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 627e5c1995..50de58e4a2 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -837,8 +837,8 @@ struct ARMCPU {
> >      uint32_t id_pfr0;
> >      uint32_t id_pfr1;
> >      uint32_t id_dfr0;
> > -    uint32_t pmceid0;
> > -    uint32_t pmceid1;
> > +    uint64_t pmceid0;
> > +    uint64_t pmceid1;
> >      uint32_t id_afr0;
> >      uint32_t id_mmfr0;
> >      uint32_t id_mmfr1;
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 71be6fb578..75f054fe79 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5432,7 +5432,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >              { .name =3D "PMCEID0", .state =3D ARM_CP_STATE_AA32,
> >                .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =
=3D 6,
> >                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D=
 ARM_CP_CONST,
> > -              .resetvalue =3D cpu->pmceid0 },
> > +              .resetvalue =3D extract64(cpu->pmceid0, 0, 32) },
> > +            { .name =3D "PMCEID2", .state =3D ARM_CP_STATE_AA32,
> > +              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =
=3D 4,
> > +              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D=
 ARM_CP_CONST,
> > +              .resetvalue =3D extract64(cpu->pmceid0, 32, 32) },
> >              { .name =3D "PMCEID0_EL0", .state =3D ARM_CP_STATE_AA64,
> >                .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2=
 =3D 6,
> >                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D=
 ARM_CP_CONST,
> > @@ -5440,7 +5444,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >              { .name =3D "PMCEID1", .state =3D ARM_CP_STATE_AA32,
> >                .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =
=3D 7,
> >                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D=
 ARM_CP_CONST,
> > -              .resetvalue =3D cpu->pmceid1 },
> > +              .resetvalue =3D extract64(cpu->pmceid1, 0, 32) },
> > +            { .name =3D "PMCEID3", .state =3D ARM_CP_STATE_AA32,
> > +              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =
=3D 5,
> > +              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D=
 ARM_CP_CONST,
> > +              .resetvalue =3D extract64(cpu->pmceid1, 32, 32) },
> >              { .name =3D "PMCEID1_EL0", .state =3D ARM_CP_STATE_AA64,
> >                .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2=
 =3D 7,
> >                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D=
 ARM_CP_CONST,
> > --
>=20
> PMCEID2 and PMCEID3 are only defined from ARMv8.1; before that they
> are UNDEFINED. So these registers need to be only defined if a
> suitable feature bit or ID register field check passes.

It looks like we don't currently support any ARMv8.1+ CPUs and don't
have an entry in the `arm_features` enum for it. I'll plan to add
ARM_FEATURE_V81 and make defining these registers depend on it, assuming
any future CPUs supporting it will use that, unless you feel I should do
something different.

-Aaron
