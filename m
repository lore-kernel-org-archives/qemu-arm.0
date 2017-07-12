Received: by 10.25.44.15 with SMTP id s15csp644072lfs;
        Wed, 12 Jul 2017 03:59:23 -0700 (PDT)
X-Received: by 10.55.192.148 with SMTP id v20mr5548469qkv.263.1499857162990;
        Wed, 12 Jul 2017 03:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499857162; cv=none;
        d=google.com; s=arc-20160816;
        b=M9WeQqAWpvdRCfolQH7O2cqWkZZkh9A+CR/Og3Ds1+0SWWvH2Gz4ZpwqV669cVUwH2
         h3eMLHk7A0y3zOEmAR24/wx0x6x7MX9QLh+uy8G/772HWPNhay83Hw9EXE+czbs53fqm
         EXhO65wG7Qnablv79fSSlIXMMAZ1bQ3JuafT36rmcbFvfocrlqznHrhnqVfv8x1yPnjX
         T/uwXg0CWz1m+w8iunmgipNcM0n5URMB7Zv6NIvpKjt8EA0nyaKvFdpjPbioEEeiJ//C
         K3rB0i8vJui1pqgYRp5ARnnaDn6Va0KRrwnlfZUHLSrPDRoHmRK5+8NjX+NrSZTw2yG5
         bozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :spamdiagnosticmetadata:spamdiagnosticoutput:user-agent
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature:arc-authentication-results;
        bh=DPQ8zzdKSi6mZs2K3j6/SF0V/xsQLqI6YS8cDOt6zGA=;
        b=aguzd+/wP7Pw4UDBqCLY736VBpjec0vJWR3GNKOdJKLKP+wNqa0ozE0lp2N1Mxn4DK
         mxNgD3J28VZ6T05M+sQIjrq3R7A3fGc4/5x78nVRGuDEg8iAApMoomrPmO65USe+Y7qh
         98la/oJxZ3nDPiOxFCDA1S5qwcFvTVPN3+vyOwYIulUMP3lkQDmyvgusPflXqQXohqFY
         xniS5q4eb3UTmvajYWB99ZpzPRiG68Ga7lvm4UU4bkFsLe+/4kZ7P0Cg4U7bAm4WJjDk
         0EHw7NH14kichXhZBtrN5z/jaiyKFJI8onnuCnHDC14K/YMGAKHODNZTn4W+mXcbhZgQ
         FH8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@juniper.net header.b=hPVlrE0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=juniper.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y6si1938942qtb.381.2017.07.12.03.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 03:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@juniper.net header.b=hPVlrE0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=juniper.net
Received: from localhost ([::1]:51730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVFMW-0001qn-2f
	for alex.bennee@linaro.org; Wed, 12 Jul 2017 06:59:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dchang@juniper.net>) id 1dVFMK-0001p6-TH
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 06:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dchang@juniper.net>) id 1dVFMH-0004hV-ST
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 06:59:09 -0400
Received: from mail-by2nam03on0135.outbound.protection.outlook.com
	([104.47.42.135]:45329
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dchang@juniper.net>) id 1dVFMH-0004gR-DE
	for qemu-arm@nongnu.org; Wed, 12 Jul 2017 06:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juniper.net;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=DPQ8zzdKSi6mZs2K3j6/SF0V/xsQLqI6YS8cDOt6zGA=;
	b=hPVlrE0TITk1xyO+BSB5W72K9T5skKnHWU2DI8xp9Ui7rTPxHRJzMbBKMnRialJqWgvja8Fm//lYHH/8/l7XENrXu+S6y0Os0tJJ6uNEm/Jahvbrvzd7jkTrgqJBGk2vpjY1e92zTzxEd6aaiH0PQ+gSBCyDdtk1hoWWVpblUpE=
Received: from DM5PR05MB2924.namprd05.prod.outlook.com (10.168.176.136) by
	DM5PR05MB2795.namprd05.prod.outlook.com (10.168.175.135) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.4; Wed, 12 Jul 2017 10:59:02 +0000
Received: from DM5PR05MB2924.namprd05.prod.outlook.com ([10.168.176.136]) by
	DM5PR05MB2924.namprd05.prod.outlook.com ([10.168.176.136]) with mapi id
	15.01.1261.012; Wed, 12 Jul 2017 10:59:02 +0000
From: Daniel Chang <dchang@juniper.net>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: How to set RTC for ARM guest OS
Thread-Index: AQHS+v3ermYTG55K4kmLCrRoU8nPSg==
Date: Wed, 12 Jul 2017 10:59:02 +0000
Message-ID: <16ECB2E8-B50C-45E2-B258-6A470467D2C8@juniper.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/f.20.0.170309
authentication-results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=juniper.net; 
x-originating-ip: [116.197.190.12]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2795;
	7:E8Nq5jO2c82zBNKO80jak8q/ohsMAljH42fHmoP0vxGV5LLMhecdhwU8PpkVQgkn1Y1kqPcAYgpcDpPflTHkggnmXqepGWKVRSved+ZBUPAgmOMeZ220RFbBjT0EDtLK461ZBvZACbDQW819SN5PTv6DvEVDyMcb5IM3kulVin3QCrfnfsmRVCcioCJjCG6AT9LW3FBXYbbQJl9QkHq/y4eMqt9Fx8/GVM1yqqIkdQUVp8GntR9zrbU+aqGA2s5uFvXv0IrWmxbhLt5yUtwvCUJWkq0SAzUNaDi/xv4g5sgDsEyHDIfSRHBx4HDao1sRukz1/7z4nWg7A0UEnpUnpM16ADfhveMegKmErmoZScqNrnXs4M6SSIQszbNCblzcqhZP1fZMpILpbIRggySbkknCt0adI9H7Xd3RQxFTbjIysxBNYGLJ7oGOuhSQM810cbxOgJLTHVzwkY4frpGcl+x+SJYnOukBHzm0Y8ukX3aHdWU3sbsxJPgQ2YVM/8O1bQ7V2UgLriWwWuyPG41v10CHvzKvdHA8FEGaREqVfSYZTv8nUi+E4UZjrq4f2UnsxI6kOj2dzMsO9FrzxXqw2ytkzSJYZwoi+cwAIt8wRDhnDPUVoxEzRUMU2QZUWt1EYejGNyngdtz9nKC7h+Q2LESH2xytmOdPTwXTmHnsk6XUI6Mq59pJDFmAROKA5677hbCDW8tkRjsZa/cmWgHFmnEQvbB2VEMd5mPvu3nOzljJfyLT0LFdTpemPMVmrgS09IfFpOGenIQtmaw2NUrXNgTHcr/aG+QwLIBMRjDFjvw=
