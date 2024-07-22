Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2142069njc;
        Mon, 22 Jul 2024 14:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoSJtrCEYHHrB6UI7vwVZdcdYmlvbASEVyx0It59sOlKCQ/ygtyVV0XBoPZjMKvmkiSlVVMYQitXAc7OyISrtThkXafLrI
X-Received: by 2002:a17:902:dac8:b0:1fd:78a0:b291 with SMTP id d9443c01a7336-1fd78a0ba7dmr65077065ad.14.1721682364326;
        Mon, 22 Jul 2024 14:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721682364; cv=none;
        d=google.com; s=arc-20160816;
        b=VatnTBTvExyoxvZzbS9FWlfuypwvToalBf8r4dKOxFSfNyN6M7cZPJErT3R7v/VxTB
         CO1XgGYX6GPAueD8d5hafwLBhchiE4J4NwxoYi10pfK2G+CO1gZkXl54F4LFuMhSarC/
         /jKE3kE8u/EAyd7g3Tvg40M8byy2H9DCyPBwNzVEBoKDtoigJp3N37L04Jl5TW35t+lL
         VD4oiZrNN/uO5rf5ofvBGH60ybZq0xFf1tf8ddn21V8hHEMViYjea94gvqlOQ9K1JWAL
         S6Yqh/vX8tJ/gnkjm7tfvIpWAEurvn7730QtwCRzN6PeCeoGDzBFIsdlr+arYqM+SCQa
         YFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+BC70SQOUCj32PwE09305E5qj3WqHU1ENkN4YcT/+k0=;
        fh=deub3dTidZM2jNbZy0umtPoLIR/3CTZKIPn1XeV8qqE=;
        b=pz5+/Y0UTV13HTemVCh3Hat8NETCfScIxyRhiUVZEBWaaGWxaZnKE7ZyqVsp5p8eGY
         XGBQZ7+hht2oOsROyMowFzPgPlemjN0WBKIZlzV8d57NOXogKtk1lQVHjRFrAE6plaG/
         l0t59p3tY4qceN+onAa8t3yrDIcEU198HjPLjm0XE9B2v3NiH0UDpa6iLpFgifgTqmwj
         3g+kcxmF0gBgAvR/e2q7ihtoLNoTb0G99xyowwvs9S1MFkhMkBowSWuOc+ti8b8biVq5
         012XpN2mF+xGBeBhULkAz4wkwECFmIFANygoBotgZuFZqJF2NZ/8P6LEJC4snp2Z+0Bv
         rbOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaMu7D1y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1fd6f24ac78sor29300125ad.1.2024.07.22.14.06.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iaMu7D1y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721682364; x=1722287164; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BC70SQOUCj32PwE09305E5qj3WqHU1ENkN4YcT/+k0=;
        b=iaMu7D1yFGUdRQuE2Iyf5x4nFg2RKVC/cik7S5lwFyxKSKx1FOoB34b8LZVipluA7k
         IPAJxIdw+NN5REp5Qo80lSZFxe9zsuYKutc4VG2rt+qSh+8EOoHSNXeNcI4tUM68s08n
         dDjNVv/VtFYyn38QlZVgNtyKOSVN3s2X0zovLRNZczTPPM+riOaAb4XjUGeuMnq97rv3
         4Lj+Rz8OmzzEfMh44BYh+oihu18kAtkJpii1aTuIGQyGOzcq1i8zEvlPU7lKQjP1Bs58
         xZua2RD3b56YxzzFZMFbHcy1ded+/x+LrDvzRPWPtnRZ8L6vGKVirLuX/lj+2p9BN83m
         aORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682364; x=1722287164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BC70SQOUCj32PwE09305E5qj3WqHU1ENkN4YcT/+k0=;
        b=ck6AYlFQMjkTWvHsm480FSyZCVwitxwVXlNZ+BWslDpFBkzsNXqy1GLpg+EIPyZ/BW
         MYGhqraUjPXg0ooae1ol/yoO5FLRc8MsM1kogrLTgaFaBPK1oC43cRrC2Rv7D/4j3ziC
         hKksm2iwt5G1H1OPMVzAhl5raMkAmFxd3ObTE8tn4t2YTgpVz300P70het2vr52bclbi
         xiZ4rw4bNM/UqiGhvoR8YkOW09eZqg8pWf44gVSDbQcv3n8fCDTgUXF1xn+iJeo6P0O6
         friCEYAxo4+KdMaJqi8S5PAU+rryrB5gqIIZumnLwUvYEP/pP382oxZSlQNiXN/iv63C
         2uDw==
