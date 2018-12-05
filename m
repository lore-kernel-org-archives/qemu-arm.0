Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9514291wrt;
        Wed, 5 Dec 2018 07:33:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UIvEqlwvsuSaOUWqxfCtQneBtuSb42YCFh36BDJyIjClQllBOzFTBG52Wy8YlFkRkeCJ9O
X-Received: by 2002:ac8:5241:: with SMTP id y1mr24533890qtn.22.1544023993984;
        Wed, 05 Dec 2018 07:33:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544023993; cv=none;
        d=google.com; s=arc-20160816;
        b=eK5nlcCVk62G+Rr/203jqnjWZ3/346RmsMcbj+4OXlZWU3UcU209VQTr6IQH+LlWXO
         ojMSKALc1t0v+8Ww7/7JXdoDE1HOJ3nH3b07utcSPBzL8l3krWAF3IjHVHyVFhlAWnnb
         W5BSHgiR1pqmPzm//BAfbU4lxvTtJSoN6hgBpnLqaVPB9N99hwWr7Gytiqo+Qr54+tNh
         voJcoCSnMcpYG/qOa7xQj9WBnvQRIZQz+swJvTcrQ/qjC6GXxQYGj03ft/IUZRJ0WPKs
         eH4wpTwQpWA+pmQ8ZBm92ZTmjlcQ0Uy7FAR7yuhKtu27pZxXKhN9L5yfB0wgA/2fVD4t
         FSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=5NrxJRM4iKJ6l3FE9K55lttBYhi/pKJ991SnW3tsFug=;
        b=t8he0XnzZcZ09yAERiWOtxI0K+y3139+jC8nEz8KbL7vbXF7g5enB8XKG20QR8SVTN
         vJ45niNcrIvbq8ZAzQrcH0FNyfuxyTrv0OzWupRKyodYNLyz/ibTTnWOWxgT/H6kX9JS
         gJy2iB3/iusWHza9fYg2SLJY+S6/LnJHnjQu3M/Dj+9+qiO+IRinb3bPyvchQ7xHon26
         Ceyo0bK+Vf7hvZswS/dBLz0yZYdt8D3yMvukwcpkUtIVOsnOM4v6taQwwm4+EIFvGdQb
         2zqXSY7f3PdwHZ3uJEFAcPd8sPUNAa89/3oFbEnEqOTmSE++Em2YIFvW9FC8i+fvA2Vb
         U77Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="JmEmr/Po";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z13si2279612qvm.24.2018.12.05.07.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 07:33:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="JmEmr/Po";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:35158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUZAn-00024W-HA
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 10:33:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUZAV-000236-VS
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 10:32:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUZAQ-0007KP-R6
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 10:32:55 -0500
Received: from mail-eopbgr730090.outbound.protection.outlook.com
	([40.107.73.90]:21268
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUZAQ-0007JH-IK; Wed, 05 Dec 2018 10:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5NrxJRM4iKJ6l3FE9K55lttBYhi/pKJ991SnW3tsFug=;
	b=JmEmr/PoLs0YlNw8trXnJNUjIrDPv21ba3tXGbNVBEkWWKlmTMf3a4IpRwZTz10ekXZJZDF7dWpgMOkGTbmXG5zz5vCH1njOFqA8032c3v4C5xxUZUoEWAxvlO7FqGgja8hwniC4RFrB4ffOEZZskWnIHEVwfiD2A6DJINxAfGc=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4908.prod.exchangelabs.com (20.176.119.97) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Wed, 5 Dec 2018 15:32:47 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 15:32:47 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0 64 bit
	registers, add PMCEID[23]
Thread-Index: AQHUjKB9mlVV58tpVkyEdwuwq+dkTKVwRkUA
Date: Wed, 5 Dec 2018 15:32:47 +0000
Message-ID: <20181205153242.GE5549@quinoa.localdomain>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
	<20181205134243.4791-9-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-9-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR18CA0003.namprd18.prod.outlook.com
	(2603:10b6:404:121::13) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4908;
	6:0ua+TOK0QIbux15AWSOkEJu68pAJVui8uPmny+HDs7iHaLUcH1lNUBy2nXEGTizO7h/BI/M4SCkeWgYYMO0IUay0Wgxl+ZLvgF9GWZpM6sDBBo2i9SQXBlPLGSikKiFomDZ5weQsgB5vbLEMsAEaQ7F8MPU85IT0svCdwUecYNT7PA2//6xeeuI+g4wanMkvnx34VDCHHRPHfPYh2wQ3aGmRO3/Ix7p7Mtf+Y2Kpcp7Y5zpXDORkdckv2MDydjCtSWEdvRZI9wW4QRnBrPGQ6Joa5rgwuAxHqmYRGa5vyicba9OO+8KcUyzxaMCYHFsuZHOBnANSMZtoee2F48gKYgoh0+j6Ky+AzTZoZ+u10F19bo06MX5Q2QO4NpIpgrxepOYPp90dcw/KJsVRhcCee3Oi3Msnbt6BCMDV3ZUrxEmz1j0vd9Qll5ktkN4Yi7fJzpuWspvGQBb97BSo6rfTbg==;
	5:CpXH+vr2CT2rGxKWQysybgKr/rKrGsp5pQDeTXmKg3bFrFxEKYdbf6YIfFBDq3cFqTO6jiZ6RVIs1xPL6ad/xRWXhSi0SgXr9C4BYJpV4FVor7Zze/wzO4efgIJjssCVnpHOj+2ZCfkzb14LkRPTn4LOlYO4KUVyZno30hbY+rY=;
	7:XmRQAunk1e0KggwKrsraSJ9s9P0FJ7VEyKDsImSg6nXFvdFpfc7Sag1W+2mV180uolSfsbYbgx5ClmXABcqTcgfxJprAUrfZw6Pr9c2mWnId8kYlmmL1odo+ZIwZ2FtXPeMfzmd+iYoWJwwPK3hryQ==
x-ms-office365-filtering-correlation-id: 82334da3-7092-4766-d291-08d65ac6e89b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4908; 
x-ms-traffictypediagnostic: DM6PR01MB4908:
x-microsoft-antispam-prvs: <DM6PR01MB4908EF4FDAC7DC5AE05B312A8AA80@DM6PR01MB4908.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4908; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4908; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(229853002)(186003)(14444005)(6506007)(110136005)(386003)(54906003)(4326008)(99286004)(8936002)(6436002)(9686003)(6512007)(33896004)(6486002)(66066001)(478600001)(8676002)(14454004)(81156014)(81166006)(39060400002)(25786009)(52116002)(102836004)(76176011)(256004)(26005)(316002)(68736007)(1076002)(71200400001)(2906002)(71190400001)(105586002)(3846002)(6116002)(106356001)(97736004)(53936002)(446003)(33656002)(7736002)(6246003)(11346002)(305945005)(86362001)(486006)(476003)(5660300001)(2501003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4908;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: EjB5fE9U75eynb4T+qdlDxaDE1wl/rklNBAi5ev6FA/Bpuj+nSZI9ir7Wd4qrC43SQDpP9veQ1PCaShmarwbWPtsjuTsdollULNRih5TX6K/Qa6VoToAjzlLyute0GyQyc70fTLdP78wItl1I1JMZ7rYVYxK/eQJ2sz5OnSUMh87+AJeK5DbReJrmSVyR0r+JPSfcS4i2HkXXAYw1mzDTYxRo7c/cM4WCOrcpK4l43xSc6C6W/F0qB7n5fNzHs80+W/Dw2FyLvp9noe6bZh5Tvyfd6eQnW6OUacxX0HtfNfLj/sMIxRVDDxbBKKfAEc3wkag1FWo+m1TnB5Fv7+3Flv1DZNKgsk8f93hTNQc6zs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12FB09A4256A9741A986DDE93F67ED51@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82334da3-7092-4766-d291-08d65ac6e89b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 15:32:47.5023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4908
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.90
Subject: Re: [Qemu-arm] [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0 64
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eL5F0Dx8Y61t

On Dec 05 08:43, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/cpu.h    |  4 ++--
>  target/arm/helper.c | 18 ++++++++++++++++--
>  2 files changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 304e6e47b3..4216fe22db 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -837,8 +837,8 @@ struct ARMCPU {
>      uint32_t id_pfr0;
>      uint32_t id_pfr1;
>      uint32_t id_dfr0;
> -    uint32_t pmceid0;
> -    uint32_t pmceid1;
> +    uint64_t pmceid0;
> +    uint64_t pmceid1;
>      uint32_t id_afr0;
>      uint32_t id_mmfr0;
>      uint32_t id_mmfr1;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 71be6fb578..fb6939e99c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5256,6 +5256,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      } else {
>          define_arm_cp_regs(cpu, not_v7_cp_reginfo);
>      }
> +    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >=3D 4) {

After further discussion on my last version, this should be

if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >=3D 4 &&
	FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) !=3D 0xf) {

to guard against defining these registers for implementation-defined
PMUs.

> +        ARMCPRegInfo v81_pmu_regs[] =3D {
> +            { .name =3D "PMCEID2", .state =3D ARM_CP_STATE_AA32,
> +              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =
=3D 4,
> +              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D A=
RM_CP_CONST,
> +              .resetvalue =3D extract64(cpu->pmceid0, 32, 32) },
> +            { .name =3D "PMCEID3", .state =3D ARM_CP_STATE_AA32,
> +              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =
=3D 5,
> +              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D A=
RM_CP_CONST,
> +              .resetvalue =3D extract64(cpu->pmceid1, 32, 32) },
> +            REGINFO_SENTINEL
> +        };
> +        define_arm_cp_regs(cpu, v81_pmu_regs);
> +    }
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          /* AArch64 ID registers, which all have impdef reset values.
>           * Note that within the ID register ranges the unused slots
> @@ -5432,7 +5446,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name =3D "PMCEID0", .state =3D ARM_CP_STATE_AA32,
>                .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =
=3D 6,
>                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D A=
RM_CP_CONST,
> -              .resetvalue =3D cpu->pmceid0 },
> +              .resetvalue =3D extract64(cpu->pmceid0, 0, 32) },
>              { .name =3D "PMCEID0_EL0", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =
=3D 6,
>                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D A=
RM_CP_CONST,
> @@ -5440,7 +5454,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name =3D "PMCEID1", .state =3D ARM_CP_STATE_AA32,
>                .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =
=3D 7,
>                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D A=
RM_CP_CONST,
> -              .resetvalue =3D cpu->pmceid1 },
> +              .resetvalue =3D extract64(cpu->pmceid1, 0, 32) },
>              { .name =3D "PMCEID1_EL0", .state =3D ARM_CP_STATE_AA64,
>                .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =
=3D 7,
>                .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D A=
RM_CP_CONST,
> --=20
> 2.19.1
>=20
