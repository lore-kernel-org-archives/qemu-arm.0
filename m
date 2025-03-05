Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp935694njm;
        Wed, 5 Mar 2025 08:50:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgMh0LLYT5jMOLCH1tkkoc5Ta1zR92hlOqh5Dt3waBMtDijWXCb3XZtJPB+hpg8+qmZTeHKKCeRswwYw==@linaro.org
X-Received: by 2002:a05:6a21:3383:b0:1f2:f1a8:fbc8 with SMTP id adf61e73a8af0-1f349481a3bmr7335111637.2.1741193458098;
        Wed, 05 Mar 2025 08:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741193458; cv=none;
        d=google.com; s=arc-20240605;
        b=ELheN7taNx9PAXOjVJyhTgNkY2uGy8pRbEtTuXHggq28WaaxJhQdhID2rVss09r9gY
         56cbGY3o6OL4YbVMUJc6DK2BIjv/CBq1qXkM9Y1/mS5S8N55vY45DHGy5+rFddUEMd6p
         93yuevdCaUzTu7NaT0zUrA6kko0pYxYbIhuKIzgOLegpYrl5aK9p9fS9R93iDNwVEGgH
         PM1i5jfDRaXmavXVp9k7hHJq7BhZvXpDuhwe+K+qS7yabQGVU+G2g4UUM8M1bc3TQ5Od
         ppGVUdeKRy3sP8mP6ZSyfshumq0CcWmKUD4PGVzlEf+W4hnfwlOEiX2uhdaloCq/YFc8
         kdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xeT3l/cI6dYhk6CCWxAR99Ty24erewOyRJArRv3oOMI=;
        fh=VlAcR0d1+c3WOSEM69EEhnGWovA4hmxu9WWt0eCLF0c=;
        b=V3uDvIK41KpCCzFH58eiqOHBPgPZBhIjnFq7SmqxP/rp5+/C8KuyQwuZDsJhQRy76w
         p9scRlwcdjcjKv36+8lqE/8rzj03KvkrFdhSHmZUkvh6aaaTm8jb1i4HnKZ6wg/ghcG5
         O2RGJqWv91UmWaSgtTpJoJ5p0Mp4yLEcvAPMGE4DENVqy4ZpNDVTd+K3BzftjVC7CvkP
         cVql2XMJXQ9zkoGMnEAgOk2mdH1MdeAWnxk0PD2Qr+18C4pLp1ed0KGr/QiRLTxnGH//
         loQXrMHWxfGNz10XhMv+w2MPP7PRh78Ovz9nve909vIjPQEJkQiFIFpU7B4Uz7S5CCZk
         Z5vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OW/XuZsW";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-aee7dec40fesor8745957a12.8.2025.03.05.08.50.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OW/XuZsW";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741193457; x=1741798257; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeT3l/cI6dYhk6CCWxAR99Ty24erewOyRJArRv3oOMI=;
        b=OW/XuZsWF0Efn9otfZule3MGYgd088lzLImEnMehyfTuU5jn8ZSDi4j/2vs+CF+wP7
         p31cD3JLDWqJLUjG0thRx9YeavkKKo/ipPf5armGYn4VaCbPbf8p6RJVqyd13lyC3pMN
         PwEs+YEkY48FDffMsgEkCcqO7Qo4Z4bZ/myy3apPAJKHzsCswWQyqvZOqV5yS9Fgr45Z
         luTQMu8/AXZKCthg0+vOSFP0yAzNapGUoJdOBi6fa5WiMn1EJy+8h8oySiPLNWtadt9B
         JpQ4oSVvSpdwIm1CiLR6SY0tL77jd7o1Tyu6rc0wGWBeFc1SQEQUha2luPr1oCVg7X6y
         szsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193457; x=1741798257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeT3l/cI6dYhk6CCWxAR99Ty24erewOyRJArRv3oOMI=;
        b=KpKooFMsbdphHSnVyRIjOzNP82x0E/bU3LPhnc8IatlEJBS3S9qRVMXxy2fUPG2X1y
         9bu27Y4avF8PIsUuDUhnXQsxiXlsAW12aMkZHkZN3Dwo5PDyl9UKpwYRxAdwOsgXTjyq
         YQdu+HxatqqxrVeER2vWz3F3FxwZckuxe3Iai13Ns5WxaCby3/Ribb5i8eH1QkBlWYME
         AQveCGabTxLlWFB8RaIvUkVmDRd8CuSJQh+w0IE1Ye0aaRA4UUlBzp0s7BfeNJLgGqCa
         4EM5ZvM26q4h1d7X+xVwaRApZ+PguTS4n2fhIuPc+xNTSirXF7nwHy4mGMnljjGVE9+C
         vuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/LE/YO1lVi8sVEGqVR0EIp//UrC+7R5ki23Njw8fVBenIw52atVZqsySmR6lbgf4kOblDMBbJSSFZQ==@linaro.org
