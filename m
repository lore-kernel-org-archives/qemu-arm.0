Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp829400wrt;
        Mon, 19 Nov 2018 05:12:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U80KVsdHFFuBagvrXw72+iKVouF+/iTKAryGs1eDt8HH1dQwEHKX+dZreZ1r/n0JDGWtqE
X-Received: by 2002:a25:ad64:: with SMTP id l36-v6mr4501878ybe.59.1542633163484;
        Mon, 19 Nov 2018 05:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542633163; cv=none;
        d=google.com; s=arc-20160816;
        b=p+O5Uf2QQLX+tSTxa9APXAlweiOQgZakTuDnja4RS8KSSrs+sHFYImZC/OXUceuJ2k
         YFOp5EKKsY4MmDcXxfcKudC4d+nUwhyZSZAFwy3khh4JcTO/7gIH7t4jVf09y1rA6mdq
         jDYcqPsLFCYL8eGhDKQVQaUespaRYQ60KyT1dMGdT2z1K5amwdCswo1heYU1ciIfg04/
         zJopC0KG6bxlc1ToRNts/0b4jS4vJiL7ibBth1k7ClbBgTPPQHclSXRm2I7ZuXmiQTTf
         cHTuDEiBHz1JjIqA7IpF7kvqVdnoNH1Z++xW1sojnVnaACSDCywQSTEcNALWhpa/u3HE
         w7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=b2pwJYNdgGJvW/QDw0EHs73FW59DVJj9sEuCCbgNT+4=;
        b=xMksoF9EflAISRR/a0rYmyql+SdePBQULS+FLQc0hQv9r4ixMX5tVJ0jcYSzvEhNAW
         iUMKAbsJVW1azyByPDyNQsciphzZfAj+1KSPhk63/NqBh6uVAGQE9d7uFXo4Rd+lLSgU
         1d1FPN/h6cnMj0gJkJasjDnIiNexOW85ZdtFTyrMjhBiOdN/nEM2zBXiYbfFe4xmYive
         XY4Ya3cy3f8tcj9SdK95S3u5DiB9poiirv/H1dBfcU2Jw8+lftZY9Kc6LccpycXg1jJq
         piFenm6dq1t8N95qzyK9nuNZwjH4DIQX9tP+VhUmtTbB5p1RSG4YtfJQ5P61cAkU+/Yy
         6c6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c66-v6si23708395yba.347.2018.11.19.05.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 05:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOjM2-0001rP-To
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 08:12:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gOjKF-0000mk-AS
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 08:10:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gOjK9-0002WF-CF
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 08:10:51 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:12200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gOjK9-0002Nr-14; Mon, 19 Nov 2018 08:10:45 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 09A1C95FC0ADCE9378FE;
	Mon, 19 Nov 2018 21:10:37 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse02.zte.com.cn with SMTP id wAJD9xp0055339;
	Mon, 19 Nov 2018 21:09:59 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp05[null]) by mapi (Zmail) with MAPI id mid14;
	Mon, 19 Nov 2018 21:10:03 +0800 (CST)
