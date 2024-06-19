Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1446399ejb;
        Wed, 19 Jun 2024 08:06:28 -0700 (PDT)
X-Received: by 2002:a17:902:c951:b0:1f7:12f3:b975 with SMTP id d9443c01a7336-1f9aa4508f1mr33213115ad.43.1718809588203;
        Wed, 19 Jun 2024 08:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718809588; cv=none;
        d=google.com; s=arc-20160816;
        b=BnGD6/3eZWDO6tGMbHKhXSy7dP04Ua+WA2Gxw4RKPVxuNhj4h8WuhEJ1D3kj7jULxh
         Pxj4xA8+KSsD04+IsQ0KpeIwfqmmlDYGC3Uhv3KLIAj0Rh79vHkQ2A5OZX/9cCBR/PXA
         UOxHLLSIbt3tGl+ypGtqLYduPuMX4kSMvF+B2BJsG9Yrg0B71CfTpUl3WQRpI/NEO+RB
         Iv+ZnMZgpr4bKnOan9rvXNBRrc3z6aQSLDeyk8KzEmJEBTKnXA4zMM1JXpYjsIHM3laO
         8k3LUmd7v4oO0M44jLB2siOO92STiFSN3HGqyHWANUGfdj7ubBcA8SAOcl0+3HQl4LyP
         2fqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=53ccK+CjnnoeqgwrzL2MP2JpY9KmQHqgB9vFIPTJVYc=;
        fh=OhY8Qz5Jy2LMvlSPrne2bIxXcEjgBukkEgQOhr7vfHQ=;
        b=Bcj8S7hHyNt67t1M8fEKJoi3yEyq20xPSD0O2BALLdtD/vWEYaZBAwwR9ksYHbpM+I
         tf78qXTymQPWaSHs6l6LUD6c67gQG9cJbWr9EaER4EAfzwd+TeV4F4CrFVHkhq7dO2qh
         uhU+otBlPnRQQAaDvwCNEtlGMx78HZMGXcsMUf2F7XtuovMqj1sCu6k76wwoho8cyvLT
         qb7fzkKrsLTKyA834SBnPNCZGPxhCgQM1A2EsCXO1L05OJCqJEb+u4tct5w4tt0GCO0f
         LJ/o9gy0AgQja+b7qcvHsdyOtF9dodsmjiJuZ9hMfNihabHtnaV8Yg/e3BNlOU7t4Fqe
         BsNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LECVkpXW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1f9a0ee5857sor18250445ad.7.2024.06.19.08.06.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Jun 2024 08:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LECVkpXW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718809586; x=1719414386; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53ccK+CjnnoeqgwrzL2MP2JpY9KmQHqgB9vFIPTJVYc=;
        b=LECVkpXWBELd4luGNrrlansiDxom/GsnROH3W/axNXfy5PTBpojoei1se/hgk1y6gV
         eM0MCrrvwSsgjczelzkdc3gml4xYkL1xK8dyhTv5YJx1QqxCCF2HUH7GYufooUkfPUvI
         52/dZ0J3zAF+YEqM7SAj3TUEFctJqtMvNiefwPdt++4hji42q4ZvzqiDDZK+46SUxcS/
         lZywrwsnAZ0CO3UtKu4XNaUIQ5bwKcIj1TISbjH4VTgxD5jF1kjWO5yU2qqbheU+VoqH
         68iFv3n+nQlNEO2OG6J+ro2PQY01k0Rs8/SC4alBAG+lqVdOmZdk7P/jUYv9BF1Irfpl
         TbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718809586; x=1719414386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53ccK+CjnnoeqgwrzL2MP2JpY9KmQHqgB9vFIPTJVYc=;
        b=Tg5O4id/5V6EcTSOeBTim7znkTrT/nfXWVqLFhlWBKxUC1C3ApyQuGMbBgQN1/TtHp
         FOdZI/tazKZQgbFg9MKtnU7Fgdp1xkpEQwTgG+b/siRiKDJq5Oa9lfI94JYB2xUUyxTe
         lhabbwoECyyrKUrX01g5HWV4QM0mbcXh7d4UmJ9iMYE3fYHXE/whfoBoSBtBJWnSIkz5
         WdTabzEj0jpI7hYqJt1uJ6L/LXGcAZ85nSHRnkiGHzkD1/Q4WJKdMo4n4cts25Ow7L5e
         sVyG6CPVtJrodh376Fn3zWbfHCBHbbb3+W2NnkoComWBWRCB69ebwZNrXk/HsouFkJjj
         gB1A==
