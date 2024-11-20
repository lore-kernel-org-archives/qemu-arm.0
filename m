Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4259862njc;
        Wed, 20 Nov 2024 13:45:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUn1MB6OIKNNDYIoFgzLj2cUw+tvHNdu5fnQKmF1OL5YmPKqIa5vS91A0egxh+SWx3N0hKL2Oiis4awBg==@linaro.org
X-Received: by 2002:a05:6870:3910:b0:296:e321:c447 with SMTP id 586e51a60fabf-296e321df44mr3928161fac.0.1732139104254;
        Wed, 20 Nov 2024 13:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732139104; cv=none;
        d=google.com; s=arc-20240605;
        b=HGdYDNha1IN1r3FfSmnMJa05FPiWZeEYngm/rkezRucs4QEeaiOwzYjQt473Igbha6
         ZjSPVu6gHSPGzerURVk/Ymzv3Q3M2RyOwi97KBHY9rwj1fx9hhSbnT8QszmC70KdQKl/
         Xx7HmRwoon6RPx5iVqVf29EirZ+WSoie6OxqDm8yfSnsZEamHXPUkd06ct9iqyPCVtlh
         k3wlHdFoR5uoPk3v1fIiWCqR5dqrQR1+TrPvgWDzagQQGimuXQAPihC/H5VJyWmJJA/n
         JqhnWj1nb7ppzEoziNBX6gcW2n0SFOGfRngvfF8TTUZHLpJ+PLdkRmj6IG/xRQ3/MqFv
         TG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TJla3E3VDFFTN5aiOh6fW6EvLvRgDPOxGQ6cFC1p1Kc=;
        fh=LhJg2/w9kPkfrnQnJo8aSYtWIsTkS0La/AXjHlnSXos=;
        b=JiHGtEKe+FSZ408Gi/0Jp8swHv8M5KoG+Rou2frz5zQwwiN7R6czk+cuOdv5DAuNmD
         mmZIhnKlbRTO0IhKfydm/Ev9cpaof7L4p6MrPiW16UpzQ688psb7s4UFKuDTQdNP8efR
         Bfw+36ojiMkpVjslZD63YtgVM52TIyIOPSF7nxIVE6SfRlVZt1tAqVXE8R5SzFv1y1iL
         VCAzSNQ7UReIFBTwFSN7frdqJ2mS6Xc6ZustlRCa/8G8M5kDzgk5zn2aH9GFa81b2FTV
         if1a0vp8WSnGxOqjqNr8AZrdTG5vXcn6xpupgT7xFTdLuH4W7vc/hNLwqFvfdiQ4YimX
         tLMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIUifj8E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-71ab31fe09bsor858735a34.12.2024.11.20.13.45.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2024 13:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIUifj8E;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732139104; x=1732743904; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJla3E3VDFFTN5aiOh6fW6EvLvRgDPOxGQ6cFC1p1Kc=;
        b=YIUifj8E3LffDZS+OuteG5OPE200KBdAW0mNStQl+RbFuyqEYj93q1yuuwzNvgdlv7
         WXK1t7Fy4XlBY1FA6Td4vdb5n/JBRe4wNtNNtoZXH6PzWpoNQl5MoIZIASeWZn5Cwojm
         vOspUh/gEinllgdveLivcFzpTiDNImrzfVBg6PEV0HmRcCWTA52EJXUi1mtmKJIaOwFj
         iLiIivE1e7IyAbEEx6UW4gQ+1hkHyNS/MDLVW9DXv5dTVnZLo3EKvxCwDYXZ9Ol5DmJP
         QB6+ltlQhwWqI5mK7u4DNSQ1WPQav4H05Pt5D/tBUK+Idq7L4Nbt9IWIlBqDtaFotTJv
         gAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139104; x=1732743904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJla3E3VDFFTN5aiOh6fW6EvLvRgDPOxGQ6cFC1p1Kc=;
        b=AAg3FC14d86AOmIkuCQm0NbpbRAoyTcCMycTMH49PIKehFK9Hv9A8faCKE3wH8dBeL
         4QsGtZt3sSA8bNiz5sFUmqa0PaAexVYD/GrX+MYI0y7HT0W2ezRAVaJIjjEvaZux+ZDZ
         HzwFJ9154nqAygMobDmJ1+0xddewtL0Vo928GV1UXEY8+YAVmQaxuadMF6VVyVbcRMEg
         CeXUCMhs0R2oRi8ExfFmcXk08Q3pc2+fQkFcQ5BJBxF2uQVL9jXs6Bq6qQgvZEnmI/cC
         W+7pxDHnDXaLkRIdu7dR/EPuqawlhaMBRRInZ4ed1Cuwc8uXZRQR/mLHfO3slbka+nfw
         Lkyw==
X-Forwarded-Encrypted: i=1; AJvYcCUFiZsMb0/deUjGj+76SsThituOQqAJqX+mbrATGspsMEMRDSRh8wwEk8Ep+DoaSb+LoLmb4Pr0MOq1mw==@linaro.org
X-Gm-Message-State: AOJu0YykVtXEn1TXeJkaYOQZDx0Engsk/ufjjkpibIX53nrUHWwtIcAh
	0iSVNHx5cxfSmfGyknoPpFF/ZfkNaGypmXv1XwQcCg7X+9YwjHvpOCcMgapvOLXrF4gX6um5q75
	zBP48zOTV
