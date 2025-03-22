Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp664955njc;
        Fri, 21 Mar 2025 17:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBrE8iV7lCDgp0LgR2o+FfJyQw28NzAObkUijn1Wqm66ponl1iL7l3PxawjK7sniK1CayOnP/Scb+bGA==@linaro.org
X-Received: by 2002:a17:902:d4c5:b0:216:53fa:634f with SMTP id d9443c01a7336-22780e206a3mr85214635ad.48.1742602814620;
        Fri, 21 Mar 2025 17:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742602814; cv=none;
        d=google.com; s=arc-20240605;
        b=haO4H9LzoXLIwrFbkkd8DRPTAZqHQIv1ZJgwoMKU65ZRpS/78esUJlCqXyFKItATtc
         8fFk5D93uQZPyEBJLnE3/hmHJkQFsy9KWwKMDMh5ghDA5EHN2O7SrcKyAOH1jZsl62I9
         o6DpMpGEod2MoBWSPX5IgaBkJwjsfxnT714pjma1z14q/XwdrCaPerAeBTPQD82GcDAP
         oz687ItIMJWmNtQPiJOFxA0SE8kp9caTbZwEEIWLPZJKm8FLUMQjNDB2PWUGlK/NOBMP
         99PmRzW2RJzwZN3fNh6k4rMtQEOv2DB1oGaFHpUX49g/cFriCo2yTQGrkGvifGBLXQ1i
         VTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gmihTeepoM01G32VwMRKIpoRxTtCyWjhxO8/HlXx56w=;
        fh=LHhN//MRAs17hXOBwCGqySxsDJG0d9Mlad/Mye4eQNE=;
        b=fycBk3WoGQXUvzikylYDufEcxGwYxrI4p4Z/kMxXhc1mJiqXzm8wECsiAVh+ltxsOf
         3JWM8qWXsgD10qH6ke93z3nqu8xz5Vuf3hCDFZt3gaCAhs/MTfsNtpb54Pg/uvsoIrcH
         nvwZW3GnWPGDhgPO1P4hCu35zQSbPhwLrpgPHhQvtTvwL74Y7hgyc3bh4tmJTV+5xqyZ
         bnQzufJfYnAbThZOYkjIkLdB4BrHYpubdTI1qwA1WDVF5FztY8JL2KQ0fahHtMoMAKUR
         SDy6Gwm7g/KGbo9NYDgHjzgg0h1BZfPY3AE4l0B2g58oGeFHFqRxZGtN0C4aZvszHash
         ZGOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YK7lYBHu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811d1f78sor19113945ad.16.2025.03.21.17.20.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 17:20:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YK7lYBHu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742602814; x=1743207614; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmihTeepoM01G32VwMRKIpoRxTtCyWjhxO8/HlXx56w=;
        b=YK7lYBHutzrFy0Pq06cO55vwKpjU5DXjo4UL0ssJg3RHJuB35J+yfn53Llk3bWUcwA
         RXkL3OGfLwg7uZOm5biU162RNkvpWTGBZR+f4pkZINXP5hCswssWQiZpcmZMEdufm37c
         U8KiMM5wEeJu3bgOK5loxzEmxZS/m5hvH8jf+QyAQ3vc+e/VfWtcCpBkwA0b6ESHz0Ah
         UfOdAld+fU2rQE3UzmDF6k87lShS5Jm+91/yP+NVry+o0crvhTd52D4lksdhCpn08zN6
         ttXtV3ur2n/AFFZjVzVjSAre+JRbufFiExAE9QU6wEpMgTLE4iEM+/BYUQL4ptpQlGcT
         InpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602814; x=1743207614;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmihTeepoM01G32VwMRKIpoRxTtCyWjhxO8/HlXx56w=;
        b=lYTnejzUc38u6IBn3l31nQRr0rIH32haWxDek6WRUWMT3gfJbOqJBD6itM8dS8riUl
         DEL77KHkrdILxODnrpZ2KcQmX5RTkGJ1SmdQ2AGFBKmFVcIZMhMQiihKVVYpzF7AYcAv
         OB337teLuSzMuSujupqW1LdABGUme5ZkxB5uDXHiN0A4VuyR1XXQ6SzD+aNPRAF/ZEpE
         LsK4PnTYMA/Zf6apXedEnafe/VRzmIf5B1DfdYyW/T6X8Jj6Df1y2g/kQpFJM9Cw4T67
         S6TUi1rgjZ7GkESmlnmMyay0uvpEhCIeJzhhDkwUhuMIoCA3vQYS9aqsPb/tWzoaXtkt
         ZvIA==
X-Forwarded-Encrypted: i=1; AJvYcCXnEVql/CyDgmGslEUWYoldNoy6kw/Th1Dh+ttUnGxNd/43kPhmttfzoj7CaiZMnyr/63jmBxY8KFvxJQ==@linaro.org
X-Gm-Message-State: AOJu0YxAA1v7VRv4SxJFAYYaR4jF8UzKtoTnuk42rRDPizPEtWUeLzoD
	4rZVy3mlaYZhyoYZftdCE9FLMdJZiFVFRUvrQyTGp0SCMgYRGw0iDMHoKeQUD0KBOg==
