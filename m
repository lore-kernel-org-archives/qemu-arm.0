Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3105009njb;
        Tue, 18 Mar 2025 10:52:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2uZU/WGsjQpNC/MEP1kXSfycAUrv5dHx3D2SVzaWSz9kMSSPX/BYAdoV6l5oq6TbloHu/M93vIMo2sw==@linaro.org
X-Received: by 2002:a05:6a00:a15:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-737578016a8mr6969324b3a.12.1742320378377;
        Tue, 18 Mar 2025 10:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742320378; cv=none;
        d=google.com; s=arc-20240605;
        b=LtnpAwCpLw85p2Fi+nb24jFF6/Kv8965K/NmNhpeEELmlJg1Vm+TUt9LAGZstf7ljd
         2xIfeDvnRhRaivvAM0HnfA790rSKGsF+hdctyLrNu4B3KnoLI8cLnW13Eec7UuaUy5y+
         EKUlAZKQANMrldOUfyVCIGhsEdRIYMt31dkIHQqhghtLayEjDUpsThqui1YNBVBQx0L6
         00po80QwuOI5WLFGvJ6HzBN8XPn6gyfP+E1dn/geCBEgnpusl2P0Kd7/7ejJUuElV5NZ
         W4LrDzrdovJXVxSFHSUi4u5iRHl0vlD4tmbIkUnP0TR2Le6DGk4jjVV2m9uYdLBbCJJO
         dacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=E9yUCUro9/6dtE85RT/r5RnqitV+tJ76OF97vhv+iRY=;
        fh=QkpjiEfjzGy+85CT584FIpDDDu1HvV/cOlC2Cl5RbwU=;
        b=YQYbvubqE+31vhYZYtvfj2bf6WqsmUwywIt/cfAhG1ywMhIkKQ+abrreCFXOcHcZOo
         RU27vyM7gjAkHXjTpBVGTIw7ZUKNZd5hYCvxLa65z/7yX0Ajgw6W5IvrMZI8oAw1n1Bw
         D3TEM64qZooI6Q14yYgm4zvmt5uBWngq7ZfedCHoajCsbmzAlaj1IUDIN2VGVwxcJKEm
         NHbGeY1LfCeX1Ve+MDy+cif0zZS51ye94SbEZKad9tBpJ+qS5FTlBS5OtwXNoCL07D6h
         6CMRTdKly9g5gS18ApY9QH3BvoERhClaxZ8cDGZJTPxK/Y+PUeMgYAA+2ZnhiJ6I2gL3
         5DRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHqJ+iBS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73711525dd1sor6321141b3a.1.2025.03.18.10.52.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 10:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHqJ+iBS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742320378; x=1742925178; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9yUCUro9/6dtE85RT/r5RnqitV+tJ76OF97vhv+iRY=;
        b=AHqJ+iBSQfTFf5xPm4Tbm+I4ztud71WW7I2ERo3hqNxsMbM6ynLhE1GgRUEDR/EzAp
         wWKbeKXrXUnbcdVfwTgCH452fQrYB+29uDdiqs8oe3sDaIxWyrdawnjZSG96eMP4fM7g
         x7W8z29+x2YS2eeFZgPpIljput5Feg5+hvCLeYxp4r/RYfXBGszmPOnGqrPSIoYgFOg7
         IpVux9y5UxgfJ6nHyq7gTBYwKmRen+bWG5vcbUW9hPZr4FB47BXtxHORmk1Ew9dmNi8s
         gxgE/awx3FWavA2dZdUPYRHOq4mfBtrB2PZyg7VtvNm0Ouy6VcKMpPO2bGldZ8EYUrZi
         ENxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320378; x=1742925178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9yUCUro9/6dtE85RT/r5RnqitV+tJ76OF97vhv+iRY=;
        b=gW+xcGzqvfDRSy7GFgdKnnn5W2s7+bpz1nv+9yh7RThhto8H2p3CvpyPh8h4lJePf3
         RgL+0h2aM8+9lpv6l+i2hQaBV6o3ptCxStV71qQwkUDSbKBwYgxsILXS0B9pbtn5nHwc
         6gU8TGJ/DvJWoRFF8kgvodeegzpQW2caT/Uxio9UKgV+lEFu4qdB+CxZjfDqpTtbT1ic
         1ctxXatecexJZEOABQkyWvnVUQR4rbxgevDGLjUsVqfXf1p7em35YtfSDybjZYGn/bt7
         rJn5fffO3ptqAEUI9KUvddNitAHTP/XpiAwm/I9onSxRgJcaqwqyfK7BoPhcpTck6gE+
         hXJg==
