Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2083844wrt;
        Thu, 24 Jan 2019 07:56:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5jGcUiynOMErKw8yb6zYvHSiZD6QF0rVTe1OzJBV6/YLuQ2neeXGt6h2JdbY8HzcNtTF5S
X-Received: by 2002:adf:ee07:: with SMTP id y7mr7982459wrn.187.1548345364555;
        Thu, 24 Jan 2019 07:56:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548345364; cv=none;
        d=google.com; s=arc-20160816;
        b=GTjlOxNgts97skC1Qi92T0UeHGXGpjW2TFpsbUASR9/W3QsTNvwVKDX1GUVKwlU/BN
         cRPPkifl4TsnM08uNeeXxfgzA13Z4lmFJoaWRj/JxQlW2miCeMH9c73drqTH0PIO5RZx
         2rUwnSUJC6SkhbeQk3Ejl/fWLIIgYaCWWfeQQHIV65X51hZNcE2ZRRdqK3NJ689xyOqg
         js990ijAz6HL+zCKPzOD5ic5hmlMkk7qg8lLOqNs+42TvkDHLQ6uXOVLBb3FSqW8v0dQ
         EJqVu4q4InUnA8KsueIJdhx7NHblF9GQndcWeI1zcJUYrIh/wU++KdX5Tpty/6XYo+QK
         TFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature;
        bh=d4e34xAXvohd0c/mFGpo5+juaZlkWrd0oW/kr3QC0bc=;
        b=zHjj2RWG1eAoW3RNAl+UaRiETcvtahdIlOKiaI9jgd+rgmU53lEGMJ239tprvR7QCw
         ACoEgN8e3nVFIlT2DUMw4b7UD0/AJmoAEFvch+7BTDg91ozkk/nPXgQha4UNtbfOK9V+
         DT83VZktHxE4tmj4z30cj+J+Uzc5LEjp/xxVke/T4BkG1H+WAhFik4PbsHqSfc6qUHJu
         +Vw+jWC4BPuaz/gLTEsN0fH4m/A3BYveB8es+l7gOMnxjou6Slj6W28Qo352dGFua4vj
         JL2JxP+Fy36eC0RtVS66hFUjeKyYvYKWHvtuosVjDycTI4OGTXibpeX0o/xvVh5AQmd/
         nhxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=sB49xCQN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si71541378wrw.25.2019.01.24.07.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 07:56:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=sB49xCQN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:56098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmhMJ-0003gp-GY
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 10:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhKO-0002Ew-Pr
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 10:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhKO-0002wj-1Z
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 10:54:04 -0500
Received: from mail-eopbgr690120.outbound.protection.outlook.com
	([40.107.69.120]:48361
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmhKM-0002uG-33; Thu, 24 Jan 2019 10:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=d4e34xAXvohd0c/mFGpo5+juaZlkWrd0oW/kr3QC0bc=;
	b=sB49xCQNx8rVsgQ7K7gh+qdiYdvllIVAYAYbCHe5c2fSnD1fAfiNJzWLxWPw+BOM1ULicIk/WkdPeaPN6WVoMYHjbjPrAKpclmfMQWP/ne3E0S9Q0PRJDw2nKaSNrDsZL1dPoLO16gs4vXk1+z/NP2juyBy4o5173O+3wAX/Z0Q=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4843.prod.exchangelabs.com (20.177.219.28) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.18; Thu, 24 Jan 2019 15:53:48 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Thu, 24 Jan 2019 15:53:48 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v11 1/2] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUs2Mvgkp0W1G2TUKxeLYaqfEzjaW9gl8AgAEQ2QA=
Date: Thu, 24 Jan 2019 15:53:48 +0000
Message-ID: <20190124155350.GF5213@quinoa.localdomain>
References: <20190123213227.17077-1-aaron@os.amperecomputing.com>
	<20190123213227.17077-2-aaron@os.amperecomputing.com>
	<7794239c-7850-1bb6-cbcb-b648533d9036@linaro.org>
