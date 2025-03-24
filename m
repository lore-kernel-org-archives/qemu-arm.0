Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2169904njc;
        Mon, 24 Mar 2025 12:10:48 -0700 (PDT)
X-Received: by 2002:a17:902:e888:b0:223:35cb:e421 with SMTP id d9443c01a7336-22780e258cemr207742795ad.49.1742843448330;
        Mon, 24 Mar 2025 12:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843448; cv=none;
        d=google.com; s=arc-20240605;
        b=GhDrSghZBcskvAJRThU2TGGmUzVehPybfcSXZw+ciV1tmMuixmog2hYeyBq5lLUzS2
         AhY0YALGURrnT70hDwNZ5mZN7ttZOFuqXWzzdRk1nC7TdPj6JEZSzLn0avdLnGmjyweg
         pFUCoKevJ7kqRvjvufGZ50r586BEV7uq4CLeX+/RL0kr42MX8/tXLZxjvHu6pG7GPRW4
         ohHPi1Tb8HZ6f42hWx1T1EBsGD30NIf8glKgnl3Du0EKzaDEVH3xtaxKxf+lTslKriyk
         F6pCktufeAB6nuBGq+m4zCcfpA+amryt1xdMY3nkiJKCRdiXgCQ45IsxoUV8gVNGCwNJ
         rs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cCN1PPxlnvR+MkOsUHuI7T4XnPJQV06okAj3aUlcfTE=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=MmVnK+vTl2K4lsieQbUP5+fXiEqspSQwH66Uh5jnW1Co/uFDmwDOXjD1Xb8Az6qEx9
         NawvlwQC1tVhoKSbOD3glP5/9I8n+a1RpfpGYYTqmhWo5e1hUmwljXqV3DDnEY6D/0F4
         dmCNl2CxPiTjwsa2sWY4j5KN/9oySZpx+jN7RT6yqe69dzFaIRMdO7tPhJxU67usCWmt
         0AqA/+jUYmXlR7NhDrag5BZRXYMVA76W16BScl+vRCG9CE81KXINDCcCLKqJ9RrAJH/w
         8ZluhVCYOJsOERQzcJXxhB41/waYFZnDVDWNR3tTPMW8exew+N1wqU405RBHc6vcEobr
         BtHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o99jxo50;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f655e0sor55370735ad.9.2025.03.24.12.10.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o99jxo50;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742843448; x=1743448248; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCN1PPxlnvR+MkOsUHuI7T4XnPJQV06okAj3aUlcfTE=;
        b=o99jxo50TXFWKqMCp2QXzEt6xj4QVUY2obaIcUSsZMnkT3quwU/o9jDqxWlq7tW3Hx
         UZL5F8YsQENBjooHYtamY8dTuohvHmtQr0xXWehafhH91WRSOfFqj7m+nr5GJjh8Oq7e
         lb/WEwjjLsGxmluReMTQTdYsagQckx5HSf3GKP0bFct7Mg4axlIHUxrWG08KEvEh6s96
         P+SehF727n+r+lgc85EToBBTS8YpawrS1K5nHMaTdFAFc6eqQd3aWDxh1L0IxtGjqLZ1
         Foinc+7Jsp6K8sAqwfK65fNv/XZe0tNHTSgW+p9mT9nCOsSw9YpI6rktOJ3fuuubcVhE
         KK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843448; x=1743448248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCN1PPxlnvR+MkOsUHuI7T4XnPJQV06okAj3aUlcfTE=;
        b=s85HIXalE9vPSjnAbmegC7QWK3tUV83aR/6TCkooKvpZySkQJr7awj+y0xNpOAxtPl
         n/iyNgOh3/0p4e+xTsGzDhaBZNjm2QzkTsOAR6WuH5mIBxJn3JGWAk6bxQPjHz13dTvI
         xotg2czre1lqhOcWw6rmk1Uf+sOvGJJ8BCKTYDh91HQzpPTtEh1H/b/yHHMIhcKH8Cvu
         YrBMbZEkRggN6Z9PnA9hhei/jl1JAGJJnI3jvYrBA58rVMt7C1BMf9fvLoO6+fWK6Q+P
         ZNQGlDXstTnVto8zvh0BFI667TQg8Px/vraITIiYvuePENVn8Qs8U0Jl6YB4g5p9xIQ9
         jccw==
X-Gm-Message-State: AOJu0YypmxFyT+EzGqZOhB8YO3x2NZETDsPJq3npd1pWFt4KG48PEIsz
	oJcqPvsR2gPOOKntFVihkoMwdTKhMXZEf61QyvoiGuBVHxF3oiHk6r5oo6RT32InXRNV3gXlCbu
	XXomc8w==
