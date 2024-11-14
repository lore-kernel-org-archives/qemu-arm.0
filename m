Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89434njc;
        Wed, 13 Nov 2024 20:11:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFTf/wqqRaj0cRWVqKBCtGv0N/vqCDIDXc6jK0e4YVQSgG9gQGQMahOscBRC8AxApPmrF5dKTFLcm83w==@linaro.org
X-Received: by 2002:a05:6870:e386:b0:278:64e:c5ef with SMTP id 586e51a60fabf-29560365eb5mr19671836fac.37.1731557495752;
        Wed, 13 Nov 2024 20:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557495; cv=none;
        d=google.com; s=arc-20240605;
        b=KjIZiYfmSbZLbSpm1Z9O7GYSYlw9Jlxytdiju+gzCCPD30cTXHE/6UJmlv/2QjVA+O
         bmKOK7bJrz9CS3WOJtVTan/7xPDnjIhYXlunObKiWkkDs8BfmlC2xXoB04K//oYDABBh
         PYfiV1gQzOCh9UxZVBWY+JO6//VxjuNbQdvJfntIaZXdHJHGF2mim9yebDf2eHqfVvu0
         jWebvd8BVCvJOojhR23WmdyE8+xLv74g4qhoHLAfaW+xnyF2Amp3o2rsPiRpWK+HFYRz
         jGN0p/58x7NuusNP5s9JIMahl+CTedTWfpw8K50+5nvoyScT2J89hhqImKocFvop78r4
         Tylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TEN+4z1Vk7ScdaNl+Nv1dim/1Iw42NJSZFhbHfv4BQQ=;
        fh=fk0xpXBDOV5EKG7EjwtZyG/2oL28K9dw4wc6PdTmQcw=;
        b=PTkvWZ2MXZuCKEv1NMBLWhQPBBU7aERGEyt130aj9BK1kDy95BnHvd5EOlDeuE9wW1
         4EQyjOKP0M2PbLcstN557nCETmiDz0KhuRD4qdif/lFw+8FMWU6RUFBsxPZ1f1jdbKCI
         +k5n8Rhb+MCLvqaMuYBKfrAxkiyFzhgK2GzCtHffZGPP1Wh4N+0JmFTlW7ieUnN9viIn
         1RzDQvVKlOJq1e2Q3RCJlB2L8VgEAvEBEnTMI6yqSgeogMMTLpId1ew9fC0XufecAc2f
         9jjUEGli6EU8boKAqu1B567CTXVvq1Afulz6JK3m4ug86kmCc17rKlhzXFu+qbSDqaYG
         MKXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s1CQTpk/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-71a6eb7221fsor109337a34.13.2024.11.13.20.11.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="s1CQTpk/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557495; x=1732162295; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEN+4z1Vk7ScdaNl+Nv1dim/1Iw42NJSZFhbHfv4BQQ=;
        b=s1CQTpk/ndiPOSJSGdkS64DZpk49vu2aUkHo5+XvT2b+68+lorkgxlHMy71I3W1oMj
         gPq95CGtm3zMlcVCc/7WbKGDJkIv7QmW3bZheex8zUS1kQk0TRv6V1WnxywzWhgtryDW
         aXjRf9yhvHUkuiGTWaVrAVpXOhksYbdXTeF6dgxVMqCtUZ02ZUI87twzLonuAFfAQAqe
         gYhi73wqJx8WR2amdLDevikasNEm1MQxqctPMRHJMI6+SMOovp4OOIj8u1xqY4q/6SG+
         sDqDU8UyH2gEztAUXpTWkdQ1W7ZwyXnWcm9LniZrROG8R5LbPNE9+S48+ffDYj1H7/Wf
         Dybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557495; x=1732162295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEN+4z1Vk7ScdaNl+Nv1dim/1Iw42NJSZFhbHfv4BQQ=;
        b=iWJv3zTIflKckSioMI1AQ7rQDj38J5ZKZXdSE7CMxTMiPUWzQf797ViEKhLYcCduHT
         v/DwSj3oaALI3jBmxSBZcaEuplpX57NgPK7ce8ypVDh6JbeHNFlTq+2TFNxHgCxad5HN
         Qq5PfW5mEC68sSDM5hrnkw+DjYGykQkD57NnrKXNBS3VEl63vsYSKr9cNQvQHazjFZ96
         Tbp5+mzKwUkamCkp0AfrOnEj6wYZ0UOfbCTE9yiYh0cSh9ICbiRform6TFfYERXhsivX
         z4rXkz6YsCrBkvomsfo/ZvL26uep0Bpv18QKr1OzMLAOV2/7wcCDFxkSq517ov7YrVc7
         JTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoS28V2GZ1G8fQ/VVytsaDpZ8h6CGwL/up+IUyFf2XyRQ6GS9Ol2+tVW/dtxdBbggubzi4sOnhKwvg8g==@linaro.org
