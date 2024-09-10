Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1253079dlb;
        Tue, 10 Sep 2024 07:45:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f1b:b0:714:2198:26af with SMTP id d2e1a72fcca58-718d5df1815mr13831962b3a.3.1725979555040;
        Tue, 10 Sep 2024 07:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979555; cv=none;
        d=google.com; s=arc-20160816;
        b=TKRZGqFGSYk6EI/HAxn7d4oUL4icSpMvC0DONqsVf/BMUowAbu/0YufwOAPoPXR0H6
         lMIdZXhLS6EN5RPLvJYJ3izqcWoJop+XFf0oobzFuOdBitSW0PUax5MOMVzvqwwyXbCz
         mVnsog4zC3SuSQ31C9c2lQg/lbCJi7JcwbWZvGRnUT2YQ+39eXkcc3PQAt8aZUdylJN+
         Er7+w9tHppuoNn9K/JEzscmLK5tKOHtVRL7m2VMN1CegmNPkgE8IYmf48iGBAKFoDgYI
         dN55zQS3582XYwFmgen8KRotuxm5EspkeEPYtBAs1MQr2PA/rAyAsFKqSqc6u7B/f+uc
         IUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uYSeYNIcyB/uAalIVUx5IAGO9XhLQ4BnuYdzVKveX5M=;
        fh=FLkZ1UhBvtv+NiZhvZkAdPJmE6xJU+OCqlRQdD0wjog=;
        b=SqsenmeDX0D8FK5oZUJcS5pcqRvHLhN0w3iUyRX1FrRmv1ouMCKsongk88zuWJSEy8
         qCX89xKsSpdJWL9H//LQjS+gYl6YD2E3Ofk1OpEzS+Z3B0KR/J4u4guTHKX4BOGj0buT
         uEupYSgMF+l3/YbGO5OBCdcU2OytbpWkVfKN9zv95o9anTLoRru1wDnq3mK77E4M+IvE
         nmAdSGFQ0nZFxf1v/S+soadbngWtky99kS/im3bo6Bs/yu8/i3J2zpeidr7WFCNRHzP5
         FAnZKQkXrZf8W/3JgDNH59iNC8o6R2Tkb/OaaBBcLptkN2MiRnJqJeCSoEIvPMSbG0l8
         9JxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=psTzfWHj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58acd7asor4240868b3a.3.2024.09.10.07.45.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=psTzfWHj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979554; x=1726584354; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYSeYNIcyB/uAalIVUx5IAGO9XhLQ4BnuYdzVKveX5M=;
        b=psTzfWHjMadpCbYhwWGLPEHDAzKhOptUTAjW+cDrx+DNb+8jk03QVhnI3jjLWxTFDB
         PMIMmZWPzGxPt+kq4Ck8ZZ+qRBLfBPoKg6ScgmIicBHT2sFzz3+9uWGTCvi8wB4Kj+do
         8gFoH36Qghvl2AdVu3YAkubpZZBORj/J2oxIfMXos9nJcA1Jj4Nb3Ho1ZWXAHL7fxDNv
         8gmnI8l57PGqarzqzA51HparzQCX0NrqFNlsoc365vg8uJE3FkH5R4iMka5QQjfWvYtf
         KNQqGjppN5d372yEp87K7c1sRfYvMTRX2cMOS/jlVjZVR7KWrcEeEBVszR4sTsvIrLXm
         y2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979554; x=1726584354;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYSeYNIcyB/uAalIVUx5IAGO9XhLQ4BnuYdzVKveX5M=;
        b=Xj9CA5+ZO5K6nqVhJDDKxUD1oo8CiXzZYd8pUDdpE+J64Bp4kZYF1LtAEjrhAlOJAQ
         JrJBVuWsX5vfOCdg2kaPcUXBh/zXlhJ7Awpmwj/1A/FeW/FQzakiTt1IwSb6KfzeBe93
         TipvYsmwNaOGw///QNcJwti5dJDS7KoBz0pD4TrOjK8q2hecn9puyGwDfk08a5xY69kU
         B0mAa4rm4InabfHxxD127tTl5DrnGokYT2SUmvZtwDjMKocFkZTA3tvgxlsImKhEKXKa
         GmaDEZlNxQPi7am3+glVb6NK09cJq4LNHnful/GUxsd20kjZevotXYoFxYvnqSeXHYK4
         yhVQ==
