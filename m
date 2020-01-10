Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1094399lff;
        Fri, 10 Jan 2020 11:21:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+hSIVwWHovPW7RnbGxVyrURRry2qaTX9fp0ehFPwBRg0zIUQw6zRuRRrE0mzm4m5y88tw
X-Received: by 2002:aa7:c2cb:: with SMTP id m11mr5148116edp.89.1578684061017;
        Fri, 10 Jan 2020 11:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578684061; cv=none;
        d=google.com; s=arc-20160816;
        b=AbJhizwRfuj/UvrDnYzxLP6Nnvf9HudoI3hzC5huzWv4UtWUPH8nb9rgZfHaFwPt2R
         tC8Ce6kdrM81IWVLrCMVGH67MJxxDsGzmQRTmGzknfrewkGj9HBsbpjxfvnOzsHOSWdT
         PsMo/gDG7Ra4weNanmZVRJT63gWHidWrdeLTuFvyNJhEAqNxJnjE4J8HkELjBvjwWRQD
         219/QZHAFi99ngnLIOxDQYXPyOPqcuj/90Yy1AR+s92t64fXUotKtLw7IsesskjnaqgD
         tZFM6m/lVr9vjv+ImKs0YxfBQrzYy8XyPs/5YTjZWG8wJKioakhAxfqBDoYXw/SUiAEK
         m1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:date:to:from
         :resent-from:content-transfer-encoding:mime-version:message-id
         :subject:in-reply-to:resent-message-id:resent-date;
        bh=1NuYbLP0Y6ezILHhpga1RnIGoC9nuL8IQHfAF89xc70=;
        b=Gk/aUXNhN3PLcUXdrIBujv7kSJgQDh2AnbY/uibRcBFQzV9yuPaKrgW0yKv7eFRY5o
         wlH7CofSV1ul2Ar2xzCrxZr729F6K2RUqQyspVRPY3fqZ3dYLdSsTy0bSTw3v7s8Ya0Z
         ahzDVkK0/uDjcMe0c7xi8S3CyO2ZgJw2+g84cchHbWMhK4E7skC9qqrmCwbmAokL59By
         Yyw3NvKP050/AVDo7zMQE+sRQA5yWg+fEfKJUM0lq/zTGaJ4Nfoc6/zLVpBPYo07LM/A
         cAsG+V5dqHNiTRbjDtjbgJ6wQu+tpN1BMDgApHkH/ScZozTgIIFaV7dVb2uK293ZQ5yu
         T5kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13si2221939eds.297.2020.01.10.11.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 11:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipzq7-0008ME-TV
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 14:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1ipzob-0006gW-Vn
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 14:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1ipzoa-0003FP-5z
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 14:19:25 -0500
Resent-Date: Fri, 10 Jan 2020 14:19:25 -0500
Resent-Message-Id: <E1ipzoa-0003FP-5z@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1ipzoZ-00034H-UZ; Fri, 10 Jan 2020 14:19:24 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1578683951050703.0312374367402;
 Fri, 10 Jan 2020 11:19:11 -0800 (PST)
In-Reply-To: <20200110180211.29025-1-jeff.kubascik@dornerworks.com>
Subject: Re: [PATCH] target/arm: adjust program counter for wfi exception in
 AArch32
Message-ID: <157868394996.15422.12153523141237065812@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jeff.kubascik@dornerworks.com
Date: Fri, 10 Jan 2020 11:19:11 -0800 (PST)
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
Cc: Stewart.Hildebrand@dornerworks.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Jarvis.Roach@dornerworks.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LrOb1/YkUfwa

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDExMDE4MDIxMS4yOTAy
NS0xLWplZmYua3ViYXNjaWtAZG9ybmVyd29ya3MuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9hcm06IGFkanVz
dCBwcm9ncmFtIGNvdW50ZXIgZm9yIHdmaSBleGNlcHRpb24gaW4gQUFyY2gzMgpUeXBlOiBzZXJp
ZXMKTWVzc2FnZS1pZDogMjAyMDAxMTAxODAyMTEuMjkwMjUtMS1qZWZmLmt1YmFzY2lrQGRvcm5l
cndvcmtzLmNvbQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2
LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKODAwMzM5YyB0YXJnZXQvYXJtOiBhZGp1c3QgcHJvZ3Jh
bSBjb3VudGVyIGZvciB3ZmkgZXhjZXB0aW9uIGluIEFBcmNoMzIKCj09PSBPVVRQVVQgQkVHSU4g
PT09CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBz
dGF0ZW1lbnQKIzMwOiBGSUxFOiB0YXJnZXQvYXJtL29wX2hlbHBlci5jOjI5ODoKKyAgICAgICAg
aWYgKGVudi0+YWFyY2g2NCkKWy4uLl0KKyAgICAgICAgZWxzZQpbLi4uXQoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAxMiBsaW5lcyBjaGVja2VkCgpDb21taXQgODAwMzM5YzdhYWViICh0
YXJnZXQvYXJtOiBhZGp1c3QgcHJvZ3JhbSBjb3VudGVyIGZvciB3ZmkgZXhjZXB0aW9uIGluIEFB
cmNoMzIpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMTEwMTgwMjExLjI5MDI1LTEtamVmZi5r
dWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t

