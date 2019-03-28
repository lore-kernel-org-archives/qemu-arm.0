Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp661132wrx;
        Thu, 28 Mar 2019 07:00:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMNn4lkbnG7pZCiGt5cpBG3Oz/pdSzcDpRVopmvzvvTo4gTkosXCLCdTdg/0E4qiv9Ditt
X-Received: by 2002:a24:9a83:: with SMTP id l125mr100024ite.59.1553781624160;
        Thu, 28 Mar 2019 07:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553781624; cv=none;
        d=google.com; s=arc-20160816;
        b=0lmIH96z96S2wKFGy//hTH2rHfM79IqnYCx+2CvxVNj4Jvrn0xMD2YoI/LSkAXOZMc
         9vV87OgXZzWRAXGo+OFvUpiwdr48Swt8Q9BiQBZLvL6GQMTc+bbxoFzdW+hEe7AomIVM
         paQqgnaZYOjJwoVMjHLYi1TAb1fElOGbks9q6SLkMdE5Ki4A9+EmHeaqC0nwsJ4r4W3m
         WEWpaSE9ygBi2yr3vh+Fk2WDtsyisk2DIuy72/dLabYIZnkpovEowyMV/MW8TP4O7L2V
         NbqbJFAlpJ1IqViQbCuIPcxY+AW9VijcW+FhJMOjv4aQTrbOxV6XYK1a8WQ7hUweQ8z7
         eGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:mime-version
         :content-transfer-encoding:references:in-reply-to:to:from:date;
        bh=ywUmirkAMOleeZKjKgI3BiKBFUfsg33stNjjDjFv3EM=;
        b=PHMxmfaeGr7948ykEmNC/TF6TJOQqfE6YUeIttvmK4nh/MZJXKDnO2WmkI0JyU9NIY
         RHskXcvbBcDaJACWbZVy98YbJwadGKnOGj8FyPEp0QY4UyXxfGXsjFugf56sWXtX4jkN
         aCxxBE1+NsdHU2bds/qP5bAVKlXLL64ZAsUjQtp6TuVib0LKzTJt3uatlrqa4pBU07+e
         lhHsqo+wNWi3WVoV/WHHbdJaQrECHIeCLaCEJyjROjE3nBOGQjtB2kpsk7Vt9eBINMcb
         Ad+crukIO2vYIWp/UD7NY6UUEKsOAdy7aXJfqk7K8kP7ieFM+rruf+zGOaRsju9fYraV
         nMBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21si1690531itc.140.2019.03.28.07.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 07:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9VZv-00034d-GX
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 10:00:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gxt@mprc.pku.edu.cn>) id 1h9VYt-0002W2-9m
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 09:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gxt@mprc.pku.edu.cn>) id 1h9VYr-0008S4-SK
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 09:59:19 -0400
Received: from mx9.pku.edu.cn ([162.105.129.172]:48275 helo=pku.edu.cn)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gxt@mprc.pku.edu.cn>)
	id 1h9VYg-0008KC-AO; Thu, 28 Mar 2019 09:59:06 -0400
Received: by ajax-webmail-mailfront03 (Coremail) ; Thu, 28 Mar 2019 21:57:06
	+0800 (GMT+08:00)
X-Originating-IP: [203.187.182.140]
Date: Thu, 28 Mar 2019 21:57:06 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Guan Xuetao" <gxt@mprc.pku.edu.cn>
To: "markus armbruster" <armbru@redhat.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.7b build 20180509(9e2321e9)
	Copyright (c) 2002-2019 www.mailtech.cn pku
In-Reply-To: <875zsed86y.fsf@dusky.pond.sub.org>
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
	<875zsed86y.fsf@dusky.pond.sub.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2c0bc4bf.2d83.169c4970a80.Coremail.gxt@mprc.pku.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: 84FpogD3_4uy0pxcWFixAA--.4256W
