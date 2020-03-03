Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp188952lfi;
        Tue, 3 Mar 2020 02:26:36 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsfkO3gUCjRul48Qu7G4Zh0xkCqf/SBerVMaUZWPYm9V1Ngo9ho3ITHUBn0mT9rvDnmD+su
X-Received: by 2002:a05:620a:22c3:: with SMTP id o3mr3318458qki.315.1583231196213;
        Tue, 03 Mar 2020 02:26:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si507245qtf.134.2020.03.03.02.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 02:26:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44963 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j94l1-0003lu-LK
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 05:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j94XQ-0002V0-AT
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:12:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j94XP-0006mN-7E
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:12:32 -0500
Resent-Date: Tue, 03 Mar 2020 05:12:32 -0500
Resent-Message-Id: <E1j94XP-0006mN-7E@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j94XO-0006lv-UX; Tue, 03 Mar 2020 05:12:31 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1583230287; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dKEOIBy27+5BgJICCmW803DOlhWhBINADwox40HuPtB55y/SmAGrDomjOdq48P8J5HnpbvCCw3KRxic/BbaCKMqs/UMrnh1rViFhOSnqtTmTHr/ve1Z8O1wnX+kbwK7L37Ydgd3EaHgmX58Svu8zG6Sq51CMWYvGALWQ4cl816Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1583230287;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=B86zk3AKywV2F/1/w8NsRWPTJJEDclgVIqaNGRuVrCQ=; 
 b=BHzgCP/5QeUUsneCF2qwsh/6598ym+ncPmNSxcPXGFfYD3w6QT2dVRK4W0UYWZmkcTbEIfhvza54P/IVyJRGejDAM7CRylkXjSh+Onaq4DxwbwzptGh2tHiKDUCGcX2DajoEHDKIItO8Q3pWoA0E1DYcCOTczcwYQeZHQAthOPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1583230285988902.7039268774963;
 Tue, 3 Mar 2020 02:11:25 -0800 (PST)
In-Reply-To: <20200303100511.5498-1-peter.maydell@linaro.org>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
Message-ID: <158323028289.8962.16946898666612915768@abdcc9e1aa82>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Tue, 3 Mar 2020 02:11:25 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: crwulff@gmail.com, sagark@eecs.berkeley.edu, david@redhat.com,
 green@moxielogic.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 jcmvbkbc@gmail.com, Alistair.Francis@wdc.com, edgar.iglesias@gmail.com,
 marex@denx.de, palmer@dabbelt.com, aleksandar.rikalo@rt-rk.com,
 rth@twiddle.net, atar4qemu@gmail.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 michael@walle.cc, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +LwXZPunbna9

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMwMzEwMDUxMS41NDk4
LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBi
dWlsZCB0ZXN0IG9uIEZyZWVCU0QgaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cu
Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCiMgVGVzdGluZyBzY3JpcHQg
d2lsbCBiZSBpbnZva2VkIHVuZGVyIHRoZSBnaXQgY2hlY2tvdXQgd2l0aAojIEhFQUQgcG9pbnRp
bmcgdG8gYSBjb21taXQgdGhhdCBoYXMgdGhlIHBhdGNoZXMgYXBwbGllZCBvbiB0b3Agb2YgImJh
c2UiCiMgYnJhbmNoCmlmIHFlbXUtc3lzdGVtLXg4Nl82NCAtLWhlbHAgPi9kZXYvbnVsbCAyPiYx
OyB0aGVuCiAgUUVNVT1xZW11LXN5c3RlbS14ODZfNjQKZWxpZiAvdXNyL2xpYmV4ZWMvcWVtdS1r
dm0gLS1oZWxwID4vZGV2L251bGwgMj4mMTsgdGhlbgogIFFFTVU9L3Vzci9saWJleGVjL3FlbXUt
a3ZtCmVsc2UKICBleGl0IDEKZmkKbWFrZSB2bS1idWlsZC1mcmVlYnNkIEo9MjEgUUVNVT0kUUVN
VQpleGl0IDAKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDAzMDMxMDA1MTEuNTQ5OC0xLXBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZy90ZXN0aW5nLkZyZWVCU0QvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=
