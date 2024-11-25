Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1652987njc;
        Mon, 25 Nov 2024 14:43:04 -0800 (PST)
X-Received: by 2002:a17:90b:3b41:b0:2ea:9bdc:8f96 with SMTP id 98e67ed59e1d1-2eb0e86ad1dmr19003393a91.30.1732574584630;
        Mon, 25 Nov 2024 14:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732574584; cv=none;
        d=google.com; s=arc-20240605;
        b=BRpmLZKAf/ajDn+qCiylPVQs8wiJFSVWwIlfN1aIDJypkKFx4N4i6b7gC0HXggogaK
         J4d5ef6B9XQ1WFZkvOm5Z6+swEDvUdErWSDoGq/Vfn/sE5ph6eco6UvyIrhUW5T7dok2
         RSjGs9TtB2lFa+nq4QpaeQ40Fc9wooemq0Pjw/c2o2P+FwtavRyHFQuT9VQcQoDptY3v
         oPUHEek5aJhaBlTAKeKjwmUbgAXGwzhaivshnJfXnXi8Kn9Uwg5go8b6nuDv9gIiWt7q
         BUZXjFQQkD62gCcx1Byy/23G9l7AVS0TbRJh6ofpQvKOr5kIR4mXYFtoEO0EJ4Cy4t7p
         9+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qp/Ssi2EiEYElMKWF3TPN7CXg08InF0z6+d9XXvEw/8=;
        fh=OzCCcSemt4cggwfEOuFlHLxcao5YkuImRsb4Ytvep5g=;
        b=UwtpmhGVO8RreTxRbzWmEfb47tD1Cvu2/xFuH5SAG1BV2XtDSob//KSYhvFQAIZ9Tj
         NMqJIYS5166CDWaVDunuefXtP3kIMNaoppSFxkLIue7aR/F517lu8X0pubD03tE9NaU5
         JlzZrEho3PrFwAfdNH5wA5ZUA5qvTM10B+R+dBmu3Zo1DNsa+Eb30yx2MIa1Tn4E0VaU
         38gTaNVXNpjzPph/x/26MKfPNzDJwbyFqyxKI+Tij0rs10K5IXy58aWYIw3mTUW98ZQ7
         XnEdSG60HDOlC6xkiEKNd6xzEfJyo6VxRccZrXU+56lx+qEcSsjexpLFOcP3anCCoQ21
         n8DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypL11q11;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2eb0d1e2243sor6351407a91.5.2024.11.25.14.43.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 14:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypL11q11;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732574584; x=1733179384; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp/Ssi2EiEYElMKWF3TPN7CXg08InF0z6+d9XXvEw/8=;
        b=ypL11q11w4s7v7LvlTSiMixtiYfN9qNyGEVRuOtHmMlp/g5qIpVWJAZIDMGN1Xoh22
         U66HwzEtx2MpF3VCYewhs9eyLZgvMahrdwiJvpAv8yvDz8q9wwOZ4F3OC11vdsy6dCQE
         5vGpEae6tB/Ikis7t0PvIRScHUd9CUNvGPSoUPgcuxeibArJbkSsjCP5uHqAXVpZ2BpL
         fNlz7kDAT4FySxrsWJrNL5oW2ZQMVIR/FpY24ibOAev+1aL+8kKj4BaxvOSatUk49P7f
         inLxI2ke4JksGma2gU2SCVPgmwXKAv9CeDbscdBWvUIUydi3sOvSisSEABrO0gwyyqiA
         YKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732574584; x=1733179384;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qp/Ssi2EiEYElMKWF3TPN7CXg08InF0z6+d9XXvEw/8=;
        b=cl+nGaq4MZxYbhzoXU9XCCcqlXHKaQyMNddfkaO4rdW5hKYA8xTU7xlhxEurITQMKH
         GuSaRQEFWBvodBbs7Mn34gJcMzQ6UsRJIqOvTTMawlWymRwEjsRMfR6KuS0Xa76HEouR
         PC+tocv1cKTWsJD9xr7U0EeAMKDc7eVzpJ8BQ/ZnTLVfqxRtQRtY71xGJxyTys1WDp2U
         rIjSQvz61k0ActdFByz8ll69CmJf7NXSOvQqb9hfhRomi2tvk6He1DPe4gJ6V8pjpfDN
         CD27i6ncUa1hPkGUwgii8oYXzQo9po24ScEfDU0UFuduQTyrIGaCMx1U6LWOFCmMFeBi
         B/zA==