X-Forwarded-Encrypted: i=1; AJvYcCVDBpValcQ2tZbbkt6exq/2NoFXhnTMXnrvDBaXBbY9aY8LzMrX8beFMWW+eLYQsfjdL3NfCpuh81g/s6jaknsmpWHWsrt+
X-Gm-Message-State: AOJu0Yw/x1O52LnXeY4noNE+yI9z6+MrfzCgF/Two0xjyVuSqfpBhcO/
	MjbKu+YDnoOxqql+8qGdW452h5mwgXBNoE94g/MVv491Tr3g1+rlJLeUCkLyxjF+/w==
X-Google-Smtp-Source: AGHT+IFWQ8EnmzSeBLlsabdH4ujh+qhOASXxd3CDyp3ZAM4WZDKML2+G0kZyk9AiPFV+1oVfZT4c4g==
X-Received: by 2002:a17:903:2285:b0:1fd:70c4:8389 with SMTP id d9443c01a7336-1fd745258dbmr66793345ad.7.1721682363728;
        Mon, 22 Jul 2024 14:06:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31bb8asm59780195ad.170.2024.07.22.14.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:06:03 -0700 (PDT)
Message-ID: <46f15897-da83-461d-b3bc-b0143fb1a4b0@linaro.org>
Date: Mon, 22 Jul 2024 14:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] util/fifo8: Expose fifo8_pop_buf()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240722160745.67904-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ElaGMUUrGn7n

