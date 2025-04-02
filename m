Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3511393njd;
        Wed, 2 Apr 2025 08:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+h8jnEZcEEI6T6xKvd5Exk89V1PhGhZ9uHpSxGbr2FvOfnJc8n0INsSoVlDIJQ+XZZc1T5a2lx8iOpg==@linaro.org
X-Received: by 2002:a05:6a00:3a13:b0:736:491b:536d with SMTP id d2e1a72fcca58-7398046fe65mr27163375b3a.20.1743606392866;
        Wed, 02 Apr 2025 08:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743606392; cv=none;
        d=google.com; s=arc-20240605;
        b=TeystVa48S4lc5OfTrr8iCEIGcoXIT0oBBUCt0K1VA373ofWK47VNnDDpe0lj4yctP
         zWMjCUdDw90OwcyPX0gUN0N4wK54syJPsvNTraCbyAw243upaFP2lpi/zfoUTyH0m8Cx
         +k+gq6NKBi1xUaEWfwpW6ZIvbnhJyLbgwX6PBYIuMlhN6Oik/brjD5G8RjpaA8HxwKQG
         c33orz9fCI+eLFT8jpNeNCvHcdtGSVk7kELcHHaQyZ/on9WacJdiLUTHKrrPIaj6Cq7j
         hcTTttWfGmVr8rlGdaJ9tdyoJBzwVeO/BbYHh0PA7IipnM4M3LmvIEl5mxRD87PoCTYj
         iWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+suyxI6UtimLYmX9HGZ6Yx3RjITGhRsYKZALhU8U+ig=;
        fh=usp9yZR0NUaQd9jvVAq1SCyFBMWdetTxRDxW4hANp00=;
        b=NdvzCEM8yg33lSi3O3h9lMzKbKfINGeIj93ZXSErnnyniaQBlpoTtiSL6ResWK/dO1
         kdjiirnLGbq81/k6lEiT3Pif8oDayS5g7YqENzVtJQotGuC2Iw1HQOcc3Q2RuAY5jkdC
         Q1Y1ixRgyfIjSI479ShEeILxQj0QHF0YAD0J1xUCJs0I96qpxc+8clvXcu5ZAN4siBBK
         oKm1QV5EQoBmBe84Nz/OUPaOi5ziiDqa6XYaniQ671tswSZHYxfPguxkJ+VB1XFL5nSf
         EOUnCXBbKIkMj1dz5Ik5xo1huYLyrmODB3zndti2DgEH+AH1cdY/6H/8ytq2d37ZmVm3
         bVcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WnWh9LkB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739d3a0b831sor215059b3a.6.2025.04.02.08.06.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Apr 2025 08:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WnWh9LkB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606392; x=1744211192; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+suyxI6UtimLYmX9HGZ6Yx3RjITGhRsYKZALhU8U+ig=;
        b=WnWh9LkBC4/7BNF3laLq9Q9EhkxLdsTS3S7rTfSOJk71B+PjsDvu3eqtyhKsJm6ZsC
         G/r9ThPAp/xZOAinVQI+JNVbLLs2W5+oCBtB5qwas4FMJ9s4LR7N3TZ2nwb4g/tn/hAX
         7ld11poj/gn33erni/KSKcYtmqYDZYk3FLu2KblJNoFmaJ3VyxsRMHw1fHkSlsyHFTuS
         zSXFbuGjKFP+1G8EAc8YL4IaX5DDmUC4ur5ClBjVmAF7K1R8gLhwVnWOMK0bt5sEcfNc
         AC0CJhq3l0lU9Gz6kqgfIopSCLNqk+4x+W1I5OxbYCNSMg3oj5zM/Ukd3AQoYa3pz4Il
         /p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606392; x=1744211192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+suyxI6UtimLYmX9HGZ6Yx3RjITGhRsYKZALhU8U+ig=;
        b=dbfmhvKljYlJBd+E8R1yhnBhGnWO9UORCBWAPpMd6fXoeMe2wieronNUQAwiZagh/U
         piXZPoYDsxGuLjoJYn8N9x8yx39utgQHQ2rbemPGc1xNJmgWNd7/6gAfIiWdjpRKhgcy
         MohVGoIhBAyvvSs/YXr6rkxR4nYgYwL8pvaxiC5SxzZ9jvC+V9SORutc9Wi2iRsLapeE
         wa6r1OfqV5TDAakJHtKNQFfjxPn5jsOgw+uvFmnRrEdIaxXrGeFk548BIpGY2rKSjRcE
         9yuoxqUIHB+Vmqux6coIr5oAQkzHcjembGg8YnmHDe8CNG8SQAVPgIVHGSNsCqcv+JBj
         LWLg==
