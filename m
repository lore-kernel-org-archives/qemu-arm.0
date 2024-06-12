Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp481109ejc;
        Wed, 12 Jun 2024 08:59:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:431a:b0:1b8:5ac6:4bd3 with SMTP id adf61e73a8af0-1b8a9b361d8mr2805455637.7.1718207943313;
        Wed, 12 Jun 2024 08:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718207942; cv=none;
        d=google.com; s=arc-20160816;
        b=ot2PwsvAaVLdNymRu2m3kPCMP9LKVc7uXKQYIJqd5b9Mmc5vTrth/rpdGR7Q5Eh2xS
         dWh+1ZZCIJEebZoHYi62kWjnO33zdYO4uF5MFJHxDfY3hwMC7cGi2hSssbXu/v81OoE2
         BlumbTgS3oGIlY91Ylq6Jp4CL+yTMuXlPKgQ+qGHluq3KQ2iiF9Tnt22fYlewNy8HofX
         mAFSe+Ig5NqzO2GYLK5Y1U7Kl4ABsoqz7SWIL62OK6t1ZstxcHc+f6Gt3AraNpDQkBlR
         VSQkLueeQwQeox90euOH0E/fODy2gA8p0+m5+KW1qI2NU8/r/D+rFuEIiQM322KTZ+Fa
         K8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w09RxZOBny7Sg1bz7VrqcLEIzdlX8GfmywPXOlJGEc0=;
        fh=lKpKJSvDjnu6lZyPMvkKGic2ld026r93QR8NmjDsvdY=;
        b=oG6Mfq7eGpUQ2Rm1p3wUwdIx45wVWG+f7k8aE5zOkI7CXQ5E6h2QsrGvNQdL3/XbBz
         Y+qaQNC4Rt2IeMOWgMqPJTuFDPPxDkvK0BlZKY2uL6R3rniF3ES5h6ZHmSqN181B5yBW
         j9+j08Wd3bfgmoAGNaunm7y7rJpjix7/Wc+fsnGjjbIMmTa7fHkEvhrqihUq/PhzIhqx
         saaxLi1Ip1P+/0wqC89M1uSB4j2g9suLAlx1FoQLJ3A8eo2GBNKr3KN9InilpdrZ0hAe
         Dnt9MmyZM3JxDeJRzEAZ7JRWHZZhbTr8i0fQkoSUazTQfyzYC1Qfc7eEam4fbvYbA509
         2LfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSOFTdN9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-703fd4f5079sor10521220b3a.12.2024.06.12.08.59.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 12 Jun 2024 08:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSOFTdN9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718207941; x=1718812741; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w09RxZOBny7Sg1bz7VrqcLEIzdlX8GfmywPXOlJGEc0=;
        b=WSOFTdN9MR/95ZoWtps//9wpb9eiPASOqwUWyZ/dHNiMg0zZWyb+A/KC8/HAsGYltU
         i2PvlRANOAZgOxve6VpMH2+Dcsbds+mCKDL2fovdJRMZgT1N3ZU2NHd3mYu1puAfWsQC
         XiT3GtMINThCyXzvI9lUcVV0TYV+Ed9ZTDJZmxibOjFWSTjQl1lkciRrYoKihCIlZeu1
         xsObqqGqpVJEYUqqR2/KHQ3+sTtMm7cHpce/aWVKfg3pWhbgZiJS7IAo55XEWItyoPQe
         AirEITkD9x4LRSwZDbj1X7FCPJ6J8AB6Rwh4h5336ouhd8mGD3Glf69Dp7L4/85SrbdB
         vkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207941; x=1718812741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w09RxZOBny7Sg1bz7VrqcLEIzdlX8GfmywPXOlJGEc0=;
        b=boOYGxg/DUiilyDmKrfAofI/iQ3BcQMu3tChwy6GwGSy+dM25y1b22qIjD/zKNynZ4
         njFtKSoRRfSizhVCZfI91VcYn8W70XEJMtOII4/OdlU6OFbo6g/QK8VB5wM656lA3Qea
         dyJKLfOAapW9aEtNbYJMTxVtiE3wKRyyagESLsdjMPKb7t34N2/8/xdn/Bx4gQCv2NF2
         M9GxHW6Wi5pJzHbzrbfnpl4VBdgkcEOLw7j7w/MbvFFKYLSzRsrLpdzq7+67Ec4oH+JH
         xqtvrx0i6ehO/SDx388AsH4E56nqrBRs6HYcv07j/Vu8jHp85a9HpuISPpa0BCpa1l2A
         wUOg==
X-Gm-Message-State: AOJu0YyStbvSxWyTQ9LQe8f5aiFx1k3u+Sk9OKSsYfzpKwCNt3Eflpin
	zzMVQqRgqxalHgsxJyFiaqjvtf9n1GJNKdCYDOsIZXcj6zehtg6In62TY3GTQTRn0fzY0T1mnU9
	pDMD+lQ==
