Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6442508wrd;
        Tue, 28 Aug 2018 06:54:47 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYfv+CcP7+iWPAbJYBUBjW6tTkntFc7NBRszossEhLo4fTfw/drY3/JAJ+k5Z8wR62fMh+x
X-Received: by 2002:a37:5f03:: with SMTP id t3-v6mr1581591qkb.193.1535464487294;
        Tue, 28 Aug 2018 06:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535464487; cv=none;
        d=google.com; s=arc-20160816;
        b=eSNd1SQrScImN/+hnRJ3Rpqgdns42FaMjT5HCxRIBXRJpYc4DFrFWdQg8ItsMMijsc
         1cRn2xD4p1sSc60u+43dIPKsBJjBDERtku9QZ3oJcGLTB5FCiTLEIEQXpCRRWkQhnlLD
         M4pajRJCY97NqeBIcuwBCL/FDZwn1d3iyzinD/NAfQW872QKGQ4kwsURH1DMpq0GdQtv
         4fN+cdOH8VDyq24MGMyqAvZBfaHwxbwq+eQYqOU4faFeaNk/xW3wLLTeG4AlTUrL1O2g
         TcsKnF6Cq6Qcity79ltifRp3Xe3BWUVy2znAddgNbbb7M+g1eaDeRUMdvNDCHrEPSyf/
         cj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=FXnzTnswWt3kOu4gSieK7bgk9t1LxBuRhfmaePqAo4c=;
        b=VCl9lMEKUjUCccvgeReRP+Lw2pu8o5AF461Yl24OF1YgjKCm5UDzAO13p44N/WNL8L
         T7UPaX3QONwDJOvFBQFvbfGwqgT6qGEfwpGpwvqfwVBhalpv5xGxYRw6vRnLH37wqNTw
         MqNTZPZHKr1Ro07xRWxpbff0GHsMxff2ilXQ/q9r1OBq746rASnKeZKpXX4v+myJHlXb
         cIsw7woPfmBE6m6L7f5LisaBja2luwN6LSnX5HiV1MorHYzd9r4RFX31I+2x3guW3Udn
         JjqsD037j+7pv/cEaaLcLV3qrhvDY83VzTXDMSpFABXVyGFgrZtT5iOxuop2xP8DdqFv
         LSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r14-v6si916923qvn.159.2018.08.28.06.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Aug 2018 06:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fueSE-0004Fy-QR
	for alex.bennee@linaro.org; Tue, 28 Aug 2018 09:54:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fueQo-0003CX-CB
	for qemu-devel@nongnu.org; Tue, 28 Aug 2018 09:53:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fueQn-0000TH-41
	for qemu-devel@nongnu.org; Tue, 28 Aug 2018 09:53:18 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2406 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fueQa-0000Kn-9d; Tue, 28 Aug 2018 09:53:06 -0400
Received: from DGGEMA403-HUB.china.huawei.com (unknown [172.30.72.56])
	by Forcepoint Email with ESMTP id 7801015BC3488;
	Tue, 28 Aug 2018 21:52:58 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.239]) by
	DGGEMA403-HUB.china.huawei.com ([10.3.20.44]) with mapi id
	14.03.0399.000; Tue, 28 Aug 2018 21:52:56 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Shannon Zhao <shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [Qemu-arm] [PATCH v7 2/2] target: arm: Add support for VCPU
	event states
Thread-Index: AQHUPgNQ3z6zy7PShUi3h4pqR0Pq7KTUgL2AgACvciA=
Date: Tue, 28 Aug 2018 13:52:56 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201E1AD64@dggema523-mbx.china.huawei.com>
References: <1535402777-46620-1-git-send-email-gengdongjiu@huawei.com>
	<1535402777-46620-3-git-send-email-gengdongjiu@huawei.com>
	<c2e71ef7-5e5e-873c-0ec3-b36a257256c3@gmail.com>