X-Forwarded-Encrypted: i=1; AJvYcCUIWRhVHE4ue3Wn92j0nyU0pfE3IO7qj2roQNSREssxFpQI/5ZN2TAAkOPVCUiyvbKtzobq3r68ZQJ/+w==@linaro.org
X-Gm-Message-State: AOJu0YwlUjG4w2qWOdXtMk5LS0Ac1byXl80JAEcIqotrbp/PY4pmUtZk
	deu5nOWsOvBz5nUA2LfokoQ34N/sBmRo2u6F6F3PRPAqzyKqkkuCGK1TPPV3sRKOfw==
X-Gm-Gg: ASbGncutb9A/DiwjCrS7fu0wG/vbN8qCVX9BqKbomCyOzQCtxCgDKY20TzyiyBwswlo
	zUYU8eq1RDSpO2KdYx+ykr2isUzQcBxz7pDkVQbhrOnagylKFitl1/KJIt9OVlBwTPJw5IWUe2A
	qF1xcvl8IxdVlthbwmR3D6lxzCB8s3oVdbuJqPsxgqGWFsOU5L4T02aor90irxVB31VQ5gLxH9a
	HfnmltTDy5r+YnRYzh6aQ3bqUiwhulWkBQ8IfrHw1Kt3iY9owgzG3HfDV5HhgqhA1lqXWiYYiEu
	i+oKClgWYC9U7Q9EANnpB+NWvCjjThTeG97WkF7cCNwdOWg9n//O/8Gjfg==
X-Google-Smtp-Source: AGHT+IE2WfizvIScfv6TpCwQcsyk99JyjHPhECR5f2dEFmILSKSO5YDax5Dfjn0t/XU0VwHf2cA1JQ==
X-Received: by 2002:a05:6a20:3952:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-2009f79c626mr28021630637.42.1743606392389;
        Wed, 02 Apr 2025 08:06:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b8b48e3sm10001437a12.58.2025.04.02.08.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:06:31 -0700 (PDT)
Message-ID: <10759233-e73b-49e2-870b-c7687c9cfd1e@linaro.org>
Date: Wed, 2 Apr 2025 08:06:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/30] target/arm/cpu: always define kvm related
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
 <1109fe22-9008-47c6-b14d-7323f9888822@linaro.org>
 <11b5441f-c7c0-4b4c-8061-471a49e8465a@linaro.org>
 <428e6fdb-24b9-47a2-9d3f-4ef5c2e1a0ae@linaro.org>
 <ca52ecb4-6c1d-4299-9764-5839db2d013e@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ca52ecb4-6c1d-4299-9764-5839db2d013e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: +rg9WQpez2x3

