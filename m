Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3962475njk;
        Tue, 3 Dec 2024 11:35:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa8kDTlSU6lfCbOyFmAShe0f7dAwo3firHq/TpQIRcNH46dpEMBisaSWJh1of01KhaiQa630qgGWjDhQ==@linaro.org
X-Received: by 2002:a05:6a00:1784:b0:725:3c2d:f7b6 with SMTP id d2e1a72fcca58-7257f960936mr4883737b3a.10.1733254540531;
        Tue, 03 Dec 2024 11:35:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733254540; cv=none;
        d=google.com; s=arc-20240605;
        b=broUiAE0hvaL37nypItfjNM5c1uP3T8KZiBOt82oARLh3M73I3RLcoqsQzMUy8Fl4n
         7YFKbH7zqTvOEavKsEUdFYUvYN+nH7zMwhOW2h+07fhX1Zr94UfMGDvSgNpjH6CKchQF
         iWSwj06BWwadHqHP6DwBJ4EpvD/Fb9+rrC+ipZJ3PzTtTo1zD7/bnIXaumSiq4KDbguR
         onSGi64q0ZNuMy4Zk3yNSapTS0VsdyWJMlSy8tDJMzZmAh9iIizKwSgtVK3G3JFjmedD
         cnkJtoXV6LrEwpstpLpD3xMojS/TomqS9WMrbD+2phlrD/bNu97I9rqqCuaiF7q6tNVJ
         20VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sZ/sBGUSUepOtAok6niXHDSVom+mmgVuaxSazyrS/og=;
        fh=JXFiA/vkjJ/MvlETnPq7UqJijVMU15KUO3PG9JUj6wI=;
        b=CQhy8CgHh9X9d1HBx6ZI+MeBxP5+Z4dxsSwR6H8Uhv03ncYKmrv+AR7rY0WtqdvROk
         5mNZLWwX/tb4wUe2ojvXQgkPAyn2DqrVIQMrpaxYJKjVisK68DfMdK5jQn9NpX02gqc3
         42MKcCn65ZGb3vavX7wKOBe06TPO8iUYBTNBG6W6jbgw4w2elZdZ02eUt1k8BahE8NKb
         m+UqonwN0MLIBXa0/VhS8716bDS5OJfmAsbAyxIDa3sIE4sMlYZeZ9Se2pT0pT+Qg/+t
         RalX/jJAmpP0kAT9++Y6zieqbxLX2qhbR0qQnYBXuRRSMQZUDrtX0nHhMejQz2KeQzzk
         zuZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcZJE5L5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72541ac3a21sor5123950b3a.5.2024.12.03.11.35.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 11:35:40 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcZJE5L5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733254540; x=1733859340; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZ/sBGUSUepOtAok6niXHDSVom+mmgVuaxSazyrS/og=;
        b=gcZJE5L5Epncb6f+OIDnne10b2X8pgeCs3NUazaJcMHg77whRp42/m5xG64uUTtJDq
         AgEnxV2FE4TFna6/likCpHgMGb+u4X7m1CyFN6vyj2KHsl8uYznsVdxgOWhil2Mp/toc
         6RBzMgBMUuUKK0R4w6FjL8k36mCheyXjtXrGJwjg3KHe6IfsV1FXrGWUMaWf94ZugpRa
         Wt1S2kWSIerzHIeUoxmIsLtDGZZnjNrtI//1CO8yQ8BAkJka6KeN8LwGYNARjvt7PWff
         rFsxEHqWjcFRWcN7bXQQhDNUL7RoqHlKPGjgllInUZn7TV3aWZotA9WHbWKhoBggnAyF
         hnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733254540; x=1733859340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ/sBGUSUepOtAok6niXHDSVom+mmgVuaxSazyrS/og=;
        b=aQQ9ZI9Y+qqYC/ztCVhjGwWaP2bzzWhf1HAPhTA6Q+/wHOcbGG+GrO9ipqFmD/X52L
         JyV0wE8N+JbtQbIZclil6HNHJ5sZZVoVSp0CVTqD7wCNE7hhZIU8kiJ/ad/lHvYq4Sqf
         YOsJ3XQXxuhRbRoelRGBG0jr4hEn/VWV6c0FKRpdCPb9QH3BJ9jzwi6ZF1UAqVIdXs8o
         iHI+f3kCUytHCubqQa+hCgN4QkognJo/kcMGEb6W51t4XOdlnGnizydf9wO74zfeeDES
         eGUyKJUTvMrrAhIBGJvunAukkvyP6PEM6+wz2k7/nXp2W0j/5U7MGR3fYQBSB321R4vd
         R8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUIAaELFBlsiFCwuUFsRA6tAza7d3yIQXM51aV52RLF3pTJDT6PQCAFU3789piz23oSyx7OMZFfhAweiA==@linaro.org
