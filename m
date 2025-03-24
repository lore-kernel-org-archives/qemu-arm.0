Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2180384njc;
        Mon, 24 Mar 2025 12:30:51 -0700 (PDT)
X-Received: by 2002:a17:902:cf11:b0:224:1943:c5c with SMTP id d9443c01a7336-22780c7bfb1mr224232075ad.15.1742844651751;
        Mon, 24 Mar 2025 12:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844651; cv=none;
        d=google.com; s=arc-20240605;
        b=fxqvgz9bCi1js9UWFgLlq55VsB+7YWlsHzs/RYPQxzjOxJ7/xVUoiOfLtldhxJHMZm
         eAnhCF47SzUQTRb3Fxvaws2b+Qw6MuYvLoBfm4r3oOUVu842PaE1iB/D2mh4wBEAvtkQ
         OE0yNRNKpQQ9zZeqSG91vVvf0XCxgRXM9Q+fGWohvVaG+DtLymTnGrN0FqdcQLOrP+En
         EenJVj6Ar66wExVaDTc7XY67hRa1WNdbTIWPUPotZD6B41JmZZYI7dTr6Xmt7+jieyAP
         yHWwZ2fo+0i3g3aNZD0J465VmvtLkDSr5NV7AmEtaaK2mAYCk8Vlj/MTFyMXRk4rIuTE
         IXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y4NBXuIqNAVEHZPI3HkclVWQ3wW8EC1SduB68D4EJ4A=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=L/7IUJnBNT4KvixQMCVrvAlQMYGQ+Maxd6mskHmBVYaFVJmzzlXLQ1dgQ/zWJ6FS7M
         vi4K5SSH+tCP/JlEgWEANY2uQBjc71nKtwQ7D8D99af/mW/HE+9DveGAH0/kuzdg7Uwz
         u726oUiFbKkmwdolBpCo0HmzIp2wlvqBJFY+hptPpS3sSJ1AEOuWgDeZ2XALXM/CfyVh
         PICCvq5U875AN61balo6uPTN8sg9sZp1OKunmw/Z86VwPJyas6wVXhSiBoqR4AR/b/Cg
         XqvwUT8MJLKD9gj/K0ZnR9ktGmfnVOIm73qtZ998s4uJGEVnVPF5GGlzVuV9MMDz9KM3
         E52g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQ78xTR3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f3b807sor51075585ad.2.2025.03.24.12.30.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQ78xTR3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844651; x=1743449451; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4NBXuIqNAVEHZPI3HkclVWQ3wW8EC1SduB68D4EJ4A=;
        b=WQ78xTR3Yek1bg0B2n0KCP60NgMeZrUSGMs9LbtL5aVWjJh+YwI0HpNtUJqonLDFxj
         1U/XimZ2Qw/FTLsOKpNeEYWP79KvYFbJGwR5yaUddY9hDrwujCVtBFXbeWset8K/o+fb
         pLBRbzfRRcmCGOH6fOGfIvyjVuSDR43wsII5e6sVBNjLrmhc2UpH32zwFA7cGF93UlOl
         O6yGx64VzAGa1jPVyJ+0ZLjP5x0C4dEfju2bvZyl4dS6YludEkCVeKdVW4fE+rmHF1Pp
         0Gptq16UnCyaxPJZ1qbhaD0m77v2JSIB4tJ8BOb4ER5x47TAr7WGx4ge1E8hTuRyNu81
         u6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844651; x=1743449451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4NBXuIqNAVEHZPI3HkclVWQ3wW8EC1SduB68D4EJ4A=;
        b=GbMKE85tWBfTzJyMSODHmyEtZkjK4Wmwf7OAlJzLQNkmQhvtL9Bxm2iJU/nLTnkkHC
         8WVBpBUi08ngTu6mOx/wySzm9g1hQA0JksJWsiGca3ji5y1RWRvtuOzwvPh1nuznKdKd
         cYEZCz/ZFyYCuTt7zVfDk1LvM2fiw9WmpGDtRpxspvyInsZmlf89dvp75n/k3mbVopKY
         22k7wmOw9hWgwB8nAl9tXKEqY/Db8TnF2JhFvNitfcj35K54ugXrXiUaIkSVpEnI/1fk
         jgxYrJiMs4S711IsTr/S6x0jaaJGAP+YsnTQ+IKswMx7TO4c5neld4ITA/L7FVvjkvUl
         HNSw==