T24gNC8yLzI1IDA2OjM2LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gT24g
MjUvMy8yNSAwMjoyNCwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+PiBPbiAzLzI0LzI1
IDE0OjExLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+IE9uIDMvMjMvMjUgMTI6Mzcs
IFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPj4+PiBPbiAzLzIwLzI1IDE1OjI5LCBQaWVy
cmljayBCb3V2aWVyIHdyb3RlOg0KPj4+Pj4gVGhpcyBkb2VzIG5vdCBodXJ0LCBldmVuIGlm
IHRoZXkgYXJlIG5vdCB1c2VkLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJy
aWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+Pj4+IC0tLQ0K
Pj4+Pj4gIMKgwqAgdGFyZ2V0L2FybS9jcHUuaCB8IDIgLS0NCj4+Pj4+ICDCoMKgIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS90
YXJnZXQvYXJtL2NwdS5oIGIvdGFyZ2V0L2FybS9jcHUuaA0KPj4+Pj4gaW5kZXggYThhMWE4
ZmFmNmIuLmFiNzQxMjc3MmJjIDEwMDY0NA0KPj4+Pj4gLS0tIGEvdGFyZ2V0L2FybS9jcHUu
aA0KPj4+Pj4gKysrIGIvdGFyZ2V0L2FybS9jcHUuaA0KPj4+Pj4gQEAgLTk3MSw3ICs5NzEs
NiBAQCBzdHJ1Y3QgQXJjaENQVSB7DQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4+
ICDCoMKgwqDCoMKgwqAgdWludDMyX3Qga3ZtX3RhcmdldDsNCj4+Pj4+IC0jaWZkZWYgQ09O
RklHX0tWTQ0KPj4+Pj4gIMKgwqDCoMKgwqDCoCAvKiBLVk0gaW5pdCBmZWF0dXJlcyBmb3Ig
dGhpcyBDUFUgKi8NCj4+Pj4+ICDCoMKgwqDCoMKgwqAgdWludDMyX3Qga3ZtX2luaXRfZmVh
dHVyZXNbN107DQo+Pj4+PiBAQCAtOTg0LDcgKzk4Myw2IEBAIHN0cnVjdCBBcmNoQ1BVIHsN
Cj4+Pj4+ICDCoMKgwqDCoMKgwqAgLyogS1ZNIHN0ZWFsIHRpbWUgKi8NCj4+Pj4+ICDCoMKg
wqDCoMKgwqAgT25PZmZBdXRvIGt2bV9zdGVhbF90aW1lOw0KPj4+Pj4gLSNlbmRpZiAvKiBD
T05GSUdfS1ZNICovDQo+Pj4+PiAgwqDCoMKgwqDCoMKgIC8qIFVuaXByb2Nlc3NvciBzeXN0
ZW0gd2l0aCBNUCBleHRlbnNpb25zICovDQo+Pj4+PiAgwqDCoMKgwqDCoMKgIGJvb2wgbXBf
aXNfdXA7DQo+Pj4+DQo+Pj4+IEknbSBub3Qgc3VyZSB3aGF0IHRoaXMgYWNoaWV2ZXM/wqDC
oCBDT05GSUdfS1ZNIGlzIGEgY29uZmlndXJlLXRpbWUNCj4+Pj4gc2VsZWN0aW9uLg0KPj4+
Pg0KPj4+DQo+Pj4gQ09ORklHX0tWTSBpcyBhIHBvaXNvbmVkIGlkZW50aWZpZXIuDQo+Pj4g
SXQncyBpbmNsdWRlZCB2aWEgY29uZmlnLXRhcmdldC5oLCBhbmQgbm90IGNvbmZpZy1ob3N0
LmguDQo+Pg0KPj4gV2hvb3BzLCB5ZXMuDQo+IA0KPiBJZiB3ZSBnbyB0aGlzIHdheSwgY2Fu
IHdlIGNvbnNpc3RlbnRseSBhbGxvdyBDT05GSUdfJHtIV19BQ0NFTH0NCj4gKHJlYWQgInJl
bW92ZSBwb2lzb25lZCBkZWZzIGluIGNvbmZpZy1wb2lzb24uaCk/DQoNCkl0IHdvdWxkIGJl
IHNhZmUgdG8gZG8gdGhpcyBmb3IgQ09ORklHX1RDRywgd2hpY2ggaXMgYXBwbGllZCB0byBh
bGwgDQpjb21waWxhdGlvbiB1bml0cyAodGhyb3VnaCBjb25maWdfaG9zdCkuIEFuZCB3ZSds
bCBkbyBpdCB3aGVuIHdlIG1lZXQgYSANCmNhc2UgdGhhdCByZWFsbHkgbmVlZHMgaXQsIG5v
dCBiZWZvcmUuIEFzIGxvbmcgYXMgdGhlIGNvZGUgY2FuIGJlIA0KY2xlYW5lZCB1cCBmcm9t
IHRob3NlIGlmZGVmcywgaXQncyBiZXR0ZXIuDQoNCkhvd2V2ZXIsIGl0J3Mgbm90IHNhZmUg
Zm9yIGFsbCBvdGhlciBDT05GSUdfJHtIV19BQ0NFTH0sIHdoaWNoIGFyZSANCmFwcGxpZWQg
c2VsZWN0aXZlbHkgb24gc29tZSB0YXJnZXRzIChiYXNpY2FsbHksIGZvciB0aGUgcGFpciB7
aG9zdCA9PSANCnRhcmdldH0sIHdoZW4gaG9zdCBzdXBwb3J0cyB0aGlzIGFjY2VsZXJhdGlv
bikuDQpGb3IgdGhlbSwgdGhlIHJpZ2h0IGZpeCBpcyB0byBtYWtlIHN1cmUgd2UgY2FsbCAi
e2FjY2VsfV9lbmFibGVkKCkiLCANCmV4cG9zZSB0aGUgYXNzb2NpYXRlZCBjb2RlLCBhbmQg
ZXZlbnR1YWxseSBkZWFsIHdpdGggbWlzc2luZyBzeW1ib2xzIGF0IA0KbGluay4NCg==