X-Gm-Message-State: AOJu0YwBGJWwrH6dO8uJtYc5tGDMiSv56XvY68nM9ZBz1QKyBvFFCFC/
	fRiAhEuW82RsgsUvhIZOomNLuCDGC9sZ0Q/zb23UWGpMLK9ov08cxanKvi0AoyOi6Q==
X-Gm-Gg: ASbGnctwaMsrMYV6zjtCNSNvPaoe3x5njKE0321sRwNP+lKANdYX0qfQ9MRMVrWDAcB
	qnwD1pt/KF0U1hg+FtQY0QtXL2xf46fKfdfi0mvMI/KS4BLc1GShvIyH865MW86fl1CgKOZcSgs
	xkugSPhoY31U8Jgp+OY2h57ZL4oS/9QnHsiwx9n2/qI6fRs8LdUrNssbVNnl7diZ/8seCfBYN6T
	aP0WGZ7HLp+WQ2JeOTDzPhR3jb0WvjlJkJgOPHoIpKj90WpFrTbZoMgibX8qwpxVUcXxdCiwK2j
	QozQvkUODcExddHUzxPIfQ==
X-Google-Smtp-Source: AGHT+IEuu78HwwXvG9FYHFJ0VUgXhcQhcCV2iyvLs/QgjslUV/5jpffgknaaR01zkj9YETVixUfNMQ==
X-Received: by 2002:a05:6a00:180a:b0:725:4301:ed5a with SMTP id d2e1a72fcca58-7257f8d5980mr5321451b3a.2.1733254539996;
        Tue, 03 Dec 2024 11:35:39 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254184ad5csm10826895b3a.199.2024.12.03.11.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:35:39 -0800 (PST)
Message-ID: <ed84a4df-490e-44f2-819a-9fe47d235e0e@linaro.org>
Date: Tue, 3 Dec 2024 11:35:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] docs: add a codebase section
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-6-pierrick.bouvier@linaro.org>
 <CAFEAcA-UkmPvyNW_6o22-WhaLxnnji55UsBp3UcPA-gYH7kvVg@mail.gmail.com>
 <87zflcbs0l.fsf@draig.linaro.org>
 <CAFEAcA_Mmf0fH8biPaZz9c1bw6UdmEvVWhdjUduzPTqH4njnhQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA_Mmf0fH8biPaZz9c1bw6UdmEvVWhdjUduzPTqH4njnhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: FypQWD8Xz8vJ