X-Google-Smtp-Source: AGHT+IErPeFBjMpL5ETlyT9kF3tUsdjau2FQOJeVrBaUhVTCY56Gz4+PVGcx/4wBiXEXeY34qNzCPw==
X-Received: by 2002:a9d:6553:0:b0:710:f879:a15a with SMTP id 46e09a7af769-71ab31d8ba8mr4131033a34.27.1732139103846;
        Wed, 20 Nov 2024 13:45:03 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb65821b8sm21973a12.68.2024.11.20.13.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 13:45:03 -0800 (PST)
Message-ID: <94ead9ab-e290-4469-931a-d447d26f27aa@linaro.org>
Date: Wed, 20 Nov 2024 13:45:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/devel: add git-publish for patch submitting
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
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
 <ZzxUeTxHBHKlEhwN@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ZzxUeTxHBHKlEhwN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: S/WAPBJmfw5d

T24gMTEvMTkvMjQgMDE6MDQsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+IE9uIE1v
biwgTm92IDE4LCAyMDI0IGF0IDA5OjIzOjUyQU0gLTA4MDAsIFBpZXJyaWNrIEJvdXZpZXIg
d3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgZG9jcy9kZXZlbC9zdWJtaXR0aW5n
LWEtcGF0Y2gucnN0IHwgMTQgKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC9zdWJt
aXR0aW5nLWEtcGF0Y2gucnN0IGIvZG9jcy9kZXZlbC9zdWJtaXR0aW5nLWEtcGF0Y2gucnN0
DQo+PiBpbmRleCAzNDljMzJlZTNhOS4uOTUzNjgyZjIwY2IgMTAwNjQ0DQo+PiAtLS0gYS9k
b2NzL2RldmVsL3N1Ym1pdHRpbmctYS1wYXRjaC5yc3QNCj4+ICsrKyBiL2RvY3MvZGV2ZWwv
c3VibWl0dGluZy1hLXBhdGNoLnJzdA0KPj4gQEAgLTIzNyw2ICsyMzcsMjAgQEAgYXR0YWNo
bWVudHMgY2FuIGJlIHVzZWQgYXMgYSBsYXN0IHJlc29ydCBvbiBhIGZpcnN0LXRpbWUgc3Vi
bWlzc2lvbi4NCj4+ICAgDQo+PiAgIC4uIF9pZl95b3VfY2Fubm90X3NlbmRfcGF0Y2hfZW1h
aWxzOg0KPiANCj4gVGhpcyBuZWVkcyB0byByZW1haW4gYXNzb2NpYXRlZCB3aXRoIHRoZSBo
ZWFkaW5nIHRoYXQgaXMgKmFmdGVyKg0KPiB5b3VyIG5ldyBibG9jayBvZiB0ZXh0LCB3aGls
ZSBoZXJlIHlvdSBuZWVkIHRvIGFkZCBhIG5ldyBhbmNob3INCj4gDQoNCk9vcHMsIHRoYXQg
d2FzIG5vdCBpbnRlbnRpb25hbCwgdGhhbmtzIGZvciBwb2ludGluZyB0aGlzLg0KRml4ZWQg
YW5kIGFkZGVkIHRoZSBuZXcgYW5jaG9yIGluIGNhc2Ugc29tZW9uZSBuZWVkcyBpdC4NCg0K
PiAgICAgLi4gX3VzZV9naXRfcHVibGlzaDoNCj4gDQo+PiAgIA0KPj4gK1VzZSBnaXQtcHVi
bGlzaA0KPj4gK35+fn5+fn5+fn5+fn5+fg0KPj4gKw0KPj4gK0lmIHlvdSBhbHJlYWR5IGNv
bmZpZ3VyZWQgZ2l0IHNlbmQtZW1haWwsIHlvdSBjYW4gc2ltcGx5IHVzZSBgZ2l0LXB1Ymxp
c2gNCj4+ICs8aHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmhhL2dpdC1wdWJsaXNoPmBfXyB0
byBzZW5kIHNlcmllcy4NCj4+ICsNCj4+ICs6Og0KPj4gKw0KPj4gKyAgICAkIGdpdCBjaGVj
a291dCBtYXN0ZXIgLWIgbXktZmVhdHVyZQ0KPj4gKyAgICAkICMgd29yayBvbiBuZXcgY29t
bWl0cywgYWRkIHlvdXIgJ1NpZ25lZC1vZmYtYnknIGxpbmVzIHRvIGVhY2gNCj4+ICsgICAg
JCBnaXQgcHVibGlzaA0KPj4gKyAgICAkIC4uLiBtb3JlIHdvcmssIHJlYmFzZSBvbiBtYXN0
ZXIsIC4uLg0KPj4gKyAgICAkIGdpdCBwdWJsaXNoICMgd2lsbCBzZW5kIGEgdjINCj4gDQo+
IEFsc28gYWRkIGEgbm90ZQ0KPiANCj4gICAiRWFjaCB0aW1lIHlvdSBwb3N0IGEgc2VyaWVz
LCBnaXQtcHVibGlzaCB3aWxsIGNyZWF0ZSBhIGxvY2FsIHRhZw0KPiAgICB3aXRoIHRoZSBm
b3JtYXQgYGA8YnJhbmNobmFtZT4tdjx2ZXJzaW9uPmBgIHRvIHJlY29yZCB0aGUgcGF0Y2gN
Cj4gICAgc2VyaWVzLiINCj4gDQoNCkFkZGVkIHRoaXMg8J+RjS4NCg0KPj4gKw0KPj4gICBJ
ZiB5b3UgY2Fubm90IHNlbmQgcGF0Y2ggZW1haWxzDQo+PiAgIH5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4+ICAgDQo+PiAtLSANCj4+IDIuMzkuNQ0KPj4NCj4gDQo+IFdp
dGggcmVnYXJkcywNCj4gRGFuaWVsDQoNCg==
