Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp88266njb;
        Tue, 22 Oct 2024 17:33:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpu3mFaNw4No/h/4VWKHN3VrCmI3Q4XuBzZADGzv6GlskG1lIBM5f0vdepHjd6FxeCw/bowmpJT+yguw==@linaro.org
X-Received: by 2002:a17:903:2452:b0:20c:f648:e39b with SMTP id d9443c01a7336-20fa9de9099mr11526615ad.11.1729643603939;
        Tue, 22 Oct 2024 17:33:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729643603; cv=none;
        d=google.com; s=arc-20240605;
        b=iTjY3IhdyIks1fp56O7/SMTMGjDJIvmgo9Mlzm951TPqZfVExVMS1SlbhZOcrG/it1
         rvBAXlmx2FDOJyx82AW076mN76oCfmIJUdLEEjTR1Z1ZsdbkHe32JJLRQIugFOrJvxwu
         ionNcJbKUptIAIWvY2t2LLqo2ebBpHZECB1TdBQEeRe6Z8snQVCRN5ryK62YiIR5HO2b
         mnG+RWZlcNfsF4E1KIKYeOPk0US/KNwngj94+2YW06lICyybu3AgLwHkm9sn8gOI7ohq
         UL/zI8msc//nXmK2aw8nwqpc/GRQsFH1hCTHxYB7G9MutOvx18/sA0/pqrfFtuHTJAa8
         Lqow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=79ndCH4BWZEfycwpeQ4eGvQI1Eq+4kSlvhh1T8GdH5Q=;
        fh=qkXLXDTE3rwWByhuEiQazmM1UyHd2SSZas4NwcChtWo=;
        b=jOCLqfecAnMS2ZbsPAdMcnVytc4q1cUm2UogzXlHq/0Povdfehi8/eqofq+td2oLdY
         9H9WdMtK4zcSCLWwOFMwh8XhCN/JZ6HNQi6/UTaK3dG+NG4rrJxIqqlf7JQbp3yJm4OU
         O/EVhSzPra+aF3xxca+Pl1aDjDWk4TzHRlp21DLziZKXxfp2o1ApNfWR50L4F4rGgw01
         5X4PCwgln3JtBGLkWYc9DEgd6jypz4J69oJHap1O1HctHzVhjjJqFeixuqbpuq9Z4Fdz
         iyjK8kXXhWFhdfKM8aSz8zuFC7UYaX62pv4pFeWP7Z32hVMZ7Lumcbr644yXt6QJIKXD
         9uBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SGuKYtYX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e9952a3e8sor18341505ad.14.2024.10.22.17.33.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 17:33:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SGuKYtYX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729643603; x=1730248403; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79ndCH4BWZEfycwpeQ4eGvQI1Eq+4kSlvhh1T8GdH5Q=;
        b=SGuKYtYXW4LpkdWL7mDc8uJKW89AqRIBN1LW31uGhy4C0KcYtnoGZzewgV1LE5f50O
         6fUbrWci6GfgKzEv5DKji+Bn+E19lWznpo9tlGgpxHAzr2ZYCe7aNRgBo996zo0QZqcZ
         tSFMw1+nPV+YOQZVtCA7kkKL/NVf79DbBL3khuG/6H/t1GzQLXGxp6whsOq3UDA96dUF
         PnKykwGroX4cHodZ4pZ8LEnAXqYZ3aQfqD+DXo8jGwrylPcN2WUzTZrkXbj7OfjiOtjr
         QuIrWE/gaFiKrE60T2rNphKN0LPTC9669XGZWLqDlkiZqg2vgnIbPNtBmX9qJ6U6uhYz
         BgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729643603; x=1730248403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79ndCH4BWZEfycwpeQ4eGvQI1Eq+4kSlvhh1T8GdH5Q=;
        b=O8OmihoETOyydG8Sska/iJvURafrBTvGIItHSmnSpHdS+VzYu9UEfKzcoiv035rgs3
         T25Brni3mML+aRXWjD2JXp3OGWFbW7Z/PzNydpW+B0+Y3AqlCqhgckLSJVyYrZrdm+Gp
         wDHoQ3rmCMAgWq2g5peNGRaWsWLFGU8hXdHnLVwA3VKTuOOcyJS/L+32Sh5rPm8PnSSz
         7BmI2EniS+Fl0w7SuZpzKmj8owbLob+jsONvoRWJ6YS+arywKEatTaRiVb+iQ86QjN15
         496RMe6UR5x6Fnv+WuGo4VMdLA3W8ysJhDdnqbk4YjdJyXcuGC5nwwZPt7nlGk7NLMmc
         getg==
