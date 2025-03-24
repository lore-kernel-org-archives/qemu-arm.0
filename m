Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2173455njc;
        Mon, 24 Mar 2025 12:16:54 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22780c5267amr187771315ad.2.1742843814015;
        Mon, 24 Mar 2025 12:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843814; cv=none;
        d=google.com; s=arc-20240605;
        b=HIguu5J5TRvZELPLTkz9w3J4b5votrn9TvOirk1IMbI/P8VCu6RsLwSsGNI/NAdocV
         SG6J7BGwS4136PTAT+/mCcJRCikJtGZWlsz6nH3LpzhYoFmw8OxWklfzk9AKIrkS9JbD
         jd/F3h1CBgcwjp02Vbkdmn5nxEWrUqyue5wnuMLrRJCt2tCgp7mRUDd9oH72CgHKIw6A
         1wuqtLYUMGKlIGfVD6MEjYiUMTAfViLnPaUY/ryLP7V5yIQkx6tikB5UYs0MdUDe5hGW
         h9Mpe6i0EgLx7kVfsLAZkluiwt29earwo7aB01d/FdR7iwp7+c/i0liLTnAfhnUvu36J
         klfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JvHun5acYrp4/lxhQv6uBLYO/T7MGPnZKI6A1yZ54NA=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=Lo5k2+PcWjPb+c/JRNATQFo2i9uCjFnLkvvn+hnCnEKI4F+3xTkjjtAx7q6IFbbDFf
         TK8qCcuAhCSjPRAO0ZoCf1Eynnmte3jj4f1MVrZfxQ27Sfc7PdDTsWi2+rJGBqL+fSwq
         4RoCeAR+oJymX8WDKSJzCh8UBsESTcAM/iNOJVhke6kc64xgShRYVXCM2d/GEY9M3Ch0
         reGjKZceHXe2wfeyTS3xadcSxM9jme7ekzkPRf73kmoR/i3hukOnvtmjU8Q493/KJagX
         Kby5QGixxoFvMIlcxXm+cFPmGQeuqf/R1r8Ano8S73+2MknwtaT4HPV2N2QmI3KB4Lrp
         w9fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyc6VcgC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811a2d5csor73194375ad.11.2025.03.24.12.16.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyc6VcgC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742843813; x=1743448613; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvHun5acYrp4/lxhQv6uBLYO/T7MGPnZKI6A1yZ54NA=;
        b=jyc6VcgCCEpjtrxKUE9mqC2pMv0WQ4H5Fts4ZLWcbPU0hc8In2Xn9UWqxHrarpzfrv
         vRJuU0V9kHc/Yg8eZV1gzxiT6t2rK7Uw+JTvde0SmKgsgLSsZKUQk7nSoERvVdoZH6dk
         3bmhr3iQQmkZrjt8q4UNyyKOAe3sWHIH5MG+7OipNXU1IwHnHzHP8jHu6TbdxYpEuuGp
         uyw8cHgOj5CssOlT+2BWYnEb4S5ISblrfUHM3GAtf17Fpfl4T4pfYxT+Ic/j4CR+JgoR
         IG8h2K1WVcw7AD9CgmALxp4mR7DUYkpouQJ5jUBZIGMroBCYg1wmx7XcORCXc2jPJtsM
         Dkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843813; x=1743448613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvHun5acYrp4/lxhQv6uBLYO/T7MGPnZKI6A1yZ54NA=;
        b=ImjBgbi8uIQoBqDT5cFMlST2eyFCU1/U/7NFAevxD2ZASJ25Lr+6X++KHWDDIVfLs5
         St9wfIBR0pN5vMNnQuGdQ+rRpGKcWBYhzx0gaS25A1EvD1MKN55isqUFgqP4CKnBPEC7
         U7ZB8ANO6RyItgABckYLU0LQ+krIm4vkFHrKTvXxcFArW2CygJKBE7CxyVc7DOhW08X7
         BvfZGds6zgp05VgVVDFcvSCBBQzrHwrjk3TRxHv12EeTzlbNzMRMHRbc070kmAFpKFzv
         Tcb2dWtlkiku2JKYWX9A+yRbFJrTWh8LnRfvUIX2bz64tUuhcUR5i+5VqaRfkdQHIT4G
         7gEg==
