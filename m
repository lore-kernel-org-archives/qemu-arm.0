Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2142341njc;
        Mon, 22 Jul 2024 14:06:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzLaCkhXeVqefw+e8cgLcwDd3BVSI1gTRnerD3i1ZMD9UiOo9+qjsA8PjR0rkWwfawelEbYLm3V0JJ1i+uACH9WklwQlRM
X-Received: by 2002:a05:6a00:b95:b0:706:aa4b:4 with SMTP id d2e1a72fcca58-70e808ca1admr161883b3a.13.1721682399650;
        Mon, 22 Jul 2024 14:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721682399; cv=none;
        d=google.com; s=arc-20160816;
        b=W/AZQWBQM+Pv8ZF+NmtoQuqa2/42j2mxWLfTcJfqEfM1CV6758pJ0Ah0MN73rUdiff
         MLh7MUIxcfVT6sKOmLe6IUwNG+pLFNWchfsvX4NR4SHQhpx5G0FCoepnhIorEOOIU3sf
         YiHWBJcT4qDsaSM402xbWxlb2xFDJiGwUKOAY/akoUF7+8Bk7Yj8X6zb6yrNFBkq8K5c
         XyAh5cDz3Vg00xKTowWH4c5sXJSqhlmdLmMSDo/0Ct2VyThvKL+F/wOiUBUycBKLRqAG
         KGc1mbVhM+/Zx53ChWSkdeO4SSyUrREwo28Ur/KunAWXNP4sEMR3jRCP6PdNFjK5HxYH
         bbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UB6eO4FcPoJrCez5ip8Kw5mmYIX9y2zndxgDFU+HaPQ=;
        fh=/nObIgZBKQVeKPvkZVmOFc47I1VgbVdxjpUA9w3ZHSY=;
        b=dO+6SDWzKPbJwz4BUNmIt7XH1Rd6qF6biVW8hg98oSZ6OyJyptM2EnIVfkS7janPEb
         0xipWUVW0hEFaBhM9FiURNPvJXy1/nWup2QTwzkc3N2Wh+R7QGY+4KCKhGRwa9HjfMbn
         qxPVofuqRUdIPJkuyKWjKhjAJ4D/ew+kY0vCPfISmg3MJm9g3SD3ghZrwTAbT+q7QBQo
         9ElO2ypjvWoyz4b7RBCBKbk8wxVZgyNnv3LwMAU2zrZB0MMQatYxv84WIg6/yWR7zztW
         iDIUTbRw98xbyUyEfhfaoLtOVen0B5lxVrCcCqLOu+0ftsD2quYe/uubVx+IRB1wVuDH
         0nwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjsHqchP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70d145705f5sor1842876b3a.5.2024.07.22.14.06.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjsHqchP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721682399; x=1722287199; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UB6eO4FcPoJrCez5ip8Kw5mmYIX9y2zndxgDFU+HaPQ=;
        b=CjsHqchP/nvMioOSXfmIyy8vN9boTASkVi/Pgj6X67dOvL/sw5IP34CgCXvUVvLVfS
         +izJPRB5cbDURzNNTZ45gjNZ/XIKyLLBHrhoTLCZ9BdTH6x7vhCmU3hwRk0GcS7SZ6BQ
         nhwC6g7Xt3g1xcdheGMXwWNak1FlIFy+giEa8+XKESOGJyhAE13aw/aWNui+FGndVbag
         Lc/I43ZbZygyNR2xCktgEStdFbjwjeAAn4y0+rzzWPK0bZ9b3CUUFU0zVdrIFRPHW63t
         2Fy3wNkGvbxSqEVGURMMe8C9kxPHwcgGbqk1LvaSam/BkEgiwFM259aEw4jlCFECYS1s
         QCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682399; x=1722287199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UB6eO4FcPoJrCez5ip8Kw5mmYIX9y2zndxgDFU+HaPQ=;
        b=Wk6c8AjonoHgkB4cjhQH3fanJhFP9vJWVw+VvJQIuYGLGkJwB1a6G7NV1IuCfFF8SE
         GxGeOLqq+gjlphVHk+TZX43wNCk/YkSQaIensp50a3QO5fb8yliE3PsttX4VuICxLTmf
         AWUml//G3GeEH/OC1XXXONWZnHlKpfr4pB0vOdOa+uwzdED/Fg7Qtdtz4ZQ62cpMRRWt
         fwJQBk+tmTQppViy3U+KO6+On8+OPVzesKd+sRCShQ0lq6zj+owh2X5/wzBouLHOGvy3
         NE2UYfhehYb2ySF/VqFQU74AW3/mDnN4qFYANcRRymhuYzBerKc/xipW62cnHs8S4je2
         SdSg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Cb2a3Knn0nFd0Ax6+jtDZ8BE3v/PbAKYH/Qvqf+IH5WQ2zK5BOf8rjEJOP2STrS95Q9rfj6m6mGumY/QNvQFtMvdTgf4
