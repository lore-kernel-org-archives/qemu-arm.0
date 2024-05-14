Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp121558ejl;
        Tue, 14 May 2024 10:49:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:81af:b0:1ad:999b:de34 with SMTP id adf61e73a8af0-1afde197857mr16918646637.38.1715708989886;
        Tue, 14 May 2024 10:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715708989; cv=none;
        d=google.com; s=arc-20160816;
        b=uCCAXlQArCkyE/z0OaGd1MowhdtrJ1Kzc5fsD39wPpI7SUAZ68yqdo7R9ExraG0rk+
         U9hvzOo+onDYHt26CpkuQe85DRZBD4JXoFfIdXI+Wi4MeDijAFqR3ZMK7fbEKtJvWwzz
         ZeP7Se2EoZ8s4U2NS1G58X9Tw4P6ZtF5UsGb20ZXWbFn8UNiXPDTQCqnxsTQfxLlpsUp
         Ba7i3Iibjh8FwbEWGIsKzRIIMXCvqHVrqAG8E4ZoKvL9tsLV4lZJ9uhaB+6X0jwDmmFy
         o3jg6mf9MVy0W4LUb4Z/cd6jCgadt/tFwK1UxY+Vmr+9wA6ooP8esMcs0MGIY1EzBqD3
         RrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sjrcA5Fj2b+MC4h5XtU0XYzKUktroJ81yE0TTUdVf2U=;
        fh=Hob3PB+Xn8lhgyJiXTx6VzNCZKudRan/sGr5z/F2Hd8=;
        b=f00JDcBm8tnFV2CXJILPLHc/lhbTNqyzGm5wxfHJA1sJ/THFttAvIBiGvtGyjRdmlY
         Xnm3jzzHpZcLdGFjMYHRb3ZCqnEN0RHv6SN3X+JUoRW2+UdEEWnb+XLqZEY00G7tEkBm
         Yh+VSy6GYqOuGDIiXODaPIQcjIfztGDJ7wIjm5+P32Fnm5xkr24NSfmkmvF4zu6Yq0Ww
         G6+VbdejKQnNCJlYtBdsW/NrDMP8UjKrhWTPuRKkOel6LTGRbawC2tgCG+yqnzJaQxpn
         IDMqBU5wSdnovNqlYIW/KtKaCpBPB1BwHiSBRVrlPfMCOox/q/YJo5FkutX9qvyZ1KrP
         ZU/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkUUyeoM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-6f4d2ab94a1sor7395652b3a.5.2024.05.14.10.49.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2024 10:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkUUyeoM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715708989; x=1716313789; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjrcA5Fj2b+MC4h5XtU0XYzKUktroJ81yE0TTUdVf2U=;
        b=JkUUyeoMQQf8Y5krDV+CQh2Dl8Vf81sh5aCP4yNRDPcD1dVqiPJ5DUsw5prz3Gtgxr
         CRAAWe72HHpyCcx7ISu3JT24nuIKmqi8YsOBtq4jJEtupaBQyj45oFwNmvhIKsdYui2d
         W95fpR8U2WbGEIZxPZWTzg5dWHLWqLcP9rzCcuCSoGyjJQqdpe/aY315rllzQkS5UEvL
         zFuah3Zpfnxb9OMm2vur+A+7UnDK5jP2kdyCakE0hcvP+7V8HUBKaTD/Z7gxFz+bUZiT
         MyAKn/zd8g/Fb+NYyrDXMDD8ngBSEv6CJFbPrf4NyTRWKVEU8yq4kQG5Ua52cHAsiOv+
         AV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715708989; x=1716313789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjrcA5Fj2b+MC4h5XtU0XYzKUktroJ81yE0TTUdVf2U=;
        b=vwdT1M6tJqpv3ceMlhIMtnJUhbt07fxUT67Uc/T6hfjpIJb3py535TEYL+YCKntWM1
         To73tk3pfRX1h9tO1BYrRWhi7+tzZYoxMrhmOEE+QQWxGHAcHT/YdLroZEGZADo4S8zL
         1pMyV8d+AdrKpmJRx9RrBOD5YfPQWClcOH5KGoeakCa54AKvgT4q51J2x8SXFzlJtpx/
         uKCz+hmwL6zkTcilVQ4HgkFUVDVgoqXD/juFTd7S4vY0XEBGpX0E/KYRpiYO+/7IvT57
         Udk1wEtiu3li4AOpr4YxTcVxhMAuaojhu7iMMJ/sEHIhlal8if8R9TXufYT3aR2kEuVN
         KrWA==
