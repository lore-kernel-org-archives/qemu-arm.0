Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp875737wrw;
        Fri, 16 Nov 2018 13:23:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5dFu9aqCYd2boa/RjZmngMQPogQ7SHROgrYxoAbcK4Fa6HcWpHZeMgpkvEx8JkIdydxAL3H
X-Received: by 2002:ac8:6bc5:: with SMTP id b5mr11628888qtt.182.1542403407486;
        Fri, 16 Nov 2018 13:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542403407; cv=none;
        d=google.com; s=arc-20160816;
        b=wR5ojNqqNfbxOMlWU3qVICVlMh1O/PHk5IFFAKBizwqAr+QdNau8mIt/jXxXmPAe4S
         5KMTG2bmuVMRCf2+kgGZQcq/nHxc1E80w5H9TW7h+3bKcUOXg3UdgSxTmcTGeXHsilHv
         1PmQjvr6Xp2y/JS8z75IR5mEB7FmQiNK8oIprk8Hnr3t4CCJzt8yIdsaZ4+JmX8vsMBo
         syK8P2ZDE/RBeusrHuBAmuD2ZYZE6utolPoo7AX0ZhPdDvyCOo9cDM5hJxNXUGfoFnhE
         Cx7aalHH47vF2nC/VkfGDwo6lw+QNZ1Qc8PtHFwhajT8GIhGchjUjSOX2j+4tNyIx9rk
         G9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=znhfwgoTO65dXTWIVOBtzVto4ei9TOazaD4/zq6+8S0=;
        b=cHT68wn0UOhY6Z99L4FIiwE4vr1ghjnIIo5m24DUBO9athnj9E8/FhQqYRshFO/3HD
         JLKlTbaPeEmfTMzkZEViOtRX1U2Qvia2E58tdDzR/25Ks20YmrAo26llD+XeH7doqSci
         a98yGAICQJjAcyKFVwkEd3iCVxH3VSG6rqHt0CiwG9F2q9QAUHPz1KhCi8bMZsz0OKiO
         6IBpyLoSD66X+2TrZ4gZiHZz9Sc16LGmIl/bo3sJ5mKL4FkNQX2aw2VVjISYhleZ4ntl
         9PjaJV09RBtttUbow/q+PLUzPsGA+DnC9TzoIekCehXQplzxZmmVfNZk+ygDMGr815kF
         qiiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mKlz2tBf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31si4611998qtj.66.2018.11.16.13.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 13:23:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=mKlz2tBf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:47027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNlaI-0006z2-QU
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 16:23:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNlZ4-000698-IK
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 16:22:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNlZ0-0004Fg-Kg
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 16:22:10 -0500
Received: from mail-eopbgr820101.outbound.protection.outlook.com
	([40.107.82.101]:58448
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gNlZ0-0004Ey-Fl; Fri, 16 Nov 2018 16:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=znhfwgoTO65dXTWIVOBtzVto4ei9TOazaD4/zq6+8S0=;
	b=mKlz2tBfXoxZ0tUP5fUhBw9YzMKBVElhjfXaFdO8VkfyCsv9E7wyNlkoHsfysahqeU8q7DrnwXzyT//+N4NHgbrJd48wZzcUjIxxeVy38SWCQGsPU/6zZNXa9CZClwh/VXifKF1ANxDsmjJtH1X544Jzw0woXBgCqmqVuG9d+dA=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4377.prod.exchangelabs.com (20.177.221.212) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.22; Fri, 16 Nov 2018 21:22:03 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.045;
	Fri, 16 Nov 2018 21:22:03 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v7 12/12] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUdTikL9h6qRBa00SUiul/aHxLzqVS+lkA
