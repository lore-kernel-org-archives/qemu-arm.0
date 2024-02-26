Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1900213ejf;
        Sun, 25 Feb 2024 23:33:57 -0800 (PST)
X-Received: by 2002:a05:6512:789:b0:512:fb1f:2a43 with SMTP id x9-20020a056512078900b00512fb1f2a43mr1527906lfr.56.1708932837308;
        Sun, 25 Feb 2024 23:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708932837; cv=none;
        d=google.com; s=arc-20160816;
        b=Ln/UM+kGeo+5FJyyh3QepCRS9j8KZXv7Bsn42knrmtYL6r3MY3L5a0S8nM2r0hLASu
         zyYKGQ+4ExEZmyKglpSh9/hvjo9nzqfJUNm8+zMXzkPyOIrwVr9JtPtPL/cxsBiUc7vi
         DO417/6qtK8+qeFk26MyLOyBpbyRtzTCAmoCwXKc9lWVNfSx8v/Oe9oNv0LZHk9YeZzR
         qWc8eEZhNti/Zb7BJpcKkriindpzXjLdw3z4YNW1YamBTTrwffaBKDuYf7YYZReFmwV2
         4QkeHG1vG+e6giQz6t6fMnrtIyHxjjDsr7jbDtKcWvVbWb3MfzTMB+ety+17wuOD7MKQ
         5AYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PqbO8Zo3BK0NNwhfT/8Qo3PiBudESu5zoLxwvaadXDw=;
        fh=rxW3HULOpmFJDTb//j7dIuCzZiS0bSmF7C/qxWwgQvA=;
        b=fWadKayn0qAMglBlQO63LsvRW184h8O2cmTDZWF9Yy2dSdSADdVwqavd6EADuiCoif
         XsVTwMpvCp2PzMa/2BWBXDOfOn6vT8uztyJRj9+5d92sC+WRztST9E0qcL2yCiit8ps7
         0ilVfvgKVXOg//MTOeGDqNrjJELV+DDAodW7zaz5cLCBsWJw7ws0eo24bjutzmhyzGN2
         HV+TSiq9To3b//0wG9N/Ro19PFzqVtuFYTF/BLJDNbX6nAHWMLUqHViLVNFezQYjz/ub
         v3YyEQ4xspxOEOXIeZnSpDuJZhji8Nr280dr8A2lbSqpeRO3S82sMsX2zu4XcvLZJhwA
         kjog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2b84RP3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3-20020a05600c1d0300b004129e8ed737sor902291wms.3.2024.02.25.23.33.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 Feb 2024 23:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2b84RP3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708932836; x=1709537636; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqbO8Zo3BK0NNwhfT/8Qo3PiBudESu5zoLxwvaadXDw=;
        b=a2b84RP3rl84ZcGH/SZ//VtXQcL8Mpqex9FgTGM4mBYsCbo0olLJltmO66JCqld+uh
         lbR/sTmUj+ksk/pIDl67oMv8qfkKz3ULNSMF9uKloALclOMKLU5OfBsKePVd60MliX5w
         7rcGd/kKqD3VTGDPMFhM/v8YImKHjAnxXV7r1n4MCFZgbZ/C+DhlVL+YxfTk4wZ8QaPf
         nai13OueLJVrpPRNUWkbMCTq3SiUfwJ7TkQL7r/wTcCkoL8IVyvZUOD94icOrE2lZ/CW
         CyF5Z8PZIzyUiQks8GAJwXvDDBkNOZp/tT01pkvlQ8MxtomjedI3EMHZZhiJYhm3Nh/I
         bSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708932836; x=1709537636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqbO8Zo3BK0NNwhfT/8Qo3PiBudESu5zoLxwvaadXDw=;
        b=m0aNRyodglex6WesQjh6rZPvcjgVpqh2WWYKhAEd9Lr8kJ47QunaKTB1faP4Qjvkh0
         fGCxuHP5elcQkGZ557L7po3iHh8ZmOxJBggp8te+5/LNcKvILBqSJ8kJiVeqqW1YMvFG
         +jTVX3IRzkqulvNv19LAPa6t5yEu7N2NLcs95GT5ONOZJk9P8gGsx29RWNFCU+U4dkrQ
         n0/ixI0zJjc1C1Jxno5uxpkEPj8kSIJqXRjtXM5guESVsLsO5wFjjK1ctUQN8lncPTmu
         d0Fz6dAljH1o4gwQkik0P2w1fbGvK+wjelpbMULDgb25XWZweunI0NNxTcdtocZCjCjK
         G70Q==
