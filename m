Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4265071njc;
        Wed, 20 Nov 2024 13:58:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUt095d5tQlImza/9C9t65kH22ktyRK3+LQVPfPDNGpoyouJsPzbKGrzl8psa/wd8ujhEWVqsavouyqRg==@linaro.org
X-Received: by 2002:a17:903:298d:b0:212:26e:712c with SMTP id d9443c01a7336-2126a3f54fdmr47789925ad.26.1732139899756;
        Wed, 20 Nov 2024 13:58:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732139899; cv=none;
        d=google.com; s=arc-20240605;
        b=SlMu4rZC9MrwElE6GR154bZSr7pP/2blEOdKKPgPW9wwEtpiY39kcnxhcKgg4rXcFu
         i66Wr0qHuzwZEBAxc/Jk4zMF7/ozIeK1p/aJ0oynSJJTvJWtpY+FOovO9OS6IhMvFHFO
         Q848WucCnNq2Qtqy+AO019rqtQPhYtO2RB9CnX0XuHAdWAl0d3RKbAMj1tYdhr0Qutwc
         GI6L3OXKdeTi41wVzrOS7oEjDwhECCxpgm64ytGLjeDJY5gIMS3iPhJOKpfUehtFzI4Z
         yHPSfxRtXY/UJDPp05xoX7WykAU7knxLA6cGMbVGBGde46bnAajCl2I5c06F9pS9vPk3
         XijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I1rKcniXgxdvV6OMEiIKMaL2cduwYnSQRJhKxAOGzjE=;
        fh=m1svnRCja49lRMcTsovtK4UAmzF3Oj6bi+jKQS/5FJ0=;
        b=HZVavWGamYLnM9OnyI3mvLEtq5wiwqPdE0K2R+zbPbHSA1egzPewM8RbLQnZNA28jt
         4ZU8qG9t6Prnb1kokSp3EwE0o28XHrvnp50lV4GOA5Sh5RXHIG297miJDy3G/mUgCGqQ
         /M25pt138SBl2KxeHhbdhNdA+SzbBlp8nLKR1RR4zTyOI3mRQ+yUPoFYH/l0yBF3Jym/
         Lf964tNKld4/l0JPifoamPvez8b0RTRnd/PhtIFligx4ly4OpGW4Q6/ppGg02izXfQON
         lqTbLP80Xd+BT8VOCNNB8QELr1fWp2ohx3gfmZgtCXW9LlIgMxtFOrVOb4nQG+yRCQiQ
         80vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhMjE1jY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2126c0febdasor15980195ad.14.2024.11.20.13.58.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2024 13:58:19 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rhMjE1jY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732139899; x=1732744699; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1rKcniXgxdvV6OMEiIKMaL2cduwYnSQRJhKxAOGzjE=;
        b=rhMjE1jYTKmqjv/Btk+G8G9zVOlhKmc/I8ui3otJJSB25wbPMzGQ8Mq3x79QXTcY+D
         xbqHY2NjzL9Gf2oJBp3vO9BOhjpc6ZVkhATnYcFalhgJCrynyByaWCoMxh7eaSWZJCz0
         8ScrdaWvzXeDl/djYCKZjEFzBLe7Aser5E21atnVgDb4TzCNzSg/mZh/fKpqoEGNJfKr
         Xnn+9CYhO4qpUi730wsFPPqlNGvtVAP9cV8wwfhIDP5zRS0/eKZibviKwAax86FhJ6ys
         Qm+MrLoVlnTgM/iK45BzKsHnA2kY+EEnLAYoIK5ivXjwyoTPeYs2kDE5tNpHdIqhGnlT
         2AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139899; x=1732744699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1rKcniXgxdvV6OMEiIKMaL2cduwYnSQRJhKxAOGzjE=;
        b=jyGWl3M8uE4CFWE7E7dBHFma6wwFepLm2IedGhM+6ylwZauWJcy1VqFlDnfuVXhO0Q
         ZOefPLPjJ9hHr/Ip0pDSnIBrjvVHDGNnjRwRAcI+amdRH0NjBKG5xwoyw+6uNcx0ELl6
         RQFXzYBi2zFe8gUk3ntsQeSCxbqggiGkV+6H+xPuhEz+X9Pa4cUqsMnlE+8gkOWovmJo
         +3V/KOzy5NWPmBMV9YMnPjJMfybDZOayQdebw80/h1uNNYvYa3zCxwM9vie2KpemCHmE
         5T6QSI5yMx5aJthr9vqCPlFKFBGajyXEEfRH638NU8vpZu4TGtl4UHyABJJ6in/mbkOj
         NhlA==
