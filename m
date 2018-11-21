Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1553602wrt;
        Wed, 21 Nov 2018 00:01:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5fZG+gV8HHeBAcJUPD14kntck1A1J0Otk78DAqwNl1NF/qj5YmW8Mt+kLdDcRaFP4qGhp0L
X-Received: by 2002:a25:b5ca:: with SMTP id d10-v6mr5064134ybg.375.1542787287624;
        Wed, 21 Nov 2018 00:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542787287; cv=none;
        d=google.com; s=arc-20160816;
        b=T9c9IPg64JMXlCeuXssbkwNgMQkOupvK/aNc8snDKlT4lkDobTXuHy0Lh78Nd+KaEI
         RjhvC8JORRj9r1ymUnvWx2d0cyD3ewI1KB2gmSFVy+Ca1JRx/rwmk5SUO+OuVjNmE/XK
         n0/JuJ9iOOtR3ZnoE1V6M5g7apMRQPJYuPaMUf5h2TwJEyv816K2fiMb/Rnpw8U0c9wl
         lqcAnLKBkpKqSZWc/ODM9VRY5c478gugIdFK3L5ofnitm1IFWvmg9WuWVKjWXs8bAT62
         IJ5mclsbrHsE6uXQSQZowVQfLK4WSTdNEpgZs0XnyyDRFebZ/fluC7I3S5OhKocSdinu
         0DvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=Gs5Y9plFA6xMbaRIG2LclNMEzy6HwXEtGiiuy0dosBo=;
        b=mp75tqzD4hZxQDP/35Z5dtTnQyOweOR6R0V3yKvOcjRIdxeYvAEmeLpH5U/Dl5YH7z
         90cpAzx0NBbKXGO3S2I6tTBlQioybyZ0fC+4Bw6rYF+tpD/4M4I+fF3dSlpG9cZAZr8n
         uJySqWm7GK4GoRv8tFcdzT9+yyUK/DMBIzfk9BzxGw39iP7brfehOsNrab7ikTa+q3vy
         P36xQXj9M61EeHeVHwheJM80vnZXDBY0ppwGmfjV98c/pgNcgnJIlORfrGovacGTJMGT
         9YkwCCz/fvP6dd1ifU+F4WDTtLzz6RRsSrdMbnYKjqOmqrseYzI5pnE2TRZCpGxMcjTv
         h/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q65si9824356ywc.246.2018.11.21.00.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 00:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPNRv-0007ql-4e
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 03:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gPNRj-0007qO-8J
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 03:01:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gPNRg-0005jt-3T
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 03:01:15 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:62274)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gPNRf-0005Gm-Ne; Wed, 21 Nov 2018 03:01:12 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 3284E23099A5BEA65FFF;
	Wed, 21 Nov 2018 16:01:03 +0800 (CST)
Received: from kjyxapp03.zte.com.cn ([10.30.12.202])
	by mse01.zte.com.cn with SMTP id wAL802Kt016935;
	Wed, 21 Nov 2018 16:00:02 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp05[null]) by mapi (Zmail) with MAPI id mid14;
	Wed, 21 Nov 2018 16:00:04 +0800 (CST)
