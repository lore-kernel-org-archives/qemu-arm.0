Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp933316wrt;
        Thu, 13 Dec 2018 07:15:47 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wifx+J1EFOqWE0G1pRN8JU+gHrtoCHrOgsdr5oQCX1CvfWcaEnrAj5iN2kQ94M2HOlrmP5
X-Received: by 2002:a37:b646:: with SMTP id g67mr22384406qkf.326.1544714147177;
        Thu, 13 Dec 2018 07:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544714147; cv=none;
        d=google.com; s=arc-20160816;
        b=S/Qt/luqa0cmb5ThiGU2nCU6Qdv2nqYwO/HQiXJeV7QgTSn0b0Pf1fejTGwg7cQiTg
         cA3u523T4dnK7KhEgQnDtu2DPbRXUNVPbL629Yo2v4kHmEIseAoFttb0XFCUNHfUgUR/
         Q4IESAk/SVwGX/fxYFRD+T4FUeU7S/Bw3OYDhZpo71A4iqIIgP7VUA7gz/kIGgyOkfKz
         9KaizE/hnRKLM8ZjbuhpGiH9wBFImGqajYskCD+pg5gixWghxtfeWOLbVMUo8/zjStHr
         j7C6q/qSDTrqTlJaH/Am21XegeAnnQC/e3WIwyLROPmx4rv9zbzqP4zyDF+m2Oqh7qee
         V9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=ecym/XHvfKi+ooVorh0m4quhlLGaKovv5Cm4XBye354=;
        b=hExz37dkhI1krb8zm9fKZ+kOWeYLnlyQek1lqHBFxQ7DwoSAsZVKbCMX1/1kh9p6oy
         2ap2uYz56y7vd0Jo1qUZZJQIbUuFIVMpARO0/d4f7gSxBM3xLeANkhaULKnSOWCJwgud
         +uONHeZ0pzzpYsPOBh2qAVErP6pztUUSfiX+vuektyFMBB1Tqk113iHCRhvf1VGengBK
         3M8GKgqiOjqRPRuMb5mlPdxqDoNXo/RNKi6t8G3mek0yfSfv7WWoP4ibfR6KZoltyja5
         O0BoSBsiT5BymF7hB4gh8sGuAzIbnowLWMbl8DG1lO486qEvq7Kfcw55rFSrkQ/AIuOU
         FKWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s74si1170073qks.195.2018.12.13.07.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 07:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXSiI-0006su-IR
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 10:15:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.juenger@rwth-aachen.de>) id 1gXSUA-0001rE-4N
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 10:01:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.juenger@rwth-aachen.de>) id 1gXSU0-0006pk-9G
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 10:01:10 -0500
Received: from mail-out-3.itc.rwth-aachen.de ([134.130.5.48]:57015)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.juenger@rwth-aachen.de>)
	id 1gXSTz-0006nY-Tu; Thu, 13 Dec 2018 10:01:00 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ATCQCtcxJc/5gagoZjHAEBAQQBAQcEA?=
	=?us-ascii?q?QGBZYExU4FoJwqDcpY4fIJJhDOCEY9FDAEshEACF4JsIjgSAQMBAQIBAQJtHQu?=
	=?us-ascii?q?FPQEFIxFFEAIBCBgCAiYCAgIwFRACBA4FhSIBpwOBL4kigQ6BC4sxghaBEYJdB?=
	=?us-ascii?q?y6ESjeDBIJXAqEPBwKBFpBbiXeHU4kuj3QCAgICCQIUgV0hgVZNJIM7gicXjh1?=
	=?us-ascii?q?BMYEoiVqBLgGBHgEB?=
X-IPAS-Result: =?us-ascii?q?A2ATCQCtcxJc/5gagoZjHAEBAQQBAQcEAQGBZYExU4FoJwq?=
	=?us-ascii?q?DcpY4fIJJhDOCEY9FDAEshEACF4JsIjgSAQMBAQIBAQJtHQuFPQEFIxFFEAIBC?=
	=?us-ascii?q?BgCAiYCAgIwFRACBA4FhSIBpwOBL4kigQ6BC4sxghaBEYJdBy6ESjeDBIJXAqE?=
	=?us-ascii?q?PBwKBFpBbiXeHU4kuj3QCAgICCQIUgV0hgVZNJIM7gicXjh1BMYEoiVqBLgGBH?=
	=?us-ascii?q?gEB?=
X-IronPort-AV: E=Sophos;i="5.56,349,1539640800"; d="scan'208";a="27065389"
Received: from rwthex-s1-a.rwth-ad.de ([134.130.26.152])
	by mail-in-3.itc.rwth-aachen.de with ESMTP; 13 Dec 2018 16:00:56 +0100
Received: from rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) by
	rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1531.3; Thu, 13 Dec 2018 16:00:56 +0100
Received: from rwthex-w1-a.rwth-ad.de ([fe80::fd01:de75:d684:fb97]) by
	rwthex-w1-a.rwth-ad.de ([fe80::fd01:de75:d684:fb97%21]) with mapi id
	15.01.1531.007; Thu, 13 Dec 2018 16:00:57 +0100
