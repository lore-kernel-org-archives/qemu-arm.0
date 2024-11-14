Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89522njc;
        Wed, 13 Nov 2024 20:11:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8W3qF/xrGi2Vxe6BnhsonBdELCKc8GGnZPABuXx1qgP6auiGelQiIXn4EIHewMSk8mglYNzghjKf0aA==@linaro.org
X-Received: by 2002:a05:6808:13d6:b0:3e6:5d50:22d8 with SMTP id 5614622812f47-3e7946a7653mr22172089b6e.17.1731557511220;
        Wed, 13 Nov 2024 20:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557511; cv=none;
        d=google.com; s=arc-20240605;
        b=SKcDOCscBhaFuhmDTI9ii1BUg7bLtfxukFHCcTV4ShXoevWAJkY9CQ5tm9AmWgpPwO
         invmE+bSxIZRy0ZtfLlspNceMISubBNbKaoHGgl93KQR6nx3IKmy28CD/VbOg19etsJC
         K/vqoHpKyTADEdHZxjj72U0vghgN9LjgeYNxdJaGTz/OoV8ae1HRoMaFzKU6YCvq7XaB
         p2/c2/NrN2FhW3U3v7PwEvSy1iPPADuApjyBrHhuEjiKqALBmiY49sW3c+z1F3WxW1P9
         4fIfpcXzgupRCmIXN51ojqqrruBN7LjZyH+a5q3P234UtSStTX9nPrW0xPuVRnkwANnm
         lRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oq8ZFiqY5hOBspLrityVjNiFRVTtpqycD9ZCTgsskLw=;
        fh=5nFP8DK/R3lUf2mD6tfvriuUyfuDBVAg01DKnxlrvrg=;
        b=J1A7OHQFd9sE8I9XI8u1IjiN8Q7Ub3ORAEbZAP3iHUUS52PQcFDnTlEk3bKuItOPRN
         VmBLcuVawucmvzKzYT/egzfaJanBGsb+ktA3dyZXjiXbweD7bRmiSfVJTxhJUbPKQPBX
         cjuJz9ntn8/p/CVqxWR7Md6JrbqGYhjL+tOaZTrq5bzQBZVNOHSJj69/4VNe9crZ07Gp
         hZ+NfaGznVjFIKnknwrlDkPP0+StAksd4WFXXbbvEEA79JbvB98T3L+5AkXJyKkJkqs8
         A2jnTouOmdVFDVdofLWn7+dVcgPRam+iM1smGYXrAbUg5pZPDM9g0iUEjcm5Oy9qq8si
         Yv8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdTevnaS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7f8b39a168esor158984a12.5.2024.11.13.20.11.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdTevnaS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557510; x=1732162310; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oq8ZFiqY5hOBspLrityVjNiFRVTtpqycD9ZCTgsskLw=;
        b=XdTevnaSSh4Ur7cT3TwImlDAL/Gy3RteN8L/O5iv9F1AfisBRW6Kvqo6EgxZBHfBcE
         bVbyyhwH3R+R6An2Z+LY5zSwEzKkLB4QmTZ3wE0Wpw0V042KH6e6cogiK3HZvmoIYfFT
         D8/i9qzfAacsHt/AnJsVwh0hgnoEFyYBeEEsmrMVbI7EuNWpvJuR4dY6Z7USLWEJi2eD
         lqpcmLKOTByMMmdrBFGkdN8buJIt9+psrzbpLMTtWuHFDvJgmCguHyHHDcEgQGApr2OF
         3R6xngM+eg8tzDKPc0WYw6/A6PF1RZda06HL7XF5xMR/fAs+im0V8a1m8gtWFnYCxZTg
         zgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557510; x=1732162310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oq8ZFiqY5hOBspLrityVjNiFRVTtpqycD9ZCTgsskLw=;
        b=pe5A3T0gOhntlALGUKs62/BVssexPi07VvEN/iTpCFmUbyyGZ2mUMLMRbG1+pc3qGj
         em6e+24LUAsAhwC010IgcqmRSdIpos6tBqW/sqNcUJywsa/5QQHWN3UaAc0ORIORXdeg
         h0O0Ax/qEnu1De2kT+lYZtyBAtDc24dRl3fbUDzOErifhXD3FSbXTSrLtuCSB8h8p148
         B7Ied+OxRa4vgnc63H1B2sH+xEvn4prAEVzxbIpRRKiXhW3zpM5FnX+GLzh791bN3ADO
         Iu5C7llefdR1vBJlMh4IqZ46chcXs4x9nq7/tQ62kdPCeYbPcuqYoJbHD8CpcA866rvF
         OYLw==
