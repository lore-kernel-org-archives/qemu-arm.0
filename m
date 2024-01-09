Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp416245ejs;
        Tue, 9 Jan 2024 06:24:24 -0800 (PST)
X-Received: by 2002:a05:600c:1f14:b0:40e:49b6:167e with SMTP id bd20-20020a05600c1f1400b0040e49b6167emr899039wmb.79.1704810264281;
        Tue, 09 Jan 2024 06:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704810264; cv=none;
        d=google.com; s=arc-20160816;
        b=isPsKz1H0jI0/eYpgdVeV+tVSTbtTdE9PJrgJ3dBJ0wpZ/S+vB1XcAieF7g0KdmdHV
         NrL5I4t4y86iR7S0UHQFSrztrRnd9p8Zjh4my/KEvfNYCtB/qwVVHMhPXtpWCenUP8G6
         XbRjkz+mC+UdkzT8g65pt7NwHFduIcyjx/gipo6HdVDRd3CtMATJeHKZqI5aaJyf2gnO
         /a/6YTaEWS2L978q2jHFGRmhvW0yeMGXHuu/ttJ4Tak7arV9Bw+DT2b4agxVmp2XvEdC
         8VLuJht+fo8XEUCW3qqTkj1h8DZ4iwQAX/X2kl3y/sIWA6xThhcLg4dU1FCYhnfOOWyw
         IMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7TaTwDNJKCApijCrofUkZrcv+VK9ZM/YluE5dtA8j8M=;
        fh=Z3BjVOp8TwoOhw/cpMrzejnVHnZIQI0iAsu50Vs85Hw=;
        b=Vb5YsIU+ngZdh4cDHkKNz0qetfRp4mdeVbsYJlVKZiqKHHJNXIbMY+ZoPmDo/5Q32P
         0l/dOWyG27kUDYQtF4PU+DhZH5fs1Z/5B0rwGSwyFvLk1gv9WII2yNvEG7apscD3zwj6
         jNJB6df3lA5DEN4Lxqr1bg+oSbcB5SDapw3yra1va+w2Teon0njF28lEXz8PIklBkY7k
         D2EWFw2y2DBEU+3vOm4W5/DIITV0EIgIvJozhCeVvf6UeSCZbTVdA/jjnc1yiex1diPG
         ecpJSabJo5BMtzY8f1/pdG3BLJnl/j7A7Svq562fIUbIGA+gk2K+TTj4DRppdRN2zG7P
         VJoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHNLVQIf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v24-20020a05600c4d9800b0040d7fd4a597sor887919wmp.9.2024.01.09.06.24.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 06:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHNLVQIf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704810263; x=1705415063; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TaTwDNJKCApijCrofUkZrcv+VK9ZM/YluE5dtA8j8M=;
        b=WHNLVQIfJLSN0LA1G9CzX7lyXzl84wEilnoBpFMwk1C9POQNbGHV7wFs6lDyFK4jde
         wxuM/0MM/bVb3MIXWlpRfsZNK0aApWLMG3G0CDGTIPYW1SO7bQYYhV7CCIDubHB5odPF
         OmVsopTSwR1XPL+H9I6O1rUuJVl+H1JZdMzkpAmILSN+fcm+9KXcrtGZxoRiN10K9Xpf
         KmdmHeo2qyChC+ko6667N5ohRwrgsIe1oczI5lN5N0amJS5/jffjMU+RfNYA1RyHM/8j
         gkIAj/sAli4SMrTIrenu0SZnsv5Qga3nYqd+CBQi6x+VTuLU/a1ZPNhsJrMl1jlX9xKJ
         RVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810263; x=1705415063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TaTwDNJKCApijCrofUkZrcv+VK9ZM/YluE5dtA8j8M=;
        b=cvpPcEeC9HZuuKsUsOs+bAA7UGk7ozSqPYdkZki/nfGXkF8yrCqUjYmGHAbxzpPYvc
         MIiHq99KglH8gQD/Y1S91ZsWIJvy3DpqraeOzytN/leYfaks/MlFyEA154+YIc6+flbZ
         Tnu/QsqicS1AH4ik6VpiIgBm0vSwn17yoSj0/dKZjjV+W4xhqVk+Atgv4i4LOXJ/sAWO
         DU99Ke96TgwgDhiFEJyA9lX5Q8lNxr6vRriubfZn6EjSXJyd0bJLB9xPijwOWW5qYVJJ
         7Yoh/gGnuTc+AWmBWzrU7E7z4YpjmwrzEb5fFMT2hTbPSBkOJ3mGKdqyK7aGGGoGq0J/
         IwRQ==
