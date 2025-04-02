Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3524198njd;
        Wed, 2 Apr 2025 08:25:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIT1ls2BkjFFjrMeXjS5SxsR8j9uA+WODlkDBxWCoTDDanEUmfSITMksMoAUPS4QyjAeCsfXNBvjJTJQ==@linaro.org
X-Received: by 2002:a05:6a00:2e18:b0:736:2ff4:f255 with SMTP id d2e1a72fcca58-7398043955emr23822625b3a.15.1743607510737;
        Wed, 02 Apr 2025 08:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743607510; cv=none;
        d=google.com; s=arc-20240605;
        b=fz276LRb0Km758l2/hLqpWMUfUjSMflAjRreFRkmq6VtE9gY6Pjvv7Gu5oH8A/ElIE
         ieGbg9m6kv6eCeTmLiN4enhsbwY+50WmiL1rlB4V+W5C8ku56QBAO0P1DP3rEEirS5iG
         9IBEmMFqA7MsvSG+uWNTEJlP+XWiuLyWkN7Q0r8QoPyAYI5/OOt6Nax8fh2ZSyphnyS9
         PiJLpUoDL2mPKz3M5NV1vBARnY7MbXH31zgejBpnkUtIVWMKfiVLHBx8VJ4yaGYzkruh
         WCSpLwLgkSp3KctFeOcv0rrkVYUJtaGAmDoMe2p20QVgdfej1Ib2KXiw99sdtvaS1Wgi
         Ftgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Cx8+TpYzNRgjiV6IWF30R39Lr38y3gIFRuMPt3h82Vs=;
        fh=Avf9rptHIixn1fzpHCZ4quLamNGsoa+TGhSa8cHT//s=;
        b=dBT1jFNK9NpwpljFa1Dxsn0oftY6cgqqhp89m4oxTofycT+qMuHmIHgygvzQyfDPFa
         T4toqDoEnAY9cgQ1WsqmnbS5uYdWSzWh2r7U2pVQaHvqiEpBuDGlLtU0iN+moCVVoEZn
         /ZGITwUiNs1DxE3p0dwC3dpg9m46NiMrJapMO2sgLwWcR986bEjjuTHxglxc0GsykPp9
         nS7g5lL6VA7MPrxUEI7hTAe9m8oCxaUrof9kWgvVqjFoin9ifEysL5YARIuvg1x4KhHJ
         Ky0u6pjQZMmrPsQdCozplTqG24/IjCJopDeFwyOAbLbchqz8yFYs6Az8RuxiEF9cmGtZ
         +oxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhPdpgDX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739d391b0bbsor238365b3a.2.2025.04.02.08.25.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Apr 2025 08:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BhPdpgDX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607510; x=1744212310; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cx8+TpYzNRgjiV6IWF30R39Lr38y3gIFRuMPt3h82Vs=;
        b=BhPdpgDXL8vQjgDIr5pwqAJOEFpGHUKBOBZ5AE0FoQAon3dTZkBLbqg/DQoe2AV159
         NEUmtyaIT/RWSBvcFzbDVVUyfDyD160rfX3V6HnOFnC0apVsxnvT15lWiYxblvlyVKlW
         3HlNzIRtEm/kLFxPBGEtKkEGXI7Fb95vur7cO7Skjymp/2O7YWFXt5L0c5/PPQKGVNjO
         rYnD3K5FvEDS2Ubh7U66CPcmUgKT9wbM4FYpgAh2yyImA0vo2h2V2VOx9p+yT6iIQ/Dq
         VEJsrMFbikMvxK+hVx+qPktYPMovym3rlfWPq1yImPPeS6Hd481tNvvUGe1OfGmEu2rD
         ZX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607510; x=1744212310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cx8+TpYzNRgjiV6IWF30R39Lr38y3gIFRuMPt3h82Vs=;
        b=BPjhDLpgkoTsfv8OxrdSpF3jI8vYyu5I4LjO+NY7ehKORFpG01X86fvrmiBkrTAa+H
         4y+PrqRDADUTRuNkk0C7iAJwXzLVgiGxCHX26D8kqsoVztP/yPTYREO6sQTxTC8N+Sfl
         QQzelHEehM4y416hWZMOaEcRm6f3yRQ+DMbHQlZjm8APr0oijhyBCkt4vV6qhPq2YiF1
         17HtR9QiDBR/Efkn247M81vrppBlAZdOxzEkTmh8lKJhPGFaGDNybDzwUFvhF1dePLS/
         YyIrazEj+7Yg3BHvfvGD6MCjz5yWwcN1ICSzFonHUzAAYKnnbyksMexo5495EfoywArJ
         7CBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfXh7jSAG6gRjETOJtqfxbQEPupDF+MaB/jW3FOjxHuEmglndyZsZws1IaTfYnyLNYW1mTwSgE+OkWvw==@linaro.org