In-Reply-To: <7794239c-7850-1bb6-cbcb-b648533d9036@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR13CA0047.namprd13.prod.outlook.com
	(2603:10b6:903:99::33) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4843;
	6:n50lgLLeqCKftCBEd+SjgR30bWipGxn+DSgd8tnrnRaSUMxsYLtA42YGrhLD+qfBKKyjjMpw5XHmr8cfqwXJJr6vtW5xSsOmvnxt52IVOWcryUEP3pek7uZXMr0aaQtREM+4jl7+U1YNTwJsNCnkZZMd29GQs5ja4CCI+SwYLG8HjLwT5ZpsLk0vtYimGX3evbM1Ndh6Pwd6CaXY6Vkj8zCI9Ampc3gKhPZtiqLUMBdseGNOhqXFdxrVM7v18qpmZDqlNOXYhmCTTMAVFVR/m2/IEfH9AdlFIgjgC6hkjlwRhjCD2/oRWNTzkcqxrV9UVEMkpm1cM6LdlY57akW0sHpRnkakO5lhnLgv2aFfuUY80C6qsX1OiEHlGj3OAJhD2ieWFT1CDmn3YK5Np0sGQRKuapZs82paSqQhhlvza+joHng5L7B5QgBxTxuN1Pz+EQdvq7ZhR9HOYZCwcp81Lw==;
	5:P0+yuaMGxaaT1WO7tF5U8+E2i4zJoqtkWalGJi0CQMg8uFsziB+TWelfFqHhzQ3gxPGqjADW3lx4SshajDOSNdNUiTUMajZeIfYKAnefsyYmKFcrgDSCR9GBLCWkHw0el3A5wrDaxuF909UFykkRAzwtW6cJ6xmNEtyTTd99ev08Oh/+QAcXN4VEtOMz79szW8NLoChO+WpmlsO85uK0Dw==;
	7:DMkl/qJbMuYT/UA7hYWTnv8MzFiW3Gm+M5eSnkPDAKX8Wo791gPmEeXdy5TNtLWAyHb73THAnoEskzIAot9/UrCWkkuH6LJbMmRCLqlrQIsWYRjFQQFz6sz1E+NNbhB6OKzfMb2b55Nl/7bo1u0x7w==
x-ms-office365-filtering-correlation-id: 84d96992-70aa-4b48-e198-08d6821420b7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4843; 
x-ms-traffictypediagnostic: DM6PR01MB4843:
x-microsoft-antispam-prvs: <DM6PR01MB4843D0BFBD1FA9F683D5A0988A9A0@DM6PR01MB4843.prod.exchangelabs.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(366004)(39840400004)(376002)(189003)(199004)(6246003)(486006)(53546011)(26005)(102836004)(4326008)(39060400002)(52116002)(81156014)(81166006)(53936002)(386003)(6506007)(25786009)(476003)(3846002)(6116002)(6486002)(6512007)(9686003)(1076003)(446003)(11346002)(6436002)(86362001)(71190400001)(71200400001)(4744005)(186003)(2906002)(66066001)(229853002)(256004)(7736002)(6916009)(305945005)(14454004)(478600001)(33656002)(8676002)(33896004)(97736004)(76176011)(68736007)(8936002)(99286004)(54906003)(316002)(105586002)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4843;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 60TeEfW62hoP2ytBOHtc6vLQaR1W/9tIcJtrmtcgeEjyDh7qPSEvvwCgqQbs3XSd7rTf5wNdg/cA1bwllFxTf/eu8iGkzYfNz/kcv/3k8i6tIkDnOZCWpv9S3QPZOQg8h7Eksww47c/31wPR7fxMXo+MVkwAgd3oZKa1XKo9VxyyDDDBwFyz3B/30sXRxpJLFpYkVdsCxpntXIYmvCWvNFKSTMaEsQfkYIfJXiQRoaXLfop8oxfjmZWW+t204RzrMRIcSord/HOOGTmFl6XT6x55M6IJdP/u/08tNzagrrexa6ANi23/haZ/7SxUQk28NRiXpr9Rh+3vqierwaiDTiwKTPftD+aNYJUa7yU4ZPFvcmy/Myn0awCaAIj+JjfR66ttWdEa08OZja1IndASKu/844bWVeI7eBod/zx4Zt4=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <900E5ED9B8D90848AB0349A726E3AE57@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d96992-70aa-4b48-e198-08d6821420b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 15:53:47.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4843
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.69.120
Subject: Re: [Qemu-devel] [PATCH v11 1/2] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BNgsKsVXLUh3

On Jan 23 15:37, Richard Henderson wrote:
> On 1/23/19 1:32 PM, Aaron Lindsay OS wrote:
> > +        uint64_t overflow_mask =3D env->cp15.c9_pmcr & PMCRLC ? \
> > +                                 INT64_MIN : INT32_MIN;
>=20
> With type promotion, this is the same as writing
>=20
>     ? 0x8000000000000000ull : 0xffffffff80000000ull
>=20
> which is probably not what you were intending.
>
> Perhaps just ? 1ull << 63 : 1ull << 31 is better?

You are correct. I think we changed this to INT32_MIN in an earlier
respin in an attempt at simplification, but I didn't catch the type
promotion issue.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks, I'll send out a v12 momentarily.

-Aaron
