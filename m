Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp712483wrt;
        Tue, 11 Dec 2018 07:24:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U3Zh4BCtNRGKuTz1liqXUJnteH7OGgMzehq6ehhkGcYC2K0pLdT2iX3pCshVq0G1bYJ/mU
X-Received: by 2002:a37:b084:: with SMTP id z126mr14502759qke.154.1544541888824;
        Tue, 11 Dec 2018 07:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541888; cv=none;
        d=google.com; s=arc-20160816;
        b=fZqPgouu3HaYBY3XErD6AreCQRvPlYJ2cKmwITapn37zOE6EaMZofn/4MYVfNJ4lUg
         fuklYcCsDRab0vZLi9ptq3nINEzihWn8zESfD5dorpd04ssf7EzXVgEh+YOPVh9L0ZGY
         H85h3vZ2BiS42XIShgi1jGcHWiR41NeEd4U9uoyB1UNIBUf6JrV8oPH9hloiQElANHI6
         xj5p6vvsmkTAgB7+G//H9nqvDDmEkmqOrfvNf7l26/XE01jzHIxqJY7iy0QP+q/YV/Kb
         MjlSYVID2cYXIvAEG1dhPRjm5wBJboFxUOoIIqoJ0YzsyamCeFbslNLI0/sI3P4MzVdP
         so/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=obDZalXLcVogGWkpmZKegX7CiUZ2texM7+w3DnKfsmo=;
        b=zwVfJGNi1zIDF2roxxeqMMivl3NUt4mcIvZhj4W5X/zi4bPpLvGrCxTFn/gtv3SrWP
         AVCN/WoR/bkRL3hChCb8D3T/zr3DbikHdL7wjfQ/gKgUmK7XBl7RHM57vSYwvoDhG7ZK
         h4lD+8nz1q/Y7Hftw8384RYKWtD2YN3j7ftgOzUZDMgYE7AraEJJNV5RuISNQ6hze2+B
         AR2ONoMjnZyzbY4R9uNZBRHvRLLVNyBY1TELalvcskoKR+rPpWX8zZ+srT4iEOfco0bQ
         14+hV3Py2e2F3wNI2ZCNwWXarizc9cQUU466eSE5XIqv6LzaCmc54EIvD8TBMEkML7sj
         Qgag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=EQYYbvRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si2013057qka.50.2018.12.11.07.24.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:24:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=EQYYbvRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjtw-0007bN-9B
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:24:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjq0-00046E-W4
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpv-0001WW-30
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:44 -0500
Received: from mail-eopbgr810091.outbound.protection.outlook.com
	([40.107.81.91]:4512
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpr-0001Us-FQ; Tue, 11 Dec 2018 10:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=obDZalXLcVogGWkpmZKegX7CiUZ2texM7+w3DnKfsmo=;
	b=EQYYbvRfd8jb5f/3upjav30JYNYAArXtUz6Y/rdubN1O9YILuwz6rIfo8YXRIgvd7LtdNatZ4GoJdpAAj13uqywgi2hWABKoMX5vbLlUct7bG2mE2rYaB5kYc0SEgOqxA4G1HQpVg7SeB95Rf1QigZ7n+DAd05DAPZLvbjwHTSU=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4601.prod.exchangelabs.com (20.177.216.78) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Tue, 11 Dec 2018 15:20:32 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:32 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 07/14] target/arm: Define FIELDs for ID_DFR0
