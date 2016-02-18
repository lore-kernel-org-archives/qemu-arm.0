Received: by 10.25.208.211 with SMTP id h202csp672397lfg;
        Thu, 18 Feb 2016 07:34:22 -0800 (PST)
X-Received: by 10.140.252.197 with SMTP id x188mr10084261qhc.81.1455809662351;
        Thu, 18 Feb 2016 07:34:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z136si8460850qhd.112.2016.02.18.07.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 07:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:42508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWQaz-0002ji-SD
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 10:34:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWQaw-0002jK-MU
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 10:34:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWQat-0006Ov-Ft
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 10:34:18 -0500
Received: from m13-166.163.com ([220.181.13.166]:60169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aWQas-0006Nn-LG; Thu, 18 Feb 2016 10:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=24X80
	SKWJMz0OG3ZtbgKftCkm7sNre5Uo5yk/tHPCLc=; b=ip87rlsJBV1kwqEnOQ6qF
	A7djtIKjIYvDEG3uJDp/awT2IOG6B8TDolbbSHqUEkhMqTK1qaixi38ilDDSAYSd
	oURmloSB28jxP+DYTZ0DWlTg/f726UCmm05o6incspULSFTQvzody/4Muy1bSNsy
	yEl7KOQ6MYIQzeOvqtHP2Y=
Received: from zxq_yx_007$163.com ( [114.111.167.156] ) by
	ajax-webmail-wmsvr166 (Coremail) ; Thu, 18 Feb 2016 22:44:41 +0800
	(GMT+08:00)
X-Originating-IP: [114.111.167.156]
Date: Thu, 18 Feb 2016 22:44:41 +0800 (GMT+08:00)
From: zxq_yx_007@163.com
To: "Peter Maydell" <peter.maydell@linaro.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20150911(74783.7961) Copyright (c) 2002-2016 www.mailtech.cn 163com
In-Reply-To: <CAFEAcA_BLf0CtQCRSu60NntRgud7aJ+kQjfQgKAQFJ-dSXhz0Q@mail.gmail.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-3-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8PSnrnu3o9dJWK3RwrSiq64qjFOqw3gz0Vr_YEXM3Oyg@mail.gmail.com>
	<1455805567.632258470@f6.my.com>
	<CAFEAcA_BLf0CtQCRSu60NntRgud7aJ+kQjfQgKAQFJ-dSXhz0Q@mail.gmail.com>
X-CM-CTRLDATA: mcWUSWZvb3Rlcl9odG09MTgwMTo5
Content-Type: multipart/alternative; 
	boundary="----=_Part_240513_1708616438.1455806681957"
MIME-Version: 1.0
Message-ID: <510ce01.13ddb.152f4d71365.Coremail.zxq_yx_007@163.com>
X-CM-TRANSID: psGowABnyNHa2MVWEiwVAA--.876W
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAwTxlSINb-eGQABsF
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.13.166
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-arm] =?utf-8?b?5Zue5aSN77yaUmU6IFJlWzJdOiBbUEFUQ0ggdjMgMTIv?=
 =?utf-8?q?16=5D_hw/timer=3A_QOM=27ify_pl031?=
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
X-TUID: U8c9y8gNmSpY

------=_Part_240513_1708616438.1455806681957
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

