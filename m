Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp592328wro;
        Thu, 14 Mar 2019 02:02:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGQvJ3ymIxvpksvXq1TEqQzblzWbwDrQxvrtJ7LOBEPJtu0sB0sdM9Eeyjcc++7Z1RPX6T
X-Received: by 2002:a81:8807:: with SMTP id y7mr26396227ywf.265.1552554176721;
        Thu, 14 Mar 2019 02:02:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si7459422ybm.482.2019.03.14.02.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4MGO-0005l6-56
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:02:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h4MGA-0005ia-PU
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:02:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h4MDw-0006o0-NL
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 05:00:25 -0400
Resent-Date: Thu, 14 Mar 2019 05:00:25 -0400
Resent-Message-Id: <E1h4MDw-0006o0-NL@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h4MDw-0006jS-DX; Thu, 14 Mar 2019 05:00:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1552554000; cv=none; d=zoho.com; s=zohoarc; 
	b=IEYZTDpiQE4cRMdW9hT7fuwFyLVq2v0upTLrxhaTSoQFgjkBJN1zwrJjUDH3nFXcNtQTd2+hNQfm3vL4EhUAB02FH6fskYfF5EZnOJJ+dJfdpbrnbUDeE2HKt9BoB+QU1lDiZqdzTWL7jV5odp/q9yeummdnH0rO1rFTyUo73q4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1552554000;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=PDTli+9m6V3dcL3VCTvLZC/zfyYMS88moVsNhO9kujg=; 
	b=I1FVmnK8avhqbQSmQzFulf/vj4kmkgURAZcg0U/ZkRvzexhBTG/poamZV3qATkyxHLthG9XlK377bcFTIZXHCRX53nSP64SEFk+rNPEhvGG2AFm8RjyF0Jquac/m7cLNredcOJ/xIN6L9KGKFMS+N12ZXUWogD+X2mYpWKRuPDA=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1552553999082843.1413899273413;
	Thu, 14 Mar 2019 01:59:59 -0700 (PDT)
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
Message-ID: <155255399748.14224.8340819987953765086@00e3a2c681c7>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: clg@kaod.org
Date: Thu, 14 Mar 2019 01:59:59 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/5] aspeed/timer: Fix slowdowns
 in recent Linux
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
Reply-To: qemu-devel@nongnu.org
Cc: fam@euphon.net, peter.maydell@linaro.org, andrew@aj.id.au,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OXaBGFz/Katu

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDMxNDA4NDIzNS45ODg3
LTEtY2xnQGthb2Qub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9ja2VyLW1p
bmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21tYW5kcyBh
bmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVkLCB5b3Ug
Y2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaAp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3JhIFNIT1df
RU5WPTEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAgICBt
aWdyYXRpb24veGJ6cmxlLm8KICBDQyAgICAgIG1pZ3JhdGlvbi9wb3N0Y29weS1yYW0ubwovdG1w
L3FlbXUtdGVzdC9zcmMvaHcvdGltZXIvYXNwZWVkX3RpbWVyLmM6IEluIGZ1bmN0aW9uICdhc3Bl
ZWRfdGltZXJfc2V0X3ZhbHVlJzoKL3RtcC9xZW11LXRlc3Qvc3JjL2h3L3RpbWVyL2FzcGVlZF90
aW1lci5jOjI3OToxOTogZXJyb3I6ICdfX2ludDEyOF90JyB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnX19pbnQxMjgnPwogICAgICAgICAgICAg
ICAgICgoX19pbnQxMjhfdClkZWx0YSAqIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQgLyByYXRlKTsK
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KICAgICAgICAgICAgICAgICAgIF9faW50MTI4
Ci90bXAvcWVtdS10ZXN0L3NyYy9ody90aW1lci9hc3BlZWRfdGltZXIuYzoyNzk6MTk6IG5vdGU6
IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFj
aCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCi90bXAvcWVtdS10ZXN0L3NyYy9ody90aW1lci9hc3Bl
ZWRfdGltZXIuYzoyNzk6MzA6IGVycm9yOiBleHBlY3RlZCAnKScgYmVmb3JlICdkZWx0YScKICAg
ICAgICAgICAgICAgICAoKF9faW50MTI4X3QpZGVsdGEgKiBOQU5PU0VDT05EU19QRVJfU0VDT05E
IC8gcmF0ZSk7CiAgICAgICAgICAgICAgICAgfiAgICAgICAgICAgIF5+fn5+CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICkKL3RtcC9xZW11LXRlc3Qvc3JjL2h3L3RpbWVyL2FzcGVlZF90
aW1lci5jOjI3NjoyMjogZXJyb3I6IHVudXNlZCB2YXJpYWJsZSAncmF0ZScgWy1XZXJyb3I9dW51
c2VkLXZhcmlhYmxlXQogICAgICAgICAgICAgdWludDMyX3QgcmF0ZSA9IGNhbGN1bGF0ZV9yYXRl
KHQpOwogICAgICAgICAgICAgICAgICAgICAgXn5+fgovdG1wL3FlbXUtdGVzdC9zcmMvaHcvdGlt
ZXIvYXNwZWVkX3RpbWVyLmM6Mjc1OjIxOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlICdkZWx0YScg
Wy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQogICAgICAgICAgICAgaW50NjRfdCBkZWx0YSA9IChp
bnQ2NF90KSB2YWx1ZSAtIChpbnQ2NF90KSBjYWxjdWxhdGVfdGlja3ModCwgbm93KTsKICAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBl
cnJvcnMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMTkwMzE0MDg0MjM1Ljk4ODctMS1jbGdAa2FvZC5vcmcvdGVzdGluZy5kb2NrZXItbWlu
Z3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

