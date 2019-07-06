Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp318543wrb;
        Sat, 6 Jul 2019 04:46:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9NiVARWuSbkQkhsdpdhR8KqlKKlintxFzTF/AsJEmTAFMrvR4B79QCWlPTxDQnyTFzzB6
X-Received: by 2002:a50:ba57:: with SMTP id 23mr3128268eds.196.1562413580548;
        Sat, 06 Jul 2019 04:46:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i44si9154455ede.407.2019.07.06.04.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jul 2019 04:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjj91-0006b2-KD
	for alex.bennee@linaro.org; Sat, 06 Jul 2019 07:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hjj8X-0006WK-Nn
 for qemu-arm@nongnu.org; Sat, 06 Jul 2019 07:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hjj8W-0004tX-Lm
 for qemu-arm@nongnu.org; Sat, 06 Jul 2019 07:45:49 -0400
Resent-Date: Sat, 06 Jul 2019 07:45:49 -0400
Resent-Message-Id: <E1hjj8W-0004tX-Lm@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21486)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hjj8Q-0004mt-TH; Sat, 06 Jul 2019 07:45:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1562413533; cv=none; d=zoho.com; s=zohoarc; 
 b=StZzWfWgUSWwV0duSM54jYotvg94VVte78SUCHRTm58TouLv8/O2Q8QFr6kLyynNDbpGto8NHYRYoQUaRLdj9x/MhMHc1C0l7Q5YU0HeTm7ENhWeWFAh8v3CbxRtfYhNEY4tFrC7Qj/9GQSQln7Q5LP6hcubye0wTF95AZjDtNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1562413533;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=ZAjAFFMjzDOqqXjn0soZejArvpr5GYsSXoFhLaSdAW8=; 
 b=j+V2+pIldguNLgjxlscMVueuIPkV5obYD3R6aqjYxBv2sRN7yvSdwG6myDivaBbdDEfjVBFT8IL2FwSw+YkiQaZ5C5Z+oB/eNi3xBVuPMRHhKFOM3lR2GXSpdGEWRP7hdAxY5KavzpyeYJUCsoU12a8+mdwl17VmaHp8li/o55c=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 156241353291559.330888580737906;
 Sat, 6 Jul 2019 04:45:32 -0700 (PDT)
Message-ID: <156241353142.4200.7077749980045313649@c4a48874b076>
In-Reply-To: <20190705202500.18853-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Sat, 6 Jul 2019 04:45:32 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.1 v4 0/3]
 hw/ssi/xilinx_spips: Avoid NULL pointer deference
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
Cc: peter.maydell@linaro.org, frasse.iglesias@gmail.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, ppandit@redhat.com, slei.casper@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E08c5KIT8nQ+

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcwNTIwMjUwMC4xODg1
My0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0
ZXN0IG9uIHMzOTB4IGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAojIFRlc3Rpbmcgc2NyaXB0IHdpbGwgYmUg
aW52b2tlZCB1bmRlciB0aGUgZ2l0IGNoZWNrb3V0IHdpdGgKIyBIRUFEIHBvaW50aW5nIHRvIGEg
Y29tbWl0IHRoYXQgaGFzIHRoZSBwYXRjaGVzIGFwcGxpZWQgb24gdG9wIG9mICJiYXNlIgojIGJy
YW5jaApzZXQgLWUKCmVjaG8KZWNobyAiPT09IEVOViA9PT0iCmVudgoKZWNobwplY2hvICI9PT0g
UEFDS0FHRVMgPT09IgpycG0gLXFhCgplY2hvCmVjaG8gIj09PSBVTkFNRSA9PT0iCnVuYW1lIC1h
CgpDQz0kSE9NRS9iaW4vY2MKSU5TVEFMTD0kUFdEL2luc3RhbGwKQlVJTEQ9JFBXRC9idWlsZApt
a2RpciAtcCAkQlVJTEQgJElOU1RBTEwKU1JDPSRQV0QKY2QgJEJVSUxECiRTUkMvY29uZmlndXJl
IC0tY2M9JENDIC0tcHJlZml4PSRJTlNUQUxMCm1ha2UgLWo0CiMgWFhYOiB3ZSBuZWVkIHJlbGlh
YmxlIGNsZWFuIHVwCiMgbWFrZSBjaGVjayAtajQgVj0xCm1ha2UgaW5zdGFsbAo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKICBDQyAgICAgIGh3L3NzaS9hc3BlZWRfc21jLm8KICBDQyAgICAgIGh3
L3NzaS9zdG0zMmYyeHhfc3BpLm8KICBDQyAgICAgIGh3L3NzaS9tc3Mtc3BpLm8KL3Zhci90bXAv
cGF0Y2hldy10ZXN0ZXItdG1wLWdoamp2ODZiL3NyYy9ody9zc2kveGlsaW54X3NwaXBzLmM6MTI0
Njo1OiBlcnJvcjogZXhwZWN0ZWQg4oCYfeKAmSBiZWZvcmUg4oCYLuKAmSB0b2tlbgogMTI0NiB8
ICAgICAuaW1wbCA9IHsKICAgICAgfCAgICAgXgovdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAt
Z2hqanY4NmIvc3JjL2h3L3NzaS94aWxpbnhfc3BpcHMuYzoxMjM4OjQyOiBub3RlOiB0byBtYXRj
aCB0aGlzIOKAmHvigJkKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzIwMTkwNzA1MjAyNTAwLjE4ODUzLTEtcGhpbG1kQHJlZGhhdC5jb20vdGVz
dGluZy5zMzkweC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

