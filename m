Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89240njc;
        Wed, 13 Nov 2024 20:10:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUJyFrFWZc6MpYyQepsBc4v+gC/UfwSBKimthMrmvGKAkJXhI4XGVsqnfMfr+DOm/+LYre10WdbDh1tA==@linaro.org
X-Received: by 2002:a05:6a20:8421:b0:1d9:c6e8:60fc with SMTP id adf61e73a8af0-1dc228931b2mr33608522637.6.1731557457392;
        Wed, 13 Nov 2024 20:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557457; cv=none;
        d=google.com; s=arc-20240605;
        b=hb/vGtpBwUbH+zPxS4GpTW6GmRFcXpL14V/FWh3NThdDPrXVVjfCUfkJG//xQSG50Q
         3qq8f1xK1Zq1CBY3/UbFwlVqveWnOYoYf3L1wdt0D7Zg7Jv/+dekgKF/mZG0kMIz6SWM
         Gzx8JhBYdBX1CRnxcrNTMiw2UoALs30vKZPCdsVerPSqJH8V5HIBEuXFUKdUcBEfbn3m
         q7fkX6Fi9YwXIW96jKCmkGmrXSwPYEzDXKB1wvcnd6NGqxT1n2ZAi0McFO4uJmydc6NM
         D1km51RwKBalFUXxxMEi2W9Azf5NXRV3q2e3BEwNEVB7WTPHri1Fsw7/XtYmdz32uixu
         AjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dUfD1eRm5TcDJOTQqmwAsohRECtZQFdTOirjQrvjgGY=;
        fh=57KdcFsKNrdzTiHB/mJcWnb+apA5nvnQGBfACVTg2b0=;
        b=MmHLCLAKhvGFve0c19/8EYL6uvVm62eRWwscQXGNcZeO2zlZxsQ6nWTLVE1ZunHJpF
         WtdTULvBZV/Okfve3Z+1bN8I4FFte4d6jeHH6YFp2UAyi0Qopu1uZHKTZV8UFJSTY3fh
         XcCg3uruUJ6NruYxIIV/RuDUnbrrXggyopgzx30j8QQYbvI39cWMEBEjZs4XgIQ45Z8Q
         mqGJmNFSU/uSUt1gEURQlQpGYebr+qyaPkTngAbMgfEmtTTjHmS3mQdzuSFr+JoQZOOT
         WcMHRuDDq7Wda5danvVk6dspDs0BCOOh0A+9knDoz+9hMwYwQOrxaJakhuazTmrwmqmO
         njBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uRMdsqRt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a9d1993sor264704b3a.9.2024.11.13.20.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uRMdsqRt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557457; x=1732162257; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUfD1eRm5TcDJOTQqmwAsohRECtZQFdTOirjQrvjgGY=;
        b=uRMdsqRtypDwhquTer0zX7AvUYl1IrPJ7fespfFQSz1WQUvHS++qKBPfBhJ1rFVwvq
         QdcL+szgTFsFEAiWa756BLFLb62sq/uxGsAmPhvIeeG/JPOhYNE2sGA6dcNycOoZm8FM
         c1gWv3Y9KKIRHXhRkJ8zxAC1aDbJnztt6PcNZBQk5GZuGswMvDNVKl4M5LfcuQD3R04R
         NaTRdaRb4r+DWPrEepOEdraPpmsKPfQ4WulLdZI0FsqvyFDL93A0uTi6TugyvmkBnlz0
         WjW5V83ajot8nFWwCbl4jB4wj7GLTUfJJcQmFCce5RwkWR8p1NuEkZ1D9NWTc33Yt7uq
         duFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557457; x=1732162257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUfD1eRm5TcDJOTQqmwAsohRECtZQFdTOirjQrvjgGY=;
        b=RtyszVIL64bTs8U6bC5C7xgxejP9WZRiA0W6inw+l3vKco75i7hSfI1Mo/0jCU8AGU
         2NBt1YYI03Z3N6lKcNDO7RlpczZBiIJpYMiMbzQrKmncIc66rSFjfmaYrGkkVMkKtKD/
         79YaU0DqpFaR4UlyUVxvfXOzcCoKcwIhbZQ2TCBdB9+mepgzq2MOtgRqKI3SO2MMLcMz
         2Anoo9Vh270avLc0rUEJZ5b0uRe3qYAu0QStB01wnoFDBjpox9pvdfQftc49rE9jt0e9
         Gh9wpKAVZPnec/XTl7AIKMTcRZnEILY2fFE/5aHZenIkurPAMZ9PGjTVC1Xrl6KsmHXK
         T53w==