X-Google-Smtp-Source: AGHT+IFoOB41A/pNuCVe7i10DhwZq0RfFVAAxo73DwlamIyd9qOnO1yuSNSWMDuxunZowX6e1t+sWA==
X-Received: by 2002:a17:90a:5904:b0:2c2:f70a:3c17 with SMTP id 98e67ed59e1d1-2c4a772cbd0mr2100460a91.46.1718207941451;
        Wed, 12 Jun 2024 08:59:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75e1130sm1980891a91.3.2024.06.12.08.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:59:01 -0700 (PDT)
Message-ID: <757024bf-9da2-4f2e-9df1-dcbfac573582@linaro.org>
Date: Wed, 12 Jun 2024 08:58:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] plugins: Ensure register handles are not NULL
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
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
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240612153508.1532940-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: tCk7yMMCwU7O

T24gNi8xMi8yNCAwODozNSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBGcm9tOiBBa2loaWtv
IE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+IA0KPiBFbnN1cmUgcmVnaXN0
ZXIgaGFuZGxlcyBhcmUgbm90IE5VTEwgc28gdGhhdCBhIHBsdWdpbiBjYW4gYXNzdW1lIE5V
TEwgaXMNCj4gaW52YWxpZCBhcyBhIHJlZ2lzdGVyIGhhbmRsZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gTWVz
c2FnZS1JZDogPDIwMjQwMjI5LW51bGwtdjEtMS1lNzE2NTAxZDk4MWVAZGF5bml4LmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
Pg0KPiAtLS0NCj4gICBwbHVnaW5zL2FwaS5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9wbHVnaW5zL2FwaS5jIGIvcGx1Z2lucy9hcGkuYw0KPiBpbmRleCA1YTBhN2Y4YzcxLi42
YmRiMjZiYmUzIDEwMDY0NA0KPiAtLS0gYS9wbHVnaW5zL2FwaS5jDQo+ICsrKyBiL3BsdWdp
bnMvYXBpLmMNCj4gQEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgR0FycmF5ICpjcmVhdGVf
cmVnaXN0ZXJfaGFuZGxlcyhHQXJyYXkgKmdkYnN0dWJfcmVncykNCj4gICAgICAgICAgIH0N
Cj4gICANCj4gICAgICAgICAgIC8qIENyZWF0ZSBhIHJlY29yZCBmb3IgdGhlIHBsdWdpbiAq
Lw0KPiAtICAgICAgICBkZXNjLmhhbmRsZSA9IEdJTlRfVE9fUE9JTlRFUihncmQtPmdkYl9y
ZWcpOw0KPiArICAgICAgICBkZXNjLmhhbmRsZSA9IEdJTlRfVE9fUE9JTlRFUihncmQtPmdk
Yl9yZWcgKyAxKTsNCj4gICAgICAgICAgIGRlc2MubmFtZSA9IGdfaW50ZXJuX3N0cmluZyhn
cmQtPm5hbWUpOw0KPiAgICAgICAgICAgZGVzYy5mZWF0dXJlID0gZ19pbnRlcm5fc3RyaW5n
KGdyZC0+ZmVhdHVyZV9uYW1lKTsNCj4gICAgICAgICAgIGdfYXJyYXlfYXBwZW5kX3ZhbChm
aW5kX2RhdGEsIGRlc2MpOw0KPiBAQCAtNTI4LDcgKzUyOCw3IEBAIGludCBxZW11X3BsdWdp
bl9yZWFkX3JlZ2lzdGVyKHN0cnVjdCBxZW11X3BsdWdpbl9yZWdpc3RlciAqcmVnLCBHQnl0
ZUFycmF5ICpidWYpDQo+ICAgew0KPiAgICAgICBnX2Fzc2VydChjdXJyZW50X2NwdSk7DQo+
ICAgDQo+IC0gICAgcmV0dXJuIGdkYl9yZWFkX3JlZ2lzdGVyKGN1cnJlbnRfY3B1LCBidWYs
IEdQT0lOVEVSX1RPX0lOVChyZWcpKTsNCj4gKyAgICByZXR1cm4gZ2RiX3JlYWRfcmVnaXN0
ZXIoY3VycmVudF9jcHUsIGJ1ZiwgR1BPSU5URVJfVE9fSU5UKHJlZykgLSAxKTsNCj4gICB9
DQo+ICAgDQo+ICAgc3RydWN0IHFlbXVfcGx1Z2luX3Njb3JlYm9hcmQgKnFlbXVfcGx1Z2lu
X3Njb3JlYm9hcmRfbmV3KHNpemVfdCBlbGVtZW50X3NpemUpDQoNClJldmlld2VkLWJ5OiBQ
aWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
