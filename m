Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3757209njc;
        Tue, 19 Nov 2024 22:25:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVqwuntzM3UEgdeVdifpSU8MiyaVEz4ocEoR6xUzSf6Jo2rbKPhLkCj6qhc82Uea7e+CYO5wIGRc25IQ==@linaro.org
X-Received: by 2002:a05:6a00:acf:b0:71e:573f:5673 with SMTP id d2e1a72fcca58-724bed17872mr2050490b3a.15.1732083939463;
        Tue, 19 Nov 2024 22:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732083939; cv=none;
        d=google.com; s=arc-20240605;
        b=DuuC8o7JzSz6SjpVCS/XGJiMGB/03Z4gbe/8Rq3MqyTXXwKQWR4VMk2NaCPoquuXuP
         vUo7nkQgckGRUHLyVtykDenefNoEydLBPJJugE8mqerZSawZLWm5/nlxQk/Xwm9C7rHG
         3HETiawnco9HtudfdHnrhsNpKNznhhefwmlVvDlu2dHn8+q8u05x/xbnmCwCHCA5SRtp
         95hNAOh/FcUbAHMBa/m1n9J0+NFCtWjXdLUs/GNi3VRcZVh9V1ARyTkqapxyE8+nvxcT
         kcopjfuBoloXo0y3WJeAkq7eUyu6+t7drsl4NO9GBqfTT5miL6/apQZCzfjItdwYMqP4
         hANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yuWBS6YqEeMC3xFYs0OrjJ6rnaAaoyyJXmzYyV9zP7U=;
        fh=L7jqdGzLLPCQQQTyQ0H2FqzAOyoEK0AKOhVlR2Hsb4A=;
        b=iArI7gdBhKLwDBcTwjGvAFe1UZGMxnkAG01AbT5nNb3iwbpno9VUpHIupc3U5BTJ4G
         wneWHAIrVEtSNaTvqIVSlmnQK+dXHrLxJEqHTBQ1wgvKE1YL/ZROhWsJ6aFUdcRUn94Y
         IN6Z39lconcV0yS3Dqk6W87WCUdUMGH9hGnTaxm9Ru1pmzLBoK6leSjNlQ+ROkrb7AQd
         cGVKD5HFoUAlTsUfazUpehB9C03YGJWODi+9Bluqv20kXwxC2xRuAY/MqSg6kiY2Uv8q
         KUMHA/FLPElCBX6KxEChrZSoi5X30kL+iLdaF2JhkkoyeFi+lf4qEe7Yaux1/l0u3y9T
         wGog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAy6Nbdy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a9bb7f5sor8470738b3a.10.2024.11.19.22.25.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Nov 2024 22:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DAy6Nbdy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732083939; x=1732688739; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yuWBS6YqEeMC3xFYs0OrjJ6rnaAaoyyJXmzYyV9zP7U=;
        b=DAy6Nbdyhzbesg1PL5mfI9CM3RWTOFh644stPLg4vGTEGUhd6/JDfGg5lDI3x7Fl35
         B/KbQIKHBiJLLGEqfdDus3SimfuCYnQ6DyRIRY6x5tqCJCoUXyeNywVqJMS4HeUjd0HO
         k+2lmncC71FgAQVDRCjtkdsEFtZnpL5xzR9mqHkUFZ/W6QQ+HDORkUy7gPYkoY8qCWHl
         meby2QULWmVhfvDYx0XvXaom/wMlnNEtES8eTMeyv/f74edXzlC9sOUZdglAxZdCAqMW
         A+NqnTljp0L7piEs+P3OA0sIRgjgFv/fgtPBxOXRlcva7DuzXl0OPUju/4Hpi9rBUnLi
         v+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732083939; x=1732688739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuWBS6YqEeMC3xFYs0OrjJ6rnaAaoyyJXmzYyV9zP7U=;
        b=nthtxzrxX8Fqrkl8y8Wl75FO5X+fmRTBinTigShiQShofX+yoo9B5DO2+hT9H2kfV1
         gyPVf+vjgQG+tBQVVu/bWOZSj4anJ667K0hM4cyAK4R3796Y733iTguhty0EvNH/pzl1
         7EpoXZF5NPlOZad7QykS/0WuF9UgNNpV6zi2QeuLSc1L4VrFcOR8sQ9qyK++gmIi/UpX
         nsL92dX7dXkby1xFRINUukwryN+69E9XDxnaJZKeJH/C0Z+B6CokhQ/+n/YKGIw+DhhP
         EwrpTEhN6X/NFEaDp87a54AKNnFkblJfQ5N3A8PAaaq3D571O2QQge/5DMPlh0J5tBxN
         eqmw==
X-Forwarded-Encrypted: i=1; AJvYcCX+6EpRreNqUa5vzH6RiCPpYzVz0mfLxwOwd8RaI7v+5MfCDK/sXM+miRyeXhA5jZKvOVOlW5uP5WKbuw==@linaro.org
X-Gm-Message-State: AOJu0YxwWTNY0kVUZa8kmwH2Ba4FmNdRwbiMzxGW9gewAMdmvMdxyYMW
	4ZugnMoy72y+ksAXExiVVZB3IHjxwMf95pPFJ6HRHLUM//U0SRkbwA6Cs09WGB4KTw==
X-Google-Smtp-Source: AGHT+IFuNa2USP91lTchxo80lZcRGk+pX1jhvI8MUo0XNDQuidqrqtvyuVKSpIvdAbejZcQvapMYGw==
X-Received: by 2002:a05:6a20:6a23:b0:1db:ee36:796 with SMTP id adf61e73a8af0-1ddae4e2668mr2287687637.13.1732083939018;
        Tue, 19 Nov 2024 22:25:39 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befac739sm784388b3a.152.2024.11.19.22.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 22:25:38 -0800 (PST)
