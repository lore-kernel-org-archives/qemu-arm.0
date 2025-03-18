Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3234530njb;
        Tue, 18 Mar 2025 15:02:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3ekMddlpASyDmIkjYsJKcz/D7VEmybQs7gGUFPuXxtnA9yL8i/64izjyqcDkLvxjdCMrixNjJK8b6Eg==@linaro.org
X-Received: by 2002:a17:90b:4c4e:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-301bde41b97mr394793a91.7.1742335321900;
        Tue, 18 Mar 2025 15:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742335321; cv=none;
        d=google.com; s=arc-20240605;
        b=S6Vqr0Q2+rCemof/+iT2YehuQBs4R5Mn6kTfCg/owRDwc9WVsmNCirX9gj0/GZ9VOA
         1Bhxv4EsveB2ayWRBdjMA32A7ZsNWhUj+QjqOIBI2HYVj5qI0eueME9yb39qt0sUYKBk
         PVUj4qPZ18q2ob81NN5Z2aNiRne5l9QPiAxvLJ31eqWw0ABlWEchfkVRreaEN5wcAlOK
         wjxj9fuHXl/oZthxOTEIr+UnOqBvlSYsGOhnhhiaaB7tk/fHrMIlui3DvejGQ/ztZ7xR
         d/EdsyYimE2fRJbQZYSV+BTyFvqVuAV84qVjymdNulBWf00sRNyfGp1+Y9GKrFFBxSl/
         2CDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=H1ma9eYDFTQwEAmIoEMN4Tv/PH0ALZLbCTLzoj3VnYo=;
        fh=3eyuHdNhPFlEc/d1VGKpSga03IfLdhSc17CRqZ3UShI=;
        b=KJa5+BDujIE3w2aAEApPhriyF6Zk3RWAVNDl2BiN2PncXZ6MYcryOAn/4g+3tSwp8P
         wNCBgGCpcXoc3u17Ji/dN8gTzhRLrOT7MQ07v6SroLNJUDlqmRZgkQJcawmEgR/JTn/9
         9Z3p07AELUUQzs6YRu78TacqKocxiJXyCIWkqjiGF9x3QL+hvVLzgX2V47S+WUr8ZBfb
         Ra8UQcEjA+Xldx5gre/Z05tQwePXgHmuVk7g7wvQ4UT+e3b5DY18wMgUWruLhcPWkdXz
         UEDxi4Es1+kKDE2KVq+JTHfVQNuozGuI081qkEB0bCXWDQKMgfYCeDkrcAKTTh+Xjg0x
         f7eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jolzr252;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-301534efd00sor8546379a91.2.2025.03.18.15.02.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:02:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jolzr252;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742335321; x=1742940121; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H1ma9eYDFTQwEAmIoEMN4Tv/PH0ALZLbCTLzoj3VnYo=;
        b=jolzr252qrX3SZYKXgrM3tBxtOk+Mibt1aJSbpPwe5Hnk4FxFpaLm10yTAnfmVvPaF
         xV6oNeghesAVGC4za4mu1StwB8uzlw0uOI/bHzm/d07d+Ad0Z869g+6vAJ3pgYETZFG4
         YTzDvDwMAHkQi9UH4S/NXnAF50PsXHch8XbE0M8Ymi6mf/L07Jt6Ul8Ni26SArNCuLU8
         yGzcinSTwuHG6tciTKPGsUe48eFRvJBGhl/mquh4gmwY7kZnfCvKCdZGjf7iD1RiwP22
         G5NaHsgkx+qZUjJdx6n3m4oSqUdjZvMP1GxotO8kq1WXtNfsgjMTygAAffjT/oYNlkUF
         11aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742335321; x=1742940121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1ma9eYDFTQwEAmIoEMN4Tv/PH0ALZLbCTLzoj3VnYo=;
        b=muc71Nz6yZXA4odhzwAuxIe3kygOLCGuobrUO8JsEJ6Q/jx4SCnJA8/la/MuEFOUIM
         liyxlVLM3NT9IKaEasl13TWZOl9ylI0bZwce9f7uwigsSqTHLa8lqUsLLh55yriguzX9
         pgsJ5bwaw++E6oeSdBQpLAx1Ejs0gOyG7UQyHpgcUM/Q7cWtTsTmb50CrVphrD+L1T3p
         6m81M1qISq0LICdKJxU92Id6iqvAu5+S2/kX4ir5sqQ8jUPEASrQ01emxoRZiot7Ibdo
         HPdCXQhNK/W8aXckQs4wLRRhDeorAgvQamvcyZNDI4o1/zxZkYEtOttxQoQ4eNLYdH3g
         s7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUv2Py8wy1iIEeVj5bZ6nrjm47IMk7+jm/sld4D4FSc/InaxWF13fS4iHYwGp7lGWToT5MA09fgIDB/aA==@linaro.org
