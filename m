Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1267192wru;
        Fri, 27 Jul 2018 16:59:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeZmTpuYATIiRwFvdwkHo/vTo0Wvl2DFC6S9WcnY8UPfkHFDQuDHKabPig9zR1lgI9//xG1
X-Received: by 2002:aed:3143:: with SMTP id 61-v6mr8268013qtg.19.1532735983720;
        Fri, 27 Jul 2018 16:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532735983; cv=none;
        d=google.com; s=arc-20160816;
        b=oAJYlDyNB5Jlldh3R6NfPR/SiYdmiKafRhahBgK4UDvtvsz3Ugq2rxKtb0whJpWgO/
         mL+CxUAOHnvOAHeTf1rCKTikecdta5XrpAUG8wTz1bZ+DIzlRj4EzI27t5qG8phXEQm/
         DxPRfEtpV/MupKux9EuwpYry1vqCt3BzSWylW60Popzibh/DwnalB63p7ejHkghzs0fL
         9fPgYxC5RE9946B/3M7JMgGiQ9+FaFfUNrixwq+GWTzAk8eTIjp4CLN9w/6/pt3vdYb2
         5lix0Ma1gPt7OUYOj7mLIlphvycE8Y1XTGbADfG8U8uNCf+DU9UUjYnGZhOSEwueu0Cl
         DoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:mime-version
         :content-transfer-encoding:references:in-reply-to:to:from:date
         :arc-authentication-results;
        bh=s86bvqpbNx83fpLWJnxUbhBaYtdAcbwh89gjpAfoszI=;
        b=u06F/I4W6zLQAv4CfJpCpZsAXUKHJ56pblPdTjIHTubuEtaZpKzkd/OKvKCqAD7LD2
         VJlgNkX/sgUO7ytTs+kNOkWr9Kct9VYf3AkKu5IB3aFARNBfxiyDTjzaOiOtMn0A/jTm
         J+ckPK74BigGmc8uvrJ/EN1YNLqLAjNxYjYL245+sUbwLEQ1pfzH9KuBs7ZRWfr6i2t2
         kAhQho+j0ayvR0H4h4U8v8lEgGcOqPynS0PKhxgkJFXlwAHp1Yv+ggq8m0/FaCD8lVH7
         zXzZ5B1a/9wGHnxGrUEtotimJGVlO9/ZccYEbh8m0SMMZ85eNl0N9aGVtQgSOmG9JqCJ
         hASQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m54-v6si3532567qvh.220.2018.07.27.16.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 16:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fjCe7-0003in-AQ
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 19:59:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <suhang16@mails.ucas.ac.cn>) id 1fjCd7-0003Rl-Ft
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 19:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <suhang16@mails.ucas.ac.cn>) id 1fjCd6-0007uH-LP
	for qemu-devel@nongnu.org; Fri, 27 Jul 2018 19:58:41 -0400
Received: from smtp65.cstnet.cn ([159.226.251.65]:52412 helo=cstnet.cn)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <suhang16@mails.ucas.ac.cn>)
	id 1fjCd1-0007jX-7X; Fri, 27 Jul 2018 19:58:35 -0400
Received: by ajax-webmail-APP-19 (Coremail) ; Sat, 28 Jul 2018 07:58:17
	+0800 (GMT+08:00)
X-Originating-IP: [45.77.249.120]
Date: Sat, 28 Jul 2018 07:58:17 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Su Hang" <suhang16@mails.ucas.ac.cn>
To: =?UTF-8?Q?philippe_mathieu-daud=C3=A9?= <f4bug@amsat.org>, 
	qemu-devel@nongnu.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.5 build 20161025(89512.9021)
	Copyright (c) 2002-2018 www.mailtech.cn cstnet
In-Reply-To: <0c2c23f3-5ec9-5446-17ca-683d267d0f4c@amsat.org>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-8-stefanha@redhat.com>
	<0c2c23f3-5ec9-5446-17ca-683d267d0f4c@amsat.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6c1020b8.17461.164de2dc109.Coremail.suhang16@mails.ucas.ac.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: 2QCowAAnCSqasVtbM9dEAA--.56264W
X-CM-SenderInfo: pvxkt0rjrwqzpdlo2hpxfd2hldfou0/1tbiBwYTEllo9PMbVQAAs4
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 159.226.251.65
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 7/7] Add QTest testcase for
 the Intel Hexadecimal
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jim@groklearning.com, mail@steffen-goertz.de,
	ilg@livius.net, alistair@alistair23.me, sundeep.lkml@gmail.com,
	qemu.ml@steffen-goertz.de, qemu-arm@nongnu.org, joel@jms.id.au,
	stefanha@redhat.com, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oBhbro30Axqu

