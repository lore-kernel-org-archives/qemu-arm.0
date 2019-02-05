Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4780073wrt;
        Tue, 5 Feb 2019 05:42:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYOkUannLfpLBR+EFHIlJudX9xDavsWjka4bDGoA/hTOC0wYLgwLPuTIFDdmANTUGbiz1P5
X-Received: by 2002:a81:3604:: with SMTP id d4mr3862497ywa.177.1549374126515;
        Tue, 05 Feb 2019 05:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549374126; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUUJkFK6isdhl9Rai0OvZlD+v5up6NQkTAwWroB/4YfoY8Cwf6c/DIUzCWtI40Hiz/
         1VgK+3wJtN/qACC4qodBwkiBepOKNsz7CHJM5tclAlOPiEgUhBjJjryUOuPka/s3hKAE
         BsfwxgttZFgK36Gh4rgMveHNadW3ifGThjcRAwyQgskG8Db14E/udAvgWZzX5+lsH9fF
         CKbXiU9zvQ3tvVQD/Go9EBhVvUhHCsgxNYJxPRTukxvpf+KGujrv++H/JF5LpqtgNzBl
         kjLqBsodTwIsNoDvv9YL5ujk5+LaG2QL7wO2DrM8VYcpHY14ES90qgJiFybBs6FWyVEg
         6paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=PRd4JklRKrk/f5FAeZqPnd5q04CSBiiRdxcMFeSv6PE=;
        b=o3UeXrQuK+YOKVyhR6ekqKlgjtSte0oEJjca0ZywyS6IydBAEsLJAQTLW9sfYEMzWO
         VeiNFwWM4CUydH283oKL3soe4CEB21hK53tT/1aApGkjmH7RzIp7tQFBW3GEnFEp7rAX
         Ok0awddc2XmTTSEMQtn3SCvI+pko/Uampo963tEAEO84fgguLuWEeUml7zAUHuaJLCFO
         iUjISrHBpnjPKnL563me+B/qOgh/Oj32FbAiBtLemyeYxp261jbbuEO/u+iA3ncYlQhQ
         mFPTQADLNxJBdwXOSDk9zXitHqRZkBWPqrjWvAR222HXMZs6AuQDMUMrDWCfYeTWsz4b
         gXTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WirKnf72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r123si2092639ybr.323.2019.02.05.05.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:42:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WirKnf72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:60472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr0zF-0006XT-RB
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gr0yw-0006TH-Vv
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:41:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gr0yr-00052m-Mv
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:41:44 -0500
Received: from mail-eopbgr790111.outbound.protection.outlook.com
	([40.107.79.111]:59776
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gr0yk-0004tk-Ck; Tue, 05 Feb 2019 08:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PRd4JklRKrk/f5FAeZqPnd5q04CSBiiRdxcMFeSv6PE=;
	b=WirKnf72Y6ap1027w/ez+I6L47tctLLUDlQXLmNQHcMff3sFTFLvA+rwzKlakSpeqC4UvXB83xBCsonwcvVzmZZ+A8wFbbXuKltNFO0JSANYcfW73aiOErAaOGipecBZRCEmEvc+J0k2XZfpfUa0BT9uVtGRT3nnP17Zgiu0H5U=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4074.prod.exchangelabs.com (20.176.104.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.17; Tue, 5 Feb 2019 13:41:22 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1580.019;
	Tue, 5 Feb 2019 13:41:22 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Thread-Topic: [Qemu-arm] [PATCH v10 10/14] target/arm: Finish implementation
	of PM[X]EVCNTR and PM[X]EVTYPER
Thread-Index: AQHUkWUUpU91+XqpqEGtEsbwP87FgqXQWzSAgAEy+gA=
Date: Tue, 5 Feb 2019 13:41:22 +0000
Message-ID: <20190205134124.GM5213@quinoa.localdomain>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<20181211151945.29137-11-aaron@os.amperecomputing.com>
	<CABoDooPMwWR3TXxAqzoByeyuaReVmV0NFpWCJr897QL6r7n_nw@mail.gmail.com>
In-Reply-To: <CABoDooPMwWR3TXxAqzoByeyuaReVmV0NFpWCJr897QL6r7n_nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR13CA0046.namprd13.prod.outlook.com
	(2603:10b6:903:99::32) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4074;
	6:jetq5vNnPMlxP6+P88uKHmfz4O1ANsUJeKMO5JiQ3Z1Q/hdxA+21JPFc+uXLcbpn0i6GjPzmVNaBa+GtIH90jcY3Pvz27Un9VIXS3tmvMWVvQEenKkDUKSkibJ7YLw0zMbjxrwYxAUniyVC4Wk+Iluv8UDzf+k8A3VwtjQOFnRGEA/1v3OZnDAAg9iawbmKIB1mfHJ9w4NlqeDnBReaZ8l5OkaMkVVca+9LLqPkEKALSkKMRJ2U6sRzKqBJmsQ/I5QpGXfPHEDI72LAauN320idBwFOasYj8P0eIB2ixzFDfYmQpBBE3Fi/sQMMFln4eRDvbwhUH6KlYXRjy14f7xwh1MvFhkdpjaEfXL4lXTQjTOc7HOl1AfCxN6AhP97GfrVyNScB+YAaBewl0GzX9VH0nBk/WfSNM43A3z6qwRnldRSzje8X1KOj8cbZr5H3bR9lYqzkOmnlfkCyhVAhEsA==;
	5:iKVnIvBu6POuaCjeZkipy34TcblAgrXZ/iCtHsl3MGqydZAulR/bnGdpG+kWM7NGU3lyDBipdUQNVw78jDp1KMZC43WNcBklwDyiTrQCTVWpm8CNjTHfA/H3CoKPYg2LrSo971A0nIXsulT3mQRkcb/7L8H7r/GUVfJ7lL1DPLSy3lv/2BD6v2bRfTPPPu8GHXxZ0KjR35xOgCDPdM+Hrg==;
	7:g/H3CpSu1zQKo8ZbyBDgzwfz+RcmNUPcoEsYeSt6EccBShlSZCVNAEBHqvne1B9CvNMBbBEuXhdja+5KCqPqZUgmYuZCUDswYTEOjeGV93b5IticdUi7lH4pNjiQ0xSCV5GA7KQEeDKFguGAKWCAFA==
x-ms-office365-filtering-correlation-id: e0ea6859-3077-48ca-ac67-08d68b6f9d7d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4074; 
x-ms-traffictypediagnostic: DM6PR01MB4074:
x-microsoft-antispam-prvs: <DM6PR01MB40747394A86B3F7C6A11FB8D8A6E0@DM6PR01MB4074.prod.exchangelabs.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(366004)(376002)(136003)(346002)(189003)(199004)(106356001)(446003)(476003)(11346002)(105586002)(6512007)(9686003)(186003)(6116002)(6486002)(6436002)(3846002)(478600001)(14454004)(256004)(486006)(14444005)(33656002)(229853002)(66066001)(6916009)(97736004)(68736007)(53546011)(6506007)(386003)(2906002)(26005)(102836004)(305945005)(71200400001)(71190400001)(25786009)(33896004)(7736002)(1076003)(86362001)(81156014)(8936002)(81166006)(8676002)(52116002)(316002)(76176011)(99286004)(6246003)(54906003)(53936002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4074;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m7XuuCfNAR4oNIVAnHqhHsv9IZumgajEDxHu5MKFuYP0Sxj+uqP+MJEir6dHu+seZKcHsN984cCVBR0GCp+D+a0KxXigp67yBMBsI3L4F4zw2PDFmS7GZJCHzl5oUVuSAI5xMHTZRBoKATVJzFKd7/La2CJ+6FrphU62NYg+IOW7xui+hwR/8UH12lt9XHOikMkpM4hwWSqdLiUX82G6ufxZ3yzKYyw4UXPcJkisqs3Dv2rPAp5Eb4VAbZI+gqggeMlXRRSTYWMKAwHhjtl2JSUF4LViGVdEaunMpJRLiQ3gRCMeTl1897YJvRlSFfWK7h8p13YpI9w8Cl9nG18VYgiyNVFM42N6Vm4fUragb3z+WwW+LQNQgCWedCGXPEGujzMCkqFK0TXMqU45x3vpNGWbidYpXzJSWKof2vj/L7M=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3EAB37240C4294AA417EA393A085784@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ea6859-3077-48ca-ac67-08d68b6f9d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 13:41:21.1898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4074
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.79.111
Subject: Re: [Qemu-arm] [PATCH v10 10/14] target/arm: Finish implementation
 of PM[X]EVCNTR and PM[X]EVTYPER
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aaron Lindsay <alindsay@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NR1AdKf9BMC1

On Feb 04 20:22, Laurent Desnogues wrote:
> Hello,
>=20
> On Tue, Dec 11, 2018 at 4:25 PM Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> >
> > Add arrays to hold the registers, the definitions themselves, access
> > functions, and logic to reset counters when PMCR.P is set. Update
> > filtering code to support counters other than PMCCNTR. Support migratio=
n
> > with raw read/write functions.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/cpu.h    |   3 +
> >  target/arm/helper.c | 296 +++++++++++++++++++++++++++++++++++++++++---
> >  2 files changed, 282 insertions(+), 17 deletions(-)
> [...]
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index fd2923f033..1b851d1689 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> [...]
> > @@ -5301,6 +5526,43 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >          };
> >          define_one_arm_cp_reg(cpu, &pmcr);
> >          define_one_arm_cp_reg(cpu, &pmcr64);
> > +        for (i =3D 0; i < pmcrn; i++) {
> > +            char *pmevcntr_name =3D g_strdup_printf("PMEVCNTR%d", i);
> > +            char *pmevcntr_el0_name =3D g_strdup_printf("PMEVCNTR%d_EL=
0", i);
> > +            char *pmevtyper_name =3D g_strdup_printf("PMEVTYPER%d", i)=
;
> > +            char *pmevtyper_el0_name =3D g_strdup_printf("PMEVTYPER%d_=
EL0", i);
> > +            ARMCPRegInfo pmev_regs[] =3D {
> > +                { .name =3D pmevcntr_name, .cp =3D 15, .crn =3D 15,
> > +                  .crm =3D 8 | (3 & (i >> 3)), .opc1 =3D 0, .opc2 =3D =
i & 7,
> > +                  .access =3D PL0_RW, .type =3D ARM_CP_IO | ARM_CP_ALI=
AS,
> > +                  .readfn =3D pmevcntr_readfn, .writefn =3D pmevcntr_w=
ritefn,
> > +                  .accessfn =3D pmreg_access },
> > +                { .name =3D pmevcntr_el0_name, .state =3D ARM_CP_STATE=
_AA64,
> > +                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 15, .crm =3D 8 | =
(3 & (i >> 3)),
> > +                  .opc2 =3D i & 7, .access =3D PL0_RW, .accessfn =3D p=
mreg_access,
> > +                  .type =3D ARM_CP_IO,
> > +                  .readfn =3D pmevcntr_readfn, .writefn =3D pmevcntr_w=
ritefn,
> > +                  .raw_readfn =3D pmevcntr_rawread,
> > +                  .raw_writefn =3D pmevcntr_rawwrite },
> > +                { .name =3D pmevtyper_name, .cp =3D 15, .crn =3D 15,
> > +                  .crm =3D 12 | (3 & (i >> 3)), .opc1 =3D 0, .opc2 =3D=
 i & 7,
> > +                  .access =3D PL0_RW, .type =3D ARM_CP_IO | ARM_CP_ALI=
AS,
> > +                  .readfn =3D pmevtyper_readfn, .writefn =3D pmevtyper=
_writefn,
> > +                  .accessfn =3D pmreg_access },
> > +                { .name =3D pmevtyper_el0_name, .state =3D ARM_CP_STAT=
E_AA64,
> > +                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 15, .crm =3D 12 |=
 (3 & (i >> 3)),
>=20
> Looking at ARM documentation, I think the value for crn should be 14
> for PMEVCNTR<n>_EL0 and PMEVTYPER<n>_EL0.

You are correct. I'll post a fix momentarily.

Out of curiosity, how did you discover this? I've been using recent
Linux kernels for testing, and thought it used these registers, but I
guess it must only be using PMSELR/PMXEVCNTR/PMXEVTYPER.

-Aaron
