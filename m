Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp79361njb;
        Thu, 3 Oct 2024 14:34:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4/6Thko4blb+U0LP9C++RQ835V4nc/0H+qokSs0I8jXkizOkqRxcrq2idw0qiFFA1Hgax1duA/nsnOQ==@linaro.org
X-Received: by 2002:a17:903:2447:b0:20b:bdbf:da82 with SMTP id d9443c01a7336-20bfde554famr8821845ad.9.1727991254609;
        Thu, 03 Oct 2024 14:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727991254; cv=none;
        d=google.com; s=arc-20240605;
        b=PmTxCAIUeUN57Q2/akT9DbH5K9nRd47GddfrJTS/hIv4YU08dKdLoO2Kq+4rba+Vkv
         TVmQSFqiKuVnBXUCit/EDVbIl/5s4uHMrDNzrq5VJq5IBYBaL+wblTmJOYQqOnPaPpCp
         SlmLnDyRMEDEdIRrmHLlycb4OAAUR6pj//VBeD1UVXx3E+tZZ3YkaYXXlrF/gXb/MMlg
         oT+6pQjq1PCmhags6ys0adTsSbgBjp3NOoUj8Ak1B7ceWKfhnVwKz9orlRBJIImeF1cr
         R449+/2T/UxmqwemEGPKM+6D+wDWPBIYDJa+po7q5s0nTgWXxShp0EIbcTkHURky+L7/
         1zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wut2VfmefsDTxx/0B6GKn5XwtTzZN0devQNAsGmEMVI=;
        fh=rz8FWj5xZ1k/YhOsm8Ug5GgdCBlxnY1bYf72yG0QRk4=;
        b=ksya3EXf4rxGYIBaJuqRZ6dYrgVIlSGAiTX7KPq+hRsrsOxG+7CYb8pSXuzPQtvt7A
         DCagqVNXM9xxu5YYbSz8rPFbJ935gJS6gmgfvGrY07MOqxtk5ZffVcg4SkfS24Nil6ZV
         X0oA6gzfj8ff9alcF0LM1/przK+XYPz9rIfyLRSJcQT1FSwsWjMKWlBrA16pJ2WwlfqN
         vtmexN0/eGgtsBhBsUKAVeqcwYdmM0IOBRIergkl0r//UWttlMV5bKbBIzk3yYmrCJba
         MOMo3iDxmuLR3DooojZtSExKGXKtVzAhliMUPW8kWA3dL5lRUAjQ/1z7sVzDOM3ZS8zy
         Cbeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPolRCgM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20be9dfa0cfsor13402905ad.18.2024.10.03.14.34.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Oct 2024 14:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPolRCgM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727991254; x=1728596054; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wut2VfmefsDTxx/0B6GKn5XwtTzZN0devQNAsGmEMVI=;
        b=XPolRCgM246QjeASnet8eBptjpeH+Oj4lfjTEiIfjJTadGU9wVtvd5IjhGlPOD8sHo
         hFsLRcQXdIFwlk+xqBqRqsOADiup7ZpJsweFBCeC+PPRGzyQeTlQ+7YtBSdeauZF+wuw
         BZlM+q/xa34SvYU7yPYr/mnJaTEUbMCp0domp+ENr4hKgYev2l/XvZiMyvDIN2NzMdNG
         AevneiQ0rzrzO6c3+ckom/ULXblB4EdZZ0+Z6r8+SB38Xybsi2okNXybA15j18eyRUfo
         eyZbqmnRpicGnTYFpl7I3fbJGueiPSblDGkfM4TfCRhV8jouFdE7oFYj1kIMSLI+/4ZV
         iQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991254; x=1728596054;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wut2VfmefsDTxx/0B6GKn5XwtTzZN0devQNAsGmEMVI=;
        b=sZIgxKSmdJkyCazxwGW/N58QLCCYdGzioSo1Rwc1Cq+SIrj2bJ6Y8Tpzpgnd+q0O/5
         g2T3OGxaBmFxrP0RjLSerfDqY+MJBFufB/9iGW91uAjXG9YL2lb/p+szaortiBKeFbHR
         v+uRfyw3RVaIqEzLrs4+xsnc6Kkl+YhDR4kwpHBIpHx47Iji/D0zVnHY8m7ldDpcUhaA
         M98/84QNjnLqyYOaFHMPDvc8A7cx72AuH4r/MoldoHTIjX3kEvsQbr9vKDWAsg6tLhq3
         bD7g4BOfF5IyyPEwu+ziLcyvKzPJFXBssGMMWX6uuOSQczpFLGOsRAzgJBpg+JbYsx9A
         80sw==
