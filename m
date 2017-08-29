Received: by 10.223.188.70 with SMTP id a6csp6263063wrh;
        Tue, 29 Aug 2017 10:21:20 -0700 (PDT)
X-Received: by 10.233.239.194 with SMTP id d185mr6701182qkg.59.1504027280137;
        Tue, 29 Aug 2017 10:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504027280; cv=none;
        d=google.com; s=arc-20160816;
        b=j+VTKEEAiy4SBfYhrCSMPB5K9/oZ024oaLZiy2InJ17e3wvlCz6bPMeoLlTbwFsw5l
         NIsa/vyg34XbfBLw6aOPDpk1+jBuuIW2/DUo2ps1AEqO6+CvLg5olqHER5rTY6dUKZ3m
         mQdWFGVmjILbh8msa0fJ8Sfarac11OWUqMWYHgIeF+g9JPKRmOCYJfiJxcsfIXGBIct3
         2zHcnNCELpNPAshCw2YWLJZsiNhYzGRNfrE5Wl9m8UI69vua4AYEf94tB8EhdW3VehbD
         BnU186ltC43VEe7jR2/KkhhAUSth0o/66kyI5kQpF19PV2KV50EWRCJmNAFgfgkOV5Dv
         Pjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:to:from:arc-authentication-results;
        bh=sD/5isWyJPOfjW4sNhTwc7yMLRt6E/WJNmBLpcqQtW0=;
        b=ZJ4SHIlBAt0i6iD0VCTKV78qGCenOOwac1jgl2pgSztiUUt2IB9Cz1PuZP+GJPlCqJ
         x6w+o2yCITWYiRsA9qEsHZYL7AONPmoSQKfQJZ3FzW20JS9DUJPkVHp60CqxepZRkHuj
         TZOSQlies/D76dPAmqCz+JRsiH0BJRWZAYFovKDf2kyuo5N0CNCgRH0Assja00mWi9ID
         zJZ0CWTvUE3jdSutoF/mpjhXU1jPGWdwQN4YDjDAAgYEw6aEWgXkHCM9IKlbqyhCWg6h
         VCHzu90IrSXW54Qm1ndLvKuZxK/QGIcZ3y48YxBc75H7ngc1SF5QQEzFASlN0xhmc91P
         vCuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9si3262752qth.18.2017.08.29.10.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 10:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmkCT-0007Zw-Sx
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 13:21:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1dmiKF-0004Jm-Ez
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1dmiKC-0007Nx-9W
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:21:11 -0400
Received: from mail-c.ads.isi.edu ([128.9.180.198]:36101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <dkang@isi.edu>) id 1dmiKB-0007HN-Tq
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:21:08 -0400
X-IronPort-AV: E=Sophos;i="5.41,445,1498546800"; d="scan'208,217";a="1137430"
Received: from usmdrmbx01.ads.isi.edu ([10.100.2.77])
	by usmdrip03-mgmt.ads.isi.edu with ESMTP; 29 Aug 2017 08:20:56 -0700
Received: from usarlmbx03.ads.isi.edu (10.13.52.79) by usmdrmbx01.ads.isi.edu
	(10.100.2.77) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Tue, 29 Aug 2017 08:21:01 -0700
Received: from usarlmbx01.ads.isi.edu (10.13.52.77) by usarlmbx03.ads.isi.edu
	(10.13.52.79) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1034.26;
	Tue, 29 Aug 2017 08:20:53 -0700
Received: from usarlmbx01.ads.isi.edu ([fe80::71d5:b7e4:2bfe:8a5b]) by
	usarlmbx01.ads.isi.edu ([fe80::71d5:b7e4:2bfe:8a5b%17]) with mapi id
	15.01.1034.026; Tue, 29 Aug 2017 08:20:53 -0700
From: Dong-In Kang <dkang@isi.edu>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Qemu interrupt handling latency
Thread-Index: AQHTINpnBG3SbDvvLkOz20Y3t4GziQ==
Date: Tue, 29 Aug 2017 15:20:52 +0000
Message-ID: <2D29846F-5540-4072-B9C9-CA3241E469EC@isi.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.9.47.101]
Content-Type: multipart/alternative;
	boundary="_000_2D29846F55404072B9C9CA3241E469ECisiedu_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 128.9.180.198
X-Mailman-Approved-At: Tue, 29 Aug 2017 13:20:22 -0400
Subject: [Qemu-arm] Qemu interrupt handling latency
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
X-TUID: 4j1UuVtpydkk

