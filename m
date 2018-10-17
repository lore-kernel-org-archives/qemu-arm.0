Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1191769wrt;
        Wed, 17 Oct 2018 12:48:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60ON4+OxWyOIvIpKLGtSnKOIVU0Z+Kvcv+DNUQ7aqFY48Qe8kbXaXKH01Tc+9dWGsvB4poB
X-Received: by 2002:aed:2807:: with SMTP id r7-v6mr26586816qtd.68.1539805718197;
        Wed, 17 Oct 2018 12:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539805718; cv=none;
        d=google.com; s=arc-20160816;
        b=DVV0wZv/LUCoRlvOoS2AyQLGEu+KwZdK2hd5fMHJOVxFR/zTATg4xSgU7Wlo0qAC2q
         BH/Jqela2yqwzgwB5oERiSKTd0sm+C7pFTGKmRUXScOFJju40ycpD1gQxDA89pzHI2nj
         J1pX0tXD3TwNJb72EIjjCEeQBVeSIvRE/FxXS39VWqxW+ZlkqO8qJk2hIVBaGAea6bJj
         rR1oixiLvrxyi7PhKKmeutpGV8Mwdr7SwjjmlWkqK4iRFChSEDzrk/KyqtxQbw49r5jb
         MucTUndyRuHU2vCfs37OWQAiTnB4rQmVkgf56WNkrKCD7YPKbzVynvarrx4gS+Bbop3Q
         WW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=o3aXsPCfWdL1gXyEFTjDV/kf4z5QmEUKFgTUnChliMY=;
        b=AP1uLwC2eGCXMskiZh8EIOPb8n6c+eheJA4w2FhjBG2CLRd2FX1H9LMUvVAMcadgCg
         0Lt/lqaJCtQq3UWACgWDWhwB1bB1K71Oof1gGKmgtpqMIkGYx3Gwj8uxOe2iEDsk4dBO
         OZU8YkoFaUU9Fbbqjd/EDWImV/bnDRGXB37PCXmDwasRGzp3uPBKJ+P6lmuHGHJQQ+gi
         5F1C305g7A/ZIaW22LsPz+lgBvm9QluFDQZnhDcn6U9cvCui3oOcY6YUSBSKIggW/PGE
         Nd976fxb/EMpz2IIFlDzfMORh2zXJykqQs0qarR6nYLS3Ve6BuPxQGbKrnpMvxLF9PVl
         VK2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Drr3iUhw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4-v6si2783554qkh.210.2018.10.17.12.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 12:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Drr3iUhw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCro5-0001mi-OA
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 15:48:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gCrna-0001m8-Pc
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 15:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gCrnZ-00074L-V7
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 15:48:06 -0400
Received: from mail-by2nam01on0124.outbound.protection.outlook.com
	([104.47.34.124]:12608
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Aaron@os.amperecomputing.com>)
	id 1gCrnV-0006x8-0t; Wed, 17 Oct 2018 15:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o3aXsPCfWdL1gXyEFTjDV/kf4z5QmEUKFgTUnChliMY=;
	b=Drr3iUhwBuL8/3StgVrnZRnflUXAo84vu1Sne63e53P0ZAzf/RL9nUl3qvy+1KlhwfM15T7/dOtSumn2OL/kWhTDfhML68115FIjDWEvA4g9Qrg5vODfwT/E/vUb7hj7Cb3LQ75UkYfe47a+0PgIwNnCzUxIC+otbj1RO2sfwoM=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3995.prod.exchangelabs.com (20.176.73.16) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.23; Wed, 17 Oct 2018 19:47:56 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8%4]) with mapi id 15.20.1250.020;
	Wed, 17 Oct 2018 19:47:56 +0000
From: Aaron Lindsay <Aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add instruction
	and cycle events
Thread-Index: AQHUZkqwJ5BvPQNm1U2+GoTBLXtbSaUj1/oA
Date: Wed, 17 Oct 2018 19:47:56 +0000
Message-ID: <20181017194748.GB25905@quinoa.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-12-aclindsa@gmail.com>
	<be878ed3-509f-8ed8-8c28-71e3d0214837@linaro.org>