X-Forwarded-Encrypted: i=1; AJvYcCV+vtnkiXjeCAV+qaw+zcP+OPeJ1oRc3MDDtFpl9PMfX7GrPY9N3H+8T2CAfkQaiJlbAfUR3AI1lfffWQ==@linaro.org
X-Gm-Message-State: AOJu0YzGrR1/bR74fDqk5463pxqx9biW4uGxnoGXL1optKnZbY9WTw02
	CXQWAcAtqyKyEqhvGWUd/43mPRW+JnG5BMnKVduaBs2XgEIcEG68k86pcbcNHeryKw==
X-Google-Smtp-Source: AGHT+IHNC5G3L1x04inR/nzkP/D/G2BJXAL1GAUGKLld1pMsIP7srJorshH+6lLW9EI11G3E6ucI1g==
X-Received: by 2002:a17:903:24f:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-20bfe03f6a2mr6740075ad.33.1727991254158;
        Thu, 03 Oct 2024 14:34:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20bef70701fsm13136695ad.258.2024.10.03.14.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 14:34:13 -0700 (PDT)
Message-ID: <46ea20fd-c6bc-411a-b8e2-ab7179c00185@linaro.org>
Date: Thu, 3 Oct 2024 14:34:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by
 stl_endian_p()
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-9-philmd@linaro.org>
 <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
 <0c28a435-0af6-450f-8558-14dddc6cb6a6@linaro.org>
 <a14cd43c-087b-4a5d-b036-39aa6a80e691@linaro.org>
 <f20cebfe-027a-4664-82f0-3769c7047e38@linaro.org>
 <aeb88605-989b-4c26-9371-15fbe44a9e3a@linaro.org>
In-Reply-To: <aeb88605-989b-4c26-9371-15fbe44a9e3a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: uW30ZalRaHQa

