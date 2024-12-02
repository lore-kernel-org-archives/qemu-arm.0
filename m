Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3105936njk;
        Mon, 2 Dec 2024 10:36:09 -0800 (PST)
X-Received: by 2002:a05:6a21:3947:b0:1d9:c4e0:140c with SMTP id adf61e73a8af0-1e0e0ac31d1mr32286516637.1.1733164569195;
        Mon, 02 Dec 2024 10:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733164569; cv=none;
        d=google.com; s=arc-20240605;
        b=OElw3wXvVTXZFAat2TuTIL+PuDJ3ZHRkUMNWDaPNobWVamCDocgHVWozHh6UbexiYl
         PTtdb/6E01MeeZ8ZCZZp1Js5vr828HWh32c7GPyNXAF2fmTooxe5xaEfUPZcS/SDqomg
         EE5wanmqPRmxEnDQwfLonlDGTLRq+5d/HBpJyLey9mS826aFoKjEMj8yCwHO6tGTXALn
         8S5hj1rW9In4iy1LBOXKkS8Web+sIKpywWHM/iNslb+QMShRE9hxp5qjz62m95uld8rZ
         nuagEBl5BJu4zByTk75d/PHEjVkESlHJE2/DewcZQ+GITFHUVlfmdhDBjrEp8QNW/y7X
         6/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oivYi+ksQkL9zqgH9QocSn+LXHGuCHFx2hL505Chc9I=;
        fh=QdoAlgt1GTWiBy8XY2eKDHfz5/vWXvnkz6f6iJJ9E1c=;
        b=DFDCoiVhs1tGLWWKf3+XGNG3XxBJnOV5MoIWJh21ECxPwLeoOEHDT3FoCdnz8B8jGc
         oXTG7adI+/Eg+0yJVDOSQ2/CoY+jI0nJr1qXWRHs0rhIAMT2o8KBuziKpR5MAAKSDVDI
         Tx+QRjcIcF5QzE9EyPhAV5OCmcnLi6YxvVurfP5JVnViS5rCai+NM6itNRf7j/S44A4C
         Esu9MdilLxutXwIdeUcxAYdT6QthtYI4XgpJcOP4DDScQUG4WXLq6eTL+PIv4527Jh0Z
         9aM9isX5J0g6OX8/rZi1h6wnIESy0GtAh6qBXzo6sm391KWAHQ1pYIlRqOnvKE8q7ZEG
         gtVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lcGkVdtU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c353be0sor6049628a12.9.2024.12.02.10.36.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 10:36:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lcGkVdtU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733164569; x=1733769369; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oivYi+ksQkL9zqgH9QocSn+LXHGuCHFx2hL505Chc9I=;
        b=lcGkVdtU3xUhE8L2JxCo4UZ2QAJ92RpkTzYa8FQ9lVlwbvU26HFuscPirlSIbCwcFk
         0Mx9HMZGu0J/8ZycstpvnABb3JAU7q6eJok5gtLgswWoet7d/8DMvzi7sjMl7EdpBA0I
         OCXsgCf9TNnz9FRhLJMwq9w2lhRJhGTxldxboYdfOTg4uFoaW+yb/KZw/9KopdltfCxh
         t72ivF+zLifgnVK9Xhx1gJYmilnBKWS1OJglktOmIYOtUhKYUDrXIwKjqJ1/R+JSYqBo
         zLtS57KJ/CLX3CIiXj219mN3ypoDtjWV7gYRcjEhangkTLu9XRzT85TiJ++9e+Yu8h99
         /9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733164569; x=1733769369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oivYi+ksQkL9zqgH9QocSn+LXHGuCHFx2hL505Chc9I=;
        b=pp6C/R+qxRDNliAZj0xn/PcWyt20+gAJ0xi+HGRoPwgO08wie7IVh0LJxiOr+MV3dn
         qvgbA5xAL8+vRgSvpyb9hn5qzl3msgcfINc3eyQ8X3lZlMDKf281h+iLwhw9EuMJpMso
         p3MUDY2avnGxOqUiMXRYb3ucZwnh8KRL85+ZXJ2Kfq1Y5JyiLQyFui+eJYeg2NwzRmVn
         JGq3huP3i7NZeeS6s1aatrDkrIOxKGC6d+WncwbhWUEpjNFxIDkESAun/GCb7pRW3IJw
         vUxmBQVzTjIm9o1oSScPcZxsLBO0f/J+gPPfy8HPLVPVWpWt+1kxWJBlv2E0yrdhr0Zf
         1Smg==
