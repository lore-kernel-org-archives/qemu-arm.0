Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2124235ejs;
        Thu, 11 Jan 2024 19:49:22 -0800 (PST)
X-Received: by 2002:a5d:4b05:0:b0:336:6900:96e2 with SMTP id v5-20020a5d4b05000000b00336690096e2mr298667wrq.72.1705031362350;
        Thu, 11 Jan 2024 19:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705031362; cv=none;
        d=google.com; s=arc-20160816;
        b=svRwL8hgoM7RfUL5hFuBq/llCeZC+NI1bMxzrGMqs8KtIJJcqXeWEUd7zxQdYj5Z4g
         g/F4Mayjx22n4rqx7HtR21wdjPlRe4lsm8/Ev8pGfA2XY275cuOr+h/JbznxNthkiHGZ
         wgWrfg9PVUfVr6D1lZij1VPXFJVYj+DPMFb/16kI1IJxvTydBWZO/jTvIcwxtgKRLpvI
         UDfa4yC5reluwqWEVKZmyQ32l9kCc2JmayOveII4u1byb4iHpN27ZAiFsisAU2lOeHql
         5kR9lasC5GpMKJfVEGA38fOQh83oi/91oJl+mGYeOe+vSXrp1zoeGfZSEvoGJ5VWfPsA
         Qi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bnLMr6T9vQtB9zohSG+Ww3f+r9f9DHbIMkNIc6agMA4=;
        fh=Z3BjVOp8TwoOhw/cpMrzejnVHnZIQI0iAsu50Vs85Hw=;
        b=T7oKdp2N/UbafgEUYR3SHBBQ3mzYK5VY4qYgEPEbpLUHD60tIdk+Qr0WzgakB4A+9J
         S35zeV7e/l5QiierVsxH9DUWJSP/anZDnzS4OFjW06FSebT4FZKI3wiHJb4NZghRVZSi
         rOmu2/Q79EMrqzOp4HL2qYjPvWtFm2gkwz23ty6uapJ8hvSQFbGIbOvUh5HLVTWW2wnF
         OS6FLF3YtgoBeQwbDi4b6eRjaJEtALT3H4bZwJ8gwsgAtg6EJGx4rK76qy/y1De9UpTu
         NB0d2LGaGxIzSHy/aF+8KutPidJeU6BZaIA3c6hTP49BCDyYMrK36Ob7HmH/cunEmpuu
         fX9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajiBqmtd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x7-20020a5d6507000000b0033745bc0fb0sor653291wru.10.2024.01.11.19.49.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jan 2024 19:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajiBqmtd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705031361; x=1705636161; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnLMr6T9vQtB9zohSG+Ww3f+r9f9DHbIMkNIc6agMA4=;
        b=ajiBqmtdTkg+WUVnP+Oh/9x3NTRfVbRQ0wgS61sOAr7j1wiPhsmYnRg8Ow7IoW9sIz
         SkKstgulsNQiLxWqIkeB3DPQJ7LqKUod+BlcOH2f6leb42WktGWdH0b7X075pg5PQEwy
         cwReWxUnTXpxzcpxp24ECM5vL/O06ijQxXuvwBlfP3vbFOkJ7qg6c1+dcv1HW3BhKHM3
         fE5fVE6sowFCLqO1lMLm4j+Yx/3q4qjickQrGpaqN35dlPFp8sKGWwcgWLGi/kyPXiYT
         06pvEEM66ByH75C1XA0HMMg4yW3sOpnAvYBWprA+E3c8ZUQZbjfhBewXghTElFozFNi6
         vgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705031361; x=1705636161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnLMr6T9vQtB9zohSG+Ww3f+r9f9DHbIMkNIc6agMA4=;
        b=r9pqsAme6DdjMmPjtZP3/7LiURupAU39VmuXWWPL/MN2qDIEGKwTuufE2YE1D4PmTF
         sbELtyxqc9/8RKLgg1Nfc72P6o2FGlRW4UufGBY2V2B0GO9qPPRmoDvlC/nBgcEeY1Gk
         d2DiUTrjwfecDF0U9kyuaqZkDIKhYYRqS1eIfe7kRoi44241Md8VXben/fOLqYC7RFIu
         kJAZD4B2P5lTMFTl0Y8xXU/ZbICzjXoXtCO7Ny4YRRjbGR2o/d1wELZRFCFjPCdaZGny
         B4+ahc5e9yWu8lJKpHl/+d6+sTSpc8Eu/r+cTboih5+5Eg4S61+tGvBQcGgzhJnubMpc
         h0xw==
