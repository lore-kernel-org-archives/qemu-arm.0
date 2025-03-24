Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2168111njc;
        Mon, 24 Mar 2025 12:07:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:92aa:b0:736:6202:3530 with SMTP id d2e1a72fcca58-73905a52724mr19511290b3a.22.1742843277666;
        Mon, 24 Mar 2025 12:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843277; cv=none;
        d=google.com; s=arc-20240605;
        b=gne3bjnm8RfIo4pxnflDgaUW/Tqac10iV+k2Eng9QcqvginvDAphLzA+rUUanvexYW
         LGzTPsY5FMAusmfF04ayJsS6dFmcCTHQ8hz8vwSKa170FuU6oqPjZANO7faGKctaGlXs
         zI8onET0TgyNWJh8spw68IjlAC5g61stuaKIqhKh2eVQ28WdrLEvtK7c1sUsSP7fFF7B
         RGoP3l3M3QXIEWPJqNMtJO5h6WD/u7yqpc7toRJiZagrjVk/GE2q2Ax0GPGNnKkg8MK8
         Biup9YeRrJmL2nJZ6S8M8R0XtqNFe3DzByN+nSB4y4hKER79FryrYCMc2Zkjp1ZmfBsl
         ehVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KYULLHmci7J6saJz0lZwny5ZsN0QDZcC1dqTD0PMTFc=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=P6aIRQ1P/Q7P1TgvqxTDX+xykTdTpF0JUuZz5Qg1LxF2vBshUyQmgsyfs4JUodrsPl
         60sB3ljQ7aCpgXpcLqou7ZmYe/ETDBhxCnkMbA3XzKhdS39IkBaxyMZoHvdFY2Byedwz
         7zrHXyARo5Ksl1Q2NFvhKN3Fzc98YcKFobVWSNN6x2qCJ6FJUorBgyE65tAkk7ZD3WPW
         PY0shmrpIStnCPYS4/Z/Z/wNQYuYq/s28vwbI7/FfjseAPFZ2+uxTldw4aNJtltaWZZT
         SKCTp95ZvGaWdrNXKUeFPTYy/Pug4T+D+jOBhDGyxzeK7TiK47zleSwkq3P/DZpMWp4T
         xnoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhcMam5E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f001b7sor7368408b3a.4.2025.03.24.12.07.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhcMam5E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742843277; x=1743448077; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYULLHmci7J6saJz0lZwny5ZsN0QDZcC1dqTD0PMTFc=;
        b=JhcMam5EoQ9d6Vv6bJ8lNdOcH1i5TudFhaclxtAe2GR5aeab2VZwlXS75BZ3th4Wta
         lOEw3KIr03I/mMMWYwW89iYp/mVhJIo83LYIZXqbd9ZJzRec3lpffaa4KscUzXYaM1sT
         JwvsSA/MSZneFCsJaeFd6y8PdPd79DzY/eMuYZW0qb0sAs0FvD31sVfLh4764/7l2SVn
         cB9xVQROMGGmaQzd3EiUMiB56XrnBLMeLoESL5x2+AkLY5bbFxpIj+BJv57NNqZ6OjLz
         qT/lUzxm0JquJXpbDsxXkPtWVyQXYTQ5YdWEMbxbdLybw2NAPvLFYkx99MX0QzwBzwlM
         9aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843277; x=1743448077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYULLHmci7J6saJz0lZwny5ZsN0QDZcC1dqTD0PMTFc=;
        b=Z0DKorjnnpNvMy+hFGQC+T4tHzEAsFQB388Ep10kMW253y1KvYOebtUn1j0FBpEQSG
         k/sw3wwEqFIc7d+8xZjXcWfgdAts0oS5r1PSocgd0Om6OIzBgewmDAoBTlcbdlFdY6oP
         84CEZqAiZMAwrc9/haiw85a6UntDLU141znK/I5YkThHmVYwiyodSCIE0Hbs4L2Zq3QO
         ApKepFQrjuhagCWwEQo1kDP9HCwPKn4ibL2Km6Rz1bhwbqY/+g944Q/SJ2Lri8qYE4L+
         B30CIQu8nXwXsAoWHYQFJhIndeNcSpC1ojHLEsC5f55pA6KR1Z5760MebRxbY8AVbjSw
         CRZw==
X-Gm-Message-State: AOJu0Ywzi4KdgBSxOVX2Z5+nvkMXqGQouR28rvPvPBP3tfmB1NUHm0mY
	R4jc/OE34UYBzKxZus72sRvqt5sty4wNsrssOAh+fs0jhvc6To9oxEqq+85tz+xZT0zqCoGNJAr
	33ZS/Kg==
