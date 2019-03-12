Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp120068wrs;
        Mon, 11 Mar 2019 23:23:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJKn41ZT4AM2YQKHVlENq4NcJq06zmHt9Gj+OC1tNBNXpzXR6VcVCASmhfI6BvYz8V0XRw
X-Received: by 2002:a25:8148:: with SMTP id j8mr29733935ybm.202.1552371788738;
        Mon, 11 Mar 2019 23:23:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si4356095ybf.280.2019.03.11.23.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 23:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:45938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3aoe-0004Do-6S
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 02:23:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h3aoS-0004DV-Ac
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 02:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h3aoP-0005dN-AF
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 02:22:56 -0400
Resent-Date: Tue, 12 Mar 2019 02:22:56 -0400
Resent-Message-Id: <E1h3aoP-0005dN-AF@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h3aoP-0005cd-10; Tue, 12 Mar 2019 02:22:53 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1552371748; cv=none; d=zoho.com; s=zohoarc; 
	b=Is5IzUGvoXdYqr9XPaL9Xd9LZnXucLgioRILEq/3ljKawmICt8MUWS+KswK19or5OxhaNyc2w1EQsUgY4lvMBEoGe+dOYCTRZOHQv4d1E3Oa1BBmAcP/c+Am99jnSo5Stu59FCLXD1xe1vzBmqzO9PkB0Zz5GrRXSG5bHcX7gNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1552371748;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=7VZU4W172//vVLvoKsZhRsue0UaZPXrzw3LZQqqLTeg=; 
	b=S7mDabQtAZJnu3MZEYStIPAJYn2rArweGW/yuormtfFGiia35sIsmNQyAiUZ4khTWKgN9dPqobuKRvcNN6eGX7TnPbCCHdGsue0phcfydZ4y9MSU/YGn5qcS7V8BrzA5ZIWBQ0JEA9TwUESr0NEGVQa8H+geNlCliMARrXa69d4=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 15523717464231009.23818893593;
	Mon, 11 Mar 2019 23:22:26 -0700 (PDT)
Message-ID: <155237174511.17434.10843082675899599446@6acff2cf482b>
In-Reply-To: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: guoheyi@huawei.com
Date: Mon, 11 Mar 2019 23:22:26 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] arm/cpu: fix soft lockup panic
 after resuming from stop
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
Cc: fam@euphon.net, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, guoheyi@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yo0t9WKhWdkb

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTUyMzcwOTYwLTIwNjEtMS1n
aXQtc2VuZC1lbWFpbC1ndW9oZXlpQGh1YXdlaS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFp
bGVkIHRoZSBkb2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0
ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tl
ciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1t
aW5nd0BmZWRvcmEgU0hPV19FTlY9MSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKICBDQyAgICAgIGFhcmNoNjQtc29mdG1tdS90cmFjZS9nZW5lcmF0ZWQtaGVscGVycy5v
CiAgQ0MgICAgICBhYXJjaDY0LXNvZnRtbXUvdGFyZ2V0L2FybS90cmFuc2xhdGUtc3ZlLm8KL3Rt
cC9xZW11LXRlc3Qvc3JjL3RhcmdldC9hcm0vY3B1LmM6IEluIGZ1bmN0aW9uICdnZXRfdmNwdV90
aW1lcl90aWNrJzoKL3RtcC9xZW11LXRlc3Qvc3JjL3RhcmdldC9hcm0vY3B1LmM6OTAyOjI0OiBl
cnJvcjogc3RvcmFnZSBzaXplIG9mICdyZWcnIGlzbid0IGtub3duCiAgICAgc3RydWN0IGt2bV9v
bmVfcmVnIHJlZzsKICAgICAgICAgICAgICAgICAgICAgICAgXn5+Ci90bXAvcWVtdS10ZXN0L3Ny
Yy90YXJnZXQvYXJtL2NwdS5jOjkwNDoxNDogZXJyb3I6ICdLVk1fUkVHX0FSTV9USU1FUl9DTlQn
IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAgIHJlZy5pZCA9IEtW
TV9SRUdfQVJNX1RJTUVSX0NOVDsKICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4K
L3RtcC9xZW11LXRlc3Qvc3JjL3RhcmdldC9hcm0vY3B1LmM6OTA0OjE0OiBub3RlOiBlYWNoIHVu
ZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rp
b24gaXQgYXBwZWFycyBpbgovdG1wL3FlbXUtdGVzdC9zcmMvdGFyZ2V0L2FybS9jcHUuYzo5MDc6
MzA6IGVycm9yOiAnS1ZNX0dFVF9PTkVfUkVHJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKICAgICBlcnIgPSBrdm1fdmNwdV9pb2N0bChjcywgS1ZNX0dFVF9PTkVfUkVH
LCAmcmVnKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Ci90
bXAvcWVtdS10ZXN0L3NyYy90YXJnZXQvYXJtL2NwdS5jOjkwMjoyNDogZXJyb3I6IHVudXNlZCB2
YXJpYWJsZSAncmVnJyBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVdCiAgICAgc3RydWN0IGt2bV9v
bmVfcmVnIHJlZzsKICAgICAgICAgICAgICAgICAgICAgICAgXn5+Ci90bXAvcWVtdS10ZXN0L3Ny
Yy90YXJnZXQvYXJtL2NwdS5jOiBJbiBmdW5jdGlvbiAnc2V0X3ZjcHVfdGltZXJfdGljayc6Ci90
bXAvcWVtdS10ZXN0L3NyYy90YXJnZXQvYXJtL2NwdS5jOjkxNDoyNDogZXJyb3I6IHN0b3JhZ2Ug
c2l6ZSBvZiAncmVnJyBpc24ndCBrbm93bgogICAgIHN0cnVjdCBrdm1fb25lX3JlZyByZWc7CiAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fgovdG1wL3FlbXUtdGVzdC9zcmMvdGFyZ2V0L2FybS9j
cHUuYzo5MTY6MTQ6IGVycm9yOiAnS1ZNX1JFR19BUk1fVElNRVJfQ05UJyB1bmRlY2xhcmVkIChm
aXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKICAgICByZWcuaWQgPSBLVk1fUkVHX0FSTV9USU1F
Ul9DTlQ7CiAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+Ci90bXAvcWVtdS10ZXN0
L3NyYy90YXJnZXQvYXJtL2NwdS5jOjkxOTozMDogZXJyb3I6ICdLVk1fU0VUX09ORV9SRUcnIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogICAgIGVyciA9IGt2bV92Y3B1
X2lvY3RsKGNzLCBLVk1fU0VUX09ORV9SRUcsICZyZWcpOwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn4KL3RtcC9xZW11LXRlc3Qvc3JjL3RhcmdldC9hcm0vY3B1
LmM6OTE0OjI0OiBlcnJvcjogdW51c2VkIHZhcmlhYmxlICdyZWcnIFstV2Vycm9yPXVudXNlZC12
YXJpYWJsZV0KICAgICBzdHJ1Y3Qga3ZtX29uZV9yZWcgcmVnOwogICAgICAgICAgICAgICAgICAg
ICAgICBefn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzE1NTIzNzA5
NjAtMjA2MS0xLWdpdC1zZW5kLWVtYWlsLWd1b2hleWlAaHVhd2VpLmNvbS90ZXN0aW5nLmRvY2tl
ci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0
aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3Vy
IGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