X-Forwarded-Encrypted: i=1; AJvYcCUTXOcxOfSLl3r3QFSFQ7eg7bxWIodxclm2Re21hhvCdaqdDEiEi5nl9pohKSue1v/a3cse1C/p9OY3/Q==@linaro.org
X-Gm-Message-State: AOJu0Yx/ltO8Eqie1oJr2YeAQfFLShuWE26LGaS6l5w2utgeDi5Sbxno
	MUdilURh7Heui2eHoeP0Ic21Sns2SvgkMpsCQP2d2/LYFTOriMD7qUgasp7zIFElHg==
X-Google-Smtp-Source: AGHT+IFV8GU0vRgpC7rvgSW3HjkWqYkbdmA4F9HNXwW3cVfPlTXRapZWT7FJiBW5/IC3RpuUKZsiUA==
X-Received: by 2002:a05:6a00:23c4:b0:724:603f:1f9c with SMTP id d2e1a72fcca58-724603f20abmr3896225b3a.16.1731557457003;
        Wed, 13 Nov 2024 20:10:57 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a6e7e43sm243876b3a.70.2024.11.13.20.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:10:56 -0800 (PST)
Message-ID: <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
Date: Wed, 13 Nov 2024 20:10:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
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
 <20241114011310.3615-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: tpi8romEn/jw

T24gMTEvMTMvMjQgMTc6MTIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiAn
dmFkZHInIGlzIGRlY2xhcmVkIGluICJleGVjL3ZhZGRyLmgiLg0KPiBJbmNsdWRlIGl0IGlu
IG9yZGVyIHRvIGF2b2lkIHdoZW4gcmVmYWN0b3Jpbmc6DQo+IA0KPiAgICBpbmNsdWRlL2V4
ZWMvdHJhbnNsYXRpb24tYmxvY2suaDo1Njo1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
J3ZhZGRyJw0KPiAgICAgICA1NiB8ICAgICB2YWRkciBwYzsNCj4gICAgICAgICAgfCAgICAg
Xg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL2V4ZWMvdHJhbnNsYXRpb24tYmxv
Y2suaCB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy90cmFuc2xhdGlvbi1ibG9jay5oIGIvaW5jbHVk
ZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4gaW5kZXggYTZkMWFmNmU5Yi4uYjk5YWZi
MDA3NyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgN
Cj4gKysrIGIvaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4gQEAgLTksNiAr
OSw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgInFlbXUvdGhyZWFkLmgiDQo+ICAgI2luY2x1
ZGUgImV4ZWMvY3B1LWNvbW1vbi5oIg0KPiArI2luY2x1ZGUgImV4ZWMvdmFkZHIuaCINCj4g
ICAjaWZkZWYgQ09ORklHX1VTRVJfT05MWQ0KPiAgICNpbmNsdWRlICJxZW11L2ludGVydmFs
LXRyZWUuaCINCj4gICAjZW5kaWYNCg0KSSdtIGEgYml0IGNvbmZ1c2VkIGJ5IGNvbW1pdCBt
ZXNzYWdlLCBidXQgaXQgc2VlbXMgdGhhdCB0aGlzIHNlcmllcyBoYXMgDQpzb21lIGNvbW1p
dHMgdGhhdCB3aWxsIG5vdCBjb21waWxlLiBJcyB0aGF0IHNvbWV0aGluZyBhY2NlcHRhYmxl
Pw0KDQpJZiBpdCdzIG9rLA0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg0K
