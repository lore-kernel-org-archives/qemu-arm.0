Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2175945njc;
        Mon, 24 Mar 2025 12:21:39 -0700 (PDT)
X-Received: by 2002:a17:902:d504:b0:215:bc30:c952 with SMTP id d9443c01a7336-22780c68a03mr191717895ad.6.1742844099615;
        Mon, 24 Mar 2025 12:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844099; cv=none;
        d=google.com; s=arc-20240605;
        b=eDD72/9c1lg9bhf4/3BWm4lPrzbkKVfyTy4cqTF0z+ZxNZdbGemuY72jzuJyJDqk4j
         j1AtObCZz/y0J/H+98T1YY06nCcWFQRQJZP/5voS9bjzACki1FDpazRKohd1UHwFSAXG
         Kx1YPqn6zXKVLOGRpMhzE2KgTHMuzR3Ar7f3GJ8nIFdf++sZmevjbHk9QkX8v1gRvxQt
         iBLSD7zipjtXjXcnLv6eU2CJkT9Y5mGl+zOW+nQRrc6u6zi2zBxLwx8hXYyhpVk4HrDT
         6g1wAfjgcMICvB8PdTC8aRD54KkpiFWkziyyoFAM9K4nZiV2TuWkbpR5wfKsnz81ynmD
         iFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iln3DDo11cc7Vmz6mM9p5G9GDb/RyNKpodhvE6L6MBc=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=feObjppE85/Uucc2TWZvtK56v4svN3G7iR396HguxwfGc8MfkoyNKT20J3FSz/BeDS
         qTDqayOBaExSaRW4Cl+c5aB/LlGdP12p6aBpU71Yt6Rdm2OiwdIfzCbeG9fzwzN+qx2W
         aYCQbRcjl6IsX6zXvTvI+lKAkkrUYXyrelJSwZ8pQl+bZlDwg5tEeKTdKHBDtCwZEI4C
         jceJoB1FDR5zVzRhCEJUullfOSwX003QCXfGa3mdKU3xv5tnuumnYANXYWxbczETksUk
         C1SX94WMnbmntTtXDOLcjOo3pDA/czNiv4Y3GxuHzUgaPQzTUNl5xDUfSrmJcKRbjF0c
         HsPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IZWyZVgl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2278121f02dsor43997975ad.12.2025.03.24.12.21.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IZWyZVgl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844099; x=1743448899; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iln3DDo11cc7Vmz6mM9p5G9GDb/RyNKpodhvE6L6MBc=;
        b=IZWyZVgl9VYAY9H6PlbclVF4C8Z2oOneCUSHCRDdbWkdPoMzApU4T3UMNF8Jhm+dHb
         XJr7ijSbCjnIk25hRaIgdjUgWcRxV/9fAhCD61a/M02auxTAjaoUo5XnNHv4tQuaGPu3
         rB7RsVDYCDvE+mjzaYQlJFlGUsN/yikkmszm9Yo7QH58o37d8hUz/ilFcgpGryAbGHGb
         L1/b/eF7vIwbMS82C+TO7A3ySBPixBuUGhRvsti9mhbb4M3Y/2k0/AF0DVw2O2heyvtY
         8pS4xONAuaVMm7rkQxQMDpe59xZ+6qW9VcTXjDv2ejLO9+omCBHqNiGKtXT8Co0LjQxu
         OtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844099; x=1743448899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iln3DDo11cc7Vmz6mM9p5G9GDb/RyNKpodhvE6L6MBc=;
        b=ByaSM4pzSTPFieqB+TXcrk9Y26Uzr2Nv11EydJJJziPPVJRx0hlGOyE9dveOtmbo9s
         1kOMt2YSPNLRwwwPAI/XslbFtimODHBIyUKIWwLbEFQbwSC0F0lf+1tDi2TsQWIxs6xM
         xFdg5TiMn11FUQR+NDPFAXcOMFmuqwn6zaCyrq2ffHDtlCpXfzkdhuXUlu47zB6N5I9j
         +18J6ZtJ15UC54x2hiuqs1ZfGpJLTjgIdCeRPQuMEpnvo67bFgc+RCXhdAX8qYIgwzwm
         SupwbR7aPNQZzcWHI6B9BuIVCi/aitHUuLSyu5+rdrPL1pUFw2XvMDSMay2kyFir8oj1
         lIAg==
X-Gm-Message-State: AOJu0Ywf+j5gGkTnzPv1EX/6zFPpMTSpapGLQ6wQ3V7DIQSfCqJj2/SV
	jdBgd9prCiC7iRXtmnzUDCHDaqqnYr/k8VBdoGcsTt6TsGiRt5PafC70hQi0vwtSGLPioufsfpo
	X9HWINw==