--_000_2D29846F55404072B9C9CA3241E469ECisiedu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpIaSwNCg0KSSBhbSB0cnlpbmcgdG8gZ2V0IHJvdWdoIGVzdGltYXRlIG9mIFFlbXUgb3Zlcmhl
YWQgb2YgaW50ZXJydXB0IGhhbmRsaW5nIG92ZXIgdGhlIGJhcmVtZXRhbCBvbiBhYXJjaDY0IGFy
Y2hpdGVjdHVyZS4NCkl0IGRvZXNu4oCZdCBoYXZlIHRvIGJlIGFjY3VyYXRlIOKAkyBmb3IgZXhh
bXBsZSwgYSBmZXcgaHVuZHJlZCBpbnN0cnVjdGlvbnMgb3IgY3ljbGVzIGlzIE9LLg0KQXMgSSBr
bm93LCB3aGVuIGFuIGludGVycnVwdCBpcyBwZW5kaW5nLCBRZW11IHN0b3BzIGJsb2NrIGNoYWlu
aW5nIGFuZCBydW5zIGVwaWxvZyBhbmQgcmV0dXJucyB0byB0aGUgaG9zdC4NClRoZW4sIEkgY291
bGQgbm90IGZpbmQgYSBwcm9wZXIgZG9jdW1lbnQgd2hhdCBhcmUgZG9uZSBmb3IgYWN0dWFsIGlu
dGVycnVwdCBoYW5kbGluZy4NCkkgZ3Vlc3MgaXQgbmVlZHMgc29tZSB3b3JrIGF0IHRoZSBob3N0
IGFuZCB0aGVuIHJ1bm5zIGFub3RoZXIgcHJvbG9nIGFuZCBhY3R1YWwgaW50ZXJydXB0IGhhbmRs
aW5nIHJvdXRpbmUgYW5kIGVwaWxvZy4NCkl0IG15IGd1ZXNzIGlzIGNvcnJlY3QsIHRoZSBleHRy
YSBsYXRlbmN5IG9mIFFlbXUgd291bGQgYmUNCih0aGUgZXhlY3V0aW9uIHRpbWUgb2YgdGhlIHJl
bWFpbmluZyBpbnN0cnVjdGlvbnMgaW4gdGhlIGN1cnJlbnQgdHJhbnNsYXRpb24gYmxvY2sgKyBl
cGlsb2cgKyBob3N0IGNvZGUgZm9yIGZpbmRpbmcgdGhlIGNvZGUgZm9yIGludGVycnVwdCBoYW5k
bGluZyArIHByb2xvZykuDQpDYW4gc29tZW9uZSB0ZWxsIG1lIGlmIGl0IGlzIGNvcnJlY3QgYW5k
L29yIGhvdyBtdWNoIG92ZXJoZWFkIG9mIHRoZW0gd291bGQgYmUgaW4gdGVybXMgb2Ygcm91Z2gg
bnVtYmVyIG9mIGluc3RydWN0aW9ucyBvciBjeWNsZXM/DQoNClRoYW5rcywNCkRhdmlkDQoNCg==

--_000_2D29846F55404072B9C9CA3241E469ECisiedu_
Content-Type: text/html; charset="utf-8"
Content-ID: <E9E5773350F0D64F82A67EAAEC5ECBF8@ads.isi.edu>
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
LjBwdCI+SGksPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGFt
IHRyeWluZyB0byBnZXQgcm91Z2ggZXN0aW1hdGUgb2YgUWVtdSBvdmVyaGVhZCBvZiBpbnRlcnJ1
cHQgaGFuZGxpbmcgb3ZlciB0aGUgYmFyZW1ldGFsIG9uIGFhcmNoNjQgYXJjaGl0ZWN0dXJlLjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5JdCBkb2VzbuKAmXQgaGF2ZSB0byBiZSBhY2N1cmF0ZSDigJMgZm9y
IGV4YW1wbGUsIGEgZmV3IGh1bmRyZWQgaW5zdHJ1Y3Rpb25zIG9yIGN5Y2xlcyBpcyBPSy48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+QXMgSSBrbm93LCB3aGVuIGFuIGludGVycnVwdCBpcyBwZW5kaW5nLCBR
ZW11IHN0b3BzIGJsb2NrIGNoYWluaW5nIGFuZCBydW5zIGVwaWxvZyBhbmQgcmV0dXJucyB0byB0
aGUgaG9zdC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhlbiwgSSBjb3VsZCBub3QgZmluZCBhIHByb3Bl
ciBkb2N1bWVudCB3aGF0IGFyZSBkb25lIGZvciBhY3R1YWwgaW50ZXJydXB0IGhhbmRsaW5nLjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5JIGd1ZXNzIGl0IG5lZWRzIHNvbWUgd29yayBhdCB0aGUgaG9zdCBh
bmQgdGhlbiBydW5ucyBhbm90aGVyIHByb2xvZyBhbmQgYWN0dWFsIGludGVycnVwdCBoYW5kbGlu
ZyByb3V0aW5lIGFuZCBlcGlsb2cuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkl0IG15IGd1ZXNzIGlzIGNv
cnJlY3QsIHRoZSBleHRyYSBsYXRlbmN5IG9mIFFlbXUgd291bGQgYmUNCjxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij4odGhlIGV4ZWN1dGlvbiB0aW1lIG9mIHRoZSByZW1haW5pbmcgaW5zdHJ1Y3Rpb25zIGlu
IHRoZSBjdXJyZW50IHRyYW5zbGF0aW9uIGJsb2NrICYjNDM7IGVwaWxvZyAmIzQzOyBob3N0IGNv
ZGUgZm9yIGZpbmRpbmcgdGhlIGNvZGUgZm9yIGludGVycnVwdCBoYW5kbGluZyAmIzQzOyBwcm9s
b2cpLjxicj4NCkNhbiBzb21lb25lIHRlbGwgbWUgaWYgaXQgaXMgY29ycmVjdCBhbmQvb3IgaG93
IG11Y2ggb3ZlcmhlYWQgb2YgdGhlbSB3b3VsZCBiZSBpbiB0ZXJtcyBvZiByb3VnaCBudW1iZXIg
b2YgaW5zdHJ1Y3Rpb25zIG9yIGN5Y2xlcz88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPlRoYW5rcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+RGF2aWQ8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0
bWw+DQo=

--_000_2D29846F55404072B9C9CA3241E469ECisiedu_--