X-Gm-Gg: ASbGncvvmBAHxeA2E4rJkJDSg8cZMkWry5MaNZAs+UXFFWiZ8aaD3DfkoEi8vYcKU7z
	xelAi6hfzOf3ennCK9l6z7dRaR/BtS9aIum6qkYEYs4Dtkze7YQhSCBTBSeeVX94XX+9ZtrWkLC
	x6IjoDW5iPUFSRuRCCij70/FlswV33tfQTyrRHoP4Ma0mqeONI//TbjKiT5ddT0W0wCJg0r9BCj
	BoB0AAh5elrAMfZS0CZrrFL5oeWLDRBpRC/Wwv9CS1EVHd+reuFUAxM5F8CMpDE7xCKMlyQTys4
	fRggf3LVaK+a5Hp8Ooj64+aiORuze/CcRWYFdAjI7wG5r6rndWM7hRS2Gg==
X-Google-Smtp-Source: AGHT+IFil7KX7Vu1aU1hudwEPqXKdOzFRoDOpkYAmHN4hhgNm+72loWDIt1EYT2QbsEZLptQ6v/FOw==
X-Received: by 2002:a17:903:41cf:b0:224:78e:4ebe with SMTP id d9443c01a7336-22780e0a917mr189591895ad.33.1742843447711;
        Mon, 24 Mar 2025 12:10:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811c6ecdsm74782645ad.107.2025.03.24.12.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:10:47 -0700 (PDT)