X-Gm-Message-State: AOJu0Yxp0cKCHl5Z1+TXNO81uWXkrxkyp7SM93HtnCysgETt0qVscIUF
	CG//dOD27FA5VC4pZJuVmSOZ5KaZpn2V2nektyC6R/CnBg4T/r4jIuUil04bCCccMw==
X-Gm-Gg: ASbGncv5I7yowkqFnv+KPFpS/rEplAiO6ZbmbLmxO5O4A4M8tXIZZCHyiv/L5VPp7F0
	bYVr/C6tx2niHNm22qBhoqwy1Jd+3pgEO9SYqUvmXUiAsYYgC9tOy1elQcRViBVX20fDE/BQ72Z
	N+2sDgSPLjcKtTPbqvs5Zl/RPtKUQrG+FZmqU+J0wSI/71OkT2SwCIn4rH3l0X3Q49R0PDg5qiU
	h5CbZlYTykAksFckS060Tql2M24M3dDoMhWKA/JXV9fN8gYV0KJId7A09QpWqYhrtjzSaTgkXV/
	ACrozFdfEk0OhsAyWCTSjlGugEwL+fNV++OoM2W3v+JmpMPcX35b8hDB7g==
X-Google-Smtp-Source: AGHT+IHKMqp53wunIMnK9HnaQVXKKO/uyWdrxdLYqEqNY5EMIwtYdBJ37QQg4k9gyF9l6HILW7KIkg==
X-Received: by 2002:a05:6a21:150e:b0:1f5:83da:2f9f with SMTP id adf61e73a8af0-2009f609015mr27159264637.12.1743607510247;
        Wed, 02 Apr 2025 08:25:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b8b1aa6sm10090857a12.52.2025.04.02.08.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:25:09 -0700 (PDT)
Message-ID: <319fd6a2-93c1-42ec-866b-86e4d01b4b39@linaro.org>
Date: Wed, 2 Apr 2025 08:25:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/29] include/exec/cpu-all: move compile time check
 for CPUArchState to cpu-target.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
 <20250325045915.994760-4-pierrick.bouvier@linaro.org>
 <e11f5f2e-0838-4f28-88c1-a7241504d28a@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <e11f5f2e-0838-4f28-88c1-a7241504d28a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: TouGImPNC5UW

