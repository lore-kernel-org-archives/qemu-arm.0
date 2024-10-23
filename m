Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp240363njb;
        Wed, 23 Oct 2024 00:51:34 -0700 (PDT)
X-Received: by 2002:a17:902:ecc5:b0:20c:c086:4998 with SMTP id d9443c01a7336-20fab31ce28mr25340175ad.55.1729669894436;
        Wed, 23 Oct 2024 00:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729669894; cv=none;
        d=google.com; s=arc-20240605;
        b=doChHssBCYrAglDSJdCQeJVpLQZbMDdDvHwCh4p5z9vtsRg5yyO53DE4IgQzW/TsKW
         R1RjqOMx3o4UkSsSMkB4EfEpggz1aJhm2QrZ5601otK8baTOC8jju7TPPQZsl2eDsEh7
         QegfxDWOoxqBSraXdGpSCf2765UJKU0dpaYeRkkIAMKVJox6wD5ZaVqSbYSgkzZ/+j+g
         tklzYOG7bTNjXx6yMvHWgMBzC5IK02A93OaV03PMGqy5AWQAmzsSl6awGMdZ0IjJroht
         7/wOGWAwEDIjIabLmJ2feXDE54UjYTN2l+ib8SPobH4GlBZjl9bT9aUXxyNCZH4ml989
         WvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MepkjDJ2ngcxljXy3snTzhEiovBpyY4ILIqybTz6Vcw=;
        fh=X8ItXK/eP+lsZpHYO2upAce6PY3lCv88NOwH1uPYlKY=;
        b=XntsAsqKhnMmZ6/h77YXoUEgnbMrwCks0Mo4SFA3igVKP5/NxJ7RjTrEFEl4CiJJbr
         /gyS4+8qP1Pk1HflUwfDPkDf5VbTgHOsj60Iz8ElpgEIrYoONckOFlKbZMAlr51ulTw6
         Hw4rJaYaAHnC9hFUG3KdpXo2fYjLAZI29Deo7rtA7CfCijRbRYotnWHKXheiAa2CMwWL
         SlWa+vySF+vlh20gknGynHnGCGSOzs1PPANzMjYsYqteemMVuzvDifUU8ZjVAM1ZDOZJ
         x1+MpFwcZx3eO20urmJqqvPERutxgtGIKVCfrVyB5Pg1HRuZZ63CQoPUChxQITlJtb/B
         OyLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bS/aeO93";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f0f64f0sor39480315ad.19.2024.10.23.00.51.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Oct 2024 00:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bS/aeO93";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729669894; x=1730274694; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MepkjDJ2ngcxljXy3snTzhEiovBpyY4ILIqybTz6Vcw=;
        b=bS/aeO93pVoROaSfCbBSJrVZFYNp5Usj/yjLQXZYBo7drtNeSOPWfLlxAX54PtPrug
         hV/Ya+1byHX0DlfdXhypUrM7Di8An9ANweCkVE9CMLhpFUAXM9ZzFmDW3FLKc//K2XoW
         hbmoXwpkfn/mdxaRLpngmUBCdBEwM0syHSO5bNZDcCVG4RYf9BeKMI1QzWZqfR2lKnmS
         TOfH7m2a2KM0Z3Wob7uk4PJL+OoVg0LWiYCVQZ9hBeuna3PxGhdBwLDYCBXjWMOrsnRT
         iw0uXG9FdSjnRKYQ1E88nP0vaxnFHKa68otwld8tBa91PNBNTD9+/wBfWEoBXlxDw1dl
         VrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669894; x=1730274694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MepkjDJ2ngcxljXy3snTzhEiovBpyY4ILIqybTz6Vcw=;
        b=ittMGZMPhVrjwaiHtmWRsY4IQQRiIFcSPlSAscBsMOQrwSce4AacPLNii4EMzmze1v
         84kc5DdhS11AhLiv4G3mQU5P+lMmcSqInGlr2GMrWgo8i5lQzK1owQaxVaFNAZMjaypx
         W+O86Kvxo6lHD2nCht0V0xR4vi6mOOWgpCA9lF1nsW8aQVpmzQuy/GyRzsiRweauxxGL
         9Qnsb1IIJ9a3LJtQAQTXd18QgsjoebiSd8xf53xduyfaocT2kYFPEIAWbwZS5wX6xvqn
         AtvH167jKOObEB//Jy0s2rAvN8a3kCGPp3Vs8pYS0oBrDASRzdL6qMhUvLZsNL5w2XXt
         JeLw==
