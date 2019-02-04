Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4001749wrt;
        Mon, 4 Feb 2019 12:50:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY7DnArDX02Oq0EO/L4r070Z3+B4Ij0ScZnZ+4DpF8tt99TNLkoZBxh3rXdyoQl373JFPgV
X-Received: by 2002:a25:4e03:: with SMTP id c3mr1126183ybb.415.1549313419577;
        Mon, 04 Feb 2019 12:50:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u130si686793ywa.406.2019.02.04.12.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 12:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqlC6-0007Iu-Vd
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 15:50:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqlBn-00078R-5k
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 15:49:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1gqlBm-0005be-91
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 15:49:59 -0500
Resent-Date: Mon, 04 Feb 2019 15:49:59 -0500
Resent-Message-Id: <E1gqlBm-0005be-91@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1gqlBh-0005Jz-GU; Mon, 04 Feb 2019 15:49:53 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1549313361; cv=none; d=zoho.com; s=zohoarc; 
	b=EyVY1+grBAv9bmiGNyYkJJctYauH6xtaHuaMTbG244mfB1g1Uoes7r9OdrXhX+RrwwM8ygEDsB/o0Q32aamz0l5NGU8gM3F+4lSSLuPwJhIZPqz/ZZNlqfzu9jTNh6EIlIQwjrNkVs771uO7k6sqLJ2sFrCieuOr4J03lCTna28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1549313361;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=6fC0fS7dr4mj5O9Vm3J85svUJxOU36frAMTV5Oi8L0w=; 
	b=fk7dE6nBkopKHuD5nqe51gb4KeaRfIMhNLxLeXACg9iF1HnyCGGhNsFvVS4k6ZPw0iryhrf4dlgXkJUgszSsTjU7t5xZfipvNjjgDqy3yJOcXZ7BdxL34sR7n0XE6gh5WJgRhYteWRLH+3LqbC92bEMtXaj0Hzi6qoEhHvWcRsY=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1549313359536746.4178166486399;
	Mon, 4 Feb 2019 12:49:19 -0800 (PST)
Message-ID: <154931335810.29184.7999220470596987389@ebba9967afc0>
In-Reply-To: <20190204204517.23698-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Mon, 4 Feb 2019 12:49:19 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/input/tsc210x: Fix building
 with no verbosity
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
Cc: fam@euphon.net, peter.maydell@linaro.org, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4VvVHV/eL+Wj

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDIwNDIwNDUxNy4yMzY5
OC0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCB0aGUgZG9j
a2VyLW1pbmd3QGZlZG9yYSBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUgdGVzdGluZyBjb21t
YW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2NrZXIgaW5zdGFsbGVk
LCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09IFRFU1QgU0NSSVBU
IEJFR0lOID09PQojIS9iaW4vYmFzaAp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWluZ3dAZmVkb3Jh
IFNIT1dfRU5WPTEgSj0xNAo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDIwNDIwNDUxNy4y
MzY5OC0xLXBoaWxtZEByZWRoYXQuY29tL3Rlc3RpbmcuZG9ja2VyLW1pbmd3QGZlZG9yYS8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

