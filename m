Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp812779wrt;
        Mon, 11 Mar 2019 09:08:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQ5eTLRObDuyUz0wplxysruJgsQUiFYPEcjjjXMC61r9HYHepFxz428NvpVSoDuAk6nZNq
X-Received: by 2002:a0d:e083:: with SMTP id j125mr9645898ywe.175.1552320531186;
        Mon, 11 Mar 2019 09:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552320531; cv=none;
        d=google.com; s=arc-20160816;
        b=b31e85xB0VzHjYu3/r41nJOMm3VS1CcfQb/Z1Q9HUuYUh4KJMM3BiEHiDtvNr6kGls
         k4aIgYPMSdZAflmX11F11kOe+TRcXh1MPaXbRk3+dEfTEEpYcr6SFhTaUn624l9ZD9vE
         2Th27ZUuF3j8c64k92vXtUUd0bBTMGoHe6Oaz4+nlx1t9RcjwzbTpgbMxagh8x2QbuyP
         T4GavIkUHfip3oVCLNFoCcaprpbHxSzU4e1qxBJz84MEKWM//JVXZ2BhZnFN7bIgK45K
         ppCtepIAIqL3cGbypVgO5B9iVuJVZ6fObp+m96XZsWv43F27vJkSaRi1x6+53xI3oq3X
         aEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:date:thread-index
         :thread-topic:to:from:message-id;
        bh=zbD/GW8aUtGsNwpnmgwWcbtFoYUhtw5IXpFY00N5eY8=;
        b=f6Z4UVnTEGkwlsVUhsRuEq0c8+zh8BsyHa8+0YK22Q533ftq1T8ODeCEX8B6Sf4M+Y
         3Jgb7Q4yeJ57KvjTrmr8Nrv4EBpU3ba82BBcdjInxoyPsqsHB6uxIvByTmR2FAweu6nL
         H/l8huyqAT+xTECV5MW+h7pu0eiwjIevI1cFFPPwYT4voq+C3yT3RUf3F6yviG4wsfJE
         u2jURMoQ6Qpkd6+v4tzt13U+yrdXBVdH+ckfDGPWRgdyf7WF6vxc2tIdngrUGB8SNyUe
         BczQoL2ZIvYXRpgrO8kuTIigE8GSVEBebNFTOATjfEmNa4m5EEfyOXwh5gL+zKMkOriF
         HFGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h40si3632776ywk.242.2019.03.11.09.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 09:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Message-ID: <5c868813.1c69fb81.ffaf6.c7daSMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: C87848E9-4108-4586-B433-BF026017D406
Received: from localhost ([127.0.0.1]:36007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3NTu-0001CO-IT
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 12:08:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3NHK-0007Sh-If
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 11:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3NHJ-0008QR-1p
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 11:55:50 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2489 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3NHF-0008M5-VL; Mon, 11 Mar 2019 11:55:46 -0400
Received: from DGGEMA403-HUB.china.huawei.com (unknown [172.30.72.55])
	by Forcepoint Email with ESMTP id 3775EAC78FD7007A4C83;
	Mon, 11 Mar 2019 23:55:38 +0800 (CST)
Received: from DGGEMA423-HUB.china.huawei.com (10.1.198.156) by
	DGGEMA403-HUB.china.huawei.com (10.3.20.44) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Mon, 11 Mar 2019 23:55:37 +0800
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.115]) by
	dggema423-hub.china.huawei.com ([10.1.198.156]) with mapi id
	14.03.0415.000; Mon, 11 Mar 2019 23:55:33 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [RESEND PATCH] target/arm: change arch timer registers access
	permission
Thread-Index: AdTYGYIM5QqfYxHeRXuAzVojhxHLjQAA1dHA//+BU4CAAIqy0w==
Date: Mon, 11 Mar 2019 15:55:33 +0000
References: <0184EA26B2509940AA629AE1405DD7F202153AC7@dggema523-mbx.china.huawei.com>,
	<CAFEAcA9yr3trFz7ZFsS-P-g=gxe=MX6Eet_dTdcOCSdhW7_J4w@mail.gmail.com>
