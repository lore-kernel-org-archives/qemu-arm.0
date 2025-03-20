Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1189032njc;
        Thu, 20 Mar 2025 12:30:25 -0700 (PDT)
X-Received: by 2002:a17:903:94b:b0:224:721:cc with SMTP id d9443c01a7336-22780c6bcd5mr9199395ad.13.1742499025414;
        Thu, 20 Mar 2025 12:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499025; cv=none;
        d=google.com; s=arc-20240605;
        b=cwBQMAj/rjs2bgG41rWmzJfhGW4JkW/TKDacZDV0gagad1YCk+7AEPCLVr8TqXUp4k
         UznYcm6Cw41DJE6pkoiIyDcPkHewBh9uQkkCaEEPf1ce6QVmfL6wc7ZcREKXZj8NsVZa
         xYTr7pj446S/z0/9dl8hKii70ol6znYCdwUnQ1BgdT2sTh/JDfX8IOaNVe4UjqtyJuTI
         myPzNCzocTDDJqtgZpxi6+xkYo+ZGxFhf3KqgAbg5Eh3byIQx8U6aYULvAkyi9G5i8Mf
         ic6Iadzfr17IDU/PrPCpOKURke9+g5D7/MWyf6d+KXY/Bswj6lOAvqR0B+clZpbhIP+9
         Jg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XMnc2L2EAy40CJ8xVLo6A7B0ZrYWBj245grBIfbUMYE=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=lmZ3bH6rjw6ymg7vCDtaV9RE6zDYjkUSlFpSg2hBkA/HXoz4drkwMlT4JXPR5uWJ7G
         wiUbgP/KhfuUhpEHwT9YEQhavRaWvhDnpm9Rv6ut7LKgly4nSE0oatp5I/QxMe2AT37q
         wvBEOD+tpQz7DE08/zcgkgdkMlJjb1taVsu/Ri+OTcgtnjO3ZBb7mBzth3GQa5Km8YJh
         NRwc5+S2/+rYz2GW0nHxkkTFuOeQLxmGMYGlyvkDDk80S8OZkQqtOdK2WeAbCtx3V5/l
         v2uBImeadHXtJ9o2/77ri6qP+vrgP1ukc+KEkEPJjJ+p6EjUrQilNlqf6fmagz63cA8i
         gQBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Yv3moi/p";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f75b7fsor1942205ad.13.2025.03.20.12.30.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Yv3moi/p";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499025; x=1743103825; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMnc2L2EAy40CJ8xVLo6A7B0ZrYWBj245grBIfbUMYE=;
        b=Yv3moi/p+stEO9qSInxm79UCPmFHhfCa6AgFURgOq7TEYES0g1wk8hGgHt3OK2LSqF
         VG+/70hQLc+MXIb8YWNCCwzGxdcLG3s1f9sTRbqmGoTdrlT/xbZ1pggKhQFHO8IsODmG
         BiLOiA1oQqdad0PjEafoibyimAtBS9UBk4QoduTk5DVHMTub9JJjR7ZA9LofxkSYdV/w
         wfgtUr0JfwqYHZ0s/PMGn/265StZxEsrnSv9Ghv5D/yn/6Tdf4F+XT1tZhXDwiFd82tP
         ytPQpZdSC+uaBAYWjzqvkYl2a6i7L/RU2SbYYtphlNCp35H6Sm1Hu5QCwWu4o7/m70kJ
         RgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499025; x=1743103825;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMnc2L2EAy40CJ8xVLo6A7B0ZrYWBj245grBIfbUMYE=;
        b=GMdAF+9kPN1tW7V4Pr72vBB2IJNuA6SFxCtkDl5V22Pmr+lBwlZUaj1NYiDummb6Zh
         Su3oLMlCANYtaKe52bEBZKb4VKEEdM4IXxEJXMEMQ1p0C5s4RturjbGWVAFfI4BwEKCv
         btyn/2s4ZrgI7o3ckmZ+LsUXhimwuXRB1kG1i04keo5hTMuS34Vp0rH6+fhiRFUt1Oot
         sHONkQktjxh3XG+Qz+SpglwqY5OssITzEGooGGlXooIHjSBznfGQ9/Q087rRj3aI39YU
         1vYF4Qlo49K7CpbuCoMf/dcabJPIaoPPsSdRSdPEwGOVwL6d/GlmavmQiQNMtoVSI4RJ
         3M0w==
