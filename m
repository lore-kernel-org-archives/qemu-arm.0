Received: by 10.223.161.27 with SMTP id o27csp944489wro;
        Wed, 1 Nov 2017 08:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TcxXsYuiBUh1ZLcjEqGvkzomBGW4G9yOE8zuRsoTmKBLrY2KJ9b96f5T6gSk2rZI2dI3tV
X-Received: by 10.129.82.129 with SMTP id g123mr86363ywb.149.1509548502725;
        Wed, 01 Nov 2017 08:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509548502; cv=none;
        d=google.com; s=arc-20160816;
        b=hv7aN/Qnb/zqlWu+nf8OJwhwnMXKzSwsh1MCjbTw+Bj1GiZf1YT6fP5RD0rOR7nNwT
         Pg4taru621ROLzUpKdr/rsFfN7HFV9myof0ZGnoF2KcS1Jjg8GQgluBx91qjt+S24eBU
         3MutP2qsbyFa+QDUfiqG+DOUp90E4jgFFH2MQDyYMhQ0gIbW4jWjNb9r5adQLIpfm9LC
         KacCQUajCQtjIp/kpGKK8K6FTssx+lbInwi28oRPp1YkTJCH0utsjjpOYPX/12j5xE0Z
         5T6pJxysSkaZ3V7J7o2w/2j+p497rO3v3yRZ+rtWHASMzYLKT0ACPg2jhWcVU6Tokh62
         JhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from:arc-authentication-results;
        bh=NYD/V5VBxuM8f9TuOUKGR2nT4s2xhx2l/XodDOdSX/o=;
        b=ipyFx5ZwQvS8g+bLLbvfN6F17GrpMasIThFNNkhyfip9y4zxYrxCstEikEC3x9Idcy
         du04tfVJYwWh7Ca2yKtmT4l5HMXwp8uDGs0fdyi3FcYQfJmkTQd1k0veLFcbsHUFbSP2
         R2LRjI9XSWkKWqTxDXaewi/IMNKsY5jyPaF9M8QME5LwL9tQS12hMDw9JkHuCrzs2TTf
         DsMSbchhB2s6C7V0uOLE0hTIzdCZneeyL+QG0CIxD7oWfv4twhmn3JAX8mj3rxlPfdAt
         2TySNUy5KhoDiAs5nMPDNjMR1zrlpFj5kdoAPIqhwOLg5P8hmAYh0PTgQLnAUPdy4LYD
         woEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si207296ywb.419.2017.11.01.08.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Nov 2017 08:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9uWU-0004BR-6o
	for alex.bennee@linaro.org; Wed, 01 Nov 2017 11:01:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9uWL-0004BI-0N
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 11:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9uWG-0004oK-6g
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 11:01:33 -0400
Received: from relay2.gtri.gatech.edu ([130.207.199.168]:58097)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
	id 1e9uWG-0004mX-1W
	for qemu-arm@nongnu.org; Wed, 01 Nov 2017 11:01:28 -0400
X-ASG-Debug-ID: 1509548485-0768e41b305a3490001-yEWgzd
Received: from kiawah.core.gtri.org (kiawah.core.gtri.org [10.41.31.71]) by
	relay2.gtri.gatech.edu with ESMTP id ZsKATsrlsC1j3DPx
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128
	verify=NO); Wed, 01 Nov 2017 11:01:25 -0400 (EDT)
X-Barracuda-Envelope-From: Michael.Nawrocki@gtri.gatech.edu
Received: from parris.core.gtri.org (10.41.31.72) by kiawah.core.gtri.org
	(10.41.31.71) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Wed, 1 Nov 2017 11:01:25 -0400
Received: from tybee.core.gtri.org (10.41.1.49) by parris.core.gtri.org
	(10.41.31.72) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Wed, 1 Nov 2017 11:01:25 -0400
Received: from tybee.core.gtri.org ([fe80::bc87:62f3:89b0:fc9e]) by
	tybee.core.gtri.org ([fe80::bc87:62f3:89b0:fc9e%15]) with mapi id
	15.01.1034.026; Wed, 1 Nov 2017 11:01:25 -0400
From: "Nawrocki, Michael" <Michael.Nawrocki@gtri.gatech.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH 0/2] Add 8-byte wide AMD flash support,
	partial interleaving
X-ASG-Orig-Subj: Re: [Qemu-devel] [PATCH 0/2] Add 8-byte wide AMD flash
	support, partial interleaving
Thread-Index: AQHTUl9JsPam6pfpv0+GJNhOZKTvYqL+ceWAgAEt7gA=
Date: Wed, 1 Nov 2017 15:01:25 +0000
Message-ID: <015284D3-971A-469F-A801-9573DA3F1F36@gtri.gatech.edu>
References: <20171031154407.4184-1-michael.nawrocki@gtri.gatech.edu>
	<CAFEAcA8Cv1+E9v3dSqPkUDd7s9zp=V+UJ1V7oXJBWzwnQdzFSg@mail.gmail.com>