X-Gm-Message-State: AOJu0YwgjUBpZrZt+a6VjaFP8mDfYdYGw4Xel3aM8XiJXr0YxnlUY7j/
	KWQ6o3fGBXTO51nQ0qeYE9Za/oJbzba4DD0sxIS9UVVM6Xa+AKlZ0R79Jn9mZI8EuOTUwETneW+
	uNH29CsN/
X-Google-Smtp-Source: AGHT+IFXUZfcWaL3ihlUDKzURSyduA4bdDa2twYusHD9JGEcxqLdtfyy/KskY6JVvm1hpmKOi/vamg==
X-Received: by 2002:a05:6830:668c:b0:716:8e7a:f0c2 with SMTP id 46e09a7af769-71a1c2b1f87mr20904168a34.30.1731557495339;
        Wed, 13 Nov 2024 20:11:35 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b39af5e2sm132319a12.73.2024.11.13.20.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:11:34 -0800 (PST)
Message-ID: <754dcf6f-6c53-454e-b24d-8786c0e31c20@linaro.org>
Date: Wed, 13 Nov 2024 20:11:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] system/watchpoint: Include missing 'exec/cpu-all.h'
 header
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
 <20241114011310.3615-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 0SACtJQ4Xxji

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gVEFSR0VUX1BBR0VfTUFTSyBpcyBkZWZpbmVkIGluICJleGVjL2NwdS1hbGwuaCIuDQo+
IEluY2x1ZGUgaXQgaW4gb3JkZXIgdG8gYXZvaWQgd2hlbiByZWZhY3RvcmluZzoNCj4gDQo+
ICAgIHN5c3RlbS93YXRjaHBvaW50LmM6NTI6MjQ6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJl
ZCBpZGVudGlmaWVyICdUQVJHRVRfUEFHRV9NQVNLJw0KPiAgICAgICA1MiB8ICAgICBpbl9w
YWdlID0gLShhZGRyIHwgVEFSR0VUX1BBR0VfTUFTSyk7DQo+ICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICBeDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIHN5c3RlbS93YXRj
aHBvaW50LmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9zeXN0ZW0vd2F0Y2hwb2ludC5jIGIvc3lzdGVtL3dhdGNocG9p
bnQuYw0KPiBpbmRleCAyYWEyYTllYTYzLi5mNzM2NjU3NGEzIDEwMDY0NA0KPiAtLS0gYS9z
eXN0ZW0vd2F0Y2hwb2ludC5jDQo+ICsrKyBiL3N5c3RlbS93YXRjaHBvaW50LmMNCj4gQEAg
LTIwLDYgKzIwLDcgQEANCj4gICAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPiAgICNpbmNs
dWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIg0KPiAgICNpbmNsdWRlICJleGVjL2V4ZWMtYWxs
LmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9jcHUtYWxsLmgiDQo+ICAgI2luY2x1ZGUgImh3L2Nv
cmUvY3B1LmgiDQo+ICAgDQo+ICAgLyogQWRkIGEgd2F0Y2hwb2ludC4gICovDQoNClJldmll
d2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+
DQoNCg==