X-Gm-Message-State: AOJu0YwpNTowhK5xt4Xso5Co2o3a+U09t1hg6JWU4GfFvlu18KTNdOGe
	PLqKbLlCjLff5Jm8fNWnxDnbjfipzXmDqv14ap2LmrP9gYIkVm4/0+sfPasmtZsdOOGXUJLy84Z
	TDj8=
X-Gm-Gg: ASbGncur0i8QfIQdAASB6Etawwps8s39ZY4Lln91frNzvcjhw9TK4pDOll7sxpU5t5N
	dOfNbw/n7xAebutDznpFqYgbgHk7StPkgLZ3n9icBPO7YKmCpCXCf1cXG+gaAz4qojuOzNrOpSu
	vx58I2+T9p2futRs2mNHrceVElc/CHOiFWhsQMBeMVivRyf5q0/BtAHi5jCQW4xtDv36flQYzPo
	orl3m7Ufd5rP5NQf8CeFnyk2cA59/o8iT80Vb0aYMd+u6wqIT2gwFULcHIr1X6nwgbH82KFuGLA
	4SPsWYWmplq4EjNwHbhpwIZPK6A8/q3nLuvS1WlhigQDVxQdWrh7ZtERGA==
X-Google-Smtp-Source: AGHT+IEtcnNV5vRTPYEeAlzPTts09QQ79Tb8ei5he44d4LM/nKeia1R6Wh6BC3sxmEj/7IZoVq0Sbw==
X-Received: by 2002:a17:90b:1fce:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-3030fef097cmr672299a91.25.1742499024726;
        Thu, 20 Mar 2025 12:30:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d245dsm254702a91.13.2025.03.20.12.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:30:24 -0700 (PDT)
