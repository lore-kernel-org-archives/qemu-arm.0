Received: by 10.25.227.6 with SMTP id a6csp2293172lfh;
        Mon, 3 Jul 2017 07:15:11 -0700 (PDT)
X-Received: by 10.200.14.12 with SMTP id a12mr33805569qti.115.1499091311810;
        Mon, 03 Jul 2017 07:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499091311; cv=none;
        d=google.com; s=arc-20160816;
        b=ffzY1jREqnc+JrJcokmeCt7oUbfC0ES7S/lRhgm7xtgN8TTSn9WFAD10tgEZvOdodB
         eg8n6IEkZbRChH1pQTU6EelcwBlzOQ0JynzWecrKrOLY+GIS9XfNK4fStPwZr0a1UX/V
         gqw/9sJH/RiKq8tFTLQiJwxe0C7O49XS1uy8aRCseyzMCUSJ1qcTk3nNUmdOQF+ucsm5
         iSewqIXIsxdAO1vaKATorE8TVHjuG+oWx8wyFM2zUMMzYLBA+kTD755yb3ZR+ctWlx2E
         4ZjT000dmOCmgLvkMFoPZvXxgu9VH+0sTm3+8UKwWIgDIUAExSXac9JVjkvwPc48Dscy
         LKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :spamdiagnosticmetadata:spamdiagnosticoutput:user-agent
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature:arc-authentication-results;
        bh=HQWaFC4dGGxji7fN+t1LZ/nIPKYKnYctiV6XEGCgerA=;
        b=UPM0CMUiNT/RFCU72mG2/A/KMuS0Eaxr8+wpqm51AWAdv0xMf9bxtKJO0lr7+j3dDh
         Fbc4AVNlQdmx7kkwFIN50XF959pjkB2z2CuyVvczD1rs8L82yuEPdW0DLSDs0LUIAgLG
         5OIH9hpioae1VdSR3xqPBKIB7ELSa/vTXgbtcDU1AzhGa000ngSrqbrOTLbOe7b7dPUD
         x5rvHRlOEtO0BLIjJmzItLVLR2cI71npJOLjtaqBHUNZjx00cYrkMi2V9gp26yXW7Oum
         +duK3EaiPTv2oqyCiNfXic873LpIff9/JQ5lrJ24k7tljalHdm17UKM7B8ew10LMMTpc
         STRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@juniper.net header.b=BbFnrm6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=juniper.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si14844480qtb.269.2017.07.03.07.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jul 2017 07:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@juniper.net header.b=BbFnrm6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=juniper.net
Received: from localhost ([::1]:35477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dS284-0001aa-O3
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 10:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dchang@juniper.net>) id 1dRvHl-0002LP-Pm
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 02:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dchang@juniper.net>) id 1dRvHi-0008P8-Oi
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 02:56:41 -0400
Received: from mail-by2nam03on0130.outbound.protection.outlook.com
	([104.47.42.130]:11827
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dchang@juniper.net>) id 1dRvHi-0008Ok-5m
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 02:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juniper.net;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=HQWaFC4dGGxji7fN+t1LZ/nIPKYKnYctiV6XEGCgerA=;
	b=BbFnrm6BinBQEQlAEeKJ3Q3w/ceYoJQwakawYM8aM9CJLXz+gVh06et/bV4GSJL3CIMhcz7B4MJBxH7K6LtpJUXYN5/ilONhDJSJCeOLCYlos0y8EeFqimTJU7LZt8PddAGwdonQLyfqjvJP5mEvSFNstCjykl4g+wZkF6AhJzY=
