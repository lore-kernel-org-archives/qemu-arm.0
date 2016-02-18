Received: by 10.25.208.211 with SMTP id h202csp638126lfg;
        Thu, 18 Feb 2016 06:27:19 -0800 (PST)
X-Received: by 10.55.80.136 with SMTP id e130mr6976941qkb.28.1455805639835;
        Thu, 18 Feb 2016 06:27:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f81si8225425qkb.82.2016.02.18.06.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 06:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWPY7-0001DT-BG
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 09:27:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWPXi-0000vz-S1
	for qemu-devel@nongnu.org; Thu, 18 Feb 2016 09:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aWPXd-0005xj-T9
	for qemu-devel@nongnu.org; Thu, 18 Feb 2016 09:26:54 -0500
Received: from m50-134.163.com ([123.125.50.134]:42443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aWPXd-0005x5-0R; Thu, 18 Feb 2016 09:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:MIME-Version:Date:Message-ID; bh=wW+b7
	dNnbIEd+bWNsiXQbYyp5WrM939rTkBTnrVHDhY=; b=FLwrGFhYkYl+wlGSUuel9
	SMPu212EMUPyx+hnUAyBlx6kO5k2A6slfCJm3rrVUb4fg9kjqK9OxfoMushxy8u7
	OEgMqaQH+Y2tBEPZN4Gx44brqsNJJ7nvkbohR051mY32fOYY74zYpSCVcUlZgpMV
	igag4LaEbeFj5vz0SSHF8g=
Received: from f6.my.com (unknown [185.30.176.74])
	by smtp4 (Coremail) with SMTP id DtGowAB32nt_1MVWygRgAA--.6110S2;
	Thu, 18 Feb 2016 22:26:10 +0800 (CST)
From: zxq_yx_007@163.com
To: peter.maydell@linaro.org
MIME-Version: 1.0
X-Mailer: My.com Mailer 1.0
Date: Thu, 18 Feb 2016 17:26:07 +0300
X-Letter-Fingerprint: Lejev2arm7dVrRj2YQtZmIsMKXHYJbiT
X-Priority: 3 (Normal)
Message-ID: <1455805567.632258470@f6.my.com>
Content-Type: multipart/alternative;
	boundary="--ALT--kAHKCOCz1455805567"
X-Mras: Ok
X-Spam: undefined
In-Reply-To: <CAFEAcA8PSnrnu3o9dJWK3RwrSiq64qjFOqw3gz0Vr_YEXM3Oyg@mail.gmail.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-3-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8PSnrnu3o9dJWK3RwrSiq64qjFOqw3gz0Vr_YEXM3Oyg@mail.gmail.com>
X-CM-TRANSID: DtGowAB32nt_1MVWygRgAA--.6110S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW7AFyUAw4UKr4kJFWrXwb_yoW3urX_ZF
	W8Za18C3yaqr42ka13uFn8Zw1S9ayaqr4UXw1Yyr1rXa4Iqr1DJa92g392y34F93929rZr
	WrySqr47ur9FgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUU2Q6DUUUUU==
X-Originating-IP: [185.30.176.74]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEAQTxlWBTuztMgAAso
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Cc: e.voevodin@samsung.com, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, michael@walle.cc, qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: Re: [Qemu-devel]
 =?utf-8?q?=5BPATCH_v3_12/16=5D_hw/timer=3A_QOM=27ify?=
 =?utf-8?q?_pl031?=
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: zxq_yx_007@163.com
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8sj1hKdVU6oY


----ALT--kAHKCOCz1455805567
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

ClRoYW5rcyBQZXRlciEKU29ycnkgZm9yIHRoYXTvvIFJIHdpbGwgY29ycmVjdCB0aGlzIGluIG5l
eHQgdmVyc2lvbi4gSSBhbHNvIGhhdmUgb25lIHF1ZXN0aW9u77yaV2h5IHRoZSBwYXRjaCBJIGhh
dmUgc2VudCB0byB0aGlzIGxpc3QgZG9lcyBub3QgaGF2ZSBhIHRpdGxlIGJlZ2luIHdpdGggIltR
ZW11LWRldmVsXSIgPwoKCgoyMDE25bm0MuaciDE45pelIOaYn+acn+WbmyArMDgwMCAyMTowMiDl
j5Hku7bkurogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnICA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnPjoKPk9uIDE2IEZlYnJ1YXJ5IDIwMTYgYXQgMTE6MTAsIHhpYW9xaWFuZyB6aGFvIDwgenhx
X3l4XzAwN0AxNjMuY29tID4gd3JvdGU6Cj4+IGFzc2lnbiBwbDAzMV9pbml0IHRvIHBsMDMxX2lu
Zm8uaW5zdGFuY2VfaW5pdCBhbmQgZHJvcCB0aGUKPj4gU3lzQnVzRGV2aWNlQ2xhc3M6OmluaXQK
Pj4KPj4gUmV2aWV3ZWQtYnk6IFBldGVyIE1heWRlbGwgPCBwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmcgPgo+PiBTaWduZWQtb2ZmLWJ5OiB4aWFvcWlhbmcgemhhbyA8IHp4cV95eF8wMDdAMTYzLmNv
bSA+Cj4KPkkgZGlkbid0IHJldmlldyB0aGlzIHBhdGNoISBQbGVhc2UgYmUgbW9yZSBjYXJlZnVs
Cj5hYm91dCBvbmx5IGFwcGx5aW5nIHJldmlld2VkLWJ5OiB0YWdzIHRvIHRoZSBjb3JyZWN0Cj5w
YXRjaGVzIHdoZW4geW91J3JlIHNlbmRpbmcgb3V0IG5ldyB2ZXJzaW9ucy4gKFlvdSBzZWVtCj50
byBoYXZlIGdvdCB0aGlzIHdyb25nIGZvciBzb21lIG9mIHRoZSBvdGhlcnMgaW4gdGhpcwo+c2Vy
aWVzIHRvby4pCj4KPnRoYW5rcwo+LS0gUE1NCg==

----ALT--kAHKCOCz1455805567
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

CjxIVE1MPjxCT0RZPjxkaXYgaWQ9ImNvbXBvc2VXZWJWaWV3X2VkaXRhYmxlX2NvbnRlbnQiIGRh
dGEtbWFpbHJ1YXBwLWNvbXBvc2UtaWQ9ImNvbXBvc2VXZWJWaWV3X2VkaXRhYmxlX2NvbnRlbnQi
IHN0eWxlPSJ0ZXh0LWFsaWduOiBsZWZ0OyI+VGhhbmtzIFBldGVyITxkaXY+U29ycnkgZm9yIHRo
YXTvvIFJIHdpbGwgY29ycmVjdCB0aGlzIGluIG5leHQgdmVyc2lvbi4gSSBhbHNvIGhhdmUgb25l
IHF1ZXN0aW9u77yaV2h5IHRoZSBwYXRjaCBJIGhhdmUgc2VudCB0byB0aGlzIGxpc3QgZG9lcyBu
b3QgaGF2ZSBhIHRpdGxlIGJlZ2luIHdpdGggIltRZW11LWRldmVsXSIgPzwvZGl2PjxkaXY+PGRp
diBpZD0ibWFpbC1hcHAtYXV0by1zaWduYXR1cmUiPjxicj48L2Rpdj48YnI+PGJyPjIwMTblubQy
5pyIMTjml6Ug5pif5pyf5ZubICswODAwIDIxOjAyIOWPkeS7tuS6uiBwZXRlci5tYXlkZWxsQGxp
bmFyby5vcmcgICZsdDtwZXRlci5tYXlkZWxsQGxpbmFyby5vcmcmZ3Q7Ojxicj4gICAgPGRpdiBp
ZD0iY29tcG9zZVdlYlZpZXdfcHJldmlvdXNlX2NvbnRlbnQiIGRhdGEtbWFpbHJ1YXBwLWNvbXBv
c2UtaWQ9ImNvbXBvc2VXZWJWaWV3X3ByZXZpb3VzZV9jb250ZW50Ij48YmxvY2txdW90ZSBpZD0i
bWFpbC1hcHAtYXV0by1xdW90ZSIgc3R5bGU9ImJvcmRlci1sZWZ0OiAxcHggc29saWQgI2ZjMmMz
ODsgbWFyZ2luOiAxMHB4IDEwcHggMTBweCA1cHg7IHBhZGRpbmc6IDAgMCAwIDEwcHg7Ij48ZGl2
IGNsYXNzPSJqcy1oZWxwZXIganMtcmVhZG1zZy1tc2ciPgoJPHN0eWxlIHR5cGU9InRleHQvY3Nz
Ij48L3N0eWxlPgogCTxkaXY+CgkJPGJhc2UgdGFyZ2V0PSJfc2VsZiIgaHJlZj0iaHR0cHM6Ly9l
LWFqLm15LmNvbS8iPgoJCQoJCQk8ZGl2IGlkPSJzdHlsZV8xNDU1ODAwNTYyMTM0MzM5NzA1N19C
T0RZIj5PbiAxNiBGZWJydWFyeSAyMDE2IGF0IDExOjEwLCB4aWFvcWlhbmcgemhhbyAmbHQ7PGEg
aHJlZj0iL2NvbXBvc2U/VG89enhxX3l4XzAwN0AxNjMuY29tIj56eHFfeXhfMDA3QDE2My5jb208
L2E+Jmd0OyB3cm90ZTo8YnI+CjxkaXYgY2xhc3M9Im1haWwtcXVvdGUtY29sbGFwc2UiPiZndDsg
YXNzaWduIHBsMDMxX2luaXQgdG8gcGwwMzFfaW5mby5pbnN0YW5jZV9pbml0IGFuZCBkcm9wIHRo
ZTxicj4KJmd0OyBTeXNCdXNEZXZpY2VDbGFzczo6aW5pdDxicj4KJmd0Ozxicj4KJmd0OyBSZXZp
ZXdlZC1ieTogUGV0ZXIgTWF5ZGVsbCAmbHQ7PGEgaHJlZj0iL2NvbXBvc2U/VG89cGV0ZXIubWF5
ZGVsbEBsaW5hcm8ub3JnIj5wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc8L2E+Jmd0Ozxicj4KJmd0
OyBTaWduZWQtb2ZmLWJ5OiB4aWFvcWlhbmcgemhhbyAmbHQ7PGEgaHJlZj0iL2NvbXBvc2U/VG89
enhxX3l4XzAwN0AxNjMuY29tIj56eHFfeXhfMDA3QDE2My5jb208L2E+Jmd0Ozxicj4KPC9kaXY+
PGJyPgpJIGRpZG4ndCByZXZpZXcgdGhpcyBwYXRjaCEgUGxlYXNlIGJlIG1vcmUgY2FyZWZ1bDxi
cj4KYWJvdXQgb25seSBhcHBseWluZyByZXZpZXdlZC1ieTogdGFncyB0byB0aGUgY29ycmVjdDxi
cj4KcGF0Y2hlcyB3aGVuIHlvdSdyZSBzZW5kaW5nIG91dCBuZXcgdmVyc2lvbnMuIChZb3Ugc2Vl
bTxicj4KdG8gaGF2ZSBnb3QgdGhpcyB3cm9uZyBmb3Igc29tZSBvZiB0aGUgb3RoZXJzIGluIHRo
aXM8YnI+CnNlcmllcyB0b28uKTxicj4KPGJyPgp0aGFua3M8YnI+Ci0tIFBNTTxicj4KPC9kaXY+
CgkJCQoJCQoJCTxiYXNlIHRhcmdldD0iX3NlbGYiIGhyZWY9Imh0dHBzOi8vZS1hai5teS5jb20v
Ij4KCTwvZGl2PgoKCQo8L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PC9kaXY+PC9CT0RZ
PjwvSFRNTD4K

----ALT--kAHKCOCz1455805567--

