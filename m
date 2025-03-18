Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3260195njb;
        Tue, 18 Mar 2025 15:58:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXE86+KKe9s1clgeLvTvl8gVPyT3Vd/7H9ObNo8DZGiJdJN4nc1/VC1midqrQwHwLn8451q6//VHeIclg==@linaro.org
X-Received: by 2002:a05:6a21:7888:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-1fbeae91352mr647305637.4.1742338715978;
        Tue, 18 Mar 2025 15:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742338715; cv=none;
        d=google.com; s=arc-20240605;
        b=XPgr3a1/h4Syd8QBuw27rQ6aW2Py43yH4QV9n90TZQ3U/Muq29N1nep+BZto0PkHOE
         EmnNQCySFYhGbqvCNkisJJYT5iNw1+Qwt3SMPOX1VKfeIXNSBW+ywzI68VwLJNtCz7QZ
         p3y20+Sw5hpmGjZ1ycA0FWwP9WFyctj3iehRfqoAXeQHTJ4p0SJVLYpltZAjIeHNs3Bp
         l/b+aMYz8jqQGwKR/9z6bGKd4Py2GEm3SYZQC6xjroxcGAOcjGbCj2igcTsujYe2byV5
         c4pfNcEhiz/VvPn2pyYfirpAKAQ9Jz5c4YoJNu7nqqtQSA/iROEXVK0/W1o50QuWT2T1
         AA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W93rpVZsHi97qPuHO/U/FnMIMFGbqK6KiMYoGPhb3pA=;
        fh=BoNRg8ElBLMsd1SnmaHWKG9zzX7Rh2ZYxKFd655nos0=;
        b=duysZd5h6f+QvTz3QPTQxci2NYXxKF6lYToNLkrLq3m6v15wOEJvFW2TdkfYRJrbcZ
         bUwSOHNaFPoYebzDM5yX9umQnTNz6smatHDM5IuM3CtNq3fhvHYnTZq96AwlLa297NEw
         2fXKJz0hjEJzdBFFH9Odt844tfletA3ImAterAWSCGloBsn1xED0zTCGtRtixckcz0Fb
         1aUISsaSBk+Zg+SodwXl2QCx7gbwY1oGHFtLUM7fHcumwW6RBKEyVzTUhlAOdNtA8Mf1
         lO4eulu1ERQ+bZBTbrrIBWUVjZ8GYz2W0TG3lWC/EfN6d8tT6biT8Sh29flOC1lMqOAB
         vMcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aiiRxf9B;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7376d47ad80sor172462b3a.2.2025.03.18.15.58.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:58:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aiiRxf9B;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742338715; x=1742943515; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W93rpVZsHi97qPuHO/U/FnMIMFGbqK6KiMYoGPhb3pA=;
        b=aiiRxf9BZ95IpFQlzsYdtYHgw/C8DywAD1Tq1QUtlQ+I7irN3Z8ji+9mPsBaXHmZ6O
         P83RDM+fDC2naL3JaJxsPJXmpViiZJUa3YIDXR7Jy8cNKJWgs18AGLn+rLaY8lzDOuRB
         3+TariJ/NkKxNcbf0KEGW8GiuN7Cp+p3xVFHC0Tfg78vfj/aujMU0vwoGi3vjzm1WguX
         RqSohsRkyp8WWqBXczyCWukyfPRqa9J1adVQc3Fc1KNzIAOPQEQ+gRezm5nLQ92S002A
         rO0lxNlvlK8+oYjsUIATxETiNPzpt4nUu2dMdJ9R525Lc3ZaxB7dEuj/SftjEnf4aTLF
         TBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338715; x=1742943515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W93rpVZsHi97qPuHO/U/FnMIMFGbqK6KiMYoGPhb3pA=;
        b=TwhbS3VXUjWaJfdtM/aj0uaSsoNtHwuj4Cn1vGS/4KKOgi3vhxJ6y1dX2YYB8GTST/
         8+Cvz4oIRu3QUiQkzChHkl4dOTTNzl+6u4yuKZSoVG8XcQIiPdpCHrOwfyl5/SgU9GG5
         O31D3AlHfJeoaLueDPqUhzy5+6dS7sqkpgQBAjRCQP0bFHZM1XiXDQowOyU9sS0nyaAl
         uwb/YkjDQTT7Ni9+ddP5LzfFHIFffPVdJ2sw8RGcNZSRknhrrIOdUiF5FUc4YgAm/aeb
         60bYh5tlxH+Nck9EkyPHugsrL3JRxc5bUiYe3M4bBGGO3Ojt9TdfDmRpd8dBbra8Dk7E
         MBpw==