Date: Mon, 19 Nov 2018 21:10:03 +0800 (CST)
X-Zmail-TransId: 2b075bf2b62b63f03e43
X-Mailer: Zmail v1.0
Message-ID: <201811192110034389139@zte.com.cn>
In-Reply-To: <5fb48e39-d91b-6750-975b-ea58575ade92@redhat.com>
References: 1542482566-91660-1-git-send-email-peng.hao2@zte.com.cn,
	5fb48e39-d91b-6750-975b-ea58575ade92@redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <eric.auger@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wAJD9xp0055339
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH=5D_hw/arm/sysbus-?=
 =?utf-8?q?fdt=3A_fix_assert_in_matchfunction?=
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +riv3senn0PR



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PkhpIFBlbmcsCj4KPk9uIDExLzE3LzE4IDg6MjIgUE0sIFBlbmcgSGFvIHdyb3RlOgo+PiBJbiBt
YXRjaCBmdW5jdGlvbiBpdCBzaG91bGQgbm90IGNhbGwgT0JKRUNLX0NIRUNLLiBXaGVuIHRoZXJl
IGlzCj4+IGEgbWlzbWF0Y2gsIHdlIHNob3VsZCBjb250aW51ZSB0byBtYXRjaCByYXRoZXIgdGhh
biBhc3NlcnQoKS4KPgo+Tm9ybWFsbHkgdGhpcyBpc3N1ZSBzaG91bGQgaGF2ZSBiZWVuIGZpeGVk
IGJ5Cj5lOWFjOGU4NGYwICAiaHcvYXJtL3N5c2J1cy1mZHQ6IE9ubHkgY2FsbCBtYXRjaF9mbiBj
YWxsYmFjayBpZiB0aGUgdHlwZQo+bWF0Y2hlcyIuIFBsZWFzZSBjYW4geW91IGNvbmZpcm0/Cj4K
CnllcyxpdCB3b3JrcyBhZnRlciB1cGRhdGluZyB5b3VyIHBhdGNoLgpUaGFua3MuCj5UaGFua3MK
Pgo+RXJpYwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEhhbyA8cGVuZy5oYW8yQHp0ZS5jb20u
Y24+Cj4+IC0tLQo+PiAgaHcvYXJtL3N5c2J1cy1mZHQuYyB8IDcgKysrKysrLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvaHcvYXJtL3N5c2J1cy1mZHQuYyBiL2h3L2FybS9zeXNidXMtZmR0LmMKPj4gaW5kZXggMGUy
NGM4MC4uNDFiOTYyZCAxMDA2NDQKPj4gLS0tIGEvaHcvYXJtL3N5c2J1cy1mZHQuYwo+PiArKysg
Yi9ody9hcm0vc3lzYnVzLWZkdC5jCj4+IEBAIC00MTksMTAgKzQxOSwxNSBAQCBzdGF0aWMgaW50
IGFkZF9hbWRfeGdiZV9mZHRfbm9kZShTeXNCdXNEZXZpY2UgKnNiZGV2LCB2b2lkICpvcGFxdWUp
Cj4+ICBzdGF0aWMgYm9vbCB2ZmlvX3BsYXRmb3JtX21hdGNoKFN5c0J1c0RldmljZSAqc2JkZXYs
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IEJpbmRpbmdFbnRyeSAq
ZW50cnkpCj4+ICB7Cj4+IC0gICAgVkZJT1BsYXRmb3JtRGV2aWNlICp2ZGV2ID0gVkZJT19QTEFU
Rk9STV9ERVZJQ0Uoc2JkZXYpOwo+PiArICAgIFZGSU9QbGF0Zm9ybURldmljZSAqdmRldjsKPj4g
ICAgICBjb25zdCBjaGFyICpjb21wYXQ7Cj4+ICAgICAgdW5zaWduZWQgaW50IG47Cj4+Cj4+ICsg
ICAgdmRldiA9IChWRklPUGxhdGZvcm1EZXZpY2UgKikgb2JqZWN0X2R5bmFtaWNfY2FzdChPQkpF
Q1Qoc2JkZXYpLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVFlQRV9WRklPX1BMQVRGT1JNKTsKPj4gKyAgICBpZiAoIXZkZXYpCj4+ICsgICAgICAg
IHJldHVybiBmYWxzZTsKPj4gKwo+PiAgICAgIGZvciAobiA9IHZkZXYtPm51bV9jb21wYXQsIGNv
bXBhdCA9IHZkZXYtPmNvbXBhdDsgbiA+IDA7Cj4+ICAgICAgICAgICBuLS0sIGNvbXBhdCArPSBz
dHJsZW4oY29tcGF0KSArIDEpIHsKPj4gICAgICAgICAgaWYgKCFzdHJjbXAoZW50cnktPmNvbXBh
dCwgY29tcGF0KSkgewo+Pg==


--=====_003_next=====--

--=====_001_next=====--

