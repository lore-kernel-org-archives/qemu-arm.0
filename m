Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3916954njk;
        Tue, 3 Dec 2024 10:24:13 -0800 (PST)
X-Received: by 2002:a05:6870:1b18:b0:29e:6814:19d with SMTP id 586e51a60fabf-29e88580153mr4518856fac.9.1733250253492;
        Tue, 03 Dec 2024 10:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733250253; cv=none;
        d=google.com; s=arc-20240605;
        b=Nm2skbswMrkU4C+drk5t2R6BY+GnKqo3m7oclh7dcP5v7poLKfh97bs8I7JudZr3nE
         wLb9wcMrXNA2RoNpkTci+hGPTVHRTXLm1lbDyaa5TmU2nR5Q94AFUmATbKyN7Yf/ma+Q
         0Ryvdxy7vRtn2rjd4TvfwUw9KPxS6fFBYLOCStUwcJoxDI1l+qlzeOtGqOfGGfZOtxXm
         iEPMhW8PrIRJ9UxlgpUpTWeHkiPuHqN7J8/KKeMqBy5YkCjnf4KxLwFwaWxGuIgeuJ2d
         ked8G5dZcuVSW5HuLfpswCWQeqsRXF4MsG7jLXNxkrfAUR4N27e40cnnzfxixn/EubCd
         dwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yRicpJhjhTpg1qPlxyavzgixO/UppNZDPdXxUR0Ay4o=;
        fh=6+YIqTWbziSJ6Y1Oq5Yc1ZZXLiqbRs0r1JGXWEm4MOA=;
        b=c14a+GM7HMAAbeE3plrh2qjSXOe/2CE0OvK2VONIZT//e/4YxNOBg6DTT63f1MCMNi
         RN7m9QwU2XoGsON7LFuzEeBdtxOSWh7aHHC3G0OL5uuBuZWK0Gn7PNMCpwHyGE37VLtE
         PpzXCjyN2QyhLV7f9KB62wZe3VdkXZEuaFBr2Wr5ygF9DwVcRbqtZuWuVh9F9xwRT+oy
         Aw47yV/g3rXOKkYHDbtqtf2i3jpvhdgQsOmO+DK+YHH6z2e9UF9dYOgCpJ+XnBC/nq6J
         HtFKGeOWitMNxfyM83Lqd1qJJtfOPFvSmd0nmflM90RKnou5r0w7I/bQ5s5maIpWNCn4
         ZpeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CJnVHcHi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c368b2asor10437070a12.8.2024.12.03.10.24.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 10:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CJnVHcHi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733250253; x=1733855053; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRicpJhjhTpg1qPlxyavzgixO/UppNZDPdXxUR0Ay4o=;
        b=CJnVHcHi2TZ76Inmmt6lwtJghzpHdSMTuyWxg/Lc1ghBShw0MwedeKg+zTt1NBOso3
         LGTq4952kuGKNwc52W5Uq/ayzNzidv/kICDG1dM9ZHFv+GneqqivzA3RrgMEJVLQvkxu
         7mNcauQncu2sKgPuJEJQNLkDXvhPekkLEKGP4l6z1O9zsx/1dneZCgSxK5klNXUhLGmB
         zHOZieNDJgRFcydndjAOkLV953DXjZZhTq8edeYTQ4BGmMYAHFY9SQ0fR8BJrn9fnUsa
         AE8A0VjzMmJwvrnVDJUfyK/ce3KhPvb6BoTqir+0niKCW9ZpqcqBNWjHhjl/7ig+E5uL
         UhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733250253; x=1733855053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRicpJhjhTpg1qPlxyavzgixO/UppNZDPdXxUR0Ay4o=;
        b=MWUb0hZw12OJAJuZcXXhKPATRBs/0C4bjbQWSsT0Rng6v0GhqNBi4Kt2embeOzRDwa
         URHc60VloJIKYrTnqOpdX3Xt1GG5gSRTQxocpT9jFZ7Cy4wstUbUFanXF31i0UxszZ7P
         QlrgbnDoNip48qXvta+lIH36Vrl7wkJCWdB+D+MD6aAtuxLGKbwkvvUP3kAGwyRL4zue
         /Dop9DIWdxp8Om5nrOPPoPtMJqlxGcyWzIehtOZgdZaSHeXlWG6THNeYpE0XoepJDJCd
         FxnKbzKx71o2gpIFS0uWhSZZJFJuIiopkr8eOPVOcLihr3K8T4lCV7+rDUv7Wnkv2seG
         wjxg==
