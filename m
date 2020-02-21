Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1420761lfg;
        Thu, 20 Feb 2020 22:28:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLo+4nlMnpmjHBHkC6xRxiaSzOw+TMaJPJaMvRsdOJFsxO4Jgj69Csqg4/uNZxyeGTtBaO
X-Received: by 2002:a37:7e82:: with SMTP id z124mr32584031qkc.166.1582266524661;
        Thu, 20 Feb 2020 22:28:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si963183qkj.177.2020.02.20.22.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 22:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j51no-0005Ls-38
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 01:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j51nf-0005KX-UT
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 01:28:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j51ne-0002nH-Mf
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 01:28:35 -0500
Resent-Date: Fri, 21 Feb 2020 01:28:35 -0500
Resent-Message-Id: <E1j51ne-0002nH-Mf@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21161)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j51nb-0002Mu-HZ; Fri, 21 Feb 2020 01:28:31 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1582266497; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PYFC0QIm41SiA6zo5pDRVWgXkw8XBNynEhi4Ng5OvB1p71pl55BDplVfZ8zn+aHxNMhsP7JmrewkXsbro3sv6Mv27U4qekbziirUOuGsnxLodsyWIimAq/wIF/ylpVTjr8EJmFx4sjvtpvHnt5wZXTVpgq955Iv0cGbxA6AbMDI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1582266497;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=3XwlUqY3rp92+axNgwONBIqN8HL2NuZX/lWJ8Azx/OM=; 
 b=SQuhrcr2J77Q4XG33EiWXFztCBxFsx6v/IvoW5yejoCE5NNRdX8W1+34kfwiCKOSmkdZANgkSNNN7bIhfaap/RosNhFMUmeFskfpvY30rCkYC4Ibw3SDBIN8HfvKNJGgMgzBuMn8T+kKeCVr3/vY/VSmGKxJtKiOyy8UD6grwBg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1582266495550396.59628161498404;
 Thu, 20 Feb 2020 22:28:15 -0800 (PST)
In-Reply-To: <20200221044908.266883-1-gshan@redhat.com>
Subject: Re: [PATCH] hw/char/pl011: Enable TxFIFO and async transmission
Message-ID: <158226649422.712.7285415168506294704@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: gshan@redhat.com
Date: Thu, 20 Feb 2020 22:28:15 -0800 (PST)
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
Cc: peter.maydell@linaro.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScRtXez+V/nF

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDIyMTA0NDkwOC4yNjY4
ODMtMS1nc2hhbkByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29t
bWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxl
ZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEgSj0x
NCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgVEVTVCAgICBpb3Rlc3QtcWNv
dzI6IDI4MwpQYXNzZWQgYWxsIDExNiBpb3Rlc3RzCioqCkVSUk9SOi90bXAvcWVtdS10ZXN0L3Ny
Yy90ZXN0cy9xdGVzdC9hY3BpLXV0aWxzLmM6MTQ1OmFjcGlfZmluZF9yc2RwX2FkZHJlc3NfdWVm
aTogY29kZSBzaG91bGQgbm90IGJlIHJlYWNoZWQKRVJST1IgLSBCYWlsIG91dCEgRVJST1I6L3Rt
cC9xZW11LXRlc3Qvc3JjL3Rlc3RzL3F0ZXN0L2FjcGktdXRpbHMuYzoxNDU6YWNwaV9maW5kX3Jz
ZHBfYWRkcmVzc191ZWZpOiBjb2RlIHNob3VsZCBub3QgYmUgcmVhY2hlZAptYWtlOiAqKiogW2No
ZWNrLXF0ZXN0LWFhcmNoNjRdIEVycm9yIDEKVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOgogIEZpbGUgIi4vdGVzdHMvZG9ja2VyL2RvY2tlci5weSIsIGxpbmUgNjY0LCBpbiA8bW9k
dWxlPgogICAgc3lzLmV4aXQobWFpbigpKQotLS0KICAgIHJhaXNlIENhbGxlZFByb2Nlc3NFcnJv
cihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOiBDb21tYW5kICdb
J3N1ZG8nLCAnLW4nLCAnZG9ja2VyJywgJ3J1bicsICctLWxhYmVsJywgJ2NvbS5xZW11Lmluc3Rh
bmNlLnV1aWQ9ZmE3MTMwYzYzYTRlNDE5MmJkYTAyYWIyOWJkNDUwODEnLCAnLXUnLCAnMTAwMycs
ICctLXNlY3VyaXR5LW9wdCcsICdzZWNjb21wPXVuY29uZmluZWQnLCAnLS1ybScsICctZScsICdU
QVJHRVRfTElTVD0nLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9JywgJy1lJywgJ1Y9Jywg
Jy1lJywgJ0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1dfRU5WPTEnLCAnLWUnLCAn
Q0NBQ0hFX0RJUj0vdmFyL3RtcC9jY2FjaGUnLCAnLXYnLCAnL2hvbWUvcGF0Y2hldzIvLmNhY2hl
L3FlbXUtZG9ja2VyLWNjYWNoZTovdmFyL3RtcC9jY2FjaGU6eicsICctdicsICcvdmFyL3RtcC9w
YXRjaGV3LXRlc3Rlci10bXAtc2p5dmthcWgvc3JjL2RvY2tlci1zcmMuMjAyMC0wMi0yMS0wMS4x
Mi4wNC4xNTM5MjovdmFyL3RtcC9xZW11Onoscm8nLCAncWVtdTpjZW50b3M3JywgJy92YXIvdG1w
L3FlbXUvcnVuJywgJ3Rlc3QtcXVpY2snXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMg
Mi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11Lmluc3RhbmNlLnV1aWQ9ZmE3MTMwYzYz
YTRlNDE5MmJkYTAyYWIyOWJkNDUwODEKbWFrZVsxXTogKioqIFtkb2NrZXItcnVuXSBFcnJvciAx
Cm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAt
c2p5dmthcWgvc3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4tdGVzdC1xdWlja0BjZW50b3M3XSBF
cnJvciAyCgpyZWFsICAgIDE2bTkuNjE2cwp1c2VyICAgIDBtOC4yNTNzCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDIyMTA0NDkwOC4y
NjY4ODMtMS1nc2hhbkByZWRoYXQuY29tL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=