X-Gm-Gg: ASbGncseUjDyn9BtYLScaWRZswGSAP8owA20lW6QaM5skQkUCEZMSgHcfly0fFgFYlB
	fb9dXGQEZJYKbaF/BtKVBA9ySxP7Z5Ocj/PdVAJh/3wFIs+kJ1lCtfOtwo14v8KvuhggosxRqZb
	NaxVpykUxvd8TBkrgxOXjItyN3vX8r3T62TrBi1Q6C0FhSa7qpozOzr+6KjJ8zokqxscKuPvAPI
	BOs5QEG1K1raDM+JzvwycythPjXsb/ilaHSlSqeQpz4fYlQwkNAvoJk6v4sQLy/dsGjQrb3Ufye
	ER9YvXMrYgMJW472zleXN0zO8EEFYxRkW4yFqu8MyjRtvSOMqidlJFyYxw==
X-Google-Smtp-Source: AGHT+IHYOY1wVcpMsFGkx0CnQt95K+iJnJ6lKJ0T7VvuOaeFM3sSy/ZmJb+ggNVx8IEMNk94k8I78w==
X-Received: by 2002:a17:902:fc4b:b0:223:4d7e:e52c with SMTP id d9443c01a7336-22780c689f7mr263820695ad.5.1742844099016;
        Mon, 24 Mar 2025 12:21:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f6549sm74940855ad.208.2025.03.24.12.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:21:38 -0700 (PDT)
