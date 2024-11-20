Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4269647njc;
        Wed, 20 Nov 2024 14:05:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/xDBEiPwggODjO9mMyHigK4h0slGOg/0E1TpUT7biSclJaxi5igF/+4yNXLgACfgwhrX/nKnUtGOr9Q==@linaro.org
X-Received: by 2002:a17:902:e54e:b0:20b:951f:6dff with SMTP id d9443c01a7336-2126a25d086mr65425995ad.0.1732140344176;
        Wed, 20 Nov 2024 14:05:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732140344; cv=none;
        d=google.com; s=arc-20240605;
        b=bGq62etbAUNGQdByCNJU66p/1Xii9SWfC2BG4GEnz9RkjWHQNC0UJ3sVd71JCfsc2X
         B/Lsv0RDcwJlaxaCfRX4WIO3cQVtoiLhJRoIE7hcn3TuI624Sm+yihfuokzB3FTdikyw
         8ZfSvUx8LLQTayDgz/FllcyS/YAMcZ77ocD8BtujP430Olu9px5oOJxKwCbC9gWX+tlV
         r103UKnNdodt7aQm6JQKXjwCtGKVYwGHR3nsvQH2U3sha9oob8DXa8LSF/HJixD4aZA+
         iaKMlDM3CS/iVs4ym1VMDsm4i9jiKo3X5XOtjFYh/lfSk+Sbjc6wW6kFLwqzCwOD83Cc
         kvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O+JYJ2RSpV+n8azNHZV2UfO7z2UNTps1J9OmKTH578A=;
        fh=hwRZW5lVpgNGy0KSQVAydE8pjDqeBOgqrm1ISiVzTfY=;
        b=izsp+XrdqAF/j0Ttzgn/Fn6P4cFGmdJW+NJ39UX0Qt483I717hyL4wm2vepv1DPDWv
         JhtlU8BMMVp2fhBal9tSUJUGLcWUcf4o++B1t/fTcWybC6NSf/3xzVRr52zLE5zOiYiX
         6Ak15/YnbG00jxhno9gd3eerMlOEV1UI+sVSirqNFIvXhAXQjCTfOdrjNCjCjGWjeSdM
         Rzp0AOAd/et/hzNIwoV8cJwZYSgabI4Rw0gUX1z/EHx59t1tCtTNSSPnv7HiOCJ6thJ8
         sIpwME0XjSGRD75ccaHdCMX2H1IZ2DvIm+2D2m6H283JvPRzhurjBAckTCAaaBz5wpVz
         DadA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFqMCBmY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a55dbffsor10069663b3a.1.2024.11.20.14.05.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2024 14:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFqMCBmY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732140344; x=1732745144; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+JYJ2RSpV+n8azNHZV2UfO7z2UNTps1J9OmKTH578A=;
        b=zFqMCBmY4ttPRpiqR79iSADLxxlHCcXK2ElxRvYPIDfF8rJdvnpzkkyT4exIReSEkr
         1kuc8CJyVfc8FwXMW9wiwXEeJNmZ4lGltGx+LqtajPb2X1qpYR/TziOzNlTK1IXHpQ27
         z8mMHov92nO9W9pRhZqVFulJwRM9SSv7qLJ1TxvMK38H5AjgTX3bARDW9y5jM1Bu/FZd
         2Guj8oa/uu+4MnQEw/M0sF3QWyoYMIlV7wUq0jYVwnrjux+CTYPjCfG37uML5gsmRWik
         j3RNxVjB7DGxf4AHAOosYAuvkjo+D90M5p4puLSlMCPaf7FLbP/c9zgXhzFVrP7qLfel
         d11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732140344; x=1732745144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+JYJ2RSpV+n8azNHZV2UfO7z2UNTps1J9OmKTH578A=;
        b=MCaPCTFnJS5iVTFVuBK1UJwFeqmHbV76/BjyzOs+jnNJM5vVoDKBpsc1EzclYq/Ewm
         itnYTAZnB+o2PNtdcLm/HxSQYMauGTtZLhdKop0VxL/HAn/ZwuTuGRI9xkcI8EiwmtI0
         LWD7l7NOtihSDgS2fx+7frKJwMB7jpUKsrGkidEnXsxDibXyBNnFQY+Uynbqrg8L4IMK
         kXxWJ86D8ze5pUgCLXOTNBEJ5gKMRuxNCSXf3wS1k7OTpj2Q4/Jg0idof+oV5sXkyiWc
         mXQiEUukd1/9ZhqyB6RI+Rk9iEyAnss2W30WoOCeISUDhEps6MZ2GfGOllFpyIWGbxBy
         suPw==
