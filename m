Received: by 10.25.208.211 with SMTP id h202csp922734lfg;
        Tue, 15 Mar 2016 19:35:52 -0700 (PDT)
X-Received: by 10.141.5.137 with SMTP id h131mr1881616qhd.47.1458095752690;
        Tue, 15 Mar 2016 19:35:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si1220844qha.52.2016.03.15.19.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 19:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@163.com
Received: from localhost ([::1]:52694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag1JQ-0003qT-7Y
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 22:35:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ag1JN-0003pR-5m
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ag1JJ-0007fV-Ua
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:35:49 -0400
Received: from m13-6.163.com ([220.181.13.6]:47418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ag1JJ-0007al-BB; Tue, 15 Mar 2016 22:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=FzGUS
	3v7LCsXQS6wkkN6wcK5CgCLKlFh5L9b7wtYILA=; b=M+xZpPEsB1aYnynIBG/B2
	97K88WKcJu6CWPw8HtH6UUgwLXAPJ9pqnKmxgXNMvsT0sCz77JUwkAlt27He0ily
	ywJqP/xEvYp3faiAmpEz97e+pzLNJzRYDTVJZ3zB40Wz12AgxfhNagUH8yC5EdPt
	+SGyNJXNvy1OfaT77wIY94=
Received: from zxq_yx_007$163.com ( [118.187.28.42] ) by ajax-webmail-wmsvr6
	(Coremail) ; Wed, 16 Mar 2016 10:34:35 +0800 (CST)
X-Originating-IP: [118.187.28.42]
Date: Wed, 16 Mar 2016 10:34:35 +0800 (CST)
From: zxq_yx_007  <zxq_yx_007@163.com>
To: "xiaoqiang zhao" <zxq_yx_007@163.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20160223(81157.8522) Copyright (c) 2002-2016 www.mailtech.cn 163com
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <6328ec5c.4c11.1537d4659a4.Coremail.zxq_yx_007@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: BsGowAB3f6s8xuhWQkBdAA--.8378W
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMxouxlXlfG5qKAABsg
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.13.6
Cc: robh@kernel.org, qemu-arm@nongnu.org, balrogg@gmail.com,
	qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: t8fB9Q7yPgTO

CkF0IDIwMTYtMDMtMDcgMTU6MDU6NDEsICJ4aWFvcWlhbmcgemhhbyIgPHp4cV95eF8wMDdAMTYz
LmNvbT4gd3JvdGU6Cj5UaGlzIHBhdGNoIHNldCB0cnlpbmcgdG8gUU9NJ2lmeSBjb2RlIHVuZGVy
IGh3L2FybSBkaXJlY3RvcnkuCj5BcyBwcmV2aW91cyBwYXRjaGVzIHRvIGh3L3RpbWVyLyosIHdl
IHVzZSBpbnN0YW5jZV9pbml0IGluc3RlYWQgb2YKPnRoZSBTeXNCdXMncyBpbml0IGZ1bmN0aW9u
LiAKPgo+Cj54aWFvcWlhbmcgemhhbyAoOSk6Cj4gIGh3L2FybTogUU9NJ2lmeSBhcm12N20uYwo+
ICBody9hcm06IFFPTSdpZnkgaGlnaGJhbmsuYwo+ICBody9hcm06IFFPTSdpZnkgaW50ZWdyYXRv
cmNwLmMKPiAgaHcvYXJtOiBRT00naWZ5IHB4YTJ4eC5jCj4gIGh3L2FybTogUU9NJ2lmeSBweGEy
eHhfcGljLmMKPiAgaHcvYXJtOiBRT00naWZ5IHNwaXR6LmMKPiAgaHcvYXJtOiBRT00naWZ5IHN0
ZWxsYXJpcy5jCj4gIGh3L2FybTogUU9NJ2lmeSBzdHJvbmdhcm0uYwo+ICBody9hcm06IFFPTSdp
ZnkgdmVyc2F0aWxlcGIuYwo+Cj4gaHcvYXJtL2FybXY3bS5jICAgICAgIHwgMTEgKysrKy0tLS0t
Cj4gaHcvYXJtL2hpZ2hiYW5rLmMgICAgIHwgMTIgKysrKy0tLS0tLQo+IGh3L2FybS9pbnRlZ3Jh
dG9yY3AuYyB8IDMyICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiBody9hcm0vcHhhMnh4LmMg
ICAgICAgfCAyNiArKysrKysrKystLS0tLS0tLS0tLQo+IGh3L2FybS9weGEyeHhfcGljLmMgICB8
ICA3IC0tLS0tLQo+IGh3L2FybS9zcGl0ei5jICAgICAgICB8IDIzICsrKysrKystLS0tLS0tLS0t
LQo+IGh3L2FybS9zdGVsbGFyaXMuYyAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0KPiBody9hcm0vc3Ryb25nYXJtLmMgICAgfCA2NiArKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBody9hcm0vdmVyc2F0aWxlcGIu
YyAgfCAxMyArKysrKy0tLS0tCj4gOSBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwg
MTM4IGRlbGV0aW9ucygtKQo+Cj4tLSAKPjIuMS40Cgo+CnBpbmcgIQ==
