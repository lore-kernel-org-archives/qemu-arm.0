Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1188043ejb;
        Tue, 18 Jun 2024 21:40:45 -0700 (PDT)
X-Received: by 2002:a17:902:e5c7:b0:1f9:b121:35f0 with SMTP id d9443c01a7336-1f9b1213809mr4714725ad.54.1718772045489;
        Tue, 18 Jun 2024 21:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718772045; cv=none;
        d=google.com; s=arc-20160816;
        b=T3xzVN7S6QImfzZCX9uMi2uryernWWuZMsbdZ3zvh8H866C1VIuRvR/xRyDAV0cN07
         tniuECLdbXIj9scHpGdbKoGrl6tBmlknQfh34pJjhwvuUXXElOY5VKS3LQbZq3yhWeZ3
         njXTnPPF1IcfeeESR9AoBK6b5CU3uEkzagbFVGD9SGoEVJtvGd1Z53qH6B2Mb7U6vALC
         jfpT7gNhNZIrAsS9LBE7ofaYCzUOEr++5nHVgVk7/4rQzUNvJ25IxFBL8IvCbOoBkuIf
         AU5odyepbaJmC59XAvKIrH5tL39tENVDVcdjo2rZ/fCl9vW8O4eo3k7KDDYMF2SDUVsB
         /DGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=g4BmsQ1QJzxyLe7NE6YfkwAvTr4YTIzX0Wng0BIcdls=;
        fh=OhY8Qz5Jy2LMvlSPrne2bIxXcEjgBukkEgQOhr7vfHQ=;
        b=cxxr0sKeXTCB04nS0Y+BRUqkjCJfIQWMH+8eZGruOcvRTfhR68/OjRqvxb3Rh/zeJw
         Lei/e+ADTCLgLNkn58RAEAjqxbtrNShkVxVrvMWEwYZ8koH3ya+k//q5tXM200MR2yRY
         PPwAdo5O1MRKJ3VdfhG5sVuoSS5jPPlSz6InMGO9dFIDpgUhVC4UDIjk4yyivP2Eh4Pj
         REHwVVBmrFKiVCiXxyaLnP5MH5l0V91H74Tl3rLYDu2YUqBDqYd6kMn1pXLWfBxptoNA
         vw80XURK9zs4pWeZcaYYDTf0dFLNcgbYzvMsZaOsxlHes9pi/enHFugjhr18a8pKtm00
         dgCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LswR6sA9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1f855e2d1casor64798925ad.4.2024.06.18.21.40.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Jun 2024 21:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LswR6sA9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718772044; x=1719376844; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4BmsQ1QJzxyLe7NE6YfkwAvTr4YTIzX0Wng0BIcdls=;
        b=LswR6sA9RcHPK/10GZWVeznk1xN6G8mWj8qpiRBPywGWxLnVEzXUm8V88YGxcJviI2
         ygAI8HyAvovnM0UhczQwQLS6z8YkEEwC5XAxk9emIJBCLA5ApQ6zj1F8aEFshSIXyO0F
         tWrtu6/vBur9D1H6c1s7R+aBmxhMQuO22E/KCH/+eM1x3CiK0tY/JfgfMvillMlo5owp
         uXVY5PClFp4qjXKzelrVOg/5/CRvwn/CQeSjBJjjHYULsBDe7DUWnMWOp6A7in+EIK6X
         xJZbCnw0Ulkg+IRRbNb0xQA9ZHb7ytQdybT2QVQFwXb6JJ0IS+Xb1tGBtyHosGIj0iI6
         iGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718772044; x=1719376844;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4BmsQ1QJzxyLe7NE6YfkwAvTr4YTIzX0Wng0BIcdls=;
        b=X10wiOsRLIxjc+79dsEqAxq7sQrUlwiK0I+mqK6Msr4+fJvqlpd41ASBl3YJX1NWzv
         dWoXGEdO7uIsOl58o8yycXS90YoOh93SAewOQ6IcHTkjhsadjLbSYNWGd4Rmw9TRcc1s
         YI9K8DJH8RrKKnseSzcAQ1AVom1joj/ZfMCAyZ5FNHDq8PfvA54RQhOwT0Fr/JfLEM/J
         rqDCK7+dX/J6MZoXmapKGYsOjDQXkL8B5H5vvfB7OsQopZmrJGIgu2ycvNNJwbtybOH3
         HsdxhVrjw9HS3JwZG9Ycu0oFdytMAxeCW9IcJgqSgrpmUovrk4cWkTL2WQVVa/yUUmTr
         LBWA==