X-Forwarded-Encrypted: i=1; AJvYcCUgw5VjlaZsWekqriEU6EueWOy2CHg5IQ6FdOg0izVVl2aT8qaqNjKAvCNeiHp6hrh1UKrwiVmmR/3aqg==@linaro.org
X-Gm-Message-State: AOJu0Yw6tjdnPgzVsE1DyL5AB54DY355ppZkRukd4ADvO0Nzuz1jyG2+
	8rtIfgFcNw7FPRC0XWkDsSF8yduJrcX8U9fClhTDT1gFJyBKTFIKTR/e0+6AbEGlZg==
X-Gm-Gg: ASbGnctv2upUex86S/T3wn5xeeO3kS9IILe/jdegZPA0dGdZkUgvjmHl7hH5XEkJFgJ
	rqW9s69UWk+WhJ5vCC4/koSKNgCyZMnQ+nuNrJ/nQewoK0wh79K8DRn05cA+kyuZqW5M37SQHY1
	r+E9EYwhxrkOm/Nv3afPagN/yvMkuXD3ul5/PtNPeBFC1v5aQ3iKxN0YZTWtsoydyL7KygVAZL+
	8S5jq8v0d7rhHd2N+wggL/Cwl95zBtTUUnxYck9EWTDmMEFaV9Xs8K58E3PljJXmd8JAWoaJCkW
	B2FvR/9hNCLdQZiVAyiXwA==
X-Google-Smtp-Source: AGHT+IHIoE/d2/VsSaCxXpECbw0WXOtn9UTJoVpkqghlA2/19rgLHn+9S1mpAhLjGcWL+2LdkRFcxQ==
X-Received: by 2002:a05:6a00:a06:b0:70d:265a:eec6 with SMTP id d2e1a72fcca58-724becb9567mr5966877b3a.13.1732140343523;
        Wed, 20 Nov 2024 14:05:43 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befebb58sm2140255b3a.198.2024.11.20.14.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 14:05:43 -0800 (PST)
Message-ID: <61871cc5-ebd5-483c-8971-1154551a2d9e@linaro.org>
Date: Wed, 20 Nov 2024 14:05:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] docs: add a how to section
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
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
 <20241118172357.475281-8-pierrick.bouvier@linaro.org>
 <ZzxakHNsVA9cKIyA@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ZzxakHNsVA9cKIyA@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: pUa5o2Pmcu8Y