Message-ID: <2c441f75-8fd8-4792-a4e4-1ae7c78754ba@linaro.org>
Date: Thu, 20 Mar 2025 12:30:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: mBInoSyKgXhQ

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgY3VycmVudCBo
ZWxwZXIuaCBmdW5jdGlvbnMgcmVseSBvbiBoYXJkIGNvZGVkIGFzc3VtcHRpb25zIGFib3V0
DQo+IHRhcmdldCBlbmRpYW5lc3MgdG8gdXNlIHRoZSB0c3dhcCBtYWNyb3MuIFdlIGFsc28g
ZW5kIHVwIGRvdWJsZQ0KPiBzd2FwcGluZyBhIGJ1bmNoIG9mIHZhbHVlcyBpZiB0aGUgdGFy
Z2V0IGNhbiBydW4gaW4gbXVsdGlwbGUgZW5kaWFuZXNzDQo+IG1vZGVzLiBBdm9pZCB0aGlz
IGJ5IGdldHRpbmcgdGhlIHRhcmdldCB0byBwYXNzIHRoZSBlbmRpYW5lc3MgYW5kIHNpemUN
Cj4gdmlhIGEgTWVtT3AgYW5kIGZpeGluZyB1cCBhcHByb3ByaWF0ZWx5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmggfCAzMCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gICBnZGJzdHViL2dkYnN0dWIuYyAgICAgICAgICAgfCAy
MiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNl
cnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZ2Ric3R1Yi9yZWdp
c3RlcnMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMu
aCBiL2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwLi40YWJjN2E2YWU3DQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvaW5jbHVkZS9nZGJzdHViL3JlZ2lzdGVycy5oDQo+IEBAIC0wLDAgKzEsMzAgQEAN
Cj4gKy8qDQo+ICsgKiBHREIgQ29tbW9uIFJlZ2lzdGVyIEhlbHBlcnMNCj4gKyAqDQo+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjUgTGluYXJvIEx0ZA0KPiArICoNCj4gKyAqIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQo+ICsgKi8NCj4gKw0KPiArI2lm
bmRlZiBHREJfUkVHSVNURVJTX0gNCj4gKyNkZWZpbmUgR0RCX1JFR0lTVEVSU19IDQo+ICsN
Cj4gKyNpbmNsdWRlICJleGVjL21lbW9wLmgiDQo+ICsNCj4gKy8qKg0KPiArICogZ2RiX2dl
dF9yZWdpc3Rlcl92YWx1ZSgpIC0gZ2V0IHJlZ2lzdGVyIHZhbHVlIGZvciBnZGINCj4gKyAq
IG1vOiBzaXplIGFuZCBlbmRpYW4gTWVtT3ANCj4gKyAqIGJ1ZjogR0J5dGVBcnJheSB0byBz
dG9yZSBpbiB0YXJnZXQgb3JkZXINCj4gKyAqIHZhbDogcG9pbnRlciB0byB2YWx1ZSBpbiBo
b3N0IG9yZGVyDQo+ICsgKg0KPiArICogVGhpcyByZXBsYWNlcyB0aGUgcHJldmlvdXMgbGVn
YWN5IHJlYWQgZnVuY3Rpb25zIHdpdGggYSBzaW5nbGUNCj4gKyAqIGZ1bmN0aW9uIHRvIGhh
bmRsZSBhbGwgc2l6ZXMuIFBhc3NpbmcgQG1vIGFsbG93cyB0aGUgdGFyZ2V0IG1vZGUgdG8N
Cj4gKyAqIGJlIHRha2VuIGludG8gYWNjb3VudCBhbmQgYXZvaWRzIHVzaW5nIGhhcmQgY29k
ZWQgdHN3YXAoKSBtYWNyb3MuDQo+ICsgKg0KPiArICogUmV0dXJucyB0aGUgbnVtYmVyIG9m
IGJ5dGVzIHdyaXR0ZW4gdG8gdGhlIGFycmF5Lg0KPiArICovDQo+ICtpbnQgZ2RiX2dldF9y
ZWdpc3Rlcl92YWx1ZShNZW1PcCBvcCwgR0J5dGVBcnJheSAqYnVmLCB1aW50OF90ICp2YWwp
Ow0KPiArDQo+ICsjZW5kaWYgLyogR0RCX1JFR0lTVEVSU19IICovDQo+ICsNCj4gKw0KPiBk
aWZmIC0tZ2l0IGEvZ2Ric3R1Yi9nZGJzdHViLmMgYi9nZGJzdHViL2dkYnN0dWIuYw0KPiBp
bmRleCAyODJlMTNlMTYzLi4zZDdiMTAyOGU0IDEwMDY0NA0KPiAtLS0gYS9nZGJzdHViL2dk
YnN0dWIuYw0KPiArKysgYi9nZGJzdHViL2dkYnN0dWIuYw0KPiBAQCAtMzIsNiArMzIsNyBA
QA0KPiAgICNpbmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4gICAjaW5jbHVkZSAiZ2Ric3R1
Yi9jb21tYW5kcy5oIg0KPiAgICNpbmNsdWRlICJnZGJzdHViL3N5c2NhbGxzLmgiDQo+ICsj
aW5jbHVkZSAiZ2Ric3R1Yi9yZWdpc3RlcnMuaCINCj4gICAjaWZkZWYgQ09ORklHX1VTRVJf
T05MWQ0KPiAgICNpbmNsdWRlICJhY2NlbC90Y2cvdmNwdS1zdGF0ZS5oIg0KPiAgICNpbmNs
dWRlICJnZGJzdHViL3VzZXIuaCINCj4gQEAgLTQ1LDYgKzQ2LDcgQEANCj4gICAjaW5jbHVk
ZSAic3lzdGVtL3J1bnN0YXRlLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvcmVwbGF5LWNvcmUu
aCINCj4gICAjaW5jbHVkZSAiZXhlYy9od2FkZHIuaCINCj4gKyNpbmNsdWRlICJleGVjL21l
bW9wLmgiDQo+ICAgDQo+ICAgI2luY2x1ZGUgImludGVybmFscy5oIg0KPiAgIA0KPiBAQCAt
NTUxLDYgKzU1MywyNiBAQCBzdGF0aWMgaW50IGdkYl93cml0ZV9yZWdpc3RlcihDUFVTdGF0
ZSAqY3B1LCB1aW50OF90ICptZW1fYnVmLCBpbnQgcmVnKQ0KPiAgICAgICByZXR1cm4gMDsN
Cj4gICB9DQo+ICAgDQo+ICsvKg0KPiArICogVGFyZ2V0IGhlbHBlciBmdW5jdGlvbiB0byBy
ZWFkIHZhbHVlIGludG8gR0J5dGVBcnJheSwgdGFyZ2V0DQo+ICsgKiBzdXBwbGllcyB0aGUg
c2l6ZSBhbmQgdGFyZ2V0IGVuZGlhbmVzcyB2aWEgdGhlIE1lbU9wLg0KPiArICovDQo+ICtp
bnQgZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNZW1PcCBvcCwgR0J5dGVBcnJheSAqYnVmLCB1
aW50OF90ICp2YWwpDQo+ICt7DQo+ICsgICAgc2l6ZV90IGJ5dGVzID0gbWVtb3Bfc2l6ZShv
cCk7DQo+ICsNCj4gKyAgICBpZiAob3AgJiBNT19CU1dBUCkgew0KPiArICAgICAgICBmb3Ig
KCBpbnQgaSA9IGJ5dGVzIDsgaSA+IDA7IGktLSkgew0KPiArICAgICAgICAgICAgZ19ieXRl
X2FycmF5X2FwcGVuZChidWYsICZ2YWxbaSAtIDFdLCAxKTsNCj4gKyAgICAgICAgfTsNCj4g
KyAgICB9IGVsc2Ugew0KPiArICAgICAgICBnX2J5dGVfYXJyYXlfYXBwZW5kKGJ1ZiwgdmFs
LCBieXRlcyk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0dXJuIGJ5dGVzOw0KPiArfQ0K
PiArDQo+ICsNCj4gICBzdGF0aWMgdm9pZCBnZGJfcmVnaXN0ZXJfZmVhdHVyZShDUFVTdGF0
ZSAqY3B1LCBpbnQgYmFzZV9yZWcsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ2RiX2dldF9yZWdfY2IgZ2V0X3JlZywgZ2RiX3NldF9yZWdfY2Igc2V0X3JlZywN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBHREJGZWF0dXJl
ICpmZWF0dXJlKQ0KDQpJdCBjb3VsZCBiZSBwcmVmZXJhYmxlIHRvIHNldCBidWYgd2l0aCB0
aGUgdmFsdWUsIGluc3RlYWQgb2Ygc2ltcGx5IA0KYXBwZW5kaW5nIHRoZSB2YWx1ZS4gVGhp
cyB3YXksIHRoZXJlIGlzIG5vIG5lZWQgdG8gcmV0dXJuIHRoZSBzaXplLCBhcyANCml0J3Mg
Y29udGFpbmVkIGluIGJ1ZmZlciBzaXplIGl0c2VsZi4NCg0KSWYgd2UgaW5zaXN0IG9uIHJl
dHVybmluZyB0aGUgc2l6ZSwgaXQncyBiZXR0ZXIgdG8gbWFrZSBpdCBhIHBhcmFtZXRlciAN
CihhbmQgdXNlIGEgdm9pZCBwYXJhbWV0ZXIgdHlwZSksIGJlY2F1c2UgYXQgdGhlIG1vbWVu
dCwgaXQgZ2l2ZXMgdGhlIA0KaW1wcmVzc2lvbiB0aGUgZnVuY3Rpb24gaXRzZWxmIHJldHVy
bnMgdGhlIHZhbHVlLCB3aGljaCBtYXkgYmUgY29uZnVzaW5nLg0K