X-Forwarded-Encrypted: i=1; AJvYcCVlyVA5FYl9e5VnYEAEQw1gyqle0vkuMbS8C9fMeOkETrvLJX1Q2vPmrYSRRAkhFrqjo4dgaWvEfEaQnA==@linaro.org
X-Gm-Message-State: AOJu0Yyy+Y7UeUFw+l15MiMJMMuUgspOZtm0Nn7RIj4tF0XnQ+lBT6VF
	jmqkhNzOD6lYq8Mvmh4dkyeWEYUAot9EBXOYtxYcvSROwmio5zaOIxKDW85EbAPO6FdMgWqZCgH
	WLbmPyh/+
X-Google-Smtp-Source: AGHT+IGoa9RiX1UR1EflR6+sqDIpQ8UMsBUviGHMxt9hRz1nrj4zmB1CHJCPAIn3a18BkXSQZDrdQQ==
X-Received: by 2002:a17:902:ccc6:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-2126a475010mr53620485ad.41.1732139899286;
        Wed, 20 Nov 2024 13:58:19 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2128788ac4esm367295ad.14.2024.11.20.13.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 13:58:18 -0800 (PST)
Message-ID: <ec89b777-92a9-4956-8a8a-12c6dcbef034@linaro.org>
Date: Wed, 20 Nov 2024 13:58:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] docs/devel: add information on how to setup build
 environments
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
 <20241118172357.475281-5-pierrick.bouvier@linaro.org>
 <ZzxZRwXAIlMt6SNA@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ZzxZRwXAIlMt6SNA@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: eIRXxONh7Tp4

