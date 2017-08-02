Received: by 10.25.44.15 with SMTP id s15csp5873048lfs;
        Wed, 2 Aug 2017 01:37:46 -0700 (PDT)
X-Received: by 10.55.182.198 with SMTP id g189mr29530927qkf.316.1501663066850;
        Wed, 02 Aug 2017 01:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501663066; cv=none;
        d=google.com; s=arc-20160816;
        b=nVI6y4vlrf0KCn76FNeTAXDZdmTUme2xPhOD1uzAjdoK30NOdLLVe4zVyl0lWYzN3w
         ou1C0hYn0xFeWZTJI2lvSVNxM72wAaDPmWozhJExosU5z8dXEFWW7QQWq+BMV/mX5V6D
         J9tP/H1ea8SMucbKCoAC4oyRtCI3DiAwKvwQ8GDpRH367bnbFFoDB/B5auZNloEGA8F0
         eGmI74gZIxdzH56GIgmerXeAkIzaONbtYxz6d8g0pzBzuNFkOIvJfMO8jebRADOhP3dI
         43LS2MZyoo3+6AGlX42Y+qUrksOymKXNd4ARjH6c/AyuOd/2sgCyAk91jxJgOZ0zXs2E
         xIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=rQz6+U9UVWIwz9a91tmEvijqLDUbdFXMNfu//d/lMtk=;
        b=Sv4PGoKTdgiBOvma2hWJJsMvYyA5WtTUneF8XqIFd7Zu52gApZ6wjvNHpEsslgje63
         FAEYCopcWdtAb4RPEObUBwxDlSJzZh1YxL+iKdoM9ddVp11sHZACJzj32vfdRwINSc7K
         h3YCxhq/1utuJim2b9bcBGu3IX7Px+9jnOg0sx2xYs2nP1aWIDoW8wEdwbG+G/5DGggK
         OwqeQJGXDiASLkSN7bwjniTdopAReQWzp97ZHL7/gJpp5eutf6VJk4VwyK9qbCr2sUGk
         UrKHHPIkIXSL0P2HZRmuP6/1O+XEo1qZE5rGSBojnGz1Bb2imojN2+zkZRIyH3qufuqR
         B8ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=bCK373BZ;
       dkim=fail header.i=@messagingengine.com header.b=DMJWQw12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si5306525qks.227.2017.08.02.01.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 01:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=bCK373BZ;
       dkim=fail header.i=@messagingengine.com header.b=DMJWQw12;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcpA0-0003Wg-2w
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 04:37:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dcp9r-0003Wa-Mz
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 04:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dcp9n-0003bJ-K3
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 04:37:35 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53093)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dcp9m-0003Uq-UR; Wed, 02 Aug 2017 04:37:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2B9AC2066F;
	Wed,  2 Aug 2017 04:37:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 02 Aug 2017 04:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=rQz6+U9UVWIwz9a91tmEvijqLDUbdFXMNfu//d/lM
	tk=; b=bCK373BZoVoMCFkvo3LCi/vMgZIOiMFXPhZLlsvKG6yEYe9+/FUcgcthc
	IVzufzoosldkvNVv9WGTH76ySPjMsV20rHEaxnNGXU9dBWgwvxeykGxuMgRnHSfJ
	Okp2PX+FO4Dk3kZ3RL8rtP/hwQD9Vi5F70qWTDe8HxsA3DfYffKZTsnLsm9aN7Pl
	KeGE1tvt6TToEMyh4mqqR0HFH0MFEGgmHq75pEJXu6UYQfBYfOPmqwuqvgBtrt4O
	0syZf6mqjn1WAW/A6fGQImD9DkpHq8KkiP3IAsxF1cXpozTlLLJ7uSllSbiGJgdb
	E+SVrX6ykRiirOWTr0m8UPMOLlzqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rQz6+U9UVWIwz9a91t
	mEvijqLDUbdFXMNfu//d/lMtk=; b=DMJWQw12eSG/CQGlZsepdWe0sOx4q/4U17
	shm8wXYNzkmwmVoWaemN9IcJbz5j1sP7vMkUrFx+4BJeaTFlUjcPvs5LCh9pyK3w
	LJ+k4cehGSQLyq33HsTmA1vqbDXpa70/Cj2DRSAWmmQ4zHv3OFy+jijiesbwYcKF
	ZCGnSfUM9XdpCUIbaY3sdSGhs5ptifM0u9XT1YI/VJaUD1C6ECmpqQ+HhvRZVWq2
	Eqy3A9w8YSbBRbbf6o7sgT+pil9cgUdg5rMJt5VbedWmlgSnrtcIGNChii27436Y
	iPxxI/NzASJZ+6nQzuhnMa7hzCooDQLLRPY/akSWPa0NIaugFkNw==
