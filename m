Received: by 10.25.208.137 with SMTP id h131csp475193lfg;
        Wed, 11 May 2016 18:47:46 -0700 (PDT)
X-Received: by 10.55.45.66 with SMTP id t63mr7338055qkh.72.1463017666810;
        Wed, 11 May 2016 18:47:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si7114708qkl.221.2016.05.11.18.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 May 2016 18:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b0fj8-0001CH-DC
	for alex.bennee@linaro.org; Wed, 11 May 2016 21:47:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b0fin-0000g8-Ne
	for qemu-devel@nongnu.org; Wed, 11 May 2016 21:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b0fij-0002xu-FB
	for qemu-devel@nongnu.org; Wed, 11 May 2016 21:47:24 -0400
Received: from m13-144.163.com ([220.181.13.144]:3360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b0fii-0002xY-Kb
	for qemu-devel@nongnu.org; Wed, 11 May 2016 21:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=jtDd3
	d9CH71PSMmGWHd15HI27voDHHUDfx7UyYbmMD4=; b=WTVnYg3/iuW2yqOfdbqKh
	UMM00zXW14rGqzrrs0xJy0PQPbuuAj0XGE8zlQuCYuN9VKECzwAHsFXRccYOO+RS
	Ijk8AeTF2gq9B9PZAf1Mj2WITJ2qdK6k+ZjFPAgrO9RmaAJu6zksIl5a7RhE+67p
	1+plZLn1mZxSlVf8aPp8Ig=
Received: from zxq_yx_007$163.com ( [118.187.28.42] ) by
	ajax-webmail-wmsvr144 (Coremail) ; Thu, 12 May 2016 09:46:48 +0800 (CST)
X-Originating-IP: [118.187.28.42]
Date: Thu, 12 May 2016 09:46:48 +0800 (CST)
From: =?GBK?B?1dTQoce/?= <zxq_yx_007@163.com>
To: "xiaoqiang zhao" <zxq_yx_007@163.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20160223(81157.8522) Copyright (c) 2002-2016 www.mailtech.cn 163com
In-Reply-To: <E44DBEC6-F0C6-4B70-A753-24D62179283D@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
	<CAFEAcA-P25AkJLBLst04J=BxTVvbfuQQAiE8nVS=w7oMXdtX8A@mail.gmail.com>
	<56FC81E0.1000203@163.com>
	<CAFEAcA_xGVpHW8ki0qqGMN8OtpbiZYtAsCJoxQG9z8FPXZBVqQ@mail.gmail.com>
	<E44DBEC6-F0C6-4B70-A753-24D62179283D@163.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1a238e2a.3db8.154a2a51724.Coremail.zxq_yx_007@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kMGowAD3_YWK4DNXK0i2AA--.16724W
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOx1nxlXlTedyagABsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.13.144
Subject: Re: [Qemu-devel] [PATCH 0/9] some QOM'ify work under hw/arm
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vULqnurdPOD4

CtTaIDIwMTYtMDMtMzEgMTY6MTU6MTejrCJ4aWFvcWlhbmcgemhhbyIgPHp4cV95eF8wMDdAMTYz
LmNvbT4g0LS1wKO6Cj4KPgo+PiDU2iAyMDE2xOoz1MIzMcjVo6wxNjowNaOsUGV0ZXIgTWF5ZGVs
bCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiDQtLXAo7oKPj4gCj4+PiBPbiAzMSBNYXJjaCAy
MDE2IGF0IDAyOjQ4LCB4aWFvcWlhbmcgemhhbyA8enhxX3l4XzAwN0AxNjMuY29tPiB3cm90ZToK
Pj4+IAo+Pj4+INTaIDIwMTbE6jAz1MIxNsjVIDIwOjAwLCBQZXRlciBNYXlkZWxsINC0tcA6Cj4+
Pj4gCj4+Pj4+IE9uIDE2IE1hcmNoIDIwMTYgYXQgMTE6MzEsIFBldGVyIE1heWRlbGwgPHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBBIGdlbmVyYWwgbm90ZSAt
LSBzaW5jZSB0aGVzZSBhcmVuJ3QgYnVnIGZpeGVzIGFuZCB3ZSdyZSBpbiBzb2Z0Cj4+Pj4+IGZy
ZWV6ZSBub3csIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHB1dCB0aGVtIGluIHVudGlsIDIuNiBp
cyBvdXQuCj4+Pj4+IEknbGwgcmV2aWV3IHRoZSBwYXRjaGVzIGluIGEgc2Vjb25kLCB0aG91Z2gu
Cj4+Pj4gCj4+Pj4gV2VsbCwgdGhlIHBhdGNoZXMgYWxsIGxvb2sgZ29vZCAtLSBwaW5nIG1lIGFm
dGVyIDIuNiBpcyBvdXQgdG8KPj4+PiBhcHBseSB0aGVtIHRvIHRhcmdldC1hcm0ubmV4dCB0aGVu
Lgo+Pj4+IAo+Pj4+IFdoZXJlIEkndmUgbm90ZWQgcG9zc2libGUgZnVydGhlciBjbGVhbnVwcywg
dGhhdCdzIGludGVuZGVkIGFzCj4+Pj4gYW4gImlmIHlvdSBsaWtlIHdyaXRpbmcgY2xlYW51cCBw
YXRjaGVzIiB0aGluZyAtLSB5b3UgZG9uJ3QgbmVlZAo+Pj4+IHRvIHRyeSB0byBkbyB0aGVtIGFz
IHBhcnQgb2YgdGhpcyBwYXRjaCBzZXJpZXMuCj4+IAo+Pj4gcGluZyAhCj4+IAo+PiBJIHN1Z2dl
c3RlZCB5b3UgcGluZyBtZSBhZnRlciAyLjYgaXMgb3V0LCB3aGljaCB3b24ndCBiZSB0aWwgdGhl
Cj4+IGVuZCBvZiBBcHJpbCBvciB0aGVyZWFib3V0cy4KPj4gCj4+IHRoYW5rcwo+PiAtLSBQTU0K
Pgo+T2ujoTIuNnJjIG1pc2xlYWRzIG1lo6EKCnBpbmcgOy0pCg==