T24gMTIvMy8yNCAwOTo0NiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gVHVlLCAzIERl
YyAyMDI0IGF0IDE3OjIyLCBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
IHdyb3RlOg0KPj4NCj4+IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9y
Zz4gd3JpdGVzOg0KPj4NCj4+PiBPbiBNb24sIDE4IE5vdiAyMDI0IGF0IDE3OjI0LCBQaWVy
cmljayBCb3V2aWVyDQo+Pj4gPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4gd3JvdGU6
DQo+Pj4+DQo+Pj4+IFByZXNlbnQgdGhlIHZhcmlvdXMgcGFydHMgb2YgUUVNVSBhbmQgb3Jn
YW5pemF0aW9uIG9mIGNvZGViYXNlLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVy
cmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+Pj4NCj4+PiBJ
IGxpa2UgdGhpczsgaXQncyBzb21ldGhpbmcgSSd2ZSB0aG91Z2h0IGZvciBhIHdoaWxlIHdv
dWxkDQo+Pj4gYmUgZ29vZCB0byBoYXZlLCBidXQgd2hpY2ggSSBuZXZlciBnb3Qgcm91bmQg
dG8gdHJ5aW5nIHRvDQo+Pj4gcHV0IHRvZ2V0aGVyLiBUaGFua3MgZm9yIGRvaW5nIHRoaXMh
DQo+Pj4NCj4+PiBNb3N0bHkgbXkgY29tbWVudHMgYmVsb3cgYXJlIHNwZWxsaW5nL3R5cG8g
bml0cyBhbmQNCj4+PiBvdGhlciBtaW5vciBzdHVmZi4NCj4+Pg0KPj4+PiAtLS0NCj4+Pj4g
ICBkb2NzL2Fib3V0L2VtdWxhdGlvbi5yc3QgICAgICAgICAgICAgICB8ICAgMiArDQo+Pj4+
ICAgZG9jcy9jb2RlYmFzZS9pbmRleC5yc3QgICAgICAgICAgICAgICAgfCAyMTEgKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+PiAgIGRvY3MvZGV2ZWwvZGVjb2RldHJlZS5yc3Qg
ICAgICAgICAgICAgIHwgICAyICsNCj4+Pj4gICBkb2NzL2RldmVsL2VicGZfcnNzLnJzdCAg
ICAgICAgICAgICAgICB8ICAgMiArDQo+Pj4+ICAgZG9jcy9kZXZlbC9pbmRleC1pbnRlcm5h
bHMucnN0ICAgICAgICAgfCAgIDIgKw0KPj4+PiAgIGRvY3MvZGV2ZWwvbWlncmF0aW9uL21h
aW4ucnN0ICAgICAgICAgIHwgICAyICsNCj4+Pj4gICBkb2NzL2RldmVsL3FhcGktY29kZS1n
ZW4ucnN0ICAgICAgICAgICB8ICAgMSArDQo+Pj4+ICAgZG9jcy9kZXZlbC90ZXN0aW5nL21h
aW4ucnN0ICAgICAgICAgICAgfCAgIDkgKy0NCj4+Pj4gICBkb2NzL2RldmVsL3Rlc3Rpbmcv
cXRlc3QucnN0ICAgICAgICAgICB8ICAgMiArDQo+Pj4+ICAgZG9jcy9pbmRleC5yc3QgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKw0KPj4+PiAgIGRvY3MvaW50ZXJvcC9xZW11
LWdhLnJzdCAgICAgICAgICAgICAgIHwgICAyICsNCj4+Pj4gICBkb2NzL3N5c3RlbS9xZW11
LWJsb2NrLWRyaXZlcnMucnN0LmluYyB8ICAgMiArDQo+Pj4+ICAgZG9jcy90b29scy9xZW11
LXN0b3JhZ2UtZGFlbW9uLnJzdCAgICAgfCAgIDIgKw0KPj4+PiAgIGRvY3MvdXNlci9tYWlu
LnJzdCAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsNCj4+Pj4gICAxNCBmaWxlcyBjaGFu
Z2VkLCAyNDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+PiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkb2NzL2NvZGViYXNlL2luZGV4LnJzdA0KPj4+Pg0KPj4gPHNuaXA+DQo+
Pj4+ICsgIEJsb2NrIGRldmljZXMgYW5kIGBpbWFnZSBmb3JtYXRzPGRpc2sgaW1hZ2VzPmAg
aW1wbGVtZW50YXRpb24uDQo+Pj4+ICsqIGBic2QtdXNlciA8aHR0cHM6Ly9naXRsYWIuY29t
L3FlbXUtcHJvamVjdC9xZW11Ly0vdHJlZS9tYXN0ZXIvYnNkLXVzZXI+YF86DQo+Pj4+ICsg
IGBCU0QgVXNlciBtb2RlPGJzZC11c2VyLW1vZGU+YC4NCj4+Pj4gKyogYnVpbGQ6IFdoZXJl
IHRoZSBjb2RlIGJ1aWx0IGdvZXMhDQo+Pj4NCj4+PiBUaGUgYnVpbHQgY29kZSBkb2Vzbid0
IGhhdmUgdG8gYmUgaW4gJ2J1aWxkJy4gV2UgY291bGQgc2F5Og0KPj4+DQo+Pj4gICAqIGJ1
aWxkOiBZb3UgY2FuIHRlbGwgdGhlIFFFTVUgYnVpbGQgc3lzdGVtIHRvIHB1dCB0aGUgYnVp
bHQgY29kZQ0KPj4+ICAgICBhbnl3aGVyZSB5b3UgbGlrZS4gQnkgZGVmYXVsdCBpdCB3aWxs
IGdvIGludG8gYSBkaXJlY3RvcnkgbmFtZWQNCj4+PiAgICAgYGBidWlsZGBgLiBTb21ldGlt
ZXMgZG9jdW1lbnRhdGlvbiB3aWxsIGFzc3VtZSB0aGlzIGRlZmF1bHQNCj4+PiAgICAgZm9y
IGNvbnZlbmllbmNlIHdoZW4gZGVzY3JpYmluZyBjb21tYW5kIGxpbmVzOyB5b3UgY2FuIGFs
d2F5cw0KPj4+ICAgICByZXBsYWNlIGl0IHdpdGggdGhlIHBhdGggdG8geW91ciBidWlsZCB0
cmVlLg0KPj4+DQo+Pj4gPw0KPj4NCj4+IEkgYWx3YXlzIHJlY29tbWVuZCBjcmVhdGluZyBh
IGJ1aWxkcyBkaXJlY3RvcnkgYW5kIGhhdmluZyBtdWx0aXBsZSBidWlsZA0KPj4gdHJlZXMg
dW5kZXIgaXQ6DQo+IA0KPiBJbmRlZWQsIHRoYXQncyB3aGF0IEkgbGlrZSB0byBkbyB0b28s
IGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMNCj4gZG9jdW1lbnQgaXMgdGhlIHJpZ2h0IHBsYWNl
IHRvIG1ha2UgdGhhdCBraW5kIG9mIHJlY29tbWVuZGF0aW9uLg0KPg0KDQpJIGFncmVlIHdp
dGggUGV0ZXIuDQpQZW9wbGUgd2hvIHVuZGVyc3RhbmQgdGhpcyBuZWVkIGFscmVhZHkga25v
dyBob3cgdG8gZG8gaXQsIGFuZCBpdCdzIG5vdCANCnRoZSBiZXN0IHBsYWNlIHRvIG1lbnRp
b24gdGhhdC4NCg0KQXMgd2VsbCwgdXNpbmcgc2V2ZXJhbCBmb2xkZXJzIGNhbiBiZSBlcnJv
ciBwcm9uZSAodXNpbmcgIm9sZCIgYmluYXJpZXMgDQpieSBtaXN0YWtlIGhhcHBlbnMgcXVp
Y2tseSksIGFuZCBpdCdzIHNvbWV0aGluZyBJIHVzdWFsbHkgZG9uJ3QgYWR2aXNlIA0KZm9y
IGJlZ2lubmVycy4gVXNpbmcgYSBzeW1saW5rIHRoYXQgcG9pbnRzIHRvIHRoZSByaWdodCBm
b2xkZXIgaXMgbGVzcyANCmVycm9yIHByb25lLCBidXQgaXQgb3BlbnMgdGhlIHBhdGggdG8g
YW5vdGhlciAoY3VzdG9tIGFuZCBwZXJzb25hbCkgDQpsYXllciB0byB0aGUgYnVpbGQgY29t
bWFuZC4NCg0KQW5vdGhlciAobW9yZSBzaW1wbGUpIHNvbHV0aW9uIGlzIHRvIHVzZSBhIHNp
bmdsZSBmb2xkZXIsIGFuZCBzaW1wbHkgDQpyZWx5IG9uIGNjYWNoZSBmb3IgcXVpY2sgcmVi
dWlsZHMuDQoNClRoZXJlIGFyZSBwcm9iYWJseSBhcyBtYW55IHNvbHV0aW9ucyBhbmQgb3Bp
bmlvbnMgYXMgdGhlcmUgYXJlIA0KZGV2ZWxvcGVycyBvbiB0aGlzIHRocmVhZCwgc28gaXQn
cyBiZXR0ZXIgdG8gc2ltcGx5IG1lbnRpb24gb25lIGJ1aWxkIA0KZm9sZGVyLCBhbmQgbm90
aGluZyBlbHNlLg0KDQo+IC0tIFBNTQ0KDQo=
