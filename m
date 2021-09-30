Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp262354lfp;
        Thu, 30 Sep 2021 06:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcdT80bExu79R3QED0/JZBzjn+QdDHcw8S31pE8XvMPaVfexsTryptYF5xDafV/rkcpaD6
X-Received: by 2002:adf:cf04:: with SMTP id o4mr5930895wrj.352.1633008031322;
        Thu, 30 Sep 2021 06:20:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633008031; cv=pass;
        d=google.com; s=arc-20160816;
        b=OeduGfk8ODDmASFajLO+7J5yzzfqkNUciKPJOJsF+1JTMCniFW2CjitQUMlMc5qa+J
         vHgZ7oG6BG10vX/kEVHbjEi/TPRiNpqShTYhgYodxhj6nFR8jqyrfiyliBSpf5l8LZ66
         ogYWzAe7kf4D+w+hMvsx3vnmMeowrRn9vn+wRQWFRcujEbnRlEy8y1dWJnULL1QZHmkw
         i+2POUhWyZsFHzpPUaHxsgzb/KH3uICaRh2SYTmLZcB2U4VfcYKAMSipCJB2gBtnqE7r
         AzIWI4+c7rehZbWPObX//seWR6hzImxfcKFL98U8pLuRLA2C7O3obNTyDrZdBIGhf3tJ
         r6pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from;
        bh=08BqLj/7ypJxekcMVgs45m1xrdpXph4f6oxKhV0/9jY=;
        b=ibRpmcCF2rU6G+prLltPGuzN/oYVkMGOJp4fQAVa+M08kOZIzC/W9i7H7gT/xuZdjz
         nwxYBk+hzX/peaH3EQNz08olgH8VrbswPqfBfYsuNbh555ig+13RQdQaKCyHCbT2SYAD
         BNFz2sbxUxyHclXiFG1WEPxzXUbMFvpV4kF6Vkeg0JI2k9jjsaMftH8Iaie6Q+dcRG9n
         eSXvZfdD8W7p8irliTKEGllCPUYOiWX9SrK9TsO0fWX50JL41qN/g/Zr7R/MX5WSnsOM
         Wm64PO4fXeAsSOO9G6PwbFuwMwiNrmnzHBQYI6EbEDTfFEoEOsJ1w1w61rUgfxhpADtq
         giug==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si5042814wmc.91.2021.09.30.06.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 06:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVvzC-0003BJ-9M
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 09:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lentz.benjamin@outlook.de>)
 id 1mVulp-0001Lz-E0
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 08:02:37 -0400
Received: from mail-vi1eur05olkn2082a.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::82a]:54912
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lentz.benjamin@outlook.de>)
 id 1mVulm-0003is-BB
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 08:02:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZcBYpx5KMt8wpJNPEbEFX6vsNTng6JB/jvj/0VGZcRZXLMbyn1VzsXhKFrSxnxChwzShFC5zlS/3m5KMKOpR1CTSxcSeAWkwysKD6avg+09fqg9MGeze+fBKTnrA9QrLF87kOPFzHoiKEqyplAJeFNMOTpztOK64mxEmSqjFmFG6W3OS+xnqQoSrZUzLd7oEYQ1C9jfilPhUQRyBF+hzLdNilWXNIAlR78rkgc06mt4ooWMNk8S7wWrX/6jyxZnU9ejP7SjFeU7VA6mZ2WqVocwIpCf2Ot6c1ZRPraVIsM2ZJwcAuKcJxHUbkqfgNbOkb0QZpVYIAG4/mKP3Rktaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=08BqLj/7ypJxekcMVgs45m1xrdpXph4f6oxKhV0/9jY=;
 b=hLLlRMjUbEbtZ8KgDFDL1ddkZA7A9J1j35kGNOK7qi/GThd7YGLEcaY6uTcTmG6sGFDAt1AZjZ6o+VIU8iU9Bv76gqUiSt6236jPlxFEiQCvMEbPNOncyTMSn+4Y0PUK4ua8FUxhH17auJ4SMOsZckg/z97vopiAL+PI7y+5bC/W/zkZzSiMs2CRjZ/4kp6A/kvHSexkDrw0tBDCINgxHupu76OITM8DBkmy0Gg+I5UHjQMBuylPb6ivCrYlx6gT/Z5yeLlgDigKC4vjAqlShLZtjDlloYSiaW1JS/ghSLlbxCT0pcwxAlU5LRbLV3E3S0agx3Wo2cnQ5Wgzo6DPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6PR06MB4598.eurprd06.prod.outlook.com (2603:10a6:20b:3f::26)
 by AM5PR0602MB2817.eurprd06.prod.outlook.com (2603:10a6:203:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 11:57:27 +0000
Received: from AM6PR06MB4598.eurprd06.prod.outlook.com
 ([fe80::bd76:3a1a:755:7ec7]) by AM6PR06MB4598.eurprd06.prod.outlook.com
 ([fe80::bd76:3a1a:755:7ec7%5]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 11:57:27 +0000
From: Benjamin Lentz <lentz.benjamin@outlook.de>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Windows virtualization
Thread-Topic: Windows virtualization
Thread-Index: AQHXtfJWvbwuYqXklUebRWoZyztZHw==
Date: Thu, 30 Sep 2021 11:57:27 +0000
Message-ID: <A796F566-D430-4CB3-A689-C63698C63F8E@outlook.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [DPPhLlsKdApTSJq4rzcc69AzXK3kxnWA]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb1f409b-5fea-4e91-125c-08d984097962
x-ms-traffictypediagnostic: AM5PR0602MB2817:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaJFeNEK4SLhLBjXsXAqW1cU4w/povrmGqT7ud8BABorGHsOCGL/xXq33kGbHxgrFNyElV+P5IuUPoRjJv/qLlsHkyIdzWQkI6n08JjAoCEU/u23cWiTOPqawUALha2sxr2CF9KLK2z4M8qL0dp6aWeaNVqo967o6MhgpaTdOnZw0T0KB8+rUnoX4HYytyQq/hWwybkrizzTJu0kd1JgXAC8YzQSaRyI3pXgrH19YJy/AzYsVhdv6eLrRpNKYRq17QWpKSjiSGOVwXyVMmztAMC/oXV/3w3WrSdY6PW8bxtwOpcyWniQQUGRRd/nUJU1fHXZ4UDFRklHYtqKlr09ONT4SZxKkYC3E2Ve/Sko7rMUOrLbdGZNIfflNsRtL49AFM7jVaKkSLEp97pire5lsPXsxoVOgCwNXvFPwBDEgGzS975fMm/BNBE/b2wQoQzA
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: ColomMev6prZqCyiSni//+OoEX3YOCWbQR8uskT6/xGyQZheaFVod/QZti9eHLHO7MmZVM9vqYJpUYyiageHkjA567eQzTzKq4dHlJUWkEqZdjgNMDl+vFDsrhMAXaUI9cPUlfVdWBQcWOJh1n8QlA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_A796F566D4304CB3A689C63698C63F8Eoutlookde_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-eb2c2.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR06MB4598.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1f409b-5fea-4e91-125c-08d984097962
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 11:57:27.4628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0602MB2817
Received-SPF: pass client-ip=2a01:111:f400:7d00::82a;
 envelope-from=lentz.benjamin@outlook.de;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_50=0.8, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Sep 2021 09:19:50 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZNN5ijzW00Bj

--_000_A796F566D4304CB3A689C63698C63F8Eoutlookde_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkgd2FudCB0byB2aXJ0dWFsaXplIG15IFBDIG9uIG15IE0xIEFSTS1iYXNlZCBN
YWNib29rLiBJIG1hZGUgYSBzbmFwc2hvdCBmcm9tIG15IFdpbmRvd3MgMTAgeDY0IFBDIGFuZCBj
cmVhdGVkIGEgLnZoZHggZmlsZS4NCk15IFF1ZXN0aW9uIGlzOg0KQ2FuIEkgcnVuIHRoaXMgeDY0
IHZoZHggV2luZG93cyBpbWFnZSBvbiBhIE0xIE1hYyBvciBub3QuDQpJZiB5ZXMg4oCUPiBIb3c/
Pz8NCg0KQmVzdCB3aXNoZXMsDQpCZW5qYW1pbiBMZW50eg0KDQo=

--_000_A796F566D4304CB3A689C63698C63F8Eoutlookde_
Content-Type: text/html; charset="utf-8"
Content-ID: <345A1C4D6628284C85B806399F3E1EE9@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCkhlbGxvLA0KPGRpdiBjbGFzcz0iIj48YnIgY2xh
c3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+SSB3YW50IHRvIHZpcnR1YWxpemUgbXkgUEMg
b24gbXkgTTEgQVJNLWJhc2VkIE1hY2Jvb2suIEkgbWFkZSBhIHNuYXBzaG90IGZyb20gbXkgV2lu
ZG93cyAxMCB4NjQgUEMgYW5kIGNyZWF0ZWQgYSAudmhkeCBmaWxlLjwvZGl2Pg0KPGRpdiBjbGFz
cz0iIj5NeSBRdWVzdGlvbiBpczo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+Q2FuIEkgcnVuIHRoaXMg
eDY0IHZoZHggV2luZG93cyBpbWFnZSBvbiBhIE0xIE1hYyBvciBub3QuJm5ic3A7PC9kaXY+DQo8
ZGl2IGNsYXNzPSIiPklmIHllcyDigJQmZ3Q7IEhvdz8/PzwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48
YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPg0KPGRp
diBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsgY29sb3I6IHJnYigwLCAwLCAwKTsg
Zm9udC1mYW1pbHk6IEhlbHZldGljYTsgZm9udC1zaXplOiAxMnB4OyBmb250LXN0eWxlOiBub3Jt
YWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IGF1dG87IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0
LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsg
d2lkb3dzOiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0
OiBhdXRvOyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjog
bm9uZTsiPg0KQmVzdCB3aXNoZXMsPC9kaXY+DQo8ZGl2IHN0eWxlPSJjYXJldC1jb2xvcjogcmdi
KDAsIDAsIDApOyBjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogSGVsdmV0aWNhOyBm
b250LXNpemU6IDEycHg7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5v
cm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFu
czogYXV0bzsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNm
b3JtOiBub25lOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyB3aWRvd3M6IGF1dG87IHdvcmQtc3BhY2lu
ZzogMHB4OyAtd2Via2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IC13ZWJraXQtdGV4dC1zdHJv
a2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyI+DQpCZW5qYW1pbiBMZW50ejwv
ZGl2Pg0KPC9kaXY+DQo8YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_A796F566D4304CB3A689C63698C63F8Eoutlookde_--
