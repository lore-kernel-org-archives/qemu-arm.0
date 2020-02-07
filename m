Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp393836lfp;
        Fri, 7 Feb 2020 02:12:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQ5bVs6/ghxH9oRhofJIxzN606XRROZtTVxhdvNJ1KvEJJ40f1jakjMcEo430w7Y7GclXr
X-Received: by 2002:a05:620a:11a1:: with SMTP id c1mr6811725qkk.390.1581070333593;
        Fri, 07 Feb 2020 02:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581070333; cv=none;
        d=google.com; s=arc-20160816;
        b=cidzf7eoY0ZbUTSHYecSiSGtdLLiD/PoWrgp9kLTFN0H7PSn/vmMw0571lZiSb8nwR
         V/UlyGvo4g8O67UK59bbyS/KzTzw3SSS2wSq5+VoGghdTDWqjuHLFHGyZ7XVeGXMBnr7
         3BvYJ2cijEVt7NaBbyoWLo8nn5zJ7zARlbV5TFgAPznRPXKtOrdg0JLo7XhAEyoji28p
         FZUkLMZYo0tfOm1Sauv6w+2jDHXqTSyjV31+Wuh2zPTh56WkTf5SEOFjHZfBrGREgcwN
         VTI2hLDuwbePxU+42QZrHyYZblDfUxBLjGfsyx7GTDroWug4fbZV76oQ/eRzswv79R+o
         Aa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:date:to:from
         :resent-from:content-transfer-encoding:mime-version:message-id
         :subject:in-reply-to:resent-message-id:resent-date;
        bh=xaJsPVwtV1/CZukShx7ofglFHiR9/LjMxir7eA8hJMk=;
        b=iOvQS78SB8dD9b+kDjkfkp6gpwnV1vjSLQOl4c2MNzmnPo2BUZOPQxMTMvMgG4FmG1
         hQrZLMUrtUCNf8ZWH6OV20uNJDVSkH9Ealbd6hNoFUC+hsKzb0+IuBCCsrcChq9gkSxy
         GYI2qFjyLB1YEGyI1BMmSjhTXAL07prhs2jfrUoYPecgXQH4yhONYzeX6EgHRQb/4yRf
         TWC12C1Mkaxto0oGEs/z4U4j6ThLD7aoIJaFdt0INjfxGUFupE2YS3KOv/u1em8VTcfL
         givBVvH/3b0i7Bchj/qypyj3e9qs685SOHOTqDsUz3nUENOIzA118q79VkMeli1SiC4k
         067w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si86178qka.332.2020.02.07.02.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00cP-0002LS-2h
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j00cH-0002FQ-9S
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:12:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j00cG-0006K1-1Y
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:12:05 -0500
Resent-Date: Fri, 07 Feb 2020 05:12:05 -0500
Resent-Message-Id: <E1j00cG-0006K1-1Y@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21147)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j00cD-0006HJ-3L; Fri, 07 Feb 2020 05:12:01 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1581070293488133.35641904688862;
 Fri, 7 Feb 2020 02:11:33 -0800 (PST)
In-Reply-To: <20200207093203.3788-1-eric.auger@redhat.com>
Subject: Re: [PATCH v14 00/11] VIRTIO-IOMMU device
Message-ID: <158107029187.30180.17282262107925112593@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eric.auger@redhat.com
Date: Fri, 7 Feb 2020 02:11:33 -0800 (PST)
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, eric.auger@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, mst@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4p8SwQQ1UUKb

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDIwNzA5MzIwMy4zNzg4
LTEtZXJpYy5hdWdlckByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUg
ZG9ja2VyLXF1aWNrQGNlbnRvczcgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rpbmcg
Y29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3Rh
bGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKbWFrZSBkb2NrZXItaW1hZ2UtY2VudG9zNyBWPTEg
TkVUV09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1xdWlja0BjZW50b3M3IFNIT1dfRU5WPTEg
Sj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCnVzZSAtdmlydGlvLWlvbW11
LXBjaSx4LWR0LWJpbmRpbmcKQnJva2VuIHBpcGUKL3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL3F0
ZXN0L2xpYnF0ZXN0LmM6MTQwOiBraWxsX3FlbXUoKSB0cmllZCB0byB0ZXJtaW5hdGUgUUVNVSBw
cm9jZXNzIGJ1dCBlbmNvdW50ZXJlZCBleGl0IHN0YXR1cyAxIChleHBlY3RlZCAwKQpFUlJPUiAt
IHRvbyBmZXcgdGVzdHMgcnVuIChleHBlY3RlZCA3MiwgZ290IDM5KQptYWtlOiAqKiogW2NoZWNr
LXF0ZXN0LXg4Nl82NF0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgogIFRFU1QgICAgaW90ZXN0LXFjb3cyOiAxNTQKICBURVNUICAgIGlvdGVzdC1xY293
MjogMTU2Ci0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3Vi
cHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3VkbycsICctbicsICdkb2Nr
ZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2UudXVpZD03NzM5MzQ0YzMy
YmU0YWI4YjI3YmI3YTA5MzZkZGJkYicsICctdScsICcxMDAzJywgJy0tc2VjdXJpdHktb3B0Jywg
J3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScs
ICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScs
ICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1w
L2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hl
Oi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC00
azF5eTd5ai9zcmMvZG9ja2VyLXNyYy4yMDIwLTAyLTA3LTA0LjU5LjM2Ljc2NTI6L3Zhci90bXAv
cWVtdTp6LHJvJywgJ3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LXF1
aWNrJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1s
YWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTc3MzkzNDRjMzJiZTRhYjhiMjdiYjdhMDkzNmRk
YmRiCm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRp
cmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLTRrMXl5N3lqL3NyYycKbWFrZTog
KioqIFtkb2NrZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3IgMgoKcmVhbCAgICAxMW01
NC40ODVzCnVzZXIgICAgMG04LjAyOHMKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMjA3MDkzMjAzLjM3ODgtMS1lcmljLmF1Z2VyQHJl
ZGhhdC5jb20vdGVzdGluZy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0K
RW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3
Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0
LmNvbQ==