X-Gm-Message-State: AOJu0YwSVpEvHiEcJhJiCG60Kdv98ogr8vTPBo85T1fbepKNha+eQv6f
	weArN21rh72SzlgB1TrqHeOY5ADkozaGfJs4e0OQ1JGPrN1qEd1gYmg=
X-Google-Smtp-Source: AGHT+IG7fJ9mDTJtOI7JOT6xSEnpJbMoYs7biiehaATm8v2v0+sP2Y2WEfCENGSAUaHP/owM3Y/0rg==
X-Received: by 2002:a05:6000:1211:b0:337:4a09:b7df with SMTP id e17-20020a056000121100b003374a09b7dfmr342633wrx.35.1705031361001;
        Thu, 11 Jan 2024 19:49:21 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.24] ([102.35.208.160])
        by smtp.gmail.com with ESMTPSA id bk14-20020a0560001d8e00b003375c072fbcsm143193wrb.100.2024.01.11.19.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 19:49:20 -0800 (PST)
Message-ID: <1a8ddba6-cbe5-4db4-b1bc-71f96bd498e2@linaro.org>
Date: Fri, 12 Jan 2024 07:49:07 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/43] plugins: add an API to read registers
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
 <20240103173349.398526-39-alex.bennee@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240103173349.398526-39-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: E2zSiYt6bETa

