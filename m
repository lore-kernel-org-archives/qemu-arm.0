Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp316974njl;
        Tue, 1 Oct 2024 09:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ3Xaa4Nj057D9xlny+dD7aD2NlsJua7sYmOH65SUk1IkpgwBLRAt0w+6abkRNAYdkBPl7wpdCrj2Scg==@linaro.org
X-Received: by 2002:a05:6a20:c886:b0:1d4:e4eb:73e2 with SMTP id adf61e73a8af0-1d5db129330mr651815637.13.1727801505939;
        Tue, 01 Oct 2024 09:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801505; cv=none;
        d=google.com; s=arc-20240605;
        b=I0Lf2b31cUMHo2NVk7yS7tKfmtIS6wf9mIduR1Fr0S87GB45Ojap4Qc38J+QdU0NqF
         VhvNT0K5392WUqPjp9DC+flNVqUenkweuM3NrP/cguAe790smif+QxiuIsVv305ADXJr
         a6XZmt+lPvCkwo+iG7G6Xv4dAGEELvsQASil1xjGy+oGJ9GyPmJTnnR1O0XJ9HKBQPXB
         /g5bS5VuJsfCFyFcP1GWUqZ+O3Kv3RWHdC22pMxSVilDbJuNCyhkEEMvkSXstM8j+Cxn
         ZzpzVbvceOYjoxZm2XqDi9Tma9khhwRZVvy/45dArWz2GJ1o8Qfu5oZyNYMos6fwPkTm
         H77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZxUb89UEgr8+F/1ANN0knUMlzDPHNk6lVEUfsVPaNHU=;
        fh=04ub12OwEJTQG+HVBPo5ZlJ+wHC04cxDcH8OEqjrKlI=;
        b=MkkMsgOiYiD8xoqRBr6yctSOe+eyIjydG4/t0x7ZvuulsXohtuaTYGJYODXyOSwCuN
         XmhHf9kFr1jf0+YObNIwRZGN/oGJ0oGGs3XWVL1goUh65LTmC57Urgg4DznSFmHT1zhM
         U/vNYhH+q04TcEN0cSrkjglGRSrgc2soHXEyON/sbelu+GGzc8SY1huip/T15pJzACuu
         QlLaq/dDok96fQthT5MYVBC4DPTm8+rcCqr4unQL2TvN49qdRdz52v5A0PU87GFLKYfX
         rNsvl2fAgNqMFAXWNBQdhFsWBaRiiF9jOa+Nrcp2sjjDdcus/qrQLJs0tqzI2HkkS27P
         0HZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dpm5dPl6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71b2651c6edsor7617924b3a.7.2024.10.01.09.51.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dpm5dPl6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801505; x=1728406305; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxUb89UEgr8+F/1ANN0knUMlzDPHNk6lVEUfsVPaNHU=;
        b=Dpm5dPl6cWBu4VbS0w+53ury+cJzGuKLjfw2IhK0C1mlAon7UHsv990Rcz2S1n+TrF
         Y98fCZMe0lE6BCCkDoQBn/wD58MhauArP64FzvrfRsxxmbxjkIkATdDpNIEF/d8eZ1Ve
         OSXkFN/vqnO5RRadKzp6AjoGswfKD0L3Pv9aCrbLHAAqvatBYYWK68IFcqeCzfW5pVAa
         Xn/KFNiyKbyhCHePpAfl9UcyqH3P2g1FogjVqQzn3MlEhva5Z2U0EBgH21iZjE8KCmIl
         AgbbA65H4So+ZACgTNFJLYHTuhIM2dDthNvrCzdptwNBPfM9eh7w4SJZHfwWjftYgA+6
         5Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801505; x=1728406305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxUb89UEgr8+F/1ANN0knUMlzDPHNk6lVEUfsVPaNHU=;
        b=OH2jqIjiMZwIzV5ZMp4SOQY4yq0cyBNu813wcF/yzRcA3B4RcN9rAJmxDbZDLBNgm/
         Ol1C7iptlPcfL5YS0q1gQwx6htLYkl0eh5rD7rx6TYx0NRVV7oY+bLaP24J8M8GZWDmd
         IkmFhZBQMf4IFD/2JJiq8iWuYNKOjAQs051/REj6DduChQJrQO+P4WcCLu/ftqMBhpp+
         9XMu+KVwBvRtqhHYA47XdZRoFyNJaPRlrlW+cGRalqID+QdCjAHJXdaGOB+VuoavvpA8
         pyBsyeUEa3L+sAndHm9aAM5Tqlrjson+AyH2raa3GpAGZq1qHIhy46r+vxpeig+hgIr9
         mTXg==
