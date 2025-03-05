Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp937187njm;
        Wed, 5 Mar 2025 08:53:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWz8coDRyWwna8teAnYVK/nm5DbP62IImEBNliSvmZNKPrJKf765cVO3yW5eJWY5QZUys4qwap0IiCCDg==@linaro.org
X-Received: by 2002:a05:6a20:918b:b0:1f3:40d3:67d4 with SMTP id adf61e73a8af0-1f349574fb6mr8389088637.30.1741193612579;
        Wed, 05 Mar 2025 08:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741193612; cv=none;
        d=google.com; s=arc-20240605;
        b=ApjOyhaSaFmoXz40Tql6FXT0xEcwUsnjPFsy+06TlwWGGQp35/mHQea/Z9sSqC1gmb
         R0Ijx7N2BkUwKoHl/y4kbJ8Jl7oohE0ymRs5x14u+te3s4R8QyOWcelEEjK1ZGF2Ztvk
         QdmvxjKUiDSQCbFALa2eAIVwYKSwK7qHpVzhlMB7nIwBSo5zr8FxUWGWCvtie8agZk5N
         +j3j9oGtG8RONhzx9Mpwgi5OpyAge5BzCBy+7NOkUTYwvhu99GGlbd5wy6tVBeEmWGc/
         mBtpTnzmfqieY92AbYm9ZUXpa+FgmBYLiOtBniVp16e5CwknUFp/DyWHSuBKLn1qDdqg
         Wlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RohP8o8uPCnosArPUo8AI33ojn5YxVBIamd26sWXm7o=;
        fh=jmBScorX2fwa8OfMM0m4g8Y4GFplon+OUqjbUUffaGI=;
        b=S/RxjKSblckKKRNykX87rU65eAT62qLKkWkFsNeboPAtW6CltGqO9D/PL1q2I4sawi
         oMegObMhojYUmGz5IS1LZxbeITZUgF8w4+2HM0zc4StmeEswAk3G/ZI3d+qbWFxS3uVn
         /5CPRdW+2CumXEKiBw9S3kvzeFzFOLD3Y3MuHeoUeTWn//LJwmy9/u4NAcNy54wjI39f
         DFosLLNXogYge1F8pRLmkc+EFwbLjSg1yYGDG5DgYi+JtioARurUaucpciv/LIiHe3C6
         YjD9QDPM5mdFnp9MBQdMOPMzPnw7Dnr99ZBlHoEGuUh3AEamCC1tEXhWQlM6/vvtAJ1K
         /yGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ifNRGIo1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-aee7dea5b90sor11621450a12.5.2025.03.05.08.53.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ifNRGIo1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741193612; x=1741798412; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RohP8o8uPCnosArPUo8AI33ojn5YxVBIamd26sWXm7o=;
        b=ifNRGIo1jrQ1LjGJ76XdBedu9FggyA2SVlCNydr4W+C7/3Sl7IUc4t84WEYy7QnK5e
         TdzH1WDhz7D+d+cUxdFsEV/5x5PsNuDPLA5hJBcNZ2J1YuqMTydoPotahja6RMqix+eY
         hXuuXBffHcL5l8iUWIH8ueLX1uwM/qwBcvYjazY+/JrrK6DMlkNX7JlBjbnGcY/AsBpe
         njf91RH8+pE9hlQJNB/teLhEM3kJ77GK9J2/jiP+arkcToqLua8rI8yp31K9xN6iyjy+
         U6Zv0UYviG7LDEY46GTCduPxYZ3aKYWiLkeb2AUpNBHcFcmN0RJQhfnsOFK8UTMjZeYE
         MwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193612; x=1741798412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RohP8o8uPCnosArPUo8AI33ojn5YxVBIamd26sWXm7o=;
        b=WWGe/fAEuhplxdlfTypoFY3tr/cvXn3XbiFjqeDCjlB4cvQGUxxLRc6yONr5IQLd2o
         2dd79oTPWKR37Q7B50eK2nCbOxS4R14G+X3Z6EMXvH6L0K7dj62PKJcX4HyGDaZtXV5w
         e5otbhHTRF3Nd8nBzo+RgIOro8kBlsAD2hZhlAj5Qie/+dYpPzfcBicJYK6Rb/wOJYpR
         4KYr0wN2ZFgksJ0IFVq7CcQf8jqywKyl1YU6ftvlbivWiMvhHIhEsgqiv/+CBQJPCdPP
         aWoCDv0nwTEmJFds3UeI/aYwdyDbtO3cXJ0dCe+sKPtT3ugBHLdjGkhneHADAVE6nsXK
         fwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW88pTVBX6ibJnyNyn4g3ZXRILSpGeHe9OWLAmIDxrEVmmTDqXg+ZysR3lHGx8mbRqa/ZHoUwNmLSixZw==@linaro.org
