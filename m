Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp480562ejc;
        Wed, 12 Jun 2024 08:57:59 -0700 (PDT)
X-Received: by 2002:a05:6e02:13a3:b0:375:a85b:f48 with SMTP id e9e14a558f8ab-375cd1659aamr31157805ab.12.1718207879176;
        Wed, 12 Jun 2024 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718207879; cv=none;
        d=google.com; s=arc-20160816;
        b=dupGDhpKZ6I6oUa1rG6WY/J2S0w8ni21oXWa0hYHq/WzrRxm3gQN/Uhv75QE5SYDej
         prcuinhKSZb1hLfQHQXd39KT6aZNnx+FWeA3gEJ1OYmnlNeROsBbSxWBglM0yGKqAtJp
         uGqNXJ1rBzo1+NVPaDrEDpytvGN99ea8y2FsGOb6GruUcPbr4syLOcxxCe61dxcXQ63H
         A1Bi1oXxNFJYW/szqQp7/gIgXZiXaHOmYR/YpJ5fXHRlXYZhfUshsQHIAkyjUiCeWX3Y
         3bbzwLFfF7eacd7oPDGTSpifrlp8PwTXvZ0GgymggyuxuGg+d/vBgzTfVa/UjMClLC8w
         sweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gKhqdR5GicbhPJYI/QAASntif/4xikgtotDeXCgIJzk=;
        fh=eXv2JXwyEuypOQrX69yDQffVqZOElln6Rkijoj/t+TU=;
        b=WeV8UtlsewB22xdlSRe0+0c1YPo6F9iFiG8RHfZH8VEQbUj6/g/aaV42GBBcoIRHFr
         PpFS9cN0skF4lngozjsMQP/HzwTv6WNTswu1BVYFtjSpb7jRI/FdiMojjZWKx0IL1vG+
         GuNuTG0h7AuzI1F5IilxagqI2QiZqqRKhYFm3xuH6/vYBz3e/kZx52VSghediNa6UIKs
         PdNZsxYJRUOhm/i+kv5VWjUQIvCC7oBozJ/FPb0VYnTTmzWCeLAvX6Z5hMkcL9BJUTQB
         0GN2dETNm783dY19FyPgxjnWAQUvXsHBB9trdm00k8i9hkgQ879M05kjCHeWlVRhQ2gS
         JIzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X1SCnR8E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-375b343947dsor13492655ab.15.2024.06.12.08.57.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 12 Jun 2024 08:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X1SCnR8E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718207878; x=1718812678; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKhqdR5GicbhPJYI/QAASntif/4xikgtotDeXCgIJzk=;
        b=X1SCnR8E2MEVa+l9vV0JtOa7l/gYFCxoBgD38lweXVpTdyJdkAoWruxb1Wig2EW/jW
         Xk+CPJahgjVoKK2aLpJrvCSg9QLDfaNRLYQ1zKHjn5Kk2w3mRrznua3lURK9co7UAYT5
         yBLQBnrv8jeu1/mb67uP7cWYszszyy7SATGM5aeu2ISRO5ekqRAhePhmxXuocBvb/naH
         r3Ir0oEQiQiFzQbJ/5vaH5T0Qic1srmLgcRPkMuSYwJMCvp2uVKC4hbGvjK8/wMFm4a1
         3fMRqzvYTkV5Y1RuZMXlBzi5QmKJbcbMzr5JuS+IFaGf/+kJIE6TW9avS9cCNLdNm69R
         5rUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207878; x=1718812678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKhqdR5GicbhPJYI/QAASntif/4xikgtotDeXCgIJzk=;
        b=EnURuMcq084Jcy0Ql9ckvcXwkxrJB/5i+ExDmfHxU/4BKcCDhVMJtnqOYUncbBJDfP
         mz90VIendENzMLF0bVVhojcouJ+1n95Pii8SUIUQ+SxfjvJTkooilNCRrcciMBBUgDlM
         rczxYKJghX1CxsAeWHC4KgzhFn7QI+lOn4Tuk02Bqcpz358FI/Um7Q9CEIlnd91MiNVh
         a7xCEZei8WrnR8QsPCl+6AuCu74XZBlnjRBqH0STrtqNPOe3IkiJR8BGCAWq0+HhpSZ1
         J047tdWKQGWZB/UdTHyMOCh4F6e5q8690uII9qWW0PSx9bGYA8dR1DnB+Bu7G2IBMyrI
         7DeQ==