Date: Fri, 16 Nov 2018 21:22:03 +0000
Message-ID: <20181116212154.GG23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-13-aaron@os.amperecomputing.com>
In-Reply-To: <20181105185046.2802-13-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN3PR03CA0108.namprd03.prod.outlook.com
	(2603:10b6:400:4::26) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4377;
	6:aqxfJ9Sd4LCUoeIkwQGVQJybqSXbU4K095S0vsM62MiPe7qMD5VJs84vs5j0II4iO13xvnQ6zmvidScYk4p1gsFC7+QAajhc6+xKNrhVt97w9KJq7pGidetciSXlC78f0cU3BOoXI5NV0p8zgqWSVyyhIuf2jVB+m550f9wwccQ+e0/zuEI6XOoVK/RGM+56aLikIeNQWHltphXRNbrgEn3wjys3JtAZih+Jy2U+cEcoSy5PPGNf70PpTFioKut5AUTZPiKz564yOiWIQzP9er+zXZuw0xzssIe5dDo8X7F30BtW9BwoYkKAL1Vzhll98UPMnyvi5XL8uriko09dTVjISsLo5Q99+Mlp0dpH0h9lonL+kA9batG5nQVv3zfqLM+suuLOqYFbIF1EShDviiOFKnhrUEsz05LLt5pvk0cobnCT3LaLOBJcGgW9v/PWfvnQQYmIoTOZk9kk5scpqA==;
	5:Pw+kN/c19ADAhRqVI4d5KUX6fJwY3BeAz1Dc0W1O73N99mqeS7LGQQKZFE1XyyJtAQM0zNzt7+ivV57SgxVCFS8W5NKU63HVzXAGu6dSeT5COBCNB01+FfPDbxTfrvV5JcYMQE8uqOihoV7rfyBgyc5WZJsEeOhVx2HZohS5aJk=;
	7:Fih3qknwcP0bTlnzx3wrny0UfZBwgB3KCOpHhDdDLqJtVZNrqSaSi4UGe4BDZm2r1/CL0w98S4Q1cDFDSldNlySajkyjLGqiy5mKupKQ49NAggsVUCodvd9DVOKhoEK5zdsAECUpBCh4I6j4zVk8aQ==
x-ms-office365-filtering-correlation-id: d634538d-b867-4745-908b-08d64c098d66
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4377; 
x-ms-traffictypediagnostic: DM6PR01MB4377:
x-microsoft-antispam-prvs: <DM6PR01MB437752D7D896B3207F8302108ADD0@DM6PR01MB4377.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231415)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4377; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4377; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(39840400004)(136003)(366004)(189003)(199004)(1076002)(486006)(478600001)(71190400001)(71200400001)(99286004)(81156014)(81166006)(8676002)(4326008)(52116002)(6486002)(229853002)(26005)(6436002)(33656002)(86362001)(54906003)(186003)(14454004)(6916009)(316002)(476003)(7416002)(2906002)(6512007)(9686003)(33896004)(97736004)(25786009)(76176011)(53936002)(7736002)(3846002)(68736007)(6116002)(6246003)(5660300001)(11346002)(8936002)(39060400002)(102836004)(446003)(386003)(6506007)(2900100001)(105586002)(305945005)(106356001)(256004)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4377;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: aScSTTUblhgBvJbSgOBFssV9aRNBZSYqztPkBYGABqpFiJXIEwKRfwow28AoIocvhNhVYsSZCd7vq4Y3ymdfRCnUft1Vm9XLiandEMeYYaAnO/Z4pfaJf+wAi9Hmf15vtL06URD2eLYcj43mZsBtB8c8uF7gSjCewY8pORR2+W8nFxIcejspLhhRMUzmnRML5/uWidiPlVhC5zwiTFVNJUD2dRisVhQXeEQh7RuJxHx8LIymA7LFUj3hifxGBfs1q/PrOPtFosSOQKYWt4ESPz61lM0Jh/sVrqrsFFIDtaEm5XX1Xj0STPrTKSGUM5pIPNIQaja8RCZdbQE9O4RKZ2DRZkDnPCjiioSjeYA95uY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B650467DAD4ADA47A566F14838B0E284@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d634538d-b867-4745-908b-08d64c098d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 21:22:03.4917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4377
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.82.101
Subject: Re: [Qemu-devel] [PATCH v7 12/12] target/arm: Send interrupts on
 PMU counter overflow
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AkW78BEDqNze

On Nov 05 13:52, Aaron Lindsay wrote:
> Setup a QEMUTimer to get a callback when we expect counters to next
> overflow and trigger an interrupt at that time.

Peter,

It looks like there's probably going to be at least a v8 in this series
since you've made a few comments which require changes. But I don't
think this final patch has ever received any review comments from
anyone, and I suspect it's not because it's perfect...

Would you mind taking a look at this one during your review if you can
find time?

Thanks!

-Aaron