X-Gm-Message-State: AOJu0YzGxTMVwnvcxlMUPfxuM/COZSis8+CFlMWSnZ0C0wbwB4zj0mS6
	q1+CmxAwFDyxgG7jmvp8keQo6pX3S0n5G6cbanNfuGLF9ZRSlhTsObcg2Pl+Q/bSZC55bMZ4Uus
	yCDsx4SZ7
X-Google-Smtp-Source: AGHT+IGyL0oyBzc2ysV4WxjzqE9iaKhofGCvuUZhjwiX0XDoewtdeUOc1LeOdNsATLz5adCPNiVfSg==
X-Received: by 2002:a05:6a00:91cb:b0:714:1fc3:79f4 with SMTP id d2e1a72fcca58-718d5df1e4emr12664029b3a.5.1725979554446;
        Tue, 10 Sep 2024 07:45:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090923adsm1448840b3a.100.2024.09.10.07.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:45:54 -0700 (PDT)
Message-ID: <89d18e02-8d08-46cb-80a9-2d826f22bbea@linaro.org>
Date: Tue, 10 Sep 2024 07:45:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/26] deprecation: don't enable TCG plugins by default
 with TCI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
 <20240910140733.4007719-13-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240910140733.4007719-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ayMhtNI/NiZl

T24gOS8xMC8yNCAwNzowNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgc29mdG1tdSBt
ZW1vcnkgaW5zdHJ1bWVudGF0aW9uIHRlc3Qgc2VlcyBzbyBtYW55IG1vcmUgYWNjZXNzZXMN
Cj4gdGhhbiBhIG5vcm1hbCB0cmFuc2xhdGVkIGhvc3QgYW5kIGl0cyByZWFsbHkgbm90IHdv
cnRoIGZpeGluZyB1cC4gTGV0cw0KPiBkZXByZWNhdGUgdGhpcyBvZGQgY29uZmlndXJhdGlv
biBhbmQgc2F2ZSBvbiB0aGUgQ0kgY3ljbGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBkb2NzL2Fi
b3V0L2RlcHJlY2F0ZWQucnN0IHwgIDggKysrKysrKysNCj4gICBjb25maWd1cmUgICAgICAg
ICAgICAgICAgIHwgMTEgKysrKysrKysrLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9h
Ym91dC9kZXByZWNhdGVkLnJzdCBiL2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QNCj4gaW5k
ZXggZjdjN2MzM2QzOS4uNWFhMmUzNTMxNCAxMDA2NDQNCj4gLS0tIGEvZG9jcy9hYm91dC9k
ZXByZWNhdGVkLnJzdA0KPiArKysgYi9kb2NzL2Fib3V0L2RlcHJlY2F0ZWQucnN0DQo+IEBA
IC0xOTYsNiArMTk2LDE0IEBAIGJlbmVmaXRzIGZyb20gaGF2aW5nIHBsZW50eSBvZiBob3N0
IG1lbW9yeSBpdCBzZWVtcyByZWFzb25hYmxlIHRvDQo+ICAgZW5jb3VyYWdlIHVzZXJzIHRv
IHVzZSA2NCBiaXQgYnVpbGRzIG9mIFFFTVUgZm9yIGFuYWx5c2lzIHdvcmsNCj4gICB3aGF0
ZXZlciB0YXJnZXRzIHRoZXkgYXJlIGluc3RydW1lbnRpbmcuDQo+ICAgDQo+ICtUQ0cgUGx1
Z2luIHN1cHBvcnQgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCB3aXRoIFRDSSAoc2luY2UgOS4y
KQ0KPiArJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycn
JycnJycnJycnJycnJycNCj4gKw0KPiArV2hpbGUgdGhlIFRDRyBpbnRlcnByZXRlciBjYW4g
aW50ZXJwcmV0IHRoZSBUQ0cgb3BzIHVzZWQgYnkgcGx1Z2lucyBpdA0KPiAraXMgZ29pbmcg
dG8gYmUgc28gbXVjaCBzbG93ZXIgaXQgd291bGRuJ3QgbWFrZSBzZW5zZSBmb3IgYW55IHNl
cmlvdXMNCj4gK2luc3RydW1lbnRhdGlvbi4gRHVlIHRvIGltcGxlbWVudGF0aW9uIGRpZmZl
cmVuY2VzIHRoZXJlIHdpbGwgYWxzbyBiZQ0KPiArYW5vbWFsaWVzIGluIHRoaW5ncyBsaWtl
IG1lbW9yeSBpbnN0cnVtZW50YXRpb24uDQo+ICsNCj4gICBTeXN0ZW0gZW11bGF0b3IgQ1BV
cw0KPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9jb25m
aWd1cmUgYi9jb25maWd1cmUNCj4gaW5kZXggMTQ1ODFjMWI5YS4uMWJkYTZiM2EzYiAxMDA3
NTUNCj4gLS0tIGEvY29uZmlndXJlDQo+ICsrKyBiL2NvbmZpZ3VyZQ0KPiBAQCAtNjI5LDYg
KzYyOSw5IEBAIG1lc29uX29wdGlvbl9wYXJzZSgpIHsNCj4gICAgICAgZXhpdCAxDQo+ICAg
ICBmaQ0KPiAgIH0NCj4gK2hhc19tZXNvbl9vcHRpb24oKSB7DQo+ICsgICAgdGVzdCAiJHtt
ZXNvbl9vcHRpb25zIyoiJDEifSIgIT0gIiRtZXNvbl9vcHRpb25zIg0KPiArfQ0KPiAgIA0K
PiAgIG1lc29uX2FkZF9tYWNoaW5lX2ZpbGUoKSB7DQo+ICAgICBpZiB0ZXN0ICIkY3Jvc3Nf
Y29tcGlsZSIgPSAieWVzIjsgdGhlbg0KPiBAQCAtMTA0OCw4ICsxMDUxLDEyIEBAIGlmIHRl
c3QgIiRzdGF0aWMiID0gInllcyIgOyB0aGVuDQo+ICAgICBwbHVnaW5zPSJubyINCj4gICBm
aQ0KPiAgIGlmIHRlc3QgIiRwbHVnaW5zIiAhPSAibm8iICYmIHRlc3QgJGhvc3RfYml0cyAt
ZXEgNjQ7IHRoZW4NCj4gLSAgcGx1Z2lucz15ZXMNCj4gLSAgc3ViZGlycz0iJHN1YmRpcnMg
Y29udHJpYi9wbHVnaW5zIg0KPiArICAgIGlmIGhhc19tZXNvbl9vcHRpb24gIi1EdGNnX2lu
dGVycHJldGVyPXRydWUiOyB0aGVuDQo+ICsgICAgICAgIHBsdWdpbnM9Im5vIg0KPiArICAg
IGVsc2UNCj4gKyAgICAgICAgcGx1Z2lucz15ZXMNCj4gKyAgICAgICAgc3ViZGlycz0iJHN1
YmRpcnMgY29udHJpYi9wbHVnaW5zIg0KPiArICAgIGZpDQo+ICAgZmkNCj4gICANCj4gICBj
YXQgPiAkVE1QQyA8PCBFT0YNCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBp
ZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