In-Reply-To: <CAFEAcA9yr3trFz7ZFsS-P-g=gxe=MX6Eet_dTdcOCSdhW7_J4w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.188
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [RESEND PATCH] target/arm: change arch timer
 registers access permission
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XcfAePtOEMqH

dW5kZXJzdGFuZCBub3fvvIx0aGFua3MgZm9yIHRoZSBleHBsYWluYXRpb24sIEkgd2lsbCB1cGRh
dGUgaXQuDQrlj5Hku7bkurrvvJpQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc+DQrmlLbku7bkurrvvJpnZW5nZG9uZ2ppdSA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4NCuaK
hOKAg+mAge+8mnFlbXUtYXJtIDxxZW11LWFybUBub25nbnUub3JnPjtRRU1VIERldmVsb3BlcnMg
PHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCuaXtumXtO+8mjIwMTktMDMtMTEgMjM6Mzk6MzINCuS4
u+KAg+mimO+8mlJlOiBbUkVTRU5EIFBBVENIXSB0YXJnZXQvYXJtOiBjaGFuZ2UgYXJjaCB0aW1l
ciByZWdpc3RlcnMgYWNjZXNzIHBlcm1pc3Npb24NCg0KT24gTW9uLCAxMSBNYXIgMjAxOSBhdCAx
NToyNCwgZ2VuZ2RvbmdqaXUgPGdlbmdkb25naml1QGh1YXdlaS5jb20+IHdyb3RlOg0KPiBTbyBJ
ZiBRRU1VIGRlZmluZWQgdGhlIHRpbWVyIHJlZ2lzdGVycyByZWFkIG9ubHkgaW4gUEwwLCBldmVu
IHRob3VnaCBpdCBoYXMgYmVlbiBjb25maWd1cmVkIHRvIGhhdmUgd3JpdGUgcGVybWlzc2lvbiBp
biBQTDAgYnkgaGlnaCBQTHgsIHdlIHN0aWxsIGNhbm5vdCBoYXZlDQo+IFdyaXRlIHBlcm1pc3Np
b24sIGJlY2F1c2UgUUVNVSB3aWxsIGZpcnN0bHkgY2hlY2sgdGhlIGRlZmluZWQgcGVybWlzc2lv
biBhbmQgdGhlbiBjaGVjayB0aGUgY29uZmlndXJlZCBwZXJtaXNzaW9uIGJ5IGhpZ2ggUEx4Lg0K
DQpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gc2F5
IGhlcmUuDQoNClllcywgaXQgd2FzIGEgYnVnIHRoYXQgd2UgbWFya2VkIHRoZXNlIHJlZ2lzdGVy
cyBhcyByZWFkLW9ubHkgZm9yIFBMMCwNCmFuZCB3ZSBzaG91bGQgZml4IGl0Lg0KDQpXaGF0IEkg
YW0gdHJ5aW5nIHRvIHNheSBpcyB0aGF0DQogLmFjY2VzcyA9IFBMMV9SVyB8IFBMMF9SVw0KDQpp
cyBleGFjdGx5IGVxdWl2YWxlbnQgdG8NCiAuYWNjZXNzID0gUEwwX1JXDQoNCmFuZCB3ZSBzaG91
bGQgdXNlIHRoZSBzaW1wbGVyIHZlcnNpb24gb2YgdGhlIGV4cHJlc3Npb24uDQoNCihJZiB5b3Ug
bG9vayBhdCB0aGUgZGVmaW5pdGlvbnMgb2YgYWxsIHRoZSBQTCpfIGNvbnN0YW50cywNCnlvdSBj
YW4gc2VlIHRoYXQgUEwwX1cgaW1wbGllcyBQTDFfVzoNCiNkZWZpbmUgUEwwX1cgKDB4MDEgfCBQ
TDFfVykNCmFuZCBzaW1pbGFybHkgZm9yIFBMMF9SLiBTbyBhbGwgdGhlIGJpdHMgaW4gdGhlIGJp
dGZpZWxkIHRoYXQgd291bGQgYmUNCnNldCBieSBQTDFfUlcgYXJlIGFsc28gc2V0IGJ5IFBMMF9S
Vy4pDQoNCnRoYW5rcw0KLS0gUE1NDQo=
