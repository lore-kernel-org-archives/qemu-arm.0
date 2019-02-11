Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2051117wrq;
        Sun, 10 Feb 2019 20:15:27 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYoWULmdu0t54WgmjBEfAg/xm/0B6DE1SkoAFCJO5Fxs3JhYR9dZP69waYTj7ctsG2BdRE0
X-Received: by 2002:adf:f103:: with SMTP id r3mr9590946wro.50.1549858527305;
        Sun, 10 Feb 2019 20:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549858527; cv=none;
        d=google.com; s=arc-20160816;
        b=L0Nu8p3B27u6Jg/kEnr8x+BNOgL6T8Qqqys0mdXpxjcyxfxtToHAcGrw14QMxfcQbC
         1GKfMhRTDXw5AF2QW7O8B8ohJqPkX3pjMMTE5jzH3G7ncfuaQ6Zih8MmwhcVPkT21sEs
         U5z7A14sEIyg/y8EE8kocnB+mgS8xjnchyenEKaGOUBc193so0YF0KdKOvesThg8bcM1
         cWmHZK8aaOxqfSGulODDaoXTj1BIJceOSUeg5x11VAs5W6ZAFkxLwBxd+XgROYJ1ep8g
         2jt6TMBu4fcTKhEAb1i4zQYOHJiD6QtfDSvSwZ51s5/bmEoKCObRy5XihsALeT9RYZC8
         SCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:dkim-signature;
        bh=zGhjN6bRvLWSm7S+BiLTEgJ1JeRf8MHJ6YvRQovSrwQ=;
        b=uEYKKGSL7boWFjTLE3iT7nYArT0cjo2Cr2nfWd103hFUxn/PgOEboiMuB/kf/eNgcH
         rX3P8ktZGjNp3NxL5JFmXvkOkBlZG8g1uUEy0QiZUB0xACRBj131J2o7PHgBUlzl5BIj
         QiyQwWi18FLbiBNqDJGHcGl72CGcS+UJYFmXfbOyUdL2D85AhnAEUrYeqst9T7VXmESk
         UiDjrGow2adWIi1x+028lhpPJMmk/1eiAzADGtgGEGZxhr64E/r00nQYK+dbcazvAheF
         XdeyrabZFy65VBRwhZpdRANc35aCHGgHvb/7y5ikoNh+RQwxheTR9h2i4J0mRF+CClTS
         mwRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=I27rCZNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si8014132wrx.288.2019.02.10.20.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 20:15:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=I27rCZNX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt30A-0001Ek-93
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 23:15:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gt301-0001EP-LB
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 23:15:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1gt2zz-00051y-Vc
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 23:15:17 -0500
Received: from mail-eopbgr740102.outbound.protection.outlook.com
	([40.107.74.102]:40064
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1gt2zz-0004xB-L7; Sun, 10 Feb 2019 23:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zGhjN6bRvLWSm7S+BiLTEgJ1JeRf8MHJ6YvRQovSrwQ=;
	b=I27rCZNXN4mv1AcxLE68IIrE1jwXLpjMCqQAUSInWZxqSJ6D+Jxtu/3+9Ug4lk4wGWE50vd/v5Z2j5NYvEmFmu44xa2NsstS+2ouRhr6lHbVeClCIhZ784uIl3GDfF8LngKz197/P1HcZAf+KUAPd9WSPF4YYoHCS+yYdx8dHpg=
Received: from BN6PR21MB0785.namprd21.prod.outlook.com (10.175.131.19) by
	BN6PR21MB0756.namprd21.prod.outlook.com (10.173.204.16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.1622.5; Mon, 11 Feb 2019 04:15:11 +0000
Received: from BN6PR21MB0785.namprd21.prod.outlook.com
	([fe80::1ca5:e0de:4693:a817]) by
	BN6PR21MB0785.namprd21.prod.outlook.com
	([fe80::1ca5:e0de:4693:a817%10]) with mapi id 15.20.1643.004;
	Mon, 11 Feb 2019 04:15:11 +0000
To: Mark <alnyan@airmail.cc>
Thread-Topic: [v3 PATCH] hw/arm/bcm2835_peripherals: add bcm283x sp804-alike
	timer
Thread-Index: AQHUwWGruLtoKz0NikKkOU2stMwhKKXZ/FNQ
Date: Mon, 11 Feb 2019 04:15:11 +0000
Message-ID: <BN6PR21MB07857DF2253F6D7380B85F239E640@BN6PR21MB0785.namprd21.prod.outlook.com>
References: <20190210165735.GA23862@nyan>
In-Reply-To: <20190210165735.GA23862@nyan>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:600:8780:2c11:8f7:cc16:fc18:a45a]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR21MB0756;
	6:j0Jw9ICJqsYN3+18v5XiQ2uLO9i2XusLZd+VTy5dgUOqMbpLqDiKWXv1YH77m5KsnwcK7I6/rDamwsr5jjemW7c68rkbmSdlBxjREOitOpUaBPuffgnnyxvFtMcgnIDtXXUQpeAxfgirWGeUy5kX4M455i57BrbdQaBH5Cx2P6FLNFPn8tzsIWWYT055w7Xd2qcWyPiCTeLEMR4lPvW1NT35dDGAUbCFmxIQ7eQLkS8NrDEr+nyQBOW4gcxJAQKFRKn1Bt/u6HRtCJMaKzJZVv7J/1qQYjt8CJgJIZ/zvbupxjF/1IB1vSKigiFUB11j1foksNWX4qlRzZ93kYK4UFVO0dGBB/Y61a846Z0Y9vg2UK5rLF5pQVEfjMwHWfr94pnzn1TyHnlhn4hgp3LGO1TBUc0HnvehGW4jTvh3ZqS/3Go2kQtvNwxxCbADEw4QoDoe0rCwSVFkR1gGaPfVVg==;
	5:YMy1voC+k6SgLaU8PeB280RqYvfmLHns44W7+9Znke6YBX+1zL3VHIW2++W80E2np47eMGLOediiV0Wy2UHERDMrW/20mraAZZUH49RTDzdb+uF8rwqLEHyuf2MhYgeZGlyWaqbt6EDZkIw6lJrBUuzdQngy0jYd2ztm4zI/bZPoSqvZrsU5rOUz3lljQKH5vtHvFTjK815qziUBO1ClVg==;
	7:3tdgsrdxlJpQ0s/WXOmB34I85JuApqlSBrJI368AlsRtVV5f6zC81MNmSE8WDAU4t5crckOy7FMqzre3ZI0PBBBhddEa8PvRwdr8kECRC/HqlsuCljdfzzb3aW7lSuVpZzxlXPVwD8h/nC60jwg1OQ==
x-ms-office365-filtering-correlation-id: 7ec2355b-66b3-45cf-2efe-08d68fd7842c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7193020);
	SRVR:BN6PR21MB0756; 