x-ms-office365-filtering-correlation-id: 1a3df8d9-6bf9-43bc-4eed-08d4c9150197
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR05MB2795; 
x-ms-traffictypediagnostic: DM5PR05MB2795:
x-exchange-antispam-report-test: UriScan:(151999592597050)(133145235818549)(26388249023172)(236129657087228)(21748063052155);
x-microsoft-antispam-prvs: <DM5PR05MB2795E70A33F64591DF4F70F7D3AF0@DM5PR05MB2795.namprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910075)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(3002001)(6055026)(6041248)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR05MB2795; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR05MB2795; 
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39840400002)(39400400002)(39410400002)(2906002)(478600001)(86362001)(53936002)(6512007)(54896002)(6306002)(38730400002)(5660300001)(99286003)(110136004)(7736002)(3846002)(25786009)(3660700001)(5640700003)(33656002)(81166006)(14454004)(102836003)(6116002)(189998001)(8676002)(8936002)(50986999)(54356999)(558084003)(2351001)(3280700002)(6506006)(2501003)(6916009)(2900100001)(66066001)(82746002)(83716003)(6436002)(36756003)(83506001)(6486002)(77096006)(4001350100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2795;
	H:DM5PR05MB2924.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_16ECB2E8B50C45E2B2586A470467D2C8junipernet_"
MIME-Version: 1.0
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2017 10:59:02.3959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2795
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.135
Subject: [Qemu-arm] How to set RTC for ARM guest OS
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eBxQ71FaaM12

--_000_16ECB2E8B50C45E2B2586A470467D2C8junipernet_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

R3V5cywNCg0KSSB1c2VkIOKAmC1tIHZpcnTigJkgdG8gaW1pdGF0ZSBBUk0gZ3Vlc3QgT1Mgb24g
WDg2LTY0IHVidW50dS4gQnV0IHRoZSBzeXN0ZW0gdGltZSBpcyBhbHdheXMgcmVzZXQgdG8gSmFu
IDEgb2YgMTk3MCBhZnRlciByZWJvb3QuDQpJIHRyaWVkIOKAmC1ydGMgY2xvY2s9aG9zdOKAmSAg
YW5kIOKAmC1ydGMgYmFzZT15eXl5LW1tLWRk4oCZIGJ1dCBzZWVtcyBpdCBkb2VzbuKAmXQgd29y
ay4NCg0KRG9lcyBhbnlvbmUga25vdyBob3cgdG8gc3VwcG9ydCBSVEMgb24gQVJNIGd1ZXN0Pw0K
DQpUaGFua3MNCkRhbmllbA0K

--_000_16ECB2E8B50C45E2B2586A470467D2C8junipernet_
Content-Type: text/html; charset="utf-8"
Content-ID: <689B447315FA2644ABD6BBDFB4760843@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iVGl0bGUiIGNvbnRlbnQ9IiI+DQo8bWV0YSBuYW1lPSJLZXl3b3JkcyIgY29udGVu
dD0iIj4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUg
KGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxlPjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8N
CkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0
IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0K
CXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWls
eTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERl
ZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJ
e21hcmdpbjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7
DQoJZm9udC1mYW1pbHk6Q2FsaWJyaTt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21z
by1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1
bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1z
dHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojOTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRl
cmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29t
cG9zZTsNCglmb250LWZhbWlseTpDYWxpYnJpOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5t
c29JbnMNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJbXNvLXN0eWxlLW5hbWU6IiI7
DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTsNCgljb2xvcjp0ZWFsO30NCi5Nc29DaHBEZWZh
dWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OkNhbGlicmk7
fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBp
biAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rp
b24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBiZ2NvbG9yPSJ3aGl0ZSIgbGFuZz0i
RU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+R3V5cyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkg
dXNlZCDigJgtbSB2aXJ04oCZIHRvIGltaXRhdGUgQVJNIGd1ZXN0IE9TIG9uIFg4Ni02NCB1YnVu
dHUuIEJ1dCB0aGUgc3lzdGVtIHRpbWUgaXMgYWx3YXlzIHJlc2V0IHRvIEphbiAxIG9mIDE5NzAg
YWZ0ZXIgcmVib290LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIHRyaWVkIOKAmC1ydGMgY2xvY2s9aG9z
dOKAmSAmbmJzcDthbmQg4oCYLXJ0YyBiYXNlPXl5eXktbW0tZGTigJkgYnV0IHNlZW1zIGl0IGRv
ZXNu4oCZdCB3b3JrLg0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5Eb2VzIGFueW9uZSBrbm93IGhvdyB0byBzdXBwb3J0IFJUQyBvbiBBUk0gZ3Vlc3Q/PG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGFua3M8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+RGFuaWVsPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0
bWw+DQo=

--_000_16ECB2E8B50C45E2B2586A470467D2C8junipernet_--
