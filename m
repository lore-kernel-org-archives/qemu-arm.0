Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3124328njb;
        Tue, 18 Mar 2025 11:23:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFWD+dRBIwuTV2cMT5eln36OgmPY6fqCEMG/5e0XtwIvCNWCRw3bJWvgtqLwVAWRC/9YvL7cbQdXM9IQ==@linaro.org
X-Received: by 2002:aa7:88d5:0:b0:732:a24:7354 with SMTP id d2e1a72fcca58-737223702c0mr23157161b3a.4.1742322222740;
        Tue, 18 Mar 2025 11:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742322222; cv=none;
        d=google.com; s=arc-20240605;
        b=VElhfzSBy55Lf3/qF0RDpv/PB0IhXaHO2TCFe9LMsjDgxl6sjGTBNpp0vy9wmJxT1z
         Z5fUOwh7P7THtOPIpQYuVyeP5cmtISHPbGzbWegpuMy+HgvSSuURDC+1esmvceUp1tzP
         kPIiUU0xEiDKCx/i8N9ErmaEbVmkLHsevlqMctq18mOxrzH2fgAoYaHiqtuij+Yukmym
         4Y1Lf2yb+Z/zZEcD2xRs7AlpIO+MtUlzkhARTFLyhiAA97YGThiXaPp9/OsMmFQ2/xMW
         B8FNlsNCxowOL/UGsMZPsC3cBnmUwfQzdeeaDTUNERDpY+1IFSaDujg4j9+FHJ5dm+Ul
         a/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zhdlHNWmjY0/U0RTVbqd1beK1I5dVapYlQeofi/XGMw=;
        fh=1n3pirqDaGHfKc9dZQcfA7TjV6ENrWATvbskB0gnvDo=;
        b=lWry85ozLzJx4DoJQiiWli277GhIEdyP6+EQxeRnO7B2L8bsCnaAxYltXsbxB4GlkY
         FWCCRgxnt8mk4sVuRQLXTi7Xgwj6KAHwovq5sHlvRpks+JY18p9+9+G8+Leum781b9G4
         uwliEDnSVNQMd05AQtx8FM+/n5Qxuc1R+GbIjgqvElB/j+IqO/q2qgcwrWkTbHa47iEM
         9Ezdf3tEr5FnhzvPJQ6g5GiwhEpZRUNI0zh7kSxeJajdz9Bb8j4EVUew4IHFVvB2D3cT
         pl38WfI4pPGpPsUzbiMIL4jnHD/FHgFkuTgiZjd3alaEbiCh28a54x3wSqQnpNLLFTjr
         bAkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sjYb7xv7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73711525de0sor9454069b3a.1.2025.03.18.11.23.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 11:23:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sjYb7xv7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742322222; x=1742927022; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhdlHNWmjY0/U0RTVbqd1beK1I5dVapYlQeofi/XGMw=;
        b=sjYb7xv7QfmQHjl+7W7pGiyCzanLybL4ioUwuksb5dUERZABqzRW7J467DLCWPGBFV
         EhxNmMXXyc5QMXri/XfyzajP2f0pqwjyNqSai79zQSg3Ur4efgDHNv2xRtqYOnFbIu8U
         ZqkKHO3FvsdCvJxlGlfw1x4kZw54mxtOcZ/BwfjQUMmnvC6iBV2jA2pm7pAUwWXmADSM
         ZA2ohg34xtfhNZNZQXDDmE7I4R4RTUwjrwYs1sqz6z/fPqpKexjcH0p2FULXxgA9NHTE
         iGeA4j08I2W1YLT8V+34inxvlXNDMQL3xAynKFFR9qUWQDi0XrEMY15enq1bdezsn2eG
         7lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742322222; x=1742927022;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhdlHNWmjY0/U0RTVbqd1beK1I5dVapYlQeofi/XGMw=;
        b=GuLJrceWGk2dL92oBwzCpleVUpzKH4XloZbK0bjrOOSMELThjC30LjDniJVg8vCoSf
         iZl5aJoSVt7Id3I+jrlKGS63R8JWXb2NCZ5dwMVUXd45nyM2Z/MwzfN1Jx1lVxHjF4UF
         /cqWxusjHmD38SBAhmlZK+MAks/UDPl+VAREbPJYRmWbP7x2pdcYQy6goNna+inZ3pHu
         YFJs96UQixCfi47Vk3TF+E0ZPN3RqqWCkHbcldvjf98uOr7PRwAmZ7efEszvDmjJ6UOJ
         0iwVsP/NGXRUMiUZW2YlRI5Mw+QAmYmFI3SIALxLCWdE1sEtVmxP//AQbM5nre2Bh5cJ
         KdQA==
