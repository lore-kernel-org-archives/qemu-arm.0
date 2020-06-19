Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp488494lfm;
        Fri, 19 Jun 2020 04:21:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMT04eRqSoZQgeYcMJpxjEbvjkeXZVPWQdZgxJjieijlNgcNmf6tcWSl6EDCcWuUTLckjr
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr4855294ybj.502.1592565678905;
        Fri, 19 Jun 2020 04:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592565678; cv=none;
        d=google.com; s=arc-20160816;
        b=fQTmpumLWPhcPpZwyCYocwQUbbpg1BUQ9bRejCro/4bmAnypU7bo4tHC4umn8nOYRW
         ZjrQfxMmbW/BwnQyMclHnzXcNJdU94ULVTG1byL6zjDdEQrK37u96jiBcIwTZS5B4nwE
         8j9P21vmopSxK/f6N0wj3YkbsusE6Wpgk0AxiBcugNExYZba8JIGfwFemLpn+ir083ey
         ee8KHQVMSITLwDYbuXkiNKxhRdsKz5x9ddSpVn18iAWnPLgaBcigEkmJ8Ft1JmQe1Teq
         AKJwS+68nAUNOSpksXoqNaoxHBPGuLjiRibe6Vx4sPex52NFqCc2R6b1zrrXX3q3hLvi
         qaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from;
        bh=OxM+NIAb/wB9UH88KLBEpoA1L5sqOmv7rWC9Dd/ze4Q=;
        b=hOJ8etDbUB5XjUdy/uqwC4Na2AHYS1rEi8okc3TsBDKaMCoREGMEqzTfFgA82my3kB
         X6w0e/b+r4qB9/IWyRD3G8GPNPyBr5oLNGkYz1V/a0eQM2/SF6fSDptqfmq9MwJqgy3G
         x1dKtoR7mPQ/O0JKWAUj474Nc1zdbVAhYGOKMdDunqFyY1vz1NXvxOHUShql/K92cbvK
         nIDVLG9DzLCoWmykmvauQghwWp3VLNyeeLgPtVRwZO0Hyg5D4+0nqqJk+80HIA+1ifes
         g9mf2hweX7jt3tJJeN7TjzlPsHJqvsll8sqkevG4JKUpux3mqlhLkbL+nZYxE4YHXwup
         4sCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e144si4900742ybb.461.2020.06.19.04.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 04:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmF5C-0000uv-AG
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 07:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <henrik.uhrenfeldt@huawei.com>)
 id 1jmF4q-0000gB-34
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 07:20:56 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2114 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <henrik.uhrenfeldt@huawei.com>)
 id 1jmF4n-0007lG-L5
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 07:20:55 -0400
Received: from lhreml718-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 0EE6690851C8450B7DB8
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 12:20:51 +0100 (IST)
Received: from lhreml718-chm.china.huawei.com (10.201.108.69) by
 lhreml718-chm.china.huawei.com (10.201.108.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 19 Jun 2020 12:20:50 +0100
Received: from lhreml718-chm.china.huawei.com ([10.201.108.69]) by
 lhreml718-chm.china.huawei.com ([10.201.108.69]) with mapi id 15.01.1913.007; 
 Fri, 19 Jun 2020 12:20:50 +0100
From: Henrik Uhrenfeldt <henrik.uhrenfeldt@huawei.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: [QUESTION] ARMv8.4-SecEL2 support
Thread-Topic: [QUESTION] ARMv8.4-SecEL2 support
Thread-Index: AdZGK6b+evk3DL9mRQSmPYmKzDbTPA==
Date: Fri, 19 Jun 2020 11:20:50 +0000
Message-ID: <828021babb144be29ce518681ff6d89f@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.66.137]
Content-Type: multipart/alternative;
 boundary="_000_828021babb144be29ce518681ff6d89fhuaweicom_"
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=henrik.uhrenfeldt@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 07:20:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IE32ofRU1MIT