Message-ID: <9edeb890-9822-4a43-ae36-621509f94de0@linaro.org>
Date: Mon, 24 Mar 2025 12:10:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] gdbstub: conversion to runtime endianess helpers
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
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Z6S8ABaG16pe

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgYWltIG9mIHRo
aXMgd29yayBpcyB0byBnZXQgcmlkIG9mIHRoZSBlbmRpYW4gYXdhcmUgaGVscGVycyBpbg0K
PiBnZGJzdHViL2hlbHBlcnMuaCB3aGljaCBkdWUgdG8gdGhlaXIgdXNlIG9mIHRzd2FwKCkg
bWVhbiB0YXJnZXQNCj4gZ2Ric3R1YnMgbmVlZCB0byBiZSBidWlsdCBtdWx0aXBsZSB0aW1l
cy4gV2hpbGUgdGhpcyBzZXJpZXMgZG9lc24ndA0KPiBhY3R1YWxseSBidWlsZCBlYWNoIHN0
dWIgb25jZSBpdCBpbnRyb2R1Y2VzIGEgbmV3IGhlbHBlciAtDQo+IGdkYl9nZXRfcmVnaXN0
ZXJfdmFsdWUoKSB3aGljaCB0YWtlcyBhIE1lbU9wIHdoaWNoIGNhbiBkZXNjcmliZSB0aGUN
Cj4gY3VycmVudCBlbmRpYW4gc3RhdGUgb2YgdGhlIHN5c3RlbS4gVGhpcyB3aWxsIGJlIGEg
bG90IGVhc2llciB0bw0KPiBkeW5hbWljYWxseSBmZWVkIGZyb20gYSBoZWxwZXIgZnVuY3Rp
b24uDQo+IA0KPiBUaGUgbW9zdCBjb21wbGV4IGV4YW1wbGUgaXMgUFBDIHdoaWNoIGhhcyBh
IGhlbHBlciBjYWxsZWQNCj4gcHBjX21heWJlX2Jzd2FwX3JlZ2lzdGVyKCkgd2hpY2ggd2Fz
IGRvaW5nIHRoaXMuDQo+IA0KPiBUaGlzIGlzIHN0aWxsIGFuIFJGQyBidXQgSSd2ZSBzcHVu
IG91dCB2MiBmb3IgZnVydGhlciBkaXNjdXNzaW9uLg0KPiANCj4gSW4gdjI6DQo+IA0KPiAg
ICAtIGRyb3AgdWludDhfdCBjYXN0aW5nIGFuZCB1c2Ugdm9pZCBhcyBDIGludGVuZGVkIDst
KQ0KDQpDIGFsbG93cyB0aGF0IHBlcm1pc3NpdmVseSwgYW5kIGl0IGNhbiBiZSBjb252ZW5p
ZW50IHdoZW4gdW5kZXJseWluZyANCnR5cGUgaXMgcmVhbGx5IHVua25vd24uIEJ1dCBpbiBv
dXIgY2FzZSwgaXQncyBvbmx5IHR3byB2YXJpYW50cy4NCg0KSWYgcmVhbGx5IGl0IGh1cnRz
IHRvIHJlcGxhY2UgY2FsbGVycywgX0dlbmVyaWMgaXMgYXQgbGVhc3QgYSBiZXR0ZXIgDQpz
b2x1dGlvbiB0aGFuIGludm9raW5nIHRoZSB2b2lkKiBoYW1tZXIuDQoNCj4gICAgLSBhZGQg
c3BlY2lmaWMgMzIvNjQgYml0IGhlbHBlcnMgd2l0aCB0eXBlIGNoZWNraW5nIGFuIGFzc2Vy
dGlvbg0KPiAgICAtIHZhcmlvdXMgdHdlYWtzIGFuZCBmaXhlcyAoc2VlIGluZGl2aWR1YWwg
Y29tbWl0cykNCj4gDQo+IFRoZXJlIGFyZSBhIGZldyBvdGhlciBtaXNjIGNsZWFuLXVwcyBJ
IGRpZCBvbiB0aGUgd2F5IHdoaWNoIG1pZ2h0IGJlDQo+IHdvcnRoIGNoZXJyeSBwaWNraW5n
IGZvciAxMC4wIGJ1dCBJJ2xsIGxlYXZlIHRoYXQgdXAgdG8gbWFpbnRhaW5lcnMuDQo+IA0K
PiBBbGV4IEJlbm7DqWUgKDExKToNCj4gICAgaW5jbHVkZS9leGVjOiBmaXggYXNzZXJ0IGlu
IHNpemVfbWVtb3ANCj4gICAgaW5jbHVkZS9nZGJzdHViOiBmaXggaW5jbHVkZSBndWFyZCBp
biBjb21tYW5kcy5oDQo+ICAgIGdkYnN0dWI6IGFzc2VydCBlYXJsaWVyIGluIGhhbmRsZV9y
ZWFkX2FsbF9yZWdzDQo+ICAgIGdkYnN0dWI6IGludHJvZHVjZSB0YXJnZXQgaW5kZXBlbmRl
bnQgZ2RiIHJlZ2lzdGVyIGhlbHBlcg0KPiAgICB0YXJnZXQvYXJtOiBjb252ZXJ0IDMyIGJp
dCBnZGJzdHViIHRvIG5ldyBoZWxwZXJzDQo+ICAgIHRhcmdldC9hcm06IGNvbnZlcnQgNjQg
Yml0IGdkYnN0dWIgdG8gbmV3IGhlbHBlcnMNCj4gICAgdGFyZ2V0L3BwYzogZXhwYW5kIGNv
bW1lbnQgb24gRlAvVk1YL1ZTWCBhY2Nlc3MgZnVuY3Rpb25zDQo+ICAgIHRhcmdldC9wcGM6
IG1ha2UgcHBjX21heWJlX2Jzd2FwX3JlZ2lzdGVyIHN0YXRpYw0KPiAgICB0YXJnZXQvcHBj
OiBjb252ZXJ0IGdkYnN0dWIgdG8gbmV3IGhlbHBlcnMNCj4gICAgdGFyZ2V0L21pY3JvYmxh
emU6IGNvbnZlcnQgZ2Ric3R1YiB0byBuZXcgaGVscGVyDQo+ICAgIGluY2x1ZGUvZ2Ric3R1
YjogYWRkIG5vdGUgdG8gaGVscGVycy5oDQo+IA0KPiAgIGluY2x1ZGUvZXhlYy9tZW1vcC5o
ICAgICAgICB8ICAgNCArLQ0KPiAgIGluY2x1ZGUvZ2Ric3R1Yi9jb21tYW5kcy5oICB8ICAg
MiArLQ0KPiAgIGluY2x1ZGUvZ2Ric3R1Yi9oZWxwZXJzLmggICB8ICAgNCArLQ0KPiAgIGlu
Y2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaCB8ICA1NSArKysrKysrKysrDQo+ICAgdGFyZ2V0
L3BwYy9jcHUuaCAgICAgICAgICAgIHwgICA4ICstDQo+ICAgZ2Ric3R1Yi9nZGJzdHViLmMg
ICAgICAgICAgIHwgIDI1ICsrKystDQo+ICAgdGFyZ2V0L2FybS9nZGJzdHViLmMgICAgICAg
IHwgIDU1ICsrKysrKy0tLS0NCj4gICB0YXJnZXQvYXJtL2dkYnN0dWI2NC5jICAgICAgfCAg
NTMgKysrKysrLS0tLQ0KPiAgIHRhcmdldC9taWNyb2JsYXplL2dkYnN0dWIuYyB8ICA0OSAr
KysrLS0tLS0NCj4gICB0YXJnZXQvcHBjL2dkYnN0dWIuYyAgICAgICAgfCAxOTcgKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwg
MjkyIGluc2VydGlvbnMoKyksIDE2MCBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9nZGJzdHViL3JlZ2lzdGVycy5oDQo+IA0KDQo=
