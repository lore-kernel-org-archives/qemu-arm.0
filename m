Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7233882wrt;
        Mon, 3 Dec 2018 12:30:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wc1M+EoU0c6pqQiJfW4xBNDeihr67xF8RrKJR2VVWSKlYPZVbp825ui5mKnDYHuqJ/mSTG
X-Received: by 2002:a37:9d8a:: with SMTP id g132mr16582168qke.192.1543869039090;
        Mon, 03 Dec 2018 12:30:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543869039; cv=none;
        d=google.com; s=arc-20160816;
        b=ehr/KDBOI6VOoVp0qcgBsYZ7GwWBYNTTPNQkfCU8Zzh4rxS6FL4HFI77MeR+Q1mejD
         Hjc+2QdeXs6VVis4F4myGNJLQfpdmm9SNP3VfvrX37XEcx2YaK3PqgjWD6c5sRSRJemB
         hFc1uB3KLnPcjB0e5AfCRcsTM7vDWuYjbbN76uGSUzqkIfgIfVhdKRmvw/889j3WPHrM
         WKN202UzKJkYwR4bpZ9l1ovbgaNT+Ma17j+mNVWZ6jHl2dkrM708hw891T2Ii31re2kY
         KzIgHIUgPJ+CVfJ8AHiiywRh2t1NZKAgMOAYWd6IMvovK+TRgP/6TnMDnfKs8FsAAy2o
         kpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=sD6w2UN30naeZ0Al88MDnfV4PAE9jirPqRljzYsMpEI=;
        b=B90SJUAXq6W40Nebryvo8WXKbzd6zfjKyBdawtnDlVSwoonzeTUC/D8CnfnLPZ0GFw
         fppP+7k+jhNKNAvp/vBhuy3YkJ0nvnDHxTS7JoKXDFXpd9AKhgx2FfypZF0hkoDtQNpa
         7ZaxtGraKEM5LGPgXyk1+R0jSHlJGMyQ2/JHgNzTEXVG755HTmGjX++faUhZMgxvpl9H
         jnc7t25ArKEHeRdiFTmn5BUXEacs69WTsDW6XezmC0h2tbqkIEk8CVLP++EAcIjZr43z
         ceL5luUNQVoPursn+V/AEv7+Y1HpFUzSTEyoA+4YkXgKARYok7o5tqoxPOVi6ofGdSZ4
         nYBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mIvK5AT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si2265699qtf.324.2018.12.03.12.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 12:30:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mIvK5AT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:52288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTurW-0000ul-Hg
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 15:30:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gTurP-0000tH-9u
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 15:30:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gTurK-0001ME-BB
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 15:30:31 -0500
Received: from mail-eopbgr750139.outbound.protection.outlook.com
	([40.107.75.139]:30411
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gTurJ-00018Q-Gg; Mon, 03 Dec 2018 15:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sD6w2UN30naeZ0Al88MDnfV4PAE9jirPqRljzYsMpEI=;
	b=mIvK5AT2rpfNmPV2cJLIXjLo4yTD8VUj5ZFKjUb2dcfl92axUDDOFOYAZkWHmVwC7nBxAdHx8lo328Oidn9SOh+onx/XiptXP/V2B/Mz1pwG5Y1Nl1KbZCmyB2sXpic/Zc1+yT9VCFIAP7XE+8zMZ3Rgu20HxnaiOAvk7GjRhPo=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4011.prod.exchangelabs.com (20.176.104.12) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Mon, 3 Dec 2018 20:30:18 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%6]) with mapi id 15.20.1382.020;
	Mon, 3 Dec 2018 20:30:18 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v8 08/13] target/arm: Add array for supported PMU events, 
	generate PMCEID[01]_EL0
Thread-Index: AQHUgRe6oR9puOKSUEmZsRsmRpV0PKVojT6AgAT+g4A=
Date: Mon, 3 Dec 2018 20:30:18 +0000
Message-ID: <20181203203003.GA5549@quinoa.localdomain>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-9-aaron@os.amperecomputing.com>
	<CAFEAcA_kcjm2F_1h2hRC_wW4hdozCQDzY1RmRTGTkEH+De+-Ag@mail.gmail.com>
