Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp460862wrq;
        Wed, 13 Jun 2018 02:53:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIApWCyr1LbDfaiEZ4/Joco0xSdrYEtFviSvbK2xGfDTjQJCuin0aP/s21PTqNvGeuyp+7d
X-Received: by 2002:ac8:2b4e:: with SMTP id 14-v6mr3826052qtv.412.1528883602394;
        Wed, 13 Jun 2018 02:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528883602; cv=none;
        d=google.com; s=arc-20160816;
        b=qqKRqudW3nrNy0IAeUhKu8ocVQEEKJdm4DnaIAmQsz3vcr0nWagf8q4Odcehzf8FGf
         KhSkemINPBkrE8y4LJXxeHeAr/hQVE6lpkXlUXoTVsBz3LAIQvdB22mHaVIJPtwo2Qtm
         tx+4pP7I1AIYW7RZYEM9RAVLH+mzyfZQSdBwMCt7Ay5eFmcwMyxI6+xd0UoOWjQ3wKk6
         8GOBUJLXCU+lGS3Y98PS18uATXkSEEcT4HC3SSYFzpfsuihHM+9aYaiF95yHxbGy3NNo
         Wjfj8HLMgWbck4GutG1NTlwv2QTc2Y7nS9GVD/9JSm2DiptdtkbVf3mX7lKhwYVF8aHo
         g/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=oCc2ViWcvzL45W1A4mLp0tjEffXzRjg99vEVlOejQYY=;
        b=iJY8xo7dGxOoT8o6kXWzh8d2jY3rp6wdQj6YhZcgc4SKVSf5pCEIR5rXWf9iAD41/N
         edu1Nhk03PcYFDEf8t5fhM1tg+CcX6hAky/Rsfjml26p31KosRe6fsYcne5p0LrhsvA2
         P5H6dyaXB6nb0/dewX5klhpnQKtB1KncGCxGAstjy+9PH+CD1xPXmSEWZ65YAK4dnqOG
         T2fnDz/kUG09xrqoM9HdTpgrC4wiT2M0gIiorjySuXkvl6JK2gor3m3r42+8Gar8qaxM
         nBsmz6XAXlEh1SILGD7GrshBwxRCOF8BYDElk+HIgJaS6blgiJLYejJFD09CoNW+Z+3K
         v/gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j21-v6si2270062qtf.310.2018.06.13.02.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 02:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT2Sv-00035A-T8
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 05:53:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fT2Sl-000345-7o
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 05:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fT2Sk-0003a7-2D
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 05:53:11 -0400
Resent-Date: Wed, 13 Jun 2018 05:53:11 -0400
Resent-Message-Id: <E1fT2Sk-0003a7-2D@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fT2Sj-0003ZU-Ov
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 05:53:09 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1528882659043304.8417518524968;
	Wed, 13 Jun 2018 02:37:39 -0700 (PDT)
