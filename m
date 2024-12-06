Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1090730njb;
        Fri, 6 Dec 2024 11:26:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUDX8GozapmVzKM9wdJKD7Zcyacx3w+XY4i5zw7ZUjruiH1jX6NbZ3RlrL/J6eRvnOV2JRPQSRUdxQBA==@linaro.org
X-Received: by 2002:a17:902:f78c:b0:20c:9821:6998 with SMTP id d9443c01a7336-21614d1d053mr51174575ad.10.1733513216143;
        Fri, 06 Dec 2024 11:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733513216; cv=none;
        d=google.com; s=arc-20240605;
        b=ACKOwVROPi9M/gC1qE4gwM96TgNOV67938S4AueHseodix6ghLWbgDst/NLQi4WUBT
         gLu8gv/d2iELKU5QHi3zZ6ka7K/3vqBfg4BZL8grt5GcvkQ9kVgIXeND0s9MVOHuPT+H
         YvRkWHROd+hQ8wHWcTj3V+gFwgjrGUI/eAum3oeXN0+ztyWDcBLRa/xwcROYgEUmlF8P
         iW1V/Xd5KHK5R3qX9A6L2mcoBM73jMKBJ6mMIfQ7QusD0vuQMfm5et0mPOicfdtheIwd
         Uv9TiyBRcBKsV+8VpEwHy/hAkGBpCMEKWnEPb8QOaiK6NkSukelDKNx6gyg4ed51zwGK
         +Fvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PMwF9SLqPGjM1E/HdTX+ETbtfRkZC2X7sGkmZnV+kC4=;
        fh=QQJtETdRZUqWBTzyDu4+lFSEYPAQF1AifhuXccAqQ2c=;
        b=Clc3PSi8NmlXW3TyDMu13twnZXPOx/z6o7vqhnBWSp+lQSDPIObarGx8spsV7U+cCi
         0BAJ174oQRGsXDDk6nv/7MQ2+uFtsT4hPn4WVOBv7UdZb/pX7QUPzZkm+S2ve835e6PP
         +oos4BdPVEkaNhweV4Md/YlIQDIrB6wpiO16YF7U/dz+r0aoju0EDn4hqA/1OCDiG1MJ
         G0onuLDLd+126ZRpS+5UgII1EYrTmysthFJ+jSc8kkseV02WcfByydAzFjo7UXdSphrM
         ItiHkZzN21XVauBCs9eLXPbomEpTqBmWp7qTRiJUeKnL6/MstVVJ7mlnU723cSaHfF9K
         6w3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfgQuYNc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8e4bff8sor33037085ad.2.2024.12.06.11.26.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfgQuYNc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733513216; x=1734118016; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMwF9SLqPGjM1E/HdTX+ETbtfRkZC2X7sGkmZnV+kC4=;
        b=CfgQuYNcF6ObpUuUHKlT70NiPVJla7TVg8jfUyjV8dNHDxRV8Xkx/bA4IaiAzgeeNq
         fMsoxmbn47GAuNZFx5YeMQTY7OvdBl7rD7z3eZwYWdJnZTebLhKbO2R4ATUQ/N32mznu
         8nL28aPWxsiaTCP0Bhtlj3riI9vQRHj2th8FLWpds9i2cPQrK9KQ9ymlolt3pLpMAWh1
         KUetU8R80Px8YYqXjpw0/D9iTrMg93jc1Ivr3yxNT8JlEB8ZhKafJm/qs0dJ3soHkBbB
         eoHkIF8McwkeGYiE0s56ALTcAGF8EAwHUhJankNt3N/7kXUJrEsHBtHsYjhqVg4D9WlS
         TnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733513216; x=1734118016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMwF9SLqPGjM1E/HdTX+ETbtfRkZC2X7sGkmZnV+kC4=;
        b=VvXRZxAXoFZdSeakHlE8Mzq6W7o8oEu3exSYyijOtlEkXgyxaMtVpbyg3f4ebXAB1G
         PwuCj8rbrzlsuQAJpOk6vCz4VsBXgVzFyEMyr7XRSJgzHOccjA/auNprPKb5rWHqkHQG
         8+VRsL4jO7ZC7I66yV9K8VNKIkDTS6BLcAZonMEWdDUZ1m/u7Fxpvf3fbqhRl+si1im0
         BXtGr2bUUh8mQgEvgCreKNXFBM1hB/VRzsYNN03hmJcRsHPe1vnCMX6r1eXVen8zIug7
         XRmS2RhhRWuebWf7ZkrCNVKkVijidiLmtV72T2uR+fYJV0isrR2BZ08A2WP4yCVo9hlw
         XuOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Oh7yDfuCJwx0iy6eK5PQaP9v8B6RqaRkNv0mCeTxuYwMqK7HdefxZ10rzWq9T99W2B8IC0LZBOXyJQ==@linaro.org