X-Gm-Message-State: AOJu0YwdsnKkQRTnjVDl4cItMI9mLV3waDSuD0c7MrAXfb/0tdmAJLEl
	TVUmlMoKV3lPZQhr3q0MjBTfaHJc3rqctB8/hwN+p1aXzgy01Lm36EQ6p1SwPs7Mug==
X-Gm-Gg: ASbGnctwcuXciJ4PD3b5SCTmQ/GIxT47fQVo9Sxv1jjaSWTubFmPv6yY014NdHiahAc
	9yB6tpEsJlsafrV/JyXduAwAanoRxRi4lvBn5pQZoURpWojL0X1al8JCGpioT1OHqWOtn81vEdO
	SsGuKVoJ2iI8ye9McMXLwx1+rzljwn4Fr5+AHtxj1B7q1+GDLjCllGPUVidvJJCAPiYuIsuaIHn
	5B7+x6Loae/JqVUqFLbrkyrKeAxGF3/6eE8Hj7+NFvid/akz3c+RZDKawJrsZTCFXHoNvfTLkeB
	qH0cQANMP2I9QqCodE/G918VWWy0h5F1rzvM+fciJr093uCULzeNSOJ6/A==
X-Google-Smtp-Source: AGHT+IGwuwXpbQoV32VUYAgJCRkhV4DwLSdrQU1r29u0W8aZnpCb1dm/xM+kCHA5sIGq7B7mVTwsqg==
X-Received: by 2002:a05:6a21:700c:b0:1f3:4261:852c with SMTP id adf61e73a8af0-1f3495750a2mr7273106637.28.1741193612148;
        Wed, 05 Mar 2025 08:53:32 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73661f73895sm5706209b3a.143.2025.03.05.08.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:53:31 -0800 (PST)
Message-ID: <942e2191-0952-4838-bbc5-913528d91f16@linaro.org>
Date: Wed, 5 Mar 2025 08:53:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] hw/arm: Register target-specific QOM types at
 runtime
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250305161248.54901-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: F9Kxrizv1K2l