X-Gm-Message-State: AOJu0YwUhXbsFtrDNz7Eswe+bLOlMNCYnXzcF06YL+KHOwVkiXILY40a
	vka+JQfQ9qsT+OodZqVR0aiXjneJUEug6CJN6CW8foM+YPYvn0zXAI3Icjjg87caDexmn7FDku6
	5lcaV5w==
X-Gm-Gg: ASbGncv/isDcd9ISdbvQknWiK5qShA3qpI0PGB4QgzFZbSwtzFzmjHUAcXM2LmFRKsl
	hBViity8T8JqF1UApH/dsNkkAaJcZLroPOVHKiadtNDjcpsqkrbalB36L9YLBnAXkjkbNnE1mzL
	wKtn6HZl/dj8dGU9M8Hupz/7g5WD7XEPOXAPEm6kNsM4RwvYZ8N0UwCn3s3avQnItZyphldPTGk
	6IMYO0poCE48g5yYi2P/w5UxguQNgwN1/Qij69h+bW2SYNQePPAA1G6fqXu2LDORksz2Z6mU7zc
	SNCY34OXZsQTimeKUIIwaRcL0uQaPlSXEWz8NFbI2nsFn/J1I3TVt06I+OLHxMOSLf5g
X-Google-Smtp-Source: AGHT+IEehcu8g08aQCATklHm504PcYLn4UeYhnqCMMcrPjynBCoBJgcXN+th+EvTTcFTLPrFbnq1Ow==
X-Received: by 2002:a17:902:da82:b0:224:162:a3e0 with SMTP id d9443c01a7336-22780e2a37fmr203899955ad.49.1742844651162;
        Mon, 24 Mar 2025 12:30:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm74767095ad.27.2025.03.24.12.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:30:50 -0700 (PDT)