X-Forwarded-Encrypted: i=1; AJvYcCXyvKZKHy1YRmD3jTbfH4YDgz+h0kM5EJcY/Cc+O233dUMTDVOSxgQmcvQUWSK1PFAdlSUFm10BAYnfhg==@linaro.org
X-Gm-Message-State: AOJu0Yy3tVU65n9eI4qzjjUhdWJPK7E5hDrkNOeoH/lRXJHetWBxjRLL
	Z26hXfRQitJu6gD7zq8Monnh3RuQKFcaFy3I5KDa7bMRlfRJ1pishxMWzFi+6mR5Hg==
X-Gm-Gg: ASbGnctezU8EggxZqAGnhRGsXD0AFHU7i3VK28Vmp6+BX2rJBdcswDOnMA8HjCquApU
	0xcyG8bvbd5X6vE7cVBfovjRQVLZ1zX/kRhg6QECeG6oWC2tq269CC3LDxhENqsvVvpNAL9WMoL
	ayWzGgqXCkNnV85O4MBgoVp//Owb6bFmMRweIDQGqZzWLPNonrFL7mrndW8/HIi4YGnW3nH4fFx
	OlrSm4x+GIQiD46K2V1+JVNzq0jsS3ilafmDylUNMcFor9QpwsteoKe8ILuSoYySR1M17f9uhpi
	5RCa7/v/6QMgdML61OvgfOOdRAAs/WuQvOq11xOBjzi2xpxLIEqE0lKdLw==
X-Google-Smtp-Source: AGHT+IF2LvaZ3PEnsxaSBKWmFbnLT1gdeU7gnXTv95cW5ygVp8xR52qeX2fRpo9WNGk6os/wtQpMKA==
X-Received: by 2002:aa7:888a:0:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73722460be6mr24957668b3a.20.1742322222270;
        Tue, 18 Mar 2025 11:23:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371157369bsm9893539b3a.75.2025.03.18.11.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 11:23:41 -0700 (PDT)
Message-ID: <ab9b15c1-4f59-4fce-88fd-028fd21875c3@linaro.org>
Date: Tue, 18 Mar 2025 11:23:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] target/arm/cpu: always define kvm related registers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-8-pierrick.bouvier@linaro.org>
 <fa3c4676-f78c-42af-b572-559640c0e4f7@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <fa3c4676-f78c-42af-b572-559640c0e4f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: UHFU04PW7dfD