X-Gm-Message-State: AOJu0YwVrtNqHDYxx+pobBEBEqMFUvUXy0MzVOwsMWrb4CgP65ZpX6jI
	vIf4u5Ego+ajTzkVdnLo3c8J+0a5DS9Lg2UvwpBP0nMO8+wQ34QR6HV55ELDHH0rBh0aApUjtNo
	881PK4giV
X-Gm-Gg: ASbGncvTxeUsL8apKkUODkf43mvyn1HtqoIdAccv8rDSK8ZwOX6RUr+Itxz/vQ3TVYG
	GG3JGo3so4IlP7NuhKveV1BtgfqOwaZoB0olN/uBB9BV/a5A1OVmBKmBYVJHjd/RHUn9AssqxNM
	lkXK8GCUoBquFHS3v6A5V8qdcpel7aYNPfiTZ3/+o+lFd4CbOaO4F//3CmZxw3Rem6pIoLq12iY
	Bvs3B7XpRXu1/s3mPEjj6SDXeGhjsQhSKt44kimzLhDzsyHSeTnMepsqnGDu6AQZ9lgjoU8qP6x
	UKc5YIbQmKfKzZiLa1jSnA==
X-Google-Smtp-Source: AGHT+IFEI0IPcpn3W47lqoMIQGPFLqP1rC8pv6/veul69ZM4PKM0kHe9IgYQfWMXFy7R93sbjm+bjA==
X-Received: by 2002:a05:6a20:2583:b0:1e0:d380:fe71 with SMTP id adf61e73a8af0-1e0e09e2467mr34719207637.0.1733164568560;
        Mon, 02 Dec 2024 10:36:08 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fba22sm8827623b3a.113.2024.12.02.10.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 10:36:08 -0800 (PST)
Message-ID: <a26e2a3d-d915-4e84-9b8e-dd5935049f31@linaro.org>
Date: Mon, 2 Dec 2024 10:36:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
 <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
 <87ser6c5be.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87ser6c5be.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: quQvB2z7m88h

