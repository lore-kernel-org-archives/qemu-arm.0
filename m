Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4815292lfp;
        Mon, 17 Feb 2020 00:20:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6oHiSuEYeJKQdQWRlQBI6JMPW9wHf9pf9VIGXcE1LSkYCGpSJ9TVQ3mnfPHNTj0qVMizq
X-Received: by 2002:ac8:300d:: with SMTP id f13mr5276356qte.260.1581927645503;
        Mon, 17 Feb 2020 00:20:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si5292935qti.275.2020.02.17.00.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 00:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3be0-0004N4-VZ
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 03:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j3bdh-0003vC-60
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 03:20:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j3bdf-0007lZ-VL
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 03:20:25 -0500
Resent-Date: Mon, 17 Feb 2020 03:20:25 -0500
Resent-Message-Id: <E1j3bdf-0007lZ-VL@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21132)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j3bdd-0007j0-0n; Mon, 17 Feb 2020 03:20:21 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1581927598; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iRZN9akV2R33JGodQZq95I2Ii/9ppPrM20WczV7b53pM5jR7itVZyO/qTSNCYCuxgjvfmNvUrMg1VXHvuZv9Xalf2N0KKtCB8a9rWymgdQikmAkAQqvTP4F+G4fcfxm7nEAuKEdNakl9f3gFJUb/4RatxXN6iaMETryTGzEINHk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1581927598;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5wHio0x/5ji9qTFGoy8DudRf8gG0x7kC9MRFutoNY+8=; 
 b=L0DBOebltbx304AZYlUQEBuGs+L3CTRsOboQ6z5fj473aam/Ttly35ZiOrxCxotjZjjS9Q7lvAnsP6q4grSqRHD7abbt0fipiTUy+CuqwOjtex6iflwVIr13uie+ApEzBIjgKNBxBvynwRRzlJZKaeIkTB2zQ786ij/4GBnq/88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1581927597323220.04458027780845;
 Mon, 17 Feb 2020 00:19:57 -0800 (PST)
In-Reply-To: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
Subject: Re: [PATCH RFC 00/16] Implement Microvm for aarch64 architecture
Message-ID: <158192759585.4691.7976508642101155503@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: xuyandong2@huawei.com
Date: Mon, 17 Feb 2020 00:19:57 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, slp@redhat.com,
 xuyandong2@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b2VVvmJG+72m

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTgxOTI1ODg4LTEwMzYyMC0x
LWdpdC1zZW5kLWVtYWlsLXh1eWFuZG9uZzJAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmll
cyBmYWlsZWQgdGhlIGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZl
IERvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHku
Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdl
LWNlbnRvczcgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9z
NyBTSE9XX0VOVj0xIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIFRF
U1QgICAgaW90ZXN0LXFjb3cyOiAxOTAKc29ja2V0X2FjY2VwdCBmYWlsZWQ6IFJlc291cmNlIHRl
bXBvcmFyaWx5IHVuYXZhaWxhYmxlCioqCkVSUk9SOi90bXAvcWVtdS10ZXN0L3NyYy90ZXN0cy9x
dGVzdC9saWJxdGVzdC5jOjI3MjpxdGVzdF9pbml0X3dpdGhvdXRfcW1wX2hhbmRzaGFrZTogYXNz
ZXJ0aW9uIGZhaWxlZDogKHMtPmZkID49IDAgJiYgcy0+cW1wX2ZkID49IDApCi90bXAvcWVtdS10
ZXN0L3NyYy90ZXN0cy9xdGVzdC9saWJxdGVzdC5jOjE0MDoga2lsbF9xZW11KCkgdHJpZWQgdG8g
dGVybWluYXRlIFFFTVUgcHJvY2VzcyBidXQgZW5jb3VudGVyZWQgZXhpdCBzdGF0dXMgMSAoZXhw
ZWN0ZWQgMCkKRVJST1IgLSBCYWlsIG91dCEgRVJST1I6L3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3Rz
L3F0ZXN0L2xpYnF0ZXN0LmM6MjcyOnF0ZXN0X2luaXRfd2l0aG91dF9xbXBfaGFuZHNoYWtlOiBh
c3NlcnRpb24gZmFpbGVkOiAocy0+ZmQgPj0gMCAmJiBzLT5xbXBfZmQgPj0gMCkKbWFrZTogKioq
IFtjaGVjay1xdGVzdC1hYXJjaDY0XSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uCiAgVEVTVCAgICBpb3Rlc3QtcWNvdzI6IDE5MQogIFRFU1QgICAgaW90
ZXN0LXFjb3cyOiAxOTIKLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwg
Y21kKQpzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1u
JywgJ2RvY2tlcicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPWNh
ZjAyYjZkM2JlMzRjMGM5NDExYzJjYmRiMjg3NThkJywgJy11JywgJzEwMDEnLCAnLS1zZWN1cml0
eS1vcHQnLCAnc2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9
JywgJy1lJywgJ0VYVFJBX0NPTkZJR1VSRV9PUFRTPScsICctZScsICdWPScsICctZScsICdKPTE0
JywgJy1lJywgJ0RFQlVHPScsICctZScsICdTSE9XX0VOVj0xJywgJy1lJywgJ0NDQUNIRV9ESVI9
L3Zhci90bXAvY2NhY2hlJywgJy12JywgJy9ob21lL3BhdGNoZXcvLmNhY2hlL3FlbXUtZG9ja2Vy
LWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFyL3RtcC9wYXRjaGV3LXRlc3Rl
ci10bXAtMmZsdnE4NG0vc3JjL2RvY2tlci1zcmMuMjAyMC0wMi0xNy0wMy4wNi4zNS45MDQ3Oi92
YXIvdG1wL3FlbXU6eixybycsICdxZW11OmNlbnRvczcnLCAnL3Zhci90bXAvcWVtdS9ydW4nLCAn
dGVzdC1xdWljayddJyByZXR1cm5lZCBub24temVybyBleGl0IHN0YXR1cyAyLgpmaWx0ZXI9LS1m
aWx0ZXI9bGFiZWw9Y29tLnFlbXUuaW5zdGFuY2UudXVpZD1jYWYwMmI2ZDNiZTM0YzBjOTQxMWMy
Y2JkYjI4NzU4ZAptYWtlWzFdOiAqKiogW2RvY2tlci1ydW5dIEVycm9yIDEKbWFrZVsxXTogTGVh
dmluZyBkaXJlY3RvcnkgYC92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC0yZmx2cTg0bS9zcmMn
Cm1ha2U6ICoqKiBbZG9ja2VyLXJ1bi10ZXN0LXF1aWNrQGNlbnRvczddIEVycm9yIDIKCnJlYWwg
ICAgMTNtMjEuMDA3cwp1c2VyICAgIDBtOC43OTJzCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNTgxOTI1ODg4LTEwMzYyMC0xLWdpdC1zZW5k
LWVtYWlsLXh1eWFuZG9uZzJAaHVhd2VpLmNvbS90ZXN0aW5nLmRvY2tlci1xdWlja0BjZW50b3M3
Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRj
aGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8g
cGF0Y2hldy1kZXZlbEByZWRoYXQuY29t
