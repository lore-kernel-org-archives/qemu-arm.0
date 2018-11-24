Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3070918wrt;
        Sat, 24 Nov 2018 00:51:38 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WgP575Q/B47g7Hj1RaJN2vtMEPHnqyo+vqS2eOChO9CXotuPCarA21D3hm1vhmW+vQJSW3
X-Received: by 2002:a25:3a47:: with SMTP id h68-v6mr19202010yba.495.1543049498335;
        Sat, 24 Nov 2018 00:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543049498; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrepPUyUuIWGphxVrWzlcjUkpnLdgr0aSFXICZ7It5+YQqZBMEaTyAgTDBK5evb6/4
         1r/ynt4q9PFbsBpdvhrOyshGP8Z8wo0y03GAoJuj+WDPs4QOOsT61DbwlvQbWLItLnSY
         EbSWsPGBa6rut1SuKjBRgwoGavsrbt0p/l29dkT1sVqr0LDib8f3CxWlKfE+DlcrbVk4
         wlGA+HqPwXFKQ421Ro1CodTql3bV6ceNq5j4cwwU4ORZzUlLgWyyf3ZL/IyJmYsb2lrF
         pxPSfxu+3BUTMTC2Ur9e8gbEs0mbby3/rhfgs4Z6CiWkyps00nY1GcBMGgWx7BBmxWa5
         lZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=Ze6XrXFrDfMOPMzJ6uv7i8mS61VTYxgUwrR0yTgmOv8=;
        b=wUEqrCqIyDQH0qxogVWcu8jPZFreldEVIO0MWKodTWhtc1ssRdufeJjdXW5zLYsS7C
         Ty07TWhGjmp1OtfP49cjvO1Dr0Gpuod2a/44i79tMZfnbdiq74L4SyrOFZGUQMV6diEn
         UOmlg7WqrzcLQGinVVosbI388SWRBJL6N8O01mC1W//vcy+isO8wIs+ootBkdjf1JLIe
         nh8I9iyimrwQlFWvOg+dZd7nt6RiByBKmDfkKHB9w92cyFm9f40rKbs9h88dRNRmslm9
         Cnd39s2Xe3yvjozMxssrhrioEcLu5SvV8yptpn3j8XzSduM21vwgNtQjLl+aHRsT8/a4
         ww3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c124si5056243ywf.270.2018.11.24.00.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTf7-0004dA-Qm
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:51:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTUP-0002j7-L0
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:40:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTOr-0000n4-QT
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:34:55 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:53000 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTOj-0000gx-MY; Sat, 24 Nov 2018 03:34:42 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3AC7F4AD9911B2B6562A;
	Sat, 24 Nov 2018 16:34:37 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
	by mse01.zte.com.cn with SMTP id wAO8YVQG033327;
	Sat, 24 Nov 2018 16:34:31 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp05[null]) by mapi (Zmail) with MAPI id mid14;
	Sat, 24 Nov 2018 16:34:33 +0800 (CST)