X-Forwarded-Encrypted: i=1; AJvYcCUSl6IWZ6fnVcGQVpmg36/F8ylw2GhYxX4WW8tkdJd+dLKTleMuw3H6FrxLuONu1LUEGXZQIFBYt3oT3g==@linaro.org
X-Gm-Message-State: AOJu0YwfGc1WRUhi1a3dosx5ibO9rOvHNzJYMcgt8L9b4KBD7O17JvoN
	yhAVV8p4jcCV/9c55EbRQZxSCwBREv58jxo8+6m8rn24utYCHMFtLKJCU1F+fianYQ==
X-Gm-Gg: ASbGncvz5LEh5h1lvX0HUNcIzhUeiuO6/yHj33BoVWmIE35oF28Wrlgtu0h7Em7V+un
	4NH99w3ycxfh3KyhMNIojaA0S+WbwJmwc21TrFP7e/v0mhV9draEcWHZ8aOx7Za3eTGD7nWujvV
	I0P14u52zwmfzTqWghA+a7eRPjvvcabUAnzzLTGXSToL7H0bDWBB6ZBmNonrpxYhTKlS7giLokb
	U/3ytXMT1jMo0IUdnMaiKD8hY0xzR9A6sLJnfPgKToSKcGkHrpSQWxH/nuY0igQ+05M9EGrBsW2
	Wk4OV2nHzptbojS4NMd9/nBmvFsZeN8sk+7+hmupugFIc2ajENPHtUDqTA==
X-Google-Smtp-Source: AGHT+IGaMme6I4SSWbEnoXoKG8OoitAHBPbvXRICDZMqDDARtTS6S6zcjn70eDe1QiVVIjQrBjyhiA==
X-Received: by 2002:a05:6a00:398d:b0:732:1ce5:4a4c with SMTP id d2e1a72fcca58-737577765b2mr5112478b3a.1.1742320377790;
        Tue, 18 Mar 2025 10:52:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711550fe1sm10193587b3a.53.2025.03.18.10.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 10:52:57 -0700 (PDT)
Message-ID: <a3b61916-2466-4ec8-a4e1-567581be7a2b@linaro.org>
Date: Tue, 18 Mar 2025 10:52:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32
 emulation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org>
 <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
 <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Tu8vg/TXNHjI

