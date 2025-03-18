Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3103497njb;
        Tue, 18 Mar 2025 10:50:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX915RA5G44mOWbCfvmHS9Gmd7lV8j/R13wmQdYxhLQjhqq5WxoOKdbgguu/PY6BYC8wJxW/rC7QTrA4A==@linaro.org
X-Received: by 2002:a05:6a00:17a0:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-7376c167917mr65888b3a.12.1742320214990;
        Tue, 18 Mar 2025 10:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742320214; cv=none;
        d=google.com; s=arc-20240605;
        b=GKJTJMzvrALUjLr70yGf/ILWmMUNjk1WwTrYCB4T6dg0g0b5qiMUtj3SINzReRzMaB
         GLcTODW8JlhJShziNzZ3tkcGyYqfMYhVt2Nvzcfvkcf3vxjcblpKLnYjtZ8JqCLVeYG4
         WLF44MQGJ48MIXXUoB7gSAMK+CqLDd7U60/fSRbxbOO2HYvpeixcz2koSMaSI/3lGx+D
         0Mfcz/1yFPOuuZ3T5lEZrYjFoG5WknvgWkgj0dRCDoZ22EvMz3n3Mdji3UjzzPEqrrle
         d+BDXsn0jeg7qq74+PA2sL/3dMO5kZITB5qYRnuM8Hrgq8Qi3MCXe+baUHYsznUSuq8I
         A1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b1xKnKy4CGJ/XdKVe9sQQOXwvKQLk6WAfJQbJ8AYkec=;
        fh=d5fOnyIjMJwML/No54zcyxDVcZZvZLLj6K41/PsiAys=;
        b=WTpneVAuGaRLoIAV91BjbeOj2/C1g/DVYhsV169wkOHzj+ZzuEbCeYDvkrK2rmGuan
         3+mTGM32RFrLP4G0SzujqtU6BHTICEI/d+3UU//yE4tRrLR9yhWMrW9OC9hOwa3QHg0O
         WbnudCxMQUpIRPJS6i66+moPu5iXQa+1paZJ3xtey32Gk/H5xGBOhY1N7xTxqLxuAVty
         mC5cEwEK18LxVLJbvocFx7qB88ZjHinYzeO17HTCnwHZg5/L1hr7wVJByIozZiOrgLBE
         mGN9MA8Fm/Udl2rGoTSGdVQ+AMxAPmOk7du2+KVLgzpQrIUV5jHuTb4qsnekHye/GLOu
         DDkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ptCvsP1N;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af56ea6ec5csor6065225a12.6.2025.03.18.10.50.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 10:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ptCvsP1N;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742320214; x=1742925014; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1xKnKy4CGJ/XdKVe9sQQOXwvKQLk6WAfJQbJ8AYkec=;
        b=ptCvsP1N73mc5in85A10wYk7Ch9yif9oVxS1QxVRqV9AyUdASkaxFEhtYq6m3398In
         3LZIot2EXgPmGog1RalQcTHi9YzH5vdZs8dIGw3pxZjOhbztX4rHEJFKrs732T+oj8mC
         n3o1nkkNdwW6XtFXNTVcOaTAZmIhcbMdQha8P5sAu/zR2NKurr2CQkWBwesav4AO8rxH
         cT4j5sv7SCXtCF2FgVaXniOiOk2ql0SVJt7Gf6kcuL7bJm+V4tFgtgpEU2xPOS/Ho9iX
         VoRaaTg3cw8NXmn09o2tAnjYpx4yuAkg2Gi3k4upLX0yK/x2ZjYACilTZjr1yReU6LdU
         mZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320214; x=1742925014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1xKnKy4CGJ/XdKVe9sQQOXwvKQLk6WAfJQbJ8AYkec=;
        b=l4jxanKb6pUbYT6qpxAXI/aJsVH1sW5X/4oTR0DGcucbIS//4HmpTqHnAq/vy32A3s
         1HGziHzs0ooTxbt8M/3LgRtlbsTMI5qiil+pJ0EMgYDE92DDfuniLYMAXdalr1X3okKU
         Wj4z+fMAzNpFoD6PaT9AzRqfrPZiXue2yJJJh6Wn4c4kwNuyaevHxLdwI5Q0fdVOuaGg
         7PgPk4jFDr90LSw0M1rwMZ5c9uhQOh193SeVcK7tAPYlFbdR+tg7bqQHbzowSc14XUZp
         JziSctdEykIrVyPsGP0lz/tmwOSTXN50Eb45ye4YKdm4AkkIpnZ51/c7BG2fu+QXoUcz
         8XHA==