Date: Sat, 24 Nov 2018 16:34:33 +0800 (CST)
X-Zmail-TransId: 2b075bf90d1987bc37d6
X-Mailer: Zmail v1.0
Message-ID: <201811241634336661843@zte.com.cn>
In-Reply-To: <1543077273-16201-10-git-send-email-peng.hao2@zte.com.cn>
References: 1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn,
	1543077273-16201-10-git-send-email-peng.hao2@zte.com.cn
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>, <philmd@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wAO8YVQG033327
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_10/10=5D__pvpanic_=3A_update_pvpan?=
 =?utf-8?q?ic_document?=
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: usNWV4Iinqdo



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SSdtIHNvcnJ5IHRvIHNlbnQgcGF0Y2hlcyB3aXRoIHVubW9kaWZpZWQgdGl0bGUuIApQbGVhc2Ug
aWdub3JlIHBhdGNoIDEtMTAuIEkgd2lsbCByZS1zZW5kLgo+QWRkIG1taW8gc3VwcG9ydCBpbmZv
IGluIGRvY3Mvc3BlY3MvcHZwYW5pYy50eHQuCj4KPlNpZ25lZC1vZmYtYnk6IFBlbmcgSGFvIDxw
ZW5nLmhhbzJAenRlLmNvbS5jbj4KPi0tLQo+ZG9jcy9zcGVjcy9wdnBhbmljLnR4dCB8IDE4ICsr
KysrKysrKysrKysrKy0tLQo+MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL3B2cGFuaWMudHh0IGIvZG9jcy9z
cGVjcy9wdnBhbmljLnR4dAo+aW5kZXggYzdiYmFjYy4uMmQwNmVlNSAxMDA2NDQKPi0tLSBhL2Rv
Y3Mvc3BlY3MvcHZwYW5pYy50eHQKPisrKyBiL2RvY3Mvc3BlY3MvcHZwYW5pYy50eHQKPkBAIC0x
LDE0ICsxLDE4IEBACj5QVlBBTklDIERFVklDRQo+PT09PT09PT09PT09PT0KPi1wdnBhbmljIGRl
dmljZSBpcyBhIHNpbXVsYXRlZCBJU0EgZGV2aWNlLCB0aHJvdWdoIHdoaWNoIGEgZ3Vlc3QgcGFu
aWMKPi1ldmVudCBpcyBzZW50IHRvIHFlbXUsIGFuZCBhIFFNUCBldmVudCBpcyBnZW5lcmF0ZWQu
IFRoaXMgYWxsb3dzCj4rcHZwYW5pYyBkZXZpY2UgaXMgYSBzaW11bGF0ZWQgSVNBL1N5c0J1cyBk
ZXZpY2UsIHRocm91Z2ggd2hpY2ggYSBndWVzdAo+K3BhbmljIGV2ZW50IGlzIHNlbnQgdG8gcWVt
dSwgYW5kIGEgUU1QIGV2ZW50IGlzIGdlbmVyYXRlZC4gVGhpcyBhbGxvd3MKPm1hbmFnZW1lbnQg
YXBwcyAoZS5nLiBsaWJ2aXJ0KSB0byBiZSBub3RpZmllZCBhbmQgcmVzcG9uZCB0byB0aGUgZXZl
bnQuCj4tVGhlIG1hbmFnZW1lbnQgYXBwIGhhcyB0aGUgb3B0aW9uIG9mIHdhaXRpbmcgZm9yIEdV
RVNUX1BBTklDS0VEIGV2ZW50cywKPitUaGUgbWE6d3FuYWdlbWVudCBhcHAgaGFzIHRoZSBvcHRp
b24gb2Ygd2FpdGluZyBmb3IgR1VFU1RfUEFOSUNLRUQgZXZlbnRzLAo+YW5kL29yIHBvbGxpbmcg
Zm9yIGd1ZXN0LXBhbmlja2VkIFJ1blN0YXRlLCB0byBsZWFybiB3aGVuIHRoZSBwdnBhbmljCj5k
ZXZpY2UgaGFzIGZpcmVkIGEgcGFuaWMgZXZlbnQuCj4rV2hlbiBwdnBhbmljIGRldmljZSBpcyBp
bXBsZW1lbnRlZCBhcyBhIElTQSBkZXZpY2UsIGl0IHN1cHBvcnRzIElPUE9SVAo+K21vZGUuIFNp
bmNlIFFFTVUgdjMuMiBwdnBhbmljIGFsc28gc3VwcG9ydHMgTU1JTyBtb2RlLCBpdCB3aWxsIGJl
Cj4raW1wbGVtZW50ZWQgYXMgYSBTWVNCVVMgZGV2aWNlLgo+Kwo+SVNBIEludGVyZmFjZQo+LS0t
LS0tLS0tLS0tLQo+QEAgLTE5LDYgKzIzLDE0IEBAIFNvZnR3YXJlIHNob3VsZCBzZXQgb25seSBi
aXRzIGJvdGggaXRzZWxmIGFuZCB0aGUgZGV2aWNlIHJlY29nbml6ZS4KPkN1cnJlbnRseSwgb25s
eSBiaXQgMCBpcyByZWNvZ25pemVkLCBzZXR0aW5nIGl0IGluZGljYXRlcyBhIGd1ZXN0IHBhbmlj
Cj5oYXMgaGFwcGVuZWQuCj4rU1lTQlVTIEludGVyZmFjZQo+Ky0tLS0tLS0tLS0tLS0tLS0KPisK
PitUaGUgU1lTQlVTIGludGVyZmFjZSBpcyBzaW1pbGFyIHRvIHRoZSBJU0EgaW50ZXJmYWNlIGV4
Y2VwdCB0aGF0IGl0IHVzZXMKPitNTUlPLiBGb3IgZXhhbXBsZSwgdGhlIGFybSB2aXJ0IG1hY2hp
bmUgY291bGQgcHV0IHRoZSBwdnBhbmljIGRldmljZSBhdAo+K1sweDkwNzAwMDAsIDB4OTA3MDAw
MV0gYW5kIGN1cnJlbnRseSBvbmx5IHRoZSBmaXJzdCBieXRlIGlzIHVzZWQuCj4rCj4rCj5BQ1BJ
IEludGVyZmFjZQo+LS0tLS0tLS0tLS0tLS0KPi0tCj4xLjguMy4x


--=====_003_next=====--

--=====_001_next=====--