X-Forwarded-Encrypted: i=1; AJvYcCUPfht3ACp7u88l12ICwFFerwsB1f0d7EKomYkfgiupKJ7b4OD8Bd8IFQPdJMdY9ZnZWUp/CGNm+5eKNw==@linaro.org
X-Gm-Message-State: AOJu0Yw75YATNwoqE2JoyBbpei9klqHmuZBKyEOXWrZCuoDzvrSehgAr
	FCdaoO5aWsSGp94xk+AHAIUVCO26s3Xq9V//9UIa1XNZLBVFKgntGSJYgTYWOfWRgg==
X-Google-Smtp-Source: AGHT+IE0u/7UpIos2pzVBMUPBWrD2NqnZOScTdbEDnrAvQYCqJPBAav3DpG0faFn14HOSZZgNV8PDA==
X-Received: by 2002:a05:6a21:1796:b0:1cf:42ab:5776 with SMTP id adf61e73a8af0-1d5e2cb144cmr560017637.32.1727801505455;
        Tue, 01 Oct 2024 09:51:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b265160c8sm8220739b3a.126.2024.10.01.09.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:51:45 -0700 (PDT)
Message-ID: <450bccc8-262a-4ecb-aba1-5a7054aa7ed7@linaro.org>
Date: Tue, 1 Oct 2024 09:51:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] hw/xtensa/xtfpga: Remove TARGET_BIG_ENDIAN
 #ifdef'ry
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: MNrLGSYH5VDW

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE1v
dmUgY29kZSBldmFsdWF0aW9uIGZyb20gcHJlcHJvY2Vzc29yIHRvIGNvbXBpbGVyIHNvDQo+
IGJvdGggaWYoKSBsYWRkZXJzIGFyZSBwcm9jZXNzZWQuIE1vc3RseSBzdHlsZSBjaGFuZ2Uu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGh3L3h0ZW5zYS94dGZwZ2EuYyB8IDEyICsrKysr
KystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcveHRlbnNhL3h0ZnBnYS5jIGIvaHcveHRl
bnNhL3h0ZnBnYS5jDQo+IGluZGV4IDk1NWU4ODY3YTMuLjIyOGYwMGIwNDUgMTAwNjQ0DQo+
IC0tLSBhL2h3L3h0ZW5zYS94dGZwZ2EuYw0KPiArKysgYi9ody94dGVuc2EveHRmcGdhLmMN
Cj4gQEAgLTQxNSw4ICs0MTUsNyBAQCBzdGF0aWMgdm9pZCB4dGZwZ2FfaW5pdChjb25zdCBY
dGZwZ2FCb2FyZERlc2MgKmJvYXJkLCBNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+ICAgICAg
ICAgICAgICAgfQ0KPiAgICAgICAgICAgfQ0KPiAgICAgICAgICAgaWYgKGVudHJ5X3BvaW50
ICE9IGVudi0+cGMpIHsNCj4gLSAgICAgICAgICAgIHVpbnQ4X3QgYm9vdFtdID0gew0KPiAt
I2lmIFRBUkdFVF9CSUdfRU5ESUFODQo+ICsgICAgICAgICAgICB1aW50OF90IGJvb3RfYmVb
XSA9IHsNCj4gICAgICAgICAgICAgICAgICAgMHg2MCwgMHgwMCwgMHgwOCwgICAgICAgLyog
aiAgICAxZiAqLw0KPiAgICAgICAgICAgICAgICAgICAweDAwLCAgICAgICAgICAgICAgICAg
ICAvKiAubGl0ZXJhbF9wb3NpdGlvbiAqLw0KPiAgICAgICAgICAgICAgICAgICAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAvKiAubGl0ZXJhbCBlbnRyeV9wYyAqLw0KPiBAQCAtNDI1LDcg
KzQyNCw4IEBAIHN0YXRpYyB2b2lkIHh0ZnBnYV9pbml0KGNvbnN0IFh0ZnBnYUJvYXJkRGVz
YyAqYm9hcmQsIE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkNCj4gICAgICAgICAgICAgICAgICAg
MHgxMCwgMHhmZiwgMHhmZSwgICAgICAgLyogbDMyciBhMCwgZW50cnlfcGMgKi8NCj4gICAg
ICAgICAgICAgICAgICAgMHgxMiwgMHhmZiwgMHhmZSwgICAgICAgLyogbDMyciBhMiwgZW50
cnlfYTIgKi8NCj4gICAgICAgICAgICAgICAgICAgMHgwYSwgMHgwMCwgMHgwMCwgICAgICAg
LyoganggICBhMCAqLw0KPiAtI2Vsc2UNCj4gKyAgICAgICAgICAgIH07DQo+ICsgICAgICAg
ICAgICB1aW50OF90IGJvb3RfbGVbXSA9IHsNCj4gICAgICAgICAgICAgICAgICAgMHgwNiwg
MHgwMiwgMHgwMCwgICAgICAgLyogaiAgICAxZiAqLw0KPiAgICAgICAgICAgICAgICAgICAw
eDAwLCAgICAgICAgICAgICAgICAgICAvKiAubGl0ZXJhbF9wb3NpdGlvbiAqLw0KPiAgICAg
ICAgICAgICAgICAgICAweDAwLCAweDAwLCAweDAwLCAweDAwLCAvKiAubGl0ZXJhbCBlbnRy
eV9wYyAqLw0KPiBAQCAtNDM0LDE0ICs0MzQsMTYgQEAgc3RhdGljIHZvaWQgeHRmcGdhX2lu
aXQoY29uc3QgWHRmcGdhQm9hcmREZXNjICpib2FyZCwgTWFjaGluZVN0YXRlICptYWNoaW5l
KQ0KPiAgICAgICAgICAgICAgICAgICAweDAxLCAweGZlLCAweGZmLCAgICAgICAvKiBsMzJy
IGEwLCBlbnRyeV9wYyAqLw0KPiAgICAgICAgICAgICAgICAgICAweDIxLCAweGZlLCAweGZm
LCAgICAgICAvKiBsMzJyIGEyLCBlbnRyeV9hMiAqLw0KPiAgICAgICAgICAgICAgICAgICAw
eGEwLCAweDAwLCAweDAwLCAgICAgICAvKiBqeCAgIGEwICovDQo+IC0jZW5kaWYNCj4gICAg
ICAgICAgICAgICB9Ow0KPiArICAgICAgICAgICAgY29uc3Qgc2l6ZV90IGJvb3Rfc3ogPSBU
QVJHRVRfQklHX0VORElBTiA/IHNpemVvZihib290X2JlKQ0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IHNpemVvZihib290X2xl
KTsNCj4gKyAgICAgICAgICAgIHVpbnQ4X3QgKmJvb3QgPSBUQVJHRVRfQklHX0VORElBTiA/
IGJvb3RfYmUgOiBib290X2xlOw0KPiAgICAgICAgICAgICAgIHVpbnQzMl90IGVudHJ5X3Bj
ID0gdHN3YXAzMihlbnRyeV9wb2ludCk7DQo+ICAgICAgICAgICAgICAgdWludDMyX3QgZW50
cnlfYTIgPSB0c3dhcDMyKHRhZ3B0cik7DQo+ICAgDQo+ICAgICAgICAgICAgICAgbWVtY3B5
KGJvb3QgKyA0LCAmZW50cnlfcGMsIHNpemVvZihlbnRyeV9wYykpOw0KPiAgICAgICAgICAg
ICAgIG1lbWNweShib290ICsgOCwgJmVudHJ5X2EyLCBzaXplb2YoZW50cnlfYTIpKTsNCj4g
LSAgICAgICAgICAgIGNwdV9waHlzaWNhbF9tZW1vcnlfd3JpdGUoZW52LT5wYywgYm9vdCwg
c2l6ZW9mKGJvb3QpKTsNCj4gKyAgICAgICAgICAgIGNwdV9waHlzaWNhbF9tZW1vcnlfd3Jp
dGUoZW52LT5wYywgYm9vdCwgYm9vdF9zeik7DQo+ICAgICAgICAgICB9DQo+ICAgICAgIH0g
ZWxzZSB7DQo+ICAgICAgICAgICBpZiAoZmxhc2gpIHsNCg0KUmV2aWV3ZWQtYnk6IFBpZXJy
aWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