X-Gm-Message-State: AOJu0Yyhus2AFewVHT88rt7XL7iuj0PCeU8x3WHZFNdgrWgFrOnv+j8+
	BQGPVl99gsVSgfofdvcW/YswXIR5ZvQcFDP9tJj+CKWEISIL5G2VWKClQsolfBWBhnRV3JBGSP4
	9dBacUpWs
X-Gm-Gg: ASbGncvk21YKvqxko3NlVFHbIZ5eO2agAG5xtxBRwfLTQD6l3BEh+DG/TsKJ6YsHYeX
	nSF6sgBLuZLNDH4Rt2+6pz48rQ68F0z0aL18A5azs+6klQceqh6VipKDhEvUWSn0dY+806+fwWE
	DfXAIATtscMMW70O0nf6mpS7Fnu/j18sdP5oYYNSityXl+0WI+VUoKJdPrkkq6Yo91HQObL71Nq
	Vt86U2Xx+z9mDQCVH5+ppycBghnDzT1/bMSSorLFK1FXbM4qT+Yh7gdttMSRDZvMpixE0LRAW3K
	mehmiK9GztBgARTkjh64bQ==
X-Google-Smtp-Source: AGHT+IGNz/ZuNWTYvuAr1x3OZ4TXvjup+bo6/0RT6SjDY8DrDWXEhnwlwZkgGTf6aJ/6hi03/WNBXw==
X-Received: by 2002:a17:90b:1b46:b0:2ea:5fed:4a2b with SMTP id 98e67ed59e1d1-2eb0e2303e4mr20002544a91.15.1732574584227;
        Mon, 25 Nov 2024 14:43:04 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47e4dcsm7246676b3a.67.2024.11.25.14.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 14:43:03 -0800 (PST)
Message-ID: <01d49b94-c341-4311-88fe-f7962c117336@linaro.org>
Date: Mon, 25 Nov 2024 14:43:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/aarch64_virt: add test for FEAT_RME
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mathieu.poirier@linaro.org,
 gustavo.romero@linaro.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241125065950.1179068-1-pierrick.bouvier@linaro.org>
 <8734jfchxe.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <8734jfchxe.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: LWuBpiuiHwAh