Message-ID: <9843001d-d42c-4f25-b2d5-c7347e78847f@linaro.org>
Date: Mon, 24 Mar 2025 12:21:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] gdbstub: introduce target independent gdb
 register helper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-5-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 9BlkKAGZCkgN

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgY3VycmVudCBo
ZWxwZXIuaCBmdW5jdGlvbnMgcmVseSBvbiBoYXJkIGNvZGVkIGFzc3VtcHRpb25zIGFib3V0
DQo+IHRhcmdldCBlbmRpYW5lc3MgdG8gdXNlIHRoZSB0c3dhcCBtYWNyb3MuIFdlIGFsc28g
ZW5kIHVwIGRvdWJsZQ0KPiBzd2FwcGluZyBhIGJ1bmNoIG9mIHZhbHVlcyBpZiB0aGUgdGFy
Z2V0IGNhbiBydW4gaW4gbXVsdGlwbGUgZW5kaWFuZXNzDQo+IG1vZGVzLiBBdm9pZCB0aGlz
IGJ5IGdldHRpbmcgdGhlIHRhcmdldCB0byBwYXNzIHRoZSBlbmRpYW5lc3MgYW5kIHNpemUN
Cj4gdmlhIGEgTWVtT3AgYW5kIGZpeGluZyB1cCBhcHByb3ByaWF0ZWx5Lg0KPiANCj4gUmV2
aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
Zz4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPg0KPiANCj4gLS0tDQo+IHYyDQo+ICAgIC0gdXNlIHVuc2lnbmVkIGNvbnNpc3RlbnRs
eQ0KPiAgICAtIGZpeCBzb21lIHJvdWdlIHdoaXRlc3BhY2UNCj4gICAgLSBhZGQgdHlwZWQg
cmVnMzIvNjQgd3JhcHBlcnMNCj4gICAgLSBwYXNzIHZvaWQgKiB0byB1bmRlcmx5aW5nIGhl
bHBlciB0byBhdm9pZCBjYXN0aW5nDQo+IC0tLQ0KPiAgIGluY2x1ZGUvZ2Ric3R1Yi9yZWdp
c3RlcnMuaCB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
ICBnZGJzdHViL2dkYnN0dWIuYyAgICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaA0KPiANCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaCBiL2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3Rl
cnMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi4yMjIw
ZjU4ZWZlDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvaW5jbHVkZS9nZGJzdHViL3JlZ2lz
dGVycy5oDQo+IEBAIC0wLDAgKzEsNTUgQEANCj4gKy8qDQo+ICsgKiBHREIgQ29tbW9uIFJl
Z2lzdGVyIEhlbHBlcnMNCj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgTGluYXJv
IEx0ZA0KPiArICoNCj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9y
LWxhdGVyDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBHREJfUkVHSVNURVJTX0gNCj4gKyNk
ZWZpbmUgR0RCX1JFR0lTVEVSU19IDQo+ICsNCj4gKyNpbmNsdWRlICJleGVjL21lbW9wLmgi
DQo+ICsNCj4gKy8qKg0KPiArICogZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZSgpIC0gZ2V0IHJl
Z2lzdGVyIHZhbHVlIGZvciBnZGINCj4gKyAqIG1vOiBzaXplIGFuZCBlbmRpYW4gTWVtT3AN
Cj4gKyAqIGJ1ZjogR0J5dGVBcnJheSB0byBzdG9yZSBpbiB0YXJnZXQgb3JkZXINCj4gKyAq
IHZhbDogcG9pbnRlciB0byB2YWx1ZSBpbiBob3N0IG9yZGVyDQo+ICsgKg0KPiArICogVGhp
cyByZXBsYWNlcyB0aGUgcHJldmlvdXMgbGVnYWN5IHJlYWQgZnVuY3Rpb25zIHdpdGggYSBz
aW5nbGUNCj4gKyAqIGZ1bmN0aW9uIHRvIGhhbmRsZSBhbGwgc2l6ZXMuIFBhc3NpbmcgQG1v
IGFsbG93cyB0aGUgdGFyZ2V0IG1vZGUgdG8NCj4gKyAqIGJlIHRha2VuIGludG8gYWNjb3Vu
dCBhbmQgYXZvaWRzIHVzaW5nIGhhcmQgY29kZWQgdHN3YXAoKSBtYWNyb3MuDQo+ICsgKg0K
PiArICogVGhlcmUgYXJlIHdyYXBwZXIgZnVuY3Rpb25zIGZvciB0aGUgY29tbW9uIHNpemVz
IHlvdSBjYW4gdXNlIHRvDQo+ICsgKiBrZWVwIHR5cGUgY2hlY2tpbmcuDQo+ICsgKg0KPiAr
ICogUmV0dXJucyB0aGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gdG8gdGhlIGFycmF5Lg0K
PiArICovDQo+ICtpbnQgZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNZW1PcCBvcCwgR0J5dGVB
cnJheSAqYnVmLCB2b2lkICp2YWwpOw0KPiArDQo+ICsvKioNCj4gKyAqIGdkYl9nZXRfcmVn
MzJfdmFsdWUoKSAtIHR5cGUgY2hlY2tlZCB3cmFwcGVyIGZvciBnZGJfZ2V0X3JlZ2lzdGVy
X3ZhbHVlKCkNCj4gKyAqIG1vOiBzaXplIGFuZCBlbmRpYW4gTWVtT3ANCj4gKyAqIGJ1Zjog
R0J5dGVBcnJheSB0byBzdG9yZSBpbiB0YXJnZXQgb3JkZXINCj4gKyAqIHZhbDogcG9pbnRl
ciB0byB1aW50MzJfdCB2YWx1ZSBpbiBob3N0IG9yZGVyDQo+ICsgKi8NCj4gK3N0YXRpYyBp
bmxpbmUgaW50IGdkYl9nZXRfcmVnMzJfdmFsdWUoTWVtT3Agb3AsIEdCeXRlQXJyYXkgKmJ1
ZiwgdWludDMyX3QgKnZhbCkgew0KPiArICAgIGdfYXNzZXJ0KChvcCAmIE1PX1NJWkUpID09
IE1PXzMyKTsNCj4gKyAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShvcCwgYnVm
LCB2YWwpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGdkYl9nZXRfcmVnNjRfdmFsdWUo
KSAtIHR5cGUgY2hlY2tlZCB3cmFwcGVyIGZvciBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKCkN
Cj4gKyAqIG1vOiBzaXplIGFuZCBlbmRpYW4gTWVtT3ANCj4gKyAqIGJ1ZjogR0J5dGVBcnJh
eSB0byBzdG9yZSBpbiB0YXJnZXQgb3JkZXINCj4gKyAqIHZhbDogcG9pbnRlciB0byB1aW50
MzJfdCB2YWx1ZSBpbiBob3N0IG9yZGVyDQo+ICsgKi8NCj4gK3N0YXRpYyBpbmxpbmUgaW50
IGdkYl9nZXRfcmVnNjRfdmFsdWUoTWVtT3Agb3AsIEdCeXRlQXJyYXkgKmJ1ZiwgdWludDY0
X3QgKnZhbCkgew0KPiArICAgIGdfYXNzZXJ0KChvcCAmIE1PX1NJWkUpID09IE1PXzY0KTsN
Cj4gKyAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShvcCwgYnVmLCB2YWwpOw0K
PiArfQ0KPiArDQoNCk1heWJlIHdlIGNvdWxkIHNpbXBseSBleHBlY3QgZW5kaWFuIGluZm9y
bWF0aW9uIGZyb20gTWVtT3AsIGFuZCBhZGQgDQpyZXF1aXJlZCBzaXplIGhlcmUuDQpJdCBj
bHV0dGVycyBjYWxsIHNpdGVzIHRvIGhhdmUgZ2RiX2dldF9yZWdYX3ZhbHVlKE1PX1ggfCAu
Li4pLg0KV2UgY2FuIGV2ZW50dWFsbHkgYXNzZXJ0IG5vIHNpemUgd2FzIHNldCwgc28gaXQn
cyBub3QgYWRkZWQgYnkgbWlzdGFrZSANCmZyb20gY2FsbGVycy4NCg0KPiArI2VuZGlmIC8q
IEdEQl9SRUdJU1RFUlNfSCAqLw0KPiArDQo+ICsNCj4gZGlmZiAtLWdpdCBhL2dkYnN0dWIv
Z2Ric3R1Yi5jIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4gaW5kZXggYjZkNWUxMWUwMy4uZTc5
OWZkYzAxOSAxMDA2NDQNCj4gLS0tIGEvZ2Ric3R1Yi9nZGJzdHViLmMNCj4gKysrIGIvZ2Ri
c3R1Yi9nZGJzdHViLmMNCj4gQEAgLTMyLDYgKzMyLDcgQEANCj4gICAjaW5jbHVkZSAiZXhl
Yy9nZGJzdHViLmgiDQo+ICAgI2luY2x1ZGUgImdkYnN0dWIvY29tbWFuZHMuaCINCj4gICAj
aW5jbHVkZSAiZ2Ric3R1Yi9zeXNjYWxscy5oIg0KPiArI2luY2x1ZGUgImdkYnN0dWIvcmVn
aXN0ZXJzLmgiDQo+ICAgI2lmZGVmIENPTkZJR19VU0VSX09OTFkNCj4gICAjaW5jbHVkZSAi
YWNjZWwvdGNnL3ZjcHUtc3RhdGUuaCINCj4gICAjaW5jbHVkZSAiZ2Ric3R1Yi91c2VyLmgi
DQo+IEBAIC00NSw2ICs0Niw3IEBADQo+ICAgI2luY2x1ZGUgInN5c3RlbS9ydW5zdGF0ZS5o
Ig0KPiAgICNpbmNsdWRlICJleGVjL3JlcGxheS1jb3JlLmgiDQo+ICAgI2luY2x1ZGUgImV4
ZWMvaHdhZGRyLmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9tZW1vcC5oIg0KPiAgIA0KPiAgICNp
bmNsdWRlICJpbnRlcm5hbHMuaCINCj4gICANCj4gQEAgLTU1MSw2ICs1NTMsMjcgQEAgc3Rh
dGljIGludCBnZGJfd3JpdGVfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNwdSwgdWludDhfdCAqbWVt
X2J1ZiwgaW50IHJlZykNCj4gICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiArLyoN
Cj4gKyAqIFRhcmdldCBoZWxwZXIgZnVuY3Rpb24gdG8gcmVhZCB2YWx1ZSBpbnRvIEdCeXRl
QXJyYXksIHRhcmdldA0KPiArICogc3VwcGxpZXMgdGhlIHNpemUgYW5kIHRhcmdldCBlbmRp
YW5lc3MgdmlhIHRoZSBNZW1PcC4NCj4gKyAqLw0KPiAraW50IGdkYl9nZXRfcmVnaXN0ZXJf
dmFsdWUoTWVtT3Agb3AsIEdCeXRlQXJyYXkgKmJ1Ziwgdm9pZCAqdmFsKQ0KPiArew0KPiAr
ICAgIHVuc2lnbmVkIGJ5dGVzID0gbWVtb3Bfc2l6ZShvcCk7DQo+ICsNCj4gKyAgICBpZiAo
b3AgJiBNT19CU1dBUCkgew0KPiArICAgICAgICB1aW50OF90ICpwdHIgPSAmKCh1aW50OF90
ICopIHZhbClbYnl0ZXMgLSAxXTsNCj4gKyAgICAgICAgZm9yICh1bnNpZ25lZCBpID0gYnl0
ZXM7IGkgPiAwOyBpLS0pIHsNCj4gKyAgICAgICAgICAgIGdfYnl0ZV9hcnJheV9hcHBlbmQo
YnVmLCBwdHItLSwgMSk7DQo+ICsgICAgICAgIH07DQo+ICsgICAgfSBlbHNlIHsNCj4gKyAg
ICAgICAgZ19ieXRlX2FycmF5X2FwcGVuZChidWYsIHZhbCwgYnl0ZXMpOw0KPiArICAgIH0N
Cj4gKw0KPiArICAgIHJldHVybiBieXRlczsNCj4gK30NCj4gKw0KPiArDQo+ICAgc3RhdGlj
IHZvaWQgZ2RiX3JlZ2lzdGVyX2ZlYXR1cmUoQ1BVU3RhdGUgKmNwdSwgaW50IGJhc2VfcmVn
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdkYl9nZXRfcmVnX2Ni
IGdldF9yZWcsIGdkYl9zZXRfcmVnX2NiIHNldF9yZWcsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3QgR0RCRmVhdHVyZSAqZmVhdHVyZSkNCg0K