X-Forwarded-Encrypted: i=1; AJvYcCXwNi9n8H/i7XqNx2VMZmz0gpjDSmdZ2f6yldv5WPjtylQk6rm3JbXjaTkUsjx1P5Y7OXE663sUMYpBUw==@linaro.org
X-Gm-Message-State: AOJu0Yzc732MscrjlR/EJQGBDG0Ft4HsSjdzah9YXjr5HhoyMVLzJefz
	xdDc+x5u1cmqOod+AwKhy4nd3d5rB0/dAwfyuSj8H6T6CXQwJ5DEmH6Sp/+2x44YWw==
X-Gm-Gg: ASbGncveyya05xlUCAU2gBvIiUowge1faeZ5SNvdhIxI3FGelLW9i/KMWdJuAuGkofu
	3b/MsJKulBuCl9sEYoNPV3ReJRrhlBvB+aSa+BJQ9WzgQnBBm0LJnJsmffLRkVAckrmanjeyRDV
	1FIzX+LtjTB3QjeY+WvuP0VXOHogGK9ewnjxw08MRnN0mUeDyJSeuhJuCabFrXi1V/UQVIO/I44
	PXGqPRJBoecQEEXwHZOrgjmBWHRXy8DfFxnCAiE6M7wv46xXGFPFLBSFSUN4jb4M0yoK8SuLpfm
	0u7KShjjspK15AXb0ap0k/nk5hhCqUvOgmEmKAN8wzjSIOSLQdbmGbu8+w==
X-Google-Smtp-Source: AGHT+IH78tif7R6gzXurAW0XZxtmFJkJ2vsvt+xbpOCzQtnizanOa49k0QkDmETa9oq+SboQl1/F7w==
X-Received: by 2002:a17:90b:3142:b0:301:1d03:93b3 with SMTP id 98e67ed59e1d1-301ba143043mr108818a91.22.1742320214477;
        Tue, 18 Mar 2025 10:50:14 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3015351961csm8531313a91.14.2025.03.18.10.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 10:50:14 -0700 (PDT)
Message-ID: <dba359a9-0e9a-471c-a34c-d4aefbf21ccb@linaro.org>
Date: Tue, 18 Mar 2025 10:50:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org>
 <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: vDCWx6RiDYy/