T24gMTEvMTkvMjQgMDE6MjksIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+IE9uIE1v
biwgTm92IDE4LCAyMDI0IGF0IDA5OjIzOjU3QU0gLTA4MDAsIFBpZXJyaWNrIEJvdXZpZXIg
d3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgZG9jcy9kZXZlbC9idWlsZC1zeXN0
ZW0ucnN0IHwgICAyICsNCj4+ICAgZG9jcy9ob3ctdG8vaW5kZXgucnN0ICAgICAgIHwgMTQ2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBkb2NzL2luZGV4
LnJzdCAgICAgICAgICAgICAgfCAgIDEgKw0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDE0OSBp
bnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2hvdy10by9pbmRl
eC5yc3QNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC9idWlsZC1zeXN0ZW0ucnN0
IGIvZG9jcy9kZXZlbC9idWlsZC1zeXN0ZW0ucnN0DQo+PiBpbmRleCBkNDIwNDVhMjMyNS4u
ZGI0NDQ3ODdlMzcgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL2RldmVsL2J1aWxkLXN5c3RlbS5y
c3QNCj4+ICsrKyBiL2RvY3MvZGV2ZWwvYnVpbGQtc3lzdGVtLnJzdA0KPj4gQEAgLTEsMyAr
MSw1IEBADQo+PiArLi4gX2J1aWxkOg0KPj4gKw0KPj4gICA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+PiAgIFRoZSBRRU1VIGJ1aWxkIHN5c3RlbSBhcmNoaXRlY3R1
cmUNCj4+ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gZGlmZiAt
LWdpdCBhL2RvY3MvaG93LXRvL2luZGV4LnJzdCBiL2RvY3MvaG93LXRvL2luZGV4LnJzdA0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwLi4zYTlkNGQ3
NzdkZg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9ob3ctdG8vaW5kZXgucnN0
DQo+PiBAQCAtMCwwICsxLDE0NiBAQA0KPj4gKy4uIF9ob3ctdG86DQo+PiArDQo+PiArLS0t
LS0tDQo+PiArSG93IHRvDQo+PiArLS0tLS0tDQo+PiArDQo+PiArVGhpcyBzZWN0aW9uIG9m
IHRoZSBtYW51YWwgd2lsbCBnaXZlIHlvdSBzb21lIGNvbW1hbmRzIHRvIGRvIHZhcmlvdXMg
dGFza3Mgd2l0aA0KPj4gK1FFTVUuIEl0IGRvZXMgbm90IGludGVuZCB0byBiZSBjb21wbGV0
ZSwgYnV0IHRvIGJlIHNpbXBsZS4NCj4+ICsNCj4+ICtCdWlsZA0KPj4gKy0tLS0tDQo+PiAr
DQo+PiArRmlyc3QgeW91IG5lZWQgc2V0dXAgeW91ciBgYnVpbGQgZW52aXJvbm1lbnQgPHNl
dHVwLWJ1aWxkLWVudj5gLg0KPj4gKw0KPj4gK1RoZW4sIHlvdSBjYW4gYnVpbGQgUUVNVSB1
c2luZzoNCj4+ICsNCj4+ICs6Og0KPj4gKw0KPj4gKyAgICBnaXQgY2xvbmUgaHR0cHM6Ly9n
aXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11DQo+PiArICAgIGNkIHFlbXUNCj4+ICsgICAg
Li9jb25maWd1cmUNCj4+ICsgICAgbmluamEgLUMgYnVpbGQNCj4+ICsgICAgIyBhbGwgYmlu
YXJpZXMgYXJlIGluIC4vYnVpbGQNCj4+ICsNCj4+ICtCeSBkZWZhdWx0LCBRRU1VIGJ1aWxk
IGlzIG9wdGltaXplZC4gWW91IG1heSB3YW50IHRvIHN3aXRjaCB0byBkZWJ1ZyBidWlsZHMN
Cj4+ICtpbnN0ZWFkIChub24gb3B0aW1pemVkLCBhbmQgd2l0aCBtb3JlIHJ1bnRpbWUgY2hl
Y2tzIGVuYWJsZWQpOg0KPj4gKw0KPj4gKzo6DQo+PiArDQo+PiArICAgIC4vY29uZmlndXJl
IC0tZW5hYmxlLWRlYnVnDQo+PiArDQo+PiArSXQncyByZWNvbW1lbmRlZCB0byB1c2Ugc2Fu
aXRpemVycyB0byBjYXRjaCBpc3N1ZXMgd2hlbiBkZXZlbG9waW5nIHlvdXIgY2hhbmdlLg0K
Pj4gKw0KPj4gKzo6DQo+PiArDQo+PiArICAgIC4vY29uZmlndXJlIC0tZW5hYmxlLWFzYW4g
LS1lbmFibGUtdWJzYW4NCj4+ICsgICAgIyBPZiBjb3Vyc2UsIHlvdSBjYW4gY29tYmluZSBk
ZWJ1ZyBhbmQgc2FuaXRpemVycyBpZiBuZWVkZWQNCj4+ICsNCj4+ICtZb3UgY2FuIGZpbmQg
bW9yZSBpbmZvcm1hdGlvbiBvbiBgYnVpbGQgcGFnZSA8YnVpbGQ+YC4NCj4+ICsNCj4+ICtU
ZXN0DQo+PiArLS0tLQ0KPj4gKw0KPj4gK1FFTVUgaGFzIGEgbG90IG9mIHRlc3RzLCBtYWlu
bHkgaW4gNCBjYXRlZ29yaWVzOg0KPj4gKw0KPj4gKzo6DQo+PiArDQo+PiArICAgICMgcnVu
IHRlc3RzIHJlbGF0ZWQgdG8gVENHLiBUaGV5IGFyZSBiYXNlZCBvbiBNYWtlZmlsZXMuDQo+
PiArICAgIG1ha2UgY2hlY2stdGNnDQo+PiArICAgICMgcnVuIHN5c3RlbSB0ZXN0cywgcnVu
bmluZyBhIGZ1bGwgVk0sIHdpdGggYXZvY2FkbyBmcmFtZXdvcmsNCj4+ICsgICAgbWFrZSBj
aGVjay1hdm9jYWRvDQo+PiArICAgICMgcnVuIGZ1bmN0aW9uYWwgdGVzdHMsIHJ1bm5pbmcg
YSBmdWxsIFZNLCBpbnRlZ3JhdGVkIHdpdGggTWVzb24NCj4+ICsgICAgbWFrZSBjaGVjay1m
dW5jdGlvbmFsDQo+PiArICAgICMgcnVuIGFsbCBvdGhlciB0ZXN0cywgaW50ZWdyYXRlZCB3
aXRoIE1lc29uDQo+PiArICAgIG1ha2UgY2hlY2sNCj4+ICsNCj4+ICtZb3UgY2FuIGZpbmQg
bW9yZSBpbmZvcm1hdGlvbiBvbiBgdGVzdGluZyBwYWdlPHRlc3Rpbmc+YC4NCj4+ICsNCj4+
ICtVc2UgUUVNVQ0KPj4gKy0tLS0tLS0tDQo+PiArDQo+PiArVG8gY3JlYXRlIGEgMjAgZ2ln
YWJ5dGVzIGRpc2sgaW1hZ2UgdXNhYmxlIHdpdGggcWVtdS1zeXN0ZW06DQo+PiArDQo+PiAr
OjoNCj4+ICsNCj4+ICsgICAgcWVtdS1pbWcgY3JlYXRlIHN5c3RlbS5pbWcgMjBnDQo+PiAr
DQo+PiArVG8gcnVuIGFuIHg4Nl82NCBzeXN0ZW0gZW11bGF0ZWQsIHdpdGggNCBjcHVzLCA4
RyBvZiBtZW1vcnkgYW5kIGFuIGluc3RhbGwgaXNvOg0KPj4gKw0KPj4gKzo6DQo+PiArDQo+
PiArICAgIHFlbXUtc3lzdGVtLXg4Nl82NCAtc21wIDQgLW0gOEcgc3lzdGVtLmltZyAtY2Ry
b20gaW5zdGFsbC5pc28NCj4+ICsNCj4+ICtUbyBib290IGRpcmVjdGx5IGEgTGludXggS2Vy
bmVsOg0KPj4gKw0KPj4gKzo6DQo+PiArDQo+PiArICAgIHFlbXUtc3lzdGVtLXg4Nl82NCAt
a2VybmVsIGJ6SW1hZ2UgLWhkYSBzeXN0ZW0uaW1nIC1hcHBlbmQgInJvb3Q9L2Rldi9oZGEi
DQo+PiArDQo+PiArVG8gYm9vdCBhbiBhYXJjaDY0IHN5c3RlbSBlbXVsYXRlZCwgeW91IG5l
ZWQgdG8gc3BlY2lmeSBhIFVFRkkgYW5kIGFzc29jaWF0ZWQNCj4+ICtwZmxhc2guIE9uY2Ug
c3RhcnRlZCwgeW91IGNhbiBzd2l0Y2ggdG8gU2VyaWFsIG91dHB1dCBieSBjbGlja2luZyBv
biBWaWV3IC0+DQo+PiArU2VyaWFsMC4NCj4+ICsNCj4+ICs6Og0KPj4gKw0KPj4gKyAgICAj
IFVFRkkgY2FuIGJlIG9idGFpbmVkIGZyb20gZGViaWFuIHBhY2thZ2UgcWVtdS1lZmktYWFy
Y2g2NC4NCj4+ICsgICAgIyBGaXJzdCwgd2UgbmVlZCB0byBjb3B5IGEgZmlsZSB0byBzYXZl
IFVFRkkgdmFyaWFibGVzOg0KPj4gKyAgICAjIGNwIC91c3Ivc2hhcmUvQUFWTUYvQUFWTUZf
VkFSUy5mZCAuDQo+PiArICAgIHFlbXUtc3lzdGVtLWFhcmNoNjQgXA0KPj4gKyAgICAgICAg
LW0gOEcgXA0KPj4gKyAgICAgICAgLXNtcCA0IFwNCj4+ICsgICAgICAgIC1NIHZpcnQgXA0K
Pj4gKyAgICAgICAgLWNwdSBtYXggXA0KPj4gKyAgICAgICAgLWRldmljZSB2aXJ0aW8tYmxr
LXBjaSxkcml2ZT1yb290IFwNCj4+ICsgICAgICAgIC1kcml2ZSBpZj1ub25lLGlkPXJvb3Qs
ZmlsZT1zeXN0ZW0uaW1nIFwNCj4+ICsgICAgICAgIC1kcml2ZSBpZj1wZmxhc2gscmVhZG9u
bHk9b24sZmlsZT0vdXNyL3NoYXJlL0FBVk1GL0FBVk1GX0NPREUuZmQgXA0KPj4gKyAgICAg
ICAgLWRyaXZlIGlmPXBmbGFzaCxmaWxlPUFBVk1GX1ZBUlMuZmQgXA0KPj4gKyAgICAgICAg
LWNkcm9tIGluc3RhbGwuaXNvDQo+PiArDQo+PiArVG8gcnVuIGdpdCB1c2luZyBRRU1VIHVz
ZXItbW9kZToNCj4+ICsNCj4+ICs6Og0KPj4gKw0KPj4gKyAgICBxZW11LXg4Nl82NCAvdXNy
L2Jpbi9naXQgLS12ZXJzaW9uDQo+PiArDQo+PiArQ29udHJpYnV0ZQ0KPj4gKy0tLS0tLS0t
LS0NCj4+ICsNCj4+ICtXZSByZWNvbW1lbmQgdXNpbmcgYGdpdC1wdWJsaXNoIDxodHRwczov
L2dpdGh1Yi5jb20vc3RlZmFuaGEvZ2l0LXB1Ymxpc2g+YF8gZm9yDQo+PiArY29udHJpYnV0
aW5nLiBZb3UgbmVlZCB0byBjb25maWd1cmUgYGdpdCBzZW5kLWVtYWlsDQo+PiArPGh0dHBz
Oi8vZ2l0LXNlbmQtZW1haWwuaW8vPmBfIGZpcnN0Lg0KPj4gKw0KPj4gKzo6DQo+PiArDQo+
PiArICAgIGdpdCBjaGVja291dCAtYiBteV9mZWF0dXJlDQo+PiArICAgIC4uLiAjIGVkaXQs
IGJ1aWxkLCB0ZXN0DQo+PiArICAgICMgV2hlbiByZWFkeSB0byBzZW5kIHRoZSBzZXJpZXMu
Li4NCj4+ICsNCj4+ICsgICAgIyBBZGQgdXBzdHJlYW0gUUVNVSByZXBvIGFzIGEgcmVtb3Rl
Lg0KPj4gKyAgICBnaXQgcmVtb3RlIGFkZCB1cHN0cmVhbSBodHRwczovL2dpdGxhYi5jb20v
cWVtdS1wcm9qZWN0L3FlbXUNCj4+ICsgICAgIyBGZXRjaCBhbGwgbmV3IGNvbnRlbnQuDQo+
PiArICAgIGdpdCBmZXRjaCAtYSB1cHN0cmVhbQ0KPj4gKw0KPj4gKyAgICAjIFJlYmFzZSB5
b3VyIGJyYW5jaCBvbiB0b3Agb2YgdXBzdHJlYW0gbWFzdGVyLCBhbmQgaW5jbHVkZSBhIHNp
Z25vZmYuDQo+PiArICAgIGdpdCByZWJhc2UgLWkgdXBzdHJlYW0vbWFzdGVyIC0tc2lnbm9m
Zg0KPj4gKyAgICAjIENoZWNrIHlvdXIgcGF0Y2hlcyBhcmUgY29ycmVjdC4NCj4+ICsgICAg
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgJChnaXQgbWVyZ2UtYmFzZSB1cHN0cmVhbS9tYXN0
ZXIgSEVBRCkuLkhFQUQNCj4+ICsNCj4+ICsgICAgIyBTZW5kIHlvdXIgc2VyaWVzLCB5b3Un
bGwgYmUgZ2l2ZW4gYSBjaGFuY2UgdG8gZWRpdCBjb3ZlciBsZXR0ZXIgZm9yIGl0Lg0KPj4g
KyAgICBnaXQtcHVibGlzaA0KPj4gKw0KPj4gKyAgICAjIEFmdGVyIHJldmlldywgYW5kIG90
aGVyIGNoYW5nZXMsIHlvdSBjYW4gc2VuZCBhIHYyIHNpbXBseSBieSB1c2luZzoNCj4+ICsg
ICAgZ2l0LXB1Ymxpc2gNCj4+ICsNCj4+ICtJZiB5b3UgbmVlZCB0byBhcHBseSBsb2NhbGx5
IGFuIGV4aXN0aW5nIHNlcmllcywgeW91IGNhbiB1c2UgYGI0DQo+PiArPGh0dHBzOi8vZ2l0
aHViLmNvbS9tcmljb24vYjQ+YF8gKGluc3RhbGxhYmxlIHZpYSBwaXApIHRvIHJldHJpZXZl
IGl0Og0KPj4gKw0KPj4gKzo6DQo+PiArDQo+PiArICAgIGI0IHNoYXphbSA8c2VyaWVzX21z
Z19pZD4NCj4+ICsgICAgIyBtZXNzYWdlIGlkIGlzIGFuIGlkZW50aWZpZXIgcHJlc2VudCBp
biBlbWFpbCBzZW50Lg0KPj4gKyAgICAjIHdoZW4gdXNpbmcgcGF0Y2h3b3JrLCBpdCBpcyB0
aGUgbGFzdCBwYXJ0IG9mIGEgc2VyaWVzIHVybCAoMjAyNC4uLik6DQo+PiArICAgICMgaHR0
cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VLzIwMjQxMTE4MDIxODIwLjQ5MjgtMS1qb2VsQGptcy5p
ZC5hdS8NCj4+ICsNCj4+ICtNb3JlIGNvbXBsZXRlIGluZm9ybWF0aW9uIGlzIGF2YWlsYWJs
ZSBvbiBvdXIgYFN1Ym1pdCBhIHBhdGNoIHBhZ2UNCj4+ICs8c3VibWl0dGluZy1hLXBhdGNo
PmAuDQo+IA0KPiBJJ20gZmFyIGZyb20gY29udmluY2VkIGFueSBvZiB0aGUgYWJvdmUgY29u
dGVudCBpcyBhIGdvb2QgaWRlYSwgZ2l2ZW4NCj4gaXQgaXMgZHVwbGljYXRpbmcgc3R1ZmYg
d2UndmUgYWxyZWFkeSBnb3QgZWxzZXdoZXJlIGluIG91ciBtYW51YWwuDQo+IFRoaXMgZ2l2
ZXMgdXMgdGhlIGV4dHJhIGJ1cmRlbiBvZiBlbnN1cmluZyBkaWZmZXJlbnQgcGFydHMgb2Yg
dGhlDQo+IG1hbnVhbCBhcmUgY29uc2lzdGVudCBpbiB3aGF0IHRoZXkncmUgcmVjb21tZW5k
aW5nIHdoaWNoIGlzIHNvbWV0aGluZw0KPiB3ZSBhcmUgaGlzdG9yaWNhbGx5IGJhZCBhdCBk
b2luZy4NCj4gDQoNCk15IGlkZWEgd2FzIHRvIGtlZXAgdGhpcyB3aG9sZSB0b2dldGhlciBp
bnN0ZWFkIG9mIHNjYXR0ZXJpbmcgdGhvc2UgDQoiYmFzaWMiIHVzZSBjYXNlcyBhY3Jvc3Mg
YWxsIHRoZSBkb2N1bWVudGF0aW9uLCB3aGljaCBtYWtlcyB0aGVtIGhhcmQgdG8gDQpmaW5k
IGJ5IGRlc2lnbi4NCg0KPiBJIHRoaW5rIHRoZXJlIGlzIHNjb3BlIGZvciBoYXZpbmcgYSAi
aG93LXRvcyIgc2VjdGlvbiwgYnV0IHRoaXMgcGFydGljdWxhcg0KPiBjaG9pY2VzIG9mIGV4
YW1wbGVzIGFyZSBub3QgdGhlIGJlc3QgcGxhY2UgdG8ga2ljayBpdCBvZmYgd2l0aCBJTUhP
LiBBbHNvLA0KPiBmb3IgdGhlIHNha2Ugb2Ygc2NhbGFiaWxpdHksIEknZCBzdWdnZXN0IHRo
YXQgZWFjaCAiaG93IHRvIiBpcyBhIHN0YW5kYWxvbmUNCj4gZmlsZSBpbiB0aGUgaG93LXRv
cy8gc3ViLWRpcmVjdG9yeSwgb3RoZXJ3aXNlIHRoZSBpbmRleC5yc3Qgd2lsbCBxdWlja2x5
DQo+IGJlY29tZSBlbm91cm1vdXMuDQo+IA0KDQpJIHdpbGwgbGVhdmUgdGhhdCBwYWdlIG91
dCBvZiB0aGlzIHNlcmllcywgaWYgeW91IGZlZWwgaXQncyBub3QgYSBnb29kIA0KYXBwcm9h
Y2ggZm9yIG5vdy4NCkluIGNhc2Ugd2UgcmV2aXNpdCB0aGUgaWRlYSBsYXRlciwgSSB0aGlu
ayB0aGUgaG93LXRvIHNlY3Rpb24gc2hvdWxkIA0KKm5vdCogYmVjb21lIGEgaHVnZSB3aWtp
IHBhZ2UsIHdoZXJlIGFsbCB0aGUgbmljaGUgdXNlIGNhc2VzIHdlIGltYWdpbmUgDQphcmUg
ZG9jdW1lbnRlZCwgYnV0IHNpbXBseSBhIHdheSBmb3IgbmV3IGRldmVsb3BlcnMgdG8gZG8g
dGhlIGJhc2ljIA0Kb3BlcmF0aW9ucyAoYnVpbGQvZXhlY3V0ZS90ZXN0L2NvbnRyaWJ1dGUp
IHRoZXkgbmVlZC4gVGhhdCdzIHRoZSANCmNvbXByb21pc2UgSSB0cmllZCB0byBjcmVhdGUg
aGVyZSwgYmFzZWQgb24gbXkgcGVyc29uYWwgZXhwZXJpZW5jZSBhcyBhIA0KbmV3IGRldmVs
b3BlciBvbiBRRU1VLg0KDQo+IFdpdGggcmVnYXJkcywNCj4gRGFuaWVsDQoNCg==