X-Gm-Message-State: AOJu0Yw6wz+GCiYIpRoeTJoTLFo0CbowAFuFNCRygZTm7c8Gp6saKUqC
	ECir8MUCqR6lMSNhRaJArrDTTpMsGC9KQqB5ARIWXB0mVZNO79CKnDhRh8DxO/9wakWlcua76jd
	rp2Bpv7Ee
X-Google-Smtp-Source: AGHT+IFrBUebrGJ/+dWHvzqGw17x7Jzzl5efzz+lCMtJq9RwtHzvsVV6+4muKvwtE0SNOYlTalkZgQ==
X-Received: by 2002:a5d:6b03:0:b0:33d:bb61:71f3 with SMTP id v3-20020a5d6b03000000b0033dbb6171f3mr3490341wrw.12.1708932836209;
        Sun, 25 Feb 2024 23:33:56 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.24] ([102.35.208.160])
        by smtp.gmail.com with ESMTPSA id bx27-20020a5d5b1b000000b0033daa63807fsm7474271wrb.24.2024.02.25.23.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 23:33:55 -0800 (PST)
Message-ID: <969427d2-a954-4603-b4c0-107a47796464@linaro.org>
Date: Mon, 26 Feb 2024 11:33:45 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/27] plugins: create CPUPluginState and migrate
 plugin_mask
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Cleber Rosa <crosa@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
 <20240223162202.1936541-21-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240223162202.1936541-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: LSgxo6cLwu1m