X-Gm-Message-State: AOJu0Yz8C6AvJfj6zX0mgGCuuWciK7+EIfflGrDCo4UC9ezc+9aNdsxQ
	pSGnUT9P6t1oj1EMCryBYZ5Z7SyJQSe7Q/Keljtz6uqKUgZBSQDdfN+1Jt7nubtuBd2Rf47JOn9
	B+Q4=
X-Gm-Gg: ASbGncvpQo1KEdGh0/MSGu8VlYuxEPuHY1muBDc2ZHFvvTMxs5iZZM1RsGmOo4bZcwa
	awrjbq23Wqy9mgxsReuumlswV7D1zm1uE92hhrtg4v1d5etoNqg7SdUB2HuYjbrJe2RFnbVJ1MV
	BacyqO3swaT93giS4YYc0mhZsEaA/qO+CzY8BL8QM9/TKrAEwnvywrTAyKjVoC/bvKeN6oUNMLH
	o6zBLGNoM7iftiClYLGRB5i9pVYm96Hqdy+fGxXLK96dkuHABFFc+iofTzkatwJCWtEzYJWEmEv
	gTruRwnfWPtfv/+2ZFYAbcYbJkR6vl+rblJyXVv66GrtzEjsDcGLDrq6JA==
X-Google-Smtp-Source: AGHT+IGA6xCelHZF+AcnCIa4FYtOlE+IfHizdWlF6wrWrLYDP61Pg/rKjIzimS7rzlvz3MmiPDdYTQ==
X-Received: by 2002:a17:90b:4b8e:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-301bde44515mr422400a91.5.1742335321248;
        Tue, 18 Mar 2025 15:02:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5a12fasm4355a91.24.2025.03.18.15.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:02:00 -0700 (PDT)
Message-ID: <52000c3d-827f-4e21-afa3-f191c6636b9d@linaro.org>
Date: Tue, 18 Mar 2025 15:02:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm/cpu: define ARM_MAX_VQ once for aarch32
 and aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-10-pierrick.bouvier@linaro.org>
 <a88f54cb-73be-4947-b3be-aa12b120f07e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a88f54cb-73be-4947-b3be-aa12b120f07e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: HRj+NOlz94sh