X-ME-Sender: <xms:SY-BWfVcywtPr08xA7rNgYOGZMNsqYcTczEaRVg21WcW88TW6VTsJw>
X-Sasl-enc: vRACTUk9eiHkHbxvUEopQLleFoFlqf538euxlE4GizIf 1501663048
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7FD9D241DF;
	Wed,  2 Aug 2017 04:37:26 -0400 (EDT)
Message-ID: <1501663040.29409.3.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org
Date: Wed, 02 Aug 2017 18:07:20 +0930
In-Reply-To: <855a154a-4cdf-b29a-6440-5deadbeed12e@kaod.org>
References: <20170801010425.25778-1-andrew@aj.id.au>
	<855a154a-4cdf-b29a-6440-5deadbeed12e@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-JEaDxwHEhN5nLi7aYnCM"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH] watchdog: wdt_aspeed: Add support for the
 reset width register
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
	joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9hPC+j0xjhLQ


--=-JEaDxwHEhN5nLi7aYnCM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE3LTA4LTAxIGF0IDA5OjIxICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBPbiAwOC8wMS8yMDE3IDAzOjA0IEFNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToKPiA+IFRo
ZSByZXNldCB3aWR0aCByZWdpc3RlciBjb250cm9scyBob3cgdGhlIHB1bHNlIG9uIHRoZSBTb0Mn
cyBXRFRSU1R7MSwyfQo+ID4gcGlucyBiZWhhdmVzLiBBIHB1bHNlIGlzIGVtaXR0ZWQgaWYgdGhl
IGV4dGVybmFsIHJlc2V0IGJpdCBpcyBzZXQgaW4KPiA+IFdEVF9DVFJMLiBXRFRfUkVTRVRfV0lE
VEggcmVxdWlyZXMgbWFnaWMgYml0IHBhdHRlcm5zIHRvIGNvbmZpZ3VyZSBib3RoCj4gPiBwdXNo
LXB1bGwvb3Blbi1kcmFpbiBhbmQgYWN0aXZlLWhpZ2gvYWN0aXZlLWxvdyBiZWhhdmlvdXJzIGFu
ZCB0aHVzCj4gPiBuZWVkcyBzb21lIHNwZWNpYWwgaGFuZGxpbmcgaW4gdGhlIHdyaXRlIHBhdGgu
Cj4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlk
LmF1Pgo+ID4gLS0tCj4gPiBJIHVuZGVyc3RhbmQgdGhhdCB3ZSdyZSBpbiBzdGFiaWxpc2F0aW9u
IG1vZGUsIGJ1dCBJIHRob3VnaHQgSSdkIHNlbmQgdGhpcyBvdXQKPiA+IHRvIHByb3Zva2UgYW55
IGZlZWRiYWNrLiBIYXBweSB0byByZXNlbmQgYWZ0ZXIgdGhlIDIuMTAgcmVsZWFzZSBpZiByZXF1
aXJlZC4KPiA+IAo+ID4gwqBody93YXRjaGRvZy93ZHRfYXNwZWVkLmMgfCA0NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmMgYi9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmMKPiA+
IGluZGV4IDhiYmU1NzliNmI2Ni4uNGVmMTQxMmU5OWZjIDEwMDY0NAo+ID4gLS0tIGEvaHcvd2F0
Y2hkb2cvd2R0X2FzcGVlZC5jCj4gPiArKysgYi9ody93YXRjaGRvZy93ZHRfYXNwZWVkLmMKPiA+
IEBAIC0xNCwxMCArMTQsMTAgQEAKPiA+IMKgI2luY2x1ZGUgInFlbXUvdGltZXIuaCIKPiA+IMKg
I2luY2x1ZGUgImh3L3dhdGNoZG9nL3dkdF9hc3BlZWQuaCIKPiA+IMKgCj4gPiAtI2RlZmluZSBX
RFRfU1RBVFVTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDAwIC8gNCkKPiA+IC0jZGVm
aW5lIFdEVF9SRUxPQURfVkFMVUXCoMKgwqDCoMKgwqDCoMKgKDB4MDQgLyA0KQo+ID4gLSNkZWZp
bmUgV0RUX1JFU1RBUlTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDA4IC8gNCkKPiA+IC0j
ZGVmaW5lIFdEVF9DVFJMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgwQyAvIDQp
Cj4gPiArI2RlZmluZSBXRFRfU1RBVFVTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAoMHgwMCAvIDQpCj4gPiArI2RlZmluZSBXRFRfUkVMT0FEX1ZBTFVFwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgwNCAvIDQpCj4gPiArI2RlZmluZSBXRFRfUkVT
VEFSVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDA4IC8gNCkK
PiA+ICsjZGVmaW5lIFdEVF9DVFJMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgKDB4MEMgLyA0KQo+ID4gwqAjZGVmaW5lwqDCoMKgV0RUX0NUUkxfUkVTRVRf
TU9ERV9TT0PCoMKgwqDCoMKgwqDCoCgweDAwIDw8IDUpCj4gPiDCoCNkZWZpbmXCoMKgwqBXRFRf
Q1RSTF9SRVNFVF9NT0RFX0ZVTExfQ0hJUCAoMHgwMSA8PCA1KQo+ID4gwqAjZGVmaW5lwqDCoMKg
V0RUX0NUUkxfMU1IWl9DTEvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCg0KQo+ID4gQEAg
LTI1LDEyICsyNSwyMSBAQAo+ID4gwqAjZGVmaW5lwqDCoMKgV0RUX0NUUkxfV0RUX0lOVFLCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCgyKQo+ID4gwqAjZGVmaW5lwqDCoMKgV0RUX0NUUkxf
UkVTRVRfU1lTVEVNwqDCoMKgwqDCoMKgwqDCoMKgQklUKDEpCj4gPiDCoCNkZWZpbmXCoMKgwqBX
RFRfQ1RSTF9FTkFCTEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoMCkKPiA+ICsj
ZGVmaW5lIFdEVF9SRVNFVF9XSURUSMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAo
MHgxOCAvIDQpCj4gPiArI2RlZmluZcKgwqDCoFdEVF9SRVNFVF9XSURUSF9BQ1RJVkVfSElHSMKg
wqDCoEJJVCgzMSkKPiA+ICsjZGVmaW5lwqDCoMKgwqDCoFdEVF9QT0xBUklUWV9NQVNLwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCgweEZGIDw8IDI0KQo+ID4gKyNkZWZpbmXCoMKgwqDCoMKgV0RUX0FD
VElWRV9ISUdIX01BR0lDwqDCoMKgwqDCoMKgwqAoMHhBNSA8PCAyNCkKPiA+ICsjZGVmaW5lwqDC
oMKgwqDCoFdEVF9BQ1RJVkVfTE9XX01BR0lDwqDCoMKgwqDCoMKgwqDCoCgweDVBIDw8IDI0KQo+
ID4gKyNkZWZpbmXCoMKgwqBXRFRfUkVTRVRfV0lEVEhfUFVTSF9QVUxMwqDCoMKgwqDCoEJJVCgz
MCkKPiA+ICsjZGVmaW5lwqDCoMKgwqDCoFdEVF9EUklWRV9UWVBFX01BU0vCoMKgwqDCoMKgwqDC
oMKgwqAoMHhGRiA8PCAyNCkKPiA+ICsjZGVmaW5lwqDCoMKgwqDCoFdEVF9QVVNIX1BVTExfTUFH
SUPCoMKgwqDCoMKgwqDCoMKgwqAoMHhBOCA8PCAyNCkKPiA+ICsjZGVmaW5lwqDCoMKgwqDCoFdE
VF9PUEVOX0RSQUlOX01BR0lDwqDCoMKgwqDCoMKgwqDCoCgweDhBIDw8IDI0KQo+ID4gKyNkZWZp
bmXCoMKgwqBXRFRfUkVTRVRfV0lEVEhfRFVSQVRJT07CoMKgwqDCoMKgwqAweEZGRjsKPiAKPiBJ
IHdvdWxkIGNhbGwgdGhpcyBkZWZpbmUgV0RUX1JFU0VUX1dJRFRIX0RFRkFVTFQgKDB4RkYpIGFu
ZMKgCj4gdXNlIGl0IGFsc28gaW4gdGhlIGFzcGVlZF93ZHRfcmVzZXQoKQoKVGhpcyBXRFRfUkVT
RVRfV0lEVEhfRFVSQVRJT04gaXMgaW50ZW5kZWQgYXMgYSBtYXNrLiBJdCdzIHByb2JhYmx5CnBv
b3JseSBuYW1lZC4gQXMgSSBmb3VuZCB3aGVuIHJlcGx5aW5nIHRvIFBoaWwsIHRoZSB3aWR0aCBh
Y3R1YWxseQp2YXJpZXMgYmV0d2VlbiB0aGUgQVNUMjQwMCBhbmQgQVNUMjUwMCwgYW5kIG9uIHRo
ZSBBU1QyNTAwIGlzIGFjdHVhbGx5CjIwIGJpdHMgd2lkZSwgbm90IDEyIChhbmQgaXMgOCBiaXRz
IG9uIHRoZSBBU1QyNDAwKS4gSSdsbCBuZWVkIHRvCnJlc3BpbiB0byBmaXggdGhhdC4gT24gdGhl
IG90aGVyaGFuZCwgMHhGRiBpcyB0aGUgZGVmYXVsdCB2YWx1ZSBmb3IgdGhlCmZpZWxkIG9uIGJv
dGggdGhlIEFTVDI0MDAgYW5kIEFTVDI1MDAuCgo+IAo+IEkgaGF2ZSBjaGVja2VkIHRoZSBzcGVj
cyBhbmQgdGhlIGJpdHMgZGVmaW5pdGlvbnMgYXJlIGNvcnJlY3QuCj4gV2hhdCBlbHNlIGNvdWxk
IHdlIG1vZGVsID8gV291bGQgdGhlIHB1bHNlIGJlIGludGVyZXN0aW5nID/CoAoKSHJtLCB3ZSBj
b3VsZC4gSW4gV2l0aGVyc3Bvb24gKGFuZCBSb211bHVzPykgc3lzdGVtcyB0aGUgcHVsc2UgaXMg
YmVpbmcKdXNlZCB0byBkcml2ZSB0aGUgRkFVTFQgcGluIG9uIHRoZSBNQVgzMTc4NSBmYW4gY29u
dHJvbGxlci4gSSd2ZSBnb3QKc29tZSB2ZXJ5IGhhY2t5IHBhdGNoZXMgbHlpbmcgYXJvdW5kIGFk
ZGluZyBQTUJ1cyBzdXBwb3J0IGFuZCBhIGJhc2ljCk1BWDMxNzg1IG1vZGVsIHRvIFFFTVUgLSB3
aXRoIGEgYml0IG9mIGV4dHJhIHdvcmsgd2UgY291bGQgaG9vayB1cCB0aGUKZXh0ZXJuYWwgd2F0
Y2hkb2cgc2lnbmFsIHRvIHRoZSBGQVVMVCBwaW4gYW5kIGRyaXZlIG91ciB2aXJ0dWFsIGZhbnMg
dG8KMTAwJSBQV00gZHV0eSBhcyBwZXIgdGhlIGhhcmR3YXJlLgoKSXQncyBub3QgaGlnaCBvbiBt
eSB0b2RvIGxpc3QgdGhvdWdoIDopCgpBbmRyZXcKCj4gCj4gQy4KPiAKPiAKPiA+IMKgCj4gPiAt
I2RlZmluZSBXRFRfVElNRU9VVF9TVEFUVVPCoMKgwqDCoMKgwqAoMHgxMCAvIDQpCj4gPiAtI2Rl
ZmluZSBXRFRfVElNRU9VVF9DTEVBUsKgwqDCoMKgwqDCoMKgKDB4MTQgLyA0KQo+ID4gLSNkZWZp
bmUgV0RUX1JFU0VUX1dESVRIwqDCoMKgwqDCoMKgwqDCoMKgKDB4MTggLyA0KQo+ID4gKyNkZWZp
bmUgV0RUX1RJTUVPVVRfU1RBVFVTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEwIC8g
NCkKPiA+ICsjZGVmaW5lIFdEVF9USU1FT1VUX0NMRUFSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgKDB4MTQgLyA0KQo+ID4gwqAKPiA+IC0jZGVmaW5lIFdEVF9SRVNUQVJUX01BR0lDwqDC
oMKgwqDCoMKgwqAweDQ3NTUKPiA+ICsjZGVmaW5lIFdEVF9SRVNUQVJUX01BR0lDwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgMHg0NzU1Cj4gPiDCoAo+ID4gwqBzdGF0aWMgYm9vbCBhc3Bl
ZWRfd2R0X2lzX2VuYWJsZWQoY29uc3QgQXNwZWVkV0RUU3RhdGUgKnMpCj4gPiDCoHsKPiA+IEBA
IC01NSw5ICs2NCwxMCBAQCBzdGF0aWMgdWludDY0X3QgYXNwZWVkX3dkdF9yZWFkKHZvaWQgKm9w
YXF1ZSwgaHdhZGRyIG9mZnNldCwgdW5zaWduZWQgc2l6ZSkKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAwOwo+ID4gwqDCoMKgwqDCoGNhc2UgV0RUX0NUUkw6Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gcy0+cmVnc1tXRFRfQ1RSTF07Cj4gPiArwqDCoMKgwqBjYXNlIFdEVF9SRVNF
VF9XSURUSDoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHMtPnJlZ3NbV0RUX1JFU0VUX1dJ
RFRIXTsKPiA+IMKgwqDCoMKgwqBjYXNlIFdEVF9USU1FT1VUX1NUQVRVUzoKPiA+IMKgwqDCoMKg
wqBjYXNlIFdEVF9USU1FT1VUX0NMRUFSOgo+ID4gLcKgwqDCoMKgY2FzZSBXRFRfUkVTRVRfV0RJ
VEg6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqBxZW11X2xvZ19tYXNrKExPR19VTklNUCwKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiJXM6IHVuaW5tcGxl
bWVudGVkIHJlYWQgYXQgb2Zmc2V0IDB4JSIgSFdBRERSX1BSSXggIlxuIiwKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX2Z1bmNfXywgb2Zmc2V0KTsK
PiA+IEBAIC0xMTksOSArMTI5LDI1IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF93ZHRfd3JpdGUodm9p
ZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LCB1aW50NjRfdCBkYXRhLAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB0aW1lcl9kZWwocy0+dGltZXIpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
fQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKgwqBjYXNlIFdEVF9SRVNF
VF9XSURUSDoKPiA+ICvCoMKgwqDCoHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgcHJv
cGVydHkgPSBkYXRhICYgV0RUX1BPTEFSSVRZX01BU0s7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqDCoGlmIChwcm9wZXJ0eSA9PSBXRFRfQUNUSVZFX0hJR0hfTUFHSUMpIHsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzLT5yZWdzW1dEVF9SRVNFVF9XSURUSF0gfD0gV0RUX1JFU0VUX1dJ
RFRIX0FDVElWRV9ISUdIOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKHByb3BlcnR5
ID09IFdEVF9BQ1RJVkVfTE9XX01BR0lDKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cy0+cmVnc1tXRFRfUkVTRVRfV0lEVEhdICY9IH5XRFRfUkVTRVRfV0lEVEhfQUNUSVZFX0hJR0g7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAocHJvcGVydHkgPT0gV0RUX1BVU0hfUFVM
TF9NQUdJQykgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHMtPnJlZ3NbV0RUX1JFU0VU
X1dJRFRIXSB8PSBXRFRfUkVTRVRfV0lEVEhfUFVTSF9QVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqB9IGVsc2UgaWYgKHByb3BlcnR5ID09IFdEVF9PUEVOX0RSQUlOX01BR0lDKSB7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcy0+cmVnc1tXRFRfUkVTRVRfV0lEVEhdICY9IH5XRFRfUkVT
RVRfV0lEVEhfUFVTSF9QVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqB9Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoHMtPnJlZ3NbV0RUX1JFU0VUX1dJRFRIXSAmPSB+V0RUX1JFU0VUX1dJRFRIX0RVUkFU
SU9OOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqBzLT5yZWdzW1dEVF9SRVNFVF9XSURUSF0gfD0gZGF0
YSAmIFdEVF9SRVNFVF9XSURUSF9EVVJBVElPTjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
Cj4gPiArwqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgY2FzZSBXRFRfVElNRU9VVF9TVEFUVVM6Cj4g
PiDCoMKgwqDCoMKgY2FzZSBXRFRfVElNRU9VVF9DTEVBUjoKPiA+IC3CoMKgwqDCoGNhc2UgV0RU
X1JFU0VUX1dESVRIOgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgcWVtdV9sb2dfbWFzayhMT0dfVU5J
TVAsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIiVz
OiB1bmlubXBsZW1lbnRlZCB3cml0ZSBhdCBvZmZzZXQgMHglIiBIV0FERFJfUFJJeCAiXG4iLAo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9fZnVuY19f
LCBvZmZzZXQpOwo+ID4gQEAgLTE2Nyw2ICsxOTMsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfd2R0
X3Jlc2V0KERldmljZVN0YXRlICpkZXYpCj4gPiDCoMKgwqDCoMKgcy0+cmVnc1tXRFRfUkVMT0FE
X1ZBTFVFXSA9IDB4MDNFRjE0ODA7Cj4gPiDCoMKgwqDCoMKgcy0+cmVnc1tXRFRfUkVTVEFSVF0g
PSAwOwo+ID4gwqDCoMKgwqDCoHMtPnJlZ3NbV0RUX0NUUkxdID0gMDsKPiA+ICvCoMKgwqDCoHMt
PnJlZ3NbV0RUX1JFU0VUX1dJRFRIXSA9IDBYRkY7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoHRpbWVy
X2RlbChzLT50aW1lcik7Cj4gPiDCoH0KPiA+IAo+IAo+IA==