X-CM-SenderInfo: qqqqliixuslio6sn3hxhgxhubq/1tbiAQEDB1Py8dJ42wAAsl
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 162.105.129.172
Subject: Re: [Qemu-devel] Maintainers,
 please tell us how to boot your machines!
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
Cc: peter maydell <peter.maydell@linaro.org>,
	anthony green <green@moxielogic.com>, qemu-devel@nongnu.org,
	"edgar e. iglesias" <edgar.iglesias@gmail.com>,
	marek vasut <marex@denx.de>, stefano stabellini <sstabellini@kernel.org>,
	aleksandar rikalo <arikalo@wavecomp.com>, alexander graf <agraf@suse.de>,
	=?UTF-8?Q?herv=C3=A9_poussineau?= <hpoussin@reactos.org>,
	anthony perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	paul durrant <paul.durrant@citrix.com>, jan kiszka <jan.kiszka@web.de>,
	igor mitsyanko <i.mitsyanko@gmail.com>,
	bastian koppelmann <kbastian@mail.uni-paderborn.de>,
	chris wulff <crwulff@gmail.com>,
	jean-christophe dubois <jcd@tribudubois.net>,
	andrey smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, aleksandar markovic <amarkovic@wavecomp.com>,
	aurelien jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NdVVkD5pC9Mj

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2VzLS0tLS0KPiBGcm9tOiAiTWFya3VzIEFybWJydXN0ZXIi
IDxhcm1icnVAcmVkaGF0LmNvbT4KPiBTZW50IFRpbWU6IDIwMTktMDMtMjAgMDI6MzQ6NDUgKFdl
ZG5lc2RheSkKPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gQ2M6ICJFZGdhciBFLiBJZ2xl
c2lhcyIgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbT4sICJIZXJ2w6kgUG91c3NpbmVhdSIgPGhw
b3Vzc2luQHJlYWN0b3Mub3JnPiwgIkFsZWtzYW5kYXIgTWFya292aWMiIDxhbWFya292aWNAd2F2
ZWNvbXAuY29tPiwgIkFsZWtzYW5kYXIgUmlrYWxvIiA8YXJpa2Fsb0B3YXZlY29tcC5jb20+LCAi
QWxleGFuZGVyIEdyYWYiIDxhZ3JhZkBzdXNlLmRlPiwgIkFuZHJleSBTbWlybm92IiA8YW5kcmV3
LnNtaXJub3ZAZ21haWwuY29tPiwgIkFuZHJ6ZWogWmFib3Jvd3NraSIgPGJhbHJvZ2dAZ21haWwu
Y29tPiwgIkFudGhvbnkgR3JlZW4iIDxncmVlbkBtb3hpZWxvZ2ljLmNvbT4sICJBbnRob255IFBl
cmFyZCIgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+LCAiQXVyZWxpZW4gSmFybm8iIDxhdXJl
bGllbkBhdXJlbDMyLm5ldD4sICJCYXN0aWFuIEtvcHBlbG1hbm4iIDxrYmFzdGlhbkBtYWlsLnVu
aS1wYWRlcmJvcm4uZGU+LCAiQ2hyaXMgV3VsZmYiIDxjcnd1bGZmQGdtYWlsLmNvbT4sICJHdWFu
IFh1ZXRhbyIgPGd4dEBtcHJjLnBrdS5lZHUuY24+LCAiSWdvciBNaXRzeWFua28iIDxpLm1pdHN5
YW5rb0BnbWFpbC5jb20+LCAiSmFuIEtpc3prYSIgPGphbi5raXN6a2FAd2ViLmRlPiwgIkplYW4t
Q2hyaXN0b3BoZSBEdWJvaXMiIDxqY2RAdHJpYnVkdWJvaXMubmV0PiwgIk1hcmVrIFZhc3V0IiA8
bWFyZXhAZGVueC5kZT4sICJQYXVsIER1cnJhbnQiIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4s
ICJQZXRlciBNYXlkZWxsIiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiwgIlN0ZWZhbm8gU3Rh
YmVsbGluaSIgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+LCBxZW11LWFybUBub25nbnUub3JnLCBx
ZW11LXBwY0Bub25nbnUub3JnLCB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJq
ZWN0OiBSZTogTWFpbnRhaW5lcnMsIHBsZWFzZSB0ZWxsIHVzIGhvdyB0byBib290IHlvdXIgbWFj
aGluZXMhCj4gCj4gWy4uLl0KPiAKPiBNYWNoaW5lcyB3aXRoIG5vIHN1cHBvcnRlciwgYnV0IGF0
IGxlYXN0IG9uZSBtYWludGFpbmVyOgo+IAo+ICAgICBbLi4uXQo+IAo+ICAgICA9IGh3L3VuaWNv
cmUzMi9wdXYzLmMgPQo+ICAgICBHdWFuIFh1ZXRhbyA8Z3h0QG1wcmMucGt1LmVkdS5jbj4gKG1h
aW50YWluZXI6VW5pQ29yZTMyKQo+IAo+IAo+IFRhcmdldHMgd2hlcmUgd2UgaGF2ZSByZWNlaXZl
ZCBpbmZvcm1hdGlvbiBmb3IgKm5vKiBtYWNoaW5lIHNvIGZhcjoKPiAKPiAgICAgWy4uLl0KPiAg
ICAgdW5pY29yZQoKSSdtIGhlcmUuIE5vdyBJIGNhbiBmaW5hbGx5IGRlYWwgd2l0aCBteSBlbWFp
bCBhY2NvdW50IDxneHRAbXByYy5wa3UuZWR1LmNuPiBhZnRlciBzZXZlcmFsIHllYXJzIGNoYW9z
LgpBbnl3YXksIHNvcnJ5IGZvciBzbyBsYXRlLgoKVG8gYm9vdCB1bmljb3JlMzIgbWFjaGluZSwg
Zm9sbG93aW5nIGNvbW1hbmRzIGFyZSB0ZXN0ZWQgaW4gYnJhbmNoIHN0YWJsZS0yLjc6CgpUbyBj
b25maWd1cmUgdW5pY29yZTMyIHRhcmdldDoKIC4vY29uZmlndXJlICAgICAtLXRhcmdldC1saXN0
PXVuaWNvcmUzMi1zb2Z0bW11ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAg
ICAgICAtLWVuYWJsZS1kZWJ1ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICAgICAgICAgICAgICAtLWRpc2FibGUtc2RsICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAtLWVuYWJsZS1jdXJzZXMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAg
ICAtLWV4dHJhLWNmbGFncz0iLUQgcmVzdHJpY3Q9cmVzdHJpY1QiICAgICAgICAgICAgICAgICAg
IFwKClRvIHJ1biBhIHNpbXBsZSBidXN5Ym94IGltYWdlIG9uIHFlbXUtZGVmY29uZmlnIGtlcm5l
bDoKIC4vcWVtdS1zeXN0ZW0tdW5pY29yZTMyIC1jdXJzZXMgLU0gcHV2MyAtbSA1MTIgLWljb3Vu
dCAwIC1rZXJuZWwgc29tZWRpci96SW1hZ2UKIApQbGVhc2UgY2hlY2sgZ2l0aHViIGZvciBtb3Jl
IGRldGFpbHM6IGh0dHBzOi8vZ2l0aHViLmNvbS9neHQvVW5pQ29yZTMyCgpUaGFua3MsCkd1YW4g
WHVldGFvCg==
