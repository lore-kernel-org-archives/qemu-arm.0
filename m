Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3260878lfm;
        Sun, 12 Apr 2020 18:32:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypLas14BuizFyP83EQqQp7avQntEgjEjfe206SZttEC3lnlVEgqolrrG19jlYNj94T3jNm3k
X-Received: by 2002:a37:8803:: with SMTP id k3mr14468730qkd.392.1586741527327;
        Sun, 12 Apr 2020 18:32:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si5126838qtb.123.2020.04.12.18.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 18:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNnxG-0006Z1-PJ
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 21:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jNnx8-0006VP-LO
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 21:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jNnx7-0002pn-GJ
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 21:31:58 -0400
Resent-Date: Sun, 12 Apr 2020 21:31:58 -0400
Resent-Message-Id: <E1jNnx7-0002pn-GJ@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21390)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jNnwz-0002dl-QO; Sun, 12 Apr 2020 21:31:50 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586741409; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=G3wDKTZtvh6mLs8WTe1FPQ47spBioyPgehatm5mzZpGLAGVIrPgaIO3mM3iVipF4oMsbe6nqCAThull5HdUSNxLN8NuPQIIQM2D+RiyCvo1CQRm8H/WZVedkaPG3GtQY6jUUE3ReSRS0kLfWexFpw8oNeT1fXQlv/T7qCRhlNBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1586741409;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=DXA8ROflQaKr4S/rbswC1itG5CejlDkW2QEiSUsR/5U=; 
 b=ey3Uai/yjI0xltaIIlsp8pDejsNjswbQCnFtb/SCnkMFGC94BrjaBnUbJd4Urf8/4ZE3trkKyB8xI1zNUFFWFTpdVMmDXkcjXQvWyGWRF5f68g5FotylrVC9DCUd1aAsgRK3pzGEx67XvAOKclIGMtqBM5/IL4VhJfSy3EUsEyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1586741406599264.8925429120661;
 Sun, 12 Apr 2020 18:30:06 -0700 (PDT)
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 v3 00/23] various: Fix error-propagation with
 Coccinelle scripts (part 2)
Message-ID: <158674140284.24582.4738303734545201273@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Sun, 12 Apr 2020 18:30:06 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.53
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
Cc: peter.maydell@linaro.org, sagark@eecs.berkeley.edu, mst@redhat.com,
 jasowang@redhat.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 Alistair.Francis@wdc.com, mreitz@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, aleksandar.qemu.devel@gmail.com, joel@jms.id.au,
 qemu-ppc@nongnu.org, aleksandar.rikalo@rt-rk.com, rth@twiddle.net,
 philmd@redhat.com, ehabkost@redhat.com, jcd@tribudubois.net,
 alistair@alistair23.me, b.galvani@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, kwolf@redhat.com, qemu-riscv@nongnu.org,
 andrew@aj.id.au, kbastian@mail.uni-paderborn.de, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, michael@walle.cc,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J6XYXIgsFLxD

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQxMjIyNDE0NC4xMjIw
NS0xLWY0YnVnQGFtc2F0Lm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGRvY2tl
ci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0xIE5FVFdP
Uks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0xIEo9MTQg
TkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpSQU1CbG9jayAic3JhbSBBIiBhbHJl
YWR5IHJlZ2lzdGVyZWQsIGFib3J0IQpCcm9rZW4gcGlwZQovdG1wL3FlbXUtdGVzdC9zcmMvdGVz
dHMvcXRlc3QvbGlicXRlc3QuYzoxNzU6IGtpbGxfcWVtdSgpIGRldGVjdGVkIFFFTVUgZGVhdGgg
ZnJvbSBzaWduYWwgNiAoQWJvcnRlZCkgKGNvcmUgZHVtcGVkKQpFUlJPUiAtIHRvbyBmZXcgdGVz
dHMgcnVuIChleHBlY3RlZCA2LCBnb3QgNSkKbWFrZTogKioqIFtjaGVjay1xdGVzdC1hYXJjaDY0
XSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgVEVT
VCAgICBpb3Rlc3QtcWNvdzI6IDE1NAogIFRFU1QgICAgaW90ZXN0LXFjb3cyOiAxNTYKLS0tCiAg
ICByYWlzZSBDYWxsZWRQcm9jZXNzRXJyb3IocmV0Y29kZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxl
ZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydzdWRvJywgJy1uJywgJ2RvY2tlcicsICdydW4nLCAn
LS1sYWJlbCcsICdjb20ucWVtdS5pbnN0YW5jZS51dWlkPWJiYmI5ZDI5YjRlNDQ3N2Y5YTNlMGRm
YmUxYmY2OWRiJywgJy11JywgJzEwMDMnLCAnLS1zZWN1cml0eS1vcHQnLCAnc2VjY29tcD11bmNv
bmZpbmVkJywgJy0tcm0nLCAnLWUnLCAnVEFSR0VUX0xJU1Q9JywgJy1lJywgJ0VYVFJBX0NPTkZJ
R1VSRV9PUFRTPScsICctZScsICdWPScsICctZScsICdKPTE0JywgJy1lJywgJ0RFQlVHPScsICct
ZScsICdTSE9XX0VOVj0xJywgJy1lJywgJ0NDQUNIRV9ESVI9L3Zhci90bXAvY2NhY2hlJywgJy12
JywgJy9ob21lL3BhdGNoZXcyLy5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6L3Zhci90bXAvY2Nh
Y2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTc0NHZyNnc2L3NyYy9k
b2NrZXItc3JjLjIwMjAtMDQtMTItMjEuMTYuMzAuOTI4OTovdmFyL3RtcC9xZW11Onoscm8nLCAn
cWVtdTpjZW50b3M3JywgJy92YXIvdG1wL3FlbXUvcnVuJywgJ3Rlc3QtcXVpY2snXScgcmV0dXJu
ZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11
Lmluc3RhbmNlLnV1aWQ9YmJiYjlkMjliNGU0NDc3ZjlhM2UwZGZiZTFiZjY5ZGIKbWFrZVsxXTog
KioqIFtkb2NrZXItcnVuXSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFy
L3RtcC9wYXRjaGV3LXRlc3Rlci10bXAtNzQ0dnI2dzYvc3JjJwptYWtlOiAqKiogW2RvY2tlci1y
dW4tdGVzdC1xdWlja0BjZW50b3M3XSBFcnJvciAyCgpyZWFsICAgIDEzbTMzLjE5NHMKdXNlciAg
ICAwbTkuMDYwcwoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvMjAyMDA0MTIyMjQxNDQuMTIyMDUtMS1mNGJ1Z0BhbXNhdC5vcmcvdGVzdGluZy5k
b2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1
dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2Vu
ZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