--_000_828021babb144be29ce518681ff6d89fhuaweicom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBsaXN0LA0KDQpJIGFtIGFib3V0IHRvIGRvIHNvbWUgd29yayB3aXRoIHRoZSBBUk0gU2Vj
dXJlIEVMMiBmZWF0dXJlIChBUk12OC40LVNlY0VMMikuIFFFTVUgdmlydCB0YXJnZXQgaGFzIGJl
ZW4gbXkgZW52aXJvbm1lbnQgb2YgY2hvaWNlIGZvciBzb21lIHRpbWUsIGFuZCBJIHdvdWxkIGxp
a2UgdG8gZG8gaXQgaW4gUUVNVSB2aXJ0IGlmIHBvc3NpYmxlLg0KDQpTZXZlcmFsIHBsYWNlcyBp
biB0YXJnZXQvYXJtL2hlbHBlci5jIG1lbnRpb24gIlRPRE86IEFSTXY4LjQtU2VjRUwyIi4gV291
bGQgYW55b25lIGhlcmUgb24gdGhlIGxpc3QgYmUgYXdhcmUgb2YgYW55IGN1cnJlbnQgcGxhbnMg
dG8gc3VwcG9ydCBpdD8NCg0KQmVzdCByZWdhcmRzLA0KSGVucmlrDQo=

--_000_828021babb144be29ce518681ff6d89fhuaweicom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6ZHQ9InV1aWQ6QzJGNDEwMTAtNjVC
My0xMWQxLUEyOUYtMDBBQTAwQzE0ODgyIiB4bWxuczptPSJodHRwOi8vc2NoZW1hcy5taWNyb3Nv
ZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy9UUi9S
RUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250
ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1ldGEgbmFtZT0iR2VuZXJhdG9yIiBj
b250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQgbWVkaXVtKSI+DQo8c3R5bGU+PCEt
LQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiQ2Ft
YnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0O30NCkBmb250LWZhY2UN
Cgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUgMiAyIDIgNCAzIDIgNDt9
DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2
Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250
LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCW1zby1m
YXJlYXN0LWxhbmd1YWdlOkVOLVVTO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNv
LXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21w
b3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3Rl
eHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJbXNv
LWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVM7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6NjEy
LjBwdCA3OTIuMHB0Ow0KCW1hcmdpbjo3Mi4wcHQgNzIuMHB0IDcyLjBwdCA3Mi4wcHQ7fQ0KZGl2
LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYg
Z3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0i
MTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86
c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEi
IC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJlbi1ESyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkRlYXIgbGlzdCw8bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkgYW0gYWJvdXQgdG8gZG8gc29tZSB3b3JrIHdpdGgg
dGhlIEFSTSBTZWN1cmUgRUwyIGZlYXR1cmUgKEFSTXY4LjQtU2VjRUwyKS4gUUVNVSB2aXJ0IHRh
cmdldCBoYXMgYmVlbiBteSBlbnZpcm9ubWVudCBvZiBjaG9pY2UgZm9yIHNvbWUgdGltZSwgYW5k
IEkgd291bGQgbGlrZSB0byBkbyBpdCBpbiBRRU1VIHZpcnQgaWYgcG9zc2libGUuPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPlNldmVyYWwgcGxhY2VzIGluIHRhcmdldC9hcm0vaGVscGVyLmMgbWVu
dGlvbiAmcXVvdDtUT0RPOiBBUk12OC40LVNlY0VMMiZxdW90Oy4gV291bGQgYW55b25lIGhlcmUg
b24gdGhlIGxpc3QgYmUgYXdhcmUgb2YgYW55IGN1cnJlbnQgcGxhbnMgdG8gc3VwcG9ydCBpdD88
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QmVzdCByZWdhcmRzLDxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+SGVucmlrPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_828021babb144be29ce518681ff6d89fhuaweicom_--
