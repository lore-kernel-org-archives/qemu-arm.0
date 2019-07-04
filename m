Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1733494wru;
        Thu, 4 Jul 2019 01:06:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXCGKbKI7joPoiviRjzQUBEor3DzB7IcRqk82INs+2cMb4yZbNLn6OahADjj0UGNOX8vJX
X-Received: by 2002:a17:906:1e04:: with SMTP id g4mr38554586ejj.48.1562227589155;
        Thu, 04 Jul 2019 01:06:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f49si4244799edd.361.2019.07.04.01.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 01:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiwlA-0002e1-92
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 04:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hiwl1-0002c4-Kn
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 04:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hiwkz-0007mX-FX
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 04:06:19 -0400
Resent-Date: Thu, 04 Jul 2019 04:06:19 -0400
Resent-Message-Id: <E1hiwkz-0007mX-FX@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21407)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hiwks-0007ia-Ij; Thu, 04 Jul 2019 04:06:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1562227510; cv=none; d=zoho.com; s=zohoarc; 
 b=LyPR9PX4g91GVxYrRs82oBXv3JQ2Ib8dFR6GoxjbpM/xoieClM24Jw1WV5/eql6ufqpzS3FdLVqUrEc6ExR8t38yoVE58nQzg6uGCbciJuNdfoucsTIqh67bMakPwdpvjqSFXpqt4o6/mPFPT3sbnJ69KGMLo7IVrpW9vUa6S3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1562227510;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=0hrJdJsUEiclc3/L/9oz3wKB+Lwun6WJQ1SLIuoeCZw=; 
 b=ADaTu+EMCVLZ8qMAj8+kVusLKYLd4Sshbpt/sFI/algjujBoXYq0oI/X4qElRvN0A2SJpRkz6mB0PGoK6+/NULPQbDP28FcTs5Ha8g9ViyBLFHsdp6LIkzqkDtcnz9slHpsQhJOaqsE931hDxaECRzWKEpZI24gNekrMrS06G54=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1562227507859290.5570158904585;
 Thu, 4 Jul 2019 01:05:07 -0700 (PDT)
Message-ID: <156222750645.21218.4512744542143739311@c4a48874b076>
In-Reply-To: <20190703085416.21837-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Thu, 4 Jul 2019 01:05:07 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 0/4] Vga 20190703 patches
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, kraxel@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2f/ENG3HLl/

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcwMzA4NTQxNi4yMTgz
Ny0xLWtyYXhlbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxOTA3MDMwODU0MTYuMjE4Mzct
MS1rcmF4ZWxAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BVTEwgMC80XSBWZ2Eg
MjAxOTA3MDMgcGF0Y2hlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApn
aXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVl
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVw
ZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICAgYzIwNGUzNC4uZjA1NzdjNiAg
bWFzdGVyICAgICAtPiBtYXN0ZXIKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDE5MDcw
MzA4NTQxNi4yMTgzNy0xLWtyYXhlbEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAxOTA3MDMwODU0
MTYuMjE4MzctMS1rcmF4ZWxAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCgo9PT0gT1VUUFVUIEJFR0lOID09PQpjaGVja3BhdGNoLnBsOiBubyByZXZpc2lvbnMgcmV0
dXJuZWQgZm9yIHJldmxpc3QgJzEnCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4
aXRlZCB3aXRoIGNvZGU6IDI1NQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDov
L3BhdGNoZXcub3JnL2xvZ3MvMjAxOTA3MDMwODU0MTYuMjE4MzctMS1rcmF4ZWxAcmVkaGF0LmNv
bS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBh
dXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNl
bmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