In-Reply-To: <CAFEAcA_kcjm2F_1h2hRC_wW4hdozCQDzY1RmRTGTkEH+De+-Ag@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWLP123CA0018.GBRP123.PROD.OUTLOOK.COM
	(2603:10a6:401:56::30) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4011;
	6:0ELta+/v/r6a9Ag+tsTfBM+t4lcn7Cgky3XkQ/+hDmQxfdve1Rq+pGpdtOQSsgizKwXeR2i5/bCBuD2/hqgVcRZUQNOL0e8ZNVa3xpvSufsUoY/HOJkL2TI5DzHcGg31PfFqYp9d7wdtFBVJfaZlY7nFJs5dQymAejLAwoz6YDcKKu0DOFLCWQR/uFns5oBLuwkVuVCMDERia6jDL89mO9t2toewJjl25rB5G3TZFMc77iWe+r0U49Mj2JK2rSHGBFqVYs3dT0PBRJow2hKekmg2XnsDcxcV5CTm5Z3I27CuI4XMoLMRLq6PNGzrezDpaYOec5IVCIE4DAWLCHB3kFQ2DB1JN17kSgxiYUjUr0b3vTu2E/ousskO9tRKaKoSEgxv/CmjGKsvRiNebQb6w5JwAOYi3ULc7q0BPFeW1LBzD/tD71MbW2bsiCF4sx9s7ROyvrGMwUDae0SRbAXDAw==;
	5:7wU8srMC0n6C2rc04BZuCirIYolZ2DbRWSpB6B8qCU+0Bxk0EuGZHnzeV3+wHkaNwJvv3DuVdvysXHWev8fXc1BXmd8wpa6Ue4mR2MD7m7sP2zvz8KKXinan7s0YZz9HpFNZ8qMjtxo41TdY/g3OoiuL8IPLs696WfhIAcCF4mc=;
	7:fK5UkEoLmTXHAqXJ5nUh3CFVJyaUokS/2GV1cqlahQyQcN+Lt7xsWI/GWyCL/HU57Kp8rcfquU9pcTe9hJholeP3c6ivjPTaG6jPNE7LmaaKrvD8QSnULC5yvzUQFoJcQN9tGOKvpDpQ3k5rdB5RJA==
x-ms-office365-filtering-correlation-id: 1d7054d9-5e81-4726-62ac-08d6595e23a5
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4011; 
x-ms-traffictypediagnostic: DM6PR01MB4011:
x-microsoft-antispam-prvs: <DM6PR01MB40116813B408565D7392FF3D8AAE0@DM6PR01MB4011.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231455)(999002)(944501493)(52105112)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4011; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4011; 
x-forefront-prvs: 08756AC3C8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39850400004)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(476003)(4326008)(106356001)(7736002)(5660300001)(7416002)(2906002)(11346002)(105586002)(6436002)(6116002)(305945005)(71200400001)(71190400001)(6486002)(25786009)(446003)(39060400002)(86362001)(1076002)(229853002)(53936002)(68736007)(26005)(186003)(486006)(76176011)(386003)(81166006)(52116002)(33656002)(54906003)(316002)(99286004)(6506007)(33896004)(8936002)(478600001)(81156014)(256004)(6512007)(97736004)(9686003)(3846002)(6246003)(8676002)(14454004)(6916009)(66066001)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4011;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 5LuJ1aoa26AKsYf/xVVK9xiN0mdzxD0dRPplI8t1KMOom1mePMS6YWRFJb69VkPK/UNRA0LfVoLtOB2zhGPcP4AXnGHwQ1jFutO6CUByspsR4spGH0JeA6FRejRHCwsYsNApgJ842eovOCWGK9dR2okGDbYteODt7vhUlUGEp51xsdvnMP1501LLS1/kgPn6asXHHJxSyk9C+Isgwe4Vus+lHXZmJ/6fOW1TW8kFLwwuXzJkoeIizlKlfQ6rCeboizTWOdf238NhOFqW5KPHF80crCzlLPt+QStfXMciyz+s+XuiZma8h+BvZoGZCVZOoX2zKZCO1rbG8NxCWxikTak0mIPkL0fvJwnltfXk2aw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A82AE2FB37C6A84B87DB573DC5DB82D2@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7054d9-5e81-4726-62ac-08d6595e23a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2018 20:30:18.3606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4011
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.75.139
Subject: Re: [Qemu-arm] [PATCH v8 08/13] target/arm: Add array for supported
 PMU events, generate PMCEID[01]_EL0
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
X-TUID: 33FAtFODJRBR

On Nov 30 16:14, Peter Maydell wrote:
> On Tue, 20 Nov 2018 at 21:26, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 50de58e4a2..32c3397948 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -993,6 +993,16 @@ void pmu_op_finish(CPUARMState *env);
> >  void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
> >  void pmu_post_el_change(ARMCPU *cpu, void *ignored);
> >
> > +/*
> > + * get_pmceid
> > + * @env: CPUARMState
> > + *
> > + * Return the PMCEID[01]_EL0 register values corresponding to the coun=
ters
> > + * which are supported given the current configuration (`which` is 0 o=
r 1 to
> > + * indicate which PMCEID should be returned)
> > + */
>=20
> Nit: you should have a line here below the one for "@env"
> for the "@which" parameter, and the reference to it in
> the text should just be "@which", not "`which`" (or just
> put that description in the line saying what @which is
> rather than having it in a parenthetical).

Thanks, I've fixed this for v9.

-Aaron
