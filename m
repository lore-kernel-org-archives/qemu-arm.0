Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2181604njc;
        Mon, 24 Mar 2025 12:33:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:4650:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-73905a2d446mr24236337b3a.21.1742844796414;
        Mon, 24 Mar 2025 12:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844796; cv=none;
        d=google.com; s=arc-20240605;
        b=AN8WAXPewFWs5tr1XWzUkiUTXNR66hgq17+loo84K3ajvFS6lqITy6qAGP1Eb0f3Nw
         K8cPj1IPR/5PVZI8mqvh7/qlOsmI+GSaBxx4VgwZkcXv01ENvD01IsT25mjPiHcQ0oy5
         Ty4Pq5/Y/TYww6UUsUupjYYf3jSySQJ7E9HaRLxBAPAxVd54lwpCZcxSgIZA+qgzZTNo
         n7M28jJ1CeW09NiZJtvvP0Jv7U6UpJYFMsK4Mtw0WR3oMD2xS2Z98eNCRMsQfhfQDogZ
         U3FOajM48ME8RPKqB9ZY4nQdwYgRdH9FZFO0EYPiz7ltfscXUtrsEmK1r8Zf2EF5dS6O
         AVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FADuRUtGLKd5sUeVMt2YSVy5VQl69kAnhXYEbSw0eyg=;
        fh=tSeUy6+dgkVxRMHQMoSkjPyjU/Dt4mSriyqhVbuUcLY=;
        b=GeHZ2HWZOabZq0nOGRsTzs3yoQzEDx2uVWe0rx+pUqEI+pAG/AB4uljA4qoPWDZ3CY
         ebFxCM8X6SPG87kP8FJHW6io5t7jWnzeSWlrZLb01qB6UKTIxr8WdgvgHAyXY/UZLl6/
         +9pvUXTYjd8oJUH68ZAqmCB7oiAh2eObaFRzpctHRKvDRnxpPzutHhdCFO7l1FLBMF/r
         trrR/wJZjHRZoIVHTTMaXD/i2xxDwU9A7yABpkgSObdLD9xHauG8Ua7hg/TWwU6m4fia
         HMmDeMJK8zYjOr3JfrukyZB7mvOjAHem7MLqLE5QTWRfuDTe9ocWvUCdE1Z1xdR82NuV
         cKSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CBcHhWuS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73906006225sor4298940b3a.5.2025.03.24.12.33.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:33:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CBcHhWuS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844796; x=1743449596; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FADuRUtGLKd5sUeVMt2YSVy5VQl69kAnhXYEbSw0eyg=;
        b=CBcHhWuSDh0RSySZFZO/wE/ngn6QaZviwJRI7Rruank2VZBotH9zWxQYZIgM2hO+F6
         Fql12s20FZevgCHUT0QYh2Zfjr/GlqX+KRuPbiyO7agXEYsDb23XYPnaQFKdxH7jFNBf
         b5AyEvpuI2fHA764fc2G+zKvcEvbWEvFxxSx6QeVicNa5CVt4z4JZvh/+JyUvijRd2IJ
         DbI8BR5ekC8Gejoxk84b1yO5Czoj0lT4xTgQShbJJ4qrTqwAM6IyYjhToOd5qOxJMBEt
         TaMmOzfr8kanFM9HL6UZzBsehjzwku7t2sQnLwGJPu7qSAdd4LjUM3kVTdpPn0h6oc9f
         jygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844796; x=1743449596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FADuRUtGLKd5sUeVMt2YSVy5VQl69kAnhXYEbSw0eyg=;
        b=T9nq8dVGjn0y/+jWOW6vJmxhqKgDHk6KWvvGXdLlt5N7aicjFtqfTLxMUz7fe7inri
         Yw45dvWEcgUVVTTdh/maX5B5fHimelKikRrikMqsOKuUGQZGBefHL8DaR51tRanldiGW
         1nsa09gtan3tColj9L3IgBboOnHzxiHK+LgWe3XM7r2oSh0MWCgQouN+W2c5NhOXmtgd
         Q9JBhZQTl3UQLfZuMrnp7J4U7tj3rpPKnc4GSIRaNYVYNkQj0kennBi4M373TJsUELuk
         npoB3RM3zjtViu/+6zJS11ycm/yEdsbTNEDopvYaN836atPufbksxP8+1iwA/zsNmIpb
         l/1Q==
X-Gm-Message-State: AOJu0Yz8kgomWjsO9IYJxtO7eD10EB4TNRGXDpS67g2KsI7sCuq83IDZ
	h80F0OIo8aMwktSGAxk2nlYLRtlykiJc0bX75FbJ+B94SnxOiGx/d9CCFwC4CZlOtWMtTpQDyuT
	sO/t6IA==
X-Gm-Gg: ASbGncvZrNdVYQdlrAEzi/aTav/YcDq4zTJ0/4vngmm6pVqWvHsJJL30iJyscSa/KcI
	LiNiv/Y/sXLj0k5CIDCiZrHTZsWwjx87X0AoEZdNur4lUTOvtgg5RF8P/E1a/8igZgh1DRtcPDj
	KKp0BJsy1jGIe4/Qqwb7ncCkkdDZ5J2i+c+Gi0xZGWK/PgaMt54mcRNbA4IlgjiUj/Zr7PFyXMw
	w+deeIY7KcxPrkLbJgsOySayrwWTYDyuWVvR1YSfj8ZxWKUvs+8u9CFZUgpeLZwqBqKjkseKNsg
	S7JvMTR43cYtE8ZGCKHAk0fVgvMiQmNY+5U89M8NuXEAn5t4Tk+uhr4lew==
