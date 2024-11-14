Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp88695njc;
        Wed, 13 Nov 2024 20:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVN6Nl/yYXxIXAz9N+fCj8nvLKKN2ealksFtktn7f2xE7PJm6d+WB3fuSGqc+yX26fwEWxaY2QiTI4jdA==@linaro.org
X-Received: by 2002:a17:903:120e:b0:205:7007:84fa with SMTP id d9443c01a7336-211c0fbcda4mr29025135ad.28.1731557361703;
        Wed, 13 Nov 2024 20:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557361; cv=none;
        d=google.com; s=arc-20240605;
        b=gmBQRG+r0+Sri2J4TxMZr2SdlkFD6Fsa25acZ3QgUxh3TfE45xmyojzGHf43YD9OWL
         mcZJ5LylS3YfdyyJj1756a3CWNnezhrB2vk3v/j9lVWNGyVNwtJ8sVjkArp+SeCw8TZ0
         dAekKmRhizSEuk0BY9ye4cGpZLwc7xXhlVj8yDZB1Q9jxtKDWV2C3WNLbeLYhz4CeBFG
         ga6BTxk5KUA48Za/qhzPgyhOawLyng18XRXFS8gC+GsQuzgGNo1G43u8jRt5IB+JhKUv
         dl/4RF25RqK3665itB4sPEdyED5TQ4/XIZDF0/tduXnE4qtP9lGc/UYfIf5Gcwlhet6M
         1I+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1uzC/qplX/KbWgH0kNa5nK4OaHri94fczlPVtVib/78=;
        fh=FQixACZMxpuKG9lJKJEKRPeONvnVFK7qU250GYMULZE=;
        b=f8RGDFUmhmGb6Xq5EHvR386bfXQf1lLhISbAlOH6Kkaf/o81Ghp7QpkHzbtBQBS4qS
         xmHx5pYshFgLAESMXN5JtEgzLYvN4WHdz5AGFV0iW9FzT6hHFP8UFIkH+Otr/BRwsnM3
         FwyjtOlZXxmfydrZH6eo2BHalA1e1QJTZJSQfq4y9M/fdimn2KAbFiRy0GHhfK8w7Ls5
         K0d2q1WSKCyHaUEAw1MfddeYWUQWiBZsrs0FMI+m+gZvzP5jLMwtCsOqC3LFx27YijG3
         hvMGLlPsix6tWgwPfCN83V+sgOoUu3AqWxz+jhb2vnZT3PPXIRtFzwvntF99MI3Gw+AZ
         EX0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0hTCngk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c363b4c5sor2737355ad.5.2024.11.13.20.09.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:09:21 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0hTCngk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557361; x=1732162161; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uzC/qplX/KbWgH0kNa5nK4OaHri94fczlPVtVib/78=;
        b=U0hTCngknkQ6nFhX+7mxzqa23fDke3/21i3tA9aJQDrIOrfHpmK8SJPIhjj3qvGur0
         SsyaMfW1qfNG5mJxsQUDOHtJhFNiLFpekWxRpwH6i0UdJu+rkDAA8N2itfqOW6jrWPd3
         jeOGAnUh8/bjHUD+1PFjq2q8FFqcjZHzFpewZOcOf2dtjVtHNr2w3xCusMgoSB6mI5S0
         OQ4K+MAEP6L43fQ6rRnpYhY8MSWITHsJ+N0d/4rtdSUHTz5yKaupEbBL9h0KkAInXLMV
         DTKBOoIpQ4d1Oyq3faSqtz0WOD7D7B3QMedgoQVmctmHd1bsP+XEayyDiCNWh8CvgbHf
         aj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557361; x=1732162161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uzC/qplX/KbWgH0kNa5nK4OaHri94fczlPVtVib/78=;
        b=ELCYgu+BalTWScD02iL/NEuXljejTRc8R7R/bhpaNRWLi5g/wxSC/wjHxTvJ5sjPD7
         ZuyTb99bZGU6AJzSlAuFDXZawNzCuYO0tkwGBDXtL+D6/jUd3C46fi3MdUoF/g8pgsX9
         /iO9+USxSzK31FFutMQt0wy+Q7cUIOHh+SkTzEK82rnFvk741hFRL9y8zicf8twz4kuB
         oyXfHK111vckIK9qdXxIGL5v9LZnb/B+67vzR28mB5yclq+lqv6jkSbkzTn62cI8YDHy
         HKHi6bSCq8JhkJG2HK9HJl6S1aXLj8zV12MnZkkOmn0JfsneDPfy7lKWuk3j9rP+8jYQ
         HS5A==