X-Gm-Message-State: AOJu0YxE50kbP4LEK5sjw8bO67XnOl6uTzrOz0iyubu5CDx3g1Wxv1J/
	4fy3Q3ulb5bQNSL3uCN1QrjyLQJ12I2tJCHCtFFoSSyrcLiU9Lkvd66Jz/DZVm1rxWHBpiwwVZO
	t+aiMpQ==
X-Google-Smtp-Source: AGHT+IEKSMPfsUN7rJwC84JD0vEhzz1T9Cqgy0kPSP6eSjrW7wTRT3cMKKmdmSZQ03B2BtAQgWO1yg==
X-Received: by 2002:a17:902:dac6:b0:1f7:ff:b477 with SMTP id d9443c01a7336-1f9aa44fc25mr23739125ad.55.1718809583896;
        Wed, 19 Jun 2024 08:06:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55e48sm118123385ad.37.2024.06.19.08.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 08:06:23 -0700 (PDT)
Message-ID: <b2975c54-2752-4375-a5ad-13a21f8dde14@linaro.org>
Date: Wed, 19 Jun 2024 08:06:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-10-alex.bennee@linaro.org>
 <ZmoM2Sac97PdXWcC@gallifrey>
 <777e1b13-9a4f-4c32-9ff7-9cedf7417695@linaro.org>
 <Zmy9g1U1uP1Vhx9N@gallifrey>
 <616df287-a167-4a05-8f08-70a78a544929@linaro.org>
 <ZnCi4hcyR8wMMnK4@gallifrey>
 <4e5fded0-d1a9-4494-a66d-6488ce1bcb33@linaro.org>
 <874j9qefv0.fsf@draig.linaro.org>
 <78003bee-08f7-4860-a675-b09721955e60@linaro.org>
 <87jzilcleh.fsf@draig.linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87jzilcleh.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: rsSRkgb/gLKu