X-Gm-Message-State: AOJu0Ywg967oPzpjMbr2//JCW588d5MUavt+i2HW1EPm8js8b1EWDLLO
	8GZU94PP2NWS2R3fxlOrax4a3Bojnm+hcJvQuERVDwVBU6p8pyKw7JrDRKJUj7Hk/FycRGxlalg
	eUa6ZNw==
X-Gm-Gg: ASbGncuTA+f91eILiGPkom/zIlMS9dZmROhPw4gzAkY8BUQZCPziYxxnvG2RA19U9mZ
	V7u8SNaLOakQodjhTl4gdO2QpwjyWj3wyEQ/ewTdUuIhKR+az9k6ZGshfYLDcfO+hsi9VoxLUnS
	de35Z7HTPiKyvQX7bIRnDHMdxQQbF1127huRbepXIaKYM5Ey/NDn04ropR8yw597LEYqlAAqYML
	e34zS+WuJhqZg+ae1ZG8jfAl7nzgP1fMeX9mdB42Et0RDzcyGoI84T40Ny8rbr5ymdxgXdtO4J5
	uAJr71hNn/5vGhqxtIqvSQhD+y6ppmZwGtWbSPRaOizjFsDg6H+BFsO6ow==
X-Google-Smtp-Source: AGHT+IGZAm8lynfGAohO9JTslIqP6URufKbyvY0J2pLiXd8WWyevzZ0XpxXAOt+sKSexpqQsmJtXjA==
X-Received: by 2002:a17:90a:d607:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-3030fe6dfbamr20695764a91.4.1742843813268;
        Mon, 24 Mar 2025 12:16:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f613968sm8592245a91.28.2025.03.24.12.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:16:52 -0700 (PDT)
