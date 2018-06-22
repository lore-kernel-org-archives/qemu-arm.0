Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp873803wrq;
        Fri, 22 Jun 2018 07:06:04 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLLXlSBt4Za6G+FGTEpz0lD/MJ8LpVy3F9EHB3gq+Mfv70ET+i+vivy2EhVOmIclbXZN3eg
X-Received: by 2002:ac8:3916:: with SMTP id s22-v6mr1474140qtb.407.1529676364268;
        Fri, 22 Jun 2018 07:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529676364; cv=none;
        d=google.com; s=arc-20160816;
        b=IJ/On46ESFgFnCdRHzZthc9vqaayLssA0Tpbfe1M+n2+HszdSEoBAtbcGNuFV0QTKk
         v9lSHASGei+SJ6OtInFujEJqh7i4aJud7qUXvcVRYsh0XXTQ8p5vpv1W3dAIdCqr2Jmi
         nqYbO7jbHKA77YMS3/x+VyGeOXbxOqwWcJT8+z4U9bM9CZ5VSiIWVNWRHx80N3xLSOD9
         7MJ8W8Ti0GOxICTKH5Q9zSZ6qEnTHts+Tm3dB3qbvP48R1fk7pgTKh9r9NPXmkRaEoec
         IM4S6o1b5OXXgen1II8TI5iog05bOo4fWYZsMmk05tZJV+WxACgsRCCWq/7GiY1WHwoC
         aRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=rcWU10J2b0FZn34EDqrWO+Pzi/RI3trE2EyX7Uxpf2w=;
        b=bwhqqqIKZo/6XodNNrz0yYuPO3eC8PmGC7ZEqFhwf6sRNodPWSUgY/yJBNuBIkAxpT
         ZIbbAowmbJCgXhXIt856+YRWYgZqaRkOEE9BD3Yq1j2xHQiLIQRKsqOUTHxCRxWPiyg8
         GqcFykCMkGH5plfYwT20SNE3ovwtARrbRCNmQvH86x1WR3DRE5pRpsiRke8oN36D4ReS
         sDiA9lmXNvS3Au4WKfflZLjdcZPht6xRGa5lZP1mEzrPuqQ4a5o5IVS7NWXZH4b3WriK
         3SCCKXTgxh3XRzwlcc3z6ZADgsKajP2rwQXP7ZHJY2MPnLlLr//hyyefh4dAeI701gm+
         KU4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d21-v6si375537qte.7.2018.06.22.07.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 07:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMhP-0000pt-R2
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 10:06:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fWMfw-0008Uh-2U
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 10:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fWMfs-00041V-T1
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 10:04:32 -0400
Resent-Date: Fri, 22 Jun 2018 10:04:32 -0400
Resent-Message-Id: <E1fWMfs-00041V-T1@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fWMfs-00041K-Jc
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 10:04:28 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1529673532285134.88568297211668;
	Fri, 22 Jun 2018 06:18:52 -0700 (PDT)
In-Reply-To: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
Message-ID: <152967353172.876.8679943897946809404@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: hongbo.zhang@linaro.org
Date: Fri, 22 Jun 2018 06:18:52 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: fix psci conduit in acpi when
 el3 enabled
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	qemu-devel@nongnu.org, hongbo.zhang@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RH+VrSOujWr3

SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE1Mjk2NjM4MjctMjg4NTQtMS1naXQtc2VuZC1lbWFpbC1ob25nYm8uemhhbmdA
bGluYXJvLm9yZwpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIXSBody9hcm0vdmlydDogZml4
IHBzY2kgY29uZHVpdCBpbiBhY3BpIHdoZW4gZWwzIGVuYWJsZWQKCj09PSBURVNUIFNDUklQVCBC
RUdJTiA9PT0KIyEvYmluL2Jhc2gKCkJBU0U9YmFzZQpuPTEKdG90YWw9JChnaXQgbG9nIC0tb25l
bGluZSAkQkFTRS4uIHwgd2MgLWwpCmZhaWxlZD0wCgpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCgpjb21taXRzPSIkKGdpdCBsb2cg
LS1mb3JtYXQ9JUggLS1yZXZlcnNlICRCQVNFLi4pIgpmb3IgYyBpbiAkY29tbWl0czsgZG8KICAg
IGVjaG8gIkNoZWNraW5nIFBBVENIICRuLyR0b3RhbDogJChnaXQgbG9nIC1uIDEgLS1mb3JtYXQ9
JXMgJGMpLi4uIgogICAgaWYgISBnaXQgc2hvdyAkYyAtLWZvcm1hdD1lbWFpbCB8IC4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgLTsgdGhlbgogICAgICAgIGZhaWxlZD0xCiAgICAg
ICAgZWNobwogICAgZmkKICAgIG49JCgobisxKSkKZG9uZQoKZXhpdCAkZmFpbGVkCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMzE3YTBjYzg0NyBody9h
cm0vdmlydDogZml4IHBzY2kgY29uZHVpdCBpbiBhY3BpIHdoZW4gZWwzIGVuYWJsZWQKCj09PSBP
VVRQVVQgQkVHSU4gPT09CkNoZWNraW5nIFBBVENIIDEvMTogaHcvYXJtL3ZpcnQ6IGZpeCBwc2Np
IGNvbmR1aXQgaW4gYWNwaSB3aGVuIGVsMyBlbmFibGVkLi4uCkVSUk9SOiB0cmFpbGluZyB3aGl0
ZXNwYWNlCiMyNzogRklMRTogaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jOjcyMToKKyAgICAgICAg
ICovICQKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTIgbGluZXMgY2hlY2tlZAoKWW91
ciBwYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