X-Gm-Message-State: AOJu0YyoJNlOxFk7AWlGPg4F4hmY1x5Y9+eobqhlPV/w28PF9B3WvLOT
	/J3r1F1e1RVdBwpEogIwzQKEiL98P+cud2bnggpgGdqbr8RTyQ+LtO40x4xO+4I1eA==
X-Gm-Gg: ASbGncvmKuqe+CLUVouxTVjhz8zctbrcikC5geqaH5lbemqSB/G5oCX1GFapXY1g7HL
	ej4x+MgC8e6fXAIJe2VX/9l/Ie+MQICAB8VBVyyGiAiPfCchO2pUii8Dt2iSm12i+6lQoMB3Kn0
	jEuIc899Jcv1VyCR805k5XEzBekTgEX7Z+faz/mqUnqp0ZAO4Cke+4mcaQBU+2G425WH/B0gcZt
	JrQho0ydQNRMfObfA6OpUab9IbqYkLG2ZRPWCrtY+lsvywLbhLSizkVsDs3wHEgevDdEmDzc8zC
	t8IF/43pKBqvvvtBHZqJvw==
X-Google-Smtp-Source: AGHT+IFtQzoablaV/fkyMB1On+zS7wGBLoc+5w1r+VCeAXLS+UwPM3AEv/oBq7mX+gS5VUKktxf/SA==
X-Received: by 2002:a17:902:cecc:b0:215:5bd8:9f92 with SMTP id d9443c01a7336-21614d1d048mr54530595ad.5.1733513215661;
        Fri, 06 Dec 2024 11:26:55 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f3182dsm32051855ad.234.2024.12.06.11.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:26:55 -0800 (PST)
Message-ID: <4eb74dd5-ad1a-44fd-b8b4-39a119df29e4@linaro.org>
Date: Fri, 6 Dec 2024 11:26:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] docs/devel: add git-publish for patch submitting
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 gustavo.romero@linaro.org, Andrew Melnychenko <andrew@daynix.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
 <20241205222241.3789437-3-pierrick.bouvier@linaro.org>
 <Z1LgpKB_J4Df4wcE@redhat.com>
 <CAFEAcA-WadSi-U+Q9MFY_+vhNimJ1HpCcSZE7aVz3PRKuwc+ew@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-WadSi-U+Q9MFY_+vhNimJ1HpCcSZE7aVz3PRKuwc+ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: GkjlieErGqkY

