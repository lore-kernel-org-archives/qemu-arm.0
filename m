Received: by 10.223.161.27 with SMTP id o27csp139671wro;
        Mon, 23 Oct 2017 11:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SV1q6eg+nAV/j8t/RYj2LRGdOM2XDulrkTS0UObqA+GbwMq3fRQuYyzAlVn4SBKEmmlFOq
X-Received: by 10.37.69.65 with SMTP id s62mr8936739yba.322.1508782686324;
        Mon, 23 Oct 2017 11:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508782686; cv=none;
        d=google.com; s=arc-20160816;
        b=GMiRgSFqdeQ1/9Io4Q+Wu7EKYBLc4hAFTma2s2vImkeI7Mdx/3ZoUdeYV1RyqjIipV
         1339niFH8XPC28/MiZXYUHIwW2ltokHRLrfR2qDV4dD3oIHUwjktVLstgxA3+Adn4AAr
         pKzfzFDwJpIw32SJOnF+VGmfgnzmeyQWbZHb5HwyYPGeZEQ/9yg1Z5fKFTtbQLmDNV2O
         3XHlG5lmecZPv+AfUxP+rzZ3JS1h6Q0oYs1uMN5VtX4aHeTIyldDDxZbtermO8OQ0roA
         hlOEkP51fF//AlWumf71vLcd6k2I0WsI6LXWzXdkmvePp4+7e9IQUmkK5XDRZdXMyhZT
         u6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:arc-authentication-results;
        bh=nA8p4gBpVHL0HdO3rkcCmpgZlIUFzUqc705wimLhSO4=;
        b=LkzdXwTudvcPiUBDEXO7sOXy8ZnQOARQWAW7OI6fUntjNioDOsFi3oMIPAc6l3TWjy
         eQDQOUA8nVgyDftgY0iA8X/JEINqh/HYocHP2Xp2CWEnqqKJSrP1S35XNhuGOFyuAtzK
         gwU2wXEnT3w7XUK1CwudUwt74uoQFwDOV/5ZlEYqQNOaoJ9Eu6MYxWl9b36wU63YBOHz
         EJKch967ZPWFAOO5dhEa1WR1nl/fnVivIrp+F+EUJrZH6WUpYyZgTQma23Y6ZwNY8BAU
         MPtGo+20GEkaejTho3x90Mi/2jOj3JvilWS6OyR/u8ILXM7OHgDze+ifZBlw/wR3GgaO
         3oQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p16si620862ywg.123.2017.10.23.11.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 11:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6hIb-00007C-Pc
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 14:18:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1e6hIW-000070-5k
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 14:18:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1e6hIS-00023W-T6
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 14:18:00 -0400
Received: from mail-c.ads.isi.edu ([128.9.180.198]:52689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1e6hIS-00022k-Jc
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 14:17:56 -0400
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; 
   d="scan'208";a="2152168"
Received: from usmdrmbx01.ads.isi.edu ([10.100.2.77])
	by usmdrip03-mgmt.ads.isi.edu with ESMTP; 23 Oct 2017 11:17:55 -0700
Received: from usarlmbx01.ads.isi.edu (10.13.52.77) by usmdrmbx01.ads.isi.edu
	(10.100.2.77) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 23 Oct 2017 11:17:56 -0700
Received: from usarlmbx01.ads.isi.edu (10.13.52.77) by usarlmbx01.ads.isi.edu
	(10.13.52.77) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 23 Oct 2017 11:17:52 -0700
Received: from usarlmbx01.ads.isi.edu ([fe80::5517:873:48d1:b0d1]) by
	usarlmbx01.ads.isi.edu ([fe80::5517:873:48d1:b0d1%17]) with mapi id
	15.01.1261.035; Mon, 23 Oct 2017 11:17:52 -0700
From: Dong-In Kang <dkang@isi.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-arm] Is Cortex-R8 support planned?
Thread-Index: AQHTTAzrfmleDsMNxkyr+k/F5i5fn6LyDoIA///iKIA=
Date: Mon, 23 Oct 2017 18:17:52 +0000
Message-ID: <983F5243-4E4A-49BD-BD19-BF5A1124442C@isi.edu>
References: <42FB6EFE-F20A-42CF-8782-D8611FA79000@isi.edu>
	<CAFEAcA-sFmpxbEP6iKMjsUJzD84n8WAzjABTKCe0KWvYpfmcZA@mail.gmail.com>
In-Reply-To: <CAFEAcA-sFmpxbEP6iKMjsUJzD84n8WAzjABTKCe0KWvYpfmcZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.9.47.101]
Content-Type: text/plain; charset="utf-8"
Content-ID: <531D614FFE6CA7449E2D8992C7EFB9C5@ads.isi.edu>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 128.9.180.198
Subject: Re: [Qemu-arm] Is Cortex-R8 support planned?
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hnaX5VCRgkK6

DQogRG9lcyBDb3J0ZXgtUjcgc3VwcG9ydCBleGlzdCBmb3IgUWVtdT8NCkkgZGlkbuKAmXQgc2Vl
IHRoYXQuIA0KDQogRGF2aWQNCg0KT24gMTAvMjMvMTcsIDEyOjA0IFBNLCAiUGV0ZXIgTWF5ZGVs
bCIgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQoNCk9uIDIzIE9jdG9iZXIgMjAx
NyBhdCAxNTo0MCwgRG9uZy1JbiBLYW5nIDxka2FuZ0Bpc2kuZWR1PiB3cm90ZToNCj4gSSBrbm93
IHRoZXJlIGlzIG5vIHN1cHBvcnQgZm9yIENvcnRleC1SOCBndWVzdCBhcmNoaXRlY3R1cmUgbm93
Lg0KPg0KPiBJcyBpdCBwbGFubmVkPw0KDQpJIGRvbid0IGtub3cgb2YgYW55Ym9keSB3aG8ncyBw
bGFubmluZyB0byBkbyB0aGF0LCBuby4NCg0KPiBIb3cgbXVjaCBtYW4taG91ciB3b3VsZCBiZSBu
ZWVkZWQgdG8gaW1wbGVtZW50IENvcnRleC1SOCBzdXBwb3J0IGZvciBRZW11Pw0KDQpJIGRvbid0
IGtub3cgLS0geW91J2QgbmVlZCB0byBsb29rIGF0IHdoYXQgdGhlIG5ldyBmZWF0dXJlcw0KYXJl
IGluIENvcnRleC1SNyB0aGF0IGFyZW4ndCBpbiB0aGUgZXhpc3RpbmcgQ29ydGV4LVI4DQplbXVs
YXRpb24sIGFuZCB0aGVuIGVzdGltYXRlIGhvdyBtdWNoIHRpbWUgdGhvc2UgZmVhdHVyZXMNCndv
dWxkIGVhY2ggdGFrZSB0byBpbXBsZW1lbnQuDQoNCnRoYW5rcw0KLS0gUE1NDQoNCg0K