T24gMy81LzI1IDA4OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gSW4g
cHJlcGFyYXRpb24gb2YgaGF2aW5nIGEgc2luZ2xlIGJpbmFyeSBmb3IgYm90aCBBUk0gYW5k
DQo+IEFhcmNoNjQgdGFyZ2V0cywgdW5pZnkgcmFzcGkgJiBhc3BlZWQgYnkgcmVwbGFjaW5n
IHRoZQ0KPiBjb21waWxlLXRpbWUgVEFSR0VUX0FBUkNINjQgY2hlY2sgYnkgYSBRT00gcnVu
dGltZSBjYWxsDQo+IG9uIGxlZ2FjeV9iaW5hcnlfaXNfNjRiaXQoKS4NCj4gDQo+IE5vIGJl
aGF2aW9yIGNoYW5nZSB3aXRoIGN1cnJlbnQgYmluYXJpZXM6DQo+IA0KPiAgICAkIC4vcWVt
dS1zeXN0ZW0tYXJtIC1NIGhlbHAgfCBmZ3JlcCByYXNwaQ0KPiAgICByYXNwaTAgICAgICAg
ICAgICAgICBSYXNwYmVycnkgUGkgWmVybyAocmV2aXNpb24gMS4yKQ0KPiAgICByYXNwaTFh
cCAgICAgICAgICAgICBSYXNwYmVycnkgUGkgQSsgKHJldmlzaW9uIDEuMSkNCj4gICAgcmFz
cGkyYiAgICAgICAgICAgICAgUmFzcGJlcnJ5IFBpIDJCIChyZXZpc2lvbiAxLjEpDQo+IA0K
PiAgICAkIC4vcWVtdS1zeXN0ZW0tYWFyY2g2NCAtTSBoZWxwIHwgZmdyZXAgcmFzcGkNCj4g
ICAgcmFzcGkwICAgICAgICAgICAgICAgUmFzcGJlcnJ5IFBpIFplcm8gKHJldmlzaW9uIDEu
MikNCj4gICAgcmFzcGkxYXAgICAgICAgICAgICAgUmFzcGJlcnJ5IFBpIEErIChyZXZpc2lv
biAxLjEpDQo+ICAgIHJhc3BpMmIgICAgICAgICAgICAgIFJhc3BiZXJyeSBQaSAyQiAocmV2
aXNpb24gMS4xKQ0KPiAgICByYXNwaTNhcCAgICAgICAgICAgICBSYXNwYmVycnkgUGkgM0Er
IChyZXZpc2lvbiAxLjApDQo+ICAgIHJhc3BpM2IgICAgICAgICAgICAgIFJhc3BiZXJyeSBQ
aSAzQiAocmV2aXNpb24gMS4yKQ0KPiAgICByYXNwaTRiICAgICAgICAgICAgICBSYXNwYmVy
cnkgUGkgNEIgKHJldmlzaW9uIDEuNSkNCj4gDQoNClRvIHNlZSBhbiBlZmZlY3Qgb24gdGhv
c2UgY2hhbmdlcywgd2Ugc2hvdWxkIGlkZWFsbHkgbWFrZSBzdXJlIHRob3NlIA0KZmlsZXMg
Y2FuIGNvbXBpbGUgd2hpbGUgYmVpbmcgY29tbW9uIChpbiBtZXNvbi5idWlsZCBzeXN0ZW1f
c3MpLCBzbyB3ZSANCmFyZSBzdXJlIHRoZXkgZG9uJ3QgZGVwZW5kIG9uIHRhcmdldCBkZWZp
bmUgYW55bW9yZS4NCg0KPiBCYXNlZC1vbjogPDIwMjUwMzA1MTUzOTI5LjQzNjg3LTEtcGhp
bG1kQGxpbmFyby5vcmc+DQo+IA0KPiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoNCk6DQo+
ICAgIHFvbTogSW50cm9kdWNlIFR5cGVJbmZvOjpyZWdpc3RlcmFibGUoKSBjYWxsYmFjaw0K
PiAgICBody9hcm0vcmFzcGk6IFJlcGxhY2UgVEFSR0VUX0FBUkNINjQgYnkgbGVnYWN5X2Jp
bmFyeV9pc182NGJpdCgpDQo+ICAgIGh3L2FybS9hc3BlZWQ6IFJlcGxhY2UgVEFSR0VUX0FB
UkNINjQgYnkgbGVnYWN5X2JpbmFyeV9pc182NGJpdCgpDQo+ICAgIGh3L3BwYzogUmVtb3Zl
IFRBUkdFVF9QUEM2NCB1c2UgaW4gcHBjX2NyZWF0ZV9wYWdlX3NpemVzX3Byb3AoKQ0KPiAN
Cj4gICBpbmNsdWRlL3FvbS9vYmplY3QuaCB8IDEgKw0KPiAgIGh3L2FybS9hc3BlZWQuYyAg
ICAgIHwgOCArKy0tLS0tLQ0KPiAgIGh3L2FybS9iY20yODM2LmMgICAgIHwgNiArKy0tLS0N
Cj4gICBody9hcm0vcmFzcGkuYyAgICAgICB8IDcgKysrLS0tLQ0KPiAgIGh3L3BwYy9mZHQu
YyAgICAgICAgIHwgNSArKystLQ0KPiAgIHFvbS9vYmplY3QuYyAgICAgICAgIHwgNCArKysr
DQo+ICAgcW9tL3RyYWNlLWV2ZW50cyAgICAgfCAxICsNCj4gICA3IGZpbGVzIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCg0K
