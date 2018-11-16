Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp144483wrw;
        Fri, 16 Nov 2018 01:22:09 -0800 (PST)
X-Google-Smtp-Source: AJdET5cC+f8DAFxrH7g5eCe1dBUwCOpm6OjS3GFChWscqprURWjLZ3BXAoH4pyYX4wbiB6avwPrM
X-Received: by 2002:a37:99c5:: with SMTP id b188mr9771246qke.100.1542360129463;
        Fri, 16 Nov 2018 01:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542360129; cv=none;
        d=google.com; s=arc-20160816;
        b=kklD7nwNSwx7vn6U+BmaYvd0qo39l2IShp8iLCMERTevR/xbXaUmfk82WzgBuVqCIO
         smvZpZWiTSgLgkVfIp9Yw3KoqVEeYvJlt4bbcWTr5mK4DGZGAIsAeYYNxzdmvhIIgsDz
         qbAvAplRhfwiNAEbf3Nh8RLYnPRCL5fK9gESO6xfxg/sYFlo0YU/C4EXwSvvSpYSnlXD
         H14bKkhaNqvtymBuEZMIo0yjsfF6ngqDvqY51e7JCp8O5OlEnoxiR7NqsR9IAf38PsKE
         Ebmco/7qo9ckHogIERVqAJfiBwYDXodqdq0QS+AFPlyCMnAtbHoxCmwq9imvQr1jhDlB
         iczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=mfHHMsW0hFjnXORzefAiL8j0MWoukqcOLj0zHSFQ2Zg=;
        b=RlGyZhlHoFG42oawKOAWJnttD1lUhLTqa/S/+D/9G4BFs3t05Irr9hPnYAXzYfkE3c
         XQ4PCNxwmawtPpUT4WBuCGi1z96RqKWLUbqM5VFv8upMhnE4aMHG1mZey3XvCh6Giio/
         QJoiGE/Pi0i3YE7qg30rRgWJiLL+51F4lyKRdlKJ7u05IfV1H7unG3lf0DdRP4KReYnG
         SmQfRQfyEFzbq9Z+tfqqwoKfx9vibEbx6MByIGgZI8uSvvW+TB86y+bdUsqSS1UdIpQH
         C9PcLD49GcpnjcJkHUWLSYeBvei+j6hgkH9ZLdVgiJlnjyt++YFKKufzG3azXqRSWfVg
         Aqhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si11746036qtr.32.2018.11.16.01.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNaKG-0005mS-W8
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:22:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNaK5-0005mF-9U
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNaK1-00015c-Ra
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:21:57 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:37538 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNaK1-00013w-54; Fri, 16 Nov 2018 04:21:53 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3605C21EF63C67452897;
	Fri, 16 Nov 2018 17:21:44 +0800 (CST)
Received: from kjyxapp05.zte.com.cn ([10.30.12.204])
	by mse01.zte.com.cn with SMTP id wAG9LBvb076969;
	Fri, 16 Nov 2018 17:21:31 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 16 Nov 2018 17:21:33 +0800 (CST)