X-Forwarded-Encrypted: i=1; AJvYcCWLvrsvm9VaFxJdesnl57DEmnDhIr6GuydHk8gg2MXQbcjn8x/BZb7JF3BLA+k6KZb/ePwOh4lQM7fXgA==@linaro.org
X-Gm-Message-State: AOJu0Yw8OA/m9Gaxohdxnfi8e0SE/3fbDZb6qkgFD/xwhfmWA089WvWS
	/+Rk470hEk9z44A20esa1RBYZZsu7Pq6DXQikUUXsu2vkoQ4VomhP0tmPZrkTPKeBQ==
X-Gm-Gg: ASbGncsyvMVSDBLpzYVB5QJU5rrfy6o2/nfh3LkqU/Nn9u4XavRRIalvqgeOG+r/r4w
	TRpMGf8yU7swo4WvwemxTGm2xtdlfrt4oST0+TotGHZQXarheNTKyQGX2f/ms9fqWcIyJO4XRRO
	Y2gsLm+8fzbF+jKSEt7Qbsb+jKz+2hrslMHKicG7xuyCBEWhHP7qCsT3lBpi2EHOLyIz14dQouA
	T7LTNqMHbwljCqK4eNcxTp+qPXMj4HESL+mZupmC8oyF1XDkaYCLidIxguYMFunEcxROLLsma+T
	AuhfM91X3PXf5C7i1XU0AxXRVVEZ97CfWYhsA0+NL6kBCqyf1J16SZbN+Q==
X-Google-Smtp-Source: AGHT+IGgATHzA5mk2h2ZORMhsVXPw1HXuieiJoAjLgmzG5rkU4wbf2UiZAhgaj9NQ6le0L1eNMvUqw==
X-Received: by 2002:a05:6a20:1605:b0:1f3:388b:3b4b with SMTP id adf61e73a8af0-1fbeb4ab598mr756431637.15.1742338715563;
        Tue, 18 Mar 2025 15:58:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9fed33sm9684412a12.37.2025.03.18.15.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:58:35 -0700 (PDT)
Message-ID: <b107adfe-83fa-4e56-a26d-3c8a7eb3ac49@linaro.org>
Date: Tue, 18 Mar 2025 15:58:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-5-pierrick.bouvier@linaro.org>
 <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
 <7202c9e9-1002-4cdc-9ce4-64785aac5de4@linaro.org>
 <0c6f23d5-d220-4fa7-957e-8721f1aa732f@linaro.org>
 <172a10d0-f479-4d6c-9555-a9060bdf744e@linaro.org>
 <ac79c5f1-d7ea-4079-b042-3805063fddba@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ac79c5f1-d7ea-4079-b042-3805063fddba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Agiooian272I