T24gMi8yMy8yNCA4OjIxIFBNLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IFdlIGFyZSBnb2lu
ZyB0byB3YW50IHRvIGtlZXAgdHJhY2sgb2Ygc29tZSBwZXItdkNQVSBkYXRhIGZvciBwbHVn
aW5zDQo+IGFuZCB0aGUgbG9naWNhbCBwbGFjZSB0byBkbyBzbyBpcyBpbiB0cmFjayBpdCBp
biBDUFVTdGF0ZS4gRm9yIG5vdw0KPiB0aGlzIGp1c3QgbW92ZXMgdGhlIHBsdWdpbl9tYXNr
IChyZW5hbWVkIHRvIGV2ZW50X21hc2spIGFzIHRoZSBtZW1vcnkNCj4gY2FsbGJhY2tzIGFy
ZSBhY2Nlc3NlZCBkaXJlY3RseSBieSBUQ0cgZ2VuZXJhdGVkIGNvZGUuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0t
LQ0KPiAgIGluY2x1ZGUvaHcvY29yZS9jcHUuaCAgIHwgMTEgKysrKysrKy0tLS0NCj4gICBp
bmNsdWRlL3FlbXUvcGx1Z2luLmggICB8IDEzICsrKysrKysrKysrKysNCj4gICBpbmNsdWRl
L3FlbXUvdHlwZWRlZnMuaCB8ICAxICsNCj4gICBhY2NlbC90Y2cvcGx1Z2luLWdlbi5jICB8
ICAzICsrLQ0KPiAgIGh3L2NvcmUvY3B1LWNvbW1vbi5jICAgIHwgIDEgKw0KPiAgIHBsdWdp
bnMvY29yZS5jICAgICAgICAgIHwgMTIgKysrKysrKysrLS0tDQo+ICAgNiBmaWxlcyBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvaHcvY29yZS9jcHUuaCBiL2luY2x1ZGUvaHcvY29yZS9jcHUuaA0KPiBp
bmRleCA0YjY1OTc5OWIwMC4uYWYxYTI5NTI2ZDQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUv
aHcvY29yZS9jcHUuaA0KPiArKysgYi9pbmNsdWRlL2h3L2NvcmUvY3B1LmgNCj4gQEAgLTMx
LDcgKzMxLDYgQEANCj4gICAjaW5jbHVkZSAicWVtdS9yY3VfcXVldWUuaCINCj4gICAjaW5j
bHVkZSAicWVtdS9xdWV1ZS5oIg0KPiAgICNpbmNsdWRlICJxZW11L3RocmVhZC5oIg0KPiAt
I2luY2x1ZGUgInFlbXUvcGx1Z2luLWV2ZW50LmgiDQo+ICAgI2luY2x1ZGUgInFvbS9vYmpl
Y3QuaCINCj4gICANCj4gICB0eXBlZGVmIGludCAoKldyaXRlQ29yZUR1bXBGdW5jdGlvbiko
Y29uc3Qgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSwNCj4gQEAgLTQzNCw3ICs0MzMsOCBAQCBz
dHJ1Y3QgcWVtdV93b3JrX2l0ZW07DQo+ICAgICogQGt2bV9mZDogdkNQVSBmaWxlIGRlc2Ny
aXB0b3IgZm9yIEtWTS4NCj4gICAgKiBAd29ya19tdXRleDogTG9jayB0byBwcmV2ZW50IG11
bHRpcGxlIGFjY2VzcyB0byBAd29ya19saXN0Lg0KPiAgICAqIEB3b3JrX2xpc3Q6IExpc3Qg
b2YgcGVuZGluZyBhc3luY2hyb25vdXMgd29yay4NCj4gLSAqIEBwbHVnaW5fbWFzazogUGx1
Z2luIGV2ZW50IGJpdG1hcC4gTW9kaWZpZWQgb25seSB2aWEgYXN5bmMgd29yay4NCj4gKyAq
IEBwbHVnaW5fbWVtX2NiczogYWN0aXZlIHBsdWdpbiBtZW1vcnkgY2FsbGJhY2tzDQo+ICsg
KiBAcGx1Z2luX3N0YXRlOiBwZXItQ1BVIHBsdWdpbiBzdGF0ZQ0KPiAgICAqIEBpZ25vcmVf
bWVtb3J5X3RyYW5zYWN0aW9uX2ZhaWx1cmVzOiBDYWNoZWQgY29weSBvZiB0aGUgTWFjaGlu
ZVN0YXRlDQo+ICAgICogICAgZmxhZyBvZiB0aGUgc2FtZSBuYW1lOiBhbGxvd3MgdGhlIGJv
YXJkIHRvIHN1cHByZXNzIGNhbGxpbmcgb2YgdGhlDQo+ICAgICogICAgQ1BVIGRvX3RyYW5z
YWN0aW9uX2ZhaWxlZCBob29rIGZ1bmN0aW9uLg0KPiBAQCAtNTI2LDEwICs1MjYsMTMgQEAg
c3RydWN0IENQVVN0YXRlIHsNCj4gICAgICAgLyogVXNlIGJ5IGFjY2VsLWJsb2NrOiBDUFUg
aXMgZXhlY3V0aW5nIGFuIGlvY3RsKCkgKi8NCj4gICAgICAgUWVtdUxvY2tDbnQgaW5faW9j
dGxfbG9jazsNCj4gICANCj4gLSAgICBERUNMQVJFX0JJVE1BUChwbHVnaW5fbWFzaywgUUVN
VV9QTFVHSU5fRVZfTUFYKTsNCj4gLQ0KPiAgICNpZmRlZiBDT05GSUdfUExVR0lODQo+ICsg
ICAgLyoNCj4gKyAgICAgKiBUaGUgY2FsbGJhY2sgcG9pbnRlciBzdGF5cyBpbiB0aGUgbWFp
biBDUFVTdGF0ZSBhcyBpdCBpcw0KPiArICAgICAqIGFjY2Vzc2VkIHZpYSBUQ0cgKHNlZSBn
ZW5fZW1wdHlfbWVtX2hlbHBlcikuDQo+ICsgICAgICovDQo+ICAgICAgIEdBcnJheSAqcGx1
Z2luX21lbV9jYnM7DQo+ICsgICAgQ1BVUGx1Z2luU3RhdGUgKnBsdWdpbl9zdGF0ZTsNCj4g
ICAjZW5kaWYNCj4gICANCj4gICAgICAgLyogVE9ETyBNb3ZlIGNvbW1vbiBmaWVsZHMgZnJv
bSBDUFVBcmNoU3RhdGUgaGVyZS4gKi8NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvcWVtdS9w
bHVnaW4uaCBiL2luY2x1ZGUvcWVtdS9wbHVnaW4uaA0KPiBpbmRleCBiMGM1YWM2ODI5My4u
MGU3Yjk2OTNkODAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvcWVtdS9wbHVnaW4uaA0KPiAr
KysgYi9pbmNsdWRlL3FlbXUvcGx1Z2luLmgNCj4gQEAgLTE4Niw2ICsxODYsMTkgQEAgc3Ry
dWN0IHFlbXVfcGx1Z2luX2luc24gKnFlbXVfcGx1Z2luX3RiX2luc25fZ2V0KHN0cnVjdCBx
ZW11X3BsdWdpbl90YiAqdGIsDQo+ICAgICAgIHJldHVybiBpbnNuOw0KPiAgIH0NCj4gICAN
Cj4gKy8qKg0KPiArICogc3RydWN0IENQVVBsdWdpblN0YXRlIC0gcGVyLUNQVSBzdGF0ZSBm
b3IgcGx1Z2lucw0KPiArICogQGV2ZW50X21hc2s6IHBsdWdpbiBldmVudCBiaXRtYXAuIE1v
ZGlmaWVkIG9ubHkgdmlhIGFzeW5jIHdvcmsuDQo+ICsgKi8NCj4gK3N0cnVjdCBDUFVQbHVn
aW5TdGF0ZSB7DQo+ICsgICAgREVDTEFSRV9CSVRNQVAoZXZlbnRfbWFzaywgUUVNVV9QTFVH
SU5fRVZfTUFYKTsNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICogcWVtdV9wbHVnaW5fY3Jl
YXRlX3ZjcHVfc3RhdGU6IGFsbG9jYXRlIHBsdWdpbiBzdGF0ZQ0KPiArICovDQo+ICtDUFVQ
bHVnaW5TdGF0ZSAqIHFlbXVfcGx1Z2luX2NyZWF0ZV92Y3B1X3N0YXRlKHZvaWQpOw0KPiAr
DQo+ICAgdm9pZCBxZW11X3BsdWdpbl92Y3B1X2luaXRfaG9vayhDUFVTdGF0ZSAqY3B1KTsN
Cj4gICB2b2lkIHFlbXVfcGx1Z2luX3ZjcHVfZXhpdF9ob29rKENQVVN0YXRlICpjcHUpOw0K
PiAgIHZvaWQgcWVtdV9wbHVnaW5fdGJfdHJhbnNfY2IoQ1BVU3RhdGUgKmNwdSwgc3RydWN0
IHFlbXVfcGx1Z2luX3RiICp0Yik7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FlbXUvdHlw
ZWRlZnMuaCBiL2luY2x1ZGUvcWVtdS90eXBlZGVmcy5oDQo+IGluZGV4IGQ3YzcwM2I0YWU5
Li5hMDI4ZGJhNGQwYiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9xZW11L3R5cGVkZWZzLmgN
Cj4gKysrIGIvaW5jbHVkZS9xZW11L3R5cGVkZWZzLmgNCj4gQEAgLTQyLDYgKzQyLDcgQEAg
dHlwZWRlZiBzdHJ1Y3QgQ29tcGF0UHJvcGVydHkgQ29tcGF0UHJvcGVydHk7DQo+ICAgdHlw
ZWRlZiBzdHJ1Y3QgQ29uZmlkZW50aWFsR3Vlc3RTdXBwb3J0IENvbmZpZGVudGlhbEd1ZXN0
U3VwcG9ydDsNCj4gICB0eXBlZGVmIHN0cnVjdCBDUFVBZGRyZXNzU3BhY2UgQ1BVQWRkcmVz
c1NwYWNlOw0KPiAgIHR5cGVkZWYgc3RydWN0IENQVUFyY2hTdGF0ZSBDUFVBcmNoU3RhdGU7
DQo+ICt0eXBlZGVmIHN0cnVjdCBDUFVQbHVnaW5TdGF0ZSBDUFVQbHVnaW5TdGF0ZTsNCj4g
ICB0eXBlZGVmIHN0cnVjdCBDcHVJbmZvRmFzdCBDcHVJbmZvRmFzdDsNCj4gICB0eXBlZGVm
IHN0cnVjdCBDUFVKdW1wQ2FjaGUgQ1BVSnVtcENhY2hlOw0KPiAgIHR5cGVkZWYgc3RydWN0
IENQVVN0YXRlIENQVVN0YXRlOw0KPiBkaWZmIC0tZ2l0IGEvYWNjZWwvdGNnL3BsdWdpbi1n
ZW4uYyBiL2FjY2VsL3RjZy9wbHVnaW4tZ2VuLmMNCj4gaW5kZXggYjM3Y2U3NjgzZTYuLmFj
NmI1MmI5ZWM5IDEwMDY0NA0KPiAtLS0gYS9hY2NlbC90Y2cvcGx1Z2luLWdlbi5jDQo+ICsr
KyBiL2FjY2VsL3RjZy9wbHVnaW4tZ2VuLmMNCj4gQEAgLTQzLDYgKzQzLDcgQEANCj4gICAg
KiBDUFUncyBpbmRleCBpbnRvIGEgVENHIHRlbXAsIHNpbmNlIHRoZSBmaXJzdCBjYWxsYmFj
ayBkaWQgaXQgYWxyZWFkeS4NCj4gICAgKi8NCj4gICAjaW5jbHVkZSAicWVtdS9vc2RlcC5o
Ig0KPiArI2luY2x1ZGUgInFlbXUvcGx1Z2luLmgiDQo+ICAgI2luY2x1ZGUgImNwdS5oIg0K
PiAgICNpbmNsdWRlICJ0Y2cvdGNnLmgiDQo+ICAgI2luY2x1ZGUgInRjZy90Y2ctdGVtcC1p
bnRlcm5hbC5oIg0KPiBAQCAtODMxLDcgKzgzMiw3IEBAIGJvb2wgcGx1Z2luX2dlbl90Yl9z
dGFydChDUFVTdGF0ZSAqY3B1LCBjb25zdCBEaXNhc0NvbnRleHRCYXNlICpkYiwNCj4gICB7
DQo+ICAgICAgIGJvb2wgcmV0ID0gZmFsc2U7DQo+ICAgDQo+IC0gICAgaWYgKHRlc3RfYml0
KFFFTVVfUExVR0lOX0VWX1ZDUFVfVEJfVFJBTlMsIGNwdS0+cGx1Z2luX21hc2spKSB7DQo+
ICsgICAgaWYgKHRlc3RfYml0KFFFTVVfUExVR0lOX0VWX1ZDUFVfVEJfVFJBTlMsIGNwdS0+
cGx1Z2luX3N0YXRlLT5ldmVudF9tYXNrKSkgew0KPiAgICAgICAgICAgc3RydWN0IHFlbXVf
cGx1Z2luX3RiICpwdGIgPSB0Y2dfY3R4LT5wbHVnaW5fdGI7DQo+ICAgICAgICAgICBpbnQg
aTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2h3L2NvcmUvY3B1LWNvbW1vbi5jIGIvaHcvY29y
ZS9jcHUtY29tbW9uLmMNCj4gaW5kZXggNjg3ODYzNjBlYTUuLjZhOGMyOTBmYzc1IDEwMDY0
NA0KPiAtLS0gYS9ody9jb3JlL2NwdS1jb21tb24uYw0KPiArKysgYi9ody9jb3JlL2NwdS1j
b21tb24uYw0KPiBAQCAtMjI0LDYgKzIyNCw3IEBAIHN0YXRpYyB2b2lkIGNwdV9jb21tb25f
cmVhbGl6ZWZuKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4gICANCj4gICAg
ICAgLyogUGx1Z2luIGluaXRpYWxpemF0aW9uIG11c3Qgd2FpdCB1bnRpbCB0aGUgY3B1IHN0
YXJ0IGV4ZWN1dGluZyBjb2RlICovDQo+ICAgICAgIGlmICh0Y2dfZW5hYmxlZCgpKSB7DQo+
ICsgICAgICAgIGNwdS0+cGx1Z2luX3N0YXRlID0gcWVtdV9wbHVnaW5fY3JlYXRlX3ZjcHVf
c3RhdGUoKTsNCj4gICAgICAgICAgIGFzeW5jX3J1bl9vbl9jcHUoY3B1LCBxZW11X3BsdWdp
bl92Y3B1X2luaXRfX2FzeW5jLCBSVU5fT05fQ1BVX05VTEwpOw0KPiAgICAgICB9DQo+ICAg
DQo+IGRpZmYgLS1naXQgYS9wbHVnaW5zL2NvcmUuYyBiL3BsdWdpbnMvY29yZS5jDQo+IGlu
ZGV4IDIzOTJiYmI4ODg5Li44Mzc0NTY2M2YzMiAxMDA2NDQNCj4gLS0tIGEvcGx1Z2lucy9j
b3JlLmMNCj4gKysrIGIvcGx1Z2lucy9jb3JlLmMNCj4gQEAgLTE3LDYgKzE3LDcgQEANCj4g
ICAjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPiAgICNpbmNsdWRlICJxZW11L2xvY2thYmxl
LmgiDQo+ICAgI2luY2x1ZGUgInFlbXUvb3B0aW9uLmgiDQo+ICsjaW5jbHVkZSAicWVtdS9w
bHVnaW4uaCINCj4gICAjaW5jbHVkZSAicWVtdS9yY3VfcXVldWUuaCINCj4gICAjaW5jbHVk
ZSAicWVtdS94eGhhc2guaCINCj4gICAjaW5jbHVkZSAicWVtdS9yY3UuaCINCj4gQEAgLTUz
LDcgKzU0LDcgQEAgc3RydWN0IHFlbXVfcGx1Z2luX2N0eCAqcGx1Z2luX2lkX3RvX2N0eF9s
b2NrZWQocWVtdV9wbHVnaW5faWRfdCBpZCkNCj4gICANCj4gICBzdGF0aWMgdm9pZCBwbHVn
aW5fY3B1X3VwZGF0ZV9fYXN5bmMoQ1BVU3RhdGUgKmNwdSwgcnVuX29uX2NwdV9kYXRhIGRh
dGEpDQo+ICAgew0KPiAtICAgIGJpdG1hcF9jb3B5KGNwdS0+cGx1Z2luX21hc2ssICZkYXRh
Lmhvc3RfdWxvbmcsIFFFTVVfUExVR0lOX0VWX01BWCk7DQo+ICsgICAgYml0bWFwX2NvcHko
Y3B1LT5wbHVnaW5fc3RhdGUtPmV2ZW50X21hc2ssICZkYXRhLmhvc3RfdWxvbmcsIFFFTVVf
UExVR0lOX0VWX01BWCk7DQo+ICAgICAgIHRjZ19mbHVzaF9qbXBfY2FjaGUoY3B1KTsNCj4g
ICB9DQo+ICAgDQo+IEBAIC0yMDgsNiArMjA5LDExIEBAIHBsdWdpbl9yZWdpc3Rlcl9jYl91
ZGF0YShxZW11X3BsdWdpbl9pZF90IGlkLCBlbnVtIHFlbXVfcGx1Z2luX2V2ZW50IGV2LA0K
PiAgICAgICBkb19wbHVnaW5fcmVnaXN0ZXJfY2IoaWQsIGV2LCBmdW5jLCB1ZGF0YSk7DQo+
ICAgfQ0KPiAgIA0KPiArQ1BVUGx1Z2luU3RhdGUgKiBxZW11X3BsdWdpbl9jcmVhdGVfdmNw
dV9zdGF0ZSh2b2lkKQ0KPiArew0KPiArICAgIHJldHVybiBnX25ldzAoQ1BVUGx1Z2luU3Rh
dGUsIDEpOw0KPiArfQ0KPiArDQo+ICAgdm9pZCBxZW11X3BsdWdpbl92Y3B1X2luaXRfaG9v
ayhDUFVTdGF0ZSAqY3B1KQ0KPiAgIHsNCj4gICAgICAgYm9vbCBzdWNjZXNzOw0KPiBAQCAt
MzU2LDcgKzM2Miw3IEBAIHFlbXVfcGx1Z2luX3ZjcHVfc3lzY2FsbChDUFVTdGF0ZSAqY3B1
LCBpbnQ2NF90IG51bSwgdWludDY0X3QgYTEsIHVpbnQ2NF90IGEyLA0KPiAgICAgICBzdHJ1
Y3QgcWVtdV9wbHVnaW5fY2IgKmNiLCAqbmV4dDsNCj4gICAgICAgZW51bSBxZW11X3BsdWdp
bl9ldmVudCBldiA9IFFFTVVfUExVR0lOX0VWX1ZDUFVfU1lTQ0FMTDsNCj4gICANCj4gLSAg
ICBpZiAoIXRlc3RfYml0KGV2LCBjcHUtPnBsdWdpbl9tYXNrKSkgew0KPiArICAgIGlmICgh
dGVzdF9iaXQoZXYsIGNwdS0+cGx1Z2luX3N0YXRlLT5ldmVudF9tYXNrKSkgew0KPiAgICAg
ICAgICAgcmV0dXJuOw0KPiAgICAgICB9DQo+ICAgDQo+IEBAIC0zNzgsNyArMzg0LDcgQEAg
dm9pZCBxZW11X3BsdWdpbl92Y3B1X3N5c2NhbGxfcmV0KENQVVN0YXRlICpjcHUsIGludDY0
X3QgbnVtLCBpbnQ2NF90IHJldCkNCj4gICAgICAgc3RydWN0IHFlbXVfcGx1Z2luX2NiICpj
YiwgKm5leHQ7DQo+ICAgICAgIGVudW0gcWVtdV9wbHVnaW5fZXZlbnQgZXYgPSBRRU1VX1BM
VUdJTl9FVl9WQ1BVX1NZU0NBTExfUkVUOw0KPiAgIA0KPiAtICAgIGlmICghdGVzdF9iaXQo
ZXYsIGNwdS0+cGx1Z2luX21hc2spKSB7DQo+ICsgICAgaWYgKCF0ZXN0X2JpdChldiwgY3B1
LT5wbHVnaW5fc3RhdGUtPmV2ZW50X21hc2spKSB7DQo+ICAgICAgICAgICByZXR1cm47DQo+
ICAgICAgIH0NCj4gICANCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