X-Gm-Gg: ASbGnctS/OM7eAIF6Y2tuKNrMqdwX8w6v07jzORc2svnWIsIh9AJMi4Jt7kj8xg/rZK
	WmVcw95pFSrC49gtqEy/z7fY/ulWJxElKf8saCQ7qw74t4Y4W9C2K2q0VjWPXzoR+26QlSOMQSq
	qWuEOKzzeHDYY6nkZxHH+p9SYAMAyXD+FZGptrxKkAHT8mTtEWUOUdudb+lTgz7s3wp+y55bvRj
	NfGgRu3cYmKlkvCFJZjIq7nBwC0xGfhEnn2LKcM8AFoKKiWzt7qYvk0zhTCQq5V7fAXrwx0FYIK
	O50ctTSq8GuYZ0Ii9o4fagDCkWBkkW0HgHl9VIAK0t/kNbnp9unVsjBtsDpE6sg0f4Ki
X-Google-Smtp-Source: AGHT+IEiwshH0mEB0ml11+5ohr1OVAQK1GvcSU9JeTsnEj9XYL0ycGei7ChHq5z6xhuvXYlP6cdGKQ==
X-Received: by 2002:a17:903:18c:b0:220:d909:1734 with SMTP id d9443c01a7336-22780c7a955mr74702015ad.14.1742602814010;
        Fri, 21 Mar 2025 17:20:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576aa7sm6892181a91.4.2025.03.21.17.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 17:20:13 -0700 (PDT)
Message-ID: <c1b7b73e-0a59-46cf-bf33-5712df5d9b75@linaro.org>
Date: Fri, 21 Mar 2025 17:20:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
 <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
 <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
 <216a39c6-384d-4f9e-b615-05af18c6ef59@linaro.org>
 <c0e338f5-6592-4d83-9f17-120b9c4f039e@linaro.org>
 <ebd25730-1947-4360-af36-cf1131f4155c@linaro.org>
Content-Language: en-US
In-Reply-To: <ebd25730-1947-4360-af36-cf1131f4155c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: YrtQohrUKW1/

