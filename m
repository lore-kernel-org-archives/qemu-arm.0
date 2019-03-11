Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp810952wrt;
        Mon, 11 Mar 2019 09:07:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw801fCpJDLYKArxW9bkGbfDSBi+x2purbgUpNyI1vIFZA51ffzx4riEszTAiLSLk/M8an+
X-Received: by 2002:a25:8409:: with SMTP id u9mr13551435ybk.347.1552320431603;
        Mon, 11 Mar 2019 09:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552320431; cv=none;
        d=google.com; s=arc-20160816;
        b=tJ71SxUFgIHOOlhYABL7s+8zT/mZj/srDmCHqjV7YYd4FvQNKbWqWsfjmHEMfjwfPU
         Gw5Swx/qJ/6HcGy0e/j/s9jDmrY8TmHjvxhzmHZUuqSE6M64uZ0hSKKHGmilxkZAJkoA
         jG4Kv6Bii3s0ym+IqETVRcJiwy1nyNScS2t/McsVilfI4oMF62NquXQjmDiUSgY0MANj
         6HHYvv2WhVq2qOafwoz2lowVgoHB2V6vzVw1XYvrlzBzpcYozjAz2WR/Kbvczk4rMEVl
         UXPtWkhw34EJ9/xxgoO6qvdwV/DeIXV3RrFkKRBF8txHpJVEMsYlpL1CSBqpqiwTfxGb
         YcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:date
         :thread-index:thread-topic:to:from:message-id;
        bh=dYCbGTXUCLjNlHzLqDbAdfjuSf/AHl5gBXcrxBEjA78=;
        b=DX1TtVowANCOzV8dudKnyBI/cdJ8b6SbKyoJUVuU016Ww9Qnk4ct0L7+j5GP0GHv+a
         RSM5eZ3A9lP4HVn4PgcYCv1iI6HmHiaJ2+8mXBkHeFBMsQeqrFAauRngIWq0EovhtE3B
         t6CRHVuenYLBfIo2o/Hq4ybTnUdC/lcD7RRt0qBvRcrzz4E1vUOKDVEUwKI8V13DeH24
         RGzaViS/7viIRhR7NEE2dBZiVq8mbcuOK2UtMk8rBkFd6EoHkYdG0Ee0lDd3qcOYzA4O
         F7nonr7eRzCEGic0XYbLI49V/s4b8blZZjjpFuhxxa9OW2qFetEKlVH9fHtQXiIhcj+F
         4ohQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si3247654ybw.135.2019.03.11.09.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 09:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Message-ID: <5c8687af.1c69fb81.7b92e.47d4SMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: C87848E9-4108-4586-B433-BF026017D406