In-Reply-To: <be878ed3-509f-8ed8-8c28-71e3d0214837@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR1701CA0010.namprd17.prod.outlook.com
	(2603:10b6:405:15::20) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3995;
	6:WwMa81NK7Nrtta/sMXLZV9M1XzmYdxxPVfRoIvbGwofe5bzynZM+xao5j3CoZxDwFGF2S9vszZm7VA3txa2z6Rp3eaSdJojreIlJc/GZ03OCjIqsORqhDKS/90oNptUKibIFJIncZcX7chY/DtDT16cM6wccJyI0yP94x9eBWr/Z4N6n124YtVhGbVSgd6bX5l3wj0BQjrHaATBkQHQMGeA3wayW3k2bodRvD/Bsy6VKVkZFcDiKJTNcxI/vSwkwCtrxgUSuLtCEJShcQr3uyexYxrcSBrQeSHzPIdvp5bd653Cp/R8P0d7GEHW3pZIzJv3ClpUiYBqEsPfueE4e7GcedDgr9uOzEQXuzV2yQU5itVTyZ8kjB1AOvn8yl1Xkg6Ik6BXf31v7IyqQbcgF3f5+NrrrzULo+Ny6wxtupZRtXqMGm82FyH6og9PhCnyBVtxLb4M/jMJ8HHi5Uw7qdQ==;
	5:pkUjohkP3A+iSSNYJ1yCodmdmYXEmmbhmJDU0N03AYMJEY0evUjwn8tYHmh3p8O3D+cwQ+tnYiU04auwhQ9lY7LloT6gS42u96pbb3/5Ra0ZZidZmIolEOzpvIBxPIEQ503TlP+0wWKNf2DyXpIX8VA9Q5xZQ5AF52H1IcDxVLk=;
	7:uXMIeLnqmIP5qFpYq87Fjg7NdPu2QkLZHQC2LE6Vm4/LWyX4KtbR5mwcDZ95GudHuLurFu9anH40hcCsCYcg7Mm8wmvRBW0y+UZaYptgjTgbjq8GkeZd/bCuYTxrf03M3kGYhUXnk8DKfVFx5f5UbIhWPY+9168BXWMI5rHLZVH4xrDlrwU5yiACgkLJSO1BIaOj+sBLB03ToamBa1APu5IyowmKWPUkYSy6Cdgu7xMGieFegg3B5UXYgKgGYKr0
x-ms-office365-filtering-correlation-id: 6b921b82-3c94-4976-c263-08d634696f19
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3995; 
x-ms-traffictypediagnostic: DM6PR01MB3995:
x-microsoft-antispam-prvs: <DM6PR01MB399528667CC0C428A974552D8AFF0@DM6PR01MB3995.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3995; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3995; 
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(376002)(39840400004)(136003)(366004)(189003)(199004)(6506007)(229853002)(53546011)(386003)(486006)(8936002)(7736002)(316002)(2900100001)(106356001)(81156014)(81166006)(66066001)(5660300001)(305945005)(6436002)(2906002)(105586002)(86362001)(6916009)(8676002)(5250100002)(68736007)(476003)(478600001)(6486002)(72206003)(11346002)(71190400001)(71200400001)(54906003)(39060400002)(99286004)(14454004)(6512007)(1076002)(446003)(7416002)(3846002)(6116002)(186003)(26005)(25786009)(4326008)(33656002)(80792005)(76176011)(102836004)(52116002)(9686003)(33896004)(256004)(97736004)(6246003)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3995;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: p5nw9+89/MajHTPijxw9lSWJZ4tZGHn4GpbdBO0tDngjLMig5lQ2TKi6LdrtpbT9zCXQvhq1bPKxIH0YvISt2TTIt1QRkAXUAd5I6m/ZOB+g1PMRZhqST8GPbZsogKHCw3YcybVpWN/hWavkDVl9yPo48pXXkpVhcNSxy+ixd7Swuon1rGH/iuidmFr75ySP+LWYqUMyiNtkl94ebxy8Zwc7yk9to0OM1nN0ve+zaqlFpMutuv8yuHZD5gbXDgT34S49hSLWCTTvvozn1qNbNez2skhlEUnlBftuICPR9JzCUms43DcLJUP+zi4hELEOgemX6wg0j+kuxuOd4BhIsGJgvNX+Z2lZNqxhVc1sX+w=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A24947424E333C4CB64BD13C977E49A7@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b921b82-3c94-4976-c263-08d634696f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 19:47:56.3105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3995
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.124
Subject: Re: [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add instruction
 and cycle events
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
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ljWa/LTAX0iG

On Oct 16 17:04, Richard Henderson wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > + * Return the underlying cycle count for the PMU cycle counters. If we=
're in
> > + * usermode, simply return 0.
> > + */
> > +static uint64_t cycles_get_count(CPUARMState *env)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> > +#else
> > +    return 0;
> > +#endif
> > +}
>=20
> Usually we pass through the host cycle counter.
> See cpu_get_host_ticks().

Why do you prefer cpu_get_host_ticks()? And are you suggesting this for
just user-mode, or both system and user?

PMCCNTR used this same qemu_clock_get_ns() call previous to my patch
(see where this patch replaces that call with one to cycles_get_count()
in pmccntr_op_start()). Of course, we could keep the preexisting PMCCNTR
behavior while making the new cycle counter use cpu_get_host_ticks(),
but having two ways through the same interface which count cycles
differently feels wrong.

-Aaron
