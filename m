Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2182423njc;
        Mon, 24 Mar 2025 12:34:55 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22780e613c0mr237287945ad.53.1742844895123;
        Mon, 24 Mar 2025 12:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844895; cv=none;
        d=google.com; s=arc-20240605;
        b=bW9WRwzkmtsniyA/2ubvzxwwQtvGfJGINxuJ/GH3prf9hUdJmpWP4hZtMFCSAEAfJa
         2xAbqVXymQdhgqpcElPtFliCrzIMmMl8le+H/nhTsJGGaAOTVKnCOjmZnD7nzajYeecw
         9lhYCrFM9D9uKkf03T2lMu1aGg0YaVljitve7iFeZ1FSiYJOUwQD/Sj8qGDn6wFEUOy/
         KM61tcdjPZ5QUgxOFcOTaycFyRJrBgfiICoSjAQwRz6GQkcr5zPl5iAAoJph9X8UwvD/
         +wKAMg7wdluGHOyj+sS8jVlmq7UP3k3ygAgBsZEbCNdlDlm74hpHGkUoAyAYfnj6zOgT
         3B1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aeH9RQhBnFZWp0TPHaRdCYGX7cmOgtfwhX7OsjrUk0Q=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=hlUax4GkZXysvjaTU08Kn1jEORH9Mhwd7FmbtFaiLp77nwaIS2uEJ5Xba1ibHBOE9F
         b9IG9jVnsYXIAn17eI7YdOSzFCZWra75xdqHspSXK6lRu7vTULpdUaugdJF9B96IaZBt
         7My+DKz/KrFXS5wJ1xCW/Hbj0P5ywo/NeCDTTYilNYQeaVaq1iNrY9YFOvYQrxkcf8Pg
         TyDvtxl7SzRw3A/eOV3soO1IUhC3q1lIRY9v94YdJA8MN9UL9OOBCGHCyCFHeOpwQ/Ho
         T8WgSTfl5/k0APF5cEU1N16pMtoN9wxJHPPVbMSnqN4yR01T7LbzTCyQ0fTxbspwiePX
         M/YQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Eek0Wt/V";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780ee8b73sor53700005ad.1.2025.03.24.12.34.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Eek0Wt/V";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844895; x=1743449695; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeH9RQhBnFZWp0TPHaRdCYGX7cmOgtfwhX7OsjrUk0Q=;
        b=Eek0Wt/VGXbWS/B4tPCxzM4cXctAPRtSvVs3sSnUMVy1yuvcnIfrIM11+VR8BiQ8Un
         ugMCWh1R0+UfwXVtNq6EigrP32/eSX365h94CiwUwbwXeHxfjq+X4YoU9PXCpBV342dG
         WGdgz1CGWYy3DPaPq/v667R08VKdpPCUnaE9w4xdzoIY+F8to3GoSIGuOCif9zEDMlYE
         H62WLkk4FvjtB1Z4KCrxf4TNdtaPP6mCQ/xdm1qKBCGJ7It0IYcj3nXObOH0ZaUaxjmg
         IvFnt7ST093iztKKedVeQjaCC1q0EkH5NBzHz3scT0jWiWiN2w1J+aUKCRJRcGi8p46g
         vZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844895; x=1743449695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeH9RQhBnFZWp0TPHaRdCYGX7cmOgtfwhX7OsjrUk0Q=;
        b=ncDauyA/n8J9Ly9r5C3mLvb4TyUk1bPWbAgswWN0eS+/8SJDUqBSAafW+rKQa79Uhj
         MgTNaDjLzfhDYApUjlWs7L1neL8lEJ3tTICUOoteladlvxdBwBiU/CKdcsGivKsXxaAU
         W4INZtwWiKqUCZnRvYB8UmZFmLWijkqNjRTAnTF0ewCGzF0PsSuTAdLlV2YqAJm4VEvb
         aD2s5nCY7k9whUJAP69YotOLpLBn3LV9H6h8TAXF0mR+IolRHQQCoVg02IIBMCA6vxzt
         D4VumLoVjsgegViTJLP2wwMd0Jq7t0deAeEZCXJm9NTNHLmpUDxzY3FHvxGSaETyS/Gm
         kRcw==