In-Reply-To: <20180613084149.14523-1-kraxel@redhat.com>
Message-ID: <152888265822.690.4484858613612453007@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Wed, 13 Jun 2018 02:37:39 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/3] ramfb: simple boot
 framebuffer
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
Cc: peter.maydell@linaro.org, famz@redhat.com, ehabkost@redhat.com,
	mst@redhat.com, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	kraxel@redhat.com, pbonzini@redhat.com, lersek@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qT9r1ab0wnbO

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDIwMTgwNjEzMDg0MTQ5LjE0NTIzLTEta3JheGVsQHJlZGhhdC5jb20KU3ViamVj
dDogW1FlbXUtZGV2ZWxdIFtQQVRDSCB2NCAwLzNdIHJhbWZiOiBzaW1wbGUgYm9vdCBmcmFtZWJ1
ZmZlcgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAoKQkFTRT1iYXNlCm49
MQp0b3RhbD0kKGdpdCBsb2cgLS1vbmVsaW5lICRCQVNFLi4gfCB3YyAtbCkKZmFpbGVkPTAKCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dy
YW0KCmNvbW1pdHM9IiQoZ2l0IGxvZyAtLWZvcm1hdD0lSCAtLXJldmVyc2UgJEJBU0UuLikiCmZv
ciBjIGluICRjb21taXRzOyBkbwogICAgZWNobyAiQ2hlY2tpbmcgUEFUQ0ggJG4vJHRvdGFsOiAk
KGdpdCBsb2cgLW4gMSAtLWZvcm1hdD0lcyAkYykuLi4iCiAgICBpZiAhIGdpdCBzaG93ICRjIC0t
Zm9ybWF0PWVtYWlsIHwgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayAtOyB0aGVu
CiAgICAgICAgZmFpbGVkPTEKICAgICAgICBlY2hvCiAgICBmaQogICAgbj0kKChuKzEpKQpkb25l
CgpleGl0ICRmYWlsZWQKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5
YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20v
cGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy8x
NTI4ODc5NzIzLTI0Njc1LTEtZ2l0LXNlbmQtZW1haWwtZXJpYy5hdWdlckByZWRoYXQuY29tIC0+
IHBhdGNoZXcvMTUyODg3OTcyMy0yNDY3NS0xLWdpdC1zZW5kLWVtYWlsLWVyaWMuYXVnZXJAcmVk
aGF0LmNvbQogdCBbdGFnIHVwZGF0ZV0gICAgICAgICAgICBwYXRjaGV3LzIwMTgwNjEyMjIxOTIz
LjI0NDY5LTEtbWRyb3RoQGxpbnV4LnZuZXQuaWJtLmNvbSAtPiBwYXRjaGV3LzIwMTgwNjEyMjIx
OTIzLjI0NDY5LTEtbWRyb3RoQGxpbnV4LnZuZXQuaWJtLmNvbQogdCBbdGFnIHVwZGF0ZV0gICAg
ICAgICAgICBwYXRjaGV3LzIwMTgwNjEzMDY1NzA3LjMwNzY2LTEtZGF2aWRAZ2lic29uLmRyb3Bi
ZWFyLmlkLmF1IC0+IHBhdGNoZXcvMjAxODA2MTMwNjU3MDcuMzA3NjYtMS1kYXZpZEBnaWJzb24u
ZHJvcGJlYXIuaWQuYXUKICogW25ldyB0YWddICAgICAgICAgICAgICAgcGF0Y2hldy8yMDE4MDYx
MzA4NDE0OS4xNDUyMy0xLWtyYXhlbEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAxODA2MTMwODQx
NDkuMTQ1MjMtMS1rcmF4ZWxAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCmEzZjYyODk3MDMgaHcvdmZpby9kaXNwbGF5OiBhZGQgcmFtZmIgc3VwcG9ydAplOTI4MzY0
ZmRlIGh3L2Rpc3BsYXk6IGFkZCBzdGFuZGFsb25lIHJhbWZiIGRldmljZQoyNzE0OTRhMTc0IGh3
L2Rpc3BsYXk6IGFkZCByYW1mYiwgYSBzaW1wbGUgYm9vdCBmcmFtZWJ1ZmZlciBsaXZpbmcgaW4g
Z3Vlc3QgcmFtCgo9PT0gT1VUUFVUIEJFR0lOID09PQpDaGVja2luZyBQQVRDSCAxLzM6IGh3L2Rp
c3BsYXk6IGFkZCByYW1mYiwgYSBzaW1wbGUgYm9vdCBmcmFtZWJ1ZmZlciBsaXZpbmcgaW4gZ3Vl
c3QgcmFtLi4uCldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMg
TUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzQxOiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCnRv
dGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMTA5IGxpbmVzIGNoZWNrZWQKCllvdXIgcGF0Y2gg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KQ2hlY2tpbmcgUEFUQ0ggMi8zOiBody9kaXNwbGF5
OiBhZGQgc3RhbmRhbG9uZSByYW1mYiBkZXZpY2UuLi4KV0FSTklORzogYWRkZWQsIG1vdmVkIG9y
IGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojNzE6IApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxNDEgbGlu
ZXMgY2hlY2tlZAoKWW91ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgpDaGVja2lu
ZyBQQVRDSCAzLzM6IGh3L3ZmaW8vZGlzcGxheTogYWRkIHJhbWZiIHN1cHBvcnQuLi4KRVJST1I6
IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAoj
MzE6IEZJTEU6IGh3L3ZmaW8vZGlzcGxheS5jOjE4NzoKKyAgICBpZiAoc3RyY21wKG9iamVjdF9n
ZXRfdHlwZW5hbWUoT0JKRUNUKHZkZXYpKSwgInZmaW8tcGNpLXJhbWZiIikgPT0gMCkKWy4uLl0K
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzUwOiBGSUxFOiBody92ZmlvL2Rpc3BsYXkuYzozMTE6CisgICAgaWYgKHN0cmNtcChv
YmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVDVCh2ZGV2KSksICJ2ZmlvLXBjaS1yYW1mYiIpID09IDAp
ClsuLi5dCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3MsIDcyIGxpbmVzIGNoZWNrZWQKCllv
dXIgcGF0Y2ggaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoK
VGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1
dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