X-Gm-Message-State: AOJu0YyoNuY9ZKqMs548QfTCVRFMcv2jmUh9SHV6GSKzwmiAyywgBJ4m
	mA8sWKdLLrhBXzXdmSlV3Aq8IKTKI7aHOVOV6MdUH/JlEgaFqqLDiueePBpb/itcLRDXciW1cJj
	A14YEfQ==
X-Google-Smtp-Source: AGHT+IEvODmR+AcVDR3P5T8y4cv1tO2xgFKLwwjUteCCcbrppAcXNVkdd51HQWV7VVMg5QxVKTJjdg==
X-Received: by 2002:a05:6a00:391a:b0:6f3:876a:c029 with SMTP id d2e1a72fcca58-6f4e02ac99bmr19244972b3a.10.1715708988983;
        Tue, 14 May 2024 10:49:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::e697? ([2604:3d08:9384:1d00::e697])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66585sm9726562b3a.10.2024.05.14.10.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 10:49:47 -0700 (PDT)
Message-ID: <04ba223b-4e09-4424-a3ec-640f6115c65b@linaro.org>
Date: Tue, 14 May 2024 10:49:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] tests/tcg: don't append QEMU_OPTS for armv6m-undef
 test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
 <20240514174253.694591-2-alex.bennee@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240514174253.694591-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Bkp8Bij9stK4

T24gNS8xNC8yNCAxMDo0MiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBXZSBkb24ndCB3YW50
IHRvIGJ1aWxkIG9uIHRoZSBkZWZhdWx0IG1hY2hpbmUgc2V0dXAgaGVyZSBidXQgZGVmaW5l
IGENCj4gY3VzdG9tIG9uZSBmb3IgdGhlIG1pY3JvYml0Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICB0
ZXN0cy90Y2cvYXJtL01ha2VmaWxlLnNvZnRtbXUtdGFyZ2V0IHwgMiArLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL3RjZy9hcm0vTWFrZWZpbGUuc29mdG1tdS10YXJnZXQgYi90ZXN0cy90
Y2cvYXJtL01ha2VmaWxlLnNvZnRtbXUtdGFyZ2V0DQo+IGluZGV4IDRjOTI2NDA1N2YuLjM5
ZTAxY2U0OWQgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL3RjZy9hcm0vTWFrZWZpbGUuc29mdG1t
dS10YXJnZXQNCj4gKysrIGIvdGVzdHMvdGNnL2FybS9NYWtlZmlsZS5zb2Z0bW11LXRhcmdl
dA0KPiBAQCAtMTYsNyArMTYsNyBAQCB0ZXN0LWFybXY2bS11bmRlZjogdGVzdC1hcm12Nm0t
dW5kZWYuUw0KPiAgIAkJJDwgLW8gJEAgLW5vc3RkbGliIC1OIC1zdGF0aWMgXA0KPiAgIAkJ
LVQgJChBUk1fU1JDKS8kQC5sZA0KPiAgIA0KPiAtcnVuLXRlc3QtYXJtdjZtLXVuZGVmOiBR
RU1VX09QVFMrPS1zZW1paG9zdGluZyAtTSBtaWNyb2JpdCAta2VybmVsDQo+ICtydW4tdGVz
dC1hcm12Nm0tdW5kZWY6IFFFTVVfT1BUUz0tc2VtaWhvc3RpbmctY29uZmlnIGVuYWJsZT1v
bix0YXJnZXQ9bmF0aXZlLGNoYXJkZXY9b3V0cHV0IC1NIG1pY3JvYml0IC1rZXJuZWwNCj4g
ICANCj4gICBBUk1fVEVTVFMrPXRlc3QtYXJtdjZtLXVuZGVmDQo+ICAgDQoNClJldmlld2Vk
LWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
