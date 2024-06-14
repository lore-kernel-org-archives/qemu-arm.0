Received: by 2002:a17:906:18aa:b0:a6f:6ed6:9beb with SMTP id c10csp143822ejf;
        Fri, 14 Jun 2024 10:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+GY/YLLSihQ8CJGhtWAR3u+T5hg8GqZRmdFzj0jyXKNUBfsYXPLCfXZHsiFSrMFLLEq2Gam3QFcq08pz0cbAG7qK5/AhE
X-Received: by 2002:a17:90b:ec9:b0:2c4:a7af:4d7b with SMTP id 98e67ed59e1d1-2c4db24c0f6mr3818439a91.14.1718386781945;
        Fri, 14 Jun 2024 10:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718386781; cv=none;
        d=google.com; s=arc-20160816;
        b=TehKs5xEU9uxzGU6JtNqrW2ygEYrWOEnhQgps6KVVFj9r7cta5RH0XLrWCPq0NU5uj
         Dtn4ND/F7fpyLllrxF7JTuB5FMdSV1ueRKZwxotrOT6p+oMmHqbhF04dXOnm84dANuHq
         mPQaouvPl77rYWMSWIxE3f7IRLm767h6faubDvMwMof6F4gaHTPb+5KHXYEYhvL9e+Xk
         G0gABNjEbITU6Ift/0HYkrh6lefy96YpMqoA/MtfXfxh1lxVjJqVoC9fj3wTsJ9UFibr
         gNGXuTwfl9jVP+knr6FTJDylVRFHKATI2AwEmWNhmzIS+QSiKtwOsXb6eLUauN7vqMSn
         JFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LZVk0DXKOWm6MvJWNYzIbrwLlYqE1AU9Mbeh1DO6+c0=;
        fh=WTwp2eaRMtaHl6Phl18g406i+WLmsTW1wlA1TQ6TDTQ=;
        b=p2Zmcm3OohKde4/s81R5s4xKEBDhRXJsNlXOtuk6jEolXE0UuYETKyvuEW76KwL788
         m0/JFKWghP5LVJiKaczFw9n3oucaVYK1XBcoM4vv7ohXseYPK4xtoEJQXLx0e7Ckg4Nu
         OBNopnaWf4KRWt6MOpX8uKPhYeUopWNudCJQ4xMUgpwoIhRKLYp9Hq9ScBdXj7zbE1mv
         Mivo8pP+DvVea37iCSmi87Ji/fpthoeJKk3zxz+chBd4+g58mnk/2qIzHTCYzsv/beNl
         cn9Awjl73Kq+SJwX3RP1a/EtMZdlPjLERPyrNvYvuUEtQbUgbqmJ0wzJ/E7mLRRAhYFW
         glhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UD28ZJl+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c4c7da40desor2365773a91.0.2024.06.14.10.39.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jun 2024 10:39:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UD28ZJl+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718386781; x=1718991581; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZVk0DXKOWm6MvJWNYzIbrwLlYqE1AU9Mbeh1DO6+c0=;
        b=UD28ZJl+SXeqUOw4CchKE1i8uMzDCBumW8ijnqWOmvTdVekwqPDnsQM4y2aoB+2NiF
         zPHnDJtk5yLAWUwx0WZF+VUoXiA2SaWoMWBjIQkyLOe57s7NhZqkHGTpEhPabywU6gUv
         xv1OwKEhqC3MvXQHTS6qWjvfy81N8gYT4pz0TUaElHkmNlhKVYfaKmBvSM8PL8TbGg3f
         MiPx4RUlBl1aT6yzMwRIz3U8PX7LJIgJM9DxmiWC/VYdEDt22eKEjO6laswJaVCqYlga
         jbo0T6byQ1QH7HJFXYYAyueoRodA0JmWfSomJTTR8gmf5LKW7q3Th6tGWUnHAyO+ATry
         Zb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718386781; x=1718991581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZVk0DXKOWm6MvJWNYzIbrwLlYqE1AU9Mbeh1DO6+c0=;
        b=XmLoeWFk0aXPwemLNaYnERE2rPfLUjE9/L2GY0I4YzDt5fVbwFAhd9OzMDtWkzqAU8
         aiyvViLC1gSc1vvcNXvQZ3nSJ5NxpsznHUBZUKVa528AY+T/uRU8airCRPBbRuGEmOkj
         RgV1RrOT8qY3g5gneQR9QO8eqq1HDAEyqoLGQSMuhKL01c28SBwyoT0qPfUqiBxsU+cx
         Z6uJgRLW5xcnb32jGcuHf66kt5rPfCGmZ7aj8H9870TD7uM0nPVd5bPJMcZUsxshqCyM
         PSG5OeNdKhLq+n2W/mbihFI5KljfjHs1Zh04wP9cZh9AhbJ18OAuT1eMBebj9vnfSOc2
         7opw==