X-Gm-Message-State: AOJu0YzNChMSC3eBVENbvldsPE1Hc0D6vRwOI/bXc1HGCvaoY/50P1lS
	DKTsoT54njh99fKwlNPteADr/S8eNP6tYhHWwLX6b9s1FAPKs9pJyuG9PuXt/wCsCfHQ60nVo8c
	TXhM=
X-Google-Smtp-Source: AGHT+IFTDm6DBaje8h1RpTlQDbKudsC0R45jFplw86aOS8AFZpfJQYvr9Xm1BrTo13OAHRfrRh+hOw==
X-Received: by 2002:a05:6e02:1d88:b0:375:c394:568b with SMTP id e9e14a558f8ab-375cd1d1ef2mr24259655ab.21.1718207878301;
        Wed, 12 Jun 2024 08:57:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e61930dc41sm7391248a12.11.2024.06.12.08.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:57:57 -0700 (PDT)
Message-ID: <80104375-f062-43f5-909c-1f25f1943377@linaro.org>
Date: Wed, 12 Jun 2024 08:57:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] gdbstub: move enums into separate header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240612153508.1532940-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: zeMRtYb9uimc

T24gNi8xMi8yNCAwODozNSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGlzIGlzIGFuIGV4
cGVyaW1lbnQgdG8gZnVydGhlciByZWR1Y2UgdGhlIGFtb3VudCB3ZSB0aHJvdyBpbnRvIHRo
ZQ0KPiBleGVjIGhlYWRlcnMuIEl0IG1pZ2h0IG5vdCBiZSBhcyB1c2VmdWwgYXMgSSBpbml0
aWFsbHkgdGhvdWdodCBiZWNhdXNlDQo+IGp1c3QgdW5kZXIgaGFsZiBvZiB0aGUgdXNlcnMg
YWxzbyBuZWVkIGdkYnNlcnZlcl9zdGFydCgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRl
L2V4ZWMvZ2Ric3R1Yi5oICAgIHwgIDkgLS0tLS0tLS0tDQo+ICAgaW5jbHVkZS9nZGJzdHVi
L2VudW1zLmggICB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPiAgIGFjY2VsL2h2Zi9o
dmYtYWNjZWwtb3BzLmMgfCAgMiArLQ0KPiAgIGFjY2VsL2t2bS9rdm0tYWxsLmMgICAgICAg
fCAgMiArLQ0KPiAgIGFjY2VsL3RjZy90Y2ctYWNjZWwtb3BzLmMgfCAgMiArLQ0KPiAgIGdk
YnN0dWIvdXNlci5jICAgICAgICAgICAgfCAgMSArDQo+ICAgbW9uaXRvci9obXAtY21kcy5j
ICAgICAgICB8ICAzICsrLQ0KPiAgIHN5c3RlbS92bC5jICAgICAgICAgICAgICAgfCAgMSAr
DQo+ICAgdGFyZ2V0L2FybS9odmYvaHZmLmMgICAgICB8ICAyICstDQo+ICAgdGFyZ2V0L2Fy
bS9oeXBfZ2Ric3R1Yi5jICB8ICAyICstDQo+ICAgdGFyZ2V0L2FybS9rdm0uYyAgICAgICAg
ICB8ICAyICstDQo+ICAgdGFyZ2V0L2kzODYva3ZtL2t2bS5jICAgICB8ICAyICstDQo+ICAg
dGFyZ2V0L3BwYy9rdm0uYyAgICAgICAgICB8ICAyICstDQo+ICAgdGFyZ2V0L3MzOTB4L2t2
bS9rdm0uYyAgICB8ICAyICstDQo+ICAgMTQgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9u
cygrKSwgMTkgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
Z2Ric3R1Yi9lbnVtcy5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2dkYnN0
dWIuaCBiL2luY2x1ZGUvZXhlYy9nZGJzdHViLmgNCj4gaW5kZXggMDA4YTkyMTk4YS4uMWJk
MmM0ZWMyYSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL2dkYnN0dWIuaA0KPiArKysg
Yi9pbmNsdWRlL2V4ZWMvZ2Ric3R1Yi5oDQo+IEBAIC0xLDE1ICsxLDYgQEANCj4gICAjaWZu
ZGVmIEdEQlNUVUJfSA0KPiAgICNkZWZpbmUgR0RCU1RVQl9IDQo+ICAgDQo+IC0jZGVmaW5l
IERFRkFVTFRfR0RCU1RVQl9QT1JUICIxMjM0Ig0KPiAtDQo+IC0vKiBHREIgYnJlYWtwb2lu
dC93YXRjaHBvaW50IHR5cGVzICovDQo+IC0jZGVmaW5lIEdEQl9CUkVBS1BPSU5UX1NXICAg
ICAgICAwDQo+IC0jZGVmaW5lIEdEQl9CUkVBS1BPSU5UX0hXICAgICAgICAxDQo+IC0jZGVm
aW5lIEdEQl9XQVRDSFBPSU5UX1dSSVRFICAgICAyDQo+IC0jZGVmaW5lIEdEQl9XQVRDSFBP
SU5UX1JFQUQgICAgICAzDQo+IC0jZGVmaW5lIEdEQl9XQVRDSFBPSU5UX0FDQ0VTUyAgICA0
DQo+IC0NCj4gICB0eXBlZGVmIHN0cnVjdCBHREJGZWF0dXJlIHsNCj4gICAgICAgY29uc3Qg
Y2hhciAqeG1sbmFtZTsNCj4gICAgICAgY29uc3QgY2hhciAqeG1sOw0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9nZGJzdHViL2VudW1zLmggYi9pbmNsdWRlL2dkYnN0dWIvZW51bXMuaA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5jNGQ1NGExZDA4
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvaW5jbHVkZS9nZGJzdHViL2VudW1zLmgNCj4g
QEAgLTAsMCArMSwyMSBAQA0KPiArLyoNCj4gKyAqIGdkYnN0dWIgZW51bXMNCj4gKyAqDQo+
ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjQgTGluYXJvIEx0ZA0KPiArICoNCj4gKyAqIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQo+ICsgKi8NCj4gKw0KPiAr
I2lmbmRlZiBHREJTVFVCX0VOVU1TX0gNCj4gKyNkZWZpbmUgR0RCU1RVQl9FTlVNU19IDQo+
ICsNCj4gKyNkZWZpbmUgREVGQVVMVF9HREJTVFVCX1BPUlQgIjEyMzQiDQo+ICsNCj4gKy8q
IEdEQiBicmVha3BvaW50L3dhdGNocG9pbnQgdHlwZXMgKi8NCj4gKyNkZWZpbmUgR0RCX0JS
RUFLUE9JTlRfU1cgICAgICAgIDANCj4gKyNkZWZpbmUgR0RCX0JSRUFLUE9JTlRfSFcgICAg
ICAgIDENCj4gKyNkZWZpbmUgR0RCX1dBVENIUE9JTlRfV1JJVEUgICAgIDINCj4gKyNkZWZp
bmUgR0RCX1dBVENIUE9JTlRfUkVBRCAgICAgIDMNCj4gKyNkZWZpbmUgR0RCX1dBVENIUE9J
TlRfQUNDRVNTICAgIDQNCj4gKw0KPiArI2VuZGlmIC8qIEdEQlNUVUJfRU5VTVNfSCAqLw0K
PiBkaWZmIC0tZ2l0IGEvYWNjZWwvaHZmL2h2Zi1hY2NlbC1vcHMuYyBiL2FjY2VsL2h2Zi9o
dmYtYWNjZWwtb3BzLmMNCj4gaW5kZXggYjJhMzdhMjIyOS4uYWMwOGNmYjlmMyAxMDA2NDQN
Cj4gLS0tIGEvYWNjZWwvaHZmL2h2Zi1hY2NlbC1vcHMuYw0KPiArKysgYi9hY2NlbC9odmYv
aHZmLWFjY2VsLW9wcy5jDQo+IEBAIC01Miw3ICs1Miw3IEBADQo+ICAgI2luY2x1ZGUgInFl
bXUvbWFpbi1sb29wLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIN
Cj4gICAjaW5jbHVkZSAiZXhlYy9leGVjLWFsbC5oIg0KPiAtI2luY2x1ZGUgImV4ZWMvZ2Ri
c3R1Yi5oIg0KPiArI2luY2x1ZGUgImdkYnN0dWIvZW51bXMuaCINCj4gICAjaW5jbHVkZSAi
c3lzZW11L2NwdXMuaCINCj4gICAjaW5jbHVkZSAic3lzZW11L2h2Zi5oIg0KPiAgICNpbmNs
dWRlICJzeXNlbXUvaHZmX2ludC5oIg0KPiBkaWZmIC0tZ2l0IGEvYWNjZWwva3ZtL2t2bS1h
bGwuYyBiL2FjY2VsL2t2bS9rdm0tYWxsLmMNCj4gaW5kZXggMDA5YjQ5ZGU0NC4uNTY4MGNk
MTU3ZSAxMDA2NDQNCj4gLS0tIGEvYWNjZWwva3ZtL2t2bS1hbGwuYw0KPiArKysgYi9hY2Nl
bC9rdm0va3ZtLWFsbC5jDQo+IEBAIC0yNyw3ICsyNyw3IEBADQo+ICAgI2luY2x1ZGUgImh3
L3BjaS9tc2kuaCINCj4gICAjaW5jbHVkZSAiaHcvcGNpL21zaXguaCINCj4gICAjaW5jbHVk
ZSAiaHcvczM5MHgvYWRhcHRlci5oIg0KPiAtI2luY2x1ZGUgImV4ZWMvZ2Ric3R1Yi5oIg0K
PiArI2luY2x1ZGUgImdkYnN0dWIvZW51bXMuaCINCj4gICAjaW5jbHVkZSAic3lzZW11L2t2
bV9pbnQuaCINCj4gICAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRlLmgiDQo+ICAgI2luY2x1
ZGUgInN5c2VtdS9jcHVzLmgiDQo+IGRpZmYgLS1naXQgYS9hY2NlbC90Y2cvdGNnLWFjY2Vs
LW9wcy5jIGIvYWNjZWwvdGNnL3RjZy1hY2NlbC1vcHMuYw0KPiBpbmRleCAxNDMzZTM4ZjQw
Li4zYzE5ZTY4YTc5IDEwMDY0NA0KPiAtLS0gYS9hY2NlbC90Y2cvdGNnLWFjY2VsLW9wcy5j
DQo+ICsrKyBiL2FjY2VsL3RjZy90Y2ctYWNjZWwtb3BzLmMNCj4gQEAgLTM1LDcgKzM1LDcg
QEANCj4gICAjaW5jbHVkZSAiZXhlYy9leGVjLWFsbC5oIg0KPiAgICNpbmNsdWRlICJleGVj
L2h3YWRkci5oIg0KPiAgICNpbmNsdWRlICJleGVjL3RiLWZsdXNoLmgiDQo+IC0jaW5jbHVk
ZSAiZXhlYy9nZGJzdHViLmgiDQo+ICsjaW5jbHVkZSAiZ2Ric3R1Yi9lbnVtcy5oIg0KPiAg
IA0KPiAgICNpbmNsdWRlICJody9jb3JlL2NwdS5oIg0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEv
Z2Ric3R1Yi91c2VyLmMgYi9nZGJzdHViL3VzZXIuYw0KPiBpbmRleCBlZGViNzJlZmViLi5l
MzRiNThiNDA3IDEwMDY0NA0KPiAtLS0gYS9nZGJzdHViL3VzZXIuYw0KPiArKysgYi9nZGJz
dHViL3VzZXIuYw0KPiBAQCAtMTgsNiArMTgsNyBAQA0KPiAgICNpbmNsdWRlICJleGVjL2dk
YnN0dWIuaCINCj4gICAjaW5jbHVkZSAiZ2Ric3R1Yi9zeXNjYWxscy5oIg0KPiAgICNpbmNs
dWRlICJnZGJzdHViL3VzZXIuaCINCj4gKyNpbmNsdWRlICJnZGJzdHViL2VudW1zLmgiDQo+
ICAgI2luY2x1ZGUgImh3L2NvcmUvY3B1LmgiDQo+ICAgI2luY2x1ZGUgInRyYWNlLmgiDQo+
ICAgI2luY2x1ZGUgImludGVybmFscy5oIg0KPiBkaWZmIC0tZ2l0IGEvbW9uaXRvci9obXAt
Y21kcy5jIGIvbW9uaXRvci9obXAtY21kcy5jDQo+IGluZGV4IGVhNzkxNDhlZTguLjA2NzE1
MjU4OWIgMTAwNjQ0DQo+IC0tLSBhL21vbml0b3IvaG1wLWNtZHMuYw0KPiArKysgYi9tb25p
dG9yL2htcC1jbWRzLmMNCj4gQEAgLTE1LDggKzE1LDkgQEANCj4gICANCj4gICAjaW5jbHVk
ZSAicWVtdS9vc2RlcC5oIg0KPiAgICNpbmNsdWRlICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgi
DQo+IC0jaW5jbHVkZSAiZXhlYy9nZGJzdHViLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvaW9w
b3J0LmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9nZGJzdHViLmgiDQo+ICsjaW5jbHVkZSAiZ2Ri
c3R1Yi9lbnVtcy5oIg0KPiAgICNpbmNsdWRlICJtb25pdG9yL2htcC5oIg0KPiAgICNpbmNs
dWRlICJxZW11L2hlbHBfb3B0aW9uLmgiDQo+ICAgI2luY2x1ZGUgIm1vbml0b3IvbW9uaXRv
ci1pbnRlcm5hbC5oIg0KPiBkaWZmIC0tZ2l0IGEvc3lzdGVtL3ZsLmMgYi9zeXN0ZW0vdmwu
Yw0KPiBpbmRleCBhM2VlZGU1ZmE1Li5jZmNiNjc0NDI1IDEwMDY0NA0KPiAtLS0gYS9zeXN0
ZW0vdmwuYw0KPiArKysgYi9zeXN0ZW0vdmwuYw0KPiBAQCAtNjgsNiArNjgsNyBAQA0KPiAg
ICNpbmNsdWRlICJzeXNlbXUvbnVtYS5oIg0KPiAgICNpbmNsdWRlICJzeXNlbXUvaG9zdG1l
bS5oIg0KPiAgICNpbmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4gKyNpbmNsdWRlICJnZGJz
dHViL2VudW1zLmgiDQo+ICAgI2luY2x1ZGUgInFlbXUvdGltZXIuaCINCj4gICAjaW5jbHVk
ZSAiY2hhcmRldi9jaGFyLmgiDQo+ICAgI2luY2x1ZGUgInFlbXUvYml0bWFwLmgiDQo+IGRp
ZmYgLS1naXQgYS90YXJnZXQvYXJtL2h2Zi9odmYuYyBiL3RhcmdldC9hcm0vaHZmL2h2Zi5j
DQo+IGluZGV4IDQ1ZTIyMThiZTUuLmVmOWJjNDI3MzggMTAwNjQ0DQo+IC0tLSBhL3Rhcmdl
dC9hcm0vaHZmL2h2Zi5jDQo+ICsrKyBiL3RhcmdldC9hcm0vaHZmL2h2Zi5jDQo+IEBAIC0z
Myw3ICszMyw3IEBADQo+ICAgI2luY2x1ZGUgInRyYWNlL3RyYWNlLXRhcmdldF9hcm1faHZm
LmgiDQo+ICAgI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRlLmgiDQo+ICAgDQo+IC0jaW5j
bHVkZSAiZXhlYy9nZGJzdHViLmgiDQo+ICsjaW5jbHVkZSAiZ2Ric3R1Yi9lbnVtcy5oIg0K
PiAgIA0KPiAgICNkZWZpbmUgTURTQ1JfRUwxX1NTX1NISUZUICAwDQo+ICAgI2RlZmluZSBN
RFNDUl9FTDFfTURFX1NISUZUIDE1DQo+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2h5cF9n
ZGJzdHViLmMgYi90YXJnZXQvYXJtL2h5cF9nZGJzdHViLmMNCj4gaW5kZXggZWJkZTI4OTlj
ZC4uZjEyMGQ1NWNhYSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2FybS9oeXBfZ2Ric3R1Yi5j
DQo+ICsrKyBiL3RhcmdldC9hcm0vaHlwX2dkYnN0dWIuYw0KPiBAQCAtMTIsNyArMTIsNyBA
QA0KPiAgICNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+ICAgI2luY2x1ZGUgImNwdS5oIg0K
PiAgICNpbmNsdWRlICJpbnRlcm5hbHMuaCINCj4gLSNpbmNsdWRlICJleGVjL2dkYnN0dWIu
aCINCj4gKyNpbmNsdWRlICJnZGJzdHViL2VudW1zLmgiDQo+ICAgDQo+ICAgLyogTWF4aW11
bSBhbmQgY3VycmVudCBicmVhay93YXRjaCBwb2ludCBjb3VudHMgKi8NCj4gICBpbnQgbWF4
X2h3X2JwcywgbWF4X2h3X3dwczsNCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0va3ZtLmMg
Yi90YXJnZXQvYXJtL2t2bS5jDQo+IGluZGV4IDdjZjVjZjMxZGUuLjcwZjc5ZWRhMzMgMTAw
NjQ0DQo+IC0tLSBhL3RhcmdldC9hcm0va3ZtLmMNCj4gKysrIGIvdGFyZ2V0L2FybS9rdm0u
Yw0KPiBAQCAtMzEsNyArMzEsNyBAQA0KPiAgICNpbmNsdWRlICJody9wY2kvcGNpLmgiDQo+
ICAgI2luY2x1ZGUgImV4ZWMvbWVtYXR0cnMuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9hZGRy
ZXNzLXNwYWNlcy5oIg0KPiAtI2luY2x1ZGUgImV4ZWMvZ2Ric3R1Yi5oIg0KPiArI2luY2x1
ZGUgImdkYnN0dWIvZW51bXMuaCINCj4gICAjaW5jbHVkZSAiaHcvYm9hcmRzLmgiDQo+ICAg
I2luY2x1ZGUgImh3L2lycS5oIg0KPiAgICNpbmNsdWRlICJxYXBpL3Zpc2l0b3IuaCINCj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2t2bS9rdm0uYyBiL3RhcmdldC9pMzg2L2t2bS9r
dm0uYw0KPiBpbmRleCA5MTJmNWQ1YTZiLi5hNjY2MTI5ZjQxIDEwMDY0NA0KPiAtLS0gYS90
YXJnZXQvaTM4Ni9rdm0va3ZtLmMNCj4gKysrIGIvdGFyZ2V0L2kzODYva3ZtL2t2bS5jDQo+
IEBAIC0zOCw3ICszOCw3IEBADQo+ICAgI2luY2x1ZGUgImh5cGVydi5oIg0KPiAgICNpbmNs
dWRlICJoeXBlcnYtcHJvdG8uaCINCj4gICANCj4gLSNpbmNsdWRlICJleGVjL2dkYnN0dWIu
aCINCj4gKyNpbmNsdWRlICJnZGJzdHViL2VudW1zLmgiDQo+ICAgI2luY2x1ZGUgInFlbXUv
aG9zdC11dGlscy5oIg0KPiAgICNpbmNsdWRlICJxZW11L21haW4tbG9vcC5oIg0KPiAgICNp
bmNsdWRlICJxZW11L3JhdGVsaW1pdC5oIg0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3BwYy9r
dm0uYyBiL3RhcmdldC9wcGMva3ZtLmMNCj4gaW5kZXggMDA1ZjIyMzlmMy4uMmMzOTMyMjAw
YiAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L3BwYy9rdm0uYw0KPiArKysgYi90YXJnZXQvcHBj
L2t2bS5jDQo+IEBAIC0zOSw3ICszOSw3IEBADQo+ICAgI2luY2x1ZGUgIm1pZ3JhdGlvbi9x
ZW11LWZpbGUtdHlwZXMuaCINCj4gICAjaW5jbHVkZSAic3lzZW11L3dhdGNoZG9nLmgiDQo+
ICAgI2luY2x1ZGUgInRyYWNlLmgiDQo+IC0jaW5jbHVkZSAiZXhlYy9nZGJzdHViLmgiDQo+
ICsjaW5jbHVkZSAiZ2Ric3R1Yi9lbnVtcy5oIg0KPiAgICNpbmNsdWRlICJleGVjL21lbWF0
dHJzLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvcmFtX2FkZHIuaCINCj4gICAjaW5jbHVkZSAi
c3lzZW11L2hvc3RtZW0uaCINCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9zMzkweC9rdm0va3Zt
LmMgYi90YXJnZXQvczM5MHgva3ZtL2t2bS5jDQo+IGluZGV4IDFiNDk0ZWNjMjAuLjk0MTgx
ZDkyODEgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9zMzkweC9rdm0va3ZtLmMNCj4gKysrIGIv
dGFyZ2V0L3MzOTB4L2t2bS9rdm0uYw0KPiBAQCAtNDAsNyArNDAsNyBAQA0KPiAgICNpbmNs
dWRlICJzeXNlbXUvaHdfYWNjZWwuaCINCj4gICAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRl
LmgiDQo+ICAgI2luY2x1ZGUgInN5c2VtdS9kZXZpY2VfdHJlZS5oIg0KPiAtI2luY2x1ZGUg
ImV4ZWMvZ2Ric3R1Yi5oIg0KPiArI2luY2x1ZGUgImdkYnN0dWIvZW51bXMuaCINCj4gICAj
aW5jbHVkZSAiZXhlYy9yYW1fYWRkci5oIg0KPiAgICNpbmNsdWRlICJ0cmFjZS5oIg0KPiAg
ICNpbmNsdWRlICJody9zMzkweC9zMzkwLXBjaS1pbnN0LmgiDQoNClJldmlld2VkLWJ5OiBQ
aWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