T24gMy8xOC8yNSAxMDo0MiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE4LzMvMjUgMDU6NTEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBEaXJlY3RseSBj
b25kaXRpb24gYXNzb2NpYXRlZCBjYWxscyBpbiB0YXJnZXQvYXJtL2hlbHBlci5jIGZvciBu
b3cuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2su
Ym91dmllckBsaW5hcm8ub3JnPg0KPj4gLS0tDQo+PiAgICB0YXJnZXQvYXJtL2NwdS5oICAg
IHwgOCAtLS0tLS0tLQ0KPj4gICAgdGFyZ2V0L2FybS9oZWxwZXIuYyB8IDYgKysrKysrDQo+
PiAgICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9jcHUuaCBiL3RhcmdldC9hcm0vY3B1
LmgNCj4+IGluZGV4IDUxYjY0MjhjZmVjLi45MjA1Y2JkZWM0MyAxMDA2NDQNCj4+IC0tLSBh
L3RhcmdldC9hcm0vY3B1LmgNCj4+ICsrKyBiL3RhcmdldC9hcm0vY3B1LmgNCj4+IEBAIC0x
MjIyLDcgKzEyMjIsNiBAQCBpbnQgYXJtX2NwdV93cml0ZV9lbGYzMl9ub3RlKFdyaXRlQ29y
ZUR1bXBGdW5jdGlvbiBmLCBDUFVTdGF0ZSAqY3MsDQo+PiAgICAgKi8NCj4+ICAgIHZvaWQg
YXJtX2VtdWxhdGVfZmlybXdhcmVfcmVzZXQoQ1BVU3RhdGUgKmNwdXN0YXRlLCBpbnQgdGFy
Z2V0X2VsKTsNCj4+ICAgIA0KPj4gLSNpZmRlZiBUQVJHRVRfQUFSQ0g2NA0KPj4gICAgaW50
IGFhcmNoNjRfY3B1X2dkYl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcHUsIEdCeXRlQXJy
YXkgKmJ1ZiwgaW50IHJlZyk7DQo+PiAgICBpbnQgYWFyY2g2NF9jcHVfZ2RiX3dyaXRlX3Jl
Z2lzdGVyKENQVVN0YXRlICpjcHUsIHVpbnQ4X3QgKmJ1ZiwgaW50IHJlZyk7DQo+PiAgICB2
b2lkIGFhcmNoNjRfc3ZlX25hcnJvd192cShDUFVBUk1TdGF0ZSAqZW52LCB1bnNpZ25lZCB2
cSk7DQo+PiBAQCAtMTI1NCwxMyArMTI1Myw2IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3Qg
KnN2ZV9ic3dhcDY0KHVpbnQ2NF90ICpkc3QsIHVpbnQ2NF90ICpzcmMsIGludCBucikNCj4+
ICAgICNlbmRpZg0KPj4gICAgfQ0KPj4gICAgDQo+PiAtI2Vsc2UNCj4+IC1zdGF0aWMgaW5s
aW5lIHZvaWQgYWFyY2g2NF9zdmVfbmFycm93X3ZxKENQVUFSTVN0YXRlICplbnYsIHVuc2ln
bmVkIHZxKSB7IH0NCj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgYWFyY2g2NF9zdmVfY2hhbmdl
X2VsKENQVUFSTVN0YXRlICplbnYsIGludCBvLA0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW50IG4sIGJvb2wgYSkNCj4+IC17IH0NCj4+IC0jZW5k
aWYNCj4+IC0NCj4+ICAgIHZvaWQgYWFyY2g2NF9zeW5jXzMyX3RvXzY0KENQVUFSTVN0YXRl
ICplbnYpOw0KPj4gICAgdm9pZCBhYXJjaDY0X3N5bmNfNjRfdG9fMzIoQ1BVQVJNU3RhdGUg
KmVudik7DQo+PiAgICANCj4+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2hlbHBlci5jIGIv
dGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4gaW5kZXggYjQ2YjJiZmZjZjMuLjc3NGUxZWUwMjQ1
IDEwMDY0NA0KPj4gLS0tIGEvdGFyZ2V0L2FybS9oZWxwZXIuYw0KPj4gKysrIGIvdGFyZ2V0
L2FybS9oZWxwZXIuYw0KPj4gQEAgLTY1NjIsNyArNjU2Miw5IEBAIHN0YXRpYyB2b2lkIHpj
cl93cml0ZShDUFVBUk1TdGF0ZSAqZW52LCBjb25zdCBBUk1DUFJlZ0luZm8gKnJpLA0KPj4g
ICAgICAgICAqLw0KPj4gICAgICAgIG5ld19sZW4gPSBzdmVfdnFtMV9mb3JfZWwoZW52LCBj
dXJfZWwpOw0KPj4gICAgICAgIGlmIChuZXdfbGVuIDwgb2xkX2xlbikgew0KPj4gKyNpZmRl
ZiBUQVJHRVRfQUFSQ0g2NA0KPiANCj4gV2hhdCBhYm91dCB1c2luZyBydW50aW1lIGNoZWNr
IGluc3RlYWQ/DQo+IA0KPiAgICBpZiAoYXJtX2ZlYXR1cmUoJmNwdS0+ZW52LCBBUk1fRkVB
VFVSRV9BQVJDSDY0KSAmJiBuZXdfbGVuIDwgb2xkX2xlbikgew0KPiANCg0KVGhpcyBpcyB0
aGUgcmlnaHQgd2F5IHRvIGRlYWwgd2l0aCBpdCwgYnV0IEkgd291bGQgcHJlZmVyIHRvIGRv
IGl0IHdoZW4gDQp0aGUgY29uY2VybmVkIGZpbGUgKHRhcmdldC9hcm0vaGVscGVyLmMpIHdp
bGwgYmUgbW9kaWZpZWQsIGluIGEgZnV0dXJlIA0Kc2VyaWVzLg0KDQpUaGUgY3VycmVudCBv
bmUgZm9jdXNlcyBvbiBody9hcm0gYW5kICJwdXNoZXMgYmFjayIgZGVwZW5kZW5jaWVzIGlu
IA0Kb3RoZXIgcGxhY2VzLCB0aGF0IHdlIGNhbiBkZWFsIHdpdGggbGF0ZXIuDQoNCk5vdGhp
bmcgd3Jvbmcgd2l0aCB0aGUgY2hhbmdlIHByb3Bvc2VkLCBqdXN0IHRyeWluZyB0byBmb2N1
cyBvbiB0aGUgDQptaW5pbWFsIHNldCBuZWVkZWQgdG8gcmVhY2ggdGhlIGdvYWwsIHdpdGhv
dXQgYW55IGRldG91ci4NCg0KPj4gICAgICAgICAgICBhYXJjaDY0X3N2ZV9uYXJyb3dfdnEo
ZW52LCBuZXdfbGVuICsgMSk7DQo+PiArI2VuZGlmDQo+PiAgICAgICAgfQ0KPj4gICAgfQ0K
PiANCg0K