Date: Fri, 16 Nov 2018 17:21:33 +0800 (CST)
X-Zmail-TransId: 2b055bee8c1dff7b3887
X-Mailer: Zmail v1.0
Message-ID: <201811161721333758820@zte.com.cn>
In-Reply-To: <20181116090751.272tyagevqwvosy6@kamzik.brq.redhat.com>
References: 20181115141003.r6imovu25ymatm4w@kamzik.brq.redhat.com,
	20181116090751.272tyagevqwvosy6@kamzik.brq.redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <drjones@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wAG9LBvb076969
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_V6_5/6=5D_hw/arm/?=
 =?utf-8?q?virt=3A_add_pvpanic_deviceinvirt_acpi_table?=
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D+/EYnXSSYKs



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pj4gPj4gYWRkIHB2cGFuaWMgZGV2aWNlIGluIHZpcnQgYWNwaSB0YWJsZSwgc28gd2hlbiBrZW5y
ZWwgY29tbWFuZCBsaW5lIHVzZXMKPj4gPj4gYWNwaT1mb3JjZSwga2VybmVsIGNhbiBnZXQgaW5m
byBmcm9tIGFjcGkgdGFibGUgaW4gYWFyY2g2NC4KPj4KPj4gWy4uLl0KPj4KPj4gPj4KPj4gPj4g
K3N0YXRpYyB2b2lkIGFjcGlfZHNkdF9hZGRfcHZwYW5pYyhBbWwgKnNjb3BlLCBjb25zdCBNZW1N
YXBFbnRyeSAqcHZwYW5pY19tZW1tYXApCj4+ID4+ICt7Cj4+ID4+ICsgICAgQW1sICpkZXYgPSBh
bWxfZGV2aWNlKCJQQU5DIik7Cj4+ID4KPj4gPlNob3VsZG4ndCB0aGlzIGJlICJQRVZUIiAoInBh
bmljIGV2ZW50IiksIGxpa2UgaXQgaXMgZm9yIHg4Nj8KPj4gPgo+PiB5ZWFoLCBJIHdpbGwgY2hh
bmdlIGl0Lgo+PiA+PiArICAgIGFtbF9hcHBlbmQoZGV2LCBhbWxfbmFtZV9kZWNsKCJfSElEIiwg
YW1sX3N0cmluZygiUUVNVTAwMDEiKSkpOwo+PiA+PiArICAgIGFtbF9hcHBlbmQoZGV2LCBhbWxf
bmFtZV9kZWNsKCJfVUlEIiwgYW1sX2ludCgwKSkpOwo+PiA+Cj4+ID5XaHkgYWRkIF9VSUQ/IEFs
c28sIEkgc2VlIHg4NiBoYWQgc29tZSBpc3N1ZXMgd2l0aCBub3QgaGF2aW5nIF9TVEEgYW5kCj4+
ID50aGVuIGhhdmluZyBhIF9TVEEgd2l0aG91dCB0aGUgVUkgZmxhZy4gSXQgbm93IGhhcyBfU1RB
PTB4Zgo+PiA+KFBSRVNFTlR8RU5BQkxFRHxVSXxGVU5DVElPTklORykuIEknbSBub3Qgc2F5aW5n
IHdlIG5lZWQgdG8gZG8gdGhhdCB0bywKPj4gPmJ1dCBJJ2QgbGlrZSB0byBrbm93IGlmIGl0IHdh
cyBjb25zaWRlcmVkIGFuZCBkZWNpZGVkIHdlIGRvbid0IG5lZWQgdG8uCj4+ID4KPj4gVGhlIHdh
eSB0aGUga2VybmVsIGNvZGUgcHJvY2Vzc2VzIF9TVEEgaXMgdGhhdCBpZiBfU1RBIGlzIG5vdCBm
b3VuZCwgdGhlIGRlZmF1bHQKPj4gc2V0dGluZyBpcyAoUFJFU0VOVHxFTkFCTEVEfFVJfEZVTkNU
SU9OSU5HKS4gU28gSSB0aGluayBpdCBpcyBub3QgbmVjZXNzYXJ5Cj4+ICB0byBhZGQgaXQuIEl0
IGlzIG9ubHkgcGFyc2VkIGluIHRoZSBwdnBhbmljIGRyaXZlci4KPgo+R29vZCBlbm91Z2ggZm9y
IG1lLgo+Cj4+IGZvciBfVUlELCBJIHRoaW5rIGl0IGlzIHVzZWQgZm9yIGRldmljZSBpbmRleC4g
SSBqdXN0IGZpbGwgaXQgd2l0aCAwIGJlY2F1c2UgdGhlcmUgaXMKPj4gb25seSBvbmUgcHZwYW5p
YyBkZXZpY2UuCj4KPk9LLCBidXQgSSdtIHN0aWxsIG5vdCBzdXJlIGl0J3MgbmVjZXNzYXJ5Lgo+
CnlvdSBjYW4gc2VlIG90aGVyIGRldmljZXMgaW4gdmlydC1hY3BpLWJ1aWxkLmMuIF9VSUQgaXMg
dXNlZCBmb3IgZGV2aWNlIGluZGV4LgoKPj4KPj4gYnkgdGhlIHdheSwgSG93IHRvIGdldCB0aGUg
dmFsdWUgb2YgQUNQSSBjb252ZW5pZW50bHk/IGhvdyBkb3UgeW91IGdldCB0aGUKPj4gdmFsdWUg
b2YgX1NUQT8KPgo+Tm90IHN1cmUgd2hhdCB5b3UgbWVhbiBoZXJlLiBGcm9tIHdoZXJlIGRvIHlv
dSB3YW50IHRvIGNoZWNrIHRoZSB2YWx1ZT8KPklmIHlvdSBtZWFuIGZyb20gZ3Vlc3QgdXNlcnNw
YWNlLCB0aGVuIHRoZXJlJ3Mgbm90aGluZyBjb252ZW5pZW50IHRoYXQgSQo+a25vdyBvZi4gWW91
J2xsIGhhdmUgdG8gZGlzYXNzZW1ibGUgdGhlIHRhYmxlcyB5b3UgZXh0cmFjdCBmcm9tIHN5c2Zz
LAo+YWZhaWsuCj4KeWVhaCAsSSBqdXN0IHdhbnQgdG8ga25vdyB0aGlzLgp0aGFua3MKPlRoYW5r
cywKPmRyZXcKCj4KPiBUaGFua3MuCj4gPj4gKwo+ID4+ICsgICAgQW1sICpjcnMgPSBhbWxfcmVz
b3VyY2VfdGVtcGxhdGUoKTsKPiA+PiArICAgIGFtbF9hcHBlbmQoY3JzLCBhbWxfbWVtb3J5MzJf
Zml4ZWQocHZwYW5pY19tZW1tYXAtPmJhc2UsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHB2cGFuaWNfbWVtbWFwLT5zaXplLCBBTUxfUkVBRF9XUklURSkpOwo+
ID4+ICsKPiA+PiArICAgIGFtbF9hcHBlbmQoZGV2LCBhbWxfbmFtZV9kZWNsKCJfQ1JTIiwgY3Jz
KSk7Cj4gPj4gKwo+ID4+ICsgICAgYW1sX2FwcGVuZChzY29wZSwgZGV2KTsKPiA+PiArfQo+ID4+
ICsKPiA+PiAgc3RhdGljIHZvaWQgYWNwaV9kc2R0X2FkZF91YXJ0KEFtbCAqc2NvcGUsIGNvbnN0
IE1lbU1hcEVudHJ5ICp1YXJ0X21lbW1hcCwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHVhcnRfaXJxKQo+ID4+ICB7Cj4gPj4gQEAgLTc3
MCw2ICs3ODUsNyBAQCBidWlsZF9kc2R0KEdBcnJheSAqdGFibGVfZGF0YSwgQklPU0xpbmtlciAq
bGlua2VyLCBWaXJ0TWFjaGluZVN0YXRlICp2bXMpCj4gPj4gICAgICBhY3BpX2RzZHRfYWRkX2Nw
dXMoc2NvcGUsIHZtcy0+c21wX2NwdXMpOwo+ID4+ICAgICAgYWNwaV9kc2R0X2FkZF91YXJ0KHNj
b3BlLCAmbWVtbWFwW1ZJUlRfVUFSVF0sCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgKGly
cW1hcFtWSVJUX1VBUlRdICsgQVJNX1NQSV9CQVNFKSk7Cj4gPj4gKyAgICBhY3BpX2RzZHRfYWRk
X3B2cGFuaWMoc2NvcGUsICZtZW1tYXBbVklSVF9QVlBBTklDXSk7Cj4gPj4gICAgICBhY3BpX2Rz
ZHRfYWRkX2ZsYXNoKHNjb3BlLCAmbWVtbWFwW1ZJUlRfRkxBU0hdKTsKPiA+PiAgICAgIGFjcGlf
ZHNkdF9hZGRfZndfY2ZnKHNjb3BlLCAmbWVtbWFwW1ZJUlRfRldfQ0ZHXSk7Cj4gPj4gICAgICBh
Y3BpX2RzZHRfYWRkX3ZpcnRpbyhzY29wZSwgJm1lbW1hcFtWSVJUX01NSU9dLAo+ID4+IC0tCj4g
Pj4gMS44LjMuMQo+ID4+Cj4gPj4KPiA+Cj4gPlRoYW5rcywKPiA+ZHJldw==


--=====_003_next=====--

--=====_001_next=====--

