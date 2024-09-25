Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp472587njb;
        Wed, 25 Sep 2024 10:22:44 -0700 (PDT)
X-Received: by 2002:a17:902:e543:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-20afc486195mr42545285ad.32.1727284964398;
        Wed, 25 Sep 2024 10:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727284964; cv=none;
        d=google.com; s=arc-20240605;
        b=doQ7vmrQHmiGXgjMFG/iawdW5teZ9Fz6J+IcT8X/HlVUEUY1KbYpewWkE4k1DSghRG
         ugPmVzrLg50yrkiUG0dsv+swai0+Y24Q9PFztLQkzs9uujx4J57qQqx0rh7r0reyPIoA
         n/HR2Jb84HP61jRzFcx40mX+Wka8pzzUb6PspJPrIxntl63cD0ITNPBEOWU+0c7wP8D9
         IFTin8SrEU6hpCihloeDptL9L0bGZcRNTNWOtmmJWokvRW62RnuxsoxQICzpdTu3qxm1
         s/j7Q6YAo9raNV5NfLa1cMoB3agTKI64ByMuFBwyxd02wI/GFRoOrMqvhtPc3BPhAP0O
         QCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1cBi18DJbLbtKnO15ZDzgQjdA4tmaG19Gb/9h4A0AB8=;
        fh=hm8fRXAEQA5gtNw/qhNNNYjEY9ae5p7Zo9+nDBYoJJU=;
        b=U0dkciLQ+FT7tAnZfmN0FiJha5ni3OQ91o22qDyowqHk1KweUQjQcjSRtmSmiv936m
         ncTYXRNgyROoDdizg5IUFphE+o/l3ouI9azTMXub641ORkSx2Pk9SYVtooH9P0tS592R
         jca70C/FAMeG90Rw7mGp/IkXNcTcXY5TyMUfSfYs+hBZkkUUdxjlHG+cKzqK0mljaOM6
         7J2spn1nr8665EcEG8gFxlpLVpkJ96UhGJsnT1INK9uVyLXYWofecGmrsF7H3dhFEtFL
         DOEDnMAMvAvXFMFRFXo7dCn1wgs+wS6GszPMQg1JpBqUt8Mu00O7t1VYYJER6HurJ1nN
         aF0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zh4ClawS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20af1ab98b9sor30572625ad.15.2024.09.25.10.22.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Sep 2024 10:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zh4ClawS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727284964; x=1727889764; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cBi18DJbLbtKnO15ZDzgQjdA4tmaG19Gb/9h4A0AB8=;
        b=Zh4ClawSN91px6qwGqSXS0NM6iKy4lTtam22Wx35zCBkqBInjOTX4z3y8zheU7sXLG
         Sn8vUZnUBiIs5PDeJbVMarc0ox/zRp2fKuYgMjNU7exafNteDBmWCxVBFT6U+P8i96Sf
         /dV3cHQ6kLFy3lRCoWBZrr46j19M4AM/XzazDShOr5p+ykbes6WVjWur2akySNxaoR6V
         b3sjdF1Tx+p2xHNsqORlD8wDXAWHKoRb+7DUjf1/DLdQ+p5NYJrFL4IWPyuaHEam5a+q
         eJQTSwwTgi2UC/MsZ3y8eOK0eHCtItFOMAxXK94dDGZw0kudFLn46YwaffFcFtN7pwDh
         eolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727284964; x=1727889764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cBi18DJbLbtKnO15ZDzgQjdA4tmaG19Gb/9h4A0AB8=;
        b=b+P+q+i6knGMkTbNoVsWMb0/FI7egof8q9t/N7A7EUcbG8gwJWbmPbRak9N0bt2rZm
         8Ajyea/b9/Pc99d5Cx8q6tMtV1ZgRd1ndltPMdtmTSWWezt4vBQZiqb0iNHqfhlXN+V6
         YsGYxodPj5c0flbkMNxLKJddXhCGFac7a1cYjt9AZQPpBydjeoxdvPZWZpkecW3Fi1C4
         PnmNhcFqkBgOnn/EGHXm5NGca6F6DM/ohf7jwW1pdkKo35Ob/e0B1l0zyAvrX6S6sJ4Q
         zq7NC7fitxGUDzAA+w2AL/oYVK3Jz1UyO85ttRheqnXic2Gy1Ao9S3GmJyJs5ZPTkKoB
         pRpw==