--=-JEaDxwHEhN5nLi7aYnCM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZgY9AAAoJEJ0dnzgO5LT5L3AP/Rrbl6sm9FB/xeUwvfxIpcxN
Ro1iX510uoapoUzYwqrET4o8zZSlUTdF0ivu84n+Ov2MzHtk+8MFpogMlESElWlF
t93hYAkKYuz1+oo1NkSxCP4ApDUZXb+8Sm92k9Y5r80xtolIFZUaKHIKQ4W2kAQF
7ovRYSS32kYOwyzNedl1mbY6xahAo5VKxpIFTIPjzKTs+bwM0VDUA9Ev4wC/buUF
g7suURorzXpR/OUuaJeBK/OR+b17CZ1p0djpy+kFFwBE7Ki6eCux8cwnQJSj15+y
snf35Ig/4irF+T1TEqOmhzKErUzFmWUU5JP//1rCCr8TOoyA6d2/Aaw0Le1kWsZ8
VZTdjp8KfILw7jDPVMlvpM6ifuypRrDXMl7qjM66Dqat2AXBUc5fw3NPBMKaLZTX
fPsnHYi2HcOYZ/3kmmW07XgwROlJKX7hNQzigmDQPFVQK0Z6Hxee11b/XFqVO0Yc
2kY0EiojcWszzdCuFADbQ4yp2qh9eCXX+h8YkLsPNJf6nyC/66N52SRXL9DuRjFG
8V3ueIu+VTSbHLZOnoz+rJpIinrB6VGuhcP/lHiBBMGHg7NK7XSgT1tLG9r/c8fC
4dNKLRU7oNCITEl7unzSje8u8WI7zZxCXkfgVpxEk3dSafQ0H5hgCPFKOheO9dhK
L+B9TfDNtrpDKJUMEOoF
=Hh3x
-----END PGP SIGNATURE-----

--=-JEaDxwHEhN5nLi7aYnCM--