X-Gm-Message-State: AOJu0YxxTir7ogQDLN8aIdQzLXQAtFgBS7rwAlEPiDCpX7tJYUntvA1n
	TFMK/r22MkW+PmkCtT8l/f/ix+2NAppsYS6g52wjkFHLyD8JtLtJ8/JIWQUr0fXTbPUnl/7aZKo
	3wJwoXw==
X-Gm-Gg: ASbGncta73ZRrlnYNtcCn4pnsJ07RNLLJMCW1b/zwKQGCpu8wQv1Q4VaT0BjsAPLJ3B
	2L14UD5GOVxmZS9LKtsfzgfMjU6OeCz4UENpKR7lPWjLrN6goTBNN/0UVHSQR6UThjCj+gxCGig
	IFz83JjxNzFp8lw9f3FTOokGQryPiWA4oOAxEOSMMIOCsNmRMVWTZT8xZY0SBZGgA0BqDO6twvi
	6VshGr9QdAaVwJM1CmxNWvowvyc5PhNv6sIij4uphoHDBXq1U4b90kHLy6Bf1dJtHbcuBZZbufh
	Q8blSxw99RmwgUqf9jWtog3ozRd9inos5ylFSVwQAai0y8JKsJ/cHN4qkCV97C8qBmXP
X-Google-Smtp-Source: AGHT+IHooO5jL1ziRCiPCn/CL3jhY0Q1Avc/fRUahnKG9/h+A+OqC0J8SiM5HjBbmuZFp7eBPW/ieg==
X-Received: by 2002:a17:902:d4c5:b0:216:6283:5a8c with SMTP id d9443c01a7336-22780e3fb8amr226951415ad.39.1742844894529;
        Mon, 24 Mar 2025 12:34:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b596sm75355245ad.16.2025.03.24.12.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:34:54 -0700 (PDT)