T24gMTEvMTkvMjQgMDE6MjQsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+IE9uIE1v
biwgTm92IDE4LCAyMDI0IGF0IDA5OjIzOjU0QU0gLTA4MDAsIFBpZXJyaWNrIEJvdXZpZXIg
d3JvdGU6DQo+PiBNYWNPUyBhbmQgTGludXggYXJlIHN0cmFpZ2h0Zm9yd2FyZCwgYnV0IFdp
bmRvd3MgbmVlZHMgYSBiaXQgbW9yZQ0KPj4gZGV0YWlscy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+
PiAtLS0NCj4+ICAgZG9jcy9hYm91dC9idWlsZC1wbGF0Zm9ybXMucnN0ICAgfCAgIDQgKy0N
Cj4+ICAgZG9jcy9kZXZlbC9idWlsZC1lbnZpcm9ubWVudC5yc3QgfCAxMTQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBkb2NzL2RldmVsL2luZGV4LWJ1aWxkLnJz
dCAgICAgICB8ICAgMSArDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTE4IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvZGV2ZWwv
YnVpbGQtZW52aXJvbm1lbnQucnN0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RvY3MvYWJvdXQv
YnVpbGQtcGxhdGZvcm1zLnJzdCBiL2RvY3MvYWJvdXQvYnVpbGQtcGxhdGZvcm1zLnJzdA0K
Pj4gaW5kZXggNjEwMmYwMGFlYzAuLmMxZWE1M2RiODM0IDEwMDY0NA0KPj4gLS0tIGEvZG9j
cy9hYm91dC9idWlsZC1wbGF0Zm9ybXMucnN0DQo+PiArKysgYi9kb2NzL2Fib3V0L2J1aWxk
LXBsYXRmb3Jtcy5yc3QNCj4+IEBAIC0yOSw2ICsyOSw5IEBAIFRoZSBgUmVwb2xvZ3lgXyBz
aXRlIGlzIGEgdXNlZnVsIHJlc291cmNlIHRvIGlkZW50aWZ5DQo+PiAgIGN1cnJlbnRseSBz
aGlwcGVkIHZlcnNpb25zIG9mIHNvZnR3YXJlIGluIHZhcmlvdXMgb3BlcmF0aW5nIHN5c3Rl
bXMsDQo+PiAgIHRob3VnaCBpdCBkb2VzIG5vdCBjb3ZlciBhbGwgZGlzdHJvcyBsaXN0ZWQg
YmVsb3cuDQo+PiAgIA0KPj4gK1lvdSBjYW4gZmluZCBob3cgdG8gaW5zdGFsbCBidWlsZCBk
ZXBlbmRlbmNpZXMgZm9yIGRpZmZlcmVudCBzeXN0ZW1zIG9uIHRoZQ0KPj4gKzpyZWY6YHNl
dHVwLWJ1aWxkLWVudmAgcGFnZS4NCj4+ICsNCj4+ICAgU3VwcG9ydGVkIGhvc3QgYXJjaGl0
ZWN0dXJlcw0KPj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIA0KPj4g
QEAgLTEzMCw3ICsxMzMsNiBAQCBPcHRpb25hbCBidWlsZCBkZXBlbmRlbmNpZXMNCj4+ICAg
ICBjcm9zcyBjb21waWxhdGlvbiB1c2luZyBgYGRvY2tlcmBgIG9yIGBgcG9kbWFuYGAsIG9y
IHRvIHVzZSBwcmUtYnVpbHQNCj4+ICAgICBiaW5hcmllcyBkaXN0cmlidXRlZCB3aXRoIFFF
TVUuDQo+PiAgIA0KPj4gLQ0KPj4gICBXaW5kb3dzDQo+PiAgIC0tLS0tLS0NCj4+ICAgDQo+
PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC9idWlsZC1lbnZpcm9ubWVudC5yc3QgYi9kb2Nz
L2RldmVsL2J1aWxkLWVudmlyb25tZW50LnJzdA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+IGluZGV4IDAwMDAwMDAwMDAwLi5kOWE2NmY1ZmNjNg0KPj4gLS0tIC9kZXYvbnVsbA0K
Pj4gKysrIGIvZG9jcy9kZXZlbC9idWlsZC1lbnZpcm9ubWVudC5yc3QNCj4+IEBAIC0wLDAg
KzEsMTE0IEBADQo+PiArDQo+PiArLi4gX3NldHVwLWJ1aWxkLWVudjoNCj4+ICsNCj4+ICtT
ZXR1cCBidWlsZCBlbnZpcm9ubWVudA0KPj4gKz09PT09PT09PT09PT09PT09PT09PT09DQo+
PiArDQo+PiArUUVNVSB1c2VzIGEgbG90IG9mIGRlcGVuZGVuY2llcyBvbiB0aGUgaG9zdCBz
eXN0ZW0uIGdsaWIyIGlzIHVzZWQgZXZlcnl3aGVyZSBpbg0KPj4gK3RoZSBjb2RlIGJhc2Us
IGFuZCBtb3N0IG9mIHRoZSBvdGhlciBkZXBlbmRlbmNpZXMgYXJlIG9wdGlvbmFsLg0KPj4g
Kw0KPj4gK1dlIHByZXNlbnQgaGVyZSBzaW1wbGUgaW5zdHJ1Y3Rpb25zIHRvIGVuYWJsZSBu
YXRpdmUgYnVpbGRzIG9uIG1vc3QgcG9wdWxhcg0KPj4gK3N5c3RlbXMuDQo+PiArDQo+PiAr
WW91IGNhbiBmaW5kIGFkZGl0aW9uYWwgaW5zdHJ1Y3Rpb25zIG9uIGBRRU1VIHdpa2kgPGh0
dHBzOi8vd2lraS5xZW11Lm9yZy8+YF86DQo+PiArDQo+PiArLSBgTGludXggPGh0dHBzOi8v
d2lraS5xZW11Lm9yZy9Ib3N0cy9MaW51eD5gXw0KPj4gKy0gYE1hY09TIDxodHRwczovL3dp
a2kucWVtdS5vcmcvSG9zdHMvTWFjPmBfDQo+PiArLSBgV2luZG93cyA8aHR0cHM6Ly93aWtp
LnFlbXUub3JnL0hvc3RzL1czMj5gXw0KPj4gKy0gYEJTRCA8aHR0cHM6Ly93aWtpLnFlbXUu
b3JnL0hvc3RzL0JTRD5gXw0KPiANCj4gDQo+IFdlIGdlbmVyYWxseSBzdWZmZXIgZnJvbSBo
YXZpbmcgaW5mb3JtYXRpb24gc3ByZWFkIG92ZXIgbXVsdGlwbGUgc291cmNlcywNCj4gZ2l2
aW5nIHVzIHRoZSBidXJkZW4gb2Yga2VlcGluZyB0aGUgZGlmZmVyZW50IHBsYWNlcyBjb25z
aXN0ZW50LCB3aGljaCB3ZQ0KPiBwcmV0dHkgY29uc2lzdGVudGx5IGZhaWwgYXQuDQo+IA0K
DQpBZ3JlZSBvbiB0aGF0Lg0KDQo+IEl0IGlzIGEgZ29vZCB0aGluayB0byBhZGQgYnVpbGQg
ZW52IGRvY3MgdG8gcWVtdS5naXQgd2hlcmUgd2UgYWN0dWFsbHkNCj4gaGF2ZSBvdmVyc2ln
aHQgLyByZXZpZXcgdG8gY2F0Y2ggbWlzdGFrZXMuIElmIHdlIGRvIHRoaXMgdGhvdWdoLCBJ
TUhPLA0KPiB3ZSBzaG91bGQgYmUgZGVsZXRpbmcgdGhlIHdpa2kgcGFnZXMgYW5kIG1ha2lu
ZyB0aGVtIGludG8gMzAyIHJlZGlyZWN0cw0KPiB0byBvdXIgbmV3IGluLXRyZWUgZG9jcy4N
Cj4gDQoNClN1cmUuDQpIb3dldmVyLCB0aGVyZSBpcyBzdGlsbCBzb21lIHVzZWZ1bCBpbmZv
cm1hdGlvbiB0aGVyZSwgdGhhdCBhcmUgbm90IA0KcmVmbGVjdGVkIGluIHRoaXMgcGF0Y2gu
DQoNCldlIGNvdWxkIG1pZ3JhdGUgdGhlIGluZm9ybWF0aW9uIGxhdGVyLCBidXQgZm9yIG5v
dywgSSBjYW4ndCBzcGVuZCBtYW55IA0KY3ljbGVzIHRvIHRyeSB0byBidWlsZCBhbGwgY29u
ZmlndXJhdGlvbnMgZGVzY3JpYmVkIG9uIHRoZSB3aWtpIHRvIG1ha2UgDQpzdXJlIGl0J3Mg
dXAgdG8gZGF0ZS4NClNvIEkganVzdCBpbmNsdWRlZCBpbmZvcm1hdGlvbiBJJ20gc3VyZSBp
dCB3b3JrcywgYW5kIHRoYXQgY292ZXIgdGhlIA0KYmFzaWMgbmVlZHMgdG8gYnVpbGQgb24g
YWxsIG1ham9yIHN5c3RlbXMuDQoNCkhvcGUgdGhpcyBpcyBhIHN0YXJ0aW5nIHBvaW50IHdl
IGNhbiBtYXliZSBhY2NlcHQsIGFuZCB3ZSBjYW4gZW5oYW5jZSANCnRoZSBkb2N1bWVudGF0
aW9uIGxhdGVyLiBCdXQgYXNraW5nIHRvIGRvIGFsbCB0aGlzIGF0IG9uY2UgaXMgYSBiaWcg
DQp0YXNrLCBhbmQgSSBmZWVsIGl0J3MgYSBsb3QgdG8gYXNrIGZvciBpdCBhcyBwYXJ0IG9m
IHRoZSBjdXJyZW50IHNlcmllcy4NCg0KV291bGQgeW91IGFjY2VwdCB0aGF0LCBvciBwcmVm
ZXIgdG8gbm90IGluY2x1ZGUgYW55dGhpbmcgYmVmb3JlIHdlIGhhdmUgDQpwdXJnZWQgdGhl
IHdpa2lzIGNvbXBsZXRlbHk/DQoNCj4+ICsNCj4+ICtMaW51eA0KPj4gKy0tLS0tDQo+PiAr
DQo+PiArRmVkb3JhDQo+PiArKysrKysrDQo+PiArDQo+PiArOjoNCj4+ICsNCj4+ICsgICAg
c3VkbyBkbmYgdXBkYXRlICYmIHN1ZG8gZG5mIGJ1aWxkZGVwIHFlbXUNCj4+ICsNCj4+ICtE
ZWJpYW4vVWJ1bnR1DQo+PiArKysrKysrKysrKysrKw0KPj4gKw0KPj4gK1lvdSBmaXJzdCBu
ZWVkIHRvIGVuYWJsZSBgU291cmNlcyBMaXN0IDxodHRwczovL3dpa2kuZGViaWFuLm9yZy9T
b3VyY2VzTGlzdD5gXy4NCj4+ICtUaGVuLCB1c2UgYXB0IHRvIGluc3RhbGwgZGVwZW5kZW5j
aWVzOg0KPj4gKw0KPj4gKzo6DQo+PiArDQo+PiArICAgIHN1ZG8gYXB0IHVwZGF0ZSAmJiBz
dWRvIGFwdCBidWlsZC1kZXAgcWVtdQ0KPj4gKw0KPj4gK01hY09TDQo+PiArLS0tLS0NCj4+
ICsNCj4+ICtZb3UgZmlyc3QgbmVlZCB0byBpbnN0YWxsIGBIb21lYnJldyA8aHR0cHM6Ly9i
cmV3LnNoLz5gXy4gVGhlbiwgdXNlIGl0IHRvDQo+PiAraW5zdGFsbCBkZXBlbmRlbmNpZXM6
DQo+PiArDQo+PiArOjoNCj4+ICsNCj4+ICsgICAgYnJldyB1cGRhdGUgJiYgYnJldyBpbnN0
YWxsICQoYnJldyBkZXBzIC0taW5jbHVkZS1idWlsZCBxZW11KQ0KPiANCj4gDQo+IFRoZSBk
b3duc2lkZSBpbiByZWNvbW1lbmRpbmcgdGhlICdidWlsZCBkZXAnIGFwcHJvYWNoIGlzIHRo
YXQgaXQgbWlzc2VzDQo+IG91dCBvbiBkZXBzIHRoYXQgaGF2ZSBiZWVuIG5ld2x5IGludHJv
ZHVjZWQgaW4gcWVtdS5naXQsIHNpbmNlIHdoYXRldmVyDQo+IG9sZCB2ZXJzaW9uIG9mIFFF
TVUgdGhlIGRpc3Ryb3MgYXJlIHNoaXBwaW5nLiAgSXQgYWxzbyBtaXNzZXMgZGVwcyBmb3IN
Cj4gYW55IGZlYXR1cmVzIHRoZSBkaXN0cm8gdmVuZG9yIGhhcyBkZWNpZGVkIHRvIGV4Y2x1
ZGUuDQo+IA0KPiBDYW4gd2UgcHV0IGEgY2F2ZWF0IGRlc2NyaWJpbmcgdGhpcyBsaW1pdGF0
aW9uIGF0IHRoZSB0b3AsIHNvIHRoYXQgdXNlcnMNCj4gaGF2ZSBwb2ludGVyIGlmIHRoaW5n
cyBkb24ndCBxdWl0ZSBnbyB0aGUgd2F5IHdlIGV4cGVjdGVkLg0KPg0KDQpJIGNhbiBhZGQg
YSBub3RlIGFib3V0IGl0LiBJdCdzIGVzcGVjaWFsbHkgdHJ1ZSBmb3IgTGludXgsIGFzIG9u
IFdpbmRvd3MgDQooTVNZUzIpIGFuZCBNYWNPUyAoaG9tZWJyZXcpLCB0aGV5IHVzdWFsbHkg
dHJhY2sgbGF0ZXN0IHJlbGVhc2Ugb2YgUUVNVSwgDQpzbyB0aGUgYnVpbGQgbGlzdCBzaG91
bGQgbWF0Y2gsIGdpdmVuIGEgcmVkdWNlZCB0aW1lIGZyYW1lIGFmdGVyIHRoZSANCnJlbGVh
c2UuDQoNCj4+ICsNCj4+ICtXaW5kb3dzDQo+PiArLS0tLS0tLQ0KPj4gKw0KPj4gK1lvdSBm
aXJzdCBuZWVkIHRvIGluc3RhbGwgYE1TWVMyIDxodHRwczovL3d3dy5tc3lzMi5vcmcvPmBf
Lg0KPj4gK01TWVMyIG9mZmVycyBgZGlmZmVyZW50IGVudmlyb25tZW50cyA8aHR0cHM6Ly93
d3cubXN5czIub3JnL2RvY3MvZW52aXJvbm1lbnRzLz5gXy4NCj4+ICt4ODZfNjQgZW52aXJv
bm1lbnRzIGFyZSBiYXNlZCBvbiBHQ0MsIHdoaWxlIGFhcmNoNjQgaXMgYmFzZWQgb24gQ2xh
bmcuDQo+PiArDQo+PiArV2UgcmVjb21tZW5kIHRvIHVzZSBNSU5HVzY0IGZvciB3aW5kb3dz
LXg4Nl82NCBhbmQgQ0xBTkdBUk02NCBmb3Igd2luZG93cy1hYXJjaDY0DQo+PiArKG9ubHkg
YXZhaWxhYmxlIG9uIHdpbmRvd3MtYWFyY2g2NCBob3N0cykuDQo+IA0KPiBEb2VzIENMQU5H
QVJNNjQgcmVhbGx5IHdvcmsgd2l0aCBRRU1VID8gICBXZSBnbyBvdXQgb2Ygb3VyIHdheSB0
byBhY3RpdmVseQ0KPiBibG9jayB0aGUgdXNlIG9mIENMYW5nIGZvciBXaW5kb3dzIGJlY2F1
c2Ugb2YgaXRzIGxhY2sgb2Ygc3VwcG9ydCBmb3INCj4gJ2djY19zdHJ1Y3QnIGF0dHJpYnV0
ZXMsIHNvIEkgd291bGQgaGF2ZSBleHBlY3RlZCBpdCB0byBmYWlsDQo+IA0KDQpJIGNhbiBk
cm9wIHRoZSB3aW5kb3dzLWFybTY0IHBhcnQuDQpGb3IgdGhlIHN1cHBvcnQsIGl0J3MgYSBk
aXNjdXNzaW9uIHdlIGFkZCBwcmV2aW91c2x5IG9uIHRoZSBjb25jZXJuZWQgDQpzZXJpZXMu
IEluIGN1cnJlbnQgbWFzdGVyLCBpdCB3b24ndCBldmVuIGdvIHBhc3QgdGhlIGNvbmZpZ3Vy
ZSBzdGVwIA0KYmVjYXVzZSBvZiBpbnRlbnRpb25hbCByZXN0cmljdGlvbiB3ZSBoYXZlIGlu
IG1lc29uLmJ1aWxkLg0KTXkgaW5pdGlhbCBob3BlIHdhcyB0byByZW1vdmUgaXQsIGJ1dCBJ
IHVuZGVyc3RhbmQgdGhhdCB3ZSBwcmVmZXIgdG8gDQp3YWl0IGZvciBnY2Nfc3RydWN0IHN1
cHBvcnQgaW4gY2xhbmcuIFNvIGJlIGl0LCBJIGNhbiBsaXZlIHdpdGggYSBsb2NhbCANCmZp
eCBmb3IgdGhhdCBtZWFud2hpbGUgOikuDQoNCj4+ICsNCj4+ICtUaGVuLCB5b3UgY2FuIG9w
ZW4gYSB3aW5kb3dzIHNoZWxsLCBhbmQgZW50ZXIgbXN5czIgZW52IHVzaW5nOg0KPj4gKw0K
Pj4gKzo6DQo+PiArDQo+PiArICAgIGM6L21zeXM2NC9tc3lzMl9zaGVsbC5jbWQgLWRlZnRl
cm0gLWhlcmUgLW5vLXN0YXJ0IC1taW5ndzY0DQo+PiArICAgICMgUmVwbGFjZSAtdWNydDY0
IGJ5IC1jbGFuZ2FybTY0IG9yIC11Y3J0NjQgZm9yIG90aGVyIGVudmlyb25tZW50cy4NCj4+
ICsNCj4+ICtNU1lTMiBwYWNrYWdlIG1hbmFnZXIgZG9lcyBub3Qgb2ZmZXIgYSBidWlsdC1p
biB3YXkgdG8gaW5zdGFsbCBidWlsZA0KPj4gK2RlcGVuZGVuY2llcy4gWW91IGNhbiBzdGFy
dCB3aXRoIHRoaXMgbGlzdCBvZiBwYWNrYWdlcyB1c2luZyBwYWNtYW46DQo+PiArDQo+IA0K
PiBXaXRoIHJlZ2FyZHMsDQo+IERhbmllbA0KDQo=
