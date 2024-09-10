Received: by 2002:a05:7022:b9f:b0:84:f013:bc5b with SMTP id cy31csp2256270dlb;
        Tue, 10 Sep 2024 07:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:202:508c:b5a6 with SMTP id d9443c01a7336-2074c6ae880mr15833125ad.46.1725979683374;
        Tue, 10 Sep 2024 07:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979683; cv=none;
        d=google.com; s=arc-20160816;
        b=LZ6wJsGGvh3y4kt2zu0grW4zAf2bu+KDfGdWWn426PbWr8TccPhtBUBeSp4+YZsQ5V
         h/bJYD0tbzJmVGJ0dQm58WhhOyl9UE0SuPn4Q8uveQhkrpjS0PEc9QULQ2B/YeKlb7ai
         ln9eEq3djQcEt+wmdWpfEHNmvSXI3G6dVirlaIPp6UWk9PhShxhQFNAhdf028VMEGWrf
         RiVWgO841brMpMlMRblM4ust3iQJ4lJZlUppBOL4ARIIW6Urnp1BAxoOuntHgG51r7Ai
         gcVfrl7QUq6b0OqJVHL2KyvtKA1gkBRBwPqk5nioriEPZ0VZsaDJlEwRaruIDtBkrMMu
         2qqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8q1rq2n40D9q1EKnvg/RWcRBljAzsrp/yedunpNS2bY=;
        fh=FLkZ1UhBvtv+NiZhvZkAdPJmE6xJU+OCqlRQdD0wjog=;
        b=uaqlHZvTt4FF15yHv+f7SyoXJ6lRzzJTII5i4Mo5N05MRcN2pQEGdyKZkobCGt4myv
         /HTJDF+CLzTZobkoXFLWavOf4p4LlO4Qdz7/Unm0woyuhYBNbljbMgFsLtMbAjPuc+Mv
         cNWqA9NE0JDdrXAuuMiJYLe1s271Y+w2ksgO1cfYTqV+UbWiuNm3QAV9wb02BEAvHA8i
         TpaXevGj7id8wAfJafd7jfiP4nxZKO6/d3hTZp1jBBWE2RjIioE/pi4gPDDEBXBuV/n0
         q1FS6iNX9bUdtbdvWUt09ZsR34PnlnPefI8pPlLmpEDHetGgl/gTzNE0as5jzKsKNeEJ
         mAUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qVu7Tq6/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710f46416sor40628575ad.17.2024.09.10.07.48.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:48:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qVu7Tq6/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979683; x=1726584483; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8q1rq2n40D9q1EKnvg/RWcRBljAzsrp/yedunpNS2bY=;
        b=qVu7Tq6/4oQgryCH6h5QWXgPYHsKIGl5o7ZvMdluQno5mayPe6RI8Q8/iFNF/qDH0Y
         7cXQKZ26J8QRUmhiTODrNAsbygidiD5s2lwzRBlDExeje/9mQvnbK8hGW3AbZ1ROgIDk
         6c7r6GQrBtxwbmlnvLbTQ9pe0LT7utj3VmiPBR5tX1JDBV66CE0X6jI9n6MeEsLEux3U
         XrSop73QoE8OvVoDtZbKgqYTWpk1BAUK7R06q/nqk8sy6DLh3g+/maFm62HDbLpe+YnX
         O58IcGyipV7dZE8piXvpGsExjRRqtOXH/2tfzzYWpWw0fSNF8eKzpsbAG8RVzYRAgp0d
         B4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979683; x=1726584483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8q1rq2n40D9q1EKnvg/RWcRBljAzsrp/yedunpNS2bY=;
        b=avvPf8taptOU+shXJl9VRYv17wUKSLACciLjlza28Q0H7hKlxgda4B4irq8mzF0XYi
         3/HD5Di8MQ8zNxpmOH8vVNjUP4D89NjGub5SBoe1VVpEDif5PpBQ47rgiBf/yRJIZaEs
         I7ZOfH+oSXyy/L0XBdSZg6rQ1M1brpUzDcSFsfPIZ5E7/UtcdLKSCd8tDE3YhNVqQ92g
         A2V8mR5sFJooh8HKbXy1kU9RF6OHDYc7P91896CSdp77lxpJ75j2xoBL6BGjsKcYNHsL
         YYcfirTsZM/Gj+trkxiNvHEcijVBgv42b8/v4qytIoXHwEIDgWcQ679lIO9nKy6u7RUX
         c/BQ==