Message-ID: <3d79c73d-cfab-4995-8425-f7021b7c2dff@linaro.org>
Date: Mon, 24 Mar 2025 12:34:53 -0700
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
X-TUID: xFsWDrjd5HzN

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
LCB2YWwpOw0KPiArfQ0KPiArDQoNCkFmdGVyIHJlYWRpbmcgdGhlIHdob2xlIHNlcmllcywg
SSB0aGluayBJIGFtIG1pc3NpbmcgdGhlIHBvaW50IG9mIA0KaW50cm9kdWNlIG9wIGhlcmUu
DQpJZiB3aGF0IHdlIHJlYWxseSB3YW50IGlzIGp1c3QgdGhlIHRhcmdldCBlbmRpYW5uZXNz
LCB3aHkgbm90IGFkZCB0aGUgDQoiaWYgdGFyZ2V0X3dvcmRzX2JpZ2VuZGlhbigpIiBpbiB0
aGUgd3JhcHBlciBoZXJlPw0KDQpBcmUgdGhlcmUgY2FzZXMgd2hlcmUgd2Ugd2FudCBhbm90
aGVyIGVuZGlhbm5lc3MgdGhhbiB0YXJnZXQgb25lPw0KDQo+ICsvKioNCj4gKyAqIGdkYl9n
ZXRfcmVnNjRfdmFsdWUoKSAtIHR5cGUgY2hlY2tlZCB3cmFwcGVyIGZvciBnZGJfZ2V0X3Jl
Z2lzdGVyX3ZhbHVlKCkNCj4gKyAqIG1vOiBzaXplIGFuZCBlbmRpYW4gTWVtT3ANCj4gKyAq
IGJ1ZjogR0J5dGVBcnJheSB0byBzdG9yZSBpbiB0YXJnZXQgb3JkZXINCj4gKyAqIHZhbDog
cG9pbnRlciB0byB1aW50MzJfdCB2YWx1ZSBpbiBob3N0IG9yZGVyDQo+ICsgKi8NCj4gK3N0
YXRpYyBpbmxpbmUgaW50IGdkYl9nZXRfcmVnNjRfdmFsdWUoTWVtT3Agb3AsIEdCeXRlQXJy
YXkgKmJ1ZiwgdWludDY0X3QgKnZhbCkgew0KPiArICAgIGdfYXNzZXJ0KChvcCAmIE1PX1NJ
WkUpID09IE1PXzY0KTsNCj4gKyAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShv
cCwgYnVmLCB2YWwpOw0KPiArfQ0KPiArDQo+ICsjZW5kaWYgLyogR0RCX1JFR0lTVEVSU19I
ICovDQo+ICsNCj4gKw0KPiBkaWZmIC0tZ2l0IGEvZ2Ric3R1Yi9nZGJzdHViLmMgYi9nZGJz
dHViL2dkYnN0dWIuYw0KPiBpbmRleCBiNmQ1ZTExZTAzLi5lNzk5ZmRjMDE5IDEwMDY0NA0K
PiAtLS0gYS9nZGJzdHViL2dkYnN0dWIuYw0KPiArKysgYi9nZGJzdHViL2dkYnN0dWIuYw0K
PiBAQCAtMzIsNiArMzIsNyBAQA0KPiAgICNpbmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4g
ICAjaW5jbHVkZSAiZ2Ric3R1Yi9jb21tYW5kcy5oIg0KPiAgICNpbmNsdWRlICJnZGJzdHVi
L3N5c2NhbGxzLmgiDQo+ICsjaW5jbHVkZSAiZ2Ric3R1Yi9yZWdpc3RlcnMuaCINCj4gICAj
aWZkZWYgQ09ORklHX1VTRVJfT05MWQ0KPiAgICNpbmNsdWRlICJhY2NlbC90Y2cvdmNwdS1z
dGF0ZS5oIg0KPiAgICNpbmNsdWRlICJnZGJzdHViL3VzZXIuaCINCj4gQEAgLTQ1LDYgKzQ2
LDcgQEANCj4gICAjaW5jbHVkZSAic3lzdGVtL3J1bnN0YXRlLmgiDQo+ICAgI2luY2x1ZGUg
ImV4ZWMvcmVwbGF5LWNvcmUuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9od2FkZHIuaCINCj4g
KyNpbmNsdWRlICJleGVjL21lbW9wLmgiDQo+ICAgDQo+ICAgI2luY2x1ZGUgImludGVybmFs
cy5oIg0KPiAgIA0KPiBAQCAtNTUxLDYgKzU1MywyNyBAQCBzdGF0aWMgaW50IGdkYl93cml0
ZV9yZWdpc3RlcihDUFVTdGF0ZSAqY3B1LCB1aW50OF90ICptZW1fYnVmLCBpbnQgcmVnKQ0K
PiAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICsvKg0KPiArICogVGFyZ2V0IGhl
bHBlciBmdW5jdGlvbiB0byByZWFkIHZhbHVlIGludG8gR0J5dGVBcnJheSwgdGFyZ2V0DQo+
ICsgKiBzdXBwbGllcyB0aGUgc2l6ZSBhbmQgdGFyZ2V0IGVuZGlhbmVzcyB2aWEgdGhlIE1l
bU9wLg0KPiArICovDQo+ICtpbnQgZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNZW1PcCBvcCwg
R0J5dGVBcnJheSAqYnVmLCB2b2lkICp2YWwpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgYnl0
ZXMgPSBtZW1vcF9zaXplKG9wKTsNCj4gKw0KPiArICAgIGlmIChvcCAmIE1PX0JTV0FQKSB7
DQo+ICsgICAgICAgIHVpbnQ4X3QgKnB0ciA9ICYoKHVpbnQ4X3QgKikgdmFsKVtieXRlcyAt
IDFdOw0KPiArICAgICAgICBmb3IgKHVuc2lnbmVkIGkgPSBieXRlczsgaSA+IDA7IGktLSkg
ew0KPiArICAgICAgICAgICAgZ19ieXRlX2FycmF5X2FwcGVuZChidWYsIHB0ci0tLCAxKTsN
Cj4gKyAgICAgICAgfTsNCj4gKyAgICB9IGVsc2Ugew0KPiArICAgICAgICBnX2J5dGVfYXJy
YXlfYXBwZW5kKGJ1ZiwgdmFsLCBieXRlcyk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0
dXJuIGJ5dGVzOw0KPiArfQ0KPiArDQo+ICsNCj4gICBzdGF0aWMgdm9pZCBnZGJfcmVnaXN0
ZXJfZmVhdHVyZShDUFVTdGF0ZSAqY3B1LCBpbnQgYmFzZV9yZWcsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ2RiX2dldF9yZWdfY2IgZ2V0X3JlZywgZ2RiX3Nl
dF9yZWdfY2Igc2V0X3JlZywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBHREJGZWF0dXJlICpmZWF0dXJlKQ0KDQo=