V2hhdCAidG9wLXBvc3QiIG1lYW4/CuWcqDIwMTblubQwMuaciDE45pelIDIyOjMx77yMUGV0ZXIg
TWF5ZGVsbCDlhpnpgZM6Ck9uIDE4IEZlYnJ1YXJ5IDIwMTYgYXQgMTQ6MjYsICA8enhxX3l4XzAw
N0AxNjMuY29tPiB3cm90ZToKPiBUaGFua3MgUGV0ZXIhCj4gU29ycnkgZm9yIHRoYXTvvIFJIHdp
bGwgY29ycmVjdCB0aGlzIGluIG5leHQgdmVyc2lvbi4gSSBhbHNvIGhhdmUgb25lCj4gcXVlc3Rp
b27vvJpXaHkgdGhlIHBhdGNoIEkgaGF2ZSBzZW50IHRvIHRoaXMgbGlzdCBkb2VzIG5vdCBoYXZl
IGEgdGl0bGUgYmVnaW4KPiB3aXRoICJbUWVtdS1kZXZlbF0iID8KCkl0IGRlcGVuZHMgZW50aXJl
bHkgd2hpY2ggY29weSB5b3Ugc2VlLiBGb3IgZXhhbXBsZSB0aGUgbGlzdAphcmNoaXZlJ3MgY29w
eSBkb2VzOgpodHRwczovL2xpc3RzLm5vbmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwv
MjAxNi0wMi9tc2cwMzQwMC5odG1sCgpJZiB5b3VyIG1haWwgY2xpZW50IHNlZXMgdGhlIGNvcHkg
dGhhdCB3ZW50IHZpYSB0aGUgbWFpbGluZyBsaXN0CnNlcnZlciBmaXJzdCwgdGhhdCdzIHRoZSBz
dWJqZWN0IHlvdSdsbCBzZWUuIElmIGl0IHNlZXMgc29tZSBvdGhlcgpjb3B5IGZpcnN0IChwZXJo
YXBzIHlvdSB3ZXJlIHBlcnNvbmFsbHkgY2MnZCBvbiB0aGUgbWFpbCwgb3IgaWYKeW91IHNlbnQg
dGhlIG1haWwgeW91cnNlbGYgdGhlcmUncyB0aGUgY29weSB5b3UgYWN0dWFsbHkgc2VudCkKdGhl
biBpdCB3b24ndCBoYXZlIHRoZSBzdWJqZWN0IHRhZy4gSWYgaXQgd2FzIHNlbnQgdG8gc2V2ZXJh
bAptYWlsaW5nIGxpc3RzIHRoZW4geW91IG1pZ2h0IGZpcnN0IHNlZSB0aGUgY29weSBmcm9tIG9u
ZSBvZiB0aGUKb3RoZXIgbGlzdHMgd2l0aCB0aGF0IGxpc3QncyB0YWcuCgooUFM6IHBsZWFzZSBk
b24ndCB0b3AtcG9zdCBsaXN0IGVtYWlsLikKCnRoYW5rcwotLSBQTU0K
------=_Part_240513_1708616438.1455806681957
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPjwvaGVhZD48Ym9keT4KICAgICAgICA8ZGl2IGlkPSJjb250
ZW50RGVzY3JpcHRpb24iIHN0eWxlPSJsaW5lLWhlaWdodDoxLjU7dGV4dC1hbGlnbjpqdXN0aWZ5
O3RleHQtanVzdGlmeTppbnRlci1pZGVvZ3JhcGgiPgogICAgICAgICAgICA8ZGl2PldoYXQgInRv
cC1wb3N0IiBtZWFuPzwvZGl2PgogICAgICAgICAgICA8ZGl2IGNsYXNzPSJib3JkZXJGaXhXaWR0
aCBpTWFpbERvTm90UmVTY2FsZSIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2YyZjJmMjtjb2xv
cjpibGFjaztwYWRkaW5nLXRvcDo2cHg7cGFkZGluZy1ib3R0b206NnB4O2JvcmRlci1yYWRpdXM6
M3B4Oy1tb3otYm9yZGVyLXJhZGl1czozcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOjNweDttYXJn
aW4tdG9wOjQ1cHg7bWFyZ2luLWJvdHRvbToyMHB4OyI+PGRpdiBzdHlsZT0iZm9udC1zaXplOjE0
cHg7bGluZS1oZWlnaHQ6MS41O3dvcmQtYnJlYWs6YnJlYWstYWxsO21hcmdpbi1sZWZ0OjEwcHg7
bWFyZ2luLXJpZ2h0OjEwcHgiPuWcqDIwMTblubQwMuaciDE45pelIDIyOjMx77yMPGEgc3R5bGU9
InRleHQtZGVjb3JhdGlvbjpub25lO2NvbG9yOiMyYTk3ZmY7IiBocmVmPSJtYWlsdG86cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnIj5QZXRlciBNYXlkZWxsPC9hPiDlhpnpgZM6PC9kaXY+PC9kaXY+
PGJsb2NrcXVvdGUgaWQ9Im50ZXMtaW9zbWFpbC1xdW90ZSIgc3R5bGU9Im1hcmdpbjowIj5PbiAx
OCBGZWJydWFyeSAyMDE2IGF0IDE0OjI2LCAmbmJzcDsmbHQ7enhxX3l4XzAwN0AxNjMuY29tJmd0
OyB3cm90ZToKPGJyPiZndDsgVGhhbmtzIFBldGVyIQo8YnI+Jmd0OyBTb3JyeSBmb3IgdGhhdO+8
gUkgd2lsbCBjb3JyZWN0IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLiBJIGFsc28gaGF2ZSBvbmUKPGJy
PiZndDsgcXVlc3Rpb27vvJpXaHkgdGhlIHBhdGNoIEkgaGF2ZSBzZW50IHRvIHRoaXMgbGlzdCBk
b2VzIG5vdCBoYXZlIGEgdGl0bGUgYmVnaW4KPGJyPiZndDsgd2l0aCAiW1FlbXUtZGV2ZWxdIiA/
Cjxicj4KPGJyPkl0IGRlcGVuZHMgZW50aXJlbHkgd2hpY2ggY29weSB5b3Ugc2VlLiBGb3IgZXhh
bXBsZSB0aGUgbGlzdAo8YnI+YXJjaGl2ZSdzIGNvcHkgZG9lczoKPGJyPmh0dHBzOi8vbGlzdHMu
bm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE2LTAyL21zZzAzNDAwLmh0bWwK
PGJyPgo8YnI+SWYgeW91ciBtYWlsIGNsaWVudCBzZWVzIHRoZSBjb3B5IHRoYXQgd2VudCB2aWEg
dGhlIG1haWxpbmcgbGlzdAo8YnI+c2VydmVyIGZpcnN0LCB0aGF0J3MgdGhlIHN1YmplY3QgeW91
J2xsIHNlZS4gSWYgaXQgc2VlcyBzb21lIG90aGVyCjxicj5jb3B5IGZpcnN0IChwZXJoYXBzIHlv
dSB3ZXJlIHBlcnNvbmFsbHkgY2MnZCBvbiB0aGUgbWFpbCwgb3IgaWYKPGJyPnlvdSBzZW50IHRo
ZSBtYWlsIHlvdXJzZWxmIHRoZXJlJ3MgdGhlIGNvcHkgeW91IGFjdHVhbGx5IHNlbnQpCjxicj50
aGVuIGl0IHdvbid0IGhhdmUgdGhlIHN1YmplY3QgdGFnLiBJZiBpdCB3YXMgc2VudCB0byBzZXZl
cmFsCjxicj5tYWlsaW5nIGxpc3RzIHRoZW4geW91IG1pZ2h0IGZpcnN0IHNlZSB0aGUgY29weSBm
cm9tIG9uZSBvZiB0aGUKPGJyPm90aGVyIGxpc3RzIHdpdGggdGhhdCBsaXN0J3MgdGFnLgo8YnI+
Cjxicj4oUFM6IHBsZWFzZSBkb24ndCB0b3AtcG9zdCBsaXN0IGVtYWlsLikKPGJyPgo8YnI+dGhh
bmtzCjxicj4tLSBQTU0KPGJyPjwvYmxvY2txdW90ZT4KICAgICAgICA8L2Rpdj4KICAgIDxicj48
YnI+CjwvYm9keT48L2h0bWw+
------=_Part_240513_1708616438.1455806681957--

