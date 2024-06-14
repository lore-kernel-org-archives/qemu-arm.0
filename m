Received: by 2002:a17:906:18aa:b0:a6f:6ed6:9beb with SMTP id c10csp142484ejf;
        Fri, 14 Jun 2024 10:36:45 -0700 (PDT)
X-Received: by 2002:a05:6871:828:b0:254:a753:d1c0 with SMTP id 586e51a60fabf-25842b7b406mr4140580fac.48.1718386604912;
        Fri, 14 Jun 2024 10:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718386604; cv=none;
        d=google.com; s=arc-20160816;
        b=hGYzR7t5O0eYAAGXjoxHIkuOSD81CO+E7lKX3j2GDhgfDjE8FnTxvk+8aiY4W3ukM+
         DnOr5d5kuaG72vf9TeXJBuxbe7VNc2vwWnkqzIXrO3PB24/RYQIRUWIIvSnJSBCIERSD
         C+VgxTNmB3P4ZBA1rZ8qycDdxzfpbwU0TxSG4wfgGPHAJ67X91kUH+P+sUDYUJbiV3Om
         /OHaSUstlHUGG4dI2WzJDKmg21MiHBZXTLZkrjC7kTQwqIHmsRDnR8F5zoq59U9G88A8
         Yh99Ez6SCZoCukgeoJl8x2mPO72+F8dTG20bcclJGZyyQpVHUefGtWH5oqfCoPnzYJ4I
         SG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1LimRJM9cxSX2f5sFmiGnpuaZ10TrsMotLuL6FGbbKo=;
        fh=KzqBICqIItO6zaTQH0fjH8zdX9pcpm9/WLbrIWvPinY=;
        b=gBZvV2p+7N13qiHOu4xM7j8qME1yuxCowc+Smds5o/OHg0mPHBKrNwO1JUyqODecCB
         8lGx5ZpqRIkM09DYH5LcprCeZR3PMzRvKtBXIres3NF+XqIJKm3BREUTRuOEmVGVIg+B
         aI+0hM3yVm/EjI+dEkUOIyvruixGxRoH8pdFO3wN1podAUx3SXLortCLekz2abJZeQwa
         XpsiJZqw4DuY37nWrVouiDpP1lWxgyvj2mbJvmBPGAMOmKvGofv6A6dkgVzqjtALyiPx
         Awv7PY2ZGLCBrNyG6LKnjU1s2s5+O5BbVwGJrh/QmzwZTiWiQiCgM4MTWXaA40gmI+R5
         yf0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEtCxoap;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-25832678ebasor1582678fac.7.2024.06.14.10.36.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jun 2024 10:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEtCxoap;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718386604; x=1718991404; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1LimRJM9cxSX2f5sFmiGnpuaZ10TrsMotLuL6FGbbKo=;
        b=EEtCxoap7hcd/i6V65siMFbehhf48A8Em7U7432b2kUa0+ue2FLfBofocDOkAv84OL
         SNBhA/zF1x9sSBzJBDt2l1O990h9xMy5gO6yh6G0cT+WZrlXPvh2LZoEpEL5VEOSDLlG
         NrF/PaeYbWyAa2bnbfFm04KH+90gffNPL6ZTomYD/mYzf8FiUkCkNbmY23HFC3hXBzwb
         YlrQXha22a4y1FLQD/dH7dND5phXlD5Tz9zAIVv328wbyFZnlf21WfzhVyuuuo36Jlfx
         44/83P9oPZ5/gn89u3htSgajH4cWssS8mOn18JPP2wVNAtHhxlHbv8xvrOYdNMmNljx0
         Db6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718386604; x=1718991404;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LimRJM9cxSX2f5sFmiGnpuaZ10TrsMotLuL6FGbbKo=;
        b=mOOgzK5HCQB/kU3PYbSRzSHqwAlauiFvUHDA/wYm19llFEaDSXZwkG5b7tLB2KO/g0
         RIz2kxq/JQBH3JqP2zzMlTyxdS3wNkRGkXAZybKHv7OdTCnQqgULBLPKns1q4NgGSExC
         U8hSOT88b0nBHCwAPSDKTrkgsh2zXpGsZ0OVId1zwV8Gt6p6on0w7qSrZmvaH/ASDek5
         VoNBAuwWoGwq6Rcp3sxwNV1qrPEx2loTJfSXSyHaWa8q38JXY7Kg2ygDffcl3g9EZ4Ji
         3/eTWNP2Bm9JBJGobi7eECibbXlVr3HZuP45s4P88MUwlJj+YW1A40JxARqKBChQDIzi
         Folg==