X-Gm-Message-State: AOJu0YzoJiQ3jKdWiNGKpnTcJPRgbdN9GFhUdeuYZ9+ru1oXzl6nNxiU
	MxmW8IMstBLH8G/2IGXz69o/O/+wrlGnbDoadWuIibFMU+7aL8a7z/k15DsZntx9eZCU5TOOViI
	axM9blYfV4k0=
X-Google-Smtp-Source: AGHT+IFpe3nBv2xJLPF27RAmV8/+xF723E+vmLXeSWgrX+X++h/lNUxM193xpCw5M0gVTtLxg2Bxwg==
X-Received: by 2002:a17:902:d2c9:b0:206:928c:bfda with SMTP id d9443c01a7336-20afc61cfaamr50046935ad.56.1727284963959;
        Wed, 25 Sep 2024 10:22:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20afb021af7sm15136465ad.168.2024.09.25.10.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 10:22:43 -0700 (PDT)
Message-ID: <de455384-7929-45df-84fa-7e09c0e86043@linaro.org>
Date: Wed, 25 Sep 2024 10:22:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] maintainer updates (testing, gdbstub)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, kvm@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20240925171140.1307033-1-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240925171140.1307033-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: lsz1dYQUe6V3

T24gOS8yNS8yNCAxMDoxMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBXZWxjb21lIHRvIHRo
ZSBmaXJzdCBwb3N0IEtWTSBmb3J1bSBzZXJpZXMuIFdlIGhhdmU6DQo+IA0KPiAgICAtIGZp
eCBmcm9tIElseWEgZm9yIG1pY3JvYmxhemUgYXRvbWljcw0KPiAgICAtIFBpZXJyaWNrJ3Mg
dHNhbiB1cGRhdGVzDQo+ICAgIC0gSSd2ZSBhZGRlZCBteSB0ZXN0aW5nIGFuZCBnZGJzdHVi
IHRyZWVzIHRvIE1BSU5UQUlORVJTDQo+ICAgIC0gZW5hYmxlZCBhIHZlcnkgYmFzaWMgYWFy
Y2g2NF9iZS1saW51eC11c2VyIHRlc3QNCj4gICAgLSBmaXhlZCB0aGUgbWlzc2luZyBnZGIg
WE1MIGZhaWxzIHRoYXQgY2F1c2UgYWFyY2g2NF9iZS1saW51eC11c2VyIHRvIGFzc2VydA0K
PiAgICAtIGZpbmFsbHkgSSd2ZSBtYWRlIHRoZSBtaXBzNjRlbCBjcm9zcyBjb21waWxlciBi
b29rd29ybSBhbmQgYWxsb3dfZmFpbA0KPiANCj4gQWxleCBCZW5uw6llICg2KToNCj4gICAg
dGVzdGluZzogYnVtcCBtaXBzNjRlbCBjcm9zcyB0byBib29rd29ybSBhbmQgYWxsb3cgdG8g
ZmFpbA0KPiAgICB0ZXN0cy9kb2NrZXI6IGFkZCBOT0ZFVENIIGVudiB2YXJpYWJsZSBmb3Ig
dGVzdGluZw0KPiAgICBNQUlOVEFJTkVSUzogbWVudGlvbiBteSB0ZXN0aW5nL25leHQgdHJl
ZQ0KPiAgICBNQUlOVEFJTkVSUzogbWVudGlvbiBteSBnZGJzdHViL25leHQgdHJlZQ0KPiAg
ICBjb25maWcvdGFyZ2V0czogdXBkYXRlIGFhcmNoNjRfYmUtbGludXgtdXNlciBnZGIgWE1M
IGxpc3QNCj4gICAgdGVzdHMvdGNnOiBlbmFibGUgYmFzaWMgdGVzdGluZyBmb3IgYWFyY2g2
NF9iZS1saW51eC11c2VyDQo+IA0KPiBJbHlhIExlb3Noa2V2aWNoICgxKToNCj4gICAgdGVz
dHMvZG9ja2VyOiBGaXggbWljcm9ibGF6ZSBhdG9taWNzDQo+IA0KPiBQaWVycmljayBCb3V2
aWVyICgzKToNCj4gICAgbWVzb246IGhpZGUgdHNhbiByZWxhdGVkIHdhcm5pbmdzDQo+ICAg
IHRhcmdldC9pMzg2OiBmaXggYnVpbGQgd2FybmluZyAoZ2NjLTEyIC1mc2FuaXRpemU9dGhy
ZWFkKQ0KPiAgICBkb2NzL2RldmVsOiB1cGRhdGUgdHNhbiBidWlsZCBkb2N1bWVudGF0aW9u
DQo+IA0KPiAgIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICsrDQo+ICAgZG9jcy9kZXZlbC90ZXN0aW5nL21haW4ucnN0ICAgICAgICAgICAg
ICAgICAgIHwgMjYgKysrKysrKysrKystLS0NCj4gICBjb25maWd1cmUgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysNCj4gICBjb25maWdzL3RhcmdldHMv
YWFyY2g2NF9iZS1saW51eC11c2VyLm1hayAgICAgfCAgMiArLQ0KPiAgIG1lc29uLmJ1aWxk
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrLQ0KPiAgIHRh
cmdldC9pMzg2L2t2bS9rdm0uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQ0K
PiAgIHRlc3RzL3RjZy9hYXJjaDY0X2JlL2hlbGxvLmMgICAgICAgICAgICAgICAgICB8IDM1
ICsrKysrKysrKysrKysrKysrKysNCj4gICAuZ2l0bGFiLWNpLmQvY29udGFpbmVyLWNyb3Nz
LnltbCAgICAgICAgICAgICAgfCAgMyArKw0KPiAgIHRlc3RzL2RvY2tlci9NYWtlZmlsZS5p
bmNsdWRlICAgICAgICAgICAgICAgICB8ICA1ICstLQ0KPiAgIC4uLi9idWlsZC10b29sY2hh
aW4uc2ggICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrDQo+ICAgLi4uL2RvY2tl
cmZpbGVzL2RlYmlhbi1taXBzNjRlbC1jcm9zcy5kb2NrZXIgIHwgMTAgKysrLS0tDQo+ICAg
Li4uL2RvY2tlcmZpbGVzL2RlYmlhbi10b29sY2hhaW4uZG9ja2VyICAgICAgIHwgIDcgKysr
Kw0KPiAgIHRlc3RzL2xjaXRvb2wvcmVmcmVzaCAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstDQo+ICAgdGVzdHMvdGNnL01ha2VmaWxlLnRhcmdldCAgICAgICAgICAgICAgICAg
ICAgIHwgIDcgKysrLQ0KPiAgIHRlc3RzL3RjZy9hYXJjaDY0X2JlL01ha2VmaWxlLnRhcmdl
dCAgICAgICAgICB8IDE3ICsrKysrKysrKw0KPiAgIDE1IGZpbGVzIGNoYW5nZWQsIDEyNSBp
bnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
dGVzdHMvdGNnL2FhcmNoNjRfYmUvaGVsbG8uYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0cy90Y2cvYWFyY2g2NF9iZS9NYWtlZmlsZS50YXJnZXQNCj4gDQoNClRoYW5rcyBmb3Ig
cHVsbGluZyB0c2FuIGNoYW5nZXMgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4NCg==
