Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp357960wri;
        Fri, 1 Nov 2019 05:10:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwp5Lg7rLvETBDd1qaLzkQuEhvFf5k4PEC7GxTgvvhiIYqTQklXTTc/SYax++LvqqJLIyvV
X-Received: by 2002:a37:491:: with SMTP id 139mr5225355qke.200.1572610203640;
        Fri, 01 Nov 2019 05:10:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 32si6976921qvh.195.2019.11.01.05.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2019 05:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQVkh-0000hy-2q
	for alex.bennee@linaro.org; Fri, 01 Nov 2019 08:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iQVkY-0000fV-S7
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 08:09:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iQVkX-0001PP-Ke
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 08:09:54 -0400
Resent-Date: Fri, 01 Nov 2019 08:09:54 -0400
Resent-Message-Id: <E1iQVkX-0001PP-Ke@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iQVkU-0001BY-Du; Fri, 01 Nov 2019 08:09:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1572610174; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JzWZFa+nUqUgQu4cf0eTaLS5Y1S07Zho51XFN4mMXiVnDAGn0y+4Q6XY5MQ4HXIX+mzOT/JACRPX8tJ4tJ9DaXG5Og9Erz00D4vlhjL/T7B67BklkQyoImK6W3l74OrbU+Jm7z9ZdVkbay0LG+GmJoVDyjSCX+SiNS7gmyRT/7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1572610174;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=wZEBfBNidULKgTy6y+qdU52qMQe6oxH8RXw9lId7sOc=; 
 b=M61PqujUzUKqhsX4gHNwyx2qzYmPBaRZLBxwRu9JhpMOsf/NXGEPHegmnH7qZPKfIWUSpJ6D0SKrc/SmKADp46AzjKEH8Ih2uOEUJf81ocPtaZFIVHfWpu7HTD5zaBjqalXKLMzGjBoNEGHpsJo1QGLmgro7hKrGbMu20I4yPD0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1572610172756325.79732018890877;
 Fri, 1 Nov 2019 05:09:32 -0700 (PDT)
In-Reply-To: <20191101103232.3692818-1-luc.michel@greensocs.com>
Subject: Re: [PATCH] hw/arm/pxa2xx: rebuild hflags cache when modifying CPU
 state
Message-ID: <157261017167.11413.14176314326675211052@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: luc.michel@greensocs.com
Date: Fri, 1 Nov 2019 05:09:32 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, balrogg@gmail.com,
 qemu-devel@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5lYt/Z4rP5WG

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTEwMTEwMzIzMi4zNjky
ODE4LTEtbHVjLm1pY2hlbEBncmVlbnNvY3MuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxl
ZCB0aGUgZG9ja2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVz
dGluZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIg
aW5zdGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojISAvYmluL2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2Ug
ZG9ja2VyLWltYWdlLWZlZG9yYSBWPTEgTkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1t
aW5nd0BmZWRvcmEgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0Mg
ICAgICBhYXJjaDY0LXNvZnRtbXUvdHJhY2UvZ2VuZXJhdGVkLWhlbHBlcnMubwogIENDICAgICAg
YWFyY2g2NC1zb2Z0bW11L3RhcmdldC9hcm0vdHJhbnNsYXRlLXN2ZS5vCi90bXAvcWVtdS10ZXN0
L3NyYy9ody9hcm0vcHhhMnh4LmM6IEluIGZ1bmN0aW9uICdweGEyeHhfcHdybW9kZV93cml0ZSc6
Ci90bXAvcWVtdS10ZXN0L3NyYy9ody9hcm0vcHhhMnh4LmM6MzA5OjM0OiBlcnJvcjogaW5jb21w
YXRpYmxlIHR5cGUgZm9yIGFyZ3VtZW50IDEgb2YgJ2FybV9yZWJ1aWxkX2hmbGFncycKICAgICAg
ICAgYXJtX3JlYnVpbGRfaGZsYWdzKHMtPmNwdS0+ZW52KTsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH5+fn5+fl5+fn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvdG1wL3FlbXUtdGVzdC9z
cmMvaHcvYXJtL3B4YTJ4eC5jOjE1OgovdG1wL3FlbXUtdGVzdC9zcmMvdGFyZ2V0L2FybS9jcHUu
aDozMzA0OjM4OiBub3RlOiBleHBlY3RlZCAnQ1BVQVJNU3RhdGUgKicge2FrYSAnc3RydWN0IENQ
VUFSTVN0YXRlIConfSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSAnQ1BVQVJNU3RhdGUnIHtha2Eg
J3N0cnVjdCBDUFVBUk1TdGF0ZSd9CiB2b2lkIGFybV9yZWJ1aWxkX2hmbGFncyhDUFVBUk1TdGF0
ZSAqZW52KTsKICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5efn4KbWFrZVsx
XTogKioqIFsvdG1wL3FlbXUtdGVzdC9zcmMvcnVsZXMubWFrOjY5OiBody9hcm0vcHhhMnh4Lm9d
IEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFr
ZTogKioqIFtNYWtlZmlsZTo0ODg6IGFhcmNoNjQtc29mdG1tdS9hbGxdIEVycm9yIDIKbWFrZTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KICBHRU4gICAgIHg4Nl82NC1zb2Z0
bW11L3FlbXUtc3lzdGVtLXg4Nl82NC5leGUKVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOgotLS0KICAgIHJhaXNlIENhbGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnBy
b2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOiBDb21tYW5kICdbJ3N1ZG8nLCAnLW4nLCAnZG9ja2Vy
JywgJ3J1bicsICctLWxhYmVsJywgJ2NvbS5xZW11Lmluc3RhbmNlLnV1aWQ9M2Q3OTRmZDlkZjcy
NDYyMzhkOTNkNzA1OGE1YzE1YmYnLCAnLXUnLCAnMTAwMScsICctLXNlY3VyaXR5LW9wdCcsICdz
ZWNjb21wPXVuY29uZmluZWQnLCAnLS1ybScsICctZScsICdUQVJHRVRfTElTVD0nLCAnLWUnLCAn
RVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1lJywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAn
REVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2Nj
YWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Ly5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6L3Zh
ci90bXAvY2NhY2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTd1bmJ5
b2N6L3NyYy9kb2NrZXItc3JjLjIwMTktMTEtMDEtMDguMDYuMzkuMTg5Mjc6L3Zhci90bXAvcWVt
dTp6LHJvJywgJ3FlbXU6ZmVkb3JhJywgJy92YXIvdG1wL3FlbXUvcnVuJywgJ3Rlc3QtbWluZ3cn
XScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVs
PWNvbS5xZW11Lmluc3RhbmNlLnV1aWQ9M2Q3OTRmZDlkZjcyNDYyMzhkOTNkNzA1OGE1YzE1YmYK
bWFrZVsxXTogKioqIFtkb2NrZXItcnVuXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0
b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtN3VuYnlvY3ovc3JjJwptYWtlOiAqKiog
W2RvY2tlci1ydW4tdGVzdC1taW5nd0BmZWRvcmFdIEVycm9yIDIKCnJlYWwgICAgMm01Mi44NDdz
CnVzZXIgICAgMG02LjU2M3MKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzLzIwMTkxMTAxMTAzMjMyLjM2OTI4MTgtMS1sdWMubWljaGVsQGdyZWVu
c29jcy5jb20vdGVzdGluZy5kb2NrZXItbWluZ3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

