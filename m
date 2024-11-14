Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89416njc;
        Wed, 13 Nov 2024 20:11:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkHf54q8g/BQJsckhw/RbMFjvjd/j97bBbqOI3t5esqhPHzkH9kHWsKnteLMji7YYP6ejDtQQnom8nYA==@linaro.org
X-Received: by 2002:a05:6870:214:b0:25e:13b7:e361 with SMTP id 586e51a60fabf-295601906f5mr20299402fac.25.1731557489473;
        Wed, 13 Nov 2024 20:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557489; cv=none;
        d=google.com; s=arc-20240605;
        b=RrZ8zw74c/q6ODj8MLX0/jgdsyRxuV2mZLO7mXXier3eUkXZ9VmOMg1leVWgR28o9Z
         2X2Efjd3TKMAJWOGemT/tyYbR0zGEPfpCxpm+HYJH7gmyo1mQ/oHe8EfQ6yqNkiRWX0H
         Fud8I6mEJvEJQZh5j22v0waVmuleuvSGoXiyoLG/RolIa3VfitHWaLjB1Z4p4N5xQhh8
         vqnxAuY45plhW6pG1WaIrduCNP91RfFqTe63i4m0K9mztseEjlVmJsAFu4eTKAZn6MnB
         VAUaZ+00zlW4fdpacy11etlUFD0xiifP6x2KBmyyPTWs7Vb7SbuLljzq3M0slQoxnaUo
         PCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I/qS5fjAunvnhRwFeKvQTgVQs7ykDsgCGDV2Gh2Fd7w=;
        fh=Dj8wFaHTONlr1sifgb2pJEhPh+lQalK6c+0L/BUTQ5s=;
        b=Be/HVIVbPk/EPH6YBxe6P0oTFSNGYrm2lKqn0YkmoVP4MhjTVnkMpdFrwR8t1p+1/n
         obYQFqv9ibq0d8e0YUapPknF8qE/U1M/vAm2KnST4H6mwWPpMcTFDL9/eLytRom7n/+0
         bGFLUxuvKLZJocK2BtIV6sSeft35ZbDw+AXZR7YtUrwrdCfsxaeZAL4rFLbenWQNgj1s
         6DH/bUno9eOBVz3/Y9kxrKy+xsVx2KqDWPACtrnriw6748SVmcVzUPdLdfYdos749ijt
         FYkPX4RBaMR2XzbHRCkAveH8TGX4S5r6dOxrgw1DhN7Kt45S7FFOU43QTfirYpOnx/a9
         6bmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKYShCYx;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-71a6eb617a4sor141113a34.13.2024.11.13.20.11.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKYShCYx;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557489; x=1732162289; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/qS5fjAunvnhRwFeKvQTgVQs7ykDsgCGDV2Gh2Fd7w=;
        b=wKYShCYxAQYPLjRDumGjlimXGo0Q6+OREi4q2XUu8wFGmP1yMeGY4xtEfpJuG5rIxF
         hazUgQC78t0dTnnLS4K0Kl6bQURxDIfyAZS9vZ9DYcHK9Acnxal5j+lVDYt2cTUGTdqz
         3rOczQ+Ja9rULrXaPPzrZIGtyWKEL+Lzx5tmVvWKRvC7GkwD78I22VftXAoUEOzq8nUa
         B1pSArGXQWS3MAqkZFzcEGP6RY0vp5fdoCBjtOvewV3uwa874teSZIfWOtA8+sfi2Pmm
         ChMQxlfVJywJXjy4jhM/lvbdbMleWDWSYn/22T0TQi+UIxNfsfjr25Y5SXiSQms4aqcj
         BQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557489; x=1732162289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/qS5fjAunvnhRwFeKvQTgVQs7ykDsgCGDV2Gh2Fd7w=;
        b=ZRkDY2whEmvEQUr1VqPllEvL9i0C9/6hpD/L47FP/0nMF8qXs8IjTgcFSqR82AQyAp
         DH5BVLfUjo57nliAquDSUY4J0VatfKejRrHCjXvSoss5Xs+hnFhbQVPHUPOsrduGL2ss
         fomvRimOoC49cYPLIE90gpR4QwL5uWNHjwgHzYF7rIGpK7X4jHJ7fctp1if9Y0P4sV55
         ivV5cjutwmdcyjS59C/kyfQDzR8LYd4s3Dp7Vtro07cGEWsSqNkHeBJCbr9gQ3XMB4PX
         ojFwMVKVQPmjfoTJwuZrk9CmJdKj7ojPp8JOJi+4AxpvxmJSBwV+MQ+XrnZJyqBwh8KO
         6Rlw==
