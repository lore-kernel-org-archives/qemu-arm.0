Received: by 10.25.44.15 with SMTP id s15csp4214481lfs;
        Mon, 24 Jul 2017 12:08:00 -0700 (PDT)
X-Received: by 10.55.122.68 with SMTP id v65mr20145192qkc.225.1500923280216;
        Mon, 24 Jul 2017 12:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500923280; cv=none;
        d=google.com; s=arc-20160816;
        b=RQQgPh2C3d5ZMFK5/RGozJVvVmHyoiGAcV90FN0sc+ZBvOv1B2lCRfu1/N/HY9wylu
         stXcug/O+rkN3qs/9N2SjzDHI6lWRZGZyHjVRsHittrhNxTFnkFb6u4BK7nREYmmfuPh
         I4/XnU74TdBfDzeo8Qh8Z+NCV0VVOIMBs+Y3I7smYKFa8L0+nPY7rT8cCnXKK2S8pEnL
         N4Gs2PMhdyK8f7xZ75suLvFsCBpHGSqJyjO25S8y5B5X7eKbTO+SZ85okR2kTmTemDq8
         urGmzCq2/bCxfP7ezuDeQjuJt+SfbMv+eOh9B5dmdAlCBC2Xcb7Q7VVW7ZfzypgXpFdl
         8/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:msip_labels:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:dkim-signature
         :arc-authentication-results;
        bh=pCfDyX7011v4d0LrUz1GRI+OHiAUHuKkwUQqeMSko/U=;
        b=iGCtZRqOakCp2+AjXY4fYE+zaaTSHKXJFcBvm9+miwi3i4yqbLI2wW9DgCzh6Wapxh
         sd11dXmXID6DBop6jgO6GdtDPDNUkj/IDsn6aih9GcClrRUsdergRvV2Yd/dxpqB3xdz
         7wIiIPPT09BTUDu7x8gv4E0xZMKNVXQxv5EtMzoK1iQhOxMxQwlqO4P6ozi2ISOAhMGP
         Jj8m6OePfLzxMmzI1Ct3prfCCQCX4qhKKvGSic3W9EJ3/bfOap9Nsp7kT/9uJDiDpKIj
         NoqCcuWqjDvkPD17/xCUdDBXE2OOqlEB5p6ypz3otmBbV4cG5sZih2Xeqpg1BqXdJc0k
         GA8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.b=MlzfL0oH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si9393219qkm.80.2017.07.24.12.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 12:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.b=MlzfL0oH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZihx-0007oM-Au
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 15:07:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1dZifk-0006V8-2h
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 15:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1dZifg-0000Br-NZ
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 15:05:40 -0400
Received: from mail-bl2nam02on0138.outbound.protection.outlook.com
	([104.47.38.138]:17366
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1dZifg-00009u-Ci; Mon, 24 Jul 2017 15:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=pCfDyX7011v4d0LrUz1GRI+OHiAUHuKkwUQqeMSko/U=;
	b=MlzfL0oHW4FhilS7kyFGzTkb4I688UGVyh4nedXxKiLhoVmbcuOwP7qs7qFYGaFZufHdEeJ+ZRfV9DFN8s9yU8ha0X1UAPLOaHjYuXie+sQypxz+wQFp4bw0PgNXq6sJ6lHzBBz8U4CtfAej8y2BGDnwhcL5thAI31bWMqGA+og=
Received: from DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) by
	DM2PR21MB0060.namprd21.prod.outlook.com (10.161.140.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.7; Mon, 24 Jul 2017 19:05:33 +0000
Received: from DM2PR21MB0060.namprd21.prod.outlook.com
	([fe80::dcb7:af0:9415:d7f2]) by DM2PR21MB0060.namprd21.prod.outlook.com
	([fe80::dcb7:af0:9415:d7f2%17]) with mapi id 15.01.1304.010;
	Mon, 24 Jul 2017 19:05:33 +0000
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>
Thread-Topic: Torn read/write possible on aarch64/x86-64 MTTCG?
Thread-Index: AdMEr5d6ACtDBuctTTu22oYjpWuKdA==
Date: Mon, 24 Jul 2017 19:05:33 +0000
Message-ID: <DM2PR21MB0060EFC1F6B9F0883A1792369EBB0@DM2PR21MB0060.namprd21.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_Enabled=True;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_Ref=https://api.informationprotection.azure.com/api/72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_Owner=baumann@microsoft.com;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_SetDate=2017-07-24T11:04:10.0121970-07:00;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_Name=Public;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_87867195-f2b8-4ac2-b0b6-6bb73cb33afc_Extended_MSFT_Method=Manual;
	Sensitivity=Public
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:4::355]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM2PR21MB0060;
	7:oElsTGVwY0Eb0+zeALMuum54uMQ8moVBKbVu21WQLjxeMKFFYq5pmAIQIxqDGfw0gFYaqgVo8xTNDw097EOfuGjaE43Fk5/OJ9rkyy601dS0erqXFcseOFtOzuEF1ludxLnLt6Wxpgneq0HCeQxDT8T5jMgPnANAGwbKhkRfRrV7SpzJ47LRS5pr4/gKbkrGAFk+ofMYgJ/2/WzuKUy0gkbA+gCSXGDtoRxnz6Xj6mpaYT9hLRFrauxeRx7Qn5Ac/H4/5K0H/4o+5AeYOwB16NTnS4IPf2euH78TTpW/mrWesEdIcvQYd6DmtiuRBBDoiPAoikqLPAaTKE8jJjFs5OMZqwbPCKJdrRj9YU9D7eVTJVlWSACQTehxosVS0ZmjpVbyEPh+gsyXXQ0reyi68nzyI5eJyy3l3omNNryQN3FDmqviTAD8bT0GOIOK8J9yRD2H7q14BFmNOypmF7CvPxiioPsKkNQQNFDNpl5oKyvjessrSGrq/RHRxo8JhuL+uDqefcXIiwhAkvF4kLirbNVG1BqFJEqNWDwcEMtfIGdsZDsVgOHxF0rP/Iy98KtfACXImO/hoDPpx0wM+Jo/NvmnAikrTIUXvKTNmiBPN0TC+oxVAame5Kp4Aw0e78088dplO/EZlXezQlEtidjySV/KFCqElZkQoq4gzwXVs6R2SuXZCj6q4a7UQ7GK0OZ9fDwjQebUCzGtQmUKbCc6/jXhlSmuBfzyrdK3V/7Owtx3ST1EYFzbQWAnzSXZ7paBG9zyioNdud6e+ptbuI5heUFSmYZIykrMdnsqgf/WGTNwKCm67SfKAYGTIWN5vNlF