PiA+ICsjZGVmaW5lIEJJTl9TSVpFIDE0Ngo+ID4gKwo+ID4gK3N0YXRpYyB1bnNpZ25lZCBjaGFy
IHByZV9zdG9yZVtCSU5fU0laRV0gPSB7Cj4gPiArICAgIDQsICAgMjA4LCAxNTksIDIyOSwgMjIs
ICAwLCAgIDAsICAgMjM1LCAyNTQsIDI1NSwgMjU1LCAyMzQsIDE1MiwgMTYsICAxLAo+ID4gKyAg
ICAwLCAgIDQsICAgMTc2LCA0NSwgIDIyOSwgMCwgICAxNzYsIDE0MSwgMjI2LCAxMiwgIDIwOCwg
NzcsICAyMjYsIDgsICAgMCwKPiA+ICsgICAgMTEsICAyMjksIDYsICAgMCwgICAwLCAgIDIzNCwg
OCwgICA0OCwgIDI3LCAgMjI5LCAwLCAgIDMyLCAgMjExLCAyMjksIDQ0LAo+ID4gKyAgICA0OCwg
IDE1OSwgMjI5LCAwLCAgIDMyLCAgMTMxLCAyMjksIDgsICAgNDgsICAyNywgIDIyOSwgMSwgICA0
OCwgIDEzMSwgMjI2LAo+ID4gKyAgICA4LCAgIDQ4LCAgMTEsICAyMjksIDgsICAgNDgsICAyNywg
IDIyOSwgMCwgICA0OCwgIDIxMSwgMjI5LCAwLCAgIDAsICAgODMsCj4gPiArICAgIDIyNywgMjQ0
LCAyNTUsIDI1NSwgMjYsICAwLCAgIDAsICAgMTYwLCAyMjUsIDAsICAgMjA4LCAxMzksIDIyNiwg
NCwgICAxNzYsCj4gPiArICAgIDE1NywgMjI4LCAzMCwgIDI1NSwgNDcsICAyMjUsIDAsICAgMTYs
ICAzMSwgIDE2LCAgMCwgICA3MiwgIDQ1LCAgMjMzLCA0LAo+ID4gKyAgICAxNzYsIDE0MSwgMjI2
LCA4LCAgIDAsICAgMTU5LCAyMjksIDIzMCwgMjU1LCAyNTUsIDIzNSwgMCwgICAwLCAgIDE2MCwg
MjI1LAo+ID4gKyAgICAwLCAgIDEzNiwgMTg5LCAyMzIsIDEzMiwgMCwgICAxLCAgIDAsICAgMCwg
ICAxNiwgIDMxLCAgMTYsICA3MiwgIDEwMSwgMTA4LAo+ID4gKyAgICAxMDgsIDExMSwgMzIsICAx
MTksIDExMSwgMTE0LCAxMDgsIDEwMCwgMzMsICAxMCwgIDB9Owo+IAo+IENhbiB0aGlzIGJlOgo+
IAo+ICAgMHgwNCwgMHhkMCwgMHg5ZiwgMHhlNSwgICAweDE2LCAweDAwLCAweDAwLCAweGViLCAg
IDB4ZmUsIDB4ZmYsIDB4ZmYsCj4gMHhlYSwKPiAgIDB4OTgsIDB4MTAsIDB4MDEsIDB4MDAsICAg
MHgwNCwgMHhiMCwgMHgyZCwgMHhlNSwgICAweDAwLCAweGIwLCAweDhkLAo+IDB4ZTIsCj4gICAw
eDBjLCAweGQwLCAweDRkLCAweGUyLCAgIDB4MDgsIDB4MDAsIDB4MGIsIDB4ZTUsICAgMHgwNiwg
MHgwMCwgMHgwMCwKPiAweGVhLAo+ICAgMHgwOCwgMHgzMCwgMHgxYiwgMHhlNSwgICAweDAwLCAw
eDIwLCAweGQzLCAweGU1LCAgIDB4MmMsIDB4MzAsIDB4OWYsCj4gMHhlNSwKPiAgIDB4MDAsIDB4
MjAsIDB4ODMsIDB4ZTUsICAgMHgwOCwgMHgzMCwgMHgxYiwgMHhlNSwgICAweDAxLCAweDMwLCAw
eDgzLAo+IDB4ZTIsCj4gICAweDA4LCAweDMwLCAweDBiLCAweGU1LCAgIDB4MDgsIDB4MzAsIDB4
MWIsIDB4ZTUsICAgMHgwMCwgMHgzMCwgMHhkMywKPiAweGU1LAo+ICAgMHgwMCwgMHgwMCwgMHg1
MywgMHhlMywgICAweGY0LCAweGZmLCAweGZmLCAweDFhLCAgIDB4MDAsIDB4MDAsIDB4YTAsCj4g
MHhlMSwKPiAgIDB4MDAsIDB4ZDAsIDB4OGIsIDB4ZTIsICAgMHgwNCwgMHhiMCwgMHg5ZCwgMHhl
NCwgICAweDFlLCAweGZmLCAweDJmLAo+IDB4ZTEsCj4gICAweDAwLCAweDEwLCAweDFmLCAweDEw
LCAgIDB4MDAsIDB4NDgsIDB4MmQsIDB4ZTksICAgMHgwNCwgMHhiMCwgMHg4ZCwKPiAweGUyLAo+
ICAgMHgwOCwgMHgwMCwgMHg5ZiwgMHhlNSwgICAweGU2LCAweGZmLCAweGZmLCAweGViLCAgIDB4
MDAsIDB4MDAsIDB4YTAsCj4gMHhlMSwKPiAgIDB4MDAsIDB4ODgsIDB4YmQsIDB4ZTgsICAgMHg4
NCwgMHgwMCwgMHgwMSwgMHgwMCwgICAweDAwLCAweDEwLCAweDFmLAo+IDB4MTAsCj4gICAnSCcs
ICAnZScsICAnbCcsICAnbCcsICAgICdvJywgICcgJywgICd3JywgICdvJywgICAgJ3InLCAgJ2wn
LCAgJ2QnLCAgJyEnLAo+ICAgJ1xuJywgJ1wwJwo+IH07Cj4gCj4gPwoKWWVzLCBnb29kIHN1Z2dl
c3Rpb24uIFlvdXIgdmVyc2lvbiBpcyBjbGVhcmVyIGFuZCBtb3JlIHJlYWRhYmxlIGZvciBodW1h
bnMuCgpCZXN0LApTdSBIYW5n