T24gNi8xOS8yNCAwMjo0OSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiA2
LzE4LzI0IDAyOjUzLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4gUGllcnJpY2sgQm91dmll
ciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+Pj4NCj4+Pj4gT24g
Ni8xNy8yNCAxMzo1NiwgRHIuIERhdmlkIEFsYW4gR2lsYmVydCB3cm90ZToNCj4+Pj4+ICog
UGllcnJpY2sgQm91dmllciAocGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnKSB3cm90ZToN
Cj4+Pj4+PiBPbiA2LzE0LzI0IDE1OjAwLCBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IHdyb3Rl
Og0KPj4+Pj4+PiAqIFBpZXJyaWNrIEJvdXZpZXIgKHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZykgd3JvdGU6DQo+Pj4+Pj4+PiBIaSBEYXZlLA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IE9u
IDYvMTIvMjQgMTQ6MDIsIERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgd3JvdGU6DQo+Pj4+Pj4+
Pj4gKiBBbGV4IEJlbm7DqWUgKGFsZXguYmVubmVlQGxpbmFyby5vcmcpIHdyb3RlOg0KPj4+
Pj4+Pj4+PiBGcm9tOiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc+DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFRoaXMgcGx1Z2luIHVzZXMgdGhlIG5l
dyB0aW1lIGNvbnRyb2wgaW50ZXJmYWNlIHRvIG1ha2UgZGVjaXNpb25zDQo+Pj4+Pj4+Pj4+
IGFib3V0IHRoZSBzdGF0ZSBvZiB0aW1lIGR1cmluZyB0aGUgZW11bGF0aW9uLiBUaGUgYWxn
b3JpdGhtIGlzDQo+Pj4+Pj4+Pj4+IGN1cnJlbnRseSB2ZXJ5IHNpbXBsZS4gVGhlIHVzZXIg
c3BlY2lmaWVzIGFuIGlwcyByYXRlIHdoaWNoIGFwcGxpZXMNCj4+Pj4+Pj4+Pj4gcGVyIGNv
cmUuIElmIHRoZSBjb3JlIHJ1bnMgYWhlYWQgb2YgaXRzIGFsbG9jYXRlZCBleGVjdXRpb24g
dGltZSB0aGUNCj4+Pj4+Pj4+Pj4gcGx1Z2luIHNsZWVwcyBmb3IgYSBiaXQgdG8gbGV0IHJl
YWwgdGltZSBjYXRjaCB1cC4gRWl0aGVyIHdheSB0aW1lIGlzDQo+Pj4+Pj4+Pj4+IHVwZGF0
ZWQgZm9yIHRoZSBlbXVsYXRpb24gYXMgYSBmdW5jdGlvbiBvZiB0b3RhbCBleGVjdXRlZCBp
bnN0cnVjdGlvbnMNCj4+Pj4+Pj4+Pj4gd2l0aCBzb21lIGFkanVzdG1lbnRzIGZvciBjb3Jl
cyB0aGF0IGlkbGUuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBBIGZldyByYW5kb20gdGhvdWdo
dHM6DQo+Pj4+Pj4+Pj4gICAgICAgIGEpIEFyZSB0aGVyZSBhbnkgZGVmaW5pdGlvbnMgb2Yg
d2hhdCBhIHBsdWdpbiB0aGF0IGNvbnRyb2xzIHRpbWUNCj4+Pj4+Pj4+PiAgICAgICAgICAg
c2hvdWxkIGRvIHdpdGggYSBsaXZlIG1pZ3JhdGlvbj8NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJ
dCdzIG5vdCBzb21ldGhpbmcgdGhhdCB3YXMgY29uc2lkZXJlZCBhcyBwYXJ0IG9mIHRoaXMg
d29yay4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhhdCdzIE9LLCB0aGUgb25seSB0aGluZyBpcyB3
ZSBuZWVkIHRvIHN0b3AgYW55b25lIGZyb20gaGl0dGluZyBwcm9ibGVtcw0KPj4+Pj4+PiB3
aGVuIHRoZXkgZG9uJ3QgcmVhbGlzZSBpdCdzIG5vdCBiZWVuIGFkZHJlc3NlZC4NCj4+Pj4+
Pj4gT25lIHdheSBtaWdodCBiZSB0byBhZGQgYSBtaWdyYXRpb24gYmxvY2tlcjsgc2VlIGlu
Y2x1ZGUvbWlncmF0aW9uL2Jsb2NrZXIuaA0KPj4+Pj4+PiB0aGVuIHlvdSBtaWdodCBwcmlu
dCBzb21ldGhpbmcgbGlrZSAnTWlncmF0aW9uIG5vdCBhdmFpbGFibGUgZHVlIHRvIHBsdWdp
biAuLi4uJw0KPj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gU28gYmFzaWNhbGx5LCB3ZSBjb3Vs
ZCBtYWtlIGEgY2FsbCB0byBtaWdyYXRlX2FkZF9ibG9ja2VyKCksIHdoZW4gc29tZW9uZQ0K
Pj4+Pj4+IHJlcXVlc3QgdGltZV9jb250cm9sIHRocm91Z2ggcGx1Z2luIEFQST8NCj4+Pj4+
Pg0KPj4+Pj4+IElNSE8sIGl0J3Mgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIHBhcnQgb2Yg
cGx1Z2luIEFQSSAoaWYgYW55IHBsdWdpbiBjYWxscw0KPj4+Pj4+IHFlbXVfcGx1Z2luX3Jl
cXVlc3RfdGltZV9jb250cm9sKCkpLCBpbnN0ZWFkIG9mIHRoZSBwbHVnaW4gY29kZSBpdHNl
bGYuIFRoaXMNCj4+Pj4+PiB3YXksIGFueSBwbHVnaW4gZ2V0dGluZyB0aW1lIGNvbnRyb2wg
YXV0b21hdGljYWxseSBibG9ja3MgYW55IHBvdGVudGlhbA0KPj4+Pj4+IG1pZ3JhdGlvbi4N
Cj4+Pj4+IE5vdGUgbXkgcXVlc3Rpb24gYXNrZWQgZm9yIGEgJ2FueSBkZWZpbml0aW9ucyBv
ZiB3aGF0IGEgcGx1Z2luIC4uJyAtDQo+Pj4+PiBzbw0KPj4+Pj4geW91IGNvdWxkIGRlZmlu
ZSBpdCB0aGF0IHdheSwgYW5vdGhlciBvbmUgaXMgdG8gdGhpbmsgdGhhdCBpbiB0aGUgZnV0
dXJlDQo+Pj4+PiB5b3UgbWF5IGFsbG93IGl0IGFuZCB0aGUgcGx1Z2luIHNvbWVob3cgaW50
ZXJhY3RzIHdpdGggbWlncmF0aW9uIG5vdCB0bw0KPj4+Pj4gY2hhbmdlIHRpbWUgYXQgY2Vy
dGFpbiBtaWdyYXRpb24gcGhhc2VzLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gSSB3b3VsZCBiZSBp
biBmYXZvciB0byBmb3JiaWQgdXNhZ2UgZm9yIG5vdyBpbiB0aGlzIGNvbnRleHQuIEknbSBu
b3QNCj4+Pj4gc3VyZSB3aHkgcGVvcGxlIHdvdWxkIHBsYXkgd2l0aCBtaWdyYXRpb24gYW5k
IHBsdWdpbnMgZ2VuZXJhbGx5IGF0DQo+Pj4+IHRoaXMgdGltZSAodGhlcmUgbWlnaHQgYmUg
ZXhwZXJpbWVudHMgb3IgdXNlIGNhc2VzIEknbSBub3QgYXdhcmUgb2YpLA0KPj4+PiBzbyBh
IHNpbXBsZSBiYXJyaWVyIHByZXZlbnRpbmcgdGhhdCBzZWVtcyBvay4NCj4+Pj4NCj4+Pj4g
VGhpcyBwbHVnaW4gaXMgcGFydCBvZiBhbiBleHBlcmltZW50IHdoZXJlIHdlIGltcGxlbWVu
dCBhIHFlbXUgZmVhdHVyZQ0KPj4+PiAoaWNvdW50PWF1dG8gaW4gdGhpcyBjYXNlKSBieSB1
c2luZyBwbHVnaW5zLiBJZiBpdCB0dXJucyBpbnRvIGENCj4+Pj4gc3VjY2Vzc2Z1bCB1c2Fn
ZSBhbmQgdGhpcyBwbHVnaW4gYmVjb21lcyBwb3B1bGFyLCB3ZSBjYW4gYWx3YXlzIGxpZnQN
Cj4+Pj4gdGhlIGxpbWl0YXRpb24gbGF0ZXIuDQo+Pj4+DQo+Pj4+IEBBbGV4LCB3b3VsZCB5
b3UgbGlrZSB0byBhZGQgdGhpcyBub3cgKGljb3VudD1hdXRvIGlzIHN0aWxsIG5vdA0KPj4+
PiByZW1vdmVkIGZyb20gcWVtdSksIG9yIHdhaXQgZm9yIGludGVncmF0aW9uLCBhbmQgYWRk
IHRoaXMgYXMgYW5vdGhlcg0KPj4+PiBwYXRjaD8NCj4+PiBJIHRoaW5rIHdlIGZvbGxvdyB0
aGUgZGVwcmVjYXRpb24gcHJvY2VzcyBzbyBvbmNlIGludGVncmF0ZWQgd2UgcG9zdA0KPj4+
IGENCj4+PiBkZXByZWNhdGlvbiBub3RpY2UgaW46DQo+Pj4gICAgIGh0dHBzOi8vcWVtdS5y
ZWFkdGhlZG9jcy5pby9lbi9tYXN0ZXIvYWJvdXQvZGVwcmVjYXRlZC5odG1sDQo+Pj4gYW5k
IHRoZW4gcmVtb3ZlIGl0IGFmdGVyIGEgY291cGxlIG9mIHJlbGVhc2VzLg0KPj4+DQo+Pg0K
Pj4gU29ycnksIEkgd2FzIG5vdCBjbGVhci4gSSBtZWFudCBkbyB3ZSBhZGQgYSBibG9ja2Vy
IGluIGNhc2Ugc29tZW9uZQ0KPj4gdHJpZXMgdG8gbWlncmF0ZSBhIHZtIHdoaWxlIHRoaXMg
cGx1Z2luIGlzIHVzZWQ/DQo+IA0KPiBPaCB5ZXMgLSBJIGNhbiBhZGQgdGhhdCBpbiB0aGUg
Y29yZSBwbHVnaW4gY29kZS4NCj4gDQoNClRoYW5rcyENCg==
