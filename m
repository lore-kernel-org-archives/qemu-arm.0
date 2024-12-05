Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp319964njb;
        Thu, 5 Dec 2024 10:04:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1SfpX36YowDq7RQ0sQPeTPaNxWgz5nMvBhwFEu2bn/6CWiP9tLsV/vv83V6mRuwxFt9dXDFopLhSoJQ==@linaro.org
X-Received: by 2002:a17:902:e88f:b0:215:827e:64a1 with SMTP id d9443c01a7336-215bcfc47e0mr112295815ad.5.1733421842578;
        Thu, 05 Dec 2024 10:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733421842; cv=none;
        d=google.com; s=arc-20240605;
        b=WF3K6b2EcRm4EYzRE915JIK3WNJcscNixbPCK7B8nPosqEjQ36te5trd9RdWiAUh0w
         OoFnmbcDJygUdwhIUb1YQg6asaxDJtG5JlLtibjZN6P//U7RZrVSDvkP45nKKYTzQzAp
         byMxg16emsxVmS3k/P3KRbUrgN6vDAJ5qZuvgoOOpUhT71sF3LOTHULx28Gk6/YBA1pw
         Jm+L3pEL2uKj+R4+0Ns8OFT1CgOYYLkMobUAJG11MBihChOl6/7yhENV2x3jty6Nzwmg
         Q7Y5aLtOtqwwbmOJpza5/NbAZSA0EmpLa5VvPhZegxgd1J4ZgD+WTLLuP8H+6BM9XWw5
         SyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MaAYbjNGW8R6NddESSFBtMvXX9rcH3zIWlg8fyl9/fQ=;
        fh=hGcpTfKWioN60FG/XXvifhNsTG5toIktRFHx7lCln10=;
        b=V5o1XN+HFz1GDXNr2iBJ7EHMxXiHZ4sgPMvVnrM8UupiqV8XxBaPIQpmuw0Ui7LuM8
         59AEGvG6X3D2F27z/fK3vIpG+IeAAbhOI7sq+SWVa5Hqf5PR8agPDMHWNLznE/LkNFZj
         qpZp5rJjkfPv6Zp3+1JW9YZAyeEeizsotxHGWTumeynUsQWOqd3hrj1Z2wDEJa3d1QtX
         d9c0xyo5z+D01j2ukfrAX3CaPnMZIFSRA81ld2w0o0QGOiko965GsPEPhL8ZOG3opujx
         Z2PiGJGp0seYRBSEEbY6ZHukOkCZj1kzNI2UPKmQpAAEa6ZvtCmmXcaQhenpdgy+KVmG
         qLbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pOv3NClc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8e67348sor18816735ad.2.2024.12.05.10.04.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 10:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pOv3NClc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421842; x=1734026642; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaAYbjNGW8R6NddESSFBtMvXX9rcH3zIWlg8fyl9/fQ=;
        b=pOv3NClcw0AlK/LQ6tPMtdF70hO16ZrUOP0r6FZnRUjWSlKc56vny3310babvzeauI
         No1vGn46Ik56yD5vB1A80SY+oxWwKPWyZx5HEzt3ehCH4SMefr//jCuFDYSLT5i8qhtk
         T/vGLd0hiSfhJI4o8HsRePn49CAYEB+PosdLjxeLOUiZe1POgRvEZeITO9kLeamwOQn9
         TTHvp/bmDXokjtb2zIERzLzAM2EIRyMJwgeQzKzaHpGWkKCVVHZBYW7RmETrvzegfVzA
         EN3l/d8rAkKO4gl5S9zMdnz/NGOohOIOhxynoAHH3WldXi1WYNfpTI0wpWdLGxdFdv3r
         YR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421842; x=1734026642;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MaAYbjNGW8R6NddESSFBtMvXX9rcH3zIWlg8fyl9/fQ=;
        b=tQgBcUlGVgwUVpUNeNQ/LvM/r9PN21BeUWM4kxJmw0TptpkdMNs9S4wZgn+L/WdUDU
         6feQPYixLWC5FexV+ZZa6iT0a2RFtachMZfdSw8pPjixpHTs7CaGRNhMP0LdLuTVH0vG
         SET/q7WMv182lAsS3vgd0QiH9nm7x2NP/XBTuWTXfee8AcaT5f55qn7GIgxzoVuYdw3w
         YtjrvSp0G6qJdUJpfp+EDyuvX81kLd3pAsz32RG5Zzs3k4JIHgd63Yu5amJ7rfiJwhv1
         dgf+RyYdEoU3wuFy8VOxrjyPTHA+5lioTdtK9obJiyrckqp2LMyyNeMyKHieTPdTR/N8
         thRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQQoEgMLD+1IEXWje9cvRelKzKFp7vgaZe1nqMx9w7+h5wVqEOrseDr9XrMmuibqSh/0R7p+U3dLowlQ==@linaro.org