T24gMy8xOC8yNSAxMTo1MCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE4LzMvMjUgMDU6NTEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBUaGlzIHdpbGwg
YWZmZWN0IHpyZWdzIGZpZWxkIGZvciBhYXJjaDMyLg0KPj4gVGhpcyBmaWVsZCBpcyB1c2Vk
IGZvciBNVkUgYW5kIFNWRSBpbXBsZW1lbnRhdGlvbnMuIE1WRSBpbXBsZW1lbnRhdGlvbg0K
Pj4gaXMgY2xpcHBpbmcgaW5kZXggdmFsdWUgdG8gMCBvciAxIGZvciB6cmVnc1sqXS5kW10s
DQo+PiBzbyB3ZSBzaG91bGQgbm90IHRvdWNoIHRoZSByZXN0IG9mIGRhdGEgaW4gdGhpcyBj
YXNlIGFueXdheS4NCj4gDQo+IFdlIHNob3VsZCBkZXNjcmliZSB3aHkgaXQgaXMgc2FmZSBm
b3IgbWlncmF0aW9uLg0KPiANCj4gSS5lLiB2bXN0YXRlX3phIGRlcGVuZHMgb24gemFfbmVl
ZGVkKCkgLT4gU01FLCBub3QgaW5jbHVkZWQgaW4gMzItYml0DQo+IGNwdXMsIGV0Yy4NCj4g
DQo+IFNob3VsZCB3ZSB1cGRhdGUgdGFyZ2V0L2FybS9tYWNoaW5lLmMgaW4gdGhpcyBzYW1l
IHBhdGNoLCBvciBhDQo+IHByZWxpbWluYXJ5IG9uZT8NCj4gDQoNCnZtc3RhdGVfemEgZGVm
aW5pdGlvbiBhbmQgaW5jbHVzaW9uIGluIHZtc3RhdGVfYXJtX2NwdSBpcyB1bmRlciAjaWZk
ZWYgDQpUQVJHRVRfQUFSQ0g2NC4gSW4gdGhpcyBjYXNlIChUQVJHRVRfQUFSQ0g2NCksIEFS
TV9NQVhfVlEgd2FzIGFscmVhZHkgDQpkZWZpbmVkIGFzIDE2LCBzbyB0aGVyZSBzaG91bGQg
bm90IGJlIGFueSBjaGFuZ2UuDQoNCk90aGVyIHZhbHVlcyBkZXBlbmRpbmcgb24gQVJNX01B
WF9WUSwgZm9yIG1pZ3JhdGlvbiwgYXJlIGFzIHdlbGwgdW5kZXIgDQpUQVJHRVRfQUFSQ0g2
NCBpZmRlZnMgKHZtc3RhdGVfenJlZ19oaV9yZWcsIHZtc3RhdGVfcHJlZ19yZWcsIHZtc3Rh
dGVfdnJlZykuDQoNCkFuZCBmb3Igdm1zdGF0ZV92ZnAsIHdoaWNoIGlzIHByZXNlbnQgZm9y
IGFhcmNoMzIgYXMgd2VsbCwgdGhlIHNpemUgb2YgDQpkYXRhIHVuZGVyIGVhY2ggcmVnaXN0
ZXIgaXMgc3BlY2lmaWNhbGx5IHNldCB0byAyLg0KVk1TVEFURV9VSU5UNjRfU1VCX0FSUkFZ
KGVudi52ZnAuenJlZ3NbMF0uZCwgQVJNQ1BVLCAwLCAyKQ0KDQpTbyBldmVuIGlmIHN0b3Jh
Z2UgaGFzIG1vcmUgc3BhY2UsIGl0IHNob3VsZCBub3QgaW1wYWN0IGFueSB1c2FnZSBvZiBp
dC4NCg0KRXZlbiB0aG91Z2ggdGhpcyBjaGFuZ2UgaXMgdHJpdmlhbCwgSSBkaWRuJ3QgZG8g
aXQgYmxpbmRseSB0byAibWFrZSBpdCANCmNvbXBpbGUiIGFuZCBJIGNoZWNrZWQgdGhlIHZh
cmlvdXMgdXNhZ2VzIG9mIEFSTV9NQVhfVlEgYW5kIHpyZWdzLCBhbmQgSSANCmRpZG4ndCBz
ZWUgYW55dGhpbmcgdGhhdCBzZWVtcyB0byBiZSBhIHByb2JsZW0uDQoNCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmc+DQo+PiAtLS0NCj4+ICAgIHRhcmdldC9hcm0vY3B1LmggfCA2ICstLS0tLQ0KPj4gICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NwdS5oIGIvdGFyZ2V0L2FybS9jcHUuaA0KPj4g
aW5kZXggMjdhMGQ0NTUwZjIuLjAwZjc4ZDY0YmQ4IDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0
L2FybS9jcHUuaA0KPj4gKysrIGIvdGFyZ2V0L2FybS9jcHUuaA0KPj4gQEAgLTE2OSwxMSAr
MTY5LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgQVJNR2VuZXJpY1RpbWVyIHsNCj4+ICAgICAqIEFs
aWduIHRoZSBkYXRhIGZvciB1c2Ugd2l0aCBUQ0cgaG9zdCB2ZWN0b3Igb3BlcmF0aW9ucy4N
Cj4+ICAgICAqLw0KPj4gICAgDQo+PiAtI2lmZGVmIFRBUkdFVF9BQVJDSDY0DQo+PiAtIyBk
ZWZpbmUgQVJNX01BWF9WUSAgICAxNg0KPj4gLSNlbHNlDQo+PiAtIyBkZWZpbmUgQVJNX01B
WF9WUSAgICAxDQo+PiAtI2VuZGlmDQo+PiArI2RlZmluZSBBUk1fTUFYX1ZRICAgIDE2DQo+
PiAgICANCj4+ICAgIHR5cGVkZWYgc3RydWN0IEFSTVZlY3RvclJlZyB7DQo+PiAgICAgICAg
dWludDY0X3QgZFsyICogQVJNX01BWF9WUV0gUUVNVV9BTElHTkVEKDE2KTsNCj4gDQoNCg==