Received: from localhost ([127.0.0.1]:35929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3NSI-0008SX-SH
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 12:07:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3NHH-0007Nv-VJ
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 11:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3NHG-0008PU-FO
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 11:55:47 -0400
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
Content-Type: multipart/alternative;
	boundary="_000_C87848E941084586B433BF026017D406_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [RESEND PATCH] target/arm: change arch timer
 registers access permission
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mv8ZevAc478I

--_000_C87848E941084586B433BF026017D406_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

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

--_000_C87848E941084586B433BF026017D406_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVu
dD0iTWljcm9zb2Z0IEV4Y2hhbmdlIFNlcnZlciI+DQo8IS0tIGNvbnZlcnRlZCBmcm9tIHRleHQg
LS0+PHN0eWxlPjwhLS0gLkVtYWlsUXVvdGUgeyBtYXJnaW4tbGVmdDogMXB0OyBwYWRkaW5nLWxl
ZnQ6IDRwdDsgYm9yZGVyLWxlZnQ6ICM4MDAwMDAgMnB4IHNvbGlkOyB9IC0tPjwvc3R5bGU+DQo8
L2hlYWQ+DQo8Ym9keT4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQo8IS0tDQotLT4NCjwvc3R5
bGU+DQo8ZGl2Pg0KPGRpdj51bmRlcnN0YW5kIG5vd++8jHRoYW5rcyBmb3IgdGhlIGV4cGxhaW5h
dGlvbiwgSSB3aWxsIHVwZGF0ZSBpdC48YnI+DQo8L2Rpdj4NCjxkaXY+PC9kaXY+DQo8ZGl2IG5h
bWU9InhfQW55T2ZmaWNlLUJhY2tncm91bmQtSW1hZ2UiIHN0eWxlPSJib3JkZXItdG9wOjFweCBz
b2xpZCAjQjVDNERGOyBwYWRkaW5nOjhweCI+DQo8ZGl2IHN0eWxlPSJ3b3JkLWJyZWFrOmJyZWFr
LWFsbCI+PGI+5Y+R5Lu25Lq677yaPC9iPlBldGVyIE1heWRlbGwgJmx0O3BldGVyLm1heWRlbGxA
bGluYXJvLm9yZyZndDs8L2Rpdj4NCjxkaXYgc3R5bGU9IndvcmQtYnJlYWs6YnJlYWstYWxsIj48
Yj7mlLbku7bkurrvvJo8L2I+Z2VuZ2RvbmdqaXUgJmx0O2dlbmdkb25naml1QGh1YXdlaS5jb20m
Z3Q7PC9kaXY+DQo8ZGl2IHN0eWxlPSJ3b3JkLWJyZWFrOmJyZWFrLWFsbCI+PGI+5oqE4oCD6YCB
77yaPC9iPnFlbXUtYXJtICZsdDtxZW11LWFybUBub25nbnUub3JnJmd0OztRRU1VIERldmVsb3Bl
cnMgJmx0O3FlbXUtZGV2ZWxAbm9uZ251Lm9yZyZndDs8L2Rpdj4NCjxkaXYgc3R5bGU9IndvcmQt
YnJlYWs6YnJlYWstYWxsIj48Yj7ml7bpl7TvvJo8L2I+MjAxOS0wMy0xMSAyMzozOTozMjwvZGl2
Pg0KPGRpdiBzdHlsZT0id29yZC1icmVhazpicmVhay1hbGwiPjxiPuS4u+KAg+mimO+8mjwvYj5S
ZTogW1JFU0VORCBQQVRDSF0gdGFyZ2V0L2FybTogY2hhbmdlIGFyY2ggdGltZXIgcmVnaXN0ZXJz
IGFjY2VzcyBwZXJtaXNzaW9uPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rp
dj4NCjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTBwdDsiPg0KPGRpdiBj
bGFzcz0iUGxhaW5UZXh0Ij5PbiBNb24sIDExIE1hciAyMDE5IGF0IDE1OjI0LCBnZW5nZG9uZ2pp
dSAmbHQ7Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbSZndDsgd3JvdGU6PGJyPg0KJmd0OyBTbyBJZiBR
RU1VIGRlZmluZWQgdGhlIHRpbWVyIHJlZ2lzdGVycyByZWFkIG9ubHkgaW4gUEwwLCBldmVuIHRo
b3VnaCBpdCBoYXMgYmVlbiBjb25maWd1cmVkIHRvIGhhdmUgd3JpdGUgcGVybWlzc2lvbiBpbiBQ
TDAgYnkgaGlnaCBQTHgsIHdlIHN0aWxsIGNhbm5vdCBoYXZlPGJyPg0KJmd0OyBXcml0ZSBwZXJt
aXNzaW9uLCBiZWNhdXNlIFFFTVUgd2lsbCBmaXJzdGx5IGNoZWNrIHRoZSBkZWZpbmVkIHBlcm1p
c3Npb24gYW5kIHRoZW4gY2hlY2sgdGhlIGNvbmZpZ3VyZWQgcGVybWlzc2lvbiBieSBoaWdoIFBM
eC48YnI+DQo8YnI+DQpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSdyZSB0
cnlpbmcgdG8gc2F5IGhlcmUuPGJyPg0KPGJyPg0KWWVzLCBpdCB3YXMgYSBidWcgdGhhdCB3ZSBt
YXJrZWQgdGhlc2UgcmVnaXN0ZXJzIGFzIHJlYWQtb25seSBmb3IgUEwwLDxicj4NCmFuZCB3ZSBz
aG91bGQgZml4IGl0Ljxicj4NCjxicj4NCldoYXQgSSBhbSB0cnlpbmcgdG8gc2F5IGlzIHRoYXQ8
YnI+DQombmJzcDsuYWNjZXNzID0gUEwxX1JXIHwgUEwwX1JXPGJyPg0KPGJyPg0KaXMgZXhhY3Rs
eSBlcXVpdmFsZW50IHRvPGJyPg0KJm5ic3A7LmFjY2VzcyA9IFBMMF9SVzxicj4NCjxicj4NCmFu
ZCB3ZSBzaG91bGQgdXNlIHRoZSBzaW1wbGVyIHZlcnNpb24gb2YgdGhlIGV4cHJlc3Npb24uPGJy
Pg0KPGJyPg0KKElmIHlvdSBsb29rIGF0IHRoZSBkZWZpbml0aW9ucyBvZiBhbGwgdGhlIFBMKl8g
Y29uc3RhbnRzLDxicj4NCnlvdSBjYW4gc2VlIHRoYXQgUEwwX1cgaW1wbGllcyBQTDFfVzo8YnI+
DQojZGVmaW5lIFBMMF9XICgweDAxIHwgUEwxX1cpPGJyPg0KYW5kIHNpbWlsYXJseSBmb3IgUEww
X1IuIFNvIGFsbCB0aGUgYml0cyBpbiB0aGUgYml0ZmllbGQgdGhhdCB3b3VsZCBiZTxicj4NCnNl
dCBieSBQTDFfUlcgYXJlIGFsc28gc2V0IGJ5IFBMMF9SVy4pPGJyPg0KPGJyPg0KdGhhbmtzPGJy
Pg0KLS0gUE1NPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_C87848E941084586B433BF026017D406_--
