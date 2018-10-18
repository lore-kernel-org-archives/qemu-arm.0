Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2528227wrt;
        Thu, 18 Oct 2018 09:21:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61fhRVFAR5eSWHgsA1VZNGOEgtkM3Z6Dp5UVjKw2a4mVdzYIsVRc1kx08S7eqEtENuLKfS8
X-Received: by 2002:a37:6d41:: with SMTP id i62-v6mr30107172qkc.237.1539879676932;
        Thu, 18 Oct 2018 09:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539879676; cv=none;
        d=google.com; s=arc-20160816;
        b=f9coo9+xeoWjMxjrlfKG+wkbrXyROgMkz/GjzaZAcyNkpIzEEsksG3qAJc3taNxT08
         /0iON8Zll97phUGts8oNfemAcPtAUXgGKukrR5awuGnakdR4ZosuBsMVq3P/gsceU2PQ
         b4OXuEoPU2m/R/35SqiNskTDO+9OqPt5hlUp9uTNadj3DFMAUt+/QXFJCB0+NCQpZGaC
         xImlfFgdTIJ/e/dSXHWxIfeD9UWRslZ2XxniqaW648Adwi4QpSZ/Zrpkd8aRv4s1d9u4
         fEeTNoB6yOHD/KyeMvxvJMP0WbctS9N5UnYJRrNdujp6lK2/7lNouymQRccj+SniYpJn
         lrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=KfbvsiT0q2PW3Rgz9LT3BLNECvWbSiZ3HZJ60raWEzg=;
        b=ZDL61kbgzZ3AQwcBlBX8WxvxQ4PDGaw/ms0Sci8lJ8JHWAegqCFLkW33aXTJdrbBp8
         EESPR9OgO78wNGHujgJJGjaw4WU3w5WKfwJBvQJA5dBpKrwEEYHWeTGRFpKWIC/Regk3
         bCOXYbCEYHVIcV0wvITMGbQIIhnO5os0bO+kKjZ3uCYqujl2+uqljOMu86s9426g0FUo
         mC3VurHt6q0xDKVM98p3CfZXG05PZ5YPxKrUlvd0j87bZIGvU+4/Aw2OXzksXIqQZGOo
         dysak3vf5uc2WD8hZu4JCkaPc9Mds+SE6BMjCEk3UGMqCt+izM4L2VrqZjWL5WAMcAH2
         9dyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=TEetSFGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m44si9883967qvc.100.2018.10.18.09.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 09:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=TEetSFGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:43363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDB2y-0006WM-C8
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 12:21:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gDB2o-0006Vc-ML
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gDB2l-0002c4-E6
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:21:06 -0400
Received: from mail-eopbgr730114.outbound.protection.outlook.com
	([40.107.73.114]:32542
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Aaron@os.amperecomputing.com>)
	id 1gDB2l-0002bM-6k; Thu, 18 Oct 2018 12:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KfbvsiT0q2PW3Rgz9LT3BLNECvWbSiZ3HZJ60raWEzg=;
	b=TEetSFGYVTrUtW9ZaIil/65ttj8LY+vXoGmAGSLM/0uLbonudXsTfJA+WnGslIPILlv82quenKT22RvIuMEzcWYsKqwrPvQetjNkz01lX8D/cJfEHFC2B00MtdmR8Wyn8LbcKIIk+c/cOWomYfFWvDVjez1VG1aPWwbM2e6mLxs=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3867.prod.exchangelabs.com (20.176.65.152) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.24; Thu, 18 Oct 2018 16:20:58 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8%4]) with mapi id 15.20.1250.020;
	Thu, 18 Oct 2018 16:20:58 +0000
From: Aaron Lindsay <Aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add instruction
	and cycle events
Thread-Index: AQHUZkqwJ5BvPQNm1U2+GoTBLXtbSaUj1/oAgAAXn4CAAUDgAA==
Date: Thu, 18 Oct 2018 16:20:58 +0000
Message-ID: <20181018162048.GB12691@quinoa.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-12-aclindsa@gmail.com>
	<be878ed3-509f-8ed8-8c28-71e3d0214837@linaro.org>
	<20181017194748.GB25905@quinoa.localdomain>
	<32172d01-329a-764e-449c-efb83e353353@linaro.org>