Message-ID: <6d2cb56c-0ba7-4b76-836d-801d52bd67aa@linaro.org>
Date: Mon, 24 Mar 2025 12:30:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] target/microblaze: convert gdbstub to new helper
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
 <20250324102142.67022-11-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: zGuS7NI2O4RD

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGlzIGlzIGEgcHJl
dHR5IHNpbXBsZSBjb252ZXJzaW9uIGdpdmVuIGEgc2luZ2xlIHNldCBvZiByZWdpc3RlcnMg
YW5kDQo+IGFuIGV4aXN0aW5nIGhlbHBlciB0byBwcm9iZSBlbmRpYW5lc3MuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+
IA0KPiAtLS0NCj4gdjINCj4gICAgLSB1c2UgbWJfY3B1X2lzX2JpZ19lbmRpYW4NCj4gICAg
LSB1c2UgZXhwbGljaXQgTU9fMzIgc2l6ZQ0KPiAgICAtIGhhbmRsZSBkaWZmZXJpbmcgc2l6
ZSBvZiBlbnYtPmVhciBiZXR3ZWVuIHVzZXIvc3lzdGVtDQo+IC0tLQ0KPiAgIHRhcmdldC9t
aWNyb2JsYXplL2dkYnN0dWIuYyB8IDQ5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjcgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L21pY3JvYmxhemUvZ2Ric3R1
Yi5jIGIvdGFyZ2V0L21pY3JvYmxhemUvZ2Ric3R1Yi5jDQo+IGluZGV4IGQ0OTM2ODFkMzgu
LmRiYWY3ZWNiOWMgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9taWNyb2JsYXplL2dkYnN0dWIu
Yw0KPiArKysgYi90YXJnZXQvbWljcm9ibGF6ZS9nZGJzdHViLmMNCj4gQEAgLTE5LDcgKzE5
LDcgQEANCj4gICAgKi8NCj4gICAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPiAgICNpbmNs
dWRlICJjcHUuaCINCj4gLSNpbmNsdWRlICJnZGJzdHViL2hlbHBlcnMuaCINCj4gKyNpbmNs
dWRlICJnZGJzdHViL3JlZ2lzdGVycy5oIg0KPiAgIA0KPiAgIC8qDQo+ICAgICogR0RCIGV4
cGVjdHMgU1JFR3MgaW4gdGhlIGZvbGxvd2luZyBvcmRlcjoNCj4gQEAgLTUwLDYyICs1MCw1
NyBAQCBpbnQgbWJfY3B1X2dkYl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcywgR0J5dGVB
cnJheSAqbWVtX2J1ZiwgaW50IG4pDQo+ICAgew0KPiAgICAgICBNaWNyb0JsYXplQ1BVICpj
cHUgPSBNSUNST0JMQVpFX0NQVShjcyk7DQo+ICAgICAgIENQVU1CU3RhdGUgKmVudiA9ICZj
cHUtPmVudjsNCj4gLSAgICB1aW50MzJfdCB2YWw7DQo+ICsgICAgTWVtT3AgbW8gPSBtYl9j
cHVfaXNfYmlnX2VuZGlhbihjcykgPyBNT19CRSA6IE1PX0xFOw0KPiArICAgIHVpbnQzMl90
IG1zcjsNCj4gICANCj4gICAgICAgc3dpdGNoIChuKSB7DQo+ICAgICAgIGNhc2UgMSAuLi4g
MzE6DQo+IC0gICAgICAgIHZhbCA9IGVudi0+cmVnc1tuXTsNCj4gLSAgICAgICAgYnJlYWs7
DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyX3ZhbHVlKG1vIHwgTU9fMzIsIG1l
bV9idWYsICZlbnYtPnJlZ3Nbbl0pOw0KPiAgICAgICBjYXNlIEdEQl9QQzoNCj4gLSAgICAg
ICAgdmFsID0gZW52LT5wYzsNCj4gLSAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIHJldHVy
biBnZGJfZ2V0X3JlZzMyX3ZhbHVlKG1vIHwgTU9fMzIsIG1lbV9idWYsICZlbnYtPnBjKTsN
Cj4gICAgICAgY2FzZSBHREJfTVNSOg0KPiAtICAgICAgICB2YWwgPSBtYl9jcHVfcmVhZF9t
c3IoZW52KTsNCj4gLSAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIG1zciA9IG1iX2NwdV9y
ZWFkX21zcihlbnYpOw0KPiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMl92YWx1ZSht
byB8IE1PXzMyLCBtZW1fYnVmLCAmbXNyKTsNCj4gICAgICAgY2FzZSBHREJfRUFSOg0KPiAt
ICAgICAgICB2YWwgPSBlbnYtPmVhcjsNCj4gLSAgICAgICAgYnJlYWs7DQo+ICsjaWYgVEFS
R0VUX0xPTkdfQklUUyA9PSA2NA0KPiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWc2NF92
YWx1ZShtbyB8IE1PXzY0LCBtZW1fYnVmLCAmZW52LT5lYXIpOw0KPiArI2Vsc2UNCj4gKyAg
ICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzJfdmFsdWUobW8gfCBNT18zMiwgbWVtX2J1Ziwg
JmVudi0+ZWFyKTsNCj4gKyNlbmRpZg0KPiAgICAgICBjYXNlIEdEQl9FU1I6DQo+IC0gICAg
ICAgIHZhbCA9IGVudi0+ZXNyOw0KPiAtICAgICAgICBicmVhazsNCj4gKyAgICAgICAgcmV0
dXJuIGdkYl9nZXRfcmVnMzJfdmFsdWUobW8gfCBNT18zMiwgbWVtX2J1ZiwgJmVudi0+ZXNy
KTsNCj4gICAgICAgY2FzZSBHREJfRlNSOg0KPiAtICAgICAgICB2YWwgPSBlbnYtPmZzcjsN
Cj4gLSAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyX3Zh
bHVlKG1vIHwgTU9fMzIsIG1lbV9idWYsICZlbnYtPmZzcik7DQo+ICAgICAgIGNhc2UgR0RC
X0JUUjoNCj4gLSAgICAgICAgdmFsID0gZW52LT5idHI7DQo+IC0gICAgICAgIGJyZWFrOw0K
PiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMl92YWx1ZShtbyB8IE1PXzMyLCBtZW1f
YnVmLCAmZW52LT5idHIpOw0KPiAgICAgICBjYXNlIEdEQl9QVlIwIC4uLiBHREJfUFZSMTE6
DQo+ICAgICAgICAgICAvKiBQVlIxMiBpcyBpbnRlbnRpb25hbGx5IHNraXBwZWQgKi8NCj4g
LSAgICAgICAgdmFsID0gY3B1LT5jZmcucHZyX3JlZ3NbbiAtIEdEQl9QVlIwXTsNCj4gLSAg
ICAgICAgYnJlYWs7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyX3ZhbHVlKG1v
IHwgTU9fMzIsIG1lbV9idWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZjcHUtPmNmZy5wdnJfcmVnc1tuIC0gR0RCX1BWUjBdKTsNCj4gICAgICAgY2Fz
ZSBHREJfRURSOg0KPiAtICAgICAgICB2YWwgPSBlbnYtPmVkcjsNCj4gLSAgICAgICAgYnJl
YWs7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyX3ZhbHVlKG1vIHwgTU9fMzIs
IG1lbV9idWYsICZlbnYtPmVkcik7DQo+ICAgICAgIGRlZmF1bHQ6DQo+ICAgICAgICAgICAv
KiBPdGhlciBTUmVncyBhcmVuJ3QgbW9kZWxlZCwgc28gcmVwb3J0IGEgdmFsdWUgb2YgMCAq
Lw0KPiAtICAgICAgICB2YWwgPSAwOw0KPiAtICAgICAgICBicmVhazsNCj4gKyAgICAgICAg
cmV0dXJuIDA7DQo+ICAgICAgIH0NCj4gLSAgICByZXR1cm4gZ2RiX2dldF9yZWczMihtZW1f
YnVmLCB2YWwpOw0KPiAgIH0NCj4gICANCj4gICBpbnQgbWJfY3B1X2dkYl9yZWFkX3N0YWNr
X3Byb3RlY3QoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikNCj4g
ICB7DQo+ICAgICAgIE1pY3JvQmxhemVDUFUgKmNwdSA9IE1JQ1JPQkxBWkVfQ1BVKGNzKTsN
Cj4gICAgICAgQ1BVTUJTdGF0ZSAqZW52ID0gJmNwdS0+ZW52Ow0KPiAtICAgIHVpbnQzMl90
IHZhbDsNCj4gKyAgICBNZW1PcCBtbyA9IFRBUkdFVF9CSUdfRU5ESUFOID8gTU9fQkVVTCA6
IE1PX0xFVUw7DQo+ICAgDQo+ICAgICAgIHN3aXRjaCAobikgew0KPiAgICAgICBjYXNlIEdE
Ql9TUF9TSEw6DQo+IC0gICAgICAgIHZhbCA9IGVudi0+c2xyOw0KPiArICAgICAgICByZXR1
cm4gZ2RiX2dldF9yZWczMl92YWx1ZShtbywgbWVtX2J1ZiwgJmVudi0+c2xyKTsNCj4gICAg
ICAgICAgIGJyZWFrOw0KPiAgICAgICBjYXNlIEdEQl9TUF9TSFI6DQo+IC0gICAgICAgIHZh
bCA9IGVudi0+c2hyOw0KPiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMl92YWx1ZSht
bywgbWVtX2J1ZiwgJmVudi0+c2hyKTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBk
ZWZhdWx0Og0KPiAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICAgIH0NCj4gLSAgICByZXR1
cm4gZ2RiX2dldF9yZWczMihtZW1fYnVmLCB2YWwpOw0KPiAgIH0NCj4gICANCj4gICBpbnQg
bWJfY3B1X2dkYl93cml0ZV9yZWdpc3RlcihDUFVTdGF0ZSAqY3MsIHVpbnQ4X3QgKm1lbV9i
dWYsIGludCBuKQ0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2su
Ym91dmllckBsaW5hcm8ub3JnPg0KDQo=