X-Gm-Message-State: AOJu0Yw1beABE4yv258d5qDzU6oxtD/+rdQAiny8Ml+47Ch0unoUxqTg
	xbHn+wGAFb5hKpUcfvJxToCU+XsZEKyr8COR7nW/FR8BtcYHm+aT6nUed+ybdznMbN9CNSeTx9H
	J3F//YN4e
X-Gm-Gg: ASbGncvQStfKKuIcpcgvkfOL59bO1Xme120nFTztd4a3ip0APmivcc/23XsSjGkilrm
	Fhlm7MfxCv3xI9F5z+JmRjSl6hR216gwfPUr6Q4tgfE6MRqc5tED/i46hhxHKyVUpL91TJvqSRa
	udmNv9bEn8nHnqaNq3jQBwjgMWQI9UlGBXOD+zIkAmAhLL9jvtSHXuoRrLn8JRTGXyrMVAXQJSh
	zqyRyiJEI0UCSraePK/bH+b3lMD4AS8fPJ8itmcILEo9//ngpCjlBOi3GORvmmOl7p2+o7Kd9eC
	I78leWkkKZp533w4me3tPA==
X-Google-Smtp-Source: AGHT+IHuneTpULUKLV4vtUTUm6C+HlcUPz8+EYQNt0xb76hBfzxmd8whAeRj54m7FgAxWi5qX339mw==
X-Received: by 2002:a05:6a20:7f8f:b0:1e0:d333:2b9d with SMTP id adf61e73a8af0-1e1653c5227mr5661048637.22.1733250252997;
        Tue, 03 Dec 2024 10:24:12 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee769580dasm6996311a91.19.2024.12.03.10.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 10:24:12 -0800 (PST)
Message-ID: <8c10de63-f81f-4f51-9040-b25116e3545c@linaro.org>
Date: Tue, 3 Dec 2024 10:24:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <87mshcdddn.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87mshcdddn.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: PqNuPWpyQ7cU