x-ms-office365-filtering-correlation-id: 6c884e0a-a8d9-4c02-7933-08d4d2c6f5bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM2PR21MB0060; 
x-ms-traffictypediagnostic: DM2PR21MB0060:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <DM2PR21MB0060BC240DD2025886A6A20F9EBB0@DM2PR21MB0060.namprd21.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6055026)(61426038)(61427038)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123560025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR21MB0060; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR21MB0060; 
x-forefront-prvs: 0378F1E47A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39450400003)(39410400002)(39400400002)(39850400002)(39860400002)(47760400005)(199003)(189002)(53754006)(102836003)(6116002)(72206003)(33656002)(106356001)(14454004)(105586002)(81156014)(81166006)(5660300001)(68736007)(55016002)(3660700001)(189998001)(25786009)(97736004)(5005710100001)(8990500004)(8936002)(86612001)(305945005)(7736002)(478600001)(86362001)(2900100001)(5250100002)(10090500001)(6506006)(74316002)(8676002)(3280700002)(7696004)(101416001)(50986999)(6436002)(9686003)(53936002)(2906002)(54356999)(10290500003)(107886003)(38730400002)(4326008)(2501003)(99286003)(450100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR21MB0060;
	H:DM2PR21MB0060.namprd21.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2017 19:05:33.2113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR21MB0060
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.138
Subject: [Qemu-devel] Torn read/write possible on aarch64/x86-64 MTTCG?
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
From: Andrew Baumann via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Andrey Shedel <ashedel@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dM7Wh4B9EXsC

Hi all,

I'm trying to track down what appears to be a translation bug in either the=
 aarch64 target or x86_64 TCG (in multithreaded mode). The symptoms are ent=
irely consistent with a torn read/write -- that is, a 64-bit load or store =
that was translated to two 32-bit loads and stores -- but that's obviously =
not what happens in the common path through the translation for this code, =
so I'm wondering: are there any cases in which qemu will split a 64-bit mem=
ory access into two 32-bit accesses?

The code:
Guest CPU A writes a 64-bit value to an aligned memory location that was pr=
eviously 0, using a regular store; e.g.:
	f9000034 str         x20,[x1]

Guest CPU B (who is busy-waiting) reads a value from the same location:
	f9400280 ldr         x0,[x20]

The symptom:
CPU B loads a value that is neither NULL nor the value written. Instead, x0=
 gets only the low 32-bits of the value written (high bits are all zero). B=
y the time this value is dereferenced (a few instructions later) and the ex=
ception handlers run, the memory location from which it was loaded has the =
correct 64-bit value with a non-zero upper half.

Obviously on a real ARM memory barriers are critical, and indeed the code h=
as such barriers in it, but I'm assuming that any possible mistranslation o=
f the barriers is irrelevant because for a 64-bit load and a 64-bit store y=
ou should get all or nothing. Other clues that may be relevant: the code is=
 _near_ a LDREX/STREX pair (the busy-waiting is used to resolve a race when=
 updating another variable), and the busy-wait loop has a yield instruction=
 in it (although those appear to be no-ops with MTTCG).

The bug repros more easily with more guest VCPUs, and more load on the host=
 (i.e. more context switching to expose the race). It doesn't repro for the=
 single-threaded TCG. Unfortunately it's hard to get detailed trace informa=
tion, because the bug only repros roughly every one in 40 attempts, and it'=
s a long way into the guest OS boot before it arises.

I'm not yet 100% convinced this is a qemu bug -- the obvious path through t=
he translator for those instructions does 64-bit memory accesses on the hos=
t -- but at the same time, it has never been seen outside qemu, and after s=
taring long and hard at the guest code, we're pretty sure it's correct. It'=
s also extremely unlikely to be a wild write, given that it occurs on a wid=
e variety of guest call-stacks, and the memory is later inconsistent with w=
hat was loaded.

Any clues or debugging suggestions appreciated!

Thanks,
Andrew