X-Forwarded-Encrypted: i=1; AJvYcCVRrArWKTLYj0C1duYAjbBa6fpmNggkoopTcZIOVdh7MgHlmT2TEXED9r/fzrfTk5w6QnWrFXUNnv5vXA==@linaro.org
X-Gm-Message-State: AOJu0Yzj06y+s9nYxMMJXknwlz5ETg+aJ6lt1whxhTIlgf06SO3fMKZ2
	amX1B7BzV1W6coY6F85RzhXJIVWhmuWJDRGcHDyYhUIZkgTQEqRug/CjaarAYMkEIA==
X-Google-Smtp-Source: AGHT+IGAquNpYcTrQuJhVu7KhYPa6+oqqBHuRkAo1PPfoNFrB+kLpwVwG9Jdgjsu0lL9GTZgCar9CA==
X-Received: by 2002:a17:903:120e:b0:205:7007:84fa with SMTP id d9443c01a7336-211c0fbcda4mr29024845ad.28.1731557361177;
        Wed, 13 Nov 2024 20:09:21 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d1f57esm1363635ad.224.2024.11.13.20.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:09:20 -0800 (PST)
Message-ID: <b4a71289-6983-4e93-b549-6225b59b6836@linaro.org>
Date: Wed, 13 Nov 2024 20:09:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] exec/cpu-defs: Remove unnecessary headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Lp/i482SteJR

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gImV4ZWMvY3B1LWRlZnMuaCIgc2hvdWxkIGJlIGtlcHQgYXMgbWluaW1hbCBhcyBwb3Nz
aWJsZTsNCj4gYmVzaWRlcyB0aGVzZSBpbmNsdWRlcyBkb24ndCBzZWVtIG5lY2Vzc2F5LiBS
ZW1vdmUgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdS1k
ZWZzLmggfCA4IC0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2NwdS1kZWZzLmggYi9pbmNsdWRl
L2V4ZWMvY3B1LWRlZnMuaA0KPiBpbmRleCAwZGJlZjMwMTBjLi5hZTE4Mzk4ZmE5IDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMvY3B1LWRlZnMuaA0KPiArKysgYi9pbmNsdWRlL2V4
ZWMvY3B1LWRlZnMuaA0KPiBAQCAtMjMsMTQgKzIzLDYgQEANCj4gICAjZXJyb3IgY3B1Lmgg
aW5jbHVkZWQgZnJvbSBjb21tb24gY29kZQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAtI2luY2x1
ZGUgInFlbXUvaG9zdC11dGlscy5oIg0KPiAtI2luY2x1ZGUgInFlbXUvdGhyZWFkLmgiDQo+
IC0jaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4gLSNpbmNsdWRlICJleGVjL2h3YWRkci5o
Ig0KPiAtI2VuZGlmDQo+IC0jaW5jbHVkZSAiZXhlYy9tZW1hdHRycy5oIg0KPiAtI2luY2x1
ZGUgImh3L2NvcmUvY3B1LmgiDQo+IC0NCj4gICAjaW5jbHVkZSAiY3B1LXBhcmFtLmgiDQo+
ICAgDQo+ICAgI2lmbmRlZiBUQVJHRVRfTE9OR19CSVRTDQoNClJldmlld2VkLWJ5OiBQaWVy
cmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