T24gMy8xOC8yNSAxMToxNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE4LzMvMjUgMDU6NTEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBUaGlzIGRvZXMg
bm90IGh1cnQsIGV2ZW4gaWYgdGhleSBhcmUgbm90IHVzZWQuDQo+IA0KPiBJJ20gbm90IGNv
bnZpbmNlZCBieSB0aGUgcmF0aW9uYWxlLg0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQ
aWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+PiAtLS0N
Cj4+ICAgIHRhcmdldC9hcm0vY3B1LmggfCAyIC0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9jcHUuaCBi
L3RhcmdldC9hcm0vY3B1LmgNCj4+IGluZGV4IDIzYzIyOTNmN2QxLi45NmY3ODAxYTIzOSAx
MDA2NDQNCj4+IC0tLSBhL3RhcmdldC9hcm0vY3B1LmgNCj4+ICsrKyBiL3RhcmdldC9hcm0v
Y3B1LmgNCj4+IEBAIC05NzEsNyArOTcxLDYgQEAgc3RydWN0IEFyY2hDUFUgew0KPj4gICAg
ICAgICAqLw0KPj4gICAgICAgIHVpbnQzMl90IGt2bV90YXJnZXQ7DQo+PiAgICANCj4+IC0j
aWZkZWYgQ09ORklHX0tWTQ0KPj4gICAgICAgIC8qIEtWTSBpbml0IGZlYXR1cmVzIGZvciB0
aGlzIENQVSAqLw0KPj4gICAgICAgIHVpbnQzMl90IGt2bV9pbml0X2ZlYXR1cmVzWzddOw0K
Pj4gICAgDQo+PiBAQCAtOTg0LDcgKzk4Myw2IEBAIHN0cnVjdCBBcmNoQ1BVIHsNCj4+ICAg
IA0KPj4gICAgICAgIC8qIEtWTSBzdGVhbCB0aW1lICovDQo+PiAgICAgICAgT25PZmZBdXRv
IGt2bV9zdGVhbF90aW1lOw0KPj4gLSNlbmRpZiAvKiBDT05GSUdfS1ZNICovDQo+IA0KPiBN
YXliZSB3ZSBuZWVkIGFuIG9wYXF1ZSBBcmNoQWNjZWxDcHVTdGF0ZSBzdHJ1Y3R1cmUuLi4N
Cj4gDQoNCkl0J3Mgc2ltaWxhciB0byB0aGUgaW50ZXJlc3RpbmcgcXVlc3Rpb24gb2YgaG93
IHRvIGV4cG9zZSBzb21lIHJlZ2lzdGVycyANCmNvbmRpdGlvbm5hbGx5Lg0KDQpXZSBjb3Vs
ZCBwdXQgdGhpcyBpbiBhbm90aGVyIHN0cnVjdCwgYWxsb2NhdGUgaWYgb25seSBpZiBuZWVk
ZWQgDQooa3ZtX2VuYWJsZWQoKSksIG9yIGp1c3QgbGV0IGl0IGJlIHByZXNlbnQgYW55dGlt
ZSBsaWtlIGl0IGlzIGRvbmUgd2l0aCANCnRoaXMgcGF0Y2guDQoNCkkgZG9uJ3QgaGF2ZSBh
IHN0cm9uZyBvcGluaW9uLCBidXQgaGF2aW5nIGNvbmRpdGlvbmFsIHByZXNlbmNlIGhlcmUg
aXMgDQpqdXN0IG1ha2luZyB0aGluZ3MgY29tcGxpY2F0ZWQgd2l0aG91dCBpbnRyb2R1Y2lu
ZyBhbnkgYmVuZWZpdC4gSXQgZG9lcyANCm5vdCBwcmV2ZW50ICJ1bmF1dGhvcml6ZWQiIGFj
Y2VzcyB0byBpdC4NCg0KTm93LCBpZiB3ZSBzdGFydCB0byBoYXZlIHNvbWV0aGluZyBtb3Jl
IGNsZWFuLCBpbXBsZW1lbnRlZCBpbiBhbm90aGVyIA0KY29tcGlsYXRpb24gdW5pdHMsIG9u
bHkgcmVsYXRlZCB0byBrdm0sIHdlbGwsIHRoYXQgY291bGQgYmUgdXNlZnVsLiBCdXQgDQp3
ZSBoYXZlIHRvIGRlZmluZSB0aGUgaW50ZXJmYWNlIGZvciB0aGF0LCBhZGQgaXQgdG8gb3Ro
ZXIgYXJjaGl0ZWN0dXJlcywgDQphbmQgcHJvYmFibHkgc3BlbmQgYSBmZXcgbW9udGhzIGlu
IHRoZSBtaWRkbGUgd2hlcmUgdGhpbmdzIGFyZSBzdHVjayBoZXJlLg0KDQo+PiAgICANCj4+
ICAgICAgICAvKiBVbmlwcm9jZXNzb3Igc3lzdGVtIHdpdGggTVAgZXh0ZW5zaW9ucyAqLw0K
Pj4gICAgICAgIGJvb2wgbXBfaXNfdXA7DQo+IA0KDQo=