X-Gm-Message-State: AOJu0YzHLQEVGI8vmxe0yS07/WO46514VNA5eMLj4EqqxUXnJE94Hsru
	IaEp8qwRsnMbv08tuAGl4sTVzLT1Kuym6I7xcCSOTl8sCXmx1BMfq6K1oK4rW4U0OQ==
X-Gm-Gg: ASbGnctJNZw3sGbkAk59nIXSv714tSB+W5GqJii0iXqgjyZbp1XMcYiWLv6X2iPvYFq
	r82BlZ5KbM/b1Vj/16NqVjjQbHtotlTc5/IIbPDhgYOWUKp9lFK9LRBm786J3Q5tCoykoZXd8xf
	n+WSH1qRymefzZfPMhmaG4P73b66uO5WWYelruIB3YGet+spojKupcRIv58lINr40nOqCDDfi1H
	d3nwjDCO5nuqSniv0R2Dx5aoqOUG/gXljH9BCsRrCz41ooR4uhi1dMRWKbseq9zYE4zvwT4IltF
	J8h1tiiR3nNFs/4yYl8gFFTdo+vfryuGyw8K3wgPskxXv8cUROUjjCDCEQ==
X-Google-Smtp-Source: AGHT+IGRuXzFQV5pln0jUWmCxuqDp+LEAu9oAFQQ+G/hbWQPwQvqx2wLBnx8nePa/B8GokbSf9yaCg==
X-Received: by 2002:a17:90b:390f:b0:2fe:b016:a6a1 with SMTP id 98e67ed59e1d1-2ff497fec8fmr6416674a91.29.1741193457592;
        Wed, 05 Mar 2025 08:50:57 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e773dddsm1570256a91.12.2025.03.05.08.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:50:57 -0800 (PST)
Message-ID: <391c4a7d-8dae-497b-b5f4-975d41b3252a@linaro.org>
Date: Wed, 5 Mar 2025 08:50:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250305161248.54901-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: vGJA/jFDG9Os