Date: Wed, 21 Nov 2018 16:00:04 +0800 (CST)
X-Zmail-TransId: 2b075bf51084214b1073
X-Mailer: Zmail v1.0
Message-ID: <201811211600040239948@zte.com.cn>
In-Reply-To: <CAFEAcA-u=_kq66ZxawHhGCjkKjCo=urw7W3GfOwYK00AMRfWjg@mail.gmail.com>
References: 1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn,
	1542365406-81310-5-git-send-email-peng.hao2@zte.com.cn,
	CAFEAcA-u=_kq66ZxawHhGCjkKjCo=urw7W3GfOwYK00AMRfWjg@mail.gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <peter.maydell@linaro.org>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wAL802Kt016935
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_V7_4/6=5D_hw/arm/virt=3A_Use_the_p?=
 =?utf-8?q?vpanic_device?=
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LAvgNzOAykGp



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PiA+ICBBZGQgcHZwYW5pYyBkZXZpY2UgaW4gYXJtIHZpcnQgbWFjaGluZS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQZW5nIEhhbyA8cGVuZy5oYW8yQHp0ZS5jb20uY24+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gPiAtLS0K
PiA+ICBkZWZhdWx0LWNvbmZpZ3MvYXJtLXNvZnRtbXUubWFrIHwgIDEgKwo+ID4gIGh3L2FybS92
aXJ0LmMgICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiA+ICBp
bmNsdWRlL2h3L2FybS92aXJ0LmggICAgICAgICAgIHwgIDEgKwo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kZWZhdWx0LWNvbmZpZ3Mv
YXJtLXNvZnRtbXUubWFrIGIvZGVmYXVsdC1jb25maWdzL2FybS1zb2Z0bW11Lm1hawo+ID4gaW5k
ZXggMjQyMDQ5MS4uNTAzNDVkZiAxMDA2NDQKPiA+IC0tLSBhL2RlZmF1bHQtY29uZmlncy9hcm0t
c29mdG1tdS5tYWsKPiA+ICsrKyBiL2RlZmF1bHQtY29uZmlncy9hcm0tc29mdG1tdS5tYWsKPiA+
IEBAIC0xNTksMyArMTU5LDQgQEAgQ09ORklHX1BDSV9ERVNJR05XQVJFPXkKPiA+ICBDT05GSUdf
U1RST05HQVJNPXkKPiA+ICBDT05GSUdfSElHSEJBTks9eQo+ID4gIENPTkZJR19NVVNJQ1BBTD15
Cj4gPiArQ09ORklHX1BWUEFOSUM9eQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LmMgYi9o
dy9hcm0vdmlydC5jCj4gPiBpbmRleCA5ZjY3NzgyLi5jNGYyOWM4IDEwMDY0NApbLi4uXQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29tcGF0aWJsZSIsICJxZW11LHB2cGFuaWMt
bW1pbyIpOwo+ID4gKyAgICBxZW11X2ZkdF9zZXRwcm9wX3NpemVkX2NlbGxzKHZtcy0+ZmR0LCBu
b2RlbmFtZSwgInJlZyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMiwg
YmFzZSwgMiwgc2l6ZSk7Cj4gCj4gTm90ZSB0aGF0IHdlIGNhbid0IHRha2UgdGhlc2UgcGF0Y2hl
cyBpbnRvIFFFTVUgdW50aWwgdGhlIGRldmljZQo+IHRyZWUgYmluZGluZyBoYXMgYmVlbiBhZ3Jl
ZWQgdXBzdHJlYW0gYW5kIGFjY2VwdGVkIGludG8gdGhlIGtlcm5lbC4KPiAKa2VybmVsIHBhcnQg
OiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gv
Y2hhci1taXNjLmdpdC9sb2cvP2g9Y2hhci1taXNjLW5leHQKPiA+ICsgICAgZ19mcmVlKG5vZGVu
YW1lKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIHZvaWQgY3JlYXRlX2ZkdChWaXJ0TWFjaGlu
ZVN0YXRlICp2bXMpCj4gPiAgewo+ID4gICAgICB2b2lkICpmZHQgPSBjcmVhdGVfZGV2aWNlX3Ry
ZWUoJnZtcy0+ZmR0X3NpemUpOwo+ID4gQEAgLTE1MzEsNiArMTU1MCw4IEBAIHN0YXRpYyB2b2lk
IG1hY2h2aXJ0X2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQo+ID4KPiA+ICAgICAgY3JlYXRl
X2ZsYXNoKHZtcywgc3lzbWVtLCBzZWN1cmVfc3lzbWVtID8gc2VjdXJlX3N5c21lbSA6IHN5c21l
bSk7Cj4gPgo+ID4gKyAgICBjcmVhdGVfcHZwYW5pY19kZXZpY2Uodm1zKTsKPiA+ICsKPiA+ICAg
ICAgY3JlYXRlX2dpYyh2bXMsIHBpYyk7Cj4gCj4gQXMgU2hhbm5vbiBzdWdnZXN0cywgd2Ugc2hv
dWxkIG5vdCBiZSBjcmVhdGluZyB0aGlzIGRldmljZSBieSBkZWZhdWx0LgpJJ20gIGp1c3Qgd29y
a2luZyBmb3IgdGhhdC4gClRoYW5rcy4KPiAKPiB0aGFua3MKPiAtLSBQTU0=


--=====_003_next=====--

--=====_001_next=====--

