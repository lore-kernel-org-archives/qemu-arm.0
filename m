Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp728034njb;
        Wed, 23 Oct 2024 14:31:47 -0700 (PDT)
X-Received: by 2002:a17:902:f54d:b0:20c:79f1:fed9 with SMTP id d9443c01a7336-20fa9e4af0amr56642345ad.25.1729719107331;
        Wed, 23 Oct 2024 14:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729719107; cv=none;
        d=google.com; s=arc-20240605;
        b=F5YVb2Vse6mnT33SSRymo4Zj8I0zpuLx2oAI3SYynwwtbqRBDFkR7cXVRP+bSG5w1E
         SinGSZ5GPIb+U+dqVzsc7wxg2R9us8OwzN4JVhFUvLXOMTSFxI3A58JhShkHU1oJV+Ar
         3Qc42rM9Fa2eHTBO+N3xDMCr0P7BY3shTgOcE4+oj/xtm1vF3Y9kYf3YnLSlyppguSAS
         DNORT2hYow7rBpPQVxvLQoc9WDhzG8osOmHQz5t1fjhYBFj61QKP3jjtX50wDKA63AEy
         VTHAyW9EA+tVQG35bJl2Y8Ukfm78BTdrNQZArwDPyie/KRr4K9lnv8e1uQitXeW9BuwG
         xCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XMV66Tma+m+DyNkwDKnD2R7rJWyhw+6KbQDPG90Lh9o=;
        fh=FRepLuWzGGLcbqFN68zQFnLNBGmhecJ5ZUcYxwW1mbw=;
        b=dvZSPAFFbKRAXTD35GyxWCwIfWEOGh3vShsJD9D0I25iBRXAq6uP4Mox9hGz/bS9TQ
         49bkTrfc2ufs7xgKqB8SBmy+TN1eyUI/fjF8xpK379SdDhdAH5SsszUQyxpC0Yw9ttT8
         t6PFhCVhEpavwIUhcL7JJu7JAhysjFQdbxjDJAq71n1iABW+mWEPao93UJlkJWmCmKvy
         UBINhRnjpbBdUNlhdlIXh1i6dwLSohNLouzyu/WwkLRNI3Ba6yPJr9Rsc1pc7Tw60cTD
         W4oPrhiE+mBqalPYJL4hpf0zOuq87FcdsFiTRrOd6DU+CgIwrh+gWgV3sp6iiDfRNKRh
         j9SA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hKFfIzQG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f1a664fsor52116175ad.20.2024.10.23.14.31.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Oct 2024 14:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hKFfIzQG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729719107; x=1730323907; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMV66Tma+m+DyNkwDKnD2R7rJWyhw+6KbQDPG90Lh9o=;
        b=hKFfIzQGM0SADd9nT97xcaueGfXSFDUMCrkyV+CJnX4KIogcKOMCpYtGGc50XFu6Pa
         ksP2Ms9ldZ3MB/EU7Q6KPtVznzbC2DJIUcannX2Jh0NhNueBBuofBPb33gacu3EpBHcf
         BnzvOacMTczpYxYKpxvcnSdM8LLpi/pIBXXTRqpJFFeosIusGx/1nSVzgodNf2K1FpYo
         YwwcwwGqgNotFofJiglTASVKqaLdFWttySvQ8YfFHcApZSJ0T+8yR3v9H2A0XvvM7hel
         CEVVi1pfrfW00+qKP3Co9fZc5QlvX86K5sXRuBJ32u4l+2bt/7FT6Aw+YPjXc8ZzEeHG
         R4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729719107; x=1730323907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMV66Tma+m+DyNkwDKnD2R7rJWyhw+6KbQDPG90Lh9o=;
        b=nuprKWfaz8dFqBZ9v21VB3UCz69jVf3pCilJaEp0Dwc5u4O+URXFzA7JoKm0x5kQFS
         TER0z6uHbe8sPHx2mnGOEiVMIbEiLtAWiTr9j5LlaN280LTeP3qibCUFkg0nbs9GJJCS
         xVVs/hDyYPs84kxa/A9vcAS7/R/AP3r6iWSjNh8YCqUzhROou/vQsdX+nYaD/z4VZtNR
         7ooDNxp/j0U8TBriOz/qSciva/KiRypnEyfFALhsRjNwaKBuO8HpPk+hE7/s9fFpzGtM
         un0+8e95mFc1k/RlTpYAOOrI/WCTpXp04LV8h9UH2EOo1lbmfBUSIJwss8Nzyf0uc5UF
         CWZg==
X-Gm-Message-State: AOJu0YyqeaH6VTAyrVGs+uGQbNrParen83ryztrk/btziuJ3RQDbjnVd
	KjjUAGcfywT5IPDmkGuholtMhMebFoJJJZ500poJPLbh+TkmUJj1uEZpb9/0jT0U2vOIonA2kDa
	lzDh10pDY
X-Google-Smtp-Source: AGHT+IECIPlif+Tu0yu3XBicCEMHLEOzNPxUBgiSXihwbTu2CDR+24J+6/0XGCXXFNeLSWMcYXUV8g==
X-Received: by 2002:a05:6a21:6b0c:b0:1d9:78c:dcf2 with SMTP id adf61e73a8af0-1d978bd32cdmr5191354637.43.1729719106774;
        Wed, 23 Oct 2024 14:31:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaec52dd6csm6230401a12.4.2024.10.23.14.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 14:31:46 -0700 (PDT)
Message-ID: <202cd5e2-3732-479d-ab02-67061e2114cc@linaro.org>
Date: Wed, 23 Oct 2024 14:31:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/20] meson: build contrib/plugins with meson
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
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
 <20241022105614.839199-19-alex.bennee@linaro.org>
 <fe33c996-3241-4706-9ac1-85f00cb8f388@linaro.org>
 <87sesnkxhm.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87sesnkxhm.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ZqOOpsMpDbIA