T24gMy8yMS8yNSAxNzowMSwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gT24gMy8yMS8y
NSAxNToxOSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+PiBPbiAzLzIxLzI1IDEzOjEx
LCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+IE9uIDMvMjEvMjUgMTI6MjcsIFJpY2hh
cmQgSGVuZGVyc29uIHdyb3RlOg0KPj4+PiBPbiAzLzIxLzI1IDExOjA5LCBQaWVycmljayBC
b3V2aWVyIHdyb3RlOg0KPj4+Pj4+IE1tbSwgb2sgSSBndWVzcy7CoCBZZXN0ZXJkYXkgSSB3
b3VsZCBoYXZlIHN1Z2dlc3RlZCBtZXJnaW5nIHRoaXMgd2l0aCBwYWdlLXZhcnkuaCwgYnV0
DQo+Pj4+Pj4gdG9kYXkgSSdtIGFjdGl2ZWx5IHdvcmtpbmcgb24gbWFraW5nIFRBUkdFVF9Q
QUdFX0JJVFNfTUlOIGEgZ2xvYmFsIGNvbnN0YW50Lg0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4g
V2hlbiB5b3UgbWVudGlvbiB0aGlzLCBkbyB5b3UgbWVhbiAiY29uc3RhbnQgYWNjcm9zcyBh
bGwgYXJjaGl0ZWN0dXJlcyIsIG9yIGEgZ2xvYmFsDQo+Pj4+PiAoY29uc3QpIHZhcmlhYmxl
IHZzIGhhdmluZyBhIGZ1bmN0aW9uIGNhbGw/DQo+Pj4+IFRoZSBmaXJzdCAtLSBjb25zdGFu
dCBhY3Jvc3MgYWxsIGFyY2hpdGVjdHVyZXMuDQo+Pj4+DQo+Pj4NCj4+PiBUaGF0J3MgZ3Jl
YXQuDQo+Pj4gRG9lcyBjaG9vc2luZyB0aGUgbWluKHNldF9vZihUQVJHRVRfUEFHRV9CSVRT
X01JTikpIGlzIHdoYXQgd2Ugd2FudCB0aGVyZSwgb3IgaXMgdGhlDQo+Pj4gYW5zd2VyIG1v
cmUgc3VidGxlIHRoYW4gdGhhdD8NCj4+DQo+PiBJdCB3aWxsIGJlLCB5ZXMuDQo+Pg0KPj4g
VGhpcyBpc24ndCBhcyBoYXJkIGFzIGl0IHNlZW1zLCBiZWNhdXNlIHRoZXJlIGFyZSBleGFj
dGx5IHR3byB0YXJnZXRzIHdpdGgNCj4+IFRBUkdFVF9QQUdFX0JJVFMgPCAxMjogYXJtIGFu
ZCBhdnIuDQo+Pg0KPj4gQmVjYXVzZSB3ZSBzdGlsbCBzdXBwb3J0IGFybXY0LCBUQVJHRVRf
UEFHRV9CSVRTX01JTiBtdXN0IGJlIDw9IDEwLg0KPj4NCj4+IEFWUiBjdXJyZW50bHkgaGFz
IFRBUkdFVF9QQUdFX0JJVFMgPT0gOCwgd2hpY2ggaXMgYSBiaXQgb2YgYSBwcm9ibGVtLg0K
Pj4gTXkgZmlyc3QgdGFzayBpcyB0byBhbGxvdyBhdnIgdG8gY2hvb3NlIFRBUkdFVF9QQUdF
X0JJVFNfTUlOID49IDEwLg0KPj4NCj4+IFdoaWNoIHdpbGwgbGVhdmUgdXMgd2l0aCBUQVJH
RVRfUEFHRV9CSVRTX01JTiA9PSAxMC4NCj4+DQo+IA0KPiBPay4NCj4gDQo+ICAgRnJvbSB3
aGF0IEkgdW5kZXJzdGFuZCwgd2UgbWFrZSBzdXJlIHRsYiBmbGFncyBhcmUgc3RvcmVkIGlu
IGFuDQo+IGltbXV0YWJsZSBwb3NpdGlvbiwgd2l0aGluIHZpcnR1YWwgYWRkcmVzc2VzIHJl
bGF0ZWQgdG8gZ3Vlc3QsIGJ5IHVzaW5nDQo+IGxvd2VyIGJpdHMgYmVsb25naW5nIHRvIGFk
ZHJlc3MgcmFuZ2UgaW5zaWRlIGEgZ2l2ZW4gcGFnZSwgc2luY2UgcGFnZQ0KPiBhZGRyZXNz
ZXMgYXJlIGFsaWduZWQgb24gcGFnZSBzaXplLCBsZWF2aW5nIHRob3NlIGJpdHMgZnJlZS4N
Cj4gDQo+IGJpdHMgWzAuLjIpIGFyZSBic3dhcCwgd2F0Y2hwb2ludCBhbmQgY2hlY2tfYWxp
Z25lZC4NCj4gYml0cyBbVEFSR0VUX1BBR0VfQklUU19NSU4gLSA1Li5UQVJHRVRfUEFHRV9C
SVRTX01JTikgYXJlIHNsb3csDQo+IGRpc2NhcmRfd3JpdGUsIG1taW8sIG5vdGRpcnR5LCBh
bmQgaW52YWxpZCBtYXNrLg0KPiBBbmQgdGhlIGNvbXBpbGUgdGltZSBjaGVjayB3ZSBoYXZl
IGlzIHRvIG1ha2Ugc3VyZSB3ZSBkb24ndCBvdmVybGFwDQo+IHRob3NlIHNldHMgKHdvdWxk
IGhhcHBlbiBpbiBUQVJHRVRfUEFHRV9CSVRTX01JTiA8PSA3KS4NCj4gDQo+IEkgd29uZGVy
IHdoeSB3ZSBjYW4ndCB1c2UgYml0cyBbMy4uOCkgZXZlcnl3aGVyZSwgbGlrZSBpdCdzIGRv
bmUgZm9yDQo+IEFWUiwgZXZlbiBmb3IgYmlnZ2VyIHBhZ2Ugc2l6ZXMuIEkgbm90aWNlZCB0
aGUgY29tbWVudCBhYm91dCAiYWRkcmVzcw0KPiBhbGlnbm1lbnQgYml0cyIsIGJ1dCBJJ20g
Y29uZnVzZWQgd2h5IGJpdHMgWzAuLjIpIGNhbiBiZSB1c2VkLCBhbmQgbm90DQo+IHVwcGVy
IG9uZXMuDQo+IA0KPiBBcmUgd2Ugc3RvcmluZyBzb21ldGhpbmcgZWxzZSBpbiB0aGUgbWlk
ZGxlIG9uIG90aGVyIGFyY2hzLCBvciBkaWQgSQ0KPiBtaXNzIHNvbWUgcGllY2Ugb2YgdGhl
IHB1enpsZT8NCj4gDQoNCkFmdGVyIGxvb2tpbmcgYmV0dGVyLCBUTEJfU0xPV19GTEFHUyBh
cmUgbm90IHBhcnQgb2YgYWRkcmVzcywgc28gd2UgDQpkb24ndCB1c2UgYml0cyBbMC4uMiku
DQoNCkZvciBhIGdpdmVuIFRBUkdFVF9QQUdFX1NJWkUsIGhvdyBkbyB3ZSBkZWZpbmUgYWxp
Z25tZW50IGJpdHM/DQoNCj4gVGhhbmtzLA0KPiBQaWVycmljaw0KPiANCj4+DQo+PiByfg0K
PiANCg0K