X-Forwarded-Encrypted: i=1; AJvYcCWxymanqVUWOx0VWvezJXTtXBu9Sh2zagKmlqVkkaVYyy33SgRui76cnvmNx85r9iBA2Nh8nv2wWjC6Ow==@linaro.org
X-Gm-Message-State: AOJu0Yxsn0nU9BjMUZbZvexEXp0s8dn0D7Yb5PrguJPnRk8LkVbwcbJe
	y1tpgRe0m6y9KaT9Qf/T137M5pBTMjViyyWbTURCEfVTUIk0B0Pi66+7xIVs+Yno6w==
X-Google-Smtp-Source: AGHT+IFhsM4ymH4z9iMfmjz8kHFWc3s1RItxg2i/WUFTPSle33GeerWDLNrU1JzWzNM+vUvkbjTJDw==
X-Received: by 2002:a17:902:e883:b0:20b:7ed8:3990 with SMTP id d9443c01a7336-20fa9de8bf5mr14329755ad.12.1729643603347;
        Tue, 22 Oct 2024 17:33:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0ebb5csm48187915ad.240.2024.10.22.17.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 17:33:22 -0700 (PDT)
Message-ID: <17ab6a26-bfd2-4ee6-8fc4-c371d266dcb1@linaro.org>
Date: Tue, 22 Oct 2024 17:33:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/20] tests/tcg/x86_64: Add cross-modifying code test
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-8-alex.bennee@linaro.org>
 <6b18238b-f9c3-4046-964f-de16dc30d26e@linaro.org>
 <4c383f09bd6bd9b488ad301e5f050b8c9971f3a2.camel@linux.ibm.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <4c383f09bd6bd9b488ad301e5f050b8c9971f3a2.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: lx9TTA+zDVJ3