X-Gm-Gg: ASbGnct8mXNhZLvJJe9nZBvj5pk04bnV8DlG6fYPFpaYL1871pDEs+urrx55M1lQCKl
	Jauv954uCMIDbq0cx+JGHu7Q/MkgfYjkUqc/tOeBVGHc+qLk0jHUOMiplgYCque0hFBc7gQVaOD
	Vfxn/No2guQDKpfPIFM5knFAFyIdgpBunBCFXiD1m8UeE0OrTm9fBPBcPFnWQTf/XbDZ1YYjPw7
	obYIpB5AImx/wVesn6xiWHp6PSGOgK0AvcrvFFEubDPogG7coB3mIXwlS6GokYMmIwJfiWjamVn
	RW70MAH1IOI2rmqSnjRbIIzC8yA8Ea3zfDxotu/dcTMNKP13xqaepIR+Fq++eOias6OW
X-Google-Smtp-Source: AGHT+IH3OeqGyLK/mUcfWuVdjUyaybVyo/qYB1sU8cjWmg4J3sAZe5+HdaWKDBWZl+/KhFLMdeFuTg==
X-Received: by 2002:a05:6a21:b90:b0:1ee:dded:e5b with SMTP id adf61e73a8af0-1fe42f9bb33mr24008001637.24.1742843276970;
        Mon, 24 Mar 2025 12:07:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm8668864b3a.105.2025.03.24.12.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:07:56 -0700 (PDT)
