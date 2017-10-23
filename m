Received: by 10.223.197.9 with SMTP id q9csp10629112wrf;
        Mon, 23 Oct 2017 07:41:14 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RmDTANjgo6f/cDK5nUWtqrK25bVCf9Ox7WOGHXrQWHdmyQzw8puGxu0PYEuqNFIj/b0E16
X-Received: by 10.37.190.208 with SMTP id k16mr1456431ybm.348.1508769674827;
        Mon, 23 Oct 2017 07:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508769674; cv=none;
        d=google.com; s=arc-20160816;
        b=E9qnDVGH1/jJ5tFinGYqihu71Nb4zL/o02KUCb7NzGIEUhvK/tqVY1xL4LAlJJuo+p
         hGxvJNrcrxXgJejOFcat+pR0SfLbH7qJ5nkTBMgVh1D7HCHbsu/Pif4WY9koYslC4ClO
         bAJGCmWGlq1Di4NCbkSE2H3ZtkSnUpbk5DActQe/2aB6v4H92EHLjxrUA4Jva8lzR2Ue
         XQtTBpS9EQfj6mYNqS25JWlICn72abEdnfWejCqBo8q1w+I+IdfdacHouSNey43NVolI
         MTlULgJGyYgTwMwbg2Aox/Aet6AdFBNeDd+aUL1X7pPUdhVNgUqTAiTzN7JtT0QfbS2T
         E1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:arc-authentication-results;
        bh=FtwRQgVtyNqjq7JuIHvwHMV9fRoYIi1hBy2Z/cH3V2s=;
        b=Fp3BzQ9EefNod30soRxzgaF/YQmTDOAIwsuacFoIL9NTq4/6LtEAeiOwiGNYVC+RFj
         K/nrQqpLxl+1znT47PLDFDojii5PwdDdFL8YtNrIOHZx7ZcZ7OVUvlNlWhDqbV3QN9Bh
         E6y4uPi2R1OCMQKn/o2WNwImEebF2OJbzIC7yCmCEJNHjWawtshH3cEO21mCwnrqWXkM
         fa/fMyctu5zSzhi9cCSx/xafAXzn9jO7xoeSbHjlYXAgmPERCL64vC1HXbMsvioUFgCT
         P4CFe3h0PnU9KgXc8/sepeGLt8jTjdfqCL1ef3/JM5pnJX/QmAwUwB2ApgPpgluorZwm
         pibg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l129si1300828ywg.366.2017.10.23.07.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 07:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6duk-0003V8-AU
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 10:41:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1e6duU-0003RG-6l
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1e6duR-0001gG-2o
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:40:58 -0400
Received: from mail-c.ads.isi.edu ([128.9.180.198]:20204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1e6duQ-0001fX-Om
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 10:40:54 -0400
X-IronPort-AV: E=Sophos;i="5.43,423,1503385200"; d="scan'208,217";a="2149144"
Received: from usmdrmbx01.ads.isi.edu ([10.100.2.77])
	by usmdrip03-mgmt.ads.isi.edu with ESMTP; 23 Oct 2017 07:40:51 -0700
Received: from usarlmbx01.ads.isi.edu (10.13.52.77) by usmdrmbx01.ads.isi.edu
	(10.100.2.77) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 23 Oct 2017 07:40:51 -0700
Received: from usarlmbx01.ads.isi.edu (10.13.52.77) by usarlmbx01.ads.isi.edu
	(10.13.52.77) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 23 Oct 2017 07:40:49 -0700
Received: from usarlmbx01.ads.isi.edu ([fe80::5517:873:48d1:b0d1]) by
	usarlmbx01.ads.isi.edu ([fe80::5517:873:48d1:b0d1%17]) with mapi id
	15.01.1261.035; Mon, 23 Oct 2017 07:40:49 -0700
From: Dong-In Kang <dkang@isi.edu>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Is Cortex-R8 support planned?
Thread-Index: AQHTTAzrfmleDsMNxkyr+k/F5i5fnw==
Date: Mon, 23 Oct 2017 14:40:49 +0000
Message-ID: <42FB6EFE-F20A-42CF-8782-D8611FA79000@isi.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.9.47.101]
Content-Type: multipart/alternative;
	boundary="_000_42FB6EFEF20A42CF8782D8611FA79000isiedu_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 128.9.180.198
Subject: [Qemu-arm] Is Cortex-R8 support planned?
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iEGwKbSqy2oj

--_000_42FB6EFEF20A42CF8782D8611FA79000isiedu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpIZWxsbywNCg0KSSBrbm93IHRoZXJlIGlzIG5vIHN1cHBvcnQgZm9yIENvcnRleC1SOCBndWVz
dCBhcmNoaXRlY3R1cmUgbm93Lg0KSXMgaXQgcGxhbm5lZD8NCkhvdyBtdWNoIG1hbi1ob3VyIHdv
dWxkIGJlIG5lZWRlZCB0byBpbXBsZW1lbnQgQ29ydGV4LVI4IHN1cHBvcnQgZm9yIFFlbXU/DQoN
ClRoYW5rcywNCkRhdmlkDQoNCg==

--_000_42FB6EFEF20A42CF8782D8611FA79000isiedu_
Content-Type: text/html; charset="utf-8"
Content-ID: <E382C266A6A5C146AEEC2F225A1F47FA@ads.isi.edu>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iVGl0bGUiIGNvbnRlbnQ9IiI+DQo8bWV0YSBuYW1lPSJLZXl3b3JkcyIgY29udGVu
dD0iIj4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUg
KGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxlPjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8N
CkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0
IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiLrp5HsnYAg6rOg
65SVIjt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAx
NSA1IDIgMiAyIDQgMyAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFs
LCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90
dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseTpDYWxpYnJpO30N
CmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNv
bG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNw
YW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9y
OiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUx
Nw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OkNhbGli
cmk7DQoJY29sb3I6d2luZG93dGV4dDt9DQpzcGFuLm1zb0lucw0KCXttc28tc3R5bGUtdHlwZTpl
eHBvcnQtb25seTsNCgltc28tc3R5bGUtbmFtZToiIjsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJs
aW5lOw0KCWNvbG9yOnRlYWw7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhw
b3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6Q2FsaWJyaTt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7
c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVh
ZD4NCjxib2R5IGJnY29sb3I9IndoaXRlIiBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxp
bms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+SGVsbG8sPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5J
IGtub3cgdGhlcmUgaXMgbm8gc3VwcG9ydCBmb3IgQ29ydGV4LVI4IGd1ZXN0IGFyY2hpdGVjdHVy
ZSBub3cuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPklzIGl0IHBsYW5uZWQ/PG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PkhvdyBtdWNoIG1hbi1ob3VyIHdvdWxkIGJlIG5lZWRlZCB0byBpbXBsZW1lbnQgQ29ydGV4LVI4
IHN1cHBvcnQgZm9yIFFlbXU/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij5UaGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkRhdmlkPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_42FB6EFEF20A42CF8782D8611FA79000isiedu_--