X-Forwarded-Encrypted: i=1; AJvYcCUV/ILyn9AG32jGgR2I0PIvSHyGrLoqFQbuL1xHYFS6t7KZUyc4iO5Jg6zDOdtvr4Ec85xYOTTbCQPLuw==@linaro.org
X-Gm-Message-State: AOJu0YyrxDQUgakWycG9v/ZmSJP7DBkYOsf4aguGp4gk4/Bs86K3usO3
	+w75UpMXk8g6J9543OskAbm9AbFRHmt3ueGf0i6jjVcSKYDvymMsEUBKypE5P5ONFw==
X-Google-Smtp-Source: AGHT+IHqdt5ajiplTEaovUDLGl51afHdEnTQZFliWrlTx+v1CRNbAMpFrwaeese2sJlT/0cOEXoObA==
X-Received: by 2002:a05:6a21:33a2:b0:1d9:18af:d150 with SMTP id adf61e73a8af0-1dc229d5f22mr32400641637.21.1731557510608;
        Wed, 13 Nov 2024 20:11:50 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a6e6fabsm253911b3a.67.2024.11.13.20.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:11:50 -0800 (PST)
Message-ID: <4e6b9e45-0401-4fd0-a7c3-63cf6e4f444a@linaro.org>
Date: Wed, 13 Nov 2024 20:11:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/24] target/arm/mte: Restrict 'exec/ram_addr.h' to
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: bGSHXFzxwiFv

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gImV4ZWMvcmFtX2FkZHIuaCIgY29udGFpbnMgc3lzdGVtIHNwZWNpZmljIGRlY2xhcmF0
aW9ucy4NCj4gUmVzdHJpY3QgaXRzIGluY2x1c2lvbiB0byBzeXNlbXUgdG8gYXZvaWQgYnVp
bGQgZXJyb3JzDQo+IHdoZW4gcmVmYWN0b3JpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAg
IHRhcmdldC9hcm0vdGNnL210ZV9oZWxwZXIuYyB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS90Y2cv
bXRlX2hlbHBlci5jIGIvdGFyZ2V0L2FybS90Y2cvbXRlX2hlbHBlci5jDQo+IGluZGV4IDlk
MmJhMjg3ZWUuLmIwMTdiMjZkMDcgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9hcm0vdGNnL210
ZV9oZWxwZXIuYw0KPiArKysgYi90YXJnZXQvYXJtL3RjZy9tdGVfaGVscGVyLmMNCj4gQEAg
LTIzLDcgKzIzLDkgQEANCj4gICAjaW5jbHVkZSAiaW50ZXJuYWxzLmgiDQo+ICAgI2luY2x1
ZGUgImV4ZWMvZXhlYy1hbGwuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9wYWdlLXByb3RlY3Rp
b24uaCINCj4gKyNpZm5kZWYgQ09ORklHX1VTRVJfT05MWQ0KPiAgICNpbmNsdWRlICJleGVj
L3JhbV9hZGRyLmgiDQo+ICsjZW5kaWYNCj4gICAjaW5jbHVkZSAiZXhlYy9jcHVfbGRzdC5o
Ig0KPiAgICNpbmNsdWRlICJleGVjL2hlbHBlci1wcm90by5oIg0KPiAgICNpbmNsdWRlICJo
dy9jb3JlL3RjZy1jcHUtb3BzLmgiDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