T24gNC8xLzI1IDIwOjMxLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gT24g
MjUvMy8yNSAwNTo1OCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+IFJldmlld2VkLWJ5
OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4+
IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZz4NCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9leGVjL2NwdS1hbGwuaCB8IDQgLS0t
LQ0KPj4gICAgY3B1LXRhcmdldC5jICAgICAgICAgICB8IDQgKysrKw0KPj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9jcHUtYWxsLmggYi9pbmNsdWRlL2V4ZWMvY3B1LWFs
bC5oDQo+PiBpbmRleCA3NDAxN2E1Y2U3Yy4uYjEwNjcyNTllNmIgMTAwNjQ0DQo+PiAtLS0g
YS9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oDQo+PiArKysgYi9pbmNsdWRlL2V4ZWMvY3B1LWFs
bC5oDQo+PiBAQCAtMzQsOCArMzQsNCBAQA0KPj4gICAgDQo+PiAgICAjaW5jbHVkZSAiY3B1
LmgiDQo+IA0KPiBUaGlzIGluY2x1ZGUgXl5eXl5eIC4uLg0KPiANCj4+ICAgIA0KPj4gLS8q
IFZhbGlkYXRlIGNvcnJlY3QgcGxhY2VtZW50IG9mIENQVUFyY2hTdGF0ZS4gKi8NCj4+IC1R
RU1VX0JVSUxEX0JVR19PTihvZmZzZXRvZihBcmNoQ1BVLCBwYXJlbnRfb2JqKSAhPSAwKTsN
Cj4+IC1RRU1VX0JVSUxEX0JVR19PTihvZmZzZXRvZihBcmNoQ1BVLCBlbnYpICE9IHNpemVv
ZihDUFVTdGF0ZSkpOw0KPj4gLQ0KPj4gICAgI2VuZGlmIC8qIENQVV9BTExfSCAqLw0KPj4g
ZGlmZiAtLWdpdCBhL2NwdS10YXJnZXQuYyBiL2NwdS10YXJnZXQuYw0KPj4gaW5kZXggNTE5
YjBmODkwMDUuLjU4N2YyNGIzNGU1IDEwMDY0NA0KPj4gLS0tIGEvY3B1LXRhcmdldC5jDQo+
PiArKysgYi9jcHUtdGFyZ2V0LmMNCj4+IEBAIC0yOSw2ICsyOSwxMCBAQA0KPj4gICAgI2lu
Y2x1ZGUgImFjY2VsL2FjY2VsLWNwdS10YXJnZXQuaCINCj4+ICAgICNpbmNsdWRlICJ0cmFj
ZS90cmFjZS1yb290LmgiDQo+IA0KPiAuLi4gaXMgYWxzbyBuZWVkZWQgaGVyZSwgb3RoZXJ3
aXNlIHdlIGdldDoNCj4gDQo+IC4uLy4uL2NwdS10YXJnZXQuYzozMDoxOTogZXJyb3I6IG9m
ZnNldG9mIG9mIGluY29tcGxldGUgdHlwZSAnQXJjaENQVScNCj4gKGFrYSAnc3RydWN0IEFy
Y2hDUFUnKQ0KPiAgICAgIDMwIHwgUUVNVV9CVUlMRF9CVUdfT04ob2Zmc2V0b2YoQXJjaENQ
VSwgcGFyZW50X29iaikgIT0gMCk7DQo+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICBe
DQo+IA0KPj4gICAgDQo+ICAgPiArLyogVmFsaWRhdGUgY29ycmVjdCBwbGFjZW1lbnQgb2Yg
Q1BVQXJjaFN0YXRlLiAqLz4NCj4gK1FFTVVfQlVJTERfQlVHX09OKG9mZnNldG9mKEFyY2hD
UFUsIHBhcmVudF9vYmopICE9IDApOw0KPj4gK1FFTVVfQlVJTERfQlVHX09OKG9mZnNldG9m
KEFyY2hDUFUsIGVudikgIT0gc2l6ZW9mKENQVVN0YXRlKSk7DQo+PiArDQo+PiAgICBjaGFy
ICpjcHVfbW9kZWxfZnJvbV90eXBlKGNvbnN0IGNoYXIgKnR5cGVuYW1lKQ0KPj4gICAgew0K
Pj4gICAgICAgIGNvbnN0IGNoYXIgKnN1ZmZpeCA9ICItIiBDUFVfUkVTT0xWSU5HX1RZUEU7
DQo+IA0KPiBXaXRoICJjcHUuaCIgaW5jbHVkZToNCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gVGVzdGVkLWJ5OiBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IA0KDQpJIGNhbid0
IHJlcHJvZHVjZSB0aGlzIGVycm9yLg0KV2l0aCB0aGlzIHNlcmllcywgY3B1LmggaXMgcHVs
bGVkIHRyYW5zaXRpdmVseSBmcm9tIA0KImFjY2VsL2FjY2VsLWNwdS10YXJnZXQuaCIuIElk
ZWFsbHksIGl0IHdvdWxkIGJlIGJldHRlciB0byBhZGQgaXQgDQpleHBsaWNpdGVseSB5ZXMu
DQoNCkBSaWNoYXJkLCBjb3VsZCB5b3UgcGxlYXNlIGFtZW5kIHRoaXMgY29tbWl0IG9uIHRj
Zy1uZXh0IGFuZCBhZGQgYSANCmRpcmVjdCBpbmNsdWRlIHRvIGNwdS5oPw0KDQpUaGFua3Ms
DQpQaWVycmljaw0K