T24gMS8zLzI0IDIxOjMzLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IFdlIGNhbiBvbmx5IHJl
cXVlc3QgYSBsaXN0IG9mIHJlZ2lzdGVycyBvbmNlIHRoZSB2Q1BVIGhhcyBiZWVuDQo+IGlu
aXRpYWxpc2VkIHNvIHRoZSB1c2VyIG5lZWRzIHRvIHVzZSBlaXRoZXIgY2FsbCB0aGUgZ2V0
IGZ1bmN0aW9uIG9uDQo+IHZDUFUgaW5pdGlhbGlzYXRpb24gb3IgZHVyaW5nIHRoZSB0cmFu
c2xhdGlvbiBwaGFzZS4NCj4gDQo+IFdlIGRvbid0IGV4cG9zZSB0aGUgcmVnIG51bWJlciB0
byB0aGUgcGx1Z2luIGluc3RlYWQgaGlkaW5nIGl0IGJlaGluZA0KPiBhbiBvcGFxdWUgaGFu
ZGxlLiBUaGlzIGFsbG93cyBmb3IgYSBiaXQgb2YgZnV0dXJlIHByb29maW5nIHNob3VsZCB0
aGUNCj4gaW50ZXJuYWxzIG5lZWQgdG8gYmUgY2hhbmdlZCB3aGlsZSBhbHNvIGJlaW5nIGhh
c2hlZCBhZ2FpbnN0IHRoZQ0KPiBDUFVDbGFzcyBzbyB3ZSBjYW4gaGFuZGxlIGRpZmZlcmVu
dCByZWdpc3RlciBzZXRzIHBlci12Q1BVIGluDQo+IGhldHJvZ2Vub3VzIHNpdHVhdGlvbnMu
DQo+IA0KPiBIYXZpbmcgYW4gaW50ZXJuYWwgc3RhdGUgd2l0aGluIHRoZSBwbHVnaW5zIGFs
c28gYWxsb3dzIHVzIHRvIGV4cGFuZA0KPiB0aGUgaW50ZXJmYWNlIGluIGZ1dHVyZSAoZm9y
IGV4YW1wbGUgcHJvdmlkaW5nIGNhbGxiYWNrcyBvbiByZWdpc3Rlcg0KPiBjaGFuZ2UgaWYg
dGhlIHRyYW5zbGF0b3IgY2FuIHRyYWNrIGNoYW5nZXMpLg0KPiANCj4gUmVzb2x2ZXM6IGh0
dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy8xNzA2DQo+IENj
OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+IEJhc2VkLW9u
OiA8MjAyMzEwMjUwOTMxMjguMzMxMTYtMTgtYWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
DQo+IA0KPiAtLS0NCj4gdjMNCj4gICAgLSBhbHNvIGdfaW50ZXJuX3N0cmluZyB0aGUgcmVn
aXN0ZXIgbmFtZQ0KPiAgICAtIG1ha2UgZ2V0X3JlZ2lzdGVycyBkb2N1bWVudGF0aW9uIGEg
Yml0IGxlc3MgdmVyYm9zZQ0KPiB2Mg0KPiAgICAtIHVzZSBuZXcgZ2V0IHdob2xlIGxpc3Qg
YXBpLCBhbmQgZXhwb3NlIHVwd2FyZHMNCj4gDQo+IHZBSkI6DQo+IA0KPiBUaGUgbWFpbiBk
aWZmZXJlbmNlIHRvIEFraWtpbydzIHZlcnNpb24gaXMgaGlkaW5nIHRoZSBnZGIgcmVnaXN0
ZXINCj4gZGV0YWlsIGZyb20gdGhlIHBsdWdpbiBmb3IgdGhlIHJlYXNvbnMgZGVzY3JpYmVk
IGFib3ZlLg0KPiAtLS0NCj4gICBpbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaCAgIHwgIDUx
ICsrKysrKysrKysrKysrKysrLQ0KPiAgIHBsdWdpbnMvYXBpLmMgICAgICAgICAgICAgICAg
fCAxMDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBwbHVnaW5z
L3FlbXUtcGx1Z2lucy5zeW1ib2xzIHwgICAyICsNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvcWVtdS9xZW11LXBsdWdpbi5oIGIvaW5jbHVkZS9xZW11L3FlbXUtcGx1Z2luLmgN
Cj4gaW5kZXggNGRhYWI2ZWZkMjkuLjk1MzgwODk1ZjgxIDEwMDY0NA0KPiAtLS0gYS9pbmNs
dWRlL3FlbXUvcWVtdS1wbHVnaW4uaA0KPiArKysgYi9pbmNsdWRlL3FlbXUvcWVtdS1wbHVn
aW4uaA0KPiBAQCAtMTEsNiArMTEsNyBAQA0KPiAgICNpZm5kZWYgUUVNVV9RRU1VX1BMVUdJ
Tl9IDQo+ICAgI2RlZmluZSBRRU1VX1FFTVVfUExVR0lOX0gNCj4gICANCj4gKyNpbmNsdWRl
IDxnbGliLmg+DQo+ICAgI2luY2x1ZGUgPGludHR5cGVzLmg+DQo+ICAgI2luY2x1ZGUgPHN0
ZGJvb2wuaD4NCj4gICAjaW5jbHVkZSA8c3RkZGVmLmg+DQo+IEBAIC0yMjcsOCArMjI4LDgg
QEAgc3RydWN0IHFlbXVfcGx1Z2luX2luc247DQo+ICAgICogQFFFTVVfUExVR0lOX0NCX1Jf
UkVHUzogY2FsbGJhY2sgcmVhZHMgdGhlIENQVSdzIHJlZ3MNCj4gICAgKiBAUUVNVV9QTFVH
SU5fQ0JfUldfUkVHUzogY2FsbGJhY2sgcmVhZHMgYW5kIHdyaXRlcyB0aGUgQ1BVJ3MgcmVn
cw0KPiAgICAqDQo+IC0gKiBOb3RlOiBjdXJyZW50bHkgdW51c2VkLCBwbHVnaW5zIGNhbm5v
dCByZWFkIG9yIGNoYW5nZSBzeXN0ZW0NCj4gLSAqIHJlZ2lzdGVyIHN0YXRlLg0KPiArICog
Tm90ZTogY3VycmVudGx5IFFFTVVfUExVR0lOX0NCX1JXX1JFR1MgaXMgdW51c2VkLCBwbHVn
aW5zIGNhbm5vdCBjaGFuZ2UNCj4gKyAqIHN5c3RlbSByZWdpc3RlciBzdGF0ZS4NCj4gICAg
Ki8NCj4gICBlbnVtIHFlbXVfcGx1Z2luX2NiX2ZsYWdzIHsNCj4gICAgICAgUUVNVV9QTFVH
SU5fQ0JfTk9fUkVHUywNCj4gQEAgLTcwOCw0ICs3MDksNTAgQEAgdWludDY0X3QgcWVtdV9w
bHVnaW5fZW5kX2NvZGUodm9pZCk7DQo+ICAgUUVNVV9QTFVHSU5fQVBJDQo+ICAgdWludDY0
X3QgcWVtdV9wbHVnaW5fZW50cnlfY29kZSh2b2lkKTsNCj4gICANCj4gKy8qKiBzdHJ1Y3Qg
cWVtdV9wbHVnaW5fcmVnaXN0ZXIgLSBPcGFxdWUgaGFuZGxlIGZvciByZWdpc3RlciBhY2Nl
c3MgKi8NCj4gK3N0cnVjdCBxZW11X3BsdWdpbl9yZWdpc3RlcjsNCj4gKw0KPiArLyoqDQo+
ICsgKiB0eXBlZGVmIHFlbXVfcGx1Z2luX3JlZ19kZXNjcmlwdG9yIC0gcmVnaXN0ZXIgZGVz
Y3JpcHRpb25zDQo+ICsgKg0KPiArICogQGhhbmRsZTogb3BhcXVlIGhhbmRsZSBmb3IgcmV0
cmlldmluZyB2YWx1ZSB3aXRoIHFlbXVfcGx1Z2luX3JlYWRfcmVnaXN0ZXINCj4gKyAqIEBu
YW1lOiByZWdpc3RlciBuYW1lDQo+ICsgKiBAZmVhdHVyZTogb3B0aW9uYWwgZmVhdHVyZSBk
ZXNjcmlwdG9yLCBjYW4gYmUgTlVMTA0KPiArICovDQo+ICt0eXBlZGVmIHN0cnVjdCB7DQo+
ICsgICAgc3RydWN0IHFlbXVfcGx1Z2luX3JlZ2lzdGVyICpoYW5kbGU7DQo+ICsgICAgY29u
c3QgY2hhciAqbmFtZTsNCj4gKyAgICBjb25zdCBjaGFyICpmZWF0dXJlOw0KPiArfSBxZW11
X3BsdWdpbl9yZWdfZGVzY3JpcHRvcjsNCj4gKw0KPiArLyoqDQo+ICsgKiBxZW11X3BsdWdp
bl9nZXRfcmVnaXN0ZXJzKCkgLSByZXR1cm4gcmVnaXN0ZXIgbGlzdCBmb3IgdkNQVQ0KPiAr
ICogQHZjcHVfaW5kZXg6IHZjcHUgdG8gcXVlcnkNCj4gKyAqDQo+ICsgKiBSZXR1cm5zIGEg
R0FycmF5IG9mIHFlbXVfcGx1Z2luX3JlZ19kZXNjcmlwdG9yIG9yIE5VTEwuIENhbGxlcg0K
PiArICogZnJlZXMgdGhlIGFycmF5IChidXQgbm90IHRoZSBjb25zdCBzdHJpbmdzKS4NCj4g
KyAqDQo+ICsgKiBTaG91bGQgYmUgdXNlZCBmcm9tIGEgcWVtdV9wbHVnaW5fcmVnaXN0ZXJf
dmNwdV9pbml0X2NiKCkgY2FsbGJhY2sNCj4gKyAqIGFmdGVyIHRoZSB2Q1BVIGlzIGluaXRp
YWxpc2VkLg0KPiArICovDQo+ICtHQXJyYXkgKiBxZW11X3BsdWdpbl9nZXRfcmVnaXN0ZXJz
KHVuc2lnbmVkIGludCB2Y3B1X2luZGV4KTsNCj4gKw0KPiArLyoqDQo+ICsgKiBxZW11X3Bs
dWdpbl9yZWFkX3JlZ2lzdGVyKCkgLSByZWFkIHJlZ2lzdGVyDQo+ICsgKg0KPiArICogQHZj
cHU6IHZjcHUgaW5kZXgNCj4gKyAqIEBoYW5kbGU6IGEgQHFlbXVfcGx1Z2luX3JlZ19oYW5k
bGUgaGFuZGxlDQo+ICsgKiBAYnVmOiBBIEdCeXRlQXJyYXkgZm9yIHRoZSBkYXRhIG93bmVk
IGJ5IHRoZSBwbHVnaW4NCj4gKyAqDQo+ICsgKiBUaGlzIGZ1bmN0aW9uIGlzIG9ubHkgYXZh
aWxhYmxlIGluIGEgY29udGV4dCB0aGF0IHJlZ2lzdGVyIHJlYWQgYWNjZXNzIGlzDQo+ICsg
KiBleHBsaWNpdGx5IHJlcXVlc3RlZC4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zIHRoZSBzaXpl
IG9mIHRoZSByZWFkIHJlZ2lzdGVyLiBUaGUgY29udGVudCBvZiBAYnVmIGlzIGluIHRhcmdl
dCBieXRlDQo+ICsgKiBvcmRlci4gT24gZmFpbHVyZSByZXR1cm5zIC0xDQo+ICsgKi8NCj4g
K2ludCBxZW11X3BsdWdpbl9yZWFkX3JlZ2lzdGVyKHVuc2lnbmVkIGludCB2Y3B1LA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHFlbXVfcGx1Z2luX3JlZ2lz
dGVyICpoYW5kbGUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHQnl0ZUFy
cmF5ICpidWYpOw0KPiArDQo+ICsNCj4gICAjZW5kaWYgLyogUUVNVV9RRU1VX1BMVUdJTl9I
ICovDQo+IGRpZmYgLS1naXQgYS9wbHVnaW5zL2FwaS5jIGIvcGx1Z2lucy9hcGkuYw0KPiBp
bmRleCBhYzM5Y2RlYTBiMy4uZjg5MDUzMjVjNDMgMTAwNjQ0DQo+IC0tLSBhL3BsdWdpbnMv
YXBpLmMNCj4gKysrIGIvcGx1Z2lucy9hcGkuYw0KPiBAQCAtOCw2ICs4LDcgQEANCj4gICAg
Kg0KPiAgICAqICBxZW11X3BsdWdpbl90Yg0KPiAgICAqICBxZW11X3BsdWdpbl9pbnNuDQo+
ICsgKiAgcWVtdV9wbHVnaW5fcmVnaXN0ZXINCj4gICAgKg0KPiAgICAqIFdoaWNoIGNhbiB0
aGVuIGJlIHBhc3NlZCBiYWNrIGludG8gdGhlIEFQSSB0byBkbyBhZGRpdGlvbmFsIHRoaW5n
cy4NCj4gICAgKiBBcyBzdWNoIGFsbCB0aGUgcHVibGljIGZ1bmN0aW9ucyBpbiBoZXJlIGFy
ZSBleHBvcnRlZCBpbg0KPiBAQCAtMzUsMTAgKzM2LDEyIEBADQo+ICAgICovDQo+ICAgDQo+
ICAgI2luY2x1ZGUgInFlbXUvb3NkZXAuaCINCj4gKyNpbmNsdWRlICJxZW11L21haW4tbG9v
cC5oIg0KPiAgICNpbmNsdWRlICJxZW11L3BsdWdpbi5oIg0KPiAgICNpbmNsdWRlICJxZW11
L2xvZy5oIg0KPiAgICNpbmNsdWRlICJ0Y2cvdGNnLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMv
ZXhlYy1hbGwuaCINCj4gKyNpbmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4gICAjaW5jbHVk
ZSAiZXhlYy9yYW1fYWRkci5oIg0KPiAgICNpbmNsdWRlICJkaXNhcy9kaXNhcy5oIg0KPiAg
ICNpbmNsdWRlICJwbHVnaW4uaCINCj4gQEAgLTQzNSwzICs0MzgsMTAyIEBAIHVpbnQ2NF90
IHFlbXVfcGx1Z2luX2VudHJ5X2NvZGUodm9pZCkNCj4gICAjZW5kaWYNCj4gICAgICAgcmV0
dXJuIGVudHJ5Ow0KPiAgIH0NCj4gKw0KPiArLyoNCj4gKyAqIFJlZ2lzdGVyIGhhbmRsZXMN
Cj4gKyAqDQo+ICsgKiBUaGUgcGx1Z2luIGluZnJhc3RydWN0dXJlIGtlZXBzIGhvbGQgb2Yg
dGhlc2UgaW50ZXJuYWwgZGF0YQ0KPiArICogc3RydWN0dXJlcyB3aGljaCBhcmUgcHJlc2Vu
dGVkIHRvIHBsdWdpbnMgYXMgb3BhcXVlIGhhbmRsZXMuIFRoZXkNCj4gKyAqIGFyZSBnbG9i
YWwgdG8gdGhlIHN5c3RlbSBhbmQgdGhlcmVmb3IgYWRkaXRpb25zIHRvIHRoZSBoYXNoIHRh
YmxlDQo+ICsgKiBtdXN0IGJlIHByb3RlY3RlZCBieSB0aGUgQHJlZ19oYW5kbGVfbG9jay4N
Cj4gKyAqDQo+ICsgKiBJbiBvcmRlciB0byBmdXR1cmUgcHJvb2YgZm9yIHVwLWNvbWluZyBo
ZXRlcm9nZW5lb3VzIHdvcmsgd2Ugd2FudA0KPiArICogZGlmZmVyZW50IGVudHJpZXMgZm9y
IGVhY2ggQ1BVIHR5cGUgd2hpbGUgc2hhcmluZyB0aGVtIGluIHRoZQ0KPiArICogY29tbW9u
IGNhc2Ugb2YgbXVsdGlwbGUgY29yZXMgb2YgdGhlIHNhbWUgdHlwZS4NCj4gKyAqLw0KPiAr
DQo+ICtzdGF0aWMgUWVtdU11dGV4IHJlZ19oYW5kbGVfbG9jazsNCj4gKw0KPiArc3RydWN0
IHFlbXVfcGx1Z2luX3JlZ2lzdGVyIHsNCj4gKyAgICBjb25zdCBjaGFyICpuYW1lOw0KPiAr
ICAgIGludCBnZGJfcmVnX251bTsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBHSGFzaFRhYmxl
ICpyZWdfaGFuZGxlczsgLyogaGFzaCB0YWJsZSBvZiBQbHVnaW5SZWcgKi8NCj4gKw0KPiAr
LyogR2VuZXJhdGUgYSBzdGFibGUga2V5IC0gd291bGQgeHhoYXNoIGJlIG92ZXJraWxsPyAq
Lw0KPiArc3RhdGljIGdwb2ludGVyIGNwdV9wbHVzX3JlZ190b19rZXkoQ1BVU3RhdGUgKmNz
LCBpbnQgZ2RiX3JlZ251bSkNCj4gK3sNCj4gKyAgICB1aW50cHRyX3Qga2V5ID0gKHVpbnRw
dHJfdCkgY3MtPmNjOw0KPiArICAgIGtleSBePSBnZGJfcmVnbnVtOw0KPiArICAgIHJldHVy
biBHVUlOVF9UT19QT0lOVEVSKGtleSk7DQo+ICt9DQo+ICsNCj4gKy8qDQo+ICsgKiBDcmVh
dGUgcmVnaXN0ZXIgaGFuZGxlcy4NCj4gKyAqDQo+ICsgKiBXZSBuZWVkIHRvIGNyZWF0ZSBh
IGhhbmRsZSBmb3IgZWFjaCByZWdpc3RlciBzbyB0aGUgcGx1Z2luDQo+ICsgKiBpbmZyYXN0
cnVjdHVyZSBjYW4gY2FsbCBnZGJzdHViIHRvIHJlYWQgYSByZWdpc3Rlci4gV2UgYWxzbw0K
PiArICogY29uc3RydWN0IGEgcmVzdWx0IGFycmF5IHdpdGggdGhvc2UgaGFuZGxlcyBhbmQg
c29tZSBhbmNpbGxhcnkgZGF0YQ0KPiArICogdGhlIHBsdWdpbiBtaWdodCBmaW5kIHVzZWZ1
bC4NCj4gKyAqLw0KPiArDQo+ICtzdGF0aWMgR0FycmF5ICogY3JlYXRlX3JlZ2lzdGVyX2hh
bmRsZXMoQ1BVU3RhdGUgKmNzLCBHQXJyYXkgKmdkYnN0dWJfcmVncykgew0KPiArICAgIEdB
cnJheSAqZmluZF9kYXRhID0gZ19hcnJheV9uZXcodHJ1ZSwgdHJ1ZSwgc2l6ZW9mKHFlbXVf
cGx1Z2luX3JlZ19kZXNjcmlwdG9yKSk7DQo+ICsNCj4gKyAgICBXSVRIX1FFTVVfTE9DS19H
VUFSRCgmcmVnX2hhbmRsZV9sb2NrKSB7DQo+ICsNCj4gKyAgICAgICAgaWYgKCFyZWdfaGFu
ZGxlcykgew0KPiArICAgICAgICAgICAgcmVnX2hhbmRsZXMgPSBnX2hhc2hfdGFibGVfbmV3
KGdfZGlyZWN0X2hhc2gsIGdfZGlyZWN0X2VxdWFsKTsNCj4gKyAgICAgICAgfQ0KPiArDQo+
ICsgICAgICAgIGZvciAoaW50IGk9MDsgaSA8IGdkYnN0dWJfcmVncy0+bGVuOyBpKyspIHsN
Cj4gKyAgICAgICAgICAgIEdEQlJlZ0Rlc2MgKmdyZCA9ICZnX2FycmF5X2luZGV4KGdkYnN0
dWJfcmVncywgR0RCUmVnRGVzYywgaSk7DQo+ICsgICAgICAgICAgICBncG9pbnRlciBrZXkg
PSBjcHVfcGx1c19yZWdfdG9fa2V5KGNzLCBncmQtPmdkYl9yZWcpOw0KPiArICAgICAgICAg
ICAgc3RydWN0IHFlbXVfcGx1Z2luX3JlZ2lzdGVyICp2YWwgPSBnX2hhc2hfdGFibGVfbG9v
a3VwKHJlZ19oYW5kbGVzLCBrZXkpOw0KPiArDQo+ICsgICAgICAgICAgICAvKiBEb2Vzbid0
IGV4aXN0LCBjcmVhdGUgb25lICovDQo+ICsgICAgICAgICAgICBpZiAoIXZhbCkgew0KPiAr
ICAgICAgICAgICAgICAgIHZhbCA9IGdfbmV3MChzdHJ1Y3QgcWVtdV9wbHVnaW5fcmVnaXN0
ZXIsIDEpOw0KPiArICAgICAgICAgICAgICAgIHZhbC0+Z2RiX3JlZ19udW0gPSBncmQtPmdk
Yl9yZWc7DQo+ICsgICAgICAgICAgICAgICAgdmFsLT5uYW1lID0gZ19pbnRlcm5fc3RyaW5n
KGdyZC0+bmFtZSk7DQo+ICsNCj4gKyAgICAgICAgICAgICAgICBnX2hhc2hfdGFibGVfaW5z
ZXJ0KHJlZ19oYW5kbGVzLCBrZXksIHZhbCk7DQo+ICsgICAgICAgICAgICB9DQo+ICsNCj4g
KyAgICAgICAgICAgIC8qIENyZWF0ZSBhIHJlY29yZCBmb3IgdGhlIHBsdWdpbiAqLw0KPiAr
ICAgICAgICAgICAgcWVtdV9wbHVnaW5fcmVnX2Rlc2NyaXB0b3IgZGVzYyA9IHsNCj4gKyAg
ICAgICAgICAgICAgICAuaGFuZGxlID0gdmFsLA0KPiArICAgICAgICAgICAgICAgIC5uYW1l
ID0gdmFsLT5uYW1lLA0KPiArICAgICAgICAgICAgICAgIC5mZWF0dXJlID0gZ19pbnRlcm5f
c3RyaW5nKGdyZC0+ZmVhdHVyZV9uYW1lKQ0KPiArICAgICAgICAgICAgfTsNCj4gKyAgICAg
ICAgICAgIGdfYXJyYXlfYXBwZW5kX3ZhbChmaW5kX2RhdGEsIGRlc2MpOw0KPiArICAgICAg
ICB9DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0dXJuIGZpbmRfZGF0YTsNCj4gK30NCj4g
Kw0KPiArR0FycmF5ICogcWVtdV9wbHVnaW5fZ2V0X3JlZ2lzdGVycyh1bnNpZ25lZCBpbnQg
dmNwdSkNCj4gK3sNCj4gKyAgICBDUFVTdGF0ZSAqY3MgPSBxZW11X2dldF9jcHUodmNwdSk7
DQo+ICsgICAgaWYgKGNzKSB7DQo+ICsgICAgICAgIGdfYXV0b3B0cihHQXJyYXkpIHJlZ3Mg
PSBnZGJfZ2V0X3JlZ2lzdGVyX2xpc3QoY3MpOw0KPiArICAgICAgICByZXR1cm4gcmVncy0+
bGVuID8gY3JlYXRlX3JlZ2lzdGVyX2hhbmRsZXMoY3MsIHJlZ3MpIDogTlVMTDsNCj4gKyAg
ICB9IGVsc2Ugew0KPiArICAgICAgICByZXR1cm4gTlVMTDsNCj4gKyAgICB9DQo+ICt9DQo+
ICsNCj4gK2ludCBxZW11X3BsdWdpbl9yZWFkX3JlZ2lzdGVyKHVuc2lnbmVkIGludCB2Y3B1
LCBzdHJ1Y3QgcWVtdV9wbHVnaW5fcmVnaXN0ZXIgKnJlZywgR0J5dGVBcnJheSAqYnVmKQ0K
PiArew0KPiArICAgIENQVVN0YXRlICpjcyA9IHFlbXVfZ2V0X2NwdSh2Y3B1KTsNCj4gKyAg
ICAvKiBhc3NlcnQgd2l0aCBkZWJ1Z2dpbmcgb24/ICovDQo+ICsgICAgcmV0dXJuIGdkYl9y
ZWFkX3JlZ2lzdGVyKGNzLCBidWYsIHJlZy0+Z2RiX3JlZ19udW0pOw0KPiArfQ0KPiArDQo+
ICtzdGF0aWMgdm9pZCBfX2F0dHJpYnV0ZV9fKChfX2NvbnN0cnVjdG9yX18pKSBxZW11X2Fw
aV9pbml0KHZvaWQpDQo+ICt7DQo+ICsgICAgcWVtdV9tdXRleF9pbml0KCZyZWdfaGFuZGxl
X2xvY2spOw0KPiArDQo+ICt9DQo+IGRpZmYgLS1naXQgYS9wbHVnaW5zL3FlbXUtcGx1Z2lu
cy5zeW1ib2xzIGIvcGx1Z2lucy9xZW11LXBsdWdpbnMuc3ltYm9scw0KPiBpbmRleCA3MWY2
YzkwNTQ5ZC4uNjk2MzU4NWMxZWEgMTAwNjQ0DQo+IC0tLSBhL3BsdWdpbnMvcWVtdS1wbHVn
aW5zLnN5bWJvbHMNCj4gKysrIGIvcGx1Z2lucy9xZW11LXBsdWdpbnMuc3ltYm9scw0KPiBA
QCAtMyw2ICszLDcgQEANCj4gICAgIHFlbXVfcGx1Z2luX2VuZF9jb2RlOw0KPiAgICAgcWVt
dV9wbHVnaW5fZW50cnlfY29kZTsNCj4gICAgIHFlbXVfcGx1Z2luX2dldF9od2FkZHI7DQo+
ICsgIHFlbXVfcGx1Z2luX2dldF9yZWdpc3RlcnM7DQo+ICAgICBxZW11X3BsdWdpbl9od2Fk
ZHJfZGV2aWNlX25hbWU7DQo+ICAgICBxZW11X3BsdWdpbl9od2FkZHJfaXNfaW87DQo+ICAg
ICBxZW11X3BsdWdpbl9od2FkZHJfcGh5c19hZGRyOw0KPiBAQCAtMjAsNiArMjEsNyBAQA0K
PiAgICAgcWVtdV9wbHVnaW5fbl92Y3B1czsNCj4gICAgIHFlbXVfcGx1Z2luX291dHM7DQo+
ICAgICBxZW11X3BsdWdpbl9wYXRoX3RvX2JpbmFyeTsNCj4gKyAgcWVtdV9wbHVnaW5fcmVh
ZF9yZWdpc3RlcjsNCj4gICAgIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX2F0ZXhpdF9jYjsNCj4g
ICAgIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX2ZsdXNoX2NiOw0KPiAgICAgcWVtdV9wbHVnaW5f
cmVnaXN0ZXJfdmNwdV9leGl0X2NiOw0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmll
ciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K