T24gMy81LzI1IDA4OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gRm9y
IGxlZ2FjeSBBUk0gYmluYXJpZXMsIGxlZ2FjeV9iaW5hcnlfaXNfNjRiaXQoKSBpcw0KPiBl
cXVpdmFsZW50IG9mIHRoZSBjb21waWxlIHRpbWUgVEFSR0VUX0FBUkNINjQgZGVmaW5pdGlv
bi4NCj4gDQoNCkknbSBub3Qgc3VyZSB3aGVyZSB0aGlzIGZ1bmN0aW9uIGNvbWVzIGZyb20u
DQoNCkFueXdheSwgdG8gY29tcGxldGVseSByZXBsYWNlIFRBUkdFVF9BQVJDSDY0LCB3aGF0
IHdlIHdhbnQgaXMgc29tZXRoaW5nIA0KbGlrZTogdGFyZ2V0X2lzX2FhcmNoNjQoKSwgYmVj
YXVzZSBhbGwgdGhlIG9iamVjdHMgaW4gdGhpcyBmaWxlIHNob3VsZCANCm5vdCBiZSBlbmFi
bGVkIGZvciA2NCBiaXRzIHRhcmdldHMgd2hvIGFyZSBub3QgYXJtIGJhc2VkLg0KDQpTbyBp
dCdzIG1vcmUgZWFzeSB0byBpbnRyb2R1Y2UgYSBzcGVjaWZpYyBmdW5jdGlvbiAqcGVyKiB0
YXJnZXQsIGFuZCANCmVuYWJsZSBvYmplY3RzIG9uIGEgcGVyIG5lZWQgYmFzaXMuIFNvbWUg
d2lsbCBiZSBlbmFibGVkIGZvciBhbGwgDQp0YXJnZXRzLCBzb21lIGZvciBvbmx5IG9uZSwg
c29tZSBmb3IgYSBzcGVjaWZpYyBzZWxlY3Rpb24uDQoNCj4gVXNlIGl0IGFzIFR5cGVJbmZv
OjpyZWdpc3RlcmFibGUoKSBjYWxsYmFjayB0byBkeW5hbWljYWxseQ0KPiBhZGQgQWFyY2g2
NCBzcGVjaWZpYyB0eXBlcyBpbiBxZW11LXN5c3RlbS1hYXJjaDY0IGJpbmFyeSwNCj4gcmVt
b3ZpbmcgdGhlIG5lZWQgb2YgVEFSR0VUX0FBUkNINjQgI2lmZGVmJ3J5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3Jn
Pg0KPiAtLS0NCj4gICBody9hcm0vYmNtMjgzNi5jIHwgNiArKy0tLS0NCj4gICBody9hcm0v
cmFzcGkuYyAgIHwgNyArKystLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2JjbTI4
MzYuYyBiL2h3L2FybS9iY20yODM2LmMNCj4gaW5kZXggOTVlMTY4MDZmYTEuLjg4YTMyZTVm
YzIwIDEwMDY0NA0KPiAtLS0gYS9ody9hcm0vYmNtMjgzNi5jDQo+ICsrKyBiL2h3L2FybS9i
Y20yODM2LmMNCj4gQEAgLTEyLDYgKzEyLDcgQEANCj4gICAjaW5jbHVkZSAicWVtdS9vc2Rl
cC5oIg0KPiAgICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+ICAgI2luY2x1ZGUgInFlbXUv
bW9kdWxlLmgiDQo+ICsjaW5jbHVkZSAicWVtdS9sZWdhY3lfYmluYXJ5X2luZm8uaCINCj4g
ICAjaW5jbHVkZSAiaHcvYXJtL2JjbTI4MzYuaCINCj4gICAjaW5jbHVkZSAiaHcvYXJtL3Jh
c3BpX3BsYXRmb3JtLmgiDQo+ICAgI2luY2x1ZGUgImh3L3N5c2J1cy5oIg0KPiBAQCAtMTk1
LDcgKzE5Niw2IEBAIHN0YXRpYyB2b2lkIGJjbTI4MzZfY2xhc3NfaW5pdChPYmplY3RDbGFz
cyAqb2MsIHZvaWQgKmRhdGEpDQo+ICAgICAgIGRjLT5yZWFsaXplID0gYmNtMjgzNl9yZWFs
aXplOw0KPiAgIH07DQo+ICAgDQo+IC0jaWZkZWYgVEFSR0VUX0FBUkNINjQNCj4gICBzdGF0
aWMgdm9pZCBiY20yODM3X2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRh
KQ0KPiAgIHsNCj4gICAgICAgRGV2aWNlQ2xhc3MgKmRjID0gREVWSUNFX0NMQVNTKG9jKTsN
Cj4gQEAgLTIwOCw3ICsyMDgsNiBAQCBzdGF0aWMgdm9pZCBiY20yODM3X2NsYXNzX2luaXQo
T2JqZWN0Q2xhc3MgKm9jLCB2b2lkICpkYXRhKQ0KPiAgICAgICBiYy0+Y2x1c3RlcmlkID0g
MHgwOw0KPiAgICAgICBkYy0+cmVhbGl6ZSA9IGJjbTI4MzZfcmVhbGl6ZTsNCj4gICB9Ow0K
PiAtI2VuZGlmDQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIGJjbTI4M3hfdHlw
ZXNbXSA9IHsNCj4gICAgICAgew0KPiBAQCAtMjE5LDEyICsyMTgsMTEgQEAgc3RhdGljIGNv
bnN0IFR5cGVJbmZvIGJjbTI4M3hfdHlwZXNbXSA9IHsNCj4gICAgICAgICAgIC5uYW1lICAg
ICAgICAgICA9IFRZUEVfQkNNMjgzNiwNCj4gICAgICAgICAgIC5wYXJlbnQgICAgICAgICA9
IFRZUEVfQkNNMjgzWCwNCj4gICAgICAgICAgIC5jbGFzc19pbml0ICAgICA9IGJjbTI4MzZf
Y2xhc3NfaW5pdCwNCj4gLSNpZmRlZiBUQVJHRVRfQUFSQ0g2NA0KPiAgICAgICB9LCB7DQo+
ICAgICAgICAgICAubmFtZSAgICAgICAgICAgPSBUWVBFX0JDTTI4MzcsDQo+ICAgICAgICAg
ICAucGFyZW50ICAgICAgICAgPSBUWVBFX0JDTTI4M1gsDQo+ICsgICAgICAgIC5yZWdpc3Rl
cmFibGUgICA9IGxlZ2FjeV9iaW5hcnlfaXNfNjRiaXQsDQo+ICAgICAgICAgICAuY2xhc3Nf
aW5pdCAgICAgPSBiY20yODM3X2NsYXNzX2luaXQsDQo+IC0jZW5kaWYNCj4gICAgICAgfSwg
ew0KPiAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gVFlQRV9CQ00yODNYLA0KPiAgICAg
ICAgICAgLnBhcmVudCAgICAgICAgID0gVFlQRV9CQ00yODNYX0JBU0UsDQo+IGRpZmYgLS1n
aXQgYS9ody9hcm0vcmFzcGkuYyBiL2h3L2FybS9yYXNwaS5jDQo+IGluZGV4IGRjZTM1Y2Ex
MWFhLi5mN2U2NDdhOWNiZiAxMDA2NDQNCj4gLS0tIGEvaHcvYXJtL3Jhc3BpLmMNCj4gKysr
IGIvaHcvYXJtL3Jhc3BpLmMNCj4gQEAgLTE1LDYgKzE1LDcgQEANCj4gICAjaW5jbHVkZSAi
cWVtdS9vc2RlcC5oIg0KPiAgICNpbmNsdWRlICJxZW11L3VuaXRzLmgiDQo+ICAgI2luY2x1
ZGUgInFlbXUvY3V0aWxzLmgiDQo+ICsjaW5jbHVkZSAicWVtdS9sZWdhY3lfYmluYXJ5X2lu
Zm8uaCINCj4gICAjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPiAgICNpbmNsdWRlICJody9h
cm0vYm9vdC5oIg0KPiAgICNpbmNsdWRlICJody9hcm0vYmNtMjgzNi5oIg0KPiBAQCAtMzY3
LDcgKzM2OCw2IEBAIHN0YXRpYyB2b2lkIHJhc3BpMmJfbWFjaGluZV9jbGFzc19pbml0KE9i
amVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkNCj4gICAgICAgcmFzcGlfbWFjaGluZV9jbGFz
c19pbml0KG1jLCBybWMtPmJvYXJkX3Jldik7DQo+ICAgfTsNCj4gICANCj4gLSNpZmRlZiBU
QVJHRVRfQUFSQ0g2NA0KPiAgIHN0YXRpYyB2b2lkIHJhc3BpM2FwX21hY2hpbmVfY2xhc3Nf
aW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+ICAgew0KPiAgICAgICBNYWNo
aW5lQ2xhc3MgKm1jID0gTUFDSElORV9DTEFTUyhvYyk7DQo+IEBAIC0zODcsNyArMzg3LDYg
QEAgc3RhdGljIHZvaWQgcmFzcGkzYl9tYWNoaW5lX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3Mg
Km9jLCB2b2lkICpkYXRhKQ0KPiAgICAgICBybWMtPmJvYXJkX3JldiA9IDB4YTAyMDgyOw0K
PiAgICAgICByYXNwaV9tYWNoaW5lX2NsYXNzX2luaXQobWMsIHJtYy0+Ym9hcmRfcmV2KTsN
Cj4gICB9Ow0KPiAtI2VuZGlmIC8qIFRBUkdFVF9BQVJDSDY0ICovDQo+ICAgDQo+ICAgc3Rh
dGljIGNvbnN0IFR5cGVJbmZvIHJhc3BpX21hY2hpbmVfdHlwZXNbXSA9IHsNCj4gICAgICAg
ew0KPiBAQCAtNDAyLDE2ICs0MDEsMTYgQEAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIHJhc3Bp
X21hY2hpbmVfdHlwZXNbXSA9IHsNCj4gICAgICAgICAgIC5uYW1lICAgICAgICAgICA9IE1B
Q0hJTkVfVFlQRV9OQU1FKCJyYXNwaTJiIiksDQo+ICAgICAgICAgICAucGFyZW50ICAgICAg
ICAgPSBUWVBFX1JBU1BJX01BQ0hJTkUsDQo+ICAgICAgICAgICAuY2xhc3NfaW5pdCAgICAg
PSByYXNwaTJiX21hY2hpbmVfY2xhc3NfaW5pdCwNCj4gLSNpZmRlZiBUQVJHRVRfQUFSQ0g2
NA0KPiAgICAgICB9LCB7DQo+ICAgICAgICAgICAubmFtZSAgICAgICAgICAgPSBNQUNISU5F
X1RZUEVfTkFNRSgicmFzcGkzYXAiKSwNCj4gICAgICAgICAgIC5wYXJlbnQgICAgICAgICA9
IFRZUEVfUkFTUElfTUFDSElORSwNCj4gKyAgICAgICAgLnJlZ2lzdGVyYWJsZSAgID0gbGVn
YWN5X2JpbmFyeV9pc182NGJpdCwNCj4gICAgICAgICAgIC5jbGFzc19pbml0ICAgICA9IHJh
c3BpM2FwX21hY2hpbmVfY2xhc3NfaW5pdCwNCj4gICAgICAgfSwgew0KPiAgICAgICAgICAg
Lm5hbWUgICAgICAgICAgID0gTUFDSElORV9UWVBFX05BTUUoInJhc3BpM2IiKSwNCj4gICAg
ICAgICAgIC5wYXJlbnQgICAgICAgICA9IFRZUEVfUkFTUElfTUFDSElORSwNCj4gKyAgICAg
ICAgLnJlZ2lzdGVyYWJsZSAgID0gbGVnYWN5X2JpbmFyeV9pc182NGJpdCwNCj4gICAgICAg
ICAgIC5jbGFzc19pbml0ICAgICA9IHJhc3BpM2JfbWFjaGluZV9jbGFzc19pbml0LA0KPiAt
I2VuZGlmDQo+ICAgICAgIH0sIHsNCj4gICAgICAgICAgIC5uYW1lICAgICAgICAgICA9IFRZ
UEVfUkFTUElfTUFDSElORSwNCj4gICAgICAgICAgIC5wYXJlbnQgICAgICAgICA9IFRZUEVf
UkFTUElfQkFTRV9NQUNISU5FLA0KDQo=
