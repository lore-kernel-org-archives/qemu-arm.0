Received: by 10.223.172.38 with SMTP id v35csp4967917wrc;
        Tue, 19 Sep 2017 06:58:07 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBYg252eq77IIx93pSWRVZg225O+BoZTcocVyOZP3JTonvtrSqhWpgum1KIR3NkIIW2uNAQ
X-Received: by 10.55.127.70 with SMTP id a67mr1965491qkd.90.1505829487383;
        Tue, 19 Sep 2017 06:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505829487; cv=none;
        d=google.com; s=arc-20160816;
        b=ra0C+LYTCVQ7r0+v6cSfM/lTUA3whd//CyQlYHC1POEQP89ooRkP+uBGRAIj8bAaUf
         t2on59zu0j/5iaXt3vfFakjreug8b0OhWqY37l9/u6iVInqkDd+wIk6rMgsbs1RrRhC+
         i87x+W3hGL8mZ+M4m3H/yvzWzSi/xJIT31rKsBu6oaiEXdLJnHO5LKLz6+bRX4RbgYAn
         lVk5TTDRK/jZF1X7FyWfjhD8i0SiB3BC+JMU/ACNvqNpJjnyrWK8TkNy1wBB/s0HFcVn
         zPN71xK9HWgmZTZ52u1mX2jXQ5a6pOhqJGTr/wYvTlmyMeWXEDOAxIb8ntz1PSXw8lsm
         D1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=ZbLvH0CLm3uJGFWmA4ZiB4TnKXaEKgT3MR499xkM9lE=;
        b=GzOuNKxa3i8w7gfPA3unXkPOEAakhpzYbVnwHEa66LoXNQoZFLxZXG9YxPcDejPWhF
         6g0RJGdsncTf2fQ33OSksPsZ5MKmm3FskpxpK+25GG72gAdEvGoaUT3tf4WsEGoJfk5+
         5Ek5+TlfW/AcgCf0BlOrFdCdx8bEDHXSK5Ta/QvZ0xkbuzKXZXEGAE6AsNHgZ0tmJlKf
         5RlN/+sRCNtKUgxyExxVZl2CRHL0TR4OOiAqrrYnsFO1RcDlCs1Ghxs8AMIQu3+H8vMq
         D0rn0eXycgK3mm2dG4ESJgahsyDR9wJpUM3tgOdzeku6d+pfuMAm9VRKXsoyWr1oZzKc
         BUWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si9287571qkb.46.2017.09.19.06.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 06:58:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duJ2L-00083V-3g
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 09:58:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1duJ1X-0007Sa-0a
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 09:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1duJ1S-0002pF-UL
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 09:57:15 -0400
Resent-Date: Tue, 19 Sep 2017 09:57:15 -0400
Resent-Message-Id: <E1duJ1S-0002pF-UL@eggs.gnu.org>
Received: from sender-of-o52.zoho.com ([135.84.80.217]:21495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1duJ1I-0002iT-25; Tue, 19 Sep 2017 09:57:00 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1505829408212714.5344483062594;
	Tue, 19 Sep 2017 06:56:48 -0700 (PDT)
In-Reply-To: <20170919125041.2153-1-f4bug@amsat.org>
Message-ID: <150582940762.57.11503092763565098162@69b6ddf88678>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Tue, 19 Sep 2017 06:56:48 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 135.84.80.217
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/input/lm832x: move LM8323
 declarations to input/keypad.h
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
	f4bug@amsat.org, qemu-arm@nongnu.org, balrogg@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4/z0wlOVcmO

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKU3ViamVjdDogW1FlbXUt
ZGV2ZWxdIFtQQVRDSF0gaHcvaW5wdXQvbG04MzJ4OiBtb3ZlIExNODMyMyBkZWNsYXJhdGlvbnMg
dG8gaW5wdXQva2V5cGFkLmgKTWVzc2FnZS1pZDogMjAxNzA5MTkxMjUwNDEuMjE1My0xLWY0YnVn
QGFtc2F0Lm9yZwpUeXBlOiBzZXJpZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25lbGluZSAkQkFTRS4uIHwg
d2MgLWwpCmZhaWxlZD0wCgpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQoKY29tbWl0cz0iJChnaXQgbG9nIC0t
Zm9ybWF0PSVIIC0tcmV2ZXJzZSAkQkFTRS4uKSIKZm9yIGMgaW4gJGNvbW1pdHM7IGRvCiAgICBl
Y2hvICJDaGVja2luZyBQQVRDSCAkbi8kdG90YWw6ICQoZ2l0IGxvZyAtbiAxIC0tZm9ybWF0PSVz
ICRjKS4uLiIKICAgIGlmICEgZ2l0IHNob3cgJGMgLS1mb3JtYXQ9ZW1haWwgfCAuL3NjcmlwdHMv
Y2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIC07IHRoZW4KICAgICAgICBmYWlsZWQ9MQogICAgICAg
IGVjaG8KICAgIGZpCiAgICBuPSQoKG4rMSkpCmRvbmUKCmV4aXQgJGZhaWxlZAo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4
ODcxMzM4NAplcnJvcjogUlBDIGZhaWxlZDsgY3VybCAxOCB0cmFuc2ZlciBjbG9zZWQgd2l0aCBv
dXRzdGFuZGluZyByZWFkIGRhdGEgcmVtYWluaW5nCmZhdGFsOiBUaGUgcmVtb3RlIGVuZCBodW5n
IHVwIHVuZXhwZWN0ZWRseQplcnJvcjogQ291bGQgbm90IGZldGNoIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3Qp
OgogIEZpbGUgIi91c3IvYmluL3BhdGNoZXciLCBsaW5lIDQ0MiwgaW4gdGVzdF9vbmUKICAgIGdp
dF9jbG9uZV9yZXBvKGNsb25lLCByWyJyZXBvIl0sIHJbImhlYWQiXSwgbG9nZikKICBGaWxlICIv
dXNyL2Jpbi9wYXRjaGV3IiwgbGluZSA0OCwgaW4gZ2l0X2Nsb25lX3JlcG8KICAgIHN0ZG91dD1s
b2dmLCBzdGRlcnI9bG9nZikKICBGaWxlICIvdXNyL2xpYjY0L3B5dGhvbjMuNi9zdWJwcm9jZXNz
LnB5IiwgbGluZSAyOTEsIGluIGNoZWNrX2NhbGwKICAgIHJhaXNlIENhbGxlZFByb2Nlc3NFcnJv
cihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yOiBDb21tYW5kICdb
J2dpdCcsICdyZW1vdGUnLCAnYWRkJywgJy1mJywgJy0tbWlycm9yPWZldGNoJywgJzNjOGNmNWE5
YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQnLCAnaHR0cHM6Ly9naXRodWIuY29tL3Bh
dGNoZXctcHJvamVjdC9xZW11J10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDEuCgoK
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQGZy
ZWVsaXN0cy5vcmc=