x-ms-traffictypediagnostic: BN6PR21MB0756:
x-ms-exchange-purlcount: 1
x-o365-sonar-daas-pilot: True
x-microsoft-antispam-prvs: <BN6PR21MB0756980B45F3A601985662379E640@BN6PR21MB0756.namprd21.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(366004)(346002)(396003)(199004)(189003)(51914003)(316002)(6916009)(11346002)(476003)(446003)(54906003)(22452003)(6436002)(72206003)(478600001)(186003)(33656002)(68736007)(97736004)(53546011)(256004)(102836004)(86362001)(71190400001)(46003)(4744005)(229853002)(6306002)(486006)(53936002)(55016002)(6506007)(2906002)(71200400001)(9686003)(6346003)(99286004)(8936002)(74316002)(6246003)(81166006)(76176011)(4326008)(14454004)(966005)(86612001)(6116002)(305945005)(106356001)(25786009)(8676002)(81156014)(10290500003)(105586002)(8990500004)(7736002)(10090500001)(7696005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR21MB0756;
	H:BN6PR21MB0785.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 45qFsNshP3JRTd7oE+iJVHBsvFMF52l1Cd6ftwCCTU+BsWSF0dx8/fShFb9qhrafSuYUxBS6bAX08rNzdTw6DQRYM014pF+Dr305ptplIlT/er6065WlGOAymP9gst6hUYC73Ckd2aOFoGij8t973DUuUYUjVoYp1ymKg7L5lO/TO3kou3kPMk0pdvtdwu4LGnAOlQulsr0AOJ/AL7QFE0rA/UeRar68vsqIsea27rDnPcKN2P7o7qNJeNtOBO58Y6ISngKUGXYRqNE2MjnA+6WaBdyeQECmpMLTswgKjF8+AQsENLn+EiS+vizj8cqz+Z0+c4f9GPJfRFwIGzUz8K+NIM8geDnqsm2MX9tki2VAmKaOrqYPyxG9LgNiGleJCb9/sqF/BAi/odybA7RvNyrQZzY4m76FJZusKnQJaSU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec2355b-66b3-45cf-2efe-08d68fd7842c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 04:15:11.6861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR21MB0756
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.102
Subject: Re: [Qemu-arm] [v3 PATCH] hw/arm/bcm2835_peripherals: add bcm283x
 sp804-alike timer
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
From: Andrew Baumann via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open
	list:Raspberry Pi" <qemu-arm@nongnu.org>,
	=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Qdlr5bb47IN

SGkgTWFyaywNCg0KPiBGcm9tOiBNYXJrIDxhbG55YW5AYWlybWFpbC5jYz4NCj4gU2VudDogU3Vu
ZGF5LCAxMCBGZWJydWFyeSAyMDE5IDA4OjU4DQo+IFN1YmplY3Q6IFt2MyBQQVRDSF0gaHcvYXJt
L2JjbTI4MzVfcGVyaXBoZXJhbHM6IGFkZCBiY20yODN4IHNwODA0LWFsaWtlDQo+IHRpbWVyDQoN
ClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBUaGUgaW50ZWdyYXRpb24gd2l0aCBiY20yODM1X3Blcmlw
aGVyYWxzIGxvb2tzIGdvb2QsIGJ1dCBob3BlZnVsbHkgb25lIG9mIHRoZSBRRU1VIG1haW50YWlu
ZXJzIGNhbiBnaXZlIHlvdSBhIHJldmlldyBvZiB0aGUgdGltZXIgaW1wbGVtZW50YXRpb24gYXMg
SSdtIHJlYWxseSBzaG9ydCBvbiB0aW1lIGF0IHRoZSBtb21lbnQuDQoNCklmIHlvdSBkaWRuJ3Qg
YWxyZWFkeSBzZWUgaXQsIHlvdSBtYXkgd2FudCB0byBjb21wYXJlIHdpdGggdGhlIGltcGxlbWVu
dGF0aW9uIGhlcmUsIHdoaWNoIG9yaWdpbmF0ZXMgZnJvbSBHcmVnb3J5IEVzdHJhZGU6DQpodHRw
czovL2dpdGh1Yi5jb20vMHhhYnUvcWVtdS9ibG9iL3Jhc3BpL2h3L3RpbWVyL2JjbTI4MzVfdGlt
ZXIuYw0KLi4uIHNhZGx5IEkgbmV2ZXIgZ290IGFyb3VuZCB0byBtZXJnaW5nIGl0IHVwc3RyZWFt
IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHJhc3BpIGVtdWxhdGlvbi4g4pi5DQoNCkNoZWVycywNCkFu
ZHJldw0KDQo=