X-Gm-Message-State: AOJu0YzFbneVY2YPeRGhia8F3LmHwVR9DT3ipGh2A/pgKrfT9euRolwM
	OTcIQyg4/5zDd6A67b+M9TOPQWR3hESZGsRwtSE7yTBpr6sC7zb0aVHu0YP1cUwm5g==
X-Gm-Gg: ASbGncvCbPq/zHd9rNrJ9bl0KFHbgFC56KDR8dubMZ3oKuBInuF7RAUp5sk1m+AHo5B
	3cWk0J8LcgTrw3/VDdQB8zfeS7AXdloOg8fmoavbWrSrgNP1poVJ+wa1xuUfFtgwHf7l/U4TGGr
	t9ENpe2nEtJDibg7s2Nh6TUWkXRFMlXJl/FElc2rF6EvbvtrsowZE9l9Rradx5O9kE8KSubcMTP
	4x6616eFMH4CJJKEHhCqdXTuCHC2LuwRT0/4GfEwZDcahlNeWtGWULoAQu5d5cc6qXMIpoEJSKh
	G2mxpZLGJPsC9dniUsi3GA==
X-Google-Smtp-Source: AGHT+IF1teHSvazkGFlu4v9HhscF9eLqZQXCSYVDXOjTx9v1rL3bYc/ztHe8pt+0V31naoXsQEAtCQ==
X-Received: by 2002:a17:902:cec7:b0:215:3661:747e with SMTP id d9443c01a7336-215bcfc5c76mr123274415ad.8.1733421842116;
        Thu, 05 Dec 2024 10:04:02 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e61ef7sm15450595ad.95.2024.12.05.10.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 10:04:01 -0800 (PST)
Message-ID: <a9401d13-d23b-4d18-841e-4239e216168f@linaro.org>
Date: Thu, 5 Dec 2024 10:04:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs/system/arm/fby35: document execute-in-place
 property
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 alex.bennee@linaro.org, Alistair Francis <alistair@alistair23.me>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
 <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
 <c2e4c538-2e0b-4882-8a92-6ff439cebd09@kaod.org>
 <3ba7dabb-67cf-450f-828c-5adf7332fc91@linaro.org>
 <96b027f9-3637-4416-9eba-a175635026ca@kaod.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <96b027f9-3637-4416-9eba-a175635026ca@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: kJI00uIsWmZR

