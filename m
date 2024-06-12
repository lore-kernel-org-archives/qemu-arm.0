Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp479725ejc;
        Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
X-Received: by 2002:aa7:88cd:0:b0:704:205d:2306 with SMTP id d2e1a72fcca58-705bceac74bmr2291368b3a.24.1718207776891;
        Wed, 12 Jun 2024 08:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718207776; cv=none;
        d=google.com; s=arc-20160816;
        b=tPqnnQ6RcrxZp9Bceo7Wr+H6u+HysVZ7Ew9YWhFgVeSYc+xSXu6HfTLo6GkJGGhHPr
         gtdwwaLnmhnJYwlrTqgqctbh49WwArcDiS6hhcNdFHoBzYmf/Jv/oF5mo6MsCEGBJKYT
         HGoRiP/buBHkiUDOqyc/mkc0+FKkJFz5CwZvAAKFHbIzju6x00p15zb7x1TBthLJuhdi
         hEOyDYzbTct25QoOGWUZZRJ/2kokbgeAVbZIsf3pdgoH3+zq1dXfU1e4a0vbRGwGD28H
         3EHvDVj7WaYk45S/aI5hrM8dSoYoPtS7HdENmDjmslOE8Qc6Uc3X7midKFz+PZXLJO4U
         riyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4LtFCU0OaqID7yg77vJPhZn4oHg5DdiD9TxoARUTdz0=;
        fh=eXv2JXwyEuypOQrX69yDQffVqZOElln6Rkijoj/t+TU=;
        b=XhvYAqyo7xeDs0A/JNVR+IuC+LGw+5GpyA0GNP48GWCYt+m0axgOcVvAxDdn+/V6Oz
         OkUPGU71AdKXywhl0FmKV3zg82w5e/GpClaRGk503NbCcLAQGqfAphI9sH6uxk6S+AuV
         nTfPcqSnlSie60GkBGX0VR9UX3nvuzfmTiDGGYYkCpW8T3orcmv9cC2tg576KrFTlca1
         3PsCfto2QRxMNhEUcJhgVXsmGz04TBkE0NEVkeJou7C6m+5ZfZGGje7kw6pTlCHl5vjl
         tBm5j8YxRELfG0PfzXT/8W/j4Hsw65Ck2RATd806lXteT+lzgGLOWhb9lvODwhsPqDVh
         6YGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCcwaCf9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-6de28860e4csor6611533a12.9.2024.06.12.08.56.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 12 Jun 2024 08:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCcwaCf9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718207775; x=1718812575; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LtFCU0OaqID7yg77vJPhZn4oHg5DdiD9TxoARUTdz0=;
        b=hCcwaCf940jcy/ZSIobg6UxqqPWn5uP6Ih9tLfoUnz5LTe/MUbqJdD7PPCMAVYlk8R
         NBxx4hEcoHVembBlMtFoZsGu1O5AgD/+frft60K8WTxoDYHhrKqqEw6FbZXLDBjuglpB
         aKuYxA4z2oN+pv3ZgV1hZ5r+s2U6vS2+D3uOQkvlN8lC0Mz1P8oNIMv47JhjLrXoJzKk
         nThIQcBoyglSAJGxb6KWw2Pq8zqZr00/We8a46tRSkwGkC3cPSfdgUzLI4EQNVJUlArH
         /ULRg6NYJW03qxDPdedBHqy+ZAQ5uzy9S7i7S61PFfJUzlRa6n9cn99hUlRYl37qlpvo
         ArAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207775; x=1718812575;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LtFCU0OaqID7yg77vJPhZn4oHg5DdiD9TxoARUTdz0=;
        b=QKW40AMTkrQ45uSJIcSyCYZd3zUweUgDr83xU6e2WshOfQSf3zC40YbE1lr0UlSGsn
         nxdiQy3kvbC57pvDSiE/ptHXF9b7/hp0ySo7oRybAQA/l3q0SQ2pe0WArKITjLiVMeWp
         wNstO2XiE6wVE4WhTbWrm2aR5MjwWHXuekxlt85elDvVnoC/kh9ibttNJgNDk9j0dm/M
         H1/DHD/4fOQ57oWb8Cup6jNZaESHmKDPFMoGe+UYTKJMyHtsolbZpn2CgO7Z4+TH8e0N
         AF+5j6fh4vclhXAdfL5d9W3FdWzKpxCwHAS9IHifTfG60cc2bzXX7rwm5/FjyTjlahp7
         XRLg==