T24gMTAvMjIvMjQgMTc6MTYsIElseWEgTGVvc2hrZXZpY2ggd3JvdGU6DQo+IE9uIFR1ZSwg
MjAyNC0xMC0yMiBhdCAxMzozNiAtMDcwMCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+
IE9uIDEwLzIyLzI0IDAzOjU2LCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4gRnJvbTogSWx5
YSBMZW9zaGtldmljaCA8aWlpQGxpbnV4LmlibS5jb20+DQo+Pj4NCj4+PiBjb21taXQgZjAy
NTY5MmM5OTJjICgiYWNjZWwvdGNnOiBDbGVhciBQQUdFX1dSSVRFIGJlZm9yZQ0KPj4+IHRy
YW5zbGF0aW9uIikNCj4+PiBmaXhlZCBjcm9zcy1tb2RpZnlpbmcgY29kZSBoYW5kbGluZywg
YnV0IGRpZCBub3QgYWRkIGEgdGVzdC4gVGhlDQo+Pj4gY2hhbmdlZCBjb2RlIHdhcyBmdXJ0
aGVyIGltcHJvdmVkIHJlY2VudGx5IFsxXSwgYW5kIEkgd2FzIG5vdCBzdXJlDQo+Pj4gd2hl
dGhlciB0aGVzZSBtb2RpZmljYXRpb25zIHdlcmUgc2FmZSAoc3BvaWxlcjogdGhleSB3ZXJl
IGZpbmUpLg0KPj4+DQo+Pj4gQWRkIGEgdGVzdCB0byBtYWtlIHN1cmUgdGhlcmUgYXJlIG5v
IHJlZ3Jlc3Npb25zLg0KPj4+DQo+Pj4gWzFdDQo+Pj4gaHR0cHM6Ly9saXN0cy5nbnUub3Jn
L2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMDkvbXNnMDAwMzQuaHRtbA0KPj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogSWx5YSBMZW9zaGtldmljaCA8aWlpQGxpbnV4LmlibS5jb20+
DQo+Pj4gTWVzc2FnZS1JZDogPDIwMjQxMDAxMTUwNjE3Ljk5NzctMS1paWlAbGludXguaWJt
LmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+DQo+Pj4gLS0tDQo+Pj4gIMKgIHRlc3RzL3RjZy94ODZfNjQvY3Jvc3MtbW9k
aWZ5aW5nLWNvZGUuYyB8IDgwDQo+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+
ICDCoCB0ZXN0cy90Y2cveDg2XzY0L01ha2VmaWxlLnRhcmdldMKgwqDCoMKgwqDCoMKgIHzC
oCA0ICsrDQo+Pj4gIMKgIDIgZmlsZXMgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKQ0KPj4+
ICDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvdGNnL3g4Nl82NC9jcm9zcy1tb2RpZnlp
bmctY29kZS5jDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL3g4Nl82NC9jcm9z
cy1tb2RpZnlpbmctY29kZS5jDQo+Pj4gYi90ZXN0cy90Y2cveDg2XzY0L2Nyb3NzLW1vZGlm
eWluZy1jb2RlLmMNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAw
MDAwMDAuLjI3MDRkZjYwNjENCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvdGVzdHMv
dGNnL3g4Nl82NC9jcm9zcy1tb2RpZnlpbmctY29kZS5jDQo+Pj4gQEAgLTAsMCArMSw4MCBA
QA0KPj4+ICsvKg0KPj4+ICsgKiBUZXN0IHBhdGNoaW5nIGNvZGUsIHJ1bm5pbmcgaW4gb25l
IHRocmVhZCwgZnJvbSBhbm90aGVyIHRocmVhZC4NCj4+PiArICoNCj4+PiArICogSW50ZWwg
U0RNIGNhbGxzIHRoaXMgImNyb3NzLW1vZGlmeWluZyBjb2RlIiBhbmQgcmVjb21tZW5kcyBh
DQo+Pj4gc3BlY2lhbA0KPj4+ICsgKiBzZXF1ZW5jZSwgd2hpY2ggcmVxdWlyZXMgYm90aCB0
aHJlYWRzIHRvIGNvb3BlcmF0ZS4NCj4+PiArICoNCj4+PiArICogTGludXgga2VybmVsIHVz
ZXMgYSBkaWZmZXJlbnQgc2VxdWVuY2UgdGhhdCBkb2VzIG5vdCByZXF1aXJlDQo+Pj4gY29v
cGVyYXRpb24gYW5kDQo+Pj4gKyAqIGludm9sdmVzIHBhdGNoaW5nIHRoZSBmaXJzdCBieXRl
IHdpdGggaW50My4NCj4+PiArICoNCj4+PiArICogRmluYWxseSwgdGhlcmUgaXMgdXNlci1t
b2RlIHNvZnR3YXJlIG91dCB0aGVyZSB0aGF0IHNpbXBseSB1c2VzDQo+Pj4gYXRvbWljcywg
YW5kDQo+Pj4gKyAqIHRoYXQgc2VlbXMgdG8gYmUgZ29vZCBlbm91Z2ggaW4gcHJhY3RpY2Uu
IFRlc3QgdGhhdCBRRU1VIGhhcyBubw0KPj4+IHByb2JsZW1zDQo+Pj4gKyAqIHdpdGggdGhp
cyBhcyB3ZWxsLg0KPj4+ICsgKi8NCj4+PiArDQo+Pj4gKyNpbmNsdWRlIDxhc3NlcnQuaD4N
Cj4+PiArI2luY2x1ZGUgPHB0aHJlYWQuaD4NCj4+PiArI2luY2x1ZGUgPHN0ZGJvb2wuaD4N
Cj4+PiArI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPj4+ICsNCj4+PiArdm9pZCBhZGQxX29yX25v
cChsb25nICp4KTsNCj4+PiArYXNtKCIucHVzaHNlY3Rpb24gLnJ3eCxcImF3eFwiLEBwcm9n
Yml0c1xuIg0KPj4+ICvCoMKgwqAgIi5nbG9ibCBhZGQxX29yX25vcFxuIg0KPj4+ICvCoMKg
wqAgLyogYWRkcSAkMHgxLCglcmRpKSAqLw0KPj4+ICvCoMKgwqAgImFkZDFfb3Jfbm9wOiAu
Ynl0ZSAweDQ4LCAweDgzLCAweDA3LCAweDAxXG4iDQo+Pj4gK8KgwqDCoCAicmV0XG4iDQo+
Pj4gK8KgwqDCoCAiLnBvcHNlY3Rpb25cbiIpOw0KPj4+ICsNCj4+PiArI2RlZmluZSBUSFJF
QURfV0FJVCAwDQo+Pj4gKyNkZWZpbmUgVEhSRUFEX1BBVENIIDENCj4+PiArI2RlZmluZSBU
SFJFQURfU1RPUCAyDQo+Pj4gKw0KPj4+ICtzdGF0aWMgdm9pZCAqdGhyZWFkX2Z1bmModm9p
ZCAqYXJnKQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBpbnQgdmFsID0gMHgwMDI2NzQ4ZDsgLyog
bm9wICovDQo+Pj4gKw0KPj4+ICvCoMKgwqAgd2hpbGUgKHRydWUpIHsNCj4+PiArwqDCoMKg
wqDCoMKgwqAgc3dpdGNoIChfX2F0b21pY19sb2FkX24oKGludCAqKWFyZywgX19BVE9NSUNf
U0VRX0NTVCkpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSBUSFJFQURfV0FJVDoNCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
Y2FzZSBUSFJFQURfUEFUQ0g6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsID0g
X19hdG9taWNfZXhjaGFuZ2VfbigoaW50ICopJmFkZDFfb3Jfbm9wLCB2YWwsDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF9fQVRPTUlDX1NFUV9DU1QpOw0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBjYXNlIFRIUkVBRF9T
VE9QOg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4+ICvC
oMKgwqDCoMKgwqDCoCBkZWZhdWx0Og0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFz
c2VydChmYWxzZSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19idWlsdGluX3Vu
cmVhY2hhYmxlKCk7DQo+Pg0KPj4gVXNlIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkgaW5zdGVh
ZC4NCj4+IGNoZWNrcGF0Y2ggZW1pdHMgYW4gZXJyb3IgZm9yIGl0IG5vdy4NCj4gDQo+IElz
IHRoZXJlIGFuIGVhc3kgd2F5IHRvIGluY2x1ZGUgZ2xpYiBmcm9tIHRlc3RjYXNlcz8NCj4g
SXQncyBsb2NhdGVkIHVzaW5nIG1lc29uLCBhbmQgSSBjYW4ndCBpbW1lZGlhdGVseSBzZWUg
aG93IHRvIHB1c2ggdGhlDQo+IHJlc3BlY3RpdmUgY29tcGlsZXIgZmxhZ3MgdG8gdGhlIHRl
c3QgTWFrZWZpbGVzIC0gdGhpcyBzZWVtcyB0byBiZQ0KPiBjdXJyZW50bHkgaGFuZGxlZCBi
eSBjb25maWd1cmUgd3JpdGluZyB0byAkY29uZmlnX3RhcmdldF9tYWsuDQo+IA0KPiBbLi4u
XQ0KPiANCg0KU29ycnkgeW91J3JlIHJpZ2h0LCBJIG1pc3NlZCB0aGUgZmFjdCB0ZXN0cyBk
b24ndCBoYXZlIHRoZSBkZXBzIHdlIGhhdmUgDQppbiBRRU1VIGl0c2VsZi4NCkkgZG9uJ3Qg
dGhpbmsgYW55IHRlc3QgY2FzZSBpbmNsdWRlIGFueSBleHRyYSBkZXBlbmRlbmN5IGZvciBu
b3cgKGFuZCANCndvdWxkIG1ha2UgaXQgaGFyZCB0byBjcm9zcyBjb21waWxlIHRoZW0gdG9v
KSwgc28gaXQncyBub3Qgd29ydGggdHJ5aW5nIA0KdG8gZ2V0IHRoZSByaWdodCBnbGliIGhl
YWRlciBmb3IgdGhpcy4NCg0KSSBkb24ndCBub3cgaWYgaXQgd2lsbCBiZSBhIHByb2JsZW0g
d2hlbiBtZXJnaW5nIHRoZSBzZXJpZXMgcmVnYXJkaW5nIA0KY2hlY2twYXRjaCwgYnV0IGlm
IGl0IGlzLCB3ZSBjYW4gYWx3YXlzIHJlcGxhY2UgdGhpcyBieSBhYm9ydCwgb3IgZXhpdC4N
Cg0KPiANCg0KQXMgaXQgaXMsDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGll
cnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K