T24gMTEvMjUvMjQgMTA6MDAsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gUGllcnJpY2sgQm91
dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+IA0KPj4gVGhp
cyBib290IGFuIE9QLVRFRSBlbnZpcm9ubWVudCwgYW5kIGxhdW5jaCBhIG5lc3RlZCBndWVz
dCBWTSBpbnNpZGUgaXQNCj4+IHVzaW5nIHRoZSBSZWFsbXMgZmVhdHVyZS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc+DQo+PiAtLS0NCj4+ICAgdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2FhcmNoNjRfdmly
dC5weSB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNjIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90ZXN0cy9mdW5j
dGlvbmFsL3Rlc3RfYWFyY2g2NF92aXJ0LnB5IGIvdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2Fh
cmNoNjRfdmlydC5weQ0KPj4gaW5kZXggMzBiYWI1YTY3N2MuLjNlOGY5MzcyMTMyIDEwMDc1
NQ0KPj4gLS0tIGEvdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2FhcmNoNjRfdmlydC5weQ0KPj4g
KysrIGIvdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2FhcmNoNjRfdmlydC5weQ0KPj4gQEAgLTE4
LDYgKzE4LDcgQEANCj4+ICAgZnJvbSBxZW11X3Rlc3QgaW1wb3J0IFFlbXVTeXN0ZW1UZXN0
LCBBc3NldA0KPj4gICBmcm9tIHFlbXVfdGVzdCBpbXBvcnQgZXhlY19jb21tYW5kLCB3YWl0
X2Zvcl9jb25zb2xlX3BhdHRlcm4NCj4+ICAgZnJvbSBxZW11X3Rlc3QgaW1wb3J0IGdldF9x
ZW11X2ltZywgcnVuX2NtZA0KPj4gK2Zyb20gcWVtdV90ZXN0LnV0aWxzIGltcG9ydCBhcmNo
aXZlX2V4dHJhY3QNCj4+ICAgDQo+PiAgIA0KPj4gICBjbGFzcyBBYXJjaDY0VmlydE1hY2hp
bmUoUWVtdVN5c3RlbVRlc3QpOg0KPj4gQEAgLTEyOSw2ICsxMzAsNjcgQEAgZGVmIHRlc3Rf
YWFyY2g2NF92aXJ0X2dpY3YyKHNlbGYpOg0KPj4gICAgICAgICAgIHJldHVybg0KPj4gICAg
ICAgICAgIHNlbGYuY29tbW9uX2FhcmNoNjRfdmlydCgidmlydCxnaWMtdmVyc2lvbj0yIikN
Cj4+ICAgDQo+PiArICAgICMgU3RhY2sgaXMgYnVpbHQgd2l0aCBPUC1URUUgYnVpbGQgZW52
aXJvbm1lbnQgZnJvbSB0aG9zZSBpbnN0cnVjdGlvbnM6DQo+PiArICAgICMgaHR0cHM6Ly9s
aW5hcm8uYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5MDUxMDI3NDU5
Lw0KPj4gKyAgICAjIGh0dHBzOi8vZ2l0aHViLmNvbS9wYm8tbGluYXJvL3FlbXUtcm1lLXN0
YWNrDQo+PiArICAgIEFTU0VUX1JNRV9TVEFDSyA9IEFzc2V0KA0KPj4gKyAgICAgICAgKCdo
dHRwczovL2ZpbGVzZXJ2ZXIubGluYXJvLm9yZy9zL0pYN29OZ2ZEZUdYU3hjWS8nDQo+PiAr
ICAgICAgICAgJ2Rvd25sb2FkL3JtZS1zdGFjay1vcC10ZWUtNC4yLjAudGFyLmd6JyksDQo+
PiArICAgICAgICAgJzFmMjQwZjU1ZThhN2E2NjQ4OWMyYjdkYjVkNDAzOTFlNWRjZmRkNTRj
ODI2MDBiZDBkNGIyMTQ1YjlhMGZiZmInKQ0KPj4gKw0KPj4gKyAgICAjIFRoaXMgdGVzdHMg
dGhlIEZFQVRfUk1FIGNwdSBpbXBsZW1lbnRhdGlvbiwgYnkgYm9vdGluZyBhIFZNIHN1cHBv
cnRpbmcgaXQsDQo+PiArICAgICMgYW5kIGxhdW5jaGluZyBhIG5lc3RlZCBWTSB1c2luZyBp
dC4NCj4+ICsgICAgZGVmIHRlc3RfYWFyY2g2NF92aXJ0X3JtZShzZWxmKToNCj4+ICsgICAg
ICAgIHN0YWNrX3BhdGhfdGFyX2d6ID0gc2VsZi5BU1NFVF9STUVfU1RBQ0suZmV0Y2goKQ0K
Pj4gKyAgICAgICAgYXJjaGl2ZV9leHRyYWN0KHN0YWNrX3BhdGhfdGFyX2d6LCBzZWxmLndv
cmtkaXIpDQo+PiArDQo+PiArICAgICAgICBzZWxmLnNldF9tYWNoaW5lKCd2aXJ0JykNCj4+
ICsgICAgICAgIHNlbGYudm0uc2V0X2NvbnNvbGUoKQ0KPj4gKyAgICAgICAgc2VsZi5yZXF1
aXJlX2FjY2VsZXJhdG9yKCd0Y2cnKQ0KPj4gKw0KPj4gKyAgICAgICAgcm1lX3N0YWNrID0g
b3MucGF0aC5qb2luKHNlbGYud29ya2RpciwgJ3JtZS1zdGFjaycpDQo+PiArICAgICAgICBr
ZXJuZWwgPSBvcy5wYXRoLmpvaW4ocm1lX3N0YWNrLCAnb3V0JywgJ2JpbicsICdJbWFnZScp
DQo+PiArICAgICAgICBiaW9zID0gb3MucGF0aC5qb2luKHJtZV9zdGFjaywgJ291dCcsICdi
aW4nLCAnZmxhc2guYmluJykNCj4+ICsgICAgICAgIGRyaXZlID0gb3MucGF0aC5qb2luKHJt
ZV9zdGFjaywgJ291dC1icicsICdpbWFnZXMnLCAncm9vdGZzLmV4dDQnKQ0KPj4gKw0KPj4g
KyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWFjY2VsJywgJ3RjZycpDQo+PiArICAgICAg
ICBzZWxmLnZtLmFkZF9hcmdzKCctY3B1JywgJ21heCx4LXJtZT1vbicpDQo+PiArICAgICAg
ICBzZWxmLnZtLmFkZF9hcmdzKCctbScsICcyMDQ4JykNCj4+ICsgICAgICAgIHNlbGYudm0u
YWRkX2FyZ3MoJy1NJywgJ3ZpcnQsYWNwaT1vZmYsJw0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAndmlydHVhbGl6YXRpb249b24sJw0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAnc2VjdXJlPW9uLCcNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgJ2dpYy12
ZXJzaW9uPTMnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWJpb3MnLCBiaW9z
KQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWtlcm5lbCcsIGtlcm5lbCkNCj4+
ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1kcml2ZScsIGYnZm9ybWF0PXJhdyxpZj1u
b25lLGZpbGU9e2RyaXZlfSxpZD1oZDAnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJn
cygnLWRldmljZScsICd2aXJ0aW8tYmxrLXBjaSxkcml2ZT1oZDAnKQ0KPj4gKyAgICAgICAg
c2VsZi52bS5hZGRfYXJncygnLWRldmljZScsICd2aXJ0aW8tOXAtZGV2aWNlLGZzZGV2PXNo
cjAsbW91bnRfdGFnPXNocjAnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWZz
ZGV2JywgZidsb2NhbCxzZWN1cml0eV9tb2RlbD1ub25lLHBhdGg9e3JtZV9zdGFja30saWQ9
c2hyMCcpDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCctZGV2aWNlJywgJ3ZpcnRp
by1uZXQtcGNpLG5ldGRldj1uZXQwJykNCj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3Mo
Jy1uZXRkZXYnLCAndXNlcixpZD1uZXQwJykNCj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2Fy
Z3MoJy1hcHBlbmQnLCAncm9vdD0vZGV2L3ZkYScpDQo+PiArDQo+PiArICAgICAgICBzZWxm
LnZtLmxhdW5jaCgpDQo+PiArICAgICAgICBzZWxmLndhaXRfZm9yX2NvbnNvbGVfcGF0dGVy
bignV2VsY29tZSB0byBCdWlsZHJvb3QnKQ0KPj4gKyAgICAgICAgdGltZS5zbGVlcCgwLjEp
DQo+PiArICAgICAgICBleGVjX2NvbW1hbmQoc2VsZiwgJ3Jvb3QnKQ0KPj4gKyAgICAgICAg
dGltZS5zbGVlcCgwLjEpDQo+PiArDQo+PiArICAgICAgICAjIFdlIG5vdyBib290IHRoZSAo
bmVzdGVkKSBndWVzdCBWTQ0KPj4gKyAgICAgICAgZXhlY19jb21tYW5kKHNlbGYsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgJ3FlbXUtc3lzdGVtLWFhcmNoNjQgLU0gdmlydCxnaWMt
dmVyc2lvbj0zICcNCj4+ICsgICAgICAgICAgICAgICAgICAgICAnLWNwdSBob3N0IC1lbmFi
bGUta3ZtIC1tIDUxMk0gJw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICctTSBjb25maWRl
bnRpYWwtZ3Vlc3Qtc3VwcG9ydD1ybWUwICcNCj4+ICsgICAgICAgICAgICAgICAgICAgICAn
LW9iamVjdCBybWUtZ3Vlc3QsaWQ9cm1lMCxtZWFzdXJlbWVudC1hbGdvPXNoYTUxMiAnDQo+
PiArICAgICAgICAgICAgICAgICAgICAgJy1kZXZpY2UgdmlydGlvLW5ldC1wY2ksbmV0ZGV2
PW5ldDAscm9tZmlsZT0gJw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICctbmV0ZGV2IHVz
ZXIsaWQ9bmV0MCAnDQo+PiArICAgICAgICAgICAgICAgICAgICAgJy1rZXJuZWwgL21udC9v
dXQvYmluL0ltYWdlICcNCj4+ICsgICAgICAgICAgICAgICAgICAgICAnLWluaXRyZCAvbW50
L291dC1ici9pbWFnZXMvcm9vdGZzLmNwaW8gJw0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICctc2VyaWFsIHN0ZGlvJykNCj4+ICsgICAgICAgICMgRGV0ZWN0IFJlYWxtIGFjdGl2YXRp
b24gZHVyaW5nIGJvb3QuDQo+PiArICAgICAgICBzZWxmLndhaXRfZm9yX2NvbnNvbGVfcGF0
dGVybignU01DX1JNSV9SRUFMTV9BQ1RJVkFURScpDQo+PiArICAgICAgICAjIFdhaXQgZm9y
IGJvb3QgdG8gY29tcGxldGUuDQo+PiArICAgICAgICBzZWxmLndhaXRfZm9yX2NvbnNvbGVf
cGF0dGVybignV2VsY29tZSB0byBCdWlsZHJvb3QnKQ0KPiANCj4gVGhpcyBpcyB0aGUgc2Ft
ZSBhcyBhYm92ZT8gT3IgdGhlIGNvbnNvbGUgb2YgdGhlIGd1ZXN0Pw0KPiANCg0KSXQncyB0
aGUgZ3Vlc3QgeWVzLCBhcyB0aGUgY29tbWVudCB0cnkgdG8gZXhwbGFpbi4NCkkgY2hvc2Ug
dG8gaW1wbGVtZW50IGl0IHRoaXMgd2F5LCBpbnN0ZWFkIG9mIGdvaW5nIHdpdGggYSBzZXBh
cmF0ZSANCnNvY2tldCwgYmVjYXVzZSBpdCB3b3VsZCBtYWtlIHRoZSB0ZXN0IGNvZGUgbXVj
aCBtb3JlIGNvbXBsaWNhdGVkIHdpdGggDQpubyByZWFsIGJlbmVmaXQuDQoNCj4gQ291bGQg
d2UgYWxzbyBjaGVjayB0aGUgb3V0cHV0IG9mIHRoZSBvdGhlciBzZXJpYWwgcG9zdHM/DQo+
IA0KDQpIb3N0IGRvZXMgbm90IHByaW50IGFueXRoaW5nLg0KV2UgYWxyZWFkeSBjaGVjayBn
dWVzdC4NCk1lc3NhZ2UgJ1NNQ19STUlfUkVBTE1fQUNUSVZBVEUnIGNvbWVzIGZyb20gdGhl
IGZpcm13YXJlLg0KU2VjdXJlIHRlcm1pbmFsIGlzIGNvbXBsZXRlbHkgc2lsZW50Lg0KDQpX
ZXJlIHlvdSB0aGlua2luZyB0byBzb21ldGhpbmcgZWxzZT8NCg0KRmVlbCBmcmVlIHRvIHRy
eSBbMV0sIHlvdSBjYW4gYnVpbGQgYW5kIGxhdW5jaCB0aGUgdm0gaW4gdHdvIGNvbW1hbmRz
IA0Kd2l0aG91dCBoYXZpbmcgdG8gaW5zdGFsbCBhbnl0aGluZyBvbiB5b3VyIG1hY2hpbmUu
DQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vcGJvLWxpbmFyby9xZW11LXJtZS1zdGFjaw0K
DQo+PiAgIA0KPj4gICBpZiBfX25hbWVfXyA9PSAnX19tYWluX18nOg0KPj4gICAgICAgUWVt
dVN5c3RlbVRlc3QubWFpbigpDQo+IA0KDQo=