X-Gm-Message-State: AOJu0YxzblOCUv25C/vODrKolWjKBmo4GRVrJmiQbCPs89k3+dEcqd46
	VgE0pzraZYLf1vhRVRKmbb0ulk5cS5aPNQuf5XdsX79gLwbv8p4eMuEvffP8JFKlqknX5hrOeFT
	SHI1wK/oR
X-Google-Smtp-Source: AGHT+IGNBB4bbKqXJ3Wb1+fBO9LhwIz0J+plK6Cd2LbsP0Eo4zu0cRnOrM5NJnHjCVrMqBXhu4NedQ==
X-Received: by 2002:a17:903:22ce:b0:20c:ce9c:bbb0 with SMTP id d9443c01a7336-20fa7074a94mr22409375ad.0.1729669893937;
        Wed, 23 Oct 2024 00:51:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0cc12sm52872905ad.95.2024.10.23.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 00:51:33 -0700 (PDT)
Message-ID: <fe33c996-3241-4706-9ac1-85f00cb8f388@linaro.org>
Date: Wed, 23 Oct 2024 00:51:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/20] meson: build contrib/plugins with meson
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
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
 <20241022105614.839199-19-alex.bennee@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ddzEvAtIifdw

T24gMTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gRnJvbTogUGllcnJp
Y2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KPiANCj4gVHJpZWQg
dG8gdW5pZnkgdGhpcyBtZXNvbi5idWlsZCB3aXRoIHRlc3RzL3RjZy9wbHVnaW5zL21lc29u
LmJ1aWxkIGJ1dA0KPiB0aGUgcmVzdWx0aW5nIG1vZHVsZXMgYXJlIG5vdCBvdXRwdXQgaW4g
dGhlIHJpZ2h0IGRpcmVjdG9yeS4NCj4gDQo+IE9yaWdpbmFsbHkgcHJvcG9zZWQgYnkgQW50
b24gS29jaGtvdiwgdGhhbmsgeW91IQ0KPiANCj4gU29sdmVzOiBodHRwczovL2dpdGxhYi5j
b20vcWVtdS1wcm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTcxMA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
aWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+IE1lc3Nh
Z2UtSWQ6IDwyMDI0MDkyNTIwNDg0NS4zOTA2ODktMi1waWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICAgbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgIHwgIDQg
KysrKw0KPiAgIGNvbnRyaWIvcGx1Z2lucy9tZXNvbi5idWlsZCB8IDIzICsrKysrKysrKysr
KysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbnRyaWIvcGx1Z2lucy9tZXNvbi5idWlsZA0KPiAN
Cj4gZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQNCj4gaW5kZXggYmRk
NjdhMmQ2ZC4uM2VhMDNjNDUxYiAxMDA2NDQNCj4gLS0tIGEvbWVzb24uYnVpbGQNCj4gKysr
IGIvbWVzb24uYnVpbGQNCj4gQEAgLTM2NzgsNiArMzY3OCwxMCBAQCBzdWJkaXIoJ2FjY2Vs
JykNCj4gICBzdWJkaXIoJ3BsdWdpbnMnKQ0KPiAgIHN1YmRpcignZWJwZicpDQo+ICAgDQo+
ICtpZiAnQ09ORklHX1RDRycgaW4gY29uZmlnX2FsbF9hY2NlbA0KPiArICBzdWJkaXIoJ2Nv
bnRyaWIvcGx1Z2lucycpDQo+ICtlbmRpZg0KPiArDQo+ICAgY29tbW9uX3VzZXJfaW5jID0g
W10NCj4gICANCj4gICBzdWJkaXIoJ2NvbW1vbi11c2VyJykNCj4gZGlmZiAtLWdpdCBhL2Nv
bnRyaWIvcGx1Z2lucy9tZXNvbi5idWlsZCBiL2NvbnRyaWIvcGx1Z2lucy9tZXNvbi5idWls
ZA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5hMGUwMjZk
MjVlDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvY29udHJpYi9wbHVnaW5zL21lc29uLmJ1
aWxkDQo+IEBAIC0wLDAgKzEsMjMgQEANCj4gK3QgPSBbXQ0KPiAraWYgZ2V0X29wdGlvbign
cGx1Z2lucycpDQo+ICsgIGZvcmVhY2ggaSA6IFsnY2FjaGUnLCAnZHJjb3YnLCAnZXhlY2xv
ZycsICdob3RibG9ja3MnLCAnaG90cGFnZXMnLCAnaG93dmVjJywNCj4gKyAgICAgICAgICAg
ICAgICdod3Byb2ZpbGUnLCAnaXBzJywgJ2xvY2tzdGVwJywgJ3N0b3B0cmlnZ2VyJ10NCg0K
bG9ja3N0ZXAgZG9lcyBub3QgYnVpbGQgdW5kZXIgV2luZG93cyAoaXQgdXNlcyBzb2NrZXRz
KSwgc28gaXQgc2hvdWxkIGJlIA0KY29uZGl0aW9ubmFsbHkgbm90IGJ1aWx0IG9uIHRoaXMg
cGxhdGZvcm0uDQpAQWxleCwgaWYgeW91IGZlZWwgbGlrZSBtb2RpZnlpbmcgdGhpcywgeW91
IGNhbi4gSWYgbm90LCB5b3UgY2FuIGRyb3AgDQp0aGUgbWVzb24gYnVpbGQgcGF0Y2hlcyBm
cm9tIHRoaXMgc2VyaWVzIHRvIG5vdCBibG9jayBpdC4NCg0KPiArICAgIGlmIGhvc3Rfb3Mg
PT0gJ3dpbmRvd3MnDQo+ICsgICAgICB0ICs9IHNoYXJlZF9tb2R1bGUoaSwgZmlsZXMoaSAr
ICcuYycpICsgJ3dpbjMyX2xpbmtlci5jJywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
IGluY2x1ZGVfZGlyZWN0b3JpZXM6ICcuLi8uLi9pbmNsdWRlL3FlbXUnLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgbGlua19kZXBlbmRzOiBbd2luMzJfcWVtdV9wbHVnaW5fYXBp
X2xpYl0sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBsaW5rX2FyZ3M6IFsnLUxwbHVn
aW5zJywgJy1scWVtdV9wbHVnaW5fYXBpJ10sDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICBkZXBlbmRlbmNpZXM6IGdsaWIpDQo+ICsNCj4gKyAgICBlbHNlDQo+ICsgICAgICB0ICs9
IHNoYXJlZF9tb2R1bGUoaSwgZmlsZXMoaSArICcuYycpLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgaW5jbHVkZV9kaXJlY3RvcmllczogJy4uLy4uL2luY2x1ZGUvcWVtdScsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICBkZXBlbmRlbmNpZXM6IGdsaWIpDQo+ICsgICAg
ZW5kaWYNCj4gKyAgZW5kZm9yZWFjaA0KPiArZW5kaWYNCj4gK2lmIHQubGVuZ3RoKCkgPiAw
DQo+ICsgIGFsaWFzX3RhcmdldCgnY29udHJpYi1wbHVnaW5zJywgdCkNCj4gK2Vsc2UNCj4g
KyAgcnVuX3RhcmdldCgnY29udHJpYi1wbHVnaW5zJywgY29tbWFuZDogZmluZF9wcm9ncmFt
KCd0cnVlJykpDQo+ICtlbmRpZg0K