X-Forwarded-Encrypted: i=1; AJvYcCVf9rd1sU0ycKXQ7R8TlBx4eAL3zcPUes2d30OppJh9jjQ28GLNE2LbQlXxuayJY7DTW1iZekhiIJZ/50GAwqHuvnBkZ6Bt
X-Gm-Message-State: AOJu0Yzt2xkoDXiA0fUkS9VUC4fIf2S6ybr7XMUC9M/ont+9QyAGX+zl
	eu7wFJBEZ9NMqqYvUonQLILaAKouddvWk6663ozdhjgsaWNsc5xvYjkqGSIc6miZenbnEWfyWb2
	yCFks0g==
X-Google-Smtp-Source: AGHT+IE5urql5YpawKC+jj7jv8LyLVzZJYw6QrDSxegrz2UowPKK9+FYNMnJ8E7y9V5qTR8ntxVfEQ==
X-Received: by 2002:a17:90a:2d82:b0:2c3:8d6:eb38 with SMTP id 98e67ed59e1d1-2c4db44ba1fmr3944452a91.26.1718386780132;
        Fri, 14 Jun 2024 10:39:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00:5b09:8db7:b002:cf61? ([2604:3d08:9384:1d00:5b09:8db7:b002:cf61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fede169c6bsm2860610a12.22.2024.06.14.10.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 10:39:39 -0700 (PDT)
Message-ID: <db8d82d4-c88d-45ac-bc99-e85a4240add2@linaro.org>
Date: Fri, 14 Jun 2024 10:39:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
 <20240612153508.1532940-10-alex.bennee@linaro.org>
 <31ba8570-9009-4530-934d-3b73b07520d0@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <31ba8570-9009-4530-934d-3b73b07520d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: JLvsWiyxacdi

T24gNi8xMy8yNCAwMTo1NCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDEyLzYvMjQgMTc6MzUsIEFsZXggQmVubsOpZSB3cm90ZToNCj4+IEZyb206IFBpZXJyaWNr
IEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+DQo+PiBUaGlzIHBs
dWdpbiB1c2VzIHRoZSBuZXcgdGltZSBjb250cm9sIGludGVyZmFjZSB0byBtYWtlIGRlY2lz
aW9ucw0KPj4gYWJvdXQgdGhlIHN0YXRlIG9mIHRpbWUgZHVyaW5nIHRoZSBlbXVsYXRpb24u
IFRoZSBhbGdvcml0aG0gaXMNCj4+IGN1cnJlbnRseSB2ZXJ5IHNpbXBsZS4gVGhlIHVzZXIg
c3BlY2lmaWVzIGFuIGlwcyByYXRlIHdoaWNoIGFwcGxpZXMNCj4gDQo+IC4uLiBJUFMgcmF0
ZSAoSW5zdHJ1Y3Rpb25zIFBlciBTZWNvbmQpIHdoaWNoIC4uLg0KPiANCj4+IHBlciBjb3Jl
LiBJZiB0aGUgY29yZSBydW5zIGFoZWFkIG9mIGl0cyBhbGxvY2F0ZWQgZXhlY3V0aW9uIHRp
bWUgdGhlDQo+PiBwbHVnaW4gc2xlZXBzIGZvciBhIGJpdCB0byBsZXQgcmVhbCB0aW1lIGNh
dGNoIHVwLiBFaXRoZXIgd2F5IHRpbWUgaXMNCj4+IHVwZGF0ZWQgZm9yIHRoZSBlbXVsYXRp
b24gYXMgYSBmdW5jdGlvbiBvZiB0b3RhbCBleGVjdXRlZCBpbnN0cnVjdGlvbnMNCj4+IHdp
dGggc29tZSBhZGp1c3RtZW50cyBmb3IgY29yZXMgdGhhdCBpZGxlLg0KPj4NCj4+IEV4YW1w
bGVzDQo+PiAtLS0tLS0tLQ0KPj4NCj4+IFNsb3cgZG93biBleGVjdXRpb24gb2YgL2Jpbi90
cnVlOg0KPj4gJCBudW1faW5zbj0kKC4vYnVpbGQvcWVtdS14ODZfNjQgLXBsdWdpbiAuL2J1
aWxkL3Rlc3RzL3BsdWdpbi9saWJpbnNuLnNvIC1kIHBsdWdpbiAvYmluL3RydWUgfCYgZ3Jl
cCB0b3RhbCB8IHNlZCAtZSAncy8uKjogLy8nKQ0KPj4gJCB0aW1lIC4vYnVpbGQvcWVtdS14
ODZfNjQgLXBsdWdpbiAuL2J1aWxkL2NvbnRyaWIvcGx1Z2lucy9saWJpcHMuc28saXBzPSQo
KCRudW1faW5zbi80KSkgL2Jpbi90cnVlDQo+PiByZWFsIDQuMDAwcw0KPj4NCj4+IEJvb3Qg
YSBMaW51eCBrZXJuZWwgc2ltdWxhdGluZyBhIDI1ME1IeiBjcHU6DQo+PiAkIC9idWlsZC9x
ZW11LXN5c3RlbS14ODZfNjQgLWtlcm5lbCAvYm9vdC92bWxpbnV6LTYuMS4wLTIxLWFtZDY0
IC1hcHBlbmQgImNvbnNvbGU9dHR5UzAiIC1wbHVnaW4gLi9idWlsZC9jb250cmliL3BsdWdp
bnMvbGliaXBzLnNvLGlwcz0kKCgyNTAqMTAwMCoxMDAwKSkgLXNtcCAxIC1tIDUxMg0KPj4g
Y2hlY2sgdGltZSB1bnRpbCBrZXJuZWwgcGFuaWMgb24gc2VyaWFsMA0KPj4NCj4+IFRlc3Rl
ZCBpbiBzeXN0ZW0gbW9kZSBieSBib290aW5nIGEgZnVsbCBkZWJpYW4gc3lzdGVtLCBhbmQg
dXNpbmc6DQo+PiAkIHN5c2JlbmNoIGNwdSBydW4NCj4+IFBlcmZvcm1hbmNlIGRlY3JlYXNl
IGxpbmVhcmx5IHdpdGggdGhlIGdpdmVuIG51bWJlciBvZiBpcHMuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3Jn
Pg0KPj4gTWVzc2FnZS1JZDogPDIwMjQwNTMwMjIwNjEwLjEyNDU0MjQtNy1waWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgIGNvbnRyaWIvcGx1Z2lucy9pcHMu
YyAgICB8IDE2NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
ICAgIGNvbnRyaWIvcGx1Z2lucy9NYWtlZmlsZSB8ICAgMSArDQo+PiAgICAyIGZpbGVzIGNo
YW5nZWQsIDE2NSBpbnNlcnRpb25zKCspDQo+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgY29u
dHJpYi9wbHVnaW5zL2lwcy5jDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2NvbnRyaWIvcGx1Z2lu
cy9pcHMuYyBiL2NvbnRyaWIvcGx1Z2lucy9pcHMuYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLmRiNzc3MjkyNjQNCj4+IC0tLSAvZGV2L251bGwN
Cj4+ICsrKyBiL2NvbnRyaWIvcGx1Z2lucy9pcHMuYw0KPj4gQEAgLTAsMCArMSwxNjQgQEAN
Cj4+ICsvKg0KPj4gKyAqIGlwcyByYXRlIGxpbWl0aW5nIHBsdWdpbi4NCj4gDQo+IFRoZSBw
bHVnaW4gbmFtZXMgYXJlIHJlYWxseSB0byBwYWNrZWQgdG8gbXkgdGFzdGUgKGVhY2ggdGlt
ZSBJIGxvb2sgZm9yDQo+IG9uZSBJIGhhdmUgdG8gb3BlbiBtb3N0IHNvdXJjZSBmaWxlcyB0
byBmaWd1cmUgb3V0IHRoZSBjb3JyZWN0IG9uZSk7IHNvDQo+IHBsZWFzZSBlYXNlIG15IGxp
ZmUgYnkgdXNpbmcgYSBtb3JlIGRlc2NyaXB0aXZlIGhlYWRlciBhdCBsZWFzdDoNCj4gDQo+
ICAgICAgICBJbnN0cnVjdGlvbnMgUGVyIFNlY29uZCAoSVBTKSByYXRlIGxpbWl0aW5nIHBs
dWdpbi4NCj4gDQo+IFRoYW5rcy4NCj4gDQoNCkkgYWdyZWUgbW9zdCBvZiB0aGUgcGx1Z2lu
IG5hbWVzIGFyZSBwcmV0dHkgY3J5cHRpYywgYW5kIHRoZXkgYXJlIA0KbGFja2luZyBhIGNv
bW1vbiAiaGVscCIgc3lzdGVtLCB0byBkZXNjcmliZSB3aGF0IHRoZXkgZG8sIGFuZCB3aGlj
aCANCm9wdGlvbnMgYXJlIGF2YWlsYWJsZSBmb3IgdGhlbS4gSXQncyBkZWZpbml0ZWx5IHNv
bWV0aGluZyB3ZSBjb3VsZCBhZGQgDQppbiB0aGUgZnV0dXJlLg0KDQpSZWdhcmRpbmcgd2hh
dCB5b3UgcmVwb3J0ZWQsIEknbSB0b3RhbGx5IG9rIHdpdGggdGhlIGNoYW5nZS4NCg0KSG93
ZXZlciwgc2luY2UgdGhpcyBpcyBhIG5ldyBzZXJpZXMsIEknbSBub3QgaWYgSSBvciBBbGV4
IHNob3VsZCBjaGFuZ2UgDQppdC4gSWYgaXQncyBvayBmb3IgeW91IHRvIG1vZGlmeSB0aGlz
IEFsZXgsIGl0IGNvdWxkIGJlIHNpbXBsZXIgdGhhbiANCndhaXRpbmcgZm9yIG1lIHRvIHB1
c2ggYSBuZXcgcGF0Y2ggd2l0aCBqdXN0IHRoaXMuDQoNCkxldCBtZSBrbm93IGhvdyB5b3Ug
ZGVhbCB3aXRoIHRoaXMgdXN1YWxseSwgYW5kIEknbGwgZG8gd2hhdCBpcyBuZWVkZWQuDQoN
ClRoYW5rcywNClBpZXJyaWNrDQoNCj4+ICsgKiBUaGlzIHBsdWdpbiBjYW4gYmUgdXNlZCB0
byByZXN0cmljdCB0aGUgZXhlY3V0aW9uIG9mIGEgc3lzdGVtIHRvIGENCj4+ICsgKiBwYXJ0
aWN1bGFyIG51bWJlciBvZiBJbnN0cnVjdGlvbnMgUGVyIFNlY29uZCAoaXBzKS4gVGhpcyBj
b250cm9scw0KPj4gKyAqIHRpbWUgYXMgc2VlbiBieSB0aGUgZ3Vlc3Qgc28gd2hpbGUgd2Fs
bC1jbG9jayB0aW1lIG1heSBiZSBsb25nZXINCj4+ICsgKiBmcm9tIHRoZSBndWVzdHMgcG9p
bnQgb2YgdmlldyB0aW1lIHdpbGwgcGFzcyBhdCB0aGUgbm9ybWFsIHJhdGUuDQo+PiArICoN
Cj4+ICsgKiBUaGlzIHVzZXMgdGhlIG5ldyBwbHVnaW4gQVBJIHdoaWNoIGFsbG93cyB0aGUg
cGx1Z2luIHRvIGNvbnRyb2wNCj4+ICsgKiBzeXN0ZW0gdGltZS4NCj4+ICsgKg0KPj4gKyAq
IENvcHlyaWdodCAoYykgMjAyMyBMaW5hcm8gTHRkDQo+PiArICoNCj4+ICsgKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcg0KPj4gKyAqLw0KPiANCg==