T24gMTIvMy8yNCAwNjo1NiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBUaGlz
IGJvb3QgYW4gT1AtVEVFIGVudmlyb25tZW50LCBhbmQgbGF1bmNoIGEgbmVzdGVkIGd1ZXN0
IFZNIGluc2lkZSBpdA0KPj4gdXNpbmcgdGhlIFJlYWxtcyBmZWF0dXJlLiBXZSBkbyBpdCBm
b3IgdmlydCBhbmQgc2JzYS1yZWYgcGxhdGZvcm1zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+DQo+
IDxzbmlwPg0KPj4gKw0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWFjY2VsJywg
J3RjZycpDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCctY3B1JywgJ21heCx4LXJt
ZT1vbicpDQo+IA0KPiBXaXRoIGRlYnVnIG9uIHRoZSBQQUMgZnVuY3Rpb24gYXJlIGNlcnRh
aW5seSB2ZXJ5IGhpZ2ggaW4gdGhlIHBlcmYNCj4gcmVwb3J0LiBTbyBwYXV0aC1pbXBkZWY9
b24gc2VlbXMgd29ydGh3aGlsZSBoZXJlLg0KPiANCj4+ICsgICAgICAgIHNlbGYudm0uYWRk
X2FyZ3MoJy1tJywgJzJHJykNCj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1NJywg
J3Nic2EtcmVmJykNCj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1kcml2ZScsIGYn
ZmlsZT17cGZsYXNoMH0sZm9ybWF0PXJhdyxpZj1wZmxhc2gnKQ0KPj4gKyAgICAgICAgc2Vs
Zi52bS5hZGRfYXJncygnLWRyaXZlJywgZidmaWxlPXtwZmxhc2gxfSxmb3JtYXQ9cmF3LGlm
PXBmbGFzaCcpDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCctZHJpdmUnLCBmJ2Zp
bGU9ZmF0OnJ3Ont2aXJ0dWFsfSxmb3JtYXQ9cmF3JykNCj4+ICsgICAgICAgIHNlbGYudm0u
YWRkX2FyZ3MoJy1kcml2ZScsIGYnZm9ybWF0PXJhdyxpZj1ub25lLGZpbGU9e2RyaXZlfSxp
ZD1oZDAnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWRldmljZScsICd2aXJ0
aW8tYmxrLXBjaSxkcml2ZT1oZDAnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygn
LWRldmljZScsICd2aXJ0aW8tOXAtcGNpLGZzZGV2PXNocjAsbW91bnRfdGFnPXNocjAnKQ0K
Pj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWZzZGV2JywgZidsb2NhbCxzZWN1cml0
eV9tb2RlbD1ub25lLHBhdGg9e3JtZV9zdGFja30saWQ9c2hyMCcpDQo+PiArICAgICAgICBz
ZWxmLnZtLmFkZF9hcmdzKCctZGV2aWNlJywgJ3ZpcnRpby1uZXQtcGNpLG5ldGRldj1uZXQw
JykNCj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1uZXRkZXYnLCAndXNlcixpZD1u
ZXQwJykNCj4gPHNuaXA+DQo+PiArDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCct
YWNjZWwnLCAndGNnJykNCj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1jcHUnLCAn
bWF4LHgtcm1lPW9uJykNCj4gDQo+IEFuZCBoZXJlLg0KPiANCj4gPHNuaXA+DQo+IA0KPiBX
aXRoIHRoYXQgdGhlIHRlc3RzIGJvdGggcGFzcyB3aXRoIC0tZW5hYmxlLWRlYnVnICgzMTJz
LCAzNTJzKSBhbmQgdGhlDQo+IHByb2ZpbGUgbG9va3MgbGlrZToNCj4gDQo+ICAgICA2LjMz
JSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11LXN5c3RlbS1hYXJjaDY0ICAgICAgICAgICAgICAg
ICAgICAgICBbLl0gYXJtX2ZlYXR1cmUNCj4gICAgIDUuNjYlICBxZW11LXN5c3RlbS1hYXIg
IHFlbXUtc3lzdGVtLWFhcmNoNjQgICAgICAgICAgICAgICAgICAgICAgIFsuXSB0Y2dfZmx1
c2hfam1wX2NhY2hlDQo+ICAgICAzLjQ0JSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11LXN5c3Rl
bS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gcmVidWlsZF9oZmxhZ3NfYTY0
DQo+IA0KPiBUaGlzIEkgc3VzcGVjdCBpcyB0cmlnZ2VyZWQgYnkgYXNzZXJ0X2hmbGFnc19y
ZWJ1aWxkX2NvcnJlY3RseSgpIHdoaWNoDQo+IGlzIHZhbGlkYXRpbmcgd2UndmUgbm90IHNr
aXBwZWQgcmVidWlsZGluZyB0aGUgZmxhZ3Mgd2hlbiB3ZSBuZWVkIHRvLg0KPiBJdCdzIGEg
bG90IGVhc2llciB0aGFuIGRlYnVnZ2luZyB3aHkgeW91ciBleGVjdXRpb24gdHJhY2UgbG9v
a3Mgd2VpcmQuDQo+IA0KPiAgICAgMi45NSUgIHFlbXUtc3lzdGVtLWFhciAgcWVtdS1zeXN0
ZW0tYWFyY2g2NCAgICAgICAgICAgICAgICAgICAgICAgWy5dIGV4dHJhY3Q2NA0KPiAgICAg
Mi41MiUgIHFlbXUtc3lzdGVtLWFhciAgcWVtdS1zeXN0ZW0tYWFyY2g2NCAgICAgICAgICAg
ICAgICAgICAgICAgWy5dIGV4dHJhY3Q2NA0KPiANCj4gVGhpcyBpcyB1c3VhbGx5IHRyaWdn
ZXJlZCBieSB0cmFuc2xhdGlvbiBjb2RlIHdoaWNoIHVzZXMgZXh0cmFjdDY0DQo+IGhlYXZp
bHkgZHVyaW5nIGluc3RydWN0aW9uIGRlY29kZS4NCj4gDQo+IEl0IG1pZ2h0IGJlIHVzZWZ1
bCB0byBzZWUgaWYgd2UgY2FuIGdldCBmdW5jdGlvbmFsIHRlc3RzIHJ1biB1bmRlciBUQ0cN
Cj4gdG8gZHVtcCAiaW5mbyBqaXQiIGF0IHRoZSBlbmQgYW5kIGVuc3VyZSB3ZSBhcmUgbm90
IG92ZXIgZ2VuZXJhdGluZyBjb2RlDQo+IGFuZCBleGhhdXN0aW5nIHRoZSB0cmFuc2xhdGlv
biBjYWNoZS4NCj4gDQo+ICAgICAyLjEyJSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11LXN5c3Rl
bS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gYXJtX2VsX2lzX2FhNjQNCj4g
ICAgIDIuMTElICBxZW11LXN5c3RlbS1hYXIgIHFlbXUtc3lzdGVtLWFhcmNoNjQgICAgICAg
ICAgICAgICAgICAgICAgIFsuXSBhcm1fc2VjdXJpdHlfc3BhY2VfYmVsb3dfZWwzDQo+ICAg
ICAyLjExJSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11LXN5c3RlbS1hYXJjaDY0ICAgICAgICAg
ICAgICAgICAgICAgICBbLl0gZGVwb3NpdDY0DQo+ICAgICAxLjQ5JSAgcWVtdS1zeXN0ZW0t
YWFyICBxZW11LXN5c3RlbS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gYXJt
X2hjcl9lbDJfZWZmX3NlY3N0YXRlDQo+ICAgICAxLjQ2JSAgcWVtdS1zeXN0ZW0tYWFyICBx
ZW11LXN5c3RlbS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gYXJtX2lzX2Vs
Ml9lbmFibGVkX3NlY3N0YXRlDQo+ICAgICAxLjM4JSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11
LXN5c3RlbS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gZXh0cmFjdDMyDQo+
ICAgICAxLjM0JSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11LXN5c3RlbS1hYXJjaDY0ICAgICAg
ICAgICAgICAgICAgICAgICBbLl0gZXh0cmFjdDY0DQo+ICAgICAxLjMwJSAgcWVtdS1zeXN0
ZW0tYWFyICBxZW11LXN5c3RlbS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0g
Z2V0X3BoeXNfYWRkcl9scGFlDQo+ICAgICAxLjIzJSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11
LXN5c3RlbS1hYXJjaDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gYWE2NF92YV9wYXJh
bWV0ZXJzDQo+ICAgICAxLjA5JSAgcWVtdS1zeXN0ZW0tYWFyICBxZW11LXN5c3RlbS1hYXJj
aDY0ICAgICAgICAgICAgICAgICAgICAgICBbLl0gcm9sMzINCj4gICAgIDEuMDclICBxZW11
LXN5c3RlbS1hYXIgIHFlbXUtc3lzdGVtLWFhcmNoNjQgICAgICAgICAgICAgICAgICAgICAg
IFsuXSBwcm9iZV9hY2Nlc3NfaW50ZXJuYWwNCj4gICAgIDEuMDIlICBxZW11LXN5c3RlbS1h
YXIgIHFlbXUtc3lzdGVtLWFhcmNoNjQgICAgICAgICAgICAgICAgICAgICAgIFsuXSBkZXBv
c2l0MzINCj4gDQo+IA0KDQpUaGFua3MgQWxleC4NCg0KSSBkaWQgdGhlIHNhbWUgaW52ZXN0
aWdhdGlvbiwgYW5kIHN3aXRjaGluZyB0byBwYXV0aC1pbXBkZWYgYnJpbmdzIGRvd24gDQp0
aW1lIGZyb20gMTUwMHMgdG8gYSBtb3JlICJhY2NlcHRhYmxlIiA0NTBzIG9uIG15IG1hY2hp
bmUuDQpJbiBteSBwcm9maWxlICh1c2luZyBjYWxsIGdyYXBocywgd2hpY2ggSSdtIG5vdCBz
dXJlIHlvdSB1c2VkKSwgSSANCm9ic2VydmUgdGhhdCAyNiUgb2YgdGhlIHRpbWUgaXMgc3Bl
bnQgaW4gDQphc3NlcnRfaGZsYWdzX3JlYnVpbGRfY29ycmVjdGx5LCB3aGljaCBpcyBlbmFi
bGVkIGJ5IC0tZW5hYmxlLWRlYnVnLXRjZy4NCg0KSSdsbCBzZW5kIGEgdjMgc3dpdGNoaW5n
IHRvIGltcGRlZiBhbmQgaW5jcmVhc2luZyB0aGUgdGltZW91dCwgc2hvdWxkIGJlIA0KZW5v
dWdoIGZvciB0aGlzIHRpbWUuDQoNClBpZXJyaWNrDQo=