In-Reply-To: <CAFEAcA8Cv1+E9v3dSqPkUDd7s9zp=V+UJ1V7oXJBWzwnQdzFSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.207.205.130]
Content-Type: text/plain; charset="utf-8"
Content-ID: <500BC32DCBE361459B7E932B6DE097D3@gtri.org>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Barracuda-Connect: kiawah.core.gtri.org[10.41.31.71]
X-Barracuda-Start-Time: 1509548485
X-Barracuda-Encrypted: ECDHE-RSA-AES128-SHA256
X-Barracuda-URL: https://130.207.199.168:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at gtri.gatech.edu
X-Barracuda-Scan-Msg-Size: 1514
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.44389
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 130.207.199.168
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Add 8-byte wide AMD flash
 support, partial interleaving
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Max
	Reitz <mreitz@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JgsxBlukJU4u

DQpPbiAxMC8zMS8xNywgMTM6MDAsICJQZXRlciBNYXlkZWxsIiA8cGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnPiB3cm90ZToNCg0KICAgIE9uIDMxIE9jdG9iZXIgMjAxNyBhdCAxNTo0NCwgTWlrZSBO
YXdyb2NraQ0KICAgIDxtaWNoYWVsLm5hd3JvY2tpQGd0cmkuZ2F0ZWNoLmVkdT4gd3JvdGU6DQog
ICAgPiBUaGlzIHBhdGNoIHNldCBkb2VzIGEgZmV3IHRoaW5ncy4gRmlyc3QsIGl0IHN3aXRjaGVz
IHRoZSBBTUQgQ0ZJIGZsYXNoIE1NSU8NCiAgICA+IG9wZXJhdGlvbnMgZnJvbSB0aGUgb2xkIE1N
SU8gQVBJIHRvIHRoZSBuZXcgb25lLiBTZWNvbmQsIGl0IGVuYWJsZXMgOC1ieXRlDQogICAgPiB3
aWRlIGZsYXNoIGFycmF5cy4gRmluYWxseSwgaXQgc3VwcG9ydHMgcnVkaW1lbnRhcnkgaW50ZXJs
ZWF2aW5nIG9mIG5vdGlvbmFsDQogICAgPiBmbGFzaCAiY2hpcHMiLiBJdCBpcyBleHBlY3RlZCB0
aGF0IGNvbW1hbmRzIHdpbGwgYmUgc2VudCB0byBhbGwgImNoaXBzIg0KICAgID4gc2ltdWx0YW5l
b3VzbHkuIFNlZSB0aGUgZXhhbXBsZSBpbiB0aGUgc2Vjb25kIHBhdGNoIGZvciBtb3JlIGRldGFp
bHMuIFRoaXMNCiAgICA+IGJlaGF2aW9yIGlzIHVzZWQgYnkgZHJpdmVycyBmb3IgdGhlIFBQTUM3
NDAwIFBvd2VyUEMgZXZhbHVhdGlvbiBib2FyZC4NCiAgICANCiAgICBJJ20gY29uZnVzZWQgYnkg
dGhlIGludGVybGVhdmluZyBwYXJ0LiBDYW4geW91IGV4cGxhaW4gaG93IHRoaXMNCiAgICBkaWZm
ZXJzIGZyb20gdGhlIGludGVybGVhdmluZyB3ZSBhbHJlYWR5IHN1cHBvcnQgaW4gcGZsYXNoX2Nm
aTAxLmMNCiAgICB2aWEgc2V0dGluZyB3aWR0aCwgZGV2aWNlLXdpZHRoIGFuZCBtYXgtZGV2aWNl
LXdpZHRoID8gKHNlZSB0aGUgY29tbWVudA0KICAgIGluIHRoZSBwZmxhc2hfY2ZpMDFfcHJvcGVy
dGllc1tdIGFycmF5IGFib3V0IGhvdyB0aG9zZSBzZXR0aW5ncw0KICAgIGludGVyYWN0KS4gSWYg
aXQgaXMgdGhlIHNhbWUgdGhpbmcsIHdlIHNob3VsZCByZWFsbHkgaW1wbGVtZW50IGl0DQogICAg
aW4gdGhlIHNhbWUgd2F5IGZvciBib3RoIGtpbmRzIG9mIGZsYXNoIGRldmljZS4NCiAgICANCiAg
ICB0aGFua3MNCiAgICAtLSBQTU0NCiAgICANCg0KTG9va2luZyB0aHJvdWdoIHBmbGFzaF9jZmkw
MS5jLCBpdCBsb29rcyBlc3NlbnRpYWxseSB0aGUgc2FtZSwgdGhvdWdoIG15IGNvZGUgZG9lc27i
gJl0IHJlcHJlc2VudCBtYXhfZGV2aWNlX3dpZHRoLiBUaGUgaW50ZXJsZWF2aW5nIGluIHBmbGFz
aF9jZmkwMS5jIGlzIG1vcmUgcm9idXN0IHRoYW4gd2hhdCBJIGltcGxlbWVudGVkLiBTaG91bGQg
SSByZXZlcnQgdGhlIGNoYW5nZXMgdG8gdGhlIHBmbGFzaF9jZmkwMl9yZWdpc3RlciBwcm90b3R5
cGUgYW5kIG1pcnJvciB0aGUgcWRldiBwcm9wZXJ0eSBpbXBsZW1lbnRhdGlvbiBwZmxhc2hfY2Zp
MDEgdXNlcz8gVGhpcyB3b3VsZCBkcmFzdGljYWxseSByZWR1Y2UgdGhlIG51bWJlciBvZiBmaWxl
cyBhZmZlY3RlZC4NCg0KVGhhbmtzLA0KTWlrZQ0KDQo=