Thread-Index: AQHUkWUOPck85dektkGyUW5aVisA2A==
Date: Tue, 11 Dec 2018 15:20:32 +0000
Message-ID: <20181211151945.29137-8-aaron@os.amperecomputing.com>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0041.namprd11.prod.outlook.com
	(2603:10b6:a03:80::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [65.190.6.212]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4601;
	6:P64nT6OoW3XEV/E0/Wr8VY5Sb/XWyWkVZsjoPbiboN3e7YKET+BsyjyPqYv6ngR016BD7imb6EzyfXlpoNdXEzVSN/JJUgKyLApU2SwY71xIyv7ODWch9eT2K4U5XHDAnLIf0a1VyK66egIz7mpI8gNjHvF7X3HbEXrZeIAVS0uYQcWrVdrsLJNJd6CR0x6RXuPW9W+hs1FIO6vcpWJmLxlj0Qb22dBY7EL3JUIsjA2lf5ko54fmm8U0AGnytg+Hsh4F2rbnTJXuTRZzZF9pqEQ74bWsNQ1t1qBzNhfKszUMBOuSrvqfuE66iKdY5dimREfIGo2YqfF1WBsVazbvnKL65+QPZRMebvZ9bbV5nbc7iZWgKNiY1YBoqb+Us1wbK9eN1fAslCXG0SeTYUUg01EhCgyGd8nayRs1mV4uLH+ZZbWr8H84b9JPtqBnoI1HISErH05iQosBgtfzhb2z2w==;
	5:pEcRTg+q2Jw3gxYIxjI7RSJ/AHkmX6cOqQsNgY2U2nIBnt1Njyqq/31/6nznK+xegUcHM/Uga5oOuwehjfkaazSNsyQ2RPDj90tW/jnXSlLxXvoeu29hF+OTZGh4ET6Jma509dTu5+4bJX66YoDOaTtR9hLQEAJlWJAPWxWjI2E=;
	7:Qzw0TAjUPBGI5wOjduFxYT/8WRX8FF7ZdUr1w3oNKXo2+jYQUJTjHkndBDFYEUnsPBaMCUzf+50FoPg58QSM5j0Si7KjnXByew+F4hg5w4mx7USYEi2Bgkd2GculY+rhIyguEIqH0FKU2cEizfTjxg==
x-ms-office365-filtering-correlation-id: b38323b6-7032-4f4b-b530-08d65f7c30d4
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4601; 
x-ms-traffictypediagnostic: DM6PR01MB4601:
x-microsoft-antispam-prvs: <DM6PR01MB460168B04C0D752887FB81208AA60@DM6PR01MB4601.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4601; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4601; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39840400004)(366004)(346002)(376002)(136003)(199004)(189003)(66066001)(54906003)(106356001)(2906002)(97736004)(110136005)(305945005)(105586002)(316002)(5660300001)(3846002)(256004)(39060400002)(68736007)(14454004)(1076002)(7736002)(76176011)(107886003)(11346002)(2501003)(99286004)(52116002)(6116002)(4326008)(6512007)(53936002)(81166006)(81156014)(8936002)(102836004)(26005)(8676002)(186003)(71190400001)(446003)(486006)(6436002)(86362001)(25786009)(6486002)(2616005)(386003)(476003)(478600001)(6506007)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4601;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: sxGSAZX0PvOM4S3a/m2hm7w+gWhmqWmZWhETZ2ncO3ME0OFJo9m3AFYf6PAGD6G7Mpk3HGfWN+S/5zkRaWecLL99L4rbRCo7MJ+4iN5+5sGU9mlxO8U+usU3ZyeYD24wZCDiQorMExW/u0x0HavPrfj3uwBLq5xXWHWBf9z1c7LMIY+t0tbCA3HUeGXVUyGpAF1GBEeGIwTdl4IHZLDz+MMw44TcUw6QdkzckjLK2YzccxCOPxQf9LgKFbQ9vbJDkgUkM3KwWDHWqXJSMPxjmYmwPC7s7wQlmuRaegqZUZgBnrK2MRPYC8XgpvBhNqOl
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38323b6-7032-4f4b-b530-08d65f7c30d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:32.2146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4601
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.81.91
Subject: [Qemu-arm] [PATCH v10 07/14] target/arm: Define FIELDs for ID_DFR0
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUp/67Tz3S3+

This is immediately necessary for the PMUv3 implementation to check
ID_DFR0.PerfMon to enable/disable specific features, but defines the
full complement of fields for possible future use elsewhere.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 627e5c1995..2a64c1d858 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1586,6 +1586,15 @@ FIELD(ID_AA64PFR0, GIC, 24, 4)
 FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
=20
+FIELD(ID_DFR0, COPDBG, 0, 4)
+FIELD(ID_DFR0, COPSDBG, 4, 4)
+FIELD(ID_DFR0, MMAPDBG, 8, 4)
+FIELD(ID_DFR0, COPTRC, 12, 4)
+FIELD(ID_DFR0, MMAPTRC, 16, 4)
+FIELD(ID_DFR0, MPROFDBG, 20, 4)
+FIELD(ID_DFR0, PERFMON, 24, 4)
+FIELD(ID_DFR0, TRACEFILT, 28, 4)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <=3D R_V7M_CSSELR_INDE=
X_MASK);
=20
 /* If adding a feature bit which corresponds to a Linux ELF
--=20
2.19.2