X-Google-Smtp-Source: AGHT+IFrQqfrRy0m/4XhYyJrZ4t7qxawSZ5CHlj/YgGqbOvgJ8kpNdq47eQCqSPaPj5jGnBRayOOEw==
X-Received: by 2002:a05:6a20:918a:b0:1f5:59e5:8adb with SMTP id adf61e73a8af0-1fe42c6cd8amr26029813637.0.1742844795781;
        Mon, 24 Mar 2025 12:33:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a479c1sm7589585a12.70.2025.03.24.12.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:33:15 -0700 (PDT)
Message-ID: <afc4476e-c94a-49e3-9e8c-ca7001666bf3@linaro.org>
Date: Mon, 24 Mar 2025 12:33:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] include/gdbstub: add note to helpers.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-12-alex.bennee@linaro.org>
 <729ee2cc-ecaf-41d0-afbd-25f51952dbeb@linaro.org>
 <87v7ry2v84.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87v7ry2v84.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: p8CBfEsfYZPk

T24gMy8yNC8yNSAxMDoyOSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiAyNC8z
LzI1IDExOjIxLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4gV2UndmUgbm90IHlldCBkZXBy
ZWNhdGVkIGJ1dCB3ZSBzaG91bGQgc3RlZXIgdXNlcnMgYXdheSBmcm9tIHRoZXNlDQo+Pj4g
aGVscGVycyBpZiB0aGV5IHdhbnQgdG8gYmUgaW4gYSBzaW5nbGUvaGV0ZXJvZ2VuZW91cyBi
aW5hcnkuDQo+Pg0KPj4gV2h5IG5vdCBkZXByZWNhdGU/DQo+IA0KPiBJIGd1ZXNzIHBoaWxv
c29waGljYWxseSBkbyB3ZSBleHBlY3QgdG8gZXZlbnR1YWxseSBjb252ZXJ0IGFsbCBmcm9u
dGVuZHMNCj4gdG8gdGhlIG5ldyBBUEkgb3Igb25seSB0aG9zZSB0aGF0IHdhbnQgdG8gYmUg
aW4gdGhlIHNpbmdsZSBiaW5hcnk/DQo+IFNob3VsZCBJIGp1c3QgYmUgbW9yZSBleHBsaWNp
dDoNCj4gDQo+Pj4gICAgICoNCj4+PiAgICAgKiBUaGVzZSBhcmUgYWxsIHVzZWQgYnkgdGhl
IHZhcmlvdXMgZnJvbnRlbmRzIGFuZCBoYXZlIHRvIGJlIGhvc3QNCj4+PiAtICogYXdhcmUg
dG8gZW5zdXJlIHRoaW5ncyBhcmUgc3RvcmUgaW4gdGFyZ2V0IG9yZGVyLg0KPj4+ICsgKiBh
d2FyZSB0byBlbnN1cmUgdGhpbmdzIGFyZSBzdG9yZSBpbiB0YXJnZXQgb3JkZXIuIENvbnNp
ZGVyIHVzaW5nDQo+Pj4gKyAqIHRoZSBlbmRpYW4gbmV1dHJhbCByZWdpc3RlcnMuaCBpZiB5
b3Ugd2FudCB0aGUgYXJjaGl0ZWN0dXJlIHRvIGJlDQo+Pj4gKyAqIGluY2x1ZGVkIGluIGFu
IGV2ZW50dWFsIHNpbmdsZSBRRU1VIGJpbmFyeS4NCj4+PiAgICAgKg0KPj4+ICAgICAqIENv
cHlyaWdodCAoYykgMjAyMiBMaW5hcm8gTHRkDQo+Pj4gICAgICoNCj4gDQo+IA0KPiAgIFRo
ZXNlIGFyZSBhbGwgdXNlZCBieSB0aGUgdmFyaW91cyBmcm9udGVuZHMgYW5kIGhhdmUgdG8g
YmUgaG9zdCBhd2FyZQ0KPiAgIHRvIGVuc3VyZSB0aGluZ3MgYXJlIHN0b3JlIGluIHRhcmdl
dCBvcmRlci4NCj4gDQoNCklmIHRoZSBmaXggaXMgYW4gZWFzeSAic2VkIGxpa2UiIHdpdGgg
c3RhdGljIHR5cGluZyBndWFyYW50ZWUgKHNvIG5vIGJ1ZyANCmNhbiBiZSBpbnRyb2R1Y2Vk
KSwgd2UgY2FuIHByb2JhYmx5IGp1c3QgZG8gaXQgb24gYWxsIGV4aXN0aW5nIHRhcmdldHMs
IA0KYW5kIHJlbW92ZSB0aGlzLg0KDQpJZiBpdCdzIGhhcmQgb3IgZXJyb3IgcHJvbmUsIHRo
ZW4gSSB3b3VsZCBzYXkgaXQncyBvayB0byB1c2UgYSAib25lIA0KdGFyZ2V0IGF0IGEgdGlt
ZSIgYXBwcm9hY2guDQoNCj4gICBOZXcgZnJvbnQtZW5kcyBzaG91bGQgbm90IGJlIHVzaW5n
IHRoZXNlIEFQSXMgYXQgYWxsLiBUaGV5IHNob3VsZCBiZQ0KPiAgIHVzaW5nIHRoZSBlbmRp
YW4gbmV1dHJhbCByZWdpc3RlcnMuaCBhcyBzaG91bGQgYW55IGFyY2hpdGVjdHVyZSB0aGF0
DQo+ICAgaW50ZW5kcyB0byBiZSBpbmNsdWRlZCBpbiBhbiBldmVudHVhbCBzaW5nbGUgUUVN
VSBiaW5hcnkuDQo+IA0KDQo=