T24gMy8xOC8yNSAxMDo1MCwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4gT24gVHVlLCAxOCBN
YXIgMjAyNSBhdCAxNzo0MiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5h
cm8ub3JnPiB3cm90ZToNCj4+DQo+PiBPbiAxOC8zLzI1IDA1OjUxLCBQaWVycmljayBCb3V2
aWVyIHdyb3RlOg0KPj4+IERpcmVjdGx5IGNvbmRpdGlvbiBhc3NvY2lhdGVkIGNhbGxzIGlu
IHRhcmdldC9hcm0vaGVscGVyLmMgZm9yIG5vdy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6
IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiAt
LS0NCj4+PiAgICB0YXJnZXQvYXJtL2NwdS5oICAgIHwgOCAtLS0tLS0tLQ0KPj4+ICAgIHRh
cmdldC9hcm0vaGVscGVyLmMgfCA2ICsrKysrKw0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L3RhcmdldC9hcm0vY3B1LmggYi90YXJnZXQvYXJtL2NwdS5oDQo+Pj4gaW5kZXggNTFiNjQy
OGNmZWMuLjkyMDVjYmRlYzQzIDEwMDY0NA0KPj4+IC0tLSBhL3RhcmdldC9hcm0vY3B1LmgN
Cj4+PiArKysgYi90YXJnZXQvYXJtL2NwdS5oDQo+Pj4gQEAgLTEyMjIsNyArMTIyMiw2IEBA
IGludCBhcm1fY3B1X3dyaXRlX2VsZjMyX25vdGUoV3JpdGVDb3JlRHVtcEZ1bmN0aW9uIGYs
IENQVVN0YXRlICpjcywNCj4+PiAgICAgKi8NCj4+PiAgICB2b2lkIGFybV9lbXVsYXRlX2Zp
cm13YXJlX3Jlc2V0KENQVVN0YXRlICpjcHVzdGF0ZSwgaW50IHRhcmdldF9lbCk7DQo+Pj4N
Cj4+PiAtI2lmZGVmIFRBUkdFVF9BQVJDSDY0DQo+Pj4gICAgaW50IGFhcmNoNjRfY3B1X2dk
Yl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcHUsIEdCeXRlQXJyYXkgKmJ1ZiwgaW50IHJl
Zyk7DQo+Pj4gICAgaW50IGFhcmNoNjRfY3B1X2dkYl93cml0ZV9yZWdpc3RlcihDUFVTdGF0
ZSAqY3B1LCB1aW50OF90ICpidWYsIGludCByZWcpOw0KPj4+ICAgIHZvaWQgYWFyY2g2NF9z
dmVfbmFycm93X3ZxKENQVUFSTVN0YXRlICplbnYsIHVuc2lnbmVkIHZxKTsNCj4+PiBAQCAt
MTI1NCwxMyArMTI1Myw2IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgKnN2ZV9ic3dhcDY0
KHVpbnQ2NF90ICpkc3QsIHVpbnQ2NF90ICpzcmMsIGludCBucikNCj4+PiAgICAjZW5kaWYN
Cj4+PiAgICB9DQo+Pj4NCj4+PiAtI2Vsc2UNCj4+PiAtc3RhdGljIGlubGluZSB2b2lkIGFh
cmNoNjRfc3ZlX25hcnJvd192cShDUFVBUk1TdGF0ZSAqZW52LCB1bnNpZ25lZCB2cSkgeyB9
DQo+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBhYXJjaDY0X3N2ZV9jaGFuZ2VfZWwoQ1BVQVJN
U3RhdGUgKmVudiwgaW50IG8sDQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IG4sIGJvb2wgYSkNCj4+PiAteyB9DQo+Pj4gLSNlbmRpZg0KPj4+
IC0NCj4+PiAgICB2b2lkIGFhcmNoNjRfc3luY18zMl90b182NChDUFVBUk1TdGF0ZSAqZW52
KTsNCj4+PiAgICB2b2lkIGFhcmNoNjRfc3luY182NF90b18zMihDUFVBUk1TdGF0ZSAqZW52
KTsNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2hlbHBlci5jIGIvdGFyZ2V0
L2FybS9oZWxwZXIuYw0KPj4+IGluZGV4IGI0NmIyYmZmY2YzLi43NzRlMWVlMDI0NSAxMDA2
NDQNCj4+PiAtLS0gYS90YXJnZXQvYXJtL2hlbHBlci5jDQo+Pj4gKysrIGIvdGFyZ2V0L2Fy
bS9oZWxwZXIuYw0KPj4+IEBAIC02NTYyLDcgKzY1NjIsOSBAQCBzdGF0aWMgdm9pZCB6Y3Jf
d3JpdGUoQ1BVQVJNU3RhdGUgKmVudiwgY29uc3QgQVJNQ1BSZWdJbmZvICpyaSwNCj4+PiAg
ICAgICAgICovDQo+Pj4gICAgICAgIG5ld19sZW4gPSBzdmVfdnFtMV9mb3JfZWwoZW52LCBj
dXJfZWwpOw0KPj4+ICAgICAgICBpZiAobmV3X2xlbiA8IG9sZF9sZW4pIHsNCj4+PiArI2lm
ZGVmIFRBUkdFVF9BQVJDSDY0DQo+Pg0KPj4gV2hhdCBhYm91dCB1c2luZyBydW50aW1lIGNo
ZWNrIGluc3RlYWQ/DQo+Pg0KPj4gICAgaWYgKGFybV9mZWF0dXJlKCZjcHUtPmVudiwgQVJN
X0ZFQVRVUkVfQUFSQ0g2NCkgJiYgbmV3X2xlbiA8IG9sZF9sZW4pIHsNCj4+DQo+IA0KPiBU
aGF0IHdvdWxkIGJlIGEgZGVhZCBjaGVjazogaXQgaXMgbm90IHBvc3NpYmxlIHRvIGdldCBo
ZXJlDQo+IHVubGVzcyBBUk1fRkVBVFVSRV9BQVJDSDY0IGlzIHNldC4NCj4gDQoNCldlIGNh
biB0aGVuIGFzc2VydCBpdCwgdG8gbWFrZSBzdXJlIHRoZXJlIGlzIG5vIHJlZ3Jlc3Npb24g
YXJvdW5kIHRoYXQuDQoNCldlIG5vdyBoYXZlIGFub3RoZXIgY29udmVyc2F0aW9uIGFuZCBz
b21ldGhpbmcgdG8gZGVjaWRlIGluIGFub3RoZXIgDQpmaWxlLCBhbmQgdGhhdCdzIHdoeSBJ
IGNob3NlIHRvIGRvIHRoZSBtaW5pbWFsIGNoYW5nZSAoImlmZGVmIHRoZSANCmlzc3VlIikg
aW5zdGVhZCBvZiB0cnlpbmcgdG8gZG8gYW55IGNoYW5nZS4NCg0KPiB0aGFua3MNCj4gLS0g
UE1NDQoNCg==