T24gMTAvMy8yNCAxNDozMSwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gT24gMTAvMy8y
NCAxMzo0OCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+PiBPbiAzLzEwLzI0
IDE4OjA0LCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+IE9uIDEwLzMvMjQgMDk6MDIs
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4+PiBPbiAzMC85LzI0IDE2OjMy
LCBUaG9tYXMgSHV0aCB3cm90ZToNCj4+Pj4+IE9uIDMwLzA5LzIwMjQgMDkuMzQsIFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4+Pj4+IFJlcGxhY2UgYSBwYWlyIG9mIG1l
bWNweSgpICsgdHN3YXAzMigpIGJ5IHN0bF9lbmRpYW5fcCgpLA0KPj4+Pj4+IHdoaWNoIGFs
c28gc3dhcCB0aGUgdmFsdWUgdXNpbmcgdGFyZ2V0IGVuZGlhbm5lc3MuDQo+Pj4+Pj4NCj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxp
bmFyby5vcmc+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gICDCoMKgIGh3L3h0ZW5zYS94dGZwZ2Eu
YyB8IDYgKystLS0tDQo+Pj4+Pj4gICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaHcv
eHRlbnNhL3h0ZnBnYS5jIGIvaHcveHRlbnNhL3h0ZnBnYS5jDQo+Pj4+Pj4gaW5kZXggMjI4
ZjAwYjA0NS4uNTIxZmU4NGIwMSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9ody94dGVuc2EveHRm
cGdhLmMNCj4+Pj4+PiArKysgYi9ody94dGVuc2EveHRmcGdhLmMNCj4+Pj4+PiBAQCAtNDM4
LDExICs0MzgsOSBAQCBzdGF0aWMgdm9pZCB4dGZwZ2FfaW5pdChjb25zdCBYdGZwZ2FCb2Fy
ZERlc2MNCj4+Pj4+PiAqYm9hcmQsIE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkNCj4+Pj4+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc2l6ZV90IGJvb3Rfc3ogPSBU
QVJHRVRfQklHX0VORElBTiA/DQo+Pj4+Pj4gc2l6ZW9mKGJvb3RfYmUpDQo+Pj4+Pj4gICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA6DQo+Pj4+Pj4gc2l6ZW9mKGJvb3RfbGUpOw0KPj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1aW50OF90ICpib290ID0gVEFSR0VUX0JJR19FTkRJQU4gPyBib290
X2JlIDogYm9vdF9sZTsNCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJf
dCBlbnRyeV9wYyA9IHRzd2FwMzIoZW50cnlfcG9pbnQpOw0KPj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVpbnQzMl90IGVudHJ5X2EyID0gdHN3YXAzMih0YWdwdHIpOw0KPj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweShib290ICsgNCwgJmVudHJ5X3Bj
LCBzaXplb2YoZW50cnlfcGMpKTsNCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBt
ZW1jcHkoYm9vdCArIDgsICZlbnRyeV9hMiwgc2l6ZW9mKGVudHJ5X2EyKSk7DQo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RsX2VuZGlhbl9wKFRBUkdFVF9CSUdfRU5ESUFO
LCBib290ICsgNCwgZW50cnlfcG9pbnQpOw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0bF9lbmRpYW5fcChUQVJHRVRfQklHX0VORElBTiwgYm9vdCArIDgsIHRhZ3B0cik7
DQo+Pj4+Pg0KPj4+Pj4gV2h5IGRvbid0IHlvdSBzaW1wbHkgdXNlIHN0bF9wKCkgaGVyZT8N
Cj4+Pj4NCj4+Pj4gV2Ugd2FudCB0byByZW1vdmUgdGhlIHRzd2FwMzIoKSBjYWxscy4uLg0K
Pj4+Pg0KPj4+DQo+Pj4gSSB0aGluayBpcyBwb2ludCBpcyB0aGF0IHlvdSBjb3VsZCBkaXJl
Y3RseSB1c2Ugc3RsX2JlX3AsIGluc3RlYWQgb2YNCj4+PiBzdGxfZW5kaWFuX3AoVEFSR0VU
X0JJVF9FTkRJQU4sIC4uLikuDQo+Pg0KPj4gVEFSR0VUX0JJR19FTkRJQU4gaXMgZGVmaW5l
ZCBhcyAwIG9uIGxpdHRsZSBlbmRpYW4sIGFuZCAxIG9uIGJpZyBvbmUuDQo+Pg0KPj4gVGhl
IGZvbGxvd2luZyBjaGFuZ2UgaXNuJ3Qgd29ydGggaXQ6DQo+Pg0KPj4gICAgICBpZiAoVEFS
R0VUX0JJR19FTkRJQU4pIHsNCj4+ICAgICAgICBzdGxfYmVfcChib290ICsgOCwgdGFncHRy
KTsNCj4+ICAgICAgfSBlbHNlIHsNCj4+ICAgICAgICBzdGxfbGVfcChib290ICsgOCwgdGFn
cHRyKTsNCj4+ICAgICAgfQ0KPj4NCj4+IE1heWJlIEknbSBtaXNzaW5nIFRob21hcyBwb2lu
dCwgYXMgdGhlIHh0ZnBnYSBtYWNoaW5lcyBhcmUgYXZhaWxhYmxlDQo+PiBmb3IgYm90aCB4
dGVuc2Etc29mdG1tdSAoTEUpIGFuZCB4dGVuc2FlYi1zb2Z0bW11IChCRSkuDQo+Pg0KPj4+
IEkgZG9uJ3Qga25vdyBpZiB5b3VyIGludGVudCBpcyB0byBtYWtlIGJlL2xlIHZhcmlhbnQg
InByaXZhdGUiIGFuZA0KPj4+IHJlbGllcyBvbmx5IG9uIGVuZGlhbl9wIHRob3VnaC4NCj4+
DQo+PiBNeSBpbnRlbnQgaXMgdG8gZW5mb3JjZSBlbmRpYW4gYWdub3N0aWMgQVBJIHVzZXMg
d2hlbiBwb3NzaWJsZSwgYW5kDQo+PiB1c2UgTEUvQkUgc3BlY2lmaWMgdmFyaWFudCB3aGVu
IGl0IGlzIGtub3duIGF0IGJ1aWxkIHRpbWUuDQo+IA0KPiBPaCBvaywgaXQncyBtZSB3aG8g
bWlzc2VkIHlvdXIgcG9pbnQgdGhlbi4NCj4gRm9yIHNvbWUgcmVhc29uLCBJIHRob3VnaHQg
d2Ugd2VyZSBhbHdheXMgY2FsbGluZyBiaWcgZW5kaWFuIHZhcmlhbnQuDQo+IA0KPiBUaHVz
LCB5b3VyIGltcGxlbWVudGF0aW9uIG1ha2VzIHRvdGFsbHkgc2Vuc2UuDQo+IA0KPiBMZXQn
cyBzZWUgaWYgVGhvbWFzIG1lYW50IHNvbWV0aGluZyBkaWZmZXJlbnQuDQo+IEVsc2UsDQo+
IFJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc+DQoNCkxvb2tpbmcgbW9yZSBjbG9zZWx5LA0Kc3RsX3AgaXMgYWxyZWFkeSBjb3Jy
ZWN0bHkgZGVmaW5lZCB3aGVuIHlvdSBrbm93IGF0IGNvbXBpbGUgdGltZSB5b3VyIA0KdGFy
Z2V0IGVuZGlhbm5lc3MuIFNvIFRob21hcyB3YXMgcmVmZXJyaW5nIHRvIHRoaXMuDQoNCmh0
dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2JsYW1lL21hc3Rlci9pbmNs
dWRlL2V4ZWMvY3B1LWFsbC5oP3JlZl90eXBlPWhlYWRzI0w0OQ0K