T24gMy8xOC8yNSAxNTozNiwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMTgv
MjUgMTU6MjUsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzE4LzI1IDE1OjIx
LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+PiBPbiAzLzE4LzI1IDE1OjE2LCBQaWVy
cmljayBCb3V2aWVyIHdyb3RlOg0KPj4+Pj4gVGhpcyBkb2Vzbid0IG1ha2UgYW55IHNlbnNl
IHRvIG1lLsKgIENQVV9JTkNMVURFIGlzIGRlZmluZWQgd2l0aGluIHRoZSB2ZXJ5IGZpbGUg
dGhhdA0KPj4+Pj4geW91J3JlIHRyeWluZyB0byBpbmNsdWRlIGJ5IGF2b2lkaW5nICJjcHUu
aCIuDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBFdmVyeSB0YXJnZXQvWC9jcHUuaCBpbmNsdWRlcyBj
cHUtYWxsLmgsIHdoaWNoIGluY2x1ZGVzICJjcHUuaCIgaXRzZWxmLCByZWx5aW5nIG9uIHBl
cg0KPj4+PiB0YXJnZXQgaW5jbHVkZSBwYXRoIHNldCBieSBidWlsZCBzeXN0ZW0uDQo+Pj4N
Cj4+PiBTbywgYW5vdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBmaXggdGhlIHNpbGx5IGlu
Y2x1ZGUgbG9vcD8NCj4+Pg0KPj4NCj4+IElmIHlvdSdyZSBvayB3aXRoIGl0LCBJJ20gd2ls
bGluZyB0byByZW1vdmUgY3B1LWFsbC5oIGNvbXBsZXRlbHkgKG1vdmluZyB0bGIgZmxhZ3Mg
Yml0cyBpbg0KPj4gYSBuZXcgaGVhZGVyKSwgYW5kIGZpeGluZyBtaXNzaW5nIGluY2x1ZGVz
IGV2ZXJ5d2hlcmUuDQo+Pg0KPj4gSSBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgaXQncyBh
biBhY2NlcHRhYmxlIHBhdGggYmVmb3JlIHNwZW5kaW5nIHRvbyBtdWNoIHRpbWUgb24gaXQu
DQo+IA0KPiBJIHdvdWxkIHZlcnkgbXVjaCBsaWtlIGNwdS1hbGwuaCB0byBnbyBhd2F5Lg0K
PiANCg0KRGVhbCwgSSB3aWxsIGNvbXBsZXRlIHRoZSB3b3JrLCB3aGlsZSBiZWluZyBiYXNl
ZCBvbiB5b3VyIGN1cnJlbnQgc2VyaWVzIA0KKHYyKS4NCg0KPiBJdCBsb29rcyBsaWtlIHdl
IGhhdmUsIG9uIHRjZy1uZXh0Og0KPiANCj4gKDEpIGNwdV9jb3B5IGlzIGxpbnV4LXVzZXIg
b25seSwgYW5kIHNob3VsZCBnbyBpbiBsaW51eC11c2VyL3FlbXUuaC4NCj4gDQo+ICgyKSB0
aGUgVExCIGZsYWdzIGNlcnRhaW5seSBkZXNlcnZlIHRoZWlyIG93biBoZWFkZXIuDQo+IA0K
PiAoMykgVGhlIFFFTVVfQlVJTERfQlVHX09OIGFzc2VydGlvbnMgbmVlZCBub3QgYmUgZG9u
ZSBpbiBhIGhlYWRlciwNCj4gICAgICAgc28gbG9uZyBhcyB0aGVyZSBpcyAqc29tZSogZmls
ZSB0aGF0IHdvbid0IGJ1aWxkIGlmIHRoZSBhc3NlcnRpb25zIGZhaWwuDQo+ICAgICAgIFBl
cmhhcHMgY3B1LXRhcmdldC5jIGlzIGFzIGdvb2QgYXMgYW55Lg0KPiANCg0KWWVzLCBJIG5v
dGljZWQgaXQsIGFuZCBjaG9zZSAjaWZkZWYgQ09NUElMSU5HX1BFUl9UQVJHRVQgd29ya2Fy
b3VuZCB0byANCm5vdCBtYWtlIGEgY2hvaWNlIG9mIHdoZXJlIHRvIG1vdmUgaXQuDQoNCj4g
DQo+IHJ+DQoNCg==