X-Forwarded-Encrypted: i=1; AJvYcCU8cRxlXpU1VXXGf8CfnxT0gteOF42/ZJAA7NsU3K0qG7tflUC3/Y9+a/yxC0YpOq4viYra9io7x/w8ag==@linaro.org
X-Gm-Message-State: AOJu0YyjdE7d+QnoS+gTeTFQYM5cFHrAGK4rLhEuKdBIXS3EeJzqmaOC
	yKzBf0kl8imIekwJrY65q/IDcVAfYKyjhSg7LL0IbEH0u2mL0Oe3aLEOBiCwkpuTqg==
X-Google-Smtp-Source: AGHT+IHyRDYqz+YJmQ9XIjXfV5d5YqMbBQezSo2mZx761MrDq8+J3aN2YeIUrI4DiKzqtTyQjhxlCw==
X-Received: by 2002:a05:6830:d8d:b0:718:cde:ea55 with SMTP id 46e09a7af769-71a1c1f8ae3mr20229295a34.18.1731557489084;
        Wed, 13 Nov 2024 20:11:29 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b39af5e2sm132319a12.73.2024.11.13.20.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:11:28 -0800 (PST)
Message-ID: <0c8569ff-149a-41fa-a141-7a2d355901a6@linaro.org>
Date: Wed, 13 Nov 2024 20:11:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/24] target/rx/cpu: Include missing
 'exec/translation-block.h' header
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
 <20241114011310.3615-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: JN/r0X0UHwb6

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gVGhlIFRyYW5zbGF0aW9uQmxvY2sgc3RydWN0dXJlIGlzIGRlY2xhcmVkIGluDQo+ICJl
eGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgiLCBhbG9uZyB3aXRoIHRoZSBUQg0KPiBjb21waWxl
IGZsYWcgZGVmaW5pdGlvbnMuIEluY2x1ZGUgdGhlIGhlYWRlcg0KPiBpbiBvcmRlciB0byBh
dm9pZCB3aGVuIHJlZmFjdG9yaW5nOg0KPiANCj4gICAgdGFyZ2V0L3J4L2NwdS5jOjUwOjQy
OiBlcnJvcjogdXNlIG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllciAnQ0ZfUENSRUwnDQo+ICAg
ICAgIDUwIHwgICAgIHRjZ19kZWJ1Z19hc3NlcnQoIXRjZ19jZmxhZ3NfaGFzKGNzLCBDRl9Q
Q1JFTCkpOw0KPiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXg0KPiAgICB0YXJnZXQvcngvY3B1LmM6NTE6MjE6IGVycm9yOiBpbmNvbXBs
ZXRlIGRlZmluaXRpb24gb2YgdHlwZSAnc3RydWN0IFRyYW5zbGF0aW9uQmxvY2snDQo+ICAg
ICAgIDUxIHwgICAgIGNwdS0+ZW52LnBjID0gdGItPnBjOw0KPiAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgIH5+Xg0KPiAgICBpbmNsdWRlL3FlbXUvdHlwZWRlZnMuaDoxMTY6MTY6
IG5vdGU6IGZvcndhcmQgZGVjbGFyYXRpb24gb2YgJ3N0cnVjdCBUcmFuc2xhdGlvbkJsb2Nr
Jw0KPiAgICAgIDExNiB8IHR5cGVkZWYgc3RydWN0IFRyYW5zbGF0aW9uQmxvY2sgVHJhbnNs
YXRpb25CbG9jazsNCj4gICAgICAgICAgfCAgICAgICAgICAgICAgICBeDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
DQo+IC0tLQ0KPiAgIHRhcmdldC9yeC9jcHUuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9yeC9jcHUuYyBi
L3RhcmdldC9yeC9jcHUuYw0KPiBpbmRleCA2NWE3NGNlNzIwLi45NDVhZTZlOWU1IDEwMDY0
NA0KPiAtLS0gYS90YXJnZXQvcngvY3B1LmMNCj4gKysrIGIvdGFyZ2V0L3J4L2NwdS5jDQo+
IEBAIC0yMyw2ICsyMyw3IEBADQo+ICAgI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRlLmgi
DQo+ICAgI2luY2x1ZGUgImV4ZWMvZXhlYy1hbGwuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9w
YWdlLXByb3RlY3Rpb24uaCINCj4gKyNpbmNsdWRlICJleGVjL3RyYW5zbGF0aW9uLWJsb2Nr
LmgiDQo+ICAgI2luY2x1ZGUgImh3L2xvYWRlci5oIg0KPiAgICNpbmNsdWRlICJmcHUvc29m
dGZsb2F0LmgiDQo+ICAgI2luY2x1ZGUgInRjZy9kZWJ1Zy1hc3NlcnQuaCINCg0KUmV2aWV3
ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4N
Cg0K