Received: from DM5PR05MB2924.namprd05.prod.outlook.com (10.168.176.136) by
	DM5PR05MB3372.namprd05.prod.outlook.com (10.174.191.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1240.6; Mon, 3 Jul 2017 06:56:33 +0000
Received: from DM5PR05MB2924.namprd05.prod.outlook.com ([10.168.176.136]) by
	DM5PR05MB2924.namprd05.prod.outlook.com ([10.168.176.136]) with mapi id
	15.01.1240.010; Mon, 3 Jul 2017 06:56:33 +0000
From: Daniel Chang <dchang@juniper.net>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [Query]: Does QEMU support SMSC LAN9514 chip for Raspberry
	Pi2(raspi2)?
Thread-Index: AQHS88mB9F1UfI+atUWzBptOmt6gdg==
Date: Mon, 3 Jul 2017 06:56:33 +0000
Message-ID: <41CFADD7-21D1-4893-955A-503A6C464AC2@juniper.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/f.20.0.170309
authentication-results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=juniper.net; 
x-originating-ip: [116.197.188.14]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB3372;
	7:sUUIrb2ebqzNtfS3fIZZr5InjFWg260aD1V8O7xEW6pQqqbtnNqEXaHwidRDHQBYzs9Tu1hDQEZdFRzlBkVeyFmFgg4rZNLZvumlrUEehwzFTy9jdnVLpT5ovbSvsKzmnx2cbpPMHWu7XXPpM8OFB+BwCf3vDeKZvUmsmfNBZ9nVvIlwIrqn8wKl6sqa1mDsPxOhz6l4ij77WM4t8ehyg49jIWz/LNwXj+wbttl9cFyUQmi80kVziiwaLCgC6nRrDnT6ojLOwtztpYYBj8/LiHK9QWkVOgOi1ptgyK6IVLniWL0VlJ45gEwKQdnTzeJyK2eW3A5dq3DIAYvvn/YwzW7qKHssyR1d/zuqe1PUDinsoMv+qFntM9BW+AMjNTpkHbStcC4OXDu1xD6m/Og3y5hFcvsWvUfTMiUPXJfRhZ3j6kDMq1H2UmHr1JUoXQNR6+FINRLwdvA93k35xY7IWr/mNeNO2W8dEA48xWaj0zupebMwJwQoRd98IL8BJqoND/SfaIXYZm8a6TCu3v3d7ZpOl/z2i0rvpdMxkftxNddkHEj+zyiffrSUkbbgrjDlb7B8eodU4fzW2XKoQyv5hcXRUJFmvAxR3YlPf1WbV7XI/eF7mjkYTWTbfZub3mkrRB5+HvM3qjg+4iN++F7/B58Hcq5aur5hVov740vcR/l8cPl6WwNQ1VxVOaLUjeimIZUCbgQ2bCCDRuGMSLAJTqmnFPLO1+GY28wws5WY0d3zqi/+LUGemauynGWgR7QyjTZdFQnSZH5PWVIAHLwRBmvHZsIc2XUO4ZSAbrNqddg=
x-ms-office365-filtering-correlation-id: 4ad1bf5a-9f41-4aac-a093-08d4c1e0a431
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR05MB3372; 
x-ms-traffictypediagnostic: DM5PR05MB3372:
x-microsoft-antispam-prvs: <DM5PR05MB337226C64DD6A0FDFEA20EA8D3D60@DM5PR05MB3372.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(151999592597050)(158342451672863)(133145235818549)(26388249023172)(236129657087228)(148574349560750)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(2017060910020)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123560025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR05MB3372; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR05MB3372; 
x-forefront-prvs: 035748864E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39410400002)(39860400002)(39840400002)(39450400003)(39400400002)(39850400002)(66066001)(81166006)(8936002)(189998001)(8676002)(36756003)(7736002)(606006)(50986999)(14454004)(54356999)(5660300001)(77096006)(53936002)(236005)(6486002)(54896002)(6306002)(5640700003)(6506006)(6436002)(3846002)(6116002)(102836003)(2900100001)(86362001)(2501003)(82746002)(478600001)(6512007)(99286003)(966005)(33656002)(4001350100001)(2906002)(83716003)(83506001)(25786009)(3280700002)(110136004)(38730400002)(6916009)(2351001)(3660700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB3372;
	H:DM5PR05MB2924.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_41CFADD721D14893955A503A6C464AC2junipernet_"
MIME-Version: 1.0
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2017 06:56:33.7320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB3372
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.130
X-Mailman-Approved-At: Mon, 03 Jul 2017 10:15:07 -0400
Subject: [Qemu-arm] [Query]: Does QEMU support SMSC LAN9514 chip for
 Raspberry Pi2(raspi2)?
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
X-TUID: N/Mcr21rUMoq

--_000_41CFADD721D14893955A503A6C464AC2junipernet_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgZ3V5cywNCg0KUmVjZW50bHkgSeKAmW0gdHJ5aW5nIHRvIGVtdWxhdGUgYSBSYXNwYmVycnkg
UGkgMiBzeXN0ZW0gb24gUUVNVShob3N0IGlzIFg4Ni02NCB1YnVudHUgc2VydmVyIDE3LjA0KS4N
ClRoZSBndWVzdCBPUyBpcyBtYWRlIGJ5IG15c2VsZiB3aXRoIDQuOS4zNCBsaW51eCBrZXJuZWwg
YW5kIGJ1aWxkcm9vdC4gQW5kIEkgY2FuIGJvb3QgaXQgdXAuDQoNClRoZW4gSSB3YW50IHRvIGNv
bmZpZ3VyZSBuZXR3b3JrIHRvIG1ha2UgdGhlIGd1ZXN0IGFjY2VzcyBpbnRlcm5ldC4NClRoZSBp
ZGVhIGlzIHRvIHVzZSBob3N0IHRhcCBkZXZpY2UgYXMgYmFja2VuZCBhbmQgY29ubmVjdGVkIGl0
IHdpdGggZ3Vlc3QgZnJvbnRlbmQgaW50ZXJmYWNlKHZpcnR1YWwgTklDKS4NCkJ1dCB0aGUgcHJv
YmxlbSBpcywgd2hpY2ggdmlydHVhbCBOSUMgc2hvdWxkIEkgdXNlPw0KDQpBY2NvcmRpbmcgdG8g
V2lraXBlZGlhKCBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9SYXNwYmVycnlfUGkjY2l0
ZV9ub3RlLVNNU0MtTEFOOTUxNC1zcGVjcy0zMyksDQpSYXNwYmVycnkgUGkgMiBNb2RlbCBCIGhh
cyBhIGJ1aWxkLWluIFVTQiBFdGhlcm5ldCBhZGFwdGVyIHVzaW5nIHRoZSBTTVNDIExBTjk1MTQg
Y2hpcC4gQnV0IEkgZGlkbuKAmXQgc2VlIGl0IGluIHRoZSBkZXZpY2UgbGlzdCBmb3IgcmFzcGky
Lg0KDQpEb2VzIGFueW9uZSBrbm93Og0KDQoxLiAgICAgICBJZiBTTVNDIExBTjk1MTQgaXMgc3Vw
cG9ydCBpbiBRRU1VIGZvciByYXNwaTINCg0KMi4gICAgICAgSWYgeWVzLCBob3cgdG8gY29uZmln
dXJlIGl0DQoNCjMuICAgICAgIElmIG5vLCBhbnkgd2F5IGVsc2UgY2FuIGJyaW5nIHVwIHRoZSBu
ZXR3b3JrIGZvciBndWVzdA0KDQpBbnkgaGludHMgb3Igc3VnZ2VzdGlvbnMgd291bGQgYmUgYXBw
cmVjaWF0ZWQuDQpEYW5pZWwNCg0KDQo=

--_000_41CFADD721D14893955A503A6C464AC2junipernet_
Content-Type: text/html; charset="utf-8"
Content-ID: <BD291E018289074897FC46231542D951@namprd05.prod.outlook.com>
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
cmxpbmU7fQ0KcC5Nc29MaXN0UGFyYWdyYXBoLCBsaS5Nc29MaXN0UGFyYWdyYXBoLCBkaXYuTXNv
TGlzdFBhcmFncmFwaA0KCXttc28tc3R5bGUtcHJpb3JpdHk6MzQ7DQoJbWFyZ2luLXRvcDowaW47
DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltYXJnaW4tYm90dG9tOjBpbjsNCgltYXJnaW4tbGVmdDou
NWluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQt
ZmFtaWx5OkNhbGlicmk7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVy
c29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseTpDYWxpYnJpOw0KCWNvbG9yOndpbmRvd3RleHQ7
fQ0Kc3Bhbi5tc29JbnMNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJbXNvLXN0eWxl
LW5hbWU6IiI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTsNCgljb2xvcjp0ZWFsO30NCi5N
c29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5
OkNhbGlicmk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1h
cmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6
V29yZFNlY3Rpb24xO30NCi8qIExpc3QgRGVmaW5pdGlvbnMgKi8NCkBsaXN0IGwwDQoJe21zby1s
aXN0LWlkOjE5MTExMTM5MTI7DQoJbXNvLWxpc3QtdHlwZTpoeWJyaWQ7DQoJbXNvLWxpc3QtdGVt
cGxhdGUtaWRzOjIxMTU0MDY3MjIgNjc2OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTUgNjc2OTg3MDMg
Njc2OTg3MTMgNjc2OTg3MTUgNjc2OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTU7fQ0KQGxpc3QgbDA6
bGV2ZWwxDQoJe21zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9z
aXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWwyDQoJe21z
by1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpu
b25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1
aW47fQ0KQGxpc3QgbDA6bGV2ZWwzDQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJvbWFuLWxv
d2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRp
b246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0O30NCkBsaXN0IGwwOmxldmVsNA0KCXttc28t
bGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJ
dGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsNQ0KCXttc28tbGV2ZWwtbnVtYmVy
LWZvcm1hdDphbHBoYS1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2
ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGww
OmxldmVsNg0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2
ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRl
eHQtaW5kZW50Oi05LjBwdDt9DQpAbGlzdCBsMDpsZXZlbDcNCgl7bXNvLWxldmVsLXRhYi1zdG9w
Om5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0u
MjVpbjt9DQpAbGlzdCBsMDpsZXZlbDgNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEt
bG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3Np
dGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDkNCgl7bXNv
LWxldmVsLW51bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5v
bmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4w
cHQ7fQ0Kb2wNCgl7bWFyZ2luLWJvdHRvbTowaW47fQ0KdWwNCgl7bWFyZ2luLWJvdHRvbTowaW47
fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGJnY29sb3I9IndoaXRlIiBsYW5nPSJFTi1V
UyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rp
b24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5IaSBndXlzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVj
ZW50bHkgSeKAmW0gdHJ5aW5nIHRvIGVtdWxhdGUgYSBSYXNwYmVycnkgUGkgMiBzeXN0ZW0gb24g
UUVNVShob3N0IGlzIFg4Ni02NCB1YnVudHUgc2VydmVyIDE3LjA0KS48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+VGhlIGd1ZXN0IE9TIGlzIG1hZGUgYnkgbXlzZWxmIHdpdGggNC45LjM0IGxpbnV4IGtlcm5l
bCBhbmQgYnVpbGRyb290LiBBbmQgSSBjYW4gYm9vdCBpdCB1cC48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlRoZW4gSSB3YW50IHRvIGNvbmZpZ3VyZSBuZXR3b3Jr
IHRvIG1ha2UgdGhlIGd1ZXN0IGFjY2VzcyBpbnRlcm5ldC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhl
IGlkZWEgaXMgdG8gdXNlIGhvc3QgdGFwIGRldmljZSBhcyBiYWNrZW5kIGFuZCBjb25uZWN0ZWQg
aXQgd2l0aCBndWVzdCBmcm9udGVuZCBpbnRlcmZhY2UodmlydHVhbCBOSUMpLjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij5CdXQgdGhlIHByb2JsZW0gaXMsIHdoaWNoIHZpcnR1YWwgTklDIHNob3VsZCBJIHVz
ZT8NCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+QWNjb3JkaW5n
IHRvIFdpa2lwZWRpYSggPGEgaHJlZj0iaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUmFz
cGJlcnJ5X1BpI2NpdGVfbm90ZS1TTVNDLUxBTjk1MTQtc3BlY3MtMzMpIj4NCmh0dHBzOi8vZW4u
d2lraXBlZGlhLm9yZy93aWtpL1Jhc3BiZXJyeV9QaSNjaXRlX25vdGUtU01TQy1MQU45NTE0LXNw
ZWNzLTMzKTwvYT4sIDxvOnA+DQo8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJhc3BiZXJyeSBQaSAyIE1vZGVsIEIg
aGFzIGEgYnVpbGQtaW4gVVNCIEV0aGVybmV0IGFkYXB0ZXIgdXNpbmcgdGhlIFNNU0MgTEFOOTUx
NCBjaGlwLiBCdXQgSSBkaWRu4oCZdCBzZWUgaXQgaW4gdGhlIGRldmljZSBsaXN0IGZvciByYXNw
aTIuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Eb2VzIGFueW9u
ZSBrbm93OjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBo
IiBzdHlsZT0idGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwwIGxldmVsMSBsZm8xIj48IVtp
ZiAhc3VwcG9ydExpc3RzXT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PHNwYW4gc3R5
bGU9Im1zby1saXN0Oklnbm9yZSI+MS48c3BhbiBzdHlsZT0iZm9udDo3LjBwdCAmcXVvdDtUaW1l
cyBOZXcgUm9tYW4mcXVvdDsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOw0K
PC9zcGFuPjwvc3Bhbj48L3NwYW4+PCFbZW5kaWZdPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij5JZiBTTVNDIExBTjk1MTQgaXMgc3VwcG9ydCBpbiBRRU1VIGZvciByYXNwaTI8bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9InRleHQt
aW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PCFbaWYgIXN1cHBvcnRMaXN0
c10+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxzcGFuIHN0eWxlPSJtc28tbGlzdDpJ
Z25vcmUiPjIuPHNwYW4gc3R5bGU9ImZvbnQ6Ny4wcHQgJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1
b3Q7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsNCjwvc3Bhbj48L3NwYW4+
PC9zcGFuPjwhW2VuZGlmXT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SWYgeWVzLCBo
b3cgdG8gY29uZmlndXJlIGl0PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb0xp
c3RQYXJhZ3JhcGgiIHN0eWxlPSJ0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDAgbGV2ZWwx
IGxmbzEiPjwhW2lmICFzdXBwb3J0TGlzdHNdPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48c3BhbiBzdHlsZT0ibXNvLWxpc3Q6SWdub3JlIj4zLjxzcGFuIHN0eWxlPSJmb250OjcuMHB0
ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7DQo8L3NwYW4+PC9zcGFuPjwvc3Bhbj48IVtlbmRpZl0+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPklmIG5vLCBhbnkgd2F5IGVsc2UgY2FuIGJyaW5nIHVwIHRoZSBuZXR3
b3JrIGZvciBndWVzdDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
QW55IGhpbnRzIG9yIHN1Z2dlc3Rpb25zIHdvdWxkIGJlIGFwcHJlY2lhdGVkLjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij5EYW5pZWw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_41CFADD721D14893955A503A6C464AC2junipernet_--
