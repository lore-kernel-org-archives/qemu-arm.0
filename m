Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp282948njb;
        Thu, 5 Dec 2024 09:09:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7iZh8MAjs3eOClnt8CJgacjluik+8YP6WvAJ2Sn3UEjXjtNuPHyFpR9mJqcE6Q0vj9LpuZFwlo2BD0g==@linaro.org
X-Received: by 2002:a17:902:ce03:b0:212:1abb:cba1 with SMTP id d9443c01a7336-21611b1362emr499935ad.24.1733418587404;
        Thu, 05 Dec 2024 09:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733418587; cv=none;
        d=google.com; s=arc-20240605;
        b=aeWeJeNIh+dl4t1dc6+q1dETHgNoD5aorpLsaUiJ5J6Dq4SvBjeWpczZDseSolGCWn
         yBXMNFEdwlRhgbDLzX502ZAX6eBXexuwB1LdyNvTE3UyKNX/t/NjwzxboVg7Xcx2QwU/
         pXnZwrfJdjyLZRoekl7a+A+l+qFhuX1fFO/zRCRpU1fE0mKJ0RAE6MLaxSL42JBZ+A27
         uYY+KxnyDmQzCjhvjlcTmsUWBkjwm6MmVh3ya1IDxs40r4YiklmyDHcKs2Fc/DDVrLkL
         wUIlAzdJ5+u49LVSndyQugbaelcgOkgI9aNHJ2YOyoLiwmZXHDMxOzq+d+1GTXJs1BA9
         9G1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QdqjY5o7C6HfgDwgCxC48ptiE4t2cU+Jk0v9zUE/c9Q=;
        fh=GrPbpZQU7kD3HnvyW9PxjRQhZcjWlZ2FcUB7bdj3r0c=;
        b=CuxMq+kPzp2ix8d7OsfPj8942Ez1+UAZbuzbfUjwS7154pJpF1x+mhw0YFX+ND6c59
         aqA0LUUYvM9+EhIBlnXs41MSEpw3D/JLeQCej1kk5bR1jQW7i4D1EaTQz0dZWHqPDm0R
         6xE4FDP8Rr2pmPKrFRs0uz8UMcKL/b6DblwQE0Gv3G+pBK1AAO2OYiWDohDVoQ9EMDC+
         HPCr0+pNyUl5DeWj8KXstFgy84QLBp8VRSuCSiirJgnM1SiR0v4Qwizm/RObeKfgfsxK
         nNukSwvQq/9to3TUrWDfwrjNmUxhmoyBhWTgGVWSpWXP023xegFUwlU259/QXLY8jhCG
         S4uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pJyWdUxU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215d9b1220asor19598645ad.5.2024.12.05.09.09.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 09:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pJyWdUxU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733418587; x=1734023387; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdqjY5o7C6HfgDwgCxC48ptiE4t2cU+Jk0v9zUE/c9Q=;
        b=pJyWdUxU3vMCXDiHX7hRudxTU08cdhk5HGWoIgbcbM8eILNsPBmCKWORbNHAQlbyp3
         0WcXz2rBF0/f38qE5f9pp37lDCjK9V+xu5QveZaROs5q0EXorPy6sm7YYWtNTzMqP23B
         8JkDjWU0vHAptszFwG1ZEHqa/dpW1uLDgRhPJxLwRpAtcsV+rZzmZBLuyaONSRHUOF80
         +qj6+LJ87fpRPbgE3jxYEt66kU4io8Vu2VFxWUe4q3h6EgfcoxiQjOTragIAqiuB7JJG
         lbl3stXvGHuN97lLjOsmqm7cQXt71VOlXbTbmNKHaowQtLIadtAvnsZANjHmWpY6+a3a
         Q4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418587; x=1734023387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdqjY5o7C6HfgDwgCxC48ptiE4t2cU+Jk0v9zUE/c9Q=;
        b=kFwewMml/KUmGr1GLabe9Zo1BYsyE0KGCcDrROFSBSsxAwhzIJJX2Mkee+upOC7QjT
         s76ZCQTA+3oUs9L/fwQcUlNJ7p1SPIMtV9qIKoiu92OiW6fvyCGsnAgaoNxhFYwmZE1B
         1vuJKxeUBtaP00jse3tJk7PqHXW+VbiD5lmX/AmhipK3Sw6uy+43QSE+5Fh5m6F/VyF4
         DU0Vl7hOaGexGtE7BvDL+dtrCUyd6M1n3OwaqSoKszLJOAvXDj8L5bCMFC652XUZLaZJ
         X+u3TQm8Wz52b16hlrBLgA17bWm4kyWyNn2RCIXEPxO8yZ4myeMw18n7d0kYgOFYckXD
         uMtA==
X-Forwarded-Encrypted: i=1; AJvYcCUSIpOevMj0100WO9p/ESOrE7wrQ5ERX1QU95tDRtVddCaykLxa7yU3exWIXosq2UpYzlb3GK5/YY3hMw==@linaro.org
X-Gm-Message-State: AOJu0YxkIcyocJiIbKiTlhkPsWWab0AyIyI7SWVzZTV495QSHxpA5EF/
	ir+OdhmDLWb1Aj0eAnUvjp7fdt+b5FJ2vNMCTUPuNnDFMH1V4+sbBf4BnOnK3ESPGA==