In-Reply-To: <32172d01-329a-764e-449c-efb83e353353@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0017.prod.exchangelabs.com
	(2603:10b6:207:18::30) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3867;
	6:tRdZ0mZMvxFx1OriicTbDq7Tf0OFlZVTgHtrewnvY9IHraG2sQAqDY3MmH9QyHiNRKInJYOJzfTqAXH/1Tv0XPckGfeWnsEdng5uf7wm71s8JF+ZssjBQjMS2WcN6J/KvmZPz7BC3WM/hjUARxEt0s6+Fy02HRvx3s4Z8r3H0H2TvElF614a9lvXzikYkR0e2Ar2yYGLD0s9ANPdDzeDAGIOdO0FGT7rfsBDC0njKsmx2B6RloBXa6/neVjNVB/e1ToXTNiPm8+MI9VRyoEGHS1IB/NOa+48ayQprVQUmbNDbL/Cgz4rv2HS3f/MmjkmEk/qElFCf4Yn6Jdd/sqrBkTuty0xLIT5onR3xe2bVX/TPWGQVn6K99YqaKXKpgNhf0YyqWQGWXVBcNxWPILZcn6eH0rm02FTx/l2oOLOV1sUV8VFM30XZDiskoPDHu3MJah7CSU2QKDSK5e2pm6Azw==;
	5:HF4i5XiIOaVqd4SRUco/8t1KABwJBW3wxJhzlgrXsgF3EaCuEhCtvj/bRFGvtTNIb1rztCWy7D25oZZX92M7p3vznkEODRJF/1yac71H+SJTJ2RomoYgX+AtO8js8vqVlISHn4usDfu6GNQKja4r7tffnXk1KkB5SH1Mq90WOUs=;
	7:VROOV08uK0FXAmtAjGhr6zPbKOTmTQl4xryALzo+LAxYqrNZlHu1nCRjVfcqKLzawoE76oNPCx+rKPrjmS9BUjgiftd67ewppfIx31842fAuLjOGnNx6c6hWFl3eGzF/ThM6Je9oypJs9Vu4ZnFlynnMt++0ksEPNkjqezU1WgjGpVZA2zAO1Z3LULC1zx67yyYHf20pSOtiYMLuLPsPZPpm8o06rheY0vh/a8Jetgi1UdToeQT8MVyIdRRi/ljf
x-ms-office365-filtering-correlation-id: 17eaf242-a7a4-4891-2023-08d63515aff4
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3867; 
x-ms-traffictypediagnostic: DM6PR01MB3867:
x-microsoft-antispam-prvs: <DM6PR01MB38672F9459473F968B14F03A8AF80@DM6PR01MB3867.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3867; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3867; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(136003)(376002)(346002)(39840400004)(189003)(199004)(71200400001)(1076002)(14454004)(71190400001)(6486002)(9686003)(6512007)(53936002)(6436002)(7416002)(478600001)(68736007)(4326008)(2900100001)(6246003)(72206003)(86362001)(3846002)(6116002)(256004)(2906002)(305945005)(7736002)(39060400002)(25786009)(97736004)(99286004)(52116002)(76176011)(33896004)(54906003)(26005)(81156014)(476003)(66066001)(81166006)(316002)(8676002)(186003)(53546011)(102836004)(6506007)(486006)(386003)(80792005)(105586002)(11346002)(106356001)(5250100002)(5660300001)(446003)(229853002)(93886005)(33656002)(8936002)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3867;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 0DV+7tJCwEUd9KHQBuBw2Sl0ICLPnMKgk/FXxb4IUXla2/NL0RvUKtbBE3u7gNe9yBCx0Zc9/6RkMuVrifBdQKp3VKYUkYw0L7x8lWWEeHFVeeeCcwj+AGYlpzvwG9OlwJ+OAmY5yVsd1cmoiD5J3DRP/yvgyo+pkRg2X+C1oW6XriDphjIA4q/RpAj73xklNuMMmG+m+yJFrxHi9p4InxzxkxWFXXgp3nm9+R7dhTM90MDnTuClf0Wq8ruCmwJ+NPBaeZnKD55H4OSUBLZhyupZ0YCSDy/HMNqLGxgFwp47OFCyTps3rlzgQ6rLRz7DO7W+YESVf0/S7FLtI4wEo6wLAKfYK+RCVuBvy4tQA6Y=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DAC7DC327D9204CA1FBEF57E22DC5F1@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17eaf242-a7a4-4891-2023-08d63515aff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:20:58.7324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3867
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.114
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add
 instruction and cycle events
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
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +rj/fl64Bwup

On Oct 17 14:12, Richard Henderson wrote:
> On 10/17/18 12:47 PM, Aaron Lindsay wrote:
> > On Oct 16 17:04, Richard Henderson wrote:
> >> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> >>> + * Return the underlying cycle count for the PMU cycle counters. If =
we're in
> >>> + * usermode, simply return 0.
> >>> + */
> >>> +static uint64_t cycles_get_count(CPUARMState *env)
> >>> +{
> >>> +#ifndef CONFIG_USER_ONLY
> >>> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> >>> +                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> >>> +#else
> >>> +    return 0;
> >>> +#endif
> >>> +}
> >>
> >> Usually we pass through the host cycle counter.
> >> See cpu_get_host_ticks().
> >=20
> > Why do you prefer cpu_get_host_ticks()? And are you suggesting this for
> > just user-mode, or both system and user?
>=20
> Just user-mode.  Providing a clock with unknown scaling is more useful th=
an a
> constant 0.

Okay, that makes sense I think. I slightly dislike the fact that the
behavior is silently different between user and system mode, but perhaps
some documentation could alleviate my concern - is there an appropriate
place to document this difference?

It occurs to me that one argument for always returning 0 is that it's
immediately obvious that the behavior is different from system mode,
eliminating the possibility of a user assuming results from user and
system mode are comparable.

-Aaron