X-Gm-Message-State: AOJu0YySLgUOPzkM6Yh12GGHBGxRkE0812mIiWpnZ5gjz4VpXTT0L950
	SwpyMDuuSkSLLxFD5+mCn5dKd8O4mQMXrxx3JJ50CRBAIEKdw3VGSxcFANGVrqg6W1P+MXUd4Z8
	aXM+6VJMw
X-Google-Smtp-Source: AGHT+IE+qQGW3MthsDPKf4RQyCYi4lD/13W7SJohSfwKMsVzzu7jEcyFv+hRY9iGVbL0GBXdEIADAQ==
X-Received: by 2002:a17:903:2287:b0:206:b960:2e97 with SMTP id d9443c01a7336-2074c6aeacfmr15435325ad.45.1725979682660;
        Tue, 10 Sep 2024 07:48:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e0f489sm49981995ad.18.2024.09.10.07.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:48:02 -0700 (PDT)
Message-ID: <937206c3-5d32-4566-a516-b860d3089a92@linaro.org>
Date: Tue, 10 Sep 2024 07:48:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/26] tests/tcg: only read/write 64 bit words on 64 bit
 systems
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
 <20240910140733.4007719-21-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240910140733.4007719-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Ojrq4pQ6wO28

T24gOS8xMC8yNCAwNzowNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBXaGlsZSB0aGUgY29t
cGlsZXJzIHdpbGwgZ2VuZXJhbGx5IGhhcHBpbHkgc3ludGhlc2lzZSBhIDY0IGJpdCB2YWx1
ZQ0KPiBmb3IgeW91IG9uIDMyIGJpdCBzeXN0ZW1zIGl0IGRvZXNuJ3QgZXhlcmNpc2UgYW55
dGhpbmcgb24gUUVNVS4gSXQNCj4gYWxzbyBtYWtlcyBpdCBoYXJkIHRvIGFjY3VyYXRlbHkg
Y29tcGFyZSB0aGUgYWNjZXNzZXMgdG8gdGVzdF9kYXRhDQo+IHdoZW4gaW5zdHJ1bWVudGlu
Zy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICAgdGVzdHMvdGNnL211bHRpYXJjaC9zeXN0ZW0vbWVtb3J5
LmMgfCAyNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL3RjZy9tdWx0aWFyY2gvc3lzdGVtL21lbW9yeS5jIGIvdGVzdHMvdGNnL211bHRp
YXJjaC9zeXN0ZW0vbWVtb3J5LmMNCj4gaW5kZXggOGYyMzcxOTc1ZC4uNjgwZGQ0ODAwYiAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvdGNnL211bHRpYXJjaC9zeXN0ZW0vbWVtb3J5LmMNCj4g
KysrIGIvdGVzdHMvdGNnL211bHRpYXJjaC9zeXN0ZW0vbWVtb3J5LmMNCj4gQEAgLTE2Myw2
ICsxNjMsNyBAQCBzdGF0aWMgdm9pZCBpbml0X3Rlc3RfZGF0YV91MzIoaW50IG9mZnNldCkN
Cj4gICAgICAgbWxfcHJpbnRmKCJkb25lICVkIEAgJXBcbiIsIGksIHB0cik7DQo+ICAgfQ0K
PiAgIA0KPiArI2lmIF9fU0laRU9GX1BPSU5URVJfXyA9PSA4DQo+ICAgc3RhdGljIHZvaWQg
aW5pdF90ZXN0X2RhdGFfdTY0KGludCBvZmZzZXQpDQo+ICAgew0KPiAgICAgICB1aW50OF90
IGNvdW50ID0gMDsNCj4gQEAgLTE4Nyw2ICsxODgsNyBAQCBzdGF0aWMgdm9pZCBpbml0X3Rl
c3RfZGF0YV91NjQoaW50IG9mZnNldCkNCj4gICAgICAgfQ0KPiAgICAgICBtbF9wcmludGYo
ImRvbmUgJWQgQCAlcFxuIiwgaSwgcHRyKTsNCj4gICB9DQo+ICsjZW5kaWYNCj4gICANCj4g
ICBzdGF0aWMgYm9vbCByZWFkX3Rlc3RfZGF0YV91MTYoaW50IG9mZnNldCkNCj4gICB7DQo+
IEBAIC0yNTQsNiArMjU2LDcgQEAgc3RhdGljIGJvb2wgcmVhZF90ZXN0X2RhdGFfdTMyKGlu
dCBvZmZzZXQpDQo+ICAgICAgIHJldHVybiB0cnVlOw0KPiAgIH0NCj4gICANCj4gKyNpZiBf
X1NJWkVPRl9QT0lOVEVSX18gPT0gOA0KPiAgIHN0YXRpYyBib29sIHJlYWRfdGVzdF9kYXRh
X3U2NChpbnQgb2Zmc2V0KQ0KPiAgIHsNCj4gICAgICAgdWludDY0X3Qgd29yZCwgKnB0ciA9
ICh1aW50NjRfdCAqKSZ0ZXN0X2RhdGFbb2Zmc2V0XTsNCj4gQEAgLTMwNywxMSArMzEwLDE2
IEBAIHN0YXRpYyBib29sIHJlYWRfdGVzdF9kYXRhX3U2NChpbnQgb2Zmc2V0KQ0KPiAgICAg
ICBtbF9wcmludGYoImRvbmUgJWQgQCAlcFxuIiwgaSwgcHRyKTsNCj4gICAgICAgcmV0dXJu
IHRydWU7DQo+ICAgfQ0KPiArI2VuZGlmDQo+ICAgDQo+ICAgLyogUmVhZCB0aGUgdGVzdCBk
YXRhIGFuZCB2ZXJpZnkgYXQgdmFyaW91cyBvZmZzZXRzICovDQo+IC1yZWFkX3VmbiByZWFk
X3VmbnNbXSA9IHsgcmVhZF90ZXN0X2RhdGFfdTE2LA0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlYWRfdGVzdF9kYXRhX3UzMiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICByZWFkX3Rlc3RfZGF0YV91NjQgfTsNCj4gK3JlYWRfdWZuIHJlYWRfdWZuc1tdID0gew0K
PiArICAgIHJlYWRfdGVzdF9kYXRhX3UxNiwNCj4gKyAgICByZWFkX3Rlc3RfZGF0YV91MzIs
DQo+ICsjaWYgX19TSVpFT0ZfUE9JTlRFUl9fID09IDgNCj4gKyAgICByZWFkX3Rlc3RfZGF0
YV91NjQNCj4gKyNlbmRpZg0KPiArfTsNCj4gICANCj4gICBib29sIGRvX3Vuc2lnbmVkX3Jl
YWRzKGludCBzdGFydF9vZmYpDQo+ICAgew0KPiBAQCAtNDc2LDEwICs0ODQsMTQgQEAgYm9v
bCBkb19zaWduZWRfcmVhZHMoYm9vbCBuZWdfZmlyc3QpDQo+ICAgICAgIHJldHVybiBvazsN
Cj4gICB9DQo+ICAgDQo+IC1pbml0X3VmbiBpbml0X3VmbnNbXSA9IHsgaW5pdF90ZXN0X2Rh
dGFfdTgsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgaW5pdF90ZXN0X2RhdGFfdTE2
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgIGluaXRfdGVzdF9kYXRhX3UzMiwNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICBpbml0X3Rlc3RfZGF0YV91NjQgfTsNCj4gK2lu
aXRfdWZuIGluaXRfdWZuc1tdID0gew0KPiArICAgIGluaXRfdGVzdF9kYXRhX3U4LA0KPiAr
ICAgIGluaXRfdGVzdF9kYXRhX3UxNiwNCj4gKyAgICBpbml0X3Rlc3RfZGF0YV91MzIsDQo+
ICsjaWYgX19TSVpFT0ZfUE9JTlRFUl9fID09IDgNCj4gKyAgICBpbml0X3Rlc3RfZGF0YV91
NjQNCj4gKyNlbmRpZg0KPiArfTsNCj4gICANCj4gICBpbnQgbWFpbih2b2lkKQ0KPiAgIHsN
Cg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZz4NCg==
