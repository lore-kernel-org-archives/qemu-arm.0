Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89481njc;
        Wed, 13 Nov 2024 20:11:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsVhktuqYrqL5njzpKebWxz4V10b1+QsDCX40CD4XNRkte7ikhlu5epvyVR34IiPGmq9AmCfpuo4eQXQ==@linaro.org
X-Received: by 2002:a05:6a00:4fd4:b0:71e:44f6:6900 with SMTP id d2e1a72fcca58-7244a59f4damr10987071b3a.16.1731557502752;
        Wed, 13 Nov 2024 20:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557502; cv=none;
        d=google.com; s=arc-20240605;
        b=grAunrKTc06V/RfO8kWma/NeFt9LnDIqiHB30CmnKV2twdw6i1h0oOHOxXS4KDbOLC
         ATKfm4YjuF4gDhz58HS48XSSaCE1MC4y4eEfACclC7ep6hjlrXjOdIBfrMDQEsMXtO/Q
         aCUIvPrqb4VkJfm9Fh2k8CMuhNrf+cn1yyoeWjRu0+bQjK03ut2LhahZZLzd+TibsAPx
         aYP3eXJLiDsDRw8ZYc1mq9um5gFe+xqF4cIYcbbOaVYfl+YnzeftGyK7KzrBMPb/Lxuu
         9dTSiacgo8hQBFC5X4gfn3nrjtZYgUvESIvQ8ntBp8w7rMRFuzbQKaOFA6neci99lAQI
         YptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=l9dXBdm7BssboJS703vUyvBvvYyv8Ly8Z+LfP38IxVw=;
        fh=0eJfvB4zrXJwJ2Fp9XeZtOVlwhoUOij+4iB+wH3ZGuA=;
        b=L28ZTjIiHDl25s1FYahoncF3pF6PFozO66s7XKmTeTf1qvYCPtDEJNPueok7kg9jMl
         rCMGcNUJM0biS76ns6+85GHEgQe0EtemWANYpncD15AEpK3BvpDgyHQ1LDYNqoCXgzIz
         7SGCyRX9SJyKmgYXtEq3iXLirKFRbJq9DzQaAjKVU+kiqmRHLvC6Mt55o1bjIcKdhUS5
         W48IgHynlx7nSJ1BIlMv4s/5572Fk1bt8nGLLNYDT3RSmXMs+9Z0paTdfX6cmGbnwagN
         iyQZZ65DtWNhZPr5U3mkvb+P6U6gMeuxcHIJdizY4X8N3nv1RkawEk35vrl8KlTvg3u5
         PqZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbCkTSlT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a99cdf0sor324747b3a.8.2024.11.13.20.11.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NbCkTSlT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557502; x=1732162302; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9dXBdm7BssboJS703vUyvBvvYyv8Ly8Z+LfP38IxVw=;
        b=NbCkTSlTnpHrT88gKX2ZUGs3WpbfJJOjVxjpkMCixa7suQlzQ4fVUryd29gCi4VXpg
         USMZUIKliza65MGAh6GGZ8sVNjlzb1A1BVQSN9n51jRVwPFFINg170Z8orbhMNnvDqnV
         DqQpvKP6c8P4mjhXw9PHKzXuqo/hOh0gFM9RNxGyCR9p/rn/0vUvBnEmwRe9GWOcqJA0
         Jz/n6nZ9Td92s+pKKWMwoBiIe+UL1AuTsXucQwkhzyjIuanH+tyXW5seAJ0GBv2AzImt
         oc6II+fUMYBfw5eSl92CzBBtT3azamruDNBTWWwBvRQbSMK9fLgfGPGNFo6miubPnrOq
         Yy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557502; x=1732162302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9dXBdm7BssboJS703vUyvBvvYyv8Ly8Z+LfP38IxVw=;
        b=hMfQMcPuhLwL41/OCuW0sO/dSzWP+6OZBryZgl+s7IVN2tdpOzi7UH229aoTxQnvsl
         IJCwGHacjxPZD1M72yLyqK/IQYNbz9PdadWJvSD8RmSPBPBJh6SF4MopLLmFwEmdhnwl
         sOiMNIzicTyWCcYIQwpNfBIvVQ3jvV7ORqv2zzyjoUngeT3m8ZCo6+YSp+1qBlmUr8GQ
         5wMvU4eagqq20mNyo6F14h0WzeAGW4M751rOtjGt1QZq+Nr3FyTEEw/N7wXHaqV9EOaN
         1QTpCd4g0KAC0/Db7f71W7lDNw/d0x84B5ZHH4Z4HfAvHwV/kyzHmS2HJvQSFTX347wV
         snNw==