X-Gm-Message-State: AOJu0Yzh9h3zZLibGSENtmgqxdS1SX7K0nAcIXP4KIuZB6pGMMiQw1ry
	reg+soq0r7UvnG7yIq7QWhEyogIMNWzMOqOuUsoLNlbR2h4YCxiiiFt7yNEUh+TUAwVdbNGKfJt
	sw8sN7w==
X-Google-Smtp-Source: AGHT+IHFfqYIDFPB2Pn70eKtMLfzZPDMlN9O6iloy8dsexph+5biJsZB7KaVhUQUSQGsB2WaUEO6cQ==
X-Received: by 2002:a17:902:a585:b0:1f6:343f:dc4d with SMTP id d9443c01a7336-1f9aa462941mr15179015ad.49.1718772044195;
        Tue, 18 Jun 2024 21:40:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f98fd829adsm23772835ad.231.2024.06.18.21.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 21:40:43 -0700 (PDT)
Message-ID: <78003bee-08f7-4860-a675-b09721955e60@linaro.org>
Date: Tue, 18 Jun 2024 21:40:32 -0700
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
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <874j9qefv0.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: dLBdn0hSv2W4

T24gNi8xOC8yNCAwMjo1MywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiA2
LzE3LzI0IDEzOjU2LCBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IHdyb3RlOg0KPj4+ICogUGll
cnJpY2sgQm91dmllciAocGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnKSB3cm90ZToNCj4+
Pj4gT24gNi8xNC8yNCAxNTowMCwgRHIuIERhdmlkIEFsYW4gR2lsYmVydCB3cm90ZToNCj4+
Pj4+ICogUGllcnJpY2sgQm91dmllciAocGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnKSB3
cm90ZToNCj4+Pj4+PiBIaSBEYXZlLA0KPj4+Pj4+DQo+Pj4+Pj4gT24gNi8xMi8yNCAxNDow
MiwgRHIuIERhdmlkIEFsYW4gR2lsYmVydCB3cm90ZToNCj4+Pj4+Pj4gKiBBbGV4IEJlbm7D
qWUgKGFsZXguYmVubmVlQGxpbmFyby5vcmcpIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTogUGll
cnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPj4+Pj4+Pj4N
Cj4+Pj4+Pj4+IFRoaXMgcGx1Z2luIHVzZXMgdGhlIG5ldyB0aW1lIGNvbnRyb2wgaW50ZXJm
YWNlIHRvIG1ha2UgZGVjaXNpb25zDQo+Pj4+Pj4+PiBhYm91dCB0aGUgc3RhdGUgb2YgdGlt
ZSBkdXJpbmcgdGhlIGVtdWxhdGlvbi4gVGhlIGFsZ29yaXRobSBpcw0KPj4+Pj4+Pj4gY3Vy
cmVudGx5IHZlcnkgc2ltcGxlLiBUaGUgdXNlciBzcGVjaWZpZXMgYW4gaXBzIHJhdGUgd2hp
Y2ggYXBwbGllcw0KPj4+Pj4+Pj4gcGVyIGNvcmUuIElmIHRoZSBjb3JlIHJ1bnMgYWhlYWQg
b2YgaXRzIGFsbG9jYXRlZCBleGVjdXRpb24gdGltZSB0aGUNCj4+Pj4+Pj4+IHBsdWdpbiBz
bGVlcHMgZm9yIGEgYml0IHRvIGxldCByZWFsIHRpbWUgY2F0Y2ggdXAuIEVpdGhlciB3YXkg
dGltZSBpcw0KPj4+Pj4+Pj4gdXBkYXRlZCBmb3IgdGhlIGVtdWxhdGlvbiBhcyBhIGZ1bmN0
aW9uIG9mIHRvdGFsIGV4ZWN1dGVkIGluc3RydWN0aW9ucw0KPj4+Pj4+Pj4gd2l0aCBzb21l
IGFkanVzdG1lbnRzIGZvciBjb3JlcyB0aGF0IGlkbGUuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEEg
ZmV3IHJhbmRvbSB0aG91Z2h0czoNCj4+Pj4+Pj4gICAgICAgYSkgQXJlIHRoZXJlIGFueSBk
ZWZpbml0aW9ucyBvZiB3aGF0IGEgcGx1Z2luIHRoYXQgY29udHJvbHMgdGltZQ0KPj4+Pj4+
PiAgICAgICAgICBzaG91bGQgZG8gd2l0aCBhIGxpdmUgbWlncmF0aW9uPw0KPj4+Pj4+DQo+
Pj4+Pj4gSXQncyBub3Qgc29tZXRoaW5nIHRoYXQgd2FzIGNvbnNpZGVyZWQgYXMgcGFydCBv
ZiB0aGlzIHdvcmsuDQo+Pj4+Pg0KPj4+Pj4gVGhhdCdzIE9LLCB0aGUgb25seSB0aGluZyBp
cyB3ZSBuZWVkIHRvIHN0b3AgYW55b25lIGZyb20gaGl0dGluZyBwcm9ibGVtcw0KPj4+Pj4g
d2hlbiB0aGV5IGRvbid0IHJlYWxpc2UgaXQncyBub3QgYmVlbiBhZGRyZXNzZWQuDQo+Pj4+
PiBPbmUgd2F5IG1pZ2h0IGJlIHRvIGFkZCBhIG1pZ3JhdGlvbiBibG9ja2VyOyBzZWUgaW5j
bHVkZS9taWdyYXRpb24vYmxvY2tlci5oDQo+Pj4+PiB0aGVuIHlvdSBtaWdodCBwcmludCBz
b21ldGhpbmcgbGlrZSAnTWlncmF0aW9uIG5vdCBhdmFpbGFibGUgZHVlIHRvIHBsdWdpbiAu
Li4uJw0KPj4+Pj4NCj4+Pj4NCj4+Pj4gU28gYmFzaWNhbGx5LCB3ZSBjb3VsZCBtYWtlIGEg
Y2FsbCB0byBtaWdyYXRlX2FkZF9ibG9ja2VyKCksIHdoZW4gc29tZW9uZQ0KPj4+PiByZXF1
ZXN0IHRpbWVfY29udHJvbCB0aHJvdWdoIHBsdWdpbiBBUEk/DQo+Pj4+DQo+Pj4+IElNSE8s
IGl0J3Mgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIHBhcnQgb2YgcGx1Z2luIEFQSSAoaWYg
YW55IHBsdWdpbiBjYWxscw0KPj4+PiBxZW11X3BsdWdpbl9yZXF1ZXN0X3RpbWVfY29udHJv
bCgpKSwgaW5zdGVhZCBvZiB0aGUgcGx1Z2luIGNvZGUgaXRzZWxmLiBUaGlzDQo+Pj4+IHdh
eSwgYW55IHBsdWdpbiBnZXR0aW5nIHRpbWUgY29udHJvbCBhdXRvbWF0aWNhbGx5IGJsb2Nr
cyBhbnkgcG90ZW50aWFsDQo+Pj4+IG1pZ3JhdGlvbi4NCj4+PiBOb3RlIG15IHF1ZXN0aW9u
IGFza2VkIGZvciBhICdhbnkgZGVmaW5pdGlvbnMgb2Ygd2hhdCBhIHBsdWdpbiAuLicgLQ0K
Pj4+IHNvDQo+Pj4geW91IGNvdWxkIGRlZmluZSBpdCB0aGF0IHdheSwgYW5vdGhlciBvbmUg
aXMgdG8gdGhpbmsgdGhhdCBpbiB0aGUgZnV0dXJlDQo+Pj4geW91IG1heSBhbGxvdyBpdCBh
bmQgdGhlIHBsdWdpbiBzb21laG93IGludGVyYWN0cyB3aXRoIG1pZ3JhdGlvbiBub3QgdG8N
Cj4+PiBjaGFuZ2UgdGltZSBhdCBjZXJ0YWluIG1pZ3JhdGlvbiBwaGFzZXMuDQo+Pj4NCj4+
DQo+PiBJIHdvdWxkIGJlIGluIGZhdm9yIHRvIGZvcmJpZCB1c2FnZSBmb3Igbm93IGluIHRo
aXMgY29udGV4dC4gSSdtIG5vdA0KPj4gc3VyZSB3aHkgcGVvcGxlIHdvdWxkIHBsYXkgd2l0
aCBtaWdyYXRpb24gYW5kIHBsdWdpbnMgZ2VuZXJhbGx5IGF0DQo+PiB0aGlzIHRpbWUgKHRo
ZXJlIG1pZ2h0IGJlIGV4cGVyaW1lbnRzIG9yIHVzZSBjYXNlcyBJJ20gbm90IGF3YXJlIG9m
KSwNCj4+IHNvIGEgc2ltcGxlIGJhcnJpZXIgcHJldmVudGluZyB0aGF0IHNlZW1zIG9rLg0K
Pj4NCj4+IFRoaXMgcGx1Z2luIGlzIHBhcnQgb2YgYW4gZXhwZXJpbWVudCB3aGVyZSB3ZSBp
bXBsZW1lbnQgYSBxZW11IGZlYXR1cmUNCj4+IChpY291bnQ9YXV0byBpbiB0aGlzIGNhc2Up
IGJ5IHVzaW5nIHBsdWdpbnMuIElmIGl0IHR1cm5zIGludG8gYQ0KPj4gc3VjY2Vzc2Z1bCB1
c2FnZSBhbmQgdGhpcyBwbHVnaW4gYmVjb21lcyBwb3B1bGFyLCB3ZSBjYW4gYWx3YXlzIGxp
ZnQNCj4+IHRoZSBsaW1pdGF0aW9uIGxhdGVyLg0KPj4NCj4+IEBBbGV4LCB3b3VsZCB5b3Ug
bGlrZSB0byBhZGQgdGhpcyBub3cgKGljb3VudD1hdXRvIGlzIHN0aWxsIG5vdA0KPj4gcmVt
b3ZlZCBmcm9tIHFlbXUpLCBvciB3YWl0IGZvciBpbnRlZ3JhdGlvbiwgYW5kIGFkZCB0aGlz
IGFzIGFub3RoZXINCj4+IHBhdGNoPw0KPiANCj4gSSB0aGluayB3ZSBmb2xsb3cgdGhlIGRl
cHJlY2F0aW9uIHByb2Nlc3Mgc28gb25jZSBpbnRlZ3JhdGVkIHdlIHBvc3QgYQ0KPiBkZXBy
ZWNhdGlvbiBub3RpY2UgaW46DQo+IA0KPiAgICBodHRwczovL3FlbXUucmVhZHRoZWRvY3Mu
aW8vZW4vbWFzdGVyL2Fib3V0L2RlcHJlY2F0ZWQuaHRtbA0KPiANCj4gYW5kIHRoZW4gcmVt
b3ZlIGl0IGFmdGVyIGEgY291cGxlIG9mIHJlbGVhc2VzLg0KPiANCg0KU29ycnksIEkgd2Fz
IG5vdCBjbGVhci4gSSBtZWFudCBkbyB3ZSBhZGQgYSBibG9ja2VyIGluIGNhc2Ugc29tZW9u
ZSANCnRyaWVzIHRvIG1pZ3JhdGUgYSB2bSB3aGlsZSB0aGlzIHBsdWdpbiBpcyB1c2VkPw0K