Message-ID: <92e740dd-a5ab-4daf-9169-1de195128243@linaro.org>
Date: Mon, 24 Mar 2025 12:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] target/arm: convert 32 bit gdbstub to new
 helpers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-6-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: wHhDks61/hF7

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBGb3Igc29tZSBvZiB0
aGUgaGVscGVycyB3ZSBuZWVkIGEgdGVtcG9yYXJ5IHZhcmlhYmxlIHRvIGNvcHkgZnJvbQ0K
PiBhbHRob3VnaCB3ZSBjb3VsZCBhZGQgc29tZSBoZWxwZXJzIHRvIHJldHVybiBwb2ludGVy
cyBpbnRvIGVudiBpbg0KPiB0aG9zZSBjYXNlcyBpZiB3ZSB3YW50ZWQgdG8uDQo+IA0KPiBS
ZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFy
by5vcmc+DQo+IA0KPiAtLS0NCj4gdjINCj4gICAgLSB1c2UgbmV3IHdyYXBwZXJzDQo+ICAg
IC0gZXhwbGljaXQgTU9fMzIgdXNhZ2UgYW5kIHJlZzMyLzY0IGhlbHBlcnMNCj4gLS0tDQo+
ICAgdGFyZ2V0L2FybS9nZGJzdHViLmMgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25z
KCspLCAyMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2dk
YnN0dWIuYyBiL3RhcmdldC9hcm0vZ2Ric3R1Yi5jDQo+IGluZGV4IDMwMDY4YzIyNjIuLjcx
ZDY3MmFjZTUgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9hcm0vZ2Ric3R1Yi5jDQo+ICsrKyBi
L3RhcmdldC9hcm0vZ2Ric3R1Yi5jDQo+IEBAIC0yMCw3ICsyMCw3IEBADQo+ICAgI2luY2x1
ZGUgInFlbXUvb3NkZXAuaCINCj4gICAjaW5jbHVkZSAiY3B1LmgiDQo+ICAgI2luY2x1ZGUg
ImV4ZWMvZ2Ric3R1Yi5oIg0KPiAtI2luY2x1ZGUgImdkYnN0dWIvaGVscGVycy5oIg0KPiAr
I2luY2x1ZGUgImdkYnN0dWIvcmVnaXN0ZXJzLmgiDQo+ICAgI2luY2x1ZGUgImdkYnN0dWIv
Y29tbWFuZHMuaCINCj4gICAjaW5jbHVkZSAic3lzdGVtL3RjZy5oIg0KPiAgICNpbmNsdWRl
ICJpbnRlcm5hbHMuaCINCj4gQEAgLTMzLDEyICszMywxNiBAQCB0eXBlZGVmIHN0cnVjdCBS
ZWdpc3RlclN5c3JlZ0ZlYXR1cmVQYXJhbSB7DQo+ICAgICAgIGludCBuOw0KPiAgIH0gUmVn
aXN0ZXJTeXNyZWdGZWF0dXJlUGFyYW07DQo+ICAgDQo+IC0vKiBPbGQgZ2RiIGFsd2F5cyBl
eHBlY3QgRlBBIHJlZ2lzdGVycy4gIE5ld2VyICh4bWwtYXdhcmUpIGdkYiBvbmx5IGV4cGVj
dA0KPiAtICAgd2hhdGV2ZXIgdGhlIHRhcmdldCBkZXNjcmlwdGlvbiBjb250YWlucy4gIER1
ZSB0byBhIGhpc3RvcmljYWwgbWlzaGFwDQo+IC0gICB0aGUgRlBBIHJlZ2lzdGVycyBhcHBl
YXIgaW4gYmV0d2VlbiBjb3JlIGludGVnZXIgcmVncyBhbmQgdGhlIENQU1IuDQo+IC0gICBX
ZSBoYWNrIHJvdW5kIHRoaXMgYnkgZ2l2aW5nIHRoZSBGUEEgcmVncyB6ZXJvIHNpemUgd2hl
biB0YWxraW5nIHRvIGENCj4gLSAgIG5ld2VyIGdkYi4gICovDQo+IC0NCj4gKy8qDQo+ICsg
KiBPbGQgZ2RiIGFsd2F5cyBleHBlY3QgRlBBIHJlZ2lzdGVycy4gTmV3ZXIgKHhtbC1hd2Fy
ZSkgZ2RiIG9ubHkNCj4gKyAqIGV4cGVjdCB3aGF0ZXZlciB0aGUgdGFyZ2V0IGRlc2NyaXB0
aW9uIGNvbnRhaW5zLiBEdWUgdG8gYQ0KPiArICogaGlzdG9yaWNhbCBtaXNoYXAgdGhlIEZQ
QSByZWdpc3RlcnMgYXBwZWFyIGluIGJldHdlZW4gY29yZSBpbnRlZ2VyDQo+ICsgKiByZWdz
IGFuZCB0aGUgQ1BTUi4gV2UgaGFjayByb3VuZCB0aGlzIGJ5IGdpdmluZyB0aGUgRlBBIHJl
Z3MgemVybw0KPiArICogc2l6ZSB3aGVuIHRhbGtpbmcgdG8gYSBuZXdlciBnZGIuDQo+ICsg
Kg0KPiArICogV2hpbGUgZ2RiIGNhcmVzIGFib3V0IHRoZSBtZW1vcnkgZW5kaWFuZXNzIG9m
IHRoZSB0YXJnZXQgYWxsDQo+ICsgKiByZWdpc3RlcnMgYXJlIHBhc3NlZCBpbiBsaXR0bGUt
ZW5kaWFuIG1vZGUuDQo+ICsgKi8NCj4gICBpbnQgYXJtX2NwdV9nZGJfcmVhZF9yZWdpc3Rl
cihDUFVTdGF0ZSAqY3MsIEdCeXRlQXJyYXkgKm1lbV9idWYsIGludCBuKQ0KPiAgIHsNCj4g
ICAgICAgQVJNQ1BVICpjcHUgPSBBUk1fQ1BVKGNzKTsNCj4gQEAgLTQ2LDE1ICs1MCwxNyBA
QCBpbnQgYXJtX2NwdV9nZGJfcmVhZF9yZWdpc3RlcihDUFVTdGF0ZSAqY3MsIEdCeXRlQXJy
YXkgKm1lbV9idWYsIGludCBuKQ0KPiAgIA0KPiAgICAgICBpZiAobiA8IDE2KSB7DQo+ICAg
ICAgICAgICAvKiBDb3JlIGludGVnZXIgcmVnaXN0ZXIuICAqLw0KPiAtICAgICAgICByZXR1
cm4gZ2RiX2dldF9yZWczMihtZW1fYnVmLCBlbnYtPnJlZ3Nbbl0pOw0KPiArICAgICAgICBy
ZXR1cm4gZ2RiX2dldF9yZWczMl92YWx1ZShNT19URSB8IE1PXzMyLCBtZW1fYnVmLCAmZW52
LT5yZWdzW25dKTsNCj4gICAgICAgfQ0KPiAgICAgICBpZiAobiA9PSAyNSkgew0KPiAgICAg
ICAgICAgLyogQ1BTUiwgb3IgWFBTUiBmb3IgTS1wcm9maWxlICovDQo+ICsgICAgICAgIHVp
bnQzMl90IHJlZzsNCj4gICAgICAgICAgIGlmIChhcm1fZmVhdHVyZShlbnYsIEFSTV9GRUFU
VVJFX00pKSB7DQo+IC0gICAgICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMihtZW1fYnVm
LCB4cHNyX3JlYWQoZW52KSk7DQo+ICsgICAgICAgICAgICByZWcgPSB4cHNyX3JlYWQoZW52
KTsNCj4gICAgICAgICAgIH0gZWxzZSB7DQo+IC0gICAgICAgICAgICByZXR1cm4gZ2RiX2dl
dF9yZWczMihtZW1fYnVmLCBjcHNyX3JlYWQoZW52KSk7DQo+ICsgICAgICAgICAgICByZWcg
PSBjcHNyX3JlYWQoZW52KTsNCj4gICAgICAgICAgIH0NCj4gKyAgICAgICAgcmV0dXJuIGdk
Yl9nZXRfcmVnMzJfdmFsdWUoTU9fVEUgfCBNT18zMiwgbWVtX2J1ZiwgJnJlZyk7DQo+ICAg
ICAgIH0NCj4gICAgICAgLyogVW5rbm93biByZWdpc3Rlci4gICovDQo+ICAgICAgIHJldHVy
biAwOw0KPiBAQCAtMTE1LDE5ICsxMjEsMjEgQEAgc3RhdGljIGludCB2ZnBfZ2RiX2dldF9y
ZWcoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICpidWYsIGludCByZWcpDQo+ICAgDQo+ICAg
ICAgIC8qIFZGUCBkYXRhIHJlZ2lzdGVycyBhcmUgYWx3YXlzIGxpdHRsZS1lbmRpYW4uICAq
Lw0KPiAgICAgICBpZiAocmVnIDwgbnJlZ3MpIHsNCj4gLSAgICAgICAgcmV0dXJuIGdkYl9n
ZXRfcmVnNjQoYnVmLCAqYWEzMl92ZnBfZHJlZyhlbnYsIHJlZykpOw0KPiArICAgICAgICBy
ZXR1cm4gZ2RiX2dldF9yZWc2NF92YWx1ZShNT19URSB8IE1PXzY0LCBidWYsIGFhMzJfdmZw
X2RyZWcoZW52LCByZWcpKTsNCj4gICAgICAgfQ0KPiAgICAgICBpZiAoYXJtX2ZlYXR1cmUo
ZW52LCBBUk1fRkVBVFVSRV9ORU9OKSkgew0KPiAgICAgICAgICAgLyogQWxpYXNlcyBmb3Ig
USByZWdzLiAgKi8NCj4gICAgICAgICAgIG5yZWdzICs9IDE2Ow0KPiAgICAgICAgICAgaWYg
KHJlZyA8IG5yZWdzKSB7DQo+ICAgICAgICAgICAgICAgdWludDY0X3QgKnEgPSBhYTMyX3Zm
cF9xcmVnKGVudiwgcmVnIC0gMzIpOw0KPiAtICAgICAgICAgICAgcmV0dXJuIGdkYl9nZXRf
cmVnMTI4KGJ1ZiwgcVswXSwgcVsxXSk7DQo+ICsgICAgICAgICAgICByZXR1cm4gZ2RiX2dl
dF9yZWc2NF92YWx1ZShNT19URSB8IE1PXzY0LCBidWYsIHEpOw0KPiAgICAgICAgICAgfQ0K
DQpXaGF0IGFib3V0IHVwcGVyIHBhcnQgb2YgcmVnaXN0ZXI/IHMvMTI4LzY0IHNlZW1zIHVu
aW50ZW5kZWQsIGFuZCBidWYgDQp3aWxsIG9ubHkgY29udGFpbiBsb3dlciBwYXJ0Lg0KUHJv
YmFibHkgbmVlZGVkIHRvIGludHJvZHVjZSBnZGJfZ2V0X3JlZzEyOF92YWx1ZSBoZWxwZXIg
YXMgd2VsbC4NCg0KPiAgICAgICB9DQo+ICAgICAgIHN3aXRjaCAocmVnIC0gbnJlZ3MpIHsN
Cj4gKyAgICAgICAgdWludDMyX3QgZnBjcjsNCj4gICAgICAgY2FzZSAwOg0KPiAtICAgICAg
ICByZXR1cm4gZ2RiX2dldF9yZWczMihidWYsIHZmcF9nZXRfZnBzY3IoZW52KSk7DQo+ICsg
ICAgICAgIGZwY3IgPSB2ZnBfZ2V0X2Zwc2NyKGVudik7DQo+ICsgICAgICAgIHJldHVybiBn
ZGJfZ2V0X3JlZzMyX3ZhbHVlKE1PX1RFIHwgTU9fMzIsIGJ1ZiwgJmZwY3IpOw0KPiAgICAg
ICB9DQo+ICAgICAgIHJldHVybiAwOw0KPiAgIH0NCj4gQEAgLTE2Niw5ICsxNzQsMTEgQEAg
c3RhdGljIGludCB2ZnBfZ2RiX2dldF9zeXNyZWcoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5
ICpidWYsIGludCByZWcpDQo+ICAgDQo+ICAgICAgIHN3aXRjaCAocmVnKSB7DQo+ICAgICAg
IGNhc2UgMDoNCj4gLSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCBlbnYtPnZm
cC54cmVnc1tBUk1fVkZQX0ZQU0lEXSk7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3Jl
ZzMyX3ZhbHVlKE1PX1RFIHwgTU9fMzIsIGJ1ZiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJmVudi0+dmZwLnhyZWdzW0FSTV9WRlBfRlBTSURdKTsNCj4gICAg
ICAgY2FzZSAxOg0KPiAtICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMihidWYsIGVudi0+
dmZwLnhyZWdzW0FSTV9WRlBfRlBFWENdKTsNCj4gKyAgICAgICAgcmV0dXJuIGdkYl9nZXRf
cmVnMzJfdmFsdWUoTU9fVEUgfCBNT18zMiwgYnVmLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmZW52LT52ZnAueHJlZ3NbQVJNX1ZGUF9GUEVYQ10pOw0KPiAg
ICAgICB9DQo+ICAgICAgIHJldHVybiAwOw0KPiAgIH0NCj4gQEAgLTE5Niw3ICsyMDYsNyBA
QCBzdGF0aWMgaW50IG12ZV9nZGJfZ2V0X3JlZyhDUFVTdGF0ZSAqY3MsIEdCeXRlQXJyYXkg
KmJ1ZiwgaW50IHJlZykNCj4gICANCj4gICAgICAgc3dpdGNoIChyZWcpIHsNCj4gICAgICAg
Y2FzZSAwOg0KPiAtICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMihidWYsIGVudi0+djdt
LnZwcik7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyX3ZhbHVlKE1PX1RFIHwg
TU9fMzIsIGJ1ZiwgJmVudi0+djdtLnZwcik7DQo+ICAgICAgIGRlZmF1bHQ6DQo+ICAgICAg
ICAgICByZXR1cm4gMDsNCj4gICAgICAgfQ0KPiBAQCAtMjM2LDkgKzI0NiwxMSBAQCBzdGF0
aWMgaW50IGFybV9nZGJfZ2V0X3N5c3JlZyhDUFVTdGF0ZSAqY3MsIEdCeXRlQXJyYXkgKmJ1
ZiwgaW50IHJlZykNCj4gICAgICAgcmkgPSBnZXRfYXJtX2NwX3JlZ2luZm8oY3B1LT5jcF9y
ZWdzLCBrZXkpOw0KPiAgICAgICBpZiAocmkpIHsNCj4gICAgICAgICAgIGlmIChjcHJlZ19m
aWVsZF9pc182NGJpdChyaSkpIHsNCj4gLSAgICAgICAgICAgIHJldHVybiBnZGJfZ2V0X3Jl
ZzY0KGJ1ZiwgKHVpbnQ2NF90KXJlYWRfcmF3X2NwX3JlZyhlbnYsIHJpKSk7DQo+ICsgICAg
ICAgICAgICB1aW50NjRfdCBjcHJlZyA9IHJlYWRfcmF3X2NwX3JlZyhlbnYsIHJpKTsNCj4g
KyAgICAgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVVEsIGJ1
ZiwgKHVpbnQ4X3QgKikgJmNwcmVnKTsNCj4gICAgICAgICAgIH0gZWxzZSB7DQo+IC0gICAg
ICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWczMihidWYsICh1aW50MzJfdClyZWFkX3Jhd19j
cF9yZWcoZW52LCByaSkpOw0KPiArICAgICAgICAgICAgdWludDMyX3QgY3ByZWcgPSAodWlu
dDMyX3QpIHJlYWRfcmF3X2NwX3JlZyhlbnYsIHJpKTsNCj4gKyAgICAgICAgICAgIHJldHVy
biBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVUwsIGJ1ZiwgKHVpbnQ4X3QgKikgJmNw
cmVnKTsNCj4gICAgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgICAgICByZXR1cm4gMDsNCj4g
QEAgLTM3NSwxMiArMzg3LDEyIEBAIHN0YXRpYyB1aW50MzJfdCAqbV9zeXNyZWdfcHRyKENQ
VUFSTVN0YXRlICplbnYsIE1Qcm9maWxlU3lzcmVnIHJlZywgYm9vbCBzZWMpDQo+ICAgc3Rh
dGljIGludCBtX3N5c3JlZ19nZXQoQ1BVQVJNU3RhdGUgKmVudiwgR0J5dGVBcnJheSAqYnVm
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgIE1Qcm9maWxlU3lzcmVnIHJlZywgYm9v
bCBzZWN1cmUpDQo+ICAgew0KPiAtICAgIHVpbnQzMl90ICpwdHIgPSBtX3N5c3JlZ19wdHIo
ZW52LCByZWcsIHNlY3VyZSk7DQo+ICsgICAgdWludDhfdCAqcHRyID0gKHVpbnQ4X3QgKikg
bV9zeXNyZWdfcHRyKGVudiwgcmVnLCBzZWN1cmUpOw0KPiAgIA0KPiAgICAgICBpZiAocHRy
ID09IE5VTEwpIHsNCj4gICAgICAgICAgIHJldHVybiAwOw0KPiAgICAgICB9DQo+IC0gICAg
cmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCAqcHRyKTsNCj4gKyAgICByZXR1cm4gZ2RiX2dl
dF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBidWYsIHB0cik7DQo+ICAgfQ0KPiAgIA0KPiAg
IHN0YXRpYyBpbnQgYXJtX2dkYl9nZXRfbV9zeXN0ZW1yZWcoQ1BVU3RhdGUgKmNzLCBHQnl0
ZUFycmF5ICpidWYsIGludCByZWcpDQo+IEBAIC0zOTMsNyArNDA1LDggQEAgc3RhdGljIGlu
dCBhcm1fZ2RiX2dldF9tX3N5c3RlbXJlZyhDUFVTdGF0ZSAqY3MsIEdCeXRlQXJyYXkgKmJ1
ZiwgaW50IHJlZykNCj4gICAgICAgICogYmFua2VkIGFuZCBub24tYmFua2VkIGJpdHMuDQo+
ICAgICAgICAqLw0KPiAgICAgICBpZiAocmVnID09IE1fU1lTUkVHX0NPTlRST0wpIHsNCj4g
LSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCBhcm1fdjdtX21yc19jb250cm9s
KGVudiwgZW52LT52N20uc2VjdXJlKSk7DQo+ICsgICAgICAgIHVpbnQzMl90IHJlZzMyID0g
YXJtX3Y3bV9tcnNfY29udHJvbChlbnYsIGVudi0+djdtLnNlY3VyZSk7DQo+ICsgICAgICAg
IHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVUwsIGJ1ZiwgKHVpbnQ4X3Qg
KikgJnJlZzMyKTsNCj4gICAgICAgfQ0KPiAgICAgICByZXR1cm4gbV9zeXNyZWdfZ2V0KGVu
diwgYnVmLCByZWcsIGVudi0+djdtLnNlY3VyZSk7DQo+ICAgfQ0KDQo=