X-Gm-Message-State: AOJu0YzbeHQts1mLMV8q7Bl7lnCpphQnfofKOpL3J9j/C6WZHjz9461m
	dEguqFn61v1JmbOcLpLoK0LUhpSj/As1+9mjLT/jZ/v6NBJcwG/pgtZ3qKOb8144Sw==
X-Google-Smtp-Source: AGHT+IEHq+xmtrwaQfWd2GC52kSOwzJKbP2pNFkVJovKk68Ta78eMziWAdz8AlA9Uo+CUAwg7B2IMA==
X-Received: by 2002:a17:90a:dd88:b0:2c9:7343:71f1 with SMTP id 98e67ed59e1d1-2cd8d10950bmr161112a91.14.1721682399086;
        Mon, 22 Jul 2024 14:06:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb77540a6esm8596504a91.54.2024.07.22.14.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:06:38 -0700 (PDT)
Message-ID: <03c5a36d-1bf8-40ae-ae8e-fc3f825af903@linaro.org>
Date: Mon, 22 Jul 2024 14:06:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] util/fifo8: Use fifo8_reset() in fifo8_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240722160745.67904-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 7HKef+Dt9Kop

T24gNy8yMi8yNCAwOTowNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IEF2
b2lkIG9wZW4tY29kaW5nIGZpZm84X3Jlc2V0KCkgaW4gZmlmbzhfY3JlYXRlKCkuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFy
by5vcmc+DQo+IFJldmlld2VkLWJ5OiBNYXJrIENhdmUtQXlsYW5kIDxtYXJrLmNhdmUtYXls
YW5kQGlsYW5kZS5jby51az4NCj4gLS0tDQo+ICAgdXRpbC9maWZvOC5jIHwgMTUgKysrKysr
Ky0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS91dGlsL2ZpZm84LmMgYi91dGlsL2ZpZm84
LmMNCj4gaW5kZXggNGUwMWI1MzJkOS4uMjkyNWZlNTYxMSAxMDA2NDQNCj4gLS0tIGEvdXRp
bC9maWZvOC5jDQo+ICsrKyBiL3V0aWwvZmlmbzguYw0KPiBAQCAtMTYsMTIgKzE2LDE3IEBA
DQo+ICAgI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRlLmgiDQo+ICAgI2luY2x1ZGUgInFl
bXUvZmlmbzguaCINCj4gICANCj4gK3ZvaWQgZmlmbzhfcmVzZXQoRmlmbzggKmZpZm8pDQo+
ICt7DQo+ICsgICAgZmlmby0+bnVtID0gMDsNCj4gKyAgICBmaWZvLT5oZWFkID0gMDsNCj4g
K30NCj4gKw0KPiAgIHZvaWQgZmlmbzhfY3JlYXRlKEZpZm84ICpmaWZvLCB1aW50MzJfdCBj
YXBhY2l0eSkNCj4gICB7DQo+ICAgICAgIGZpZm8tPmRhdGEgPSBnX25ldyh1aW50OF90LCBj
YXBhY2l0eSk7DQo+ICAgICAgIGZpZm8tPmNhcGFjaXR5ID0gY2FwYWNpdHk7DQo+IC0gICAg
Zmlmby0+aGVhZCA9IDA7DQo+IC0gICAgZmlmby0+bnVtID0gMDsNCj4gKyAgICBmaWZvOF9y
ZXNldChmaWZvKTsNCj4gICB9DQo+ICAgDQo+ICAgdm9pZCBmaWZvOF9kZXN0cm95KEZpZm84
ICpmaWZvKQ0KPiBAQCAtOTcsMTIgKzEwMiw2IEBAIGNvbnN0IHVpbnQ4X3QgKmZpZm84X3Bv
cF9idWYoRmlmbzggKmZpZm8sIHVpbnQzMl90IG1heCwgdWludDMyX3QgKm51bXB0cikNCj4g
ICAgICAgcmV0dXJuIGZpZm84X3BlZWtwb3BfYnVmKGZpZm8sIG1heCwgbnVtcHRyLCB0cnVl
KTsNCj4gICB9DQo+ICAgDQo+IC12b2lkIGZpZm84X3Jlc2V0KEZpZm84ICpmaWZvKQ0KPiAt
ew0KPiAtICAgIGZpZm8tPm51bSA9IDA7DQo+IC0gICAgZmlmby0+aGVhZCA9IDA7DQo+IC19
DQo+IC0NCj4gICBib29sIGZpZm84X2lzX2VtcHR5KEZpZm84ICpmaWZvKQ0KPiAgIHsNCj4g
ICAgICAgcmV0dXJuIChmaWZvLT5udW0gPT0gMCk7DQoNClJldmlld2VkLWJ5OiBQaWVycmlj
ayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
