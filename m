Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1887062lfm;
        Thu, 23 Apr 2020 06:28:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypIPfSJIXO6DcTnQbhdJMh0PetG39Zaui3cow5dLyvZwU9blPM+/3VNMjtDLQy53pPHWZ1sI
X-Received: by 2002:a05:620a:572:: with SMTP id p18mr3586207qkp.73.1587648486068;
        Thu, 23 Apr 2020 06:28:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si1309117qka.194.2020.04.23.06.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 06:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRbtd-00045r-Hn
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 09:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jRbtU-00042e-Rz
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:27:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jRbtU-0004nr-Gn
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:27:56 -0400
Resent-Date: Thu, 23 Apr 2020 09:27:56 -0400
Resent-Message-Id: <E1jRbtU-0004nr-Gn@eggs.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jRbtR-0004cE-7d; Thu, 23 Apr 2020 09:27:53 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1587648465; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QpHaC5WyO/npImWr7uO/V6wo5leAHnBEP53pm2fXV351KSS732G9xK51d5aUxArzsextyNDyFQ+jkuFIqPEEK1lfrnxZPea3XfkZwj3c24yOQkPokSGzArfmQhoue6f5uFgYBw3242Miph+Mz+7W9PUl62TtFxHlEAE+4nLF4e0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1587648465;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5vbeQ+FkkXK8pQZM2SCNF1+zR79pPQdIELJE7I6w7VI=; 
 b=ntKmPKLDhMQ9LpzovDmBkRtpdjwEvgWq1jSmIte1CvNdBX7rKUuZ0aGVjC0bydEl2ww9SIe8LxqZuS4dEpH9x0a4L/WSUnepQf8nd+MPboiQSXlw6vWCPaYDPBm9jIyPohm/SwDrvF44SmJzZxsx8Cu3dnRPPEgblTI3kj7jG+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 158764846267898.20209728325824;
 Thu, 23 Apr 2020 06:27:42 -0700 (PDT)
In-Reply-To: <20200423124305.14718-1-f4bug@amsat.org>
Subject: Re: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 MIDR_EL1
Message-ID: <158764846144.10590.796159814554977319@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Thu, 23 Apr 2020 06:27:42 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 09:27:50
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3B2rK+oqqdP+

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDQyMzEyNDMwNS4xNDcx
OC0xLWY0YnVnQGFtc2F0Lm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGFzYW4g
YnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91
dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJs
eSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKZXhwb3J0IEFSQ0g9eDg2XzY0Cm1ha2UgZG9ja2VyLWltYWdlLWZlZG9yYSBWPTEgTkVU
V09SSz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1kZWJ1Z0BmZWRvcmEgVEFSR0VUX0xJU1Q9eDg2
XzY0LXNvZnRtbXUgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCgoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA0
MjMxMjQzMDUuMTQ3MTgtMS1mNGJ1Z0BhbXNhdC5vcmcvdGVzdGluZy5hc2FuLz90eXBlPW1lc3Nh
Z2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczov
L3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29t
