Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2132218wrq;
        Thu, 5 Jul 2018 16:57:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpddjQocB3mA8YT2ADXjpLo3JoNfAEZwCZu2iYvRShJm5nJ3l4kKllqygC8chCL8cZofDZyU
X-Received: by 2002:ac8:f2c:: with SMTP id e41-v6mr7456114qtk.260.1530835077619;
        Thu, 05 Jul 2018 16:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530835077; cv=none;
        d=google.com; s=arc-20160816;
        b=MXi+xeTcafxRUIMIEheTLE3yZiVg4ij3zWj/IKVqrf0NY8H+xm+9YaVwRmS6+Nan8L
         iDGm5LYdzLJ6FFdfOUa9WrRGgvSRpPm8nLFAigNrTk80pkK9QfpH8OHlXLG8zmgO2Skp
         Witg94DMNuKGB0daygxq9CabpRkN32v3zOq/qIRLJlTKgryKZ01t/uRL+jUHYDHWBA1R
         NqujMhgFHoiY1mT+zNu9nOrBkWAkDYapzXssFkjjVSmhMXQK948UhDRB9F3uqfqK6Vw8
         ml0hOHW5qtpw9ZNK6TgxU/vOCzczyeOA++qmgQ0V1Ps+ZnwyztUQUpShzYjLGOWUmT0g
         4EqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=NZpR8NTLNFRDw87RSI6bJy4F4yYTGAr4orPDOD+fKGY=;
        b=XR1bN7A/XlS9RqD/uyqRd9wXwhNGGiJrOfqbaEM4lAyxvMFYukqyK01boShoXgxc6j
         QEFYQmUComCREnJXHgp8FwBGEJAeFSEBRJSWLG38Am8dlW2KvHxUfPHY1SPCiZexJ/pP
         XO/0I/Bis8ULWU+vovdMpIcOi7xcxk8MfUN4kKdeI9ZaHHjjNuHrBmxx1v/NBrwo8YNq
         FleklhWJkaNif8tubpeqUZr9BknKcV65XsVghif46/MaLNf6Ol3gc0H8Q+8ojjkrR8at
         EvRVMQgjNkjU3Z4RcAntTQL4qZhUMhhEOfrZX1r1rC5PK1EqgciHMfP9ysNH196a1CY0
         tLyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7-v6si1854805qtk.131.2018.07.05.16.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 16:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fbE8L-0007nL-50
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 19:57:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fbE87-0007li-US
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 19:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fbE86-00045N-Tn
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 19:57:44 -0400
Resent-Date: Thu, 05 Jul 2018 19:57:44 -0400
Resent-Message-Id: <E1fbE86-00045N-Tn@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fbE80-0003v6-Lf; Thu, 05 Jul 2018 19:57:36 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1530835040417864.2188060602757;
	Thu, 5 Jul 2018 16:57:20 -0700 (PDT)
In-Reply-To: <20180705235305.124423-1-mst@redhat.com>
Message-ID: <153083503965.1284.12951312751119282699@946cad8fd14e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mst@redhat.com
Date: Thu, 5 Jul 2018 16:57:20 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] acpi: generalize aml_package /
 aml_varpackage
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, famz@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AdVTt16CP/vi

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNzA1MjM1MzA1LjEyNDQyMy0xLW1zdEByZWRoYXQuY29tClN1YmplY3Q6
IFtRZW11LWRldmVsXSBbUEFUQ0hdIGFjcGk6IGdlbmVyYWxpemUgYW1sX3BhY2thZ2UgLyBhbWxf
dmFycGFja2FnZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1i
YXNlCm49MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVk
PTAKCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0Uu
LikiCmZvciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRv
dGFsOiAkKGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93
ICRjIC0tZm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAt
OyB0aGVuCiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEp
KQpkb25lCgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNj
OGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0
Y2hldy8yMDE4MDcwNTIzNTMwNS4xMjQ0MjMtMS1tc3RAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIw
MTgwNzA1MjM1MzA1LjEyNDQyMy0xLW1zdEByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJy
YW5jaCAndGVzdCcKY2JiNzJkNWEzYSBhY3BpOiBnZW5lcmFsaXplIGFtbF9wYWNrYWdlIC8gYW1s
X3ZhcnBhY2thZ2UKCj09PSBPVVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogYWNw
aTogZ2VuZXJhbGl6ZSBhbWxfcGFja2FnZSAvIGFtbF92YXJwYWNrYWdlLi4uCkVSUk9SOiBicmFj
ZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzMzOiBG
SUxFOiBody9hY3BpL2FtbC1idWlsZC5jOjEwMDc6CisgICAgaWYgKG51bV9lbGVtZW50cyA+IDB4
RkYpClsuLi5dCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDc0IGxpbmVzIGNoZWNrZWQK
CllvdXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