X-Forwarded-Encrypted: i=1; AJvYcCUdwiE5xMGFazRjKaMWG5VWJCEAiXXQtN5SI0XzIBwRdeuZE6XiacMSjb4NHbEDDFyPGdpZbsrwnBORFQ==@linaro.org
X-Gm-Message-State: AOJu0YyHekP84ZNvNEWDKzOgKTRx/4fCGDv0WHjfxxdRIJvydsbxBQSt
	gY5arec1aoFLzhf89pYY8ULnZXFbRlWiMWxZLJ1wvgmPqtlnD+RCHFTUE8hfWcjl8A==
X-Google-Smtp-Source: AGHT+IHdSwCp1o24hvpDHYsmPBHWKP0jROnp9Hy+GAkM/TB0ZhZEoQZp5+raWShC01JXnl31H5Q3/g==
X-Received: by 2002:a05:6a00:3c93:b0:71e:4c2f:5bed with SMTP id d2e1a72fcca58-7244a5a1581mr11777297b3a.20.1731557502301;
        Wed, 13 Nov 2024 20:11:42 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a9d3af6sm240759b3a.191.2024.11.13.20.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:11:41 -0800 (PST)
Message-ID: <75446b0b-5b49-437c-bd2d-36f8461fd1d0@linaro.org>
Date: Wed, 13 Nov 2024 20:11:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] linux-user/aarch64/mte: Include missing
 'user/abitypes.h' header
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
 <20241114011310.3615-9-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: xoIbqOlQq9ra

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gYWJpX2xvbmcgdHlwZSBpcyBkZWZpbmVkIGluICJ1c2VyL2FiaXR5cGVzLmgiLg0KPiBJ
bmNsdWRlIGl0IGluIG9yZGVyIHRvIGF2b2lkIHdoZW4gcmVmYWN0b3Jpbmc6DQo+IA0KPiAg
ICBsaW51eC11c2VyL2FhcmNoNjQvbXRlX3VzZXJfaGVscGVyLmg6MzA6NDI6IGVycm9yOiB1
bmtub3duIHR5cGUgbmFtZSDigJhhYmlfbG9uZ+KAmTsgZGlkIHlvdSBtZWFuIOKAmHVfbG9u
Z+KAmT8NCj4gICAgICAgMzAgfCB2b2lkIGFybV9zZXRfbXRlX3RjZjAoQ1BVQXJjaFN0YXRl
ICplbnYsIGFiaV9sb25nIHZhbHVlKTsNCj4gICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+DQo+ICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1X2xvbmcNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4N
Cj4gLS0tDQo+ICAgbGludXgtdXNlci9hYXJjaDY0L210ZV91c2VyX2hlbHBlci5oIHwgMiAr
Kw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9saW51eC11c2VyL2FhcmNoNjQvbXRlX3VzZXJfaGVscGVyLmggYi9saW51eC11c2Vy
L2FhcmNoNjQvbXRlX3VzZXJfaGVscGVyLmgNCj4gaW5kZXggODY4NWU1MTc1YS4uMGM1M2Fi
ZGEyMiAxMDA2NDQNCj4gLS0tIGEvbGludXgtdXNlci9hYXJjaDY0L210ZV91c2VyX2hlbHBl
ci5oDQo+ICsrKyBiL2xpbnV4LXVzZXIvYWFyY2g2NC9tdGVfdXNlcl9oZWxwZXIuaA0KPiBA
QCAtOSw2ICs5LDggQEANCj4gICAjaWZuZGVmIEFBUkNINjRfTVRFX1VTRVJfSEVMUEVSX0gN
Cj4gICAjZGVmaW5lIEFBUkNINjRfTVRFIFVTRVJfSEVMUEVSX0gNCj4gICANCj4gKyNpbmNs
dWRlICJ1c2VyL2FiaXR5cGVzLmgiDQo+ICsNCj4gICAjaWZuZGVmIFBSX01URV9UQ0ZfU0hJ
RlQNCj4gICAjIGRlZmluZSBQUl9NVEVfVENGX1NISUZUICAgICAgIDENCj4gICAjIGRlZmlu
ZSBQUl9NVEVfVENGX05PTkUgICAgICAgICgwVUwgPDwgUFJfTVRFX1RDRl9TSElGVCkNCg0K
UmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZz4NCg0K