T24gNy8yMi8yNCAwOTowNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IEV4
dHJhY3QgZmlmbzhfcG9wX2J1ZigpIGZyb20gaHcvc2NzaS9lc3AuYyBhbmQgZXhwb3NlDQo+
IGl0IGFzIHBhcnQgb2YgdGhlIDxxZW11L2ZpZm84Lmg+IEFQSS4gVGhpcyBmdW5jdGlvbiB0
YWtlcw0KPiBjYXJlIG9mIG5vbi1jb250aWd1b3VzICh3cmFwcGVkKSBGSUZPIGJ1ZmZlciAo
d2hpY2ggaXMgYW4NCj4gaW1wbGVtZW50YXRpb24gZGV0YWlsKS4NCj4gDQo+IFN1Z2dlc3Rl
ZC1ieTogTWFyayBDYXZlLUF5bGFuZCA8bWFyay5jYXZlLWF5bGFuZEBpbGFuZGUuY28udWs+
DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9xZW11L2ZpZm84LmggfCAxNCArKysrKysr
KysrKysrKw0KPiAgIGh3L3Njc2kvZXNwLmMgICAgICAgIHwgMzYgKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgdXRpbC9maWZvOC5jICAgICAgICAgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDYg
aW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9xZW11L2ZpZm84LmggYi9pbmNsdWRlL3FlbXUvZmlmbzguaA0KPiBpbmRleCA2ODY5
MThhM2E0Li4yMWM3YTIyOTM3IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3FlbXUvZmlmbzgu
aA0KPiArKysgYi9pbmNsdWRlL3FlbXUvZmlmbzguaA0KPiBAQCAtNjIsNiArNjIsMjAgQEAg
dm9pZCBmaWZvOF9wdXNoX2FsbChGaWZvOCAqZmlmbywgY29uc3QgdWludDhfdCAqZGF0YSwg
dWludDMyX3QgbnVtKTsNCj4gICAgKi8NCj4gICB1aW50OF90IGZpZm84X3BvcChGaWZvOCAq
Zmlmbyk7DQo+ICAgDQo+ICsvKioNCj4gKyAqIGZpZm84X3BvcF9idWY6DQo+ICsgKiBAZmlm
bzogRklGTyB0byBwb3AgZnJvbQ0KPiArICogQGRlc3Q6IHRoZSBidWZmZXIgdG8gd3JpdGUg
dGhlIGRhdGEgaW50byAoY2FuIGJlIE5VTEwpDQo+ICsgKiBAZGVzdGxlbjogc2l6ZSBvZiBA
ZGVzdCBhbmQgbWF4aW11bSBudW1iZXIgb2YgYnl0ZXMgdG8gcG9wDQo+ICsgKg0KPiArICog
UG9wIGEgbnVtYmVyIG9mIGVsZW1lbnRzIGZyb20gdGhlIEZJRk8gdXAgdG8gYSBtYXhpbXVt
IG9mIEBkZXN0bGVuLg0KPiArICogVGhlIHBvcHBlZCBkYXRhIGlzIGNvcGllZCBpbnRvIHRo
ZSBAZGVzdCBidWZmZXIuDQo+ICsgKiBDYXJlIGlzIHRha2VuIHdoZW4gdGhlIGRhdGEgd3Jh
cHMgYXJvdW5kIGluIHRoZSByaW5nIGJ1ZmZlci4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiBu
dW1iZXIgb2YgYnl0ZXMgcG9wcGVkLg0KPiArICovDQo+ICt1aW50MzJfdCBmaWZvOF9wb3Bf
YnVmKEZpZm84ICpmaWZvLCB1aW50OF90ICpkZXN0LCB1aW50MzJfdCBkZXN0bGVuKTsNCj4g
Kw0KPiAgIC8qKg0KPiAgICAqIGZpZm84X3BvcF9jb25zdGJ1ZjoNCj4gICAgKiBAZmlmbzog
RklGTyB0byBwb3AgZnJvbQ0KPiBkaWZmIC0tZ2l0IGEvaHcvc2NzaS9lc3AuYyBiL2h3L3Nj
c2kvZXNwLmMNCj4gaW5kZXggNjQzODRmOWIwZS4uY2VjODQ3YjU0YSAxMDA2NDQNCj4gLS0t
IGEvaHcvc2NzaS9lc3AuYw0KPiArKysgYi9ody9zY3NpL2VzcC5jDQo+IEBAIC0xOTcsMzkg
KzE5Nyw5IEBAIHN0YXRpYyB1aW50OF90IGVzcF9maWZvX3BvcChFU1BTdGF0ZSAqcykNCj4g
ICAgICAgcmV0dXJuIHZhbDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdWludDMyX3QgZXNw
X2ZpZm84X3BvcF9idWYoRmlmbzggKmZpZm8sIHVpbnQ4X3QgKmRlc3QsIGludCBtYXhsZW4p
DQo+IC17DQo+IC0gICAgY29uc3QgdWludDhfdCAqYnVmOw0KPiAtICAgIHVpbnQzMl90IG4s
IG4yOw0KPiAtICAgIGludCBsZW47DQo+IC0NCj4gLSAgICBpZiAobWF4bGVuID09IDApIHsN
Cj4gLSAgICAgICAgcmV0dXJuIDA7DQo+IC0gICAgfQ0KPiAtDQo+IC0gICAgbGVuID0gbWF4
bGVuOw0KPiAtICAgIGJ1ZiA9IGZpZm84X3BvcF9jb25zdGJ1ZihmaWZvLCBsZW4sICZuKTsN
Cj4gLSAgICBpZiAoZGVzdCkgew0KPiAtICAgICAgICBtZW1jcHkoZGVzdCwgYnVmLCBuKTsN
Cj4gLSAgICB9DQo+IC0NCj4gLSAgICAvKiBBZGQgRklGTyB3cmFwYXJvdW5kIGlmIG5lZWRl
ZCAqLw0KPiAtICAgIGxlbiAtPSBuOw0KPiAtICAgIGxlbiA9IE1JTihsZW4sIGZpZm84X251
bV91c2VkKGZpZm8pKTsNCj4gLSAgICBpZiAobGVuKSB7DQo+IC0gICAgICAgIGJ1ZiA9IGZp
Zm84X3BvcF9jb25zdGJ1ZihmaWZvLCBsZW4sICZuMik7DQo+IC0gICAgICAgIGlmIChkZXN0
KSB7DQo+IC0gICAgICAgICAgICBtZW1jcHkoJmRlc3Rbbl0sIGJ1ZiwgbjIpOw0KPiAtICAg
ICAgICB9DQo+IC0gICAgICAgIG4gKz0gbjI7DQo+IC0gICAgfQ0KPiAtDQo+IC0gICAgcmV0
dXJuIG47DQo+IC19DQo+IC0NCj4gICBzdGF0aWMgdWludDMyX3QgZXNwX2ZpZm9fcG9wX2J1
ZihFU1BTdGF0ZSAqcywgdWludDhfdCAqZGVzdCwgaW50IG1heGxlbikNCj4gICB7DQo+IC0g
ICAgdWludDMyX3QgbGVuID0gZXNwX2ZpZm84X3BvcF9idWYoJnMtPmZpZm8sIGRlc3QsIG1h
eGxlbik7DQo+ICsgICAgdWludDMyX3QgbGVuID0gZmlmbzhfcG9wX2J1Zigmcy0+Zmlmbywg
ZGVzdCwgbWF4bGVuKTsNCj4gICANCj4gICAgICAgZXNwX3VwZGF0ZV9kcnEocyk7DQo+ICAg
ICAgIHJldHVybiBsZW47DQo+IEBAIC0zMzUsNyArMzA1LDcgQEAgc3RhdGljIHZvaWQgZG9f
Y29tbWFuZF9waGFzZShFU1BTdGF0ZSAqcykNCj4gICAgICAgaWYgKCFjbWRsZW4gfHwgIXMt
PmN1cnJlbnRfZGV2KSB7DQo+ICAgICAgICAgICByZXR1cm47DQo+ICAgICAgIH0NCj4gLSAg
ICBlc3BfZmlmbzhfcG9wX2J1Zigmcy0+Y21kZmlmbywgYnVmLCBjbWRsZW4pOw0KPiArICAg
IGZpZm84X3BvcF9idWYoJnMtPmNtZGZpZm8sIGJ1ZiwgY21kbGVuKTsNCj4gICANCj4gICAg
ICAgY3VycmVudF9sdW4gPSBzY3NpX2RldmljZV9maW5kKCZzLT5idXMsIDAsIHMtPmN1cnJl
bnRfZGV2LT5pZCwgcy0+bHVuKTsNCj4gICAgICAgaWYgKCFjdXJyZW50X2x1bikgew0KPiBA
QCAtMzgxLDcgKzM1MSw3IEBAIHN0YXRpYyB2b2lkIGRvX21lc3NhZ2VfcGhhc2UoRVNQU3Rh
dGUgKnMpDQo+ICAgICAgIC8qIElnbm9yZSBleHRlbmRlZCBtZXNzYWdlcyBmb3Igbm93ICov
DQo+ICAgICAgIGlmIChzLT5jbWRmaWZvX2NkYl9vZmZzZXQpIHsNCj4gICAgICAgICAgIGlu
dCBsZW4gPSBNSU4ocy0+Y21kZmlmb19jZGJfb2Zmc2V0LCBmaWZvOF9udW1fdXNlZCgmcy0+
Y21kZmlmbykpOw0KPiAtICAgICAgICBlc3BfZmlmbzhfcG9wX2J1Zigmcy0+Y21kZmlmbywg
TlVMTCwgbGVuKTsNCj4gKyAgICAgICAgZmlmbzhfcG9wX2J1Zigmcy0+Y21kZmlmbywgTlVM
TCwgbGVuKTsNCj4gICAgICAgICAgIHMtPmNtZGZpZm9fY2RiX29mZnNldCA9IDA7DQo+ICAg
ICAgIH0NCj4gICB9DQo+IGRpZmYgLS1naXQgYS91dGlsL2ZpZm84LmMgYi91dGlsL2ZpZm84
LmMNCj4gaW5kZXggMzFmMGQzNGMwYy4uNjYxMGI3OTE4MiAxMDA2NDQNCj4gLS0tIGEvdXRp
bC9maWZvOC5jDQo+ICsrKyBiL3V0aWwvZmlmbzguYw0KPiBAQCAtMTAyLDYgKzEwMiwzNSBA
QCBjb25zdCB1aW50OF90ICpmaWZvOF9wb3BfY29uc3RidWYoRmlmbzggKmZpZm8sIHVpbnQz
Ml90IG1heCwgdWludDMyX3QgKm51bXB0cikNCj4gICAgICAgcmV0dXJuIGZpZm84X3BlZWtw
b3BfYnVmKGZpZm8sIG1heCwgbnVtcHRyLCB0cnVlKTsNCj4gICB9DQo+ICAgDQo+ICt1aW50
MzJfdCBmaWZvOF9wb3BfYnVmKEZpZm84ICpmaWZvLCB1aW50OF90ICpkZXN0LCB1aW50MzJf
dCBkZXN0bGVuKQ0KPiArew0KPiArICAgIGNvbnN0IHVpbnQ4X3QgKmJ1ZjsNCj4gKyAgICB1
aW50MzJfdCBuMSwgbjIgPSAwOw0KPiArICAgIHVpbnQzMl90IGxlbjsNCj4gKw0KPiArICAg
IGlmIChkZXN0bGVuID09IDApIHsNCj4gKyAgICAgICAgcmV0dXJuIDA7DQo+ICsgICAgfQ0K
PiArDQo+ICsgICAgbGVuID0gZGVzdGxlbjsNCj4gKyAgICBidWYgPSBmaWZvOF9wb3BfY29u
c3RidWYoZmlmbywgbGVuLCAmbjEpOw0KPiArICAgIGlmIChkZXN0KSB7DQo+ICsgICAgICAg
IG1lbWNweShkZXN0LCBidWYsIG4xKTsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICAvKiBBZGQg
RklGTyB3cmFwYXJvdW5kIGlmIG5lZWRlZCAqLw0KPiArICAgIGxlbiAtPSBuMTsNCj4gKyAg
ICBsZW4gPSBNSU4obGVuLCBmaWZvOF9udW1fdXNlZChmaWZvKSk7DQo+ICsgICAgaWYgKGxl
bikgew0KPiArICAgICAgICBidWYgPSBmaWZvOF9wb3BfY29uc3RidWYoZmlmbywgbGVuLCAm
bjIpOw0KPiArICAgICAgICBpZiAoZGVzdCkgew0KPiArICAgICAgICAgICAgbWVtY3B5KCZk
ZXN0W24xXSwgYnVmLCBuMik7DQo+ICsgICAgICAgIH0NCj4gKyAgICB9DQo+ICsNCj4gKyAg
ICByZXR1cm4gbjEgKyBuMjsNCj4gK30NCj4gKw0KPiAgIGJvb2wgZmlmbzhfaXNfZW1wdHko
RmlmbzggKmZpZm8pDQo+ICAgew0KPiAgICAgICByZXR1cm4gKGZpZm8tPm51bSA9PSAwKTsN
Cg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZz4NCg==