T24gMTIvNi8yNCAwMzo0MywgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gRnJpLCA2IERl
YyAyMDI0IGF0IDExOjMyLCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQu
Y29tPiB3cm90ZToNCj4+DQo+PiBPbiBUaHUsIERlYyAwNSwgMjAyNCBhdCAwMjoyMjozN1BN
IC0wODAwLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBp
ZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiAtLS0N
Cj4+PiAgIGRvY3MvZGV2ZWwvc3VibWl0dGluZy1hLXBhdGNoLnJzdCB8IDE5ICsrKysrKysr
KysrKysrKysrKysNCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+
Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC9zdWJtaXR0aW5nLWEtcGF0Y2gucnN0
IGIvZG9jcy9kZXZlbC9zdWJtaXR0aW5nLWEtcGF0Y2gucnN0DQo+Pj4gaW5kZXggMDNiMmFj
Mjk4YWEuLmY4YjdmYzU5NTQ0IDEwMDY0NA0KPj4+IC0tLSBhL2RvY3MvZGV2ZWwvc3VibWl0
dGluZy1hLXBhdGNoLnJzdA0KPj4+ICsrKyBiL2RvY3MvZGV2ZWwvc3VibWl0dGluZy1hLXBh
dGNoLnJzdA0KPj4+IEBAIC0yMzUsNiArMjM1LDI1IEBAIHRvIGFub3RoZXIgbGlzdC4pIGBg
Z2l0IHNlbmQtZW1haWxgYCAoYHN0ZXAtYnktc3RlcCBzZXR1cCBndWlkZQ0KPj4+ICAgd29y
a3MgYmVzdCBmb3IgZGVsaXZlcmluZyB0aGUgcGF0Y2ggd2l0aG91dCBtYW5nbGluZyBpdCwg
YnV0DQo+Pj4gICBhdHRhY2htZW50cyBjYW4gYmUgdXNlZCBhcyBhIGxhc3QgcmVzb3J0IG9u
IGEgZmlyc3QtdGltZSBzdWJtaXNzaW9uLg0KPj4+DQo+Pj4gKy4uIF91c2VfZ2l0X3B1Ymxp
c2g6DQo+Pj4gKw0KPj4+ICtVc2UgZ2l0LXB1Ymxpc2gNCj4+PiArfn5+fn5+fn5+fn5+fn5+
DQo+Pj4gKw0KPj4+ICtJZiB5b3UgYWxyZWFkeSBjb25maWd1cmVkIGdpdCBzZW5kLWVtYWls
LCB5b3UgY2FuIHNpbXBseSB1c2UgYGdpdC1wdWJsaXNoDQo+Pj4gKzxodHRwczovL2dpdGh1
Yi5jb20vc3RlZmFuaGEvZ2l0LXB1Ymxpc2g+YF9fIHRvIHNlbmQgc2VyaWVzLg0KPj4+ICsN
Cj4+PiArOjoNCj4+PiArDQo+Pj4gKyAgICAkIGdpdCBjaGVja291dCBtYXN0ZXIgLWIgbXkt
ZmVhdHVyZQ0KPj4+ICsgICAgJCAjIHdvcmsgb24gbmV3IGNvbW1pdHMsIGFkZCB5b3VyICdT
aWduZWQtb2ZmLWJ5JyBsaW5lcyB0byBlYWNoDQo+Pj4gKyAgICAkIGdpdCBwdWJsaXNoDQo+
Pj4gKyAgICAkIC4uLiBtb3JlIHdvcmssIHJlYmFzZSBvbiBtYXN0ZXIsIC4uLg0KPj4+ICsg
ICAgJCBnaXQgcHVibGlzaCAjIHdpbGwgc2VuZCBhIHYyDQo+Pj4gKw0KPj4+ICtFYWNoIHRp
bWUgeW91IHBvc3QgYSBzZXJpZXMsIGdpdC1wdWJsaXNoIHdpbGwgY3JlYXRlIGEgbG9jYWwg
dGFnIHdpdGggdGhlIGZvcm1hdA0KPj4+ICtgYDxicmFuY2huYW1lPi12PHZlcnNpb24+YGAg
dG8gcmVjb3JkIHRoZSBwYXRjaCBzZXJpZXMuDQo+Pg0KPj4gTGV0cyBhbHNvIG1lbnRpb24N
Cj4+DQo+PiAgICAiV2hlbiBzZW5kaW5nIHBhdGNoIGVtYWlscywgJ2dpdCBwdWJsaXNoJyB3
aWxsIGNvbnN1bHQgdGhlIG91dHB1dA0KPj4gICAgIG9mICdzY3JpcHRzL2dldF9tYWludGFp
bmVycy5wbCcgYW5kIGF1dG9tYXRpY2FsbHkgQ0MgYW55b25lIGxpc3RlZA0KPj4gICAgIGFz
IG1haW50YWluZXJzIG9mIHRoZSBhZmZlY3RlZCBjb2RlLiBHZW5lcmFsbHkgeW91IHNob3Vs
ZCBhY2NlcHQgdGhlDQo+PiAgICAgc3VnZ2VzdGVkIENDIGxpc3QsIGJ1dCB0aGVyZSBtYXkg
c29tZXRpbWVzIGJlIHNjZW5hcmlvcyB3aGVyZSBpdCBpcw0KPj4gICAgIGFwcHJvcHJpYXRl
IHRvIGN1dCBpdCBkb3duIChlZyBvbiBjZXJ0YWluIGxhcmdlIHRyZWUtd2lkZSBjbGVhbnVw
cyksDQo+PiAgICAgb3IgYXVnbWVudCBpdCB3aXRoIG90aGVyIGludGVyZXN0ZWQgcGVvcGxl
Ig0KPj4NCj4+IFNlY29uZCwgbGV0cyBzYXkgc29tZXRoaW5nIGFib3V0IHB1bGwgcmVxdWVz
dHMNCj4+DQo+PiAgICAiV2hlbiBhIHN1YnN5c3RlbSBtYWludGFpbmVyIGlzIHJlYWR5IHRv
IHNlbmQgYSBwdWxsIHJlcXVlc3QsIHRoZQ0KPj4gICAgICdnaXQgcHVibGlzaCAtLXB1bGwn
IGNvbW1hbmQgd2lsbCB0cmlnZ2VyaW5nIEdQRyB0YWcgc2lnbmluZywNCj4+ICAgICBwdWJs
aXNoIHRoZSBicmFuY2ggdG8gdGhlIGdpdCByZW1vdGUgbmFtZSBzcGVjaWZpZWQgYnkgdGhl
DQo+PiAgICAgJ3JlbW90ZS5wdXNoRGVmYXVsdCcgY29uZmlnIG9wdGlvbiwgYW5kIHNlbmQg
dGhlIGVtYWlsIHNlcmllcycNCj4gDQo+IFdlIGRvbid0IGRvIHB1bGwgcmVxdWVzdHMgZm9y
IHRoZSBub3JtYWwgImVuZCBkZXZlbG9wZXIgc3VibWl0cw0KPiBhIHBhdGNoIiBwcm9jZXNz
LCBhbmQgZ2l2ZW4gdGhlIHByZXZhbGVuY2Ugb2YgdGhlIGdpdGh1Yi9naXRsYWINCj4gImFs
bCBjb250cmlidXRpb25zIGdvIGluIGFzIHB1bGwgcmVxdWVzdHMiIG1vZGVsLCBJIHRoaW5r
IHRoYXQNCj4gdGFsa2luZyBhYm91dCBwdWxsIHJlcXVlc3RzIGhlcmUgKGV4Y2VwdCB0byBz
YXkgIndlIGRvbid0IGRvIHRoZW0iKQ0KPiB3b3VsZCBiZSBjb25mdXNpbmcuIElmIHdlIHdh
bnQgdG8gZG9jdW1lbnQgaG93IHlvdSBjYW4gdXNlIGdpdCBwdWJsaXNoDQo+IGZvciBwdWxs
IHJlcXVlc3Qgc3VibWlzc2lvbiB3ZSBjYW4gZG8gdGhhdCBpbg0KPiBkb2NzL2RldmVsL3N1
Ym1pdHRpbmctYS1wdWxsLXJlcXVlc3QucnN0Lg0KPiANCg0KVGhpcyBwYWdlIHJlY29tbWVu
ZHMgdXNpbmcgYW4gYWx0ZXJuYXRpdmUgc2NyaXB0IFsxXS4NCg0KSSdsbCBsZXQgeW91IG9y
IERhbmllbCBkZWNpZGUgd2hpY2ggb25lIHNob3VsZCBiZSB1c2VkIChnaXQtcHVibGlzaCB2
cyANCm1ha2UtcHVsbHJlcSkgYW5kIHVwZGF0ZSBhY2NvcmRpbmdseSB0aGUgY29uY2VybmVk
IHBhZ2UuDQoNClsxXSANCmh0dHBzOi8vZ2l0LmxpbmFyby5vcmcvcGVvcGxlL3BldGVyLm1h
eWRlbGwvbWlzYy1zY3JpcHRzLmdpdC90cmVlL21ha2UtcHVsbHJlcQ0KDQo+IHRoYW5rcw0K
PiAtLSBQTU0NCg0K