T24gMTIvNS8yNCAwOToyOSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IE9uIDEyLzUv
MjQgMTg6MDksIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAxMi81LzI0IDAwOjE4
LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4+PiBIZWxsbyBQaWVycmljaywNCj4+Pg0K
Pj4+IFRoYW5rcyBmb3IgaW1wcm92aW5nIHRoZSBkb2N1bWVudGF0aW9uICENCj4+Pg0KPj4+
IE9uIDEyLzQvMjQgMjE6MzksIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
Zz4NCj4+Pj4gLS0tDQo+Pj4+ICDCoMKgIGRvY3Mvc3lzdGVtL2FybS9mYnkzNS5yc3QgfCAz
ICsrKw0KPj4+PiAgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pj4+
DQo+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL3N5c3RlbS9hcm0vZmJ5MzUucnN0IGIvZG9jcy9z
eXN0ZW0vYXJtL2ZieTM1LnJzdA0KPj4+PiBpbmRleCBiZjZkYTZiYWEyYS4uZWQ5ZmFlZjM2
M2MgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RvY3Mvc3lzdGVtL2FybS9mYnkzNS5yc3QNCj4+Pj4g
KysrIGIvZG9jcy9zeXN0ZW0vYXJtL2ZieTM1LnJzdA0KPj4+PiBAQCAtNDUsMyArNDUsNiBA
QCBwcm9jZXNzIHN0YXJ0cy4NCj4+Pj4gIMKgwqDCoMKgwqDCoCAkIHNjcmVlbiAvZGV2L3R0
eTAgIyBJbiBhIHNlcGFyYXRlIFRNVVggcGFuZSwgdGVybWluYWwgd2luZG93LCBldGMuDQo+
Pj4+ICDCoMKgwqDCoMKgwqAgJCBzY3JlZW4gL2Rldi90dHkxDQo+Pj4+ICDCoMKgwqDCoMKg
wqAgJCAocWVtdSkgY8KgwqDCoMKgwqDCoMKgwqDCoMKgICMgU3RhcnQgdGhlIGJvb3QgcHJv
Y2VzcyBvbmNlIHNjcmVlbiBpcyBzZXR1cC4NCj4+Pj4gKw0KPj4+PiArVGhpcyBtYWNoaW5l
IG1vZGVsIHN1cHBvcnRzIGVtdWxhdGlvbiBvZiB0aGUgYm9vdCBmcm9tIHRoZSBDRU8gZmxh
c2ggZGV2aWNlIGJ5DQo+Pj4+ICtzZXR0aW5nIG9wdGlvbiBgYGV4ZWN1dGUtaW4tcGxhY2Vg
YC4NCj4+Pg0KPj4+IENvdWxkIHdlIGFkZCBhIGxpbmsgdG8gdGhlICJCb290IG9wdGlvbnMi
IHNlY3Rpb24gb2YgdGhlDQo+Pj4gIkFzcGVlZCBmYW1pbHkgYm9hcmRzIiBkb2N1bWVudCBp
bnN0ZWFkID8NCj4+Pg0KPj4NCj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGFzcGVlZCBi
b2FyZCBoYXMgb3RoZXIgb3B0aW9ucyAoZm1jLW1vZGVsLCBzcGktbW9kZWwpLCBzbyBpdCB3
b3VsZCBiZSBjb25mdXNpbmcgZm9yIHRoZSByZWFkZXIuDQo+IA0KPiBvay4gSnVzdCB0byBj
bGFyaWZ5LCB0aGUgQXNwZWVkIG1hY2hpbmVzIGFsd2F5cyBib290IGZyb20gQ0UwIChpZiB5
b3UNCj4gZXhjbHVkZSByYWluaWVyKS4NCj4gDQoNCk9rLCBJIHdhcyBub3QgYXdhcmUgb2Yg
dGhhdC4NCkknbSBub3QgZmFtaWxpYXIgd2l0aCB0aG9zZSBtYWNoaW5lIG1vZGVscywgYW5k
IGp1c3QgaGF2ZSBiZWVuIGEgDQpkb2N1bWVudGF0aW9uIHVwZGF0ZXIgaGVyZSwgc28gbXkg
a25vd2xlZGdlIGlzIGxpbWl0ZWQuDQoNCj4gV2l0aCB0aGUgImV4ZWN1dGUtaW4tcGxhY2Ui
IG9wdGlvbiwgdGhlIENQVSBmZXRjaGVzIGluc3RydWN0aW9ucyB0bw0KPiBleGVjdXRlIGJ5
IHJlYWRpbmcgQ0UwIGFuZCBub3QgZnJvbSBhIHByZWxvYWRlZCBST00gaW5pdGlhbGl6ZWQg
YXQNCj4gbWFjaGluZSBpbml0IHRpbWUuIEkgdGhpbmsgaXQgaXMgZ29vZCB0byBtZW50aW9u
IHRoZSBkaWZmZXJlbmNlIGFuZA0KPiB0aGUgaW1wYWN0IG9uIHBlcmZvcm1hbmNlIDogSXQg
aXMgbW9yZSBhY2N1cmF0ZSBtb2RlbGluZyBidXQgc2xvd2VyLg0KPiANCg0KSSdsbCBhZGQg
dGhpcy4NCg0KVGhpcyBtYWNoaW5lIG1vZGVsIHN1cHBvcnRzIGVtdWxhdGlvbiBvZiB0aGUg
Ym9vdCBmcm9tIHRoZSBDRTAgZmxhc2ggDQpkZXZpY2UgYnkgc2V0dGluZyBvcHRpb24gYGBl
eGVjdXRlLWluLXBsYWNlYGAuIFdoZW4gdXNpbmcgdGhpcyBvcHRpb24sIA0KdGhlIENQVSBm
ZXRjaGVzIGluc3RydWN0aW9ucyB0byBleGVjdXRlIGJ5IHJlYWRpbmcgQ0UwIGFuZCBub3Qg
ZnJvbSBhIA0KcHJlbG9hZGVkIFJPTSBpbml0aWFsaXplZCBhdCBtYWNoaW5lIGluaXQgdGlt
ZS4gQXMgYSByZXN1bHQsIGV4ZWN1dGlvbiANCndpbGwgYmUgc2xvd2VyLg0KDQpJcyB0aGF0
IG9rIGZvciB5b3U/DQoNCj4+IEl0J3Mgd29ydGggcmVwZWF0aW5nIHdoYXQgdGhlIG9wdGlv
biBtZWFucyBJTUhPLg0KPiANCj4gc3VyZS4gbnAuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBD
Lg0KDQo=