T24gMTIvMi8yNCAxMDoyMywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiAx
Mi8yLzI0IDAyOjU3LCBQZXRlciBNYXlkZWxsIHdyb3RlOg0KPj4+IE9uIFN1biwgMSBEZWMg
MjAyNCBhdCAxODowOSwgUGllcnJpY2sgQm91dmllcg0KPj4+IDxwaWVycmljay5ib3V2aWVy
QGxpbmFyby5vcmc+IHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSBNYXJjaW4sDQo+Pj4+DQo+Pj4+
IE9uIDEyLzEvMjQgMDU6MzQsIE1hcmNpbiBKdXN6a2lld2ljeiB3cm90ZToNCj4+Pj4+IFcg
ZG5pdSAyOC4xMS4yMDI0IG8gMjI6MzcsIFBpZXJyaWNrIEJvdXZpZXIgcGlzemU6DQo+Pj4+
Pj4gVGhpcyBib290IGFuIE9QLVRFRSBlbnZpcm9ubWVudCwgYW5kIGxhdW5jaCBhIG5lc3Rl
ZCBndWVzdCBWTSBpbnNpZGUgaXQNCj4+Pj4+PiB1c2luZyB0aGUgUmVhbG1zIGZlYXR1cmUu
IFdlIGRvIGl0IGZvciB2aXJ0IGFuZCBzYnNhLXJlZiBwbGF0Zm9ybXMuDQo+Pj4+Pj4NCj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVy
QGxpbmFyby5vcmc+DQo+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS90ZXN0cy9mdW5jdGlv
bmFsL21lc29uLmJ1aWxkIGIvdGVzdHMvZnVuY3Rpb25hbC9tZXNvbi5idWlsZA0KPj4+Pj4+
IGluZGV4IDVjMDQ4Y2ZhYzZkLi5iOTc1YTE1NjBkZiAxMDA2NDQNCj4+Pj4+PiAtLS0gYS90
ZXN0cy9mdW5jdGlvbmFsL21lc29uLmJ1aWxkDQo+Pj4+Pj4gKysrIGIvdGVzdHMvZnVuY3Rp
b25hbC9tZXNvbi5idWlsZA0KPj4+Pj4+IEBAIC0xMyw2ICsxMyw4IEBAIGVuZGlmDQo+Pj4+
Pj4gICAgICB0ZXN0X3RpbWVvdXRzID0gew0KPj4+Pj4+ICAgICAgICAnYWFyY2g2NF9hc3Bl
ZWQnIDogNjAwLA0KPj4+Pj4+ICAgICAgICAnYWFyY2g2NF9yYXNwaTQnIDogNDgwLA0KPj4+
Pj4NCj4+Pj4+PiArICAnYWFyY2g2NF9ybWVfdmlydCcgOiA3MjAsDQo+Pj4+Pg0KPj4+Pj4g
VG9vayAyOTc0Ljk1cyBvbiBNMSBQcm8gbWFjYm9vay4NCj4+Pj4+DQo+Pj4+Pj4gKyAgJ2Fh
cmNoNjRfcm1lX3Nic2FyZWYnIDogNzIwLA0KPj4+Pj4NCj4+Pj4+IFRoaXMgb25lIG5lZWRl
ZCAyMjg4LjI5cy4NCj4+Pj4+DQo+Pj4+Pj4gICAgICAgICdhYXJjaDY0X3Nic2FyZWZfYWxw
aW5lJyA6IDcyMCwNCj4+Pj4+DQo+Pj4+PiBIYXZlIHRvIGNoZWNrIGNhdXNlIHRpbWVkIG91
dC4NCj4+Pj4+DQo+Pj4+Pj4gICAgICAgICdhYXJjaDY0X3Nic2FyZWZfZnJlZWJzZCcgOiA3
MjAsDQo+Pj4+Pg0KPj4+Pj4gMzMxLjY1cw0KPj4+Pj4NCj4+Pj4+IFNvIFJNRSB0ZXN0cyBw
cm9iYWJseSBuZWVkIGxvbmdlciB0aW1lb3V0cyBvciB3b3VsZCBub3QgcnVuIGF0IGFsbC4N
Cj4+Pj4+DQo+Pj4+DQo+Pj4+IEJ5IGFueSBjaGFuY2UsIGFyZSB5b3UgcnVubmluZyB0aG9z
ZSB0ZXN0cyBpbiBkZWJ1ZyBtb2RlPw0KPj4+PiBJdCBzZWVtcyB0byBtZSB0aGF0IENJIGlz
IHJ1bm5pbmcgZnVuY3Rpb25hbCB0ZXN0cyB3aXRoIG9wdGltaXplZA0KPj4+PiBidWlsZHMs
IHNvIEknbSBub3Qgc3VyZSB3ZSB3YW50IHRvIHN1cHBvcnQgZGVidWcgInRpbWVzIiBoZXJl
Lg0KPj4+IFdlIGRvIG5lZWQgdG8gc3VwcG9ydCBkZWJ1ZyB0aW1lcywgYmVjYXVzZSBhIGNv
bW1vbiBkZXZlbG9wZXINCj4+PiB1c2UgY2FzZSBpcyAiZG9pbmcgYSBkZWJ1ZyBidWlsZCwg
cnVuICdtYWtlIGNoZWNrLWZ1bmN0aW9uYWwnDQo+Pj4gdG8gY2hlY2sgd2hldGhlciBhbnl0
aGluZyBpcyBicm9rZW4uIFRoZSBkZWJ1ZyB0aW1lcyBhbHNvDQo+Pj4gYXJlIHVzZWZ1bCBi
ZWNhdXNlIHRoZSBDSSBydW5uZXJzIGNhbiBoYXZlIGhpZ2hseSB2YXJpYWJsZQ0KPj4+IHBl
cmZvcm1hbmNlIC0tIGlmIGEgdGVzdCBpcyBzbG93IGVub3VnaCB0byBoaXQgdGhlIHRpbWVv
dXQNCj4+PiBmb3IgYSBkZWJ1ZyBidWlsZCBsb2NhbGx5LCBpdCdzIHByb2JhYmx5IGdvaW5n
IHRvIGFsc28gaGl0DQo+Pj4gdGhlIHRpbWVvdXQgYXQgbGVhc3Qgc29tZXRpbWVzIGluIENJ
Lg0KPj4+DQo+Pg0KPj4gSSB1bmRlcnN0YW5kIHRoZSBzY2VuYXJpbywgYnV0IGdpdmVuIGhv
dyBzbG93IGRlYnVnIGJ1aWxkcyBhcmUsIGl0DQo+PiB3b3VsZCBwcm9iYWJseSBiZSBmYXN0
ZXIgdG8gYWR2aXNlIGRldmVsb3BlciB0byByZWNvbXBpbGUgaW4gcmVsZWFzZQ0KPj4gbW9k
ZS4NCj4+IFRoZSBvdmVyYWxsIHRpbWUgb2YgY29tcGlsZSArIHRlc3QgaXMgc2xvd2VyIHRo
YW4gd2FpdGluZyBmb3IgZGVidWcuDQo+Pg0KPj4gQmV5b25kIHVzaW5nIGEgZGVidWdnZXIs
IHdoYXQgaXMgdGhlIGFkdmFudGFnZSB0byBjb21waWxlIHdpdGggLU8wPw0KPiANCj4gLS1l
bmFibGUtZGVidWcNCj4gDQo+ICAgIC0gZW5hYmxlcyAtMDAgd2l0aCAtZzMgZm9yIHN5bWJv
bHMNCj4gICAgLSBhbmQgZW5hYmxlcyBhZGRpdGlvbmFsIGNoZWNrcyB0byB2YWxpZGF0ZSBU
Q0cNCj4gDQoNCkknbSBhd2FyZSB0aGlzIGlzIHRoZSBjb21iaW5hdGlvbiBvZiBib3RoLCBh
bmQgaW5kZWVkLCBydW50aW1lIGNoZWNrcyANCmNhbiBiZSBkb25lIG9uIG9wdGltaXplZCBi
dWlsZHMgYXMgd2VsbCAoaXQncyB0aGUgY29tYmluYXRpb24gSSB1c2UgDQpwZXJzb25hbGx5
KS4NCg0KTWF5YmUgb3VyIGVuYWJsZS1kZWJ1ZyBzaG91bGQgcHJvZHVjZWQgb3B0aW1pemVk
IGJ1aWxkcyBieSBkZWZhdWx0LCBhbmQgDQp3ZSBjb3VsZCBoYXZlIGEgbmV3IC0tZW5hYmxl
LWRlYnVnLXVub3B0IGZvciB0aGUgIkkgbmVlZCB0byB1c2UgYSANCmRlYnVnZ2VyIiB1c2Ug
Y2FzZS4gV291bGQgc2F2ZSBhIGxvdCBvZiB0aW1lIGZvciBkZXZzLCBhbmQgaW4gQ0kgd2hl
cmUgDQptaW51dGVzIGFyZSBwcmVjaW91cy4NCg0KPiBZb3UgY2FuIHVzZSAtLWVuYWJsZS1k
ZWJ1Zy1pbmZvIGZvciBqdXN0IGRlYnVnIGluZm8gd2l0aG91dCB0aGUgb3ZlcmhlYWQuDQo+
IA0KPj4NCj4+PiB0aGFua3MNCj4+PiAtLSBQTU0NCj4gDQoNCg==