Message-ID: <b9df48b7-c1a9-4a46-bd78-b7ecb8328b33@linaro.org>
Date: Tue, 19 Nov 2024 22:25:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/devel: add git-publish for patch submitting
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
 <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: rpcvKp1b2Pci

T24gMTEvMTkvMjQgMDA6NDEsIE1hcmNpbiBKdXN6a2lld2ljeiB3cm90ZToNCj4gVyBkbml1
IDE4LjExLjIwMjQgb8KgMTg6MjMsIFBpZXJyaWNrIEJvdXZpZXIgcGlzemU6DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5v
cmc+DQo+PiAtLS0NCj4+ICAgIGRvY3MvZGV2ZWwvc3VibWl0dGluZy1hLXBhdGNoLnJzdCB8
IDE0ICsrKysrKysrKysrKysrDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3N1Ym1pdHRpbmctYS1wYXRj
aC5yc3QgYi9kb2NzL2RldmVsL3N1Ym1pdHRpbmctYS1wYXRjaC5yc3QNCj4+IGluZGV4IDM0
OWMzMmVlM2E5Li45NTM2ODJmMjBjYiAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvZGV2ZWwvc3Vi
bWl0dGluZy1hLXBhdGNoLnJzdA0KPj4gKysrIGIvZG9jcy9kZXZlbC9zdWJtaXR0aW5nLWEt
cGF0Y2gucnN0DQo+PiBAQCAtMjM3LDYgKzIzNywyMCBAQCBhdHRhY2htZW50cyBjYW4gYmUg
dXNlZCBhcyBhIGxhc3QgcmVzb3J0IG9uIGEgZmlyc3QtdGltZSBzdWJtaXNzaW9uLg0KPj4g
ICAgDQo+PiAgICAuLiBfaWZfeW91X2Nhbm5vdF9zZW5kX3BhdGNoX2VtYWlsczoNCj4+ICAg
IA0KPj4gK1VzZSBnaXQtcHVibGlzaA0KPj4gK35+fn5+fn5+fn5+fn5+fg0KPj4gKw0KPj4g
K0lmIHlvdSBhbHJlYWR5IGNvbmZpZ3VyZWQgZ2l0IHNlbmQtZW1haWwsIHlvdSBjYW4gc2lt
cGx5IHVzZSBgZ2l0LXB1Ymxpc2gNCj4+ICs8aHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmhh
L2dpdC1wdWJsaXNoPmBfXyB0byBzZW5kIHNlcmllcy4NCj4+ICsNCj4+ICs6Og0KPj4gKw0K
Pj4gKyAgICAkIGdpdCBjaGVja291dCBtYXN0ZXIgLWIgbXktZmVhdHVyZQ0KPj4gKyAgICAk
ICMgd29yayBvbiBuZXcgY29tbWl0cywgYWRkIHlvdXIgJ1NpZ25lZC1vZmYtYnknIGxpbmVz
IHRvIGVhY2gNCj4+ICsgICAgJCBnaXQgcHVibGlzaA0KPj4gKyAgICAkIC4uLiBtb3JlIHdv
cmssIHJlYmFzZSBvbiBtYXN0ZXIsIC4uLg0KPj4gKyAgICAkIGdpdCBwdWJsaXNoICMgd2ls
bCBzZW5kIGEgdjINCj4gDQo+IFlvdSByZWNvbW1lbmQgJ2I0IHNoYXphbScgaW4gMy83IHBh
dGNoIHNvIHdoeSBub3QgaGVyZT8gQm90aCAnYjQnIGFuZA0KPiAnZ2l0LXB1Ymxpc2gnIHNl
ZW0gdG8gZG8gc2FtZSBzdHVmZiAtIGhhbmRsZSBwYXRjaCBzZXJpZXMgYW5kIHNlbmQgdGhl
bQ0KPiB1cHN0cmVhbS4NCj4NCg0KQXJlIHlvdSB1c2luZyBiNCBmb3IgeW91ciBRRU1VIGNv
bnRyaWJ1dGlvbnM/DQoNCldoZW4gSSBzdGFydGVkIHdvcmtpbmcgb24gUUVNVSwgSSB0cmll
ZCBpdCBiZWZvcmUgZ2l0LXB1Ymxpc2ggYW5kIGhhZCBhbiANCmVycm9yIHdoZW4gdHJ5aW5n
IHRvIHNlbmQgbXkgc2VyaWVzLiBJIGRvbid0IHJlbWVtYmVyIGV4YWN0bHkgd2hhdCBpdCAN
CndhcywgYnV0IHNvbWV0aGluZyByZWxhdGVkIHRvIGZpbmRpbmcgdGhlIHJldmlld2VycyBm
b3IgYSBnaXZlbiBjb21taXQuIA0KV2hlbiBJIGFza2VkLCB0ZWFtIG1lbWJlcnMgcG9pbnRl
ZCBtZSB0b3dhcmRzIGdpdC1wdWJsaXNoLg0KDQo+IGI0IGFsbG93cyB0byBrZWVwIFRvL0Nj
IGVtYWlscyBpbnNpZGUgb2YgY292ZXIgbGV0dGVyIHdoaWNoIG1ha2VzIGl0DQo+IGVhc3kg
dG8gbm90IG1pc3MgYW55b25lIG5lZWRlZC4NCg0KZ2l0LXB1Ymxpc2ggd29ya3MgcHJldHR5
IHdlbGwgZm9yIG1lLCBhbmQgZG9lcyB3aGF0IHlvdSBleHBlY3QgKGtlZXAgDQp5b3VyIGNv
dmVyIGxldHRlci9jYyBhbmQgdHJhY2sgeW91ciB2ZXJzaW9ucykuDQo=