X-Gm-Message-State: AOJu0YzwiFlhqB+BA2Um1UrG1q4IIUJhoEeIg7Wa/VYBZpV/EhoWlm2V
	8vJcTs0R+rjUsK9ihVNLDwhfv9I4ltYyYUH1Gj2jO/XptAR3nXBPcGs=
X-Google-Smtp-Source: AGHT+IFBiWbbDS9xbrZz3ME3I+vcc+TfRmzAikG49gMGGqgDT673KWV87mP5tbIvB/CQl9/MctYIwQ==
X-Received: by 2002:a7b:c041:0:b0:40d:7247:b01f with SMTP id u1-20020a7bc041000000b0040d7247b01fmr1871048wmc.98.1704810263508;
        Tue, 09 Jan 2024 06:24:23 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.24] ([102.35.208.160])
        by smtp.gmail.com with ESMTPSA id ay26-20020a05600c1e1a00b0040e53f24ceasm7614wmb.16.2024.01.09.06.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 06:24:22 -0800 (PST)
Message-ID: <a4554149-4dcf-449f-893d-e3ca70754f93@linaro.org>
Date: Tue, 9 Jan 2024 18:24:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/43] plugins: Use different helpers when reading
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-37-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240103173349.398526-37-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Ar9Z3IQHWfrP

UmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZz4NCg0KT24gMS8zLzI0IDIxOjMzLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IEZyb206
IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gDQo+IFRoaXMg
YXZvaWRzIG9wdGltaXphdGlvbnMgaW5jb21wYXRpYmxlIHdoZW4gcmVhZGluZyByZWdpc3Rl
cnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtp
QGRheW5peC5jb20+DQo+IE1lc3NhZ2UtSWQ6IDwyMDIzMTIxMy1nZGItdjE3LTEyLTc3NzA0
NzM4MDU5MUBkYXluaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGFjY2VsL3RjZy9wbHVnaW4taGVs
cGVycy5oIHwgIDMgKystDQo+ICAgaW5jbHVkZS9xZW11L3BsdWdpbi5oICAgICAgfCAgMSAr
DQo+ICAgYWNjZWwvdGNnL3BsdWdpbi1nZW4uYyAgICAgfCA0MyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgIHBsdWdpbnMvYXBpLmMgICAgICAgICAgICAg
IHwgMTIgKysrKysrKysrLS0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYWNjZWwvdGNnL3BsdWdp
bi1oZWxwZXJzLmggYi9hY2NlbC90Y2cvcGx1Z2luLWhlbHBlcnMuaA0KPiBpbmRleCA4ZTY4
NWUwNjU0NS4uMTE3OTY0MzZmMzUgMTAwNjQ0DQo+IC0tLSBhL2FjY2VsL3RjZy9wbHVnaW4t
aGVscGVycy5oDQo+ICsrKyBiL2FjY2VsL3RjZy9wbHVnaW4taGVscGVycy5oDQo+IEBAIC0x
LDQgKzEsNSBAQA0KPiAgICNpZmRlZiBDT05GSUdfUExVR0lODQo+IC1ERUZfSEVMUEVSX0ZM
QUdTXzIocGx1Z2luX3ZjcHVfdWRhdGFfY2IsIFRDR19DQUxMX05PX1JXRyB8IFRDR19DQUxM
X1BMVUdJTiwgdm9pZCwgaTMyLCBwdHIpDQo+ICtERUZfSEVMUEVSX0ZMQUdTXzIocGx1Z2lu
X3ZjcHVfdWRhdGFfY2Jfbm9fd2csIFRDR19DQUxMX05PX1dHIHwgVENHX0NBTExfUExVR0lO
LCB2b2lkLCBpMzIsIHB0cikNCj4gK0RFRl9IRUxQRVJfRkxBR1NfMihwbHVnaW5fdmNwdV91
ZGF0YV9jYl9ub19yd2csIFRDR19DQUxMX05PX1JXRyB8IFRDR19DQUxMX1BMVUdJTiwgdm9p
ZCwgaTMyLCBwdHIpDQo+ICAgREVGX0hFTFBFUl9GTEFHU180KHBsdWdpbl92Y3B1X21lbV9j
YiwgVENHX0NBTExfTk9fUldHIHwgVENHX0NBTExfUExVR0lOLCB2b2lkLCBpMzIsIGkzMiwg
aTY0LCBwdHIpDQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FlbXUvcGx1
Z2luLmggYi9pbmNsdWRlL3FlbXUvcGx1Z2luLmgNCj4gaW5kZXggN2ZkYzNhNDg0OWYuLmIw
YzVhYzY4MjkzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3FlbXUvcGx1Z2luLmgNCj4gKysr
IGIvaW5jbHVkZS9xZW11L3BsdWdpbi5oDQo+IEBAIC03Myw2ICs3Myw3IEBAIGVudW0gcGx1
Z2luX2R5bl9jYl90eXBlIHsNCj4gICANCj4gICBlbnVtIHBsdWdpbl9keW5fY2Jfc3VidHlw
ZSB7DQo+ICAgICAgIFBMVUdJTl9DQl9SRUdVTEFSLA0KPiArICAgIFBMVUdJTl9DQl9SRUdV
TEFSX1IsDQo+ICAgICAgIFBMVUdJTl9DQl9JTkxJTkUsDQo+ICAgICAgIFBMVUdJTl9OX0NC
X1NVQlRZUEVTLA0KPiAgIH07DQo+IGRpZmYgLS1naXQgYS9hY2NlbC90Y2cvcGx1Z2luLWdl
bi5jIGIvYWNjZWwvdGNnL3BsdWdpbi1nZW4uYw0KPiBpbmRleCA3OGIzMzFiMjUxMC4uYjM3
Y2U3NjgzZTYgMTAwNjQ0DQo+IC0tLSBhL2FjY2VsL3RjZy9wbHVnaW4tZ2VuLmMNCj4gKysr
IGIvYWNjZWwvdGNnL3BsdWdpbi1nZW4uYw0KPiBAQCAtNzksNiArNzksNyBAQCBlbnVtIHBs
dWdpbl9nZW5fZnJvbSB7DQo+ICAgDQo+ICAgZW51bSBwbHVnaW5fZ2VuX2NiIHsNCj4gICAg
ICAgUExVR0lOX0dFTl9DQl9VREFUQSwNCj4gKyAgICBQTFVHSU5fR0VOX0NCX1VEQVRBX1Is
DQo+ICAgICAgIFBMVUdJTl9HRU5fQ0JfSU5MSU5FLA0KPiAgICAgICBQTFVHSU5fR0VOX0NC
X01FTSwNCj4gICAgICAgUExVR0lOX0dFTl9FTkFCTEVfTUVNX0hFTFBFUiwNCj4gQEAgLTkw
LDcgKzkxLDEwIEBAIGVudW0gcGx1Z2luX2dlbl9jYiB7DQo+ICAgICogVGhlc2UgaGVscGVy
cyBhcmUgc3R1YnMgdGhhdCBnZXQgZHluYW1pY2FsbHkgc3dpdGNoZWQgb3V0IGZvciBjYWxs
cw0KPiAgICAqIGRpcmVjdCB0byB0aGUgcGx1Z2luIGlmIHRoZXkgYXJlIHN1YnNjcmliZWQg
dG8uDQo+ICAgICovDQo+IC12b2lkIEhFTFBFUihwbHVnaW5fdmNwdV91ZGF0YV9jYikodWlu
dDMyX3QgY3B1X2luZGV4LCB2b2lkICp1ZGF0YSkNCj4gK3ZvaWQgSEVMUEVSKHBsdWdpbl92
Y3B1X3VkYXRhX2NiX25vX3dnKSh1aW50MzJfdCBjcHVfaW5kZXgsIHZvaWQgKnVkYXRhKQ0K
PiAreyB9DQo+ICsNCj4gK3ZvaWQgSEVMUEVSKHBsdWdpbl92Y3B1X3VkYXRhX2NiX25vX3J3
ZykodWludDMyX3QgY3B1X2luZGV4LCB2b2lkICp1ZGF0YSkNCj4gICB7IH0NCj4gICANCj4g
ICB2b2lkIEhFTFBFUihwbHVnaW5fdmNwdV9tZW1fY2IpKHVuc2lnbmVkIGludCB2Y3B1X2lu
ZGV4LA0KPiBAQCAtOTgsNyArMTAyLDcgQEAgdm9pZCBIRUxQRVIocGx1Z2luX3ZjcHVfbWVt
X2NiKSh1bnNpZ25lZCBpbnQgdmNwdV9pbmRleCwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKnVzZXJkYXRhKQ0KPiAgIHsgfQ0KPiAgIA0KPiAtc3RhdGlj
IHZvaWQgZ2VuX2VtcHR5X3VkYXRhX2NiKHZvaWQpDQo+ICtzdGF0aWMgdm9pZCBnZW5fZW1w
dHlfdWRhdGFfY2Iodm9pZCAoKmdlbl9oZWxwZXIpKFRDR3ZfaTMyLCBUQ0d2X3B0cikpDQo+
ICAgew0KPiAgICAgICBUQ0d2X2kzMiBjcHVfaW5kZXggPSB0Y2dfdGVtcF9lYmJfbmV3X2kz
MigpOw0KPiAgICAgICBUQ0d2X3B0ciB1ZGF0YSA9IHRjZ190ZW1wX2ViYl9uZXdfcHRyKCk7
DQo+IEBAIC0xMDYsMTIgKzExMCwyMiBAQCBzdGF0aWMgdm9pZCBnZW5fZW1wdHlfdWRhdGFf
Y2Iodm9pZCkNCj4gICAgICAgdGNnX2dlbl9tb3ZpX3B0cih1ZGF0YSwgMCk7DQo+ICAgICAg
IHRjZ19nZW5fbGRfaTMyKGNwdV9pbmRleCwgdGNnX2VudiwNCj4gICAgICAgICAgICAgICAg
ICAgICAgLW9mZnNldG9mKEFyY2hDUFUsIGVudikgKyBvZmZzZXRvZihDUFVTdGF0ZSwgY3B1
X2luZGV4KSk7DQo+IC0gICAgZ2VuX2hlbHBlcl9wbHVnaW5fdmNwdV91ZGF0YV9jYihjcHVf
aW5kZXgsIHVkYXRhKTsNCj4gKyAgICBnZW5faGVscGVyKGNwdV9pbmRleCwgdWRhdGEpOw0K
PiAgIA0KPiAgICAgICB0Y2dfdGVtcF9mcmVlX3B0cih1ZGF0YSk7DQo+ICAgICAgIHRjZ190
ZW1wX2ZyZWVfaTMyKGNwdV9pbmRleCk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQg
Z2VuX2VtcHR5X3VkYXRhX2NiX25vX3dnKHZvaWQpDQo+ICt7DQo+ICsgICAgZ2VuX2VtcHR5
X3VkYXRhX2NiKGdlbl9oZWxwZXJfcGx1Z2luX3ZjcHVfdWRhdGFfY2Jfbm9fd2cpOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBnZW5fZW1wdHlfdWRhdGFfY2Jfbm9fcndnKHZvaWQp
DQo+ICt7DQo+ICsgICAgZ2VuX2VtcHR5X3VkYXRhX2NiKGdlbl9oZWxwZXJfcGx1Z2luX3Zj
cHVfdWRhdGFfY2Jfbm9fcndnKTsNCj4gK30NCj4gKw0KPiAgIC8qDQo+ICAgICogRm9yIG5v
dyB3ZSBvbmx5IHN1cHBvcnQgYWRkaV9pNjQuDQo+ICAgICogV2hlbiB3ZSBzdXBwb3J0IG1v
cmUgb3BzLCB3ZSBjYW4gZ2VuZXJhdGUgb25lIGVtcHR5IGlubGluZSBjYiBmb3IgZWFjaC4N
Cj4gQEAgLTE5Miw3ICsyMDYsOCBAQCBzdGF0aWMgdm9pZCBwbHVnaW5fZ2VuX2VtcHR5X2Nh
bGxiYWNrKGVudW0gcGx1Z2luX2dlbl9mcm9tIGZyb20pDQo+ICAgICAgICAgICAgICAgICAg
ICAgICBnZW5fZW1wdHlfbWVtX2hlbHBlcik7DQo+ICAgICAgICAgICAvKiBmYWxsIHRocm91
Z2ggKi8NCj4gICAgICAgY2FzZSBQTFVHSU5fR0VOX0ZST01fVEI6DQo+IC0gICAgICAgIGdl
bl93cmFwcGVkKGZyb20sIFBMVUdJTl9HRU5fQ0JfVURBVEEsIGdlbl9lbXB0eV91ZGF0YV9j
Yik7DQo+ICsgICAgICAgIGdlbl93cmFwcGVkKGZyb20sIFBMVUdJTl9HRU5fQ0JfVURBVEEs
IGdlbl9lbXB0eV91ZGF0YV9jYl9ub19yd2cpOw0KPiArICAgICAgICBnZW5fd3JhcHBlZChm
cm9tLCBQTFVHSU5fR0VOX0NCX1VEQVRBX1IsIGdlbl9lbXB0eV91ZGF0YV9jYl9ub193Zyk7
DQo+ICAgICAgICAgICBnZW5fd3JhcHBlZChmcm9tLCBQTFVHSU5fR0VOX0NCX0lOTElORSwg
Z2VuX2VtcHR5X2lubGluZV9jYik7DQo+ICAgICAgICAgICBicmVhazsNCj4gICAgICAgZGVm
YXVsdDoNCj4gQEAgLTU4OCw2ICs2MDMsMTIgQEAgc3RhdGljIHZvaWQgcGx1Z2luX2dlbl90
Yl91ZGF0YShjb25zdCBzdHJ1Y3QgcWVtdV9wbHVnaW5fdGIgKnB0YiwNCj4gICAgICAgaW5q
ZWN0X3VkYXRhX2NiKHB0Yi0+Y2JzW1BMVUdJTl9DQl9SRUdVTEFSXSwgYmVnaW5fb3ApOw0K
PiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIHBsdWdpbl9nZW5fdGJfdWRhdGFfcihjb25z
dCBzdHJ1Y3QgcWVtdV9wbHVnaW5fdGIgKnB0YiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBUQ0dPcCAqYmVnaW5fb3ApDQo+ICt7DQo+ICsgICAgaW5qZWN0X3Vk
YXRhX2NiKHB0Yi0+Y2JzW1BMVUdJTl9DQl9SRUdVTEFSX1JdLCBiZWdpbl9vcCk7DQo+ICt9
DQo+ICsNCj4gICBzdGF0aWMgdm9pZCBwbHVnaW5fZ2VuX3RiX2lubGluZShjb25zdCBzdHJ1
Y3QgcWVtdV9wbHVnaW5fdGIgKnB0YiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBUQ0dPcCAqYmVnaW5fb3ApDQo+ICAgew0KPiBAQCAtNjAyLDYgKzYyMywxNCBA
QCBzdGF0aWMgdm9pZCBwbHVnaW5fZ2VuX2luc25fdWRhdGEoY29uc3Qgc3RydWN0IHFlbXVf
cGx1Z2luX3RiICpwdGIsDQo+ICAgICAgIGluamVjdF91ZGF0YV9jYihpbnNuLT5jYnNbUExV
R0lOX0NCX0lOU05dW1BMVUdJTl9DQl9SRUdVTEFSXSwgYmVnaW5fb3ApOw0KPiAgIH0NCj4g
ICANCj4gK3N0YXRpYyB2b2lkIHBsdWdpbl9nZW5faW5zbl91ZGF0YV9yKGNvbnN0IHN0cnVj
dCBxZW11X3BsdWdpbl90YiAqcHRiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVENHT3AgKmJlZ2luX29wLCBpbnQgaW5zbl9pZHgpDQo+ICt7DQo+ICsgICAg
c3RydWN0IHFlbXVfcGx1Z2luX2luc24gKmluc24gPSBnX3B0cl9hcnJheV9pbmRleChwdGIt
Pmluc25zLCBpbnNuX2lkeCk7DQo+ICsNCj4gKyAgICBpbmplY3RfdWRhdGFfY2IoaW5zbi0+
Y2JzW1BMVUdJTl9DQl9JTlNOXVtQTFVHSU5fQ0JfUkVHVUxBUl9SXSwgYmVnaW5fb3ApOw0K
PiArfQ0KPiArDQo+ICAgc3RhdGljIHZvaWQgcGx1Z2luX2dlbl9pbnNuX2lubGluZShjb25z
dCBzdHJ1Y3QgcWVtdV9wbHVnaW5fdGIgKnB0YiwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFRDR09wICpiZWdpbl9vcCwgaW50IGluc25faWR4KQ0KPiAgIHsN
Cj4gQEAgLTcyMSw2ICs3NTAsOSBAQCBzdGF0aWMgdm9pZCBwbHVnaW5fZ2VuX2luamVjdChz
dHJ1Y3QgcWVtdV9wbHVnaW5fdGIgKnBsdWdpbl90YikNCj4gICAgICAgICAgICAgICAgICAg
Y2FzZSBQTFVHSU5fR0VOX0NCX1VEQVRBOg0KPiAgICAgICAgICAgICAgICAgICAgICAgcGx1
Z2luX2dlbl90Yl91ZGF0YShwbHVnaW5fdGIsIG9wKTsNCj4gICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgICAgIGNhc2UgUExVR0lOX0dFTl9DQl9VREFU
QV9SOg0KPiArICAgICAgICAgICAgICAgICAgICBwbHVnaW5fZ2VuX3RiX3VkYXRhX3IocGx1
Z2luX3RiLCBvcCk7DQo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAg
ICAgICAgICAgICBjYXNlIFBMVUdJTl9HRU5fQ0JfSU5MSU5FOg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgcGx1Z2luX2dlbl90Yl9pbmxpbmUocGx1Z2luX3RiLCBvcCk7DQo+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsNCj4gQEAgLTczNyw2ICs3NjksOSBAQCBzdGF0aWMg
dm9pZCBwbHVnaW5fZ2VuX2luamVjdChzdHJ1Y3QgcWVtdV9wbHVnaW5fdGIgKnBsdWdpbl90
YikNCj4gICAgICAgICAgICAgICAgICAgY2FzZSBQTFVHSU5fR0VOX0NCX1VEQVRBOg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgcGx1Z2luX2dlbl9pbnNuX3VkYXRhKHBsdWdpbl90Yiwg
b3AsIGluc25faWR4KTsNCj4gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArICAg
ICAgICAgICAgICAgIGNhc2UgUExVR0lOX0dFTl9DQl9VREFUQV9SOg0KPiArICAgICAgICAg
ICAgICAgICAgICBwbHVnaW5fZ2VuX2luc25fdWRhdGFfcihwbHVnaW5fdGIsIG9wLCBpbnNu
X2lkeCk7DQo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgICAgICAgICAgICAg
ICAgICBjYXNlIFBMVUdJTl9HRU5fQ0JfSU5MSU5FOg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgcGx1Z2luX2dlbl9pbnNuX2lubGluZShwbHVnaW5fdGIsIG9wLCBpbnNuX2lkeCk7DQo+
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gZGlmZiAtLWdpdCBhL3BsdWdpbnMv
YXBpLmMgYi9wbHVnaW5zL2FwaS5jDQo+IGluZGV4IDU1MjFiMGFkMzZjLi5hYzM5Y2RlYTBi
MyAxMDA2NDQNCj4gLS0tIGEvcGx1Z2lucy9hcGkuYw0KPiArKysgYi9wbHVnaW5zL2FwaS5j
DQo+IEBAIC04OSw3ICs4OSwxMSBAQCB2b2lkIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX3ZjcHVf
dGJfZXhlY19jYihzdHJ1Y3QgcWVtdV9wbHVnaW5fdGIgKnRiLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnVkYXRhKQ0KPiAgIHsNCj4g
ICAgICAgaWYgKCF0Yi0+bWVtX29ubHkpIHsNCj4gLSAgICAgICAgcGx1Z2luX3JlZ2lzdGVy
X2R5bl9jYl9fdWRhdGEoJnRiLT5jYnNbUExVR0lOX0NCX1JFR1VMQVJdLA0KPiArICAgICAg
ICBpbnQgaW5kZXggPSBmbGFncyA9PSBRRU1VX1BMVUdJTl9DQl9SX1JFR1MgfHwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgZmxhZ3MgPT0gUUVNVV9QTFVHSU5fQ0JfUldfUkVHUyA/DQo+
ICsgICAgICAgICAgICAgICAgICAgIFBMVUdJTl9DQl9SRUdVTEFSX1IgOiBQTFVHSU5fQ0Jf
UkVHVUxBUjsNCj4gKw0KPiArICAgICAgICBwbHVnaW5fcmVnaXN0ZXJfZHluX2NiX191ZGF0
YSgmdGItPmNic1tpbmRleF0sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjYiwgZmxhZ3MsIHVkYXRhKTsNCj4gICAgICAgfQ0KPiAgIH0NCj4gQEAgLTEw
OSw3ICsxMTMsMTEgQEAgdm9pZCBxZW11X3BsdWdpbl9yZWdpc3Rlcl92Y3B1X2luc25fZXhl
Y19jYihzdHJ1Y3QgcWVtdV9wbHVnaW5faW5zbiAqaW5zbiwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnVkYXRhKQ0KPiAgIHsNCj4g
ICAgICAgaWYgKCFpbnNuLT5tZW1fb25seSkgew0KPiAtICAgICAgICBwbHVnaW5fcmVnaXN0
ZXJfZHluX2NiX191ZGF0YSgmaW5zbi0+Y2JzW1BMVUdJTl9DQl9JTlNOXVtQTFVHSU5fQ0Jf
UkVHVUxBUl0sDQo+ICsgICAgICAgIGludCBpbmRleCA9IGZsYWdzID09IFFFTVVfUExVR0lO
X0NCX1JfUkVHUyB8fA0KPiArICAgICAgICAgICAgICAgICAgICBmbGFncyA9PSBRRU1VX1BM
VUdJTl9DQl9SV19SRUdTID8NCj4gKyAgICAgICAgICAgICAgICAgICAgUExVR0lOX0NCX1JF
R1VMQVJfUiA6IFBMVUdJTl9DQl9SRUdVTEFSOw0KPiArDQo+ICsgICAgICAgIHBsdWdpbl9y
ZWdpc3Rlcl9keW5fY2JfX3VkYXRhKCZpbnNuLT5jYnNbUExVR0lOX0NCX0lOU05dW2luZGV4
XSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNiLCBmbGFn
cywgdWRhdGEpOw0KPiAgICAgICB9DQo+ICAgfQ0K