X-Gm-Message-State: AOJu0Yyi+Zuoo43mLVTcPs7tO2e86tWQ3G11L0XlauecYM4DAbQE5G/n
	TlJBU2PEYSCA6w/o/SPfVbwthVj07eMi3Hd2htS7/sseFoB/0qK+6QQIuJi4BZfrQdJCgHiTabv
	NcqM=
X-Google-Smtp-Source: AGHT+IGVcaSBJlCHExD1W9Gu9M4SAY6gJcEtzhfoBdpGma9zpWI7MEzivtPw3zBsz+xTPZz63bFXOA==
X-Received: by 2002:a17:90a:c83:b0:2c3:236e:473c with SMTP id 98e67ed59e1d1-2c4a7643085mr2419168a91.21.1718207775372;
        Wed, 12 Jun 2024 08:56:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769bc48sm1941009a91.38.2024.06.12.08.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:56:14 -0700 (PDT)
Message-ID: <abe88b9b-621a-4956-877d-dd311a7fd58b@linaro.org>
Date: Wed, 12 Jun 2024 08:56:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] plugins: add time control API
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-9-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20240612153508.1532940-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: BWaw6uC9rAkL

SGkgQWxleCwNCg0KSSBub3RpY2VkIHRoZSBuZXcgc3ltYm9scyBsYWNrIFFFTVVfUExVR0lO
X0FQSSBxdWFsaWZpZXIgaW4gDQppbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaDoNCi0gcWVt
dV9wbHVnaW5fdXBkYXRlX25zDQotIHFlbXVfcGx1Z2luX3JlcXVlc3RfdGltZV9jb250cm9s
DQoNClNvIGl0IHdvdWxkIGJlIGltcG9zc2libGUgdG8gdXNlIHRob3NlIHN5bWJvbHMgb24g
d2luZG93cy4NCg0KSSBrZXB0IGEgcmVtaW5kZXIgdG8gc2VuZCBhIG5ldyBwYXRjaCBhZnRl
ciB5b3UgcHVsbGVkIHRoaXMsIGJ1dCBpZiB3ZSANCmdvIHRvIGEgbmV3IHNlcmllcywgaXQg
Y291bGQgYmUgYXMgZmFzdCBmb3IgeW91IHRvIGp1c3QgYWRkIHRoaXMgZGlyZWN0bHkuDQoN
ClRoYW5rcywNClBpZXJyaWNrDQoNCk9uIDYvMTIvMjQgMDg6MzUsIEFsZXggQmVubsOpZSB3
cm90ZToNCj4gRXhwb3NlIHRoZSBhYmlsaXR5IHRvIGNvbnRyb2wgdGltZSB0aHJvdWdoIHRo
ZSBwbHVnaW4gQVBJLiBPbmx5IG9uZQ0KPiBwbHVnaW4gY2FuIGNvbnRyb2wgdGltZSBzbyBp
dCBoYXMgdG8gcmVxdWVzdCBjb250cm9sIHdoZW4gbG9hZGVkLg0KPiBUaGVyZSBhcmUgcHJv
YmFibHkgbW9yZSBjb3JuZXIgY2FzZXMgdG8gY2F0Y2ggaGVyZS4NCj4gDQo+IEZyb206IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTog
UGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPiBbQUpC
OiB0d2Vha2VkIHVzZXItbW9kZSBoYW5kbGluZ10NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBNZXNzYWdlLUlkOiA8MjAyNDA1
MzAyMjA2MTAuMTI0NTQyNC02LXBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4gDQo+
IC0tLQ0KPiBwbHVnaW5zL25leHQNCj4gICAgLSBtYWtlIHFlbXVfcGx1Z2luX3VwZGF0ZV9u
cyBhIE5PUCBpbiB1c2VyLW1vZGUNCj4gLS0tDQo+ICAgaW5jbHVkZS9xZW11L3FlbXUtcGx1
Z2luLmggICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBwbHVnaW5zL2Fw
aS5jICAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gICBwbHVnaW5zL3FlbXUtcGx1Z2lucy5zeW1ib2xzIHwgIDIgKysNCj4gICAz
IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaCBiL2luY2x1ZGUvcWVtdS9xZW11LXBsdWdpbi5o
DQo+IGluZGV4IDk1NzAzZDhmZWMuLmRiNGQ2NzUyOWUgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvcWVtdS9xZW11LXBsdWdpbi5oDQo+ICsrKyBiL2luY2x1ZGUvcWVtdS9xZW11LXBsdWdp
bi5oDQo+IEBAIC02NjEsNiArNjYxLDMxIEBAIHZvaWQgcWVtdV9wbHVnaW5fcmVnaXN0ZXJf
dmNwdV9tZW1faW5saW5lX3Blcl92Y3B1KA0KPiAgICAgICBxZW11X3BsdWdpbl91NjQgZW50
cnksDQo+ICAgICAgIHVpbnQ2NF90IGltbSk7DQo+ICAgDQo+ICsvKioNCj4gKyAqIHFlbXVf
cGx1Z2luX3JlcXVlc3RfdGltZV9jb250cm9sKCkgLSByZXF1ZXN0IHRoZSBhYmlsaXR5IHRv
IGNvbnRyb2wgdGltZQ0KPiArICoNCj4gKyAqIFRoaXMgZ3JhbnRzIHRoZSBwbHVnaW4gdGhl
IGFiaWxpdHkgdG8gY29udHJvbCBzeXN0ZW0gdGltZS4gT25seSBvbmUNCj4gKyAqIHBsdWdp
biBjYW4gY29udHJvbCB0aW1lIHNvIGlmIG11bHRpcGxlIHBsdWdpbnMgcmVxdWVzdCB0aGUg
YWJpbGl0eQ0KPiArICogYWxsIGJ1dCB0aGUgZmlyc3Qgd2lsbCBmYWlsLg0KPiArICoNCj4g
KyAqIFJldHVybnMgYW4gb3BhcXVlIGhhbmRsZSBvciBOVUxMIGlmIGZhaWxzDQo+ICsgKi8N
Cj4gK2NvbnN0IHZvaWQgKnFlbXVfcGx1Z2luX3JlcXVlc3RfdGltZV9jb250cm9sKHZvaWQp
Ow0KPiArDQo+ICsvKioNCj4gKyAqIHFlbXVfcGx1Z2luX3VwZGF0ZV9ucygpIC0gdXBkYXRl
IHN5c3RlbSBlbXVsYXRpb24gdGltZQ0KPiArICogQGhhbmRsZTogb3BhcXVlIGhhbmRsZSBy
ZXR1cm5lZCBieSBxZW11X3BsdWdpbl9yZXF1ZXN0X3RpbWVfY29udHJvbCgpDQo+ICsgKiBA
dGltZTogdGltZSBpbiBuYW5vc2Vjb25kcw0KPiArICoNCj4gKyAqIFRoaXMgYWxsb3dzIGFu
IGFwcHJvcHJpYXRlbHkgYXV0aG9yaXNlZCBwbHVnaW4gKGkuZS4gaG9sZGluZyB0aGUNCj4g
KyAqIHRpbWUgY29udHJvbCBoYW5kbGUpIHRvIG1vdmUgc3lzdGVtIHRpbWUgZm9yd2FyZCB0
byBAdGltZS4gRm9yDQo+ICsgKiB1c2VyLW1vZGUgZW11bGF0aW9uIHRoZSB0aW1lIGlzIG5v
dCBjaGFuZ2VkIGJ5IHRoaXMgYXMgYWxsIHJlcG9ydGVkDQo+ICsgKiB0aW1lIGNvbWVzIGZy
b20gdGhlIGhvc3Qga2VybmVsLg0KPiArICoNCj4gKyAqIFN0YXJ0IHRpbWUgaXMgMC4NCj4g
KyAqLw0KPiArdm9pZCBxZW11X3BsdWdpbl91cGRhdGVfbnMoY29uc3Qgdm9pZCAqaGFuZGxl
LCBpbnQ2NF90IHRpbWUpOw0KPiArDQo+ICAgdHlwZWRlZiB2b2lkDQo+ICAgKCpxZW11X3Bs
dWdpbl92Y3B1X3N5c2NhbGxfY2JfdCkocWVtdV9wbHVnaW5faWRfdCBpZCwgdW5zaWduZWQg
aW50IHZjcHVfaW5kZXgsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50NjRfdCBudW0sIHVpbnQ2NF90IGExLCB1aW50NjRfdCBhMiwNCj4gZGlmZiAtLWdpdCBh
L3BsdWdpbnMvYXBpLmMgYi9wbHVnaW5zL2FwaS5jDQo+IGluZGV4IDZiZGIyNmJiZTMuLjQ0
MzFhMGVhN2UgMTAwNjQ0DQo+IC0tLSBhL3BsdWdpbnMvYXBpLmMNCj4gKysrIGIvcGx1Z2lu
cy9hcGkuYw0KPiBAQCAtMzksNiArMzksNyBAQA0KPiAgICNpbmNsdWRlICJxZW11L21haW4t
bG9vcC5oIg0KPiAgICNpbmNsdWRlICJxZW11L3BsdWdpbi5oIg0KPiAgICNpbmNsdWRlICJx
ZW11L2xvZy5oIg0KPiArI2luY2x1ZGUgInFlbXUvdGltZXIuaCINCj4gICAjaW5jbHVkZSAi
dGNnL3RjZy5oIg0KPiAgICNpbmNsdWRlICJleGVjL2V4ZWMtYWxsLmgiDQo+ICAgI2luY2x1
ZGUgImV4ZWMvZ2Ric3R1Yi5oIg0KPiBAQCAtNTgzLDMgKzU4NCwzNyBAQCB1aW50NjRfdCBx
ZW11X3BsdWdpbl91NjRfc3VtKHFlbXVfcGx1Z2luX3U2NCBlbnRyeSkNCj4gICAgICAgfQ0K
PiAgICAgICByZXR1cm4gdG90YWw7DQo+ICAgfQ0KPiArDQo+ICsvKg0KPiArICogVGltZSBj
b250cm9sDQo+ICsgKi8NCj4gK3N0YXRpYyBib29sIGhhc19jb250cm9sOw0KPiArDQo+ICtj
b25zdCB2b2lkICpxZW11X3BsdWdpbl9yZXF1ZXN0X3RpbWVfY29udHJvbCh2b2lkKQ0KPiAr
ew0KPiArICAgIGlmICghaGFzX2NvbnRyb2wpIHsNCj4gKyAgICAgICAgaGFzX2NvbnRyb2wg
PSB0cnVlOw0KPiArICAgICAgICByZXR1cm4gJmhhc19jb250cm9sOw0KPiArICAgIH0NCj4g
KyAgICByZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiArI2lmZGVmIENPTkZJR19TT0ZUTU1V
DQo+ICtzdGF0aWMgdm9pZCBhZHZhbmNlX3ZpcnR1YWxfdGltZV9fYXN5bmMoQ1BVU3RhdGUg
KmNwdSwgcnVuX29uX2NwdV9kYXRhIGRhdGEpDQo+ICt7DQo+ICsgICAgaW50NjRfdCBuZXdf
dGltZSA9IGRhdGEuaG9zdF91bG9uZzsNCj4gKyAgICBxZW11X2Nsb2NrX2FkdmFuY2Vfdmly
dHVhbF90aW1lKG5ld190aW1lKTsNCj4gK30NCj4gKyNlbmRpZg0KPiArDQo+ICt2b2lkIHFl
bXVfcGx1Z2luX3VwZGF0ZV9ucyhjb25zdCB2b2lkICpoYW5kbGUsIGludDY0X3QgbmV3X3Rp
bWUpDQo+ICt7DQo+ICsjaWZkZWYgQ09ORklHX1NPRlRNTVUNCj4gKyAgICBpZiAoaGFuZGxl
ID09ICZoYXNfY29udHJvbCkgew0KPiArICAgICAgICAvKiBOZWVkIHRvIGV4ZWN1dGUgb3V0
IG9mIGNwdV9leGVjLCBzbyBicWwgY2FuIGJlIGxvY2tlZC4gKi8NCj4gKyAgICAgICAgYXN5
bmNfcnVuX29uX2NwdShjdXJyZW50X2NwdSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICBhZHZhbmNlX3ZpcnR1YWxfdGltZV9fYXN5bmMsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgUlVOX09OX0NQVV9IT1NUX1VMT05HKG5ld190aW1lKSk7DQo+ICsgICAgfQ0KPiAr
I2VuZGlmDQo+ICt9DQo+IGRpZmYgLS1naXQgYS9wbHVnaW5zL3FlbXUtcGx1Z2lucy5zeW1i
b2xzIGIvcGx1Z2lucy9xZW11LXBsdWdpbnMuc3ltYm9scw0KPiBpbmRleCBhYTBhNzdhMzE5
Li5jYTc3M2Q4ZDlmIDEwMDY0NA0KPiAtLS0gYS9wbHVnaW5zL3FlbXUtcGx1Z2lucy5zeW1i
b2xzDQo+ICsrKyBiL3BsdWdpbnMvcWVtdS1wbHVnaW5zLnN5bWJvbHMNCj4gQEAgLTM4LDYg
KzM4LDcgQEANCj4gICAgIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX3ZjcHVfdGJfZXhlY19jb25k
X2NiOw0KPiAgICAgcWVtdV9wbHVnaW5fcmVnaXN0ZXJfdmNwdV90Yl9leGVjX2lubGluZV9w
ZXJfdmNwdTsNCj4gICAgIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX3ZjcHVfdGJfdHJhbnNfY2I7
DQo+ICsgIHFlbXVfcGx1Z2luX3JlcXVlc3RfdGltZV9jb250cm9sOw0KPiAgICAgcWVtdV9w
bHVnaW5fcmVzZXQ7DQo+ICAgICBxZW11X3BsdWdpbl9zY29yZWJvYXJkX2ZyZWU7DQo+ICAg
ICBxZW11X3BsdWdpbl9zY29yZWJvYXJkX2ZpbmQ7DQo+IEBAIC01MSw1ICs1Miw2IEBADQo+
ICAgICBxZW11X3BsdWdpbl91NjRfc2V0Ow0KPiAgICAgcWVtdV9wbHVnaW5fdTY0X3N1bTsN
Cj4gICAgIHFlbXVfcGx1Z2luX3VuaW5zdGFsbDsNCj4gKyAgcWVtdV9wbHVnaW5fdXBkYXRl
X25zOw0KPiAgICAgcWVtdV9wbHVnaW5fdmNwdV9mb3JfZWFjaDsNCj4gICB9Ow0K