X-Gm-Message-State: AOJu0YxwHJLZDhAcXuaSbYYn62i9zd3qqvDEYlGPn6NEQ0ofQqwZOWHo
	ud0li/CtqpSxxcvy5dsXBuRktCLvfmHc3XIGkMbbW77+0vzp8fjMaSqFv6DTZcLZ1omsojdHWWt
	xKy7lHA==
X-Google-Smtp-Source: AGHT+IFqp54QBTCWDMIIVSm8l3m8LBnykdkXpasQW4hnt2Hq/DpO3ONARm3we9JumapgK+vz7R3LgQ==
X-Received: by 2002:a05:6870:4194:b0:254:b1b1:7ea5 with SMTP id 586e51a60fabf-25842af7079mr4304081fac.37.1718386604036;
        Fri, 14 Jun 2024 10:36:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00:5b09:8db7:b002:cf61? ([2604:3d08:9384:1d00:5b09:8db7:b002:cf61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91ed6asm3308225b3a.39.2024.06.14.10.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 10:36:43 -0700 (PDT)
Message-ID: <2812da25-495c-4356-a230-257ea96e6dcc@linaro.org>
Date: Fri, 14 Jun 2024 10:36:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] plugins: add time control API
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
 <20240612153508.1532940-9-alex.bennee@linaro.org>
 <c4d36875-c70d-4e2c-b3a8-c50459c9db0f@linaro.org>
 <87r0d0vnt8.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <87r0d0vnt8.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: pQYHSidNHVBV

T24gNi8xMy8yNCAwODo1NiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiAxMi82
LzI0IDE3OjM1LCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4gRXhwb3NlIHRoZSBhYmlsaXR5
IHRvIGNvbnRyb2wgdGltZSB0aHJvdWdoIHRoZSBwbHVnaW4gQVBJLiBPbmx5IG9uZQ0KPj4+
IHBsdWdpbiBjYW4gY29udHJvbCB0aW1lIHNvIGl0IGhhcyB0byByZXF1ZXN0IGNvbnRyb2wg
d2hlbiBsb2FkZWQuDQo+Pj4gVGhlcmUgYXJlIHByb2JhYmx5IG1vcmUgY29ybmVyIGNhc2Vz
IHRvIGNhdGNoIGhlcmUuDQo+Pj4gRnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPg0KPj4NCj4+IFNvbWUgb2YgeW91ciBwYXRjaGVzIGluY2x1ZGUgdGhpcyBk
dWJpb3VzIEZyb206IGhlYWRlciwgbWF5YmUgc3RyaXA/DQo+IA0KPiBJIHRoaW5rIGJlY2F1
c2UgbXkgb3JpZ2luYWwgUkZDIHBhdGNoZXMgd2VudCB2aWEgUGllcnJpY2sgYmVmb3JlIHB1
bGxpbmcNCj4gYmFjayBpbnRvIG15IHRyZWUuIEkgY2FuIGNsZWFuIHRob3NlIHVwLg0KPiAN
Cg0KVG8gYmUgaG9uZXN0LCBJIGRvbid0IHJlbWVtYmVyIHdoeSBJIGFkZGVkIHRob3NlLiBF
aXRoZXIgSSBzYXcgdGhhdCBpbiANCmFub3RoZXIgc2VyaWVzLCBvciBpdCB3YXMgYXNrZWQg
ZXhwbGljaXRlbHksIGJ1dCB5b3UgY2FuIHJlbW92ZSB0aGlzIGZvciANCnN1cmUuDQoNCj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPg0KPj4+IFtBSkI6IHR3ZWFrZWQgdXNlci1tb2RlIGhhbmRsaW5nXQ0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4NCj4+PiBNZXNzYWdlLUlkOiA8MjAyNDA1MzAyMjA2MTAuMTI0NTQyNC02LXBpZXJyaWNr
LmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiBwbHVnaW5zL25leHQNCj4+PiAg
ICAgLSBtYWtlIHFlbXVfcGx1Z2luX3VwZGF0ZV9ucyBhIE5PUCBpbiB1c2VyLW1vZGUNCj4+
PiAtLS0NCj4+PiAgICBpbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaCAgIHwgMjUgKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+ICAgIHBsdWdpbnMvYXBpLmMgICAgICAgICAgICAg
ICAgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+ICAgIHBs
dWdpbnMvcWVtdS1wbHVnaW5zLnN5bWJvbHMgfCAgMiArKw0KPj4+ICAgIDMgZmlsZXMgY2hh
bmdlZCwgNjIgaW5zZXJ0aW9ucygrKQ0KPiANCg==