T24gMTAvMjMvMjQgMDE6NTcsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gUGllcnJpY2sgQm91
dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+IA0KPj4gT24g
MTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4+PiBGcm9tOiBQaWVycmlj
ayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+Pj4gVHJpZWQgdG8g
dW5pZnkgdGhpcyBtZXNvbi5idWlsZCB3aXRoIHRlc3RzL3RjZy9wbHVnaW5zL21lc29uLmJ1
aWxkDQo+Pj4gYnV0DQo+Pj4gdGhlIHJlc3VsdGluZyBtb2R1bGVzIGFyZSBub3Qgb3V0cHV0
IGluIHRoZSByaWdodCBkaXJlY3RvcnkuDQo+Pj4gT3JpZ2luYWxseSBwcm9wb3NlZCBieSBB
bnRvbiBLb2Noa292LCB0aGFuayB5b3UhDQo+Pj4gU29sdmVzOiBodHRwczovL2dpdGxhYi5j
b20vcWVtdS1wcm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTcxMA0KPj4+IFNpZ25lZC1vZmYtYnk6
IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiBN
ZXNzYWdlLUlkOiA8MjAyNDA5MjUyMDQ4NDUuMzkwNjg5LTItcGllcnJpY2suYm91dmllckBs
aW5hcm8ub3JnPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5u
ZWVAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiAgICBtZXNvbi5idWlsZCAgICAgICAgICAg
ICAgICAgfCAgNCArKysrDQo+Pj4gICAgY29udHJpYi9wbHVnaW5zL21lc29uLmJ1aWxkIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKykNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgY29udHJpYi9wbHVn
aW5zL21lc29uLmJ1aWxkDQo+Pj4gZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24u
YnVpbGQNCj4+PiBpbmRleCBiZGQ2N2EyZDZkLi4zZWEwM2M0NTFiIDEwMDY0NA0KPj4+IC0t
LSBhL21lc29uLmJ1aWxkDQo+Pj4gKysrIGIvbWVzb24uYnVpbGQNCj4+PiBAQCAtMzY3OCw2
ICszNjc4LDEwIEBAIHN1YmRpcignYWNjZWwnKQ0KPj4+ICAgIHN1YmRpcigncGx1Z2lucycp
DQo+Pj4gICAgc3ViZGlyKCdlYnBmJykNCj4+PiAgICAraWYgJ0NPTkZJR19UQ0cnIGluIGNv
bmZpZ19hbGxfYWNjZWwNCj4+PiArICBzdWJkaXIoJ2NvbnRyaWIvcGx1Z2lucycpDQo+Pj4g
K2VuZGlmDQo+Pj4gKw0KPj4+ICAgIGNvbW1vbl91c2VyX2luYyA9IFtdDQo+Pj4gICAgICBz
dWJkaXIoJ2NvbW1vbi11c2VyJykNCj4+PiBkaWZmIC0tZ2l0IGEvY29udHJpYi9wbHVnaW5z
L21lc29uLmJ1aWxkIGIvY29udHJpYi9wbHVnaW5zL21lc29uLmJ1aWxkDQo+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwLi5hMGUwMjZkMjVlDQo+Pj4g
LS0tIC9kZXYvbnVsbA0KPj4+ICsrKyBiL2NvbnRyaWIvcGx1Z2lucy9tZXNvbi5idWlsZA0K
Pj4+IEBAIC0wLDAgKzEsMjMgQEANCj4+PiArdCA9IFtdDQo+Pj4gK2lmIGdldF9vcHRpb24o
J3BsdWdpbnMnKQ0KPj4+ICsgIGZvcmVhY2ggaSA6IFsnY2FjaGUnLCAnZHJjb3YnLCAnZXhl
Y2xvZycsICdob3RibG9ja3MnLCAnaG90cGFnZXMnLCAnaG93dmVjJywNCj4+PiArICAgICAg
ICAgICAgICAgJ2h3cHJvZmlsZScsICdpcHMnLCAnbG9ja3N0ZXAnLCAnc3RvcHRyaWdnZXIn
XQ0KPj4NCj4+IGxvY2tzdGVwIGRvZXMgbm90IGJ1aWxkIHVuZGVyIFdpbmRvd3MgKGl0IHVz
ZXMgc29ja2V0cyksIHNvIGl0IHNob3VsZA0KPj4gYmUgY29uZGl0aW9ubmFsbHkgbm90IGJ1
aWx0IG9uIHRoaXMgcGxhdGZvcm0uDQo+PiBAQWxleCwgaWYgeW91IGZlZWwgbGlrZSBtb2Rp
ZnlpbmcgdGhpcywgeW91IGNhbi4gSWYgbm90LCB5b3UgY2FuIGRyb3ANCj4+IHRoZSBtZXNv
biBidWlsZCBwYXRjaGVzIGZyb20gdGhpcyBzZXJpZXMgdG8gbm90IGJsb2NrIGl0Lg0KPiAN
Cj4gSSdsbCBkcm9wIGZyb20gdGhlIFBSIGFuZCBsZXQgeW91IHJlLXN1Ym1pdC4NCj4gDQoN
ClNlbnQgYSB2MyB3aXRoIHdpbmRvd3MgZml4Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cWVtdS1kZXZlbC8yMDI0MTAyMzIxMjgxMi4xMzc2OTcyLTEtcGllcnJpY2suYm91dmllckBs
aW5hcm8ub3JnL1QvI3QNCg0KVGhhbmtzLA0KUGllcnJpY2sNCg==