From: =?utf-8?B?SsO8bmdlciwgTHVrYXM=?= <lukas.juenger@rwth-aachen.de>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Thread-Topic: [Qemu-arm] Warning when DTB memory nodes are noped
Thread-Index: AQHUkuokGdkltnCK5UG4Rt5c5tsoX6V8r4oAgAADK4A=
Date: Thu, 13 Dec 2018 15:00:57 +0000
Message-ID: <1544713257.4811.32.camel@rwth-aachen.de>
References: <1544708743.4811.30.camel@rwth-aachen.de>
	<CAFEAcA-p-LC2swC8-AQt60QBhQN=PNJvBjbGXrtdvvvDd-74QA@mail.gmail.com>
In-Reply-To: <CAFEAcA-p-LC2swC8-AQt60QBhQN=PNJvBjbGXrtdvvvDd-74QA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.226.91.156]
Content-Type: text/plain; charset="utf-8"
Content-ID: <79D5A096D1038B4F8E547A3B1A325D35@rwth-ad.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.130.5.48
Subject: Re: [Qemu-arm] Warning when DTB memory nodes are noped
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CGMeat6stJ6U

T24gVGh1LCAyMDE4LTEyLTEzIGF0IDE0OjQ5ICswMDAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0K
PiBPbiBUaHUsIDEzIERlYyAyMDE4IGF0IDE0OjQyLCBKw7xuZ2VyLCBMdWthcw0KPiA8bHVrYXMu
anVlbmdlckByd3RoLWFhY2hlbi5kZT4gd3JvdGU6DQo+ID4gDQo+ID4gSGkgYWxsLA0KPiA+IA0K
PiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGFsbCBtZW1vcnkgbm9kZXMgY29udGFpbmVk
IGluIGEgRFRCDQo+ID4gcGFzc2VkDQo+ID4gdmlhIHRoZSAtZHRiIG9wdGlvbiBhcmUgbm9wZWQg
aW4gaHcvYXJtL2Jvb3QuYzo1NTYtNTY4Lg0KPiA+IEkgZGlkIG5vdCBleHBlY3QgdGhpcyB0byBo
YXBwZW4gYW5kIG9ubHkgZmlndXJlZCBpdCBvdXQgYnkNCj4gPiBkZWJ1Z2dpbmcNCj4gPiB0aGUg
a2VybmVsLg0KPiA+IERvIHlvdSB0aGluayBhIHdhcm5pbmcgc2hvdWxkIGJlIGlzc3VlZCBpZiBh
IERUQiBjb250YWlucyBtZW1vcnkNCj4gPiByZWdpb25zIHRoYXQgYXJlIG5vcGVkPw0KPiANCj4g
Tm8sIGJlY2F1c2UgZ2VuZXJhbGx5IHdlIGV4cGVjdCB0aGF0IHRvIGhhcHBlbjogdGhlIERUQiB3
aWxsDQo+IGhhdmUgYSBtZW1vcnkgbm9kZSBmb3Igd2hhdGV2ZXIgdGhlIHN0b2NrIGFtb3VudCBv
ZiBSQU0gb24gdGhlDQo+IHRhcmdldCBib2FyZCBpcywgYnV0IHdlIHdhbnQgdG8gZGVsZXRlIHRo
YXQgc28gd2UgY2FuIHJlcGxhY2UNCj4gaXQgd2l0aCBhIG1lbW9yeSBub2RlIHNheWluZyB0aGF0
IHRoZSBzeXN0ZW0gaGFzIGhvd2V2ZXIgbXVjaA0KPiBSQU0gdGhlIHVzZXIgYXNrZWQgZm9yIG9u
IHRoZSBjb21tYW5kIGxpbmUuDQo+IA0KPiBXYXMgdGhlIGRlbGV0aW9uIG9mIHRoZSBtZW1vcnkg
bm9kZSBhY3R1YWxseSB3cm9uZyBpbiB5b3VyIGNhc2U/DQo+IElmIHNvIHdlIHNob3VsZCBsb29r
IGF0IGZpeGluZyB0aGUgd3JvbmcgYmVoYXZpb3VyLCByYXRoZXIgdGhhbg0KPiBqdXN0IGJlaW5n
IG5vaXNpZXIgYWJvdXQgd2hhdCB3ZSdyZSBkb2luZy4uLg0KPiANCj4gdGhhbmtzDQo+IC0tIFBN
TQ0KDQpJIHNlZS4gSW4gbXkgY2FzZSBJIHdhbnRlZCB0byBzcGVjaWZ5IHRoZSBtZW1vcnkgdXNp
bmcgdGhlIERUQiB0aGF0IEkNCnBhc3NlZCB1c2luZyB0aGUgLWR0YiBvcHRpb24uIEkgaGFkIHR3
byBtZW1vcnkgcmFuZ2VzIGluIHRoZSBkdGIgYW5kDQp0aGV5IGRpZG4ndCBzaG93IHVwIGluIHRo
ZSBrZXJuZWwgbGF0ZXIgb24gYmVjYXVzZSB0aGV5IHdlcmUgbm9wZWQgYnkNClFFTVUuIEkgZm91
bmQgaXQgY29uZnVzaW5nIHRoYXQgUUVNVSBtYWtlcyBjaGFuZ2VzIHRvIHRoZSBEVEIgdGhhdCBJ
DQpwYXNzZWQgdmlhIC1kdGIuIA0KDQpUaGFua3MsDQpMdWthcw==