X-Gm-Gg: ASbGncsePXkNWxxhm8YXfNL1c3PRqizZvbB3LhTEloI/moQowg+H3+s2zJUPA60iPbI
	iIMEjCYVNwNOmXQh7A5Ta6oRCAe0KmSFvrqsPp/W9/vgAB0WLAqFXWNff+tu9rE8ud8iQ15KQlh
	tOQ0IQaQjHF98lB6XldyhQN0LB+bZBvjKNwVDrDqebEbmAsCvawt5lF0wn+L23217d9UzUPGA6e
	kdM+Q2bh+5vtHWUrgR/9B7sVTBQOQbHe1sjOZa4tmJE7Cfwon548jh2EdDZX3jUj6Z4C7j+c7bL
	R5vw3qPC930v8Cv/AqxibQ==
X-Google-Smtp-Source: AGHT+IHyR+p/pw0t1FX5qmBmkXjMspSRbcz9tNGXpq8UQkzv+/9SOEzMuTlQCXsLstisueKplxlC9A==
X-Received: by 2002:a17:903:ca:b0:215:bd3e:613b with SMTP id d9443c01a7336-215f3cfb9dcmr45012905ad.27.1733418586967;
        Thu, 05 Dec 2024 09:09:46 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e61ef7sm14977085ad.95.2024.12.05.09.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:09:46 -0800 (PST)
Message-ID: <3ba7dabb-67cf-450f-828c-5adf7332fc91@linaro.org>
Date: Thu, 5 Dec 2024 09:09:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs/system/arm/fby35: document execute-in-place
 property
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 alex.bennee@linaro.org, Alistair Francis <alistair@alistair23.me>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
 <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
 <c2e4c538-2e0b-4882-8a92-6ff439cebd09@kaod.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c2e4c538-2e0b-4882-8a92-6ff439cebd09@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: CCZwmvUsqNhw

T24gMTIvNS8yNCAwMDoxOCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IEhlbGxvIFBp
ZXJyaWNrLA0KPiANCj4gVGhhbmtzIGZvciBpbXByb3ZpbmcgdGhlIGRvY3VtZW50YXRpb24g
IQ0KPiANCj4gT24gMTIvNC8yNCAyMTozOSwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+
IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZz4NCj4+IC0tLQ0KPj4gICAgZG9jcy9zeXN0ZW0vYXJtL2ZieTM1LnJzdCB8IDMg
KysrDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RvY3Mvc3lzdGVtL2FybS9mYnkzNS5yc3QgYi9kb2NzL3N5c3RlbS9hcm0v
ZmJ5MzUucnN0DQo+PiBpbmRleCBiZjZkYTZiYWEyYS4uZWQ5ZmFlZjM2M2MgMTAwNjQ0DQo+
PiAtLS0gYS9kb2NzL3N5c3RlbS9hcm0vZmJ5MzUucnN0DQo+PiArKysgYi9kb2NzL3N5c3Rl
bS9hcm0vZmJ5MzUucnN0DQo+PiBAQCAtNDUsMyArNDUsNiBAQCBwcm9jZXNzIHN0YXJ0cy4N
Cj4+ICAgICAgICAkIHNjcmVlbiAvZGV2L3R0eTAgIyBJbiBhIHNlcGFyYXRlIFRNVVggcGFu
ZSwgdGVybWluYWwgd2luZG93LCBldGMuDQo+PiAgICAgICAgJCBzY3JlZW4gL2Rldi90dHkx
DQo+PiAgICAgICAgJCAocWVtdSkgYwkJICAgIyBTdGFydCB0aGUgYm9vdCBwcm9jZXNzIG9u
Y2Ugc2NyZWVuIGlzIHNldHVwLg0KPj4gKw0KPj4gK1RoaXMgbWFjaGluZSBtb2RlbCBzdXBw
b3J0cyBlbXVsYXRpb24gb2YgdGhlIGJvb3QgZnJvbSB0aGUgQ0VPIGZsYXNoIGRldmljZSBi
eQ0KPj4gK3NldHRpbmcgb3B0aW9uIGBgZXhlY3V0ZS1pbi1wbGFjZWBgLg0KPiANCj4gQ291
bGQgd2UgYWRkIGEgbGluayB0byB0aGUgIkJvb3Qgb3B0aW9ucyIgc2VjdGlvbiBvZiB0aGUN
Cj4gIkFzcGVlZCBmYW1pbHkgYm9hcmRzIiBkb2N1bWVudCBpbnN0ZWFkID8NCj4NCg0KVGhl
IHByb2JsZW0gaXMgdGhhdCB0aGUgYXNwZWVkIGJvYXJkIGhhcyBvdGhlciBvcHRpb25zIChm
bWMtbW9kZWwsIA0Kc3BpLW1vZGVsKSwgc28gaXQgd291bGQgYmUgY29uZnVzaW5nIGZvciB0
aGUgcmVhZGVyLg0KDQpJdCdzIHdvcnRoIHJlcGVhdGluZyB3aGF0IHRoZSBvcHRpb24gbWVh
bnMgSU1ITy4NCg0KPiBDLg0KDQo=