Message-ID: <310c7e87-a327-48cf-aaf9-b48dc39c2573@linaro.org>
Date: Mon, 24 Mar 2025 12:07:55 -0700
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
X-TUID: SvX/EUlGPj0q

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
cnJheSAqYnVmLCB2b2lkICp2YWwpOw0KPiArDQoNCkNvdWxkIGl0IGJlIG1hZGUgc3RhdGlj
LCBzbyBpdCdzIGhpZGRlbiBmcm9tIHRoZSBwdWJsaWMgaW50ZXJmYWNlPw0KWW91J2xsIG5l
ZWQgdG8gdW4taW5saW5lIGdkYl9nZXRfcmVnKl92YWx1ZSBmdW5jdGlvbnMuIEkgZG91YnQg
aXQncyANCnBlcmZvcm1hbmNlIGNyaXRpY2FsIGFuZCBuZWVkIHRvIGJlIGlubGluZS4NCg0K
PiArLyoqDQo+ICsgKiBnZGJfZ2V0X3JlZzMyX3ZhbHVlKCkgLSB0eXBlIGNoZWNrZWQgd3Jh
cHBlciBmb3IgZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZSgpDQo+ICsgKiBtbzogc2l6ZSBhbmQg
ZW5kaWFuIE1lbU9wDQo+ICsgKiBidWY6IEdCeXRlQXJyYXkgdG8gc3RvcmUgaW4gdGFyZ2V0
IG9yZGVyDQo+ICsgKiB2YWw6IHBvaW50ZXIgdG8gdWludDMyX3QgdmFsdWUgaW4gaG9zdCBv
cmRlcg0KPiArICovDQo+ICtzdGF0aWMgaW5saW5lIGludCBnZGJfZ2V0X3JlZzMyX3ZhbHVl
KE1lbU9wIG9wLCBHQnl0ZUFycmF5ICpidWYsIHVpbnQzMl90ICp2YWwpIHsNCj4gKyAgICBn
X2Fzc2VydCgob3AgJiBNT19TSVpFKSA9PSBNT18zMik7DQo+ICsgICAgcmV0dXJuIGdkYl9n
ZXRfcmVnaXN0ZXJfdmFsdWUob3AsIGJ1ZiwgdmFsKTsNCj4gK30NCj4gKw0KPiArLyoqDQo+
ICsgKiBnZGJfZ2V0X3JlZzY0X3ZhbHVlKCkgLSB0eXBlIGNoZWNrZWQgd3JhcHBlciBmb3Ig
Z2RiX2dldF9yZWdpc3Rlcl92YWx1ZSgpDQo+ICsgKiBtbzogc2l6ZSBhbmQgZW5kaWFuIE1l
bU9wDQo+ICsgKiBidWY6IEdCeXRlQXJyYXkgdG8gc3RvcmUgaW4gdGFyZ2V0IG9yZGVyDQo+
ICsgKiB2YWw6IHBvaW50ZXIgdG8gdWludDMyX3QgdmFsdWUgaW4gaG9zdCBvcmRlcg0KPiAr
ICovDQo+ICtzdGF0aWMgaW5saW5lIGludCBnZGJfZ2V0X3JlZzY0X3ZhbHVlKE1lbU9wIG9w
LCBHQnl0ZUFycmF5ICpidWYsIHVpbnQ2NF90ICp2YWwpIHsNCj4gKyAgICBnX2Fzc2VydCgo
b3AgJiBNT19TSVpFKSA9PSBNT182NCk7DQo+ICsgICAgcmV0dXJuIGdkYl9nZXRfcmVnaXN0
ZXJfdmFsdWUob3AsIGJ1ZiwgdmFsKTsNCj4gK30NCj4gKw0KPiArI2VuZGlmIC8qIEdEQl9S
RUdJU1RFUlNfSCAqLw0KPiArDQo+ICsNCj4gZGlmZiAtLWdpdCBhL2dkYnN0dWIvZ2Ric3R1
Yi5jIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4gaW5kZXggYjZkNWUxMWUwMy4uZTc5OWZkYzAx
OSAxMDA2NDQNCj4gLS0tIGEvZ2Ric3R1Yi9nZGJzdHViLmMNCj4gKysrIGIvZ2Ric3R1Yi9n
ZGJzdHViLmMNCj4gQEAgLTMyLDYgKzMyLDcgQEANCj4gICAjaW5jbHVkZSAiZXhlYy9nZGJz
dHViLmgiDQo+ICAgI2luY2x1ZGUgImdkYnN0dWIvY29tbWFuZHMuaCINCj4gICAjaW5jbHVk
ZSAiZ2Ric3R1Yi9zeXNjYWxscy5oIg0KPiArI2luY2x1ZGUgImdkYnN0dWIvcmVnaXN0ZXJz
LmgiDQo+ICAgI2lmZGVmIENPTkZJR19VU0VSX09OTFkNCj4gICAjaW5jbHVkZSAiYWNjZWwv
dGNnL3ZjcHUtc3RhdGUuaCINCj4gICAjaW5jbHVkZSAiZ2Ric3R1Yi91c2VyLmgiDQo+IEBA
IC00NSw2ICs0Niw3IEBADQo+ICAgI2luY2x1ZGUgInN5c3RlbS9ydW5zdGF0ZS5oIg0KPiAg
ICNpbmNsdWRlICJleGVjL3JlcGxheS1jb3JlLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvaHdh
ZGRyLmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9tZW1vcC5oIg0KPiAgIA0KPiAgICNpbmNsdWRl
ICJpbnRlcm5hbHMuaCINCj4gICANCj4gQEAgLTU1MSw2ICs1NTMsMjcgQEAgc3RhdGljIGlu
dCBnZGJfd3JpdGVfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNwdSwgdWludDhfdCAqbWVtX2J1Ziwg
aW50IHJlZykNCj4gICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAq
IFRhcmdldCBoZWxwZXIgZnVuY3Rpb24gdG8gcmVhZCB2YWx1ZSBpbnRvIEdCeXRlQXJyYXks
IHRhcmdldA0KPiArICogc3VwcGxpZXMgdGhlIHNpemUgYW5kIHRhcmdldCBlbmRpYW5lc3Mg
dmlhIHRoZSBNZW1PcC4NCj4gKyAqLw0KPiAraW50IGdkYl9nZXRfcmVnaXN0ZXJfdmFsdWUo
TWVtT3Agb3AsIEdCeXRlQXJyYXkgKmJ1Ziwgdm9pZCAqdmFsKQ0KPiArew0KPiArICAgIHVu
c2lnbmVkIGJ5dGVzID0gbWVtb3Bfc2l6ZShvcCk7DQo+ICsNCj4gKyAgICBpZiAob3AgJiBN
T19CU1dBUCkgew0KPiArICAgICAgICB1aW50OF90ICpwdHIgPSAmKCh1aW50OF90ICopIHZh
bClbYnl0ZXMgLSAxXTsNCj4gKyAgICAgICAgZm9yICh1bnNpZ25lZCBpID0gYnl0ZXM7IGkg
PiAwOyBpLS0pIHsNCj4gKyAgICAgICAgICAgIGdfYnl0ZV9hcnJheV9hcHBlbmQoYnVmLCBw
dHItLSwgMSk7DQo+ICsgICAgICAgIH07DQo+ICsgICAgfSBlbHNlIHsNCj4gKyAgICAgICAg
Z19ieXRlX2FycmF5X2FwcGVuZChidWYsIHZhbCwgYnl0ZXMpOw0KPiArICAgIH0NCj4gKw0K
PiArICAgIHJldHVybiBieXRlczsNCj4gK30NCj4gKw0KPiArDQo+ICAgc3RhdGljIHZvaWQg
Z2RiX3JlZ2lzdGVyX2ZlYXR1cmUoQ1BVU3RhdGUgKmNwdSwgaW50IGJhc2VfcmVnLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdkYl9nZXRfcmVnX2NiIGdldF9y
ZWcsIGdkYl9zZXRfcmVnX2NiIHNldF9yZWcsDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgR0RCRmVhdHVyZSAqZmVhdHVyZSkNCg0K