In-Reply-To: <c2e71ef7-5e5e-873c-0ec3-b36a257256c3@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.52.187]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.187
Subject: [Qemu-devel] =?utf-8?b?562U5aSNOiBbUWVtdS1hcm1dIFtQQVRDSCB2NyAy?=
 =?utf-8?q?/2=5D_target=3A_arm=3A_Add_support_for_VCPU_event_states?=
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vhdY9En8eM/N

SGkgU2hhbm5vbg0KICAg77ypaGF2ZSBjaGFuZ2VkIGl0IGFjY29yZGluZyB0byB5b3VyIGNvbW1l
bnRzIGFuZCByZXBvc3QgdGhlIHBhdGNoZXMsIHRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAN
Cj4gSGksDQo+IA0KPiBPbiA4LzI4LzIwMTggNDo0NiBBTSwgRG9uZ2ppdSBHZW5nIHdyb3RlOg0K
PiA+IFRoaXMgcGF0Y2ggZXh0ZW5kcyB0aGUgcWVtdS1rdm0gc3RhdGUgc3luYyBsb2dpYyB3aXRo
IHN1cHBvcnQgZm9yDQo+ID4gS1ZNX0dFVC9TRVRfVkNQVV9FVkVOVFMsIGdpdmluZyBhY2Nlc3Mg
dG8geWV0IG1pc3NpbmcgU0Vycm9yIGV4Y2VwdGlvbi4NCj4gPiBBbmQgYWxzbyBpdCBjYW4gc3Vw
cG9ydCB0aGUgZXhjZXB0aW9uIHN0YXRlIG1pZ3JhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IERvbmdqaXUgR2VuZyA8Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiBj
aGFuZ2Ugc2luY2UgdjY6DQo+ID4gMS4gQWRkIGNvdmVyIGxldHRlcg0KPiA+IDIuIENoYW5nZSBu
YW1lICJjcHUvcmFzIiB0byAiY3B1L3NlcnJvciINCj4gPiAzLiBBZGQgc29tZSBjb21tZW50cyBh
bmQgY2hlY2sgdGhlIGlvY3RsIHJldHVybiB2YWx1ZSBmb3INCj4gPiBrdm1fcHV0X3ZjcHVfZXZl
bnRzKCkNCj4gPg0KPiA+IENoYW5nZSBzaW5jZSB2NToNCj4gPiBhZGRyZXNzIFBldGVyJ3MgY29t
bWVudHM6DQo+ID4gMS4gTW92ZSB0aGUgInN0cnVjdCBzZXJyb3IiIGJlZm9yZSB0aGUgImVuZF9y
ZXNldF9maWVsZHMiIGluDQo+ID4gQ1BVQVJNU3RhdGUgMi4gUmVtb3ZlIEFSTV9GRUFUVVJFX1JB
U19FWFQgYW5kIGFkZCBhIHZhcmlhYmxlDQo+ID4gaGF2ZV9pbmplY3Rfc2Vycm9yX2VzciAzLiBV
c2UgdGhlIHZhcmlhYmxlIGhhdmVfaW5qZWN0X3NlcnJvcl9lc3IgdG8NCj4gPiB0cmFjayB3aGV0
aGVyIHRoZSBrZXJuZWwgaGFzIHN0YXRlIHdlIG5lZWQgdG8gbWlncmF0ZSA0LiBSZW1vdmUNCj4g
PiBwcmludGYoKSBpbiBrdm1fYXJjaF9wdXRfcmVnaXN0ZXJzKCkgNS4gcmFzX25lZWRlZC92bXN0
YXRlX3JhcyB0bw0KPiA+IHNlcnJvcl9uZWVkZWQvdm1zdGF0ZV9zZXJyb3IgNi4gQ2hlY2sgdG8g
dXNlICJyZXR1cm4NCj4gPiBlbnYuc2Vycm9yLnBlbmRpbmcgIT0gMCIgaW5zdGVhZCBvZiAiYXJt
X2ZlYXR1cmUoZW52LA0KPiA+IEFSTV9GRUFUVVJFX1JBU19FWFQpIiBpbiB0aGUgcmFzX25lZWRl
ZCgpDQo+ID4NCj4gPiBDaGFuZ2Ugc2luY2UgdjQ6DQo+ID4gMS4gUmViYXNlIHRoZSBjb2RlIHRv
IGxhdGVzdA0KPiA+DQo+ID4gQ2hhbmdlIHNpbmNlIHYzOg0KPiA+IDEuIEFkZCBhIG5ldyBuZXcg
c3Vic2VjdGlvbiB3aXRoIGEgc3VpdGFibGUgJ3Jhc19uZWVkZWQnIGZ1bmN0aW9uDQo+ID4gICAg
IGNvbnRyb2xsaW5nIHdoZXRoZXIgaXQgaXMgcHJlc2VudA0KPiA+IDIuIEFkZCBhIEFSTV9GRUFU
VVJFX1JBUyBmZWF0dXJlIGJpdCBmb3IgQ1BVQVJNU3RhdGUNCj4gPiAtLS0NCj4gPiAgIHRhcmdl
dC9hcm0vY3B1LmggICAgIHwgIDcgKysrKysrDQo+ID4gICB0YXJnZXQvYXJtL2t2bTY0LmMgICB8
IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgIHRhcmdldC9hcm0vbWFjaGluZS5jIHwgMjIgKysrKysrKysrKysrKysrKysNCj4gPiAg
IDMgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L3RhcmdldC9hcm0vY3B1LmggYi90YXJnZXQvYXJtL2NwdS5oIGluZGV4DQo+ID4gNjJjMzZiNC4u
NzAzMDY4MCAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvYXJtL2NwdS5oDQo+ID4gKysrIGIvdGFy
Z2V0L2FybS9jcHUuaA0KPiA+IEBAIC01MzAsNiArNTMwLDEzIEBAIHR5cGVkZWYgc3RydWN0IENQ
VUFSTVN0YXRlIHsNCj4gPiAgICAgICAgICAgICovDQo+ID4gICAgICAgfSBleGNlcHRpb247DQo+
ID4NCj4gPiArICAgIC8qIEluZm9ybWF0aW9uIGFzc29jaWF0ZWQgd2l0aCBhbiBTRXJyb3IgKi8N
Cj4gPiArICAgIHN0cnVjdCB7DQo+ID4gKyAgICAgICAgdWludDMyX3QgcGVuZGluZzsNCj4gPiAr
ICAgICAgICB1aW50MzJfdCBoYXNfZXNyOw0KPiB3aHkgdXNlIHVpbnQzMl90IGZvciBhIGJvb2wg
cGFyYW1ldGVyIGhlcmUgd2hpbGUgaXQncyB1OCBpbiB0aGUga2VybmVsIGhlYWRlcj8NCj4gDQo+
ID4gKyAgICAgICAgdWludDY0X3QgZXNyOw0KPiA+ICsgICAgfSBzZXJyb3I7DQo+ID4gKw0KPiA+
ICAgICAgIC8qIFRodW1iLTIgRUUgc3RhdGUuICAqLw0KPiA+ICAgICAgIHVpbnQzMl90IHRlZWNy
Ow0KPiA+ICAgICAgIHVpbnQzMl90IHRlZWhicjsNCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2Fy
bS9rdm02NC5jIGIvdGFyZ2V0L2FybS9rdm02NC5jIGluZGV4DQo+ID4gZTBiODI0Ni4uNmUwMjUy
YyAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvYXJtL2t2bTY0LmMNCj4gPiArKysgYi90YXJnZXQv
YXJtL2t2bTY0LmMNCj4gPiBAQCAtMjksNiArMjksNyBAQA0KPiA+ICAgI2luY2x1ZGUgImh3L2Fy
bS9hcm0uaCINCj4gPg0KPiA+ICAgc3RhdGljIGJvb2wgaGF2ZV9ndWVzdF9kZWJ1ZzsNCj4gPiAr
c3RhdGljIGJvb2wgaGF2ZV9pbmplY3Rfc2Vycm9yX2VzcjsNCj4gPg0KPiA+ICAgLyoNCj4gPiAg
ICAqIEFsdGhvdWdoIHRoZSBBUk0gaW1wbGVtZW50YXRpb24gb2YgaGFyZHdhcmUgYXNzaXN0ZWQg
ZGVidWdnaW5nIEBADQo+ID4gLTU0Niw2ICs1NDcsMTAgQEAgaW50IGt2bV9hcmNoX2luaXRfdmNw
dShDUFVTdGF0ZSAqY3MpDQo+ID4NCj4gPiAgICAgICBrdm1fYXJtX2luaXRfZGVidWcoY3MpOw0K
PiA+DQo+ID4gKyAgICAvKiBDaGVjayB3aGV0aGVyIHVzZXJzcGFjZSBjYW4gc3BlY2lmeSBndWVz
dCBzeW5kcm9tZSB2YWx1ZSAqLw0KPiA+ICsgICAgaGF2ZV9pbmplY3Rfc2Vycm9yX2VzciA9IGt2
bV9jaGVja19leHRlbnNpb24oY3MtPmt2bV9zdGF0ZSwNCj4gPiArDQo+ID4gKyBLVk1fQ0FQX0FS
TV9JTkpFQ1RfU0VSUk9SX0VTUik7DQo+ID4gKw0KPiA+ICAgICAgIHJldHVybiBrdm1fYXJtX2lu
aXRfY3ByZWdfbGlzdChjcHUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gQEAgLTYwMCw2ICs2MDUsNTkg
QEAgaW50IGt2bV9hcm1fY3ByZWdfbGV2ZWwodWludDY0X3QgcmVnaWR4KQ0KPiA+ICAgI2RlZmlu
ZSBBQVJDSDY0X1NJTURfQ1RSTF9SRUcoeCkgICAoS1ZNX1JFR19BUk02NCB8IEtWTV9SRUdfU0la
RV9VMzIgfCBcDQo+ID4gICAgICAgICAgICAgICAgICAgIEtWTV9SRUdfQVJNX0NPUkUgfCBLVk1f
UkVHX0FSTV9DT1JFX1JFRyh4KSkNCj4gPg0KPiA+ICtzdGF0aWMgaW50IGt2bV9wdXRfdmNwdV9l
dmVudHMoQVJNQ1BVICpjcHUpIHsNCj4gPiArICAgIENQVUFSTVN0YXRlICplbnYgPSAmY3B1LT5l
bnY7DQo+ID4gKyAgICBzdHJ1Y3Qga3ZtX3ZjcHVfZXZlbnRzIGV2ZW50cyA9IHt9Ow0KPiA+ICsg
ICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIWt2bV9oYXNfdmNwdV9ldmVudHMoKSkg
ew0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIG1l
bXNldCgmZXZlbnRzLCAwLCBzaXplb2YoZXZlbnRzKSk7DQo+ID4gKyAgICBldmVudHMuZXhjZXB0
aW9uLnNlcnJvcl9wZW5kaW5nID0gZW52LT5zZXJyb3IucGVuZGluZzsNCj4gPiArDQo+ID4gKyAg
ICAvKiBJbmplY3QgU0Vycm9yIHRvIGd1ZXN0IHdpdGggc3BlY2lmaWVkIHN5bmRyb21lIGlmIGhv
c3Qga2VybmVsDQo+ID4gKyAgICAgKiBzdXBwb3J0cyBpdCwgb3RoZXJ3aXNlIGluamVjdCBTRXJy
b3Igd2l0aG91dCBzeW5kcm9tZS4NCj4gPiArICAgICAqLw0KPiA+ICsgICAgaWYgKGhhdmVfaW5q
ZWN0X3NlcnJvcl9lc3IpIHsNCj4gPiArICAgICAgICBldmVudHMuZXhjZXB0aW9uLnNlcnJvcl9o
YXNfZXNyID0gZW52LT5zZXJyb3IuaGFzX2VzcjsNCj4gPiArICAgICAgICBldmVudHMuZXhjZXB0
aW9uLnNlcnJvcl9lc3IgPSBlbnYtPnNlcnJvci5lc3I7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+
ICsgICAgcmV0ID0ga3ZtX3ZjcHVfaW9jdGwoQ1BVKGNwdSksIEtWTV9TRVRfVkNQVV9FVkVOVFMs
ICZldmVudHMpOw0KPiA+ICsgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgIGVycm9yX3JlcG9y
dCgiZmFpbGVkIHRvIHB1dCB2Y3B1IGV2ZW50cyIpOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiAr
ICAgIHJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQga3ZtX2dldF92
Y3B1X2V2ZW50cyhBUk1DUFUgKmNwdSkgew0KPiA+ICsgICAgQ1BVQVJNU3RhdGUgKmVudiA9ICZj
cHUtPmVudjsNCj4gPiArICAgIHN0cnVjdCBrdm1fdmNwdV9ldmVudHMgZXZlbnRzOw0KPiA+ICsg
ICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIWt2bV9oYXNfdmNwdV9ldmVudHMoKSkg
ew0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIG1l
bXNldCgmZXZlbnRzLCAwLCBzaXplb2YoZXZlbnRzKSk7DQo+ID4gKyAgICByZXQgPSBrdm1fdmNw
dV9pb2N0bChDUFUoY3B1KSwgS1ZNX0dFVF9WQ1BVX0VWRU5UUywgJmV2ZW50cyk7DQo+ID4gKw0K
PiA+ICsgICAgaWYgKHJldCA8IDApIHsNCj4gbGlrZSB0aGUgcHV0IGZ1bmN0aW9uLCBpdCdzIGJl
dHRlciB0byBhZGQgYSBlcnJvcl9yZXBvcnQgaGVyZS4NCj4gDQo+IFRoYW5rcywNCj4gU2hhbm5v
bg0KPiA+ICsgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAg
ZW52LT5zZXJyb3IucGVuZGluZyA9IGV2ZW50cy5leGNlcHRpb24uc2Vycm9yX3BlbmRpbmc7DQo+
ID4gKyAgICBlbnYtPnNlcnJvci5oYXNfZXNyID0gZXZlbnRzLmV4Y2VwdGlvbi5zZXJyb3JfaGFz
X2VzcjsNCj4gPiArICAgIGVudi0+c2Vycm9yLmVzciA9IGV2ZW50cy5leGNlcHRpb24uc2Vycm9y
X2VzcjsNCj4gPiArDQo+ID4gKyAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIGlu
dCBrdm1fYXJjaF9wdXRfcmVnaXN0ZXJzKENQVVN0YXRlICpjcywgaW50IGxldmVsKQ0KPiA+ICAg
ew0KPiA+ICAgICAgIHN0cnVjdCBrdm1fb25lX3JlZyByZWc7DQo+ID4gQEAgLTcyNyw2ICs3ODUs
MTEgQEAgaW50IGt2bV9hcmNoX3B1dF9yZWdpc3RlcnMoQ1BVU3RhdGUgKmNzLCBpbnQgbGV2ZWwp
DQo+ID4gICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gKyAgICBy
ZXQgPSBrdm1fcHV0X3ZjcHVfZXZlbnRzKGNwdSk7DQo+ID4gKyAgICBpZiAocmV0KSB7DQo+ID4g
KyAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gICAgICAgaWYgKCF3
cml0ZV9saXN0X3RvX2t2bXN0YXRlKGNwdSwgbGV2ZWwpKSB7DQo+ID4gICAgICAgICAgIHJldHVy
biBFSU5WQUw7DQo+ID4gICAgICAgfQ0KPiA+IEBAIC04NjMsNiArOTI2LDExIEBAIGludCBrdm1f
YXJjaF9nZXRfcmVnaXN0ZXJzKENQVVN0YXRlICpjcykNCj4gPiAgICAgICB9DQo+ID4gICAgICAg
dmZwX3NldF9mcGNyKGVudiwgZnByKTsNCj4gPg0KPiA+ICsgICAgcmV0ID0ga3ZtX2dldF92Y3B1
X2V2ZW50cyhjcHUpOw0KPiA+ICsgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgIHJldHVybiBy
ZXQ7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICAgICAgIGlmICghd3JpdGVfa3Ztc3RhdGVfdG9f
bGlzdChjcHUpKSB7DQo+ID4gICAgICAgICAgIHJldHVybiBFSU5WQUw7DQo+ID4gICAgICAgfQ0K
PiA+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL21hY2hpbmUuYyBiL3RhcmdldC9hcm0vbWFjaGlu
ZS5jIGluZGV4DQo+ID4gZmY0ZWMyMi4uZDZkYWRmMSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQv
YXJtL21hY2hpbmUuYw0KPiA+ICsrKyBiL3RhcmdldC9hcm0vbWFjaGluZS5jDQo+ID4gQEAgLTE3
Miw2ICsxNzIsMjcgQEAgc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX3N2
ZSA9IHsNCj4gPiAgIH07DQo+ID4gICAjZW5kaWYgLyogQUFSQ0g2NCAqLw0KPiA+DQo+ID4gK3N0
YXRpYyBib29sIHNlcnJvcl9uZWVkZWQodm9pZCAqb3BhcXVlKSB7DQo+ID4gKyAgICBBUk1DUFUg
KmNwdSA9IG9wYXF1ZTsNCj4gPiArICAgIENQVUFSTVN0YXRlICplbnYgPSAmY3B1LT5lbnY7DQo+
ID4gKw0KPiA+ICsgICAgcmV0dXJuIGVudi0+c2Vycm9yLnBlbmRpbmcgIT0gMDsNCj4gPiArfQ0K
PiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX3NlcnJv
ciA9IHsNCj4gPiArICAgIC5uYW1lID0gImNwdS9zZXJyb3IiLA0KPiA+ICsgICAgLnZlcnNpb25f
aWQgPSAxLA0KPiA+ICsgICAgLm1pbmltdW1fdmVyc2lvbl9pZCA9IDEsDQo+ID4gKyAgICAubmVl
ZGVkID0gc2Vycm9yX25lZWRlZCwNCj4gPiArICAgIC5maWVsZHMgPSAoVk1TdGF0ZUZpZWxkW10p
IHsNCj4gPiArICAgICAgICBWTVNUQVRFX1VJTlQzMihlbnYuc2Vycm9yLnBlbmRpbmcsIEFSTUNQ
VSksDQo+ID4gKyAgICAgICAgVk1TVEFURV9VSU5UMzIoZW52LnNlcnJvci5oYXNfZXNyLCBBUk1D
UFUpLA0KPiA+ICsgICAgICAgIFZNU1RBVEVfVUlOVDY0KGVudi5zZXJyb3IuZXNyLCBBUk1DUFUp
LA0KPiA+ICsgICAgICAgIFZNU1RBVEVfRU5EX09GX0xJU1QoKQ0KPiA+ICsgICAgfQ0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiAgIHN0YXRpYyBib29sIG1fbmVlZGVkKHZvaWQgKm9wYXF1ZSkNCj4gPiAg
IHsNCj4gPiAgICAgICBBUk1DUFUgKmNwdSA9IG9wYXF1ZTsNCj4gPiBAQCAtNzI2LDYgKzc0Nyw3
IEBAIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX2FybV9jcHUgPSB7DQo+ID4gICAj
aWZkZWYgVEFSR0VUX0FBUkNINjQNCj4gPiAgICAgICAgICAgJnZtc3RhdGVfc3ZlLA0KPiA+ICAg
I2VuZGlmDQo+ID4gKyAgICAgICAgJnZtc3RhdGVfc2Vycm9yLA0KPiA+ICAgICAgICAgICBOVUxM
DQo+ID4gICAgICAgfQ0KPiA+ICAgfTsNCj4gPg0K
