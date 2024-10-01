Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp314087njl;
        Tue, 1 Oct 2024 09:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgiR4qizGWGcVPExUWWw3qs6gjgfXMblxsisO/Lx9G/G6xIJWz1Mpw/hZASMCGKHCgyKSElEvjbuiJKA==@linaro.org
X-Received: by 2002:a05:6a00:c84:b0:718:e162:7374 with SMTP id d2e1a72fcca58-71dc5c4dc5emr478097b3a.5.1727801215296;
        Tue, 01 Oct 2024 09:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801215; cv=none;
        d=google.com; s=arc-20240605;
        b=KWbrxcS3nppYc37ME/iiUolsZr0Hh00/zunrGlOIlupLhbUMkeJGUhqGhvNz9g+T7a
         CzJKNqLfCYwLETLSngbQQT0AypjXIY/LD0+TH2C2+H+sfIO9OEyr2001AX3whHKcaRm8
         AlTYXWN4/e8dGcIWTXcYOI17DRHCktVbcPRCO5VBj8zYlM24k2ZMGUpLOOUhzmNHF38Z
         jM38iRX3HzZjkVA07AjTiw1k4u7GSm+0ZCAlAVloEW4gB/UXRtfwxvUN0PNiPY1pV0Om
         tMx9JOoyLVFkyL/ISOfo965GNBzLyaGaCFtWb/DJdXz7x9uowKSt0sRglvfvEMyEVI5K
         MZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fOytmqVO3zXyUJ0nP2wESEdbzdCo0nkTINVmpjlqe9Y=;
        fh=XJQ7yq4AG3yUf7xIazRy/aqqkiUsxBnJZ5It1fkSgnc=;
        b=l2jmIEHj7SJCQV2IbWQnYpK19FMlJuTrPBcAM3siPWtG4CAJ00AE1NtyTWrqyOLesD
         2zlsHT2vsvOCCiMig/lSt2fYdyTS/nNHnIVban1BqyeKwpPNovoGMJvtOmV8zqOF4np8
         /NiGjU9/g0mmnLlYQBlpAz/icVRb8CDb4BsXZEV/sh0ACYo9JyVamNsTX6qvk4SGpLDV
         1eAunjLS9P4S49E+dWN2wXrdQFUIGOqXbuShs9fUdbT641R3efxhFiyhPLfwnscIO24e
         niyY3HKfJYdAisLkhocmgCbUt46GdEQA97CrX6H+HPaRORronwLgDz0tGmZ7F3WoaGNN
         RApA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zsAhi1qp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71b2649c73dsor6561274b3a.4.2024.10.01.09.46.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zsAhi1qp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801215; x=1728406015; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOytmqVO3zXyUJ0nP2wESEdbzdCo0nkTINVmpjlqe9Y=;
        b=zsAhi1qpE+ZEPLTa6arfgrCaCLpHjUbM6r3h6jNO+4a3Z13awvFWy/FpOTBOZrPRYA
         Q8BySIc4lSL4dyxpcrFnVlzxZSC1uTsMhD5/RyCk8PcrYYfPadiaUj8/41XsB0VZ4Yy+
         9oABMazDvz9W0gixfvpiCLrx1lq5Mk6bByvaDd4/aKKyRFmys4p5S+TDINJYZiKGHj2Z
         JpROSO/pxp7xmst2b3AybTMFWnVzxFRNZgs04NSVTTDDe+y7P2cY90O+vsemeDmUifer
         fRu5pBmd21QWgstH2XnDhgne70i3zVe5jcXosYDTjd5xpmft1uwoaPUuS0GeLQGvr5A4
         OBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801215; x=1728406015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOytmqVO3zXyUJ0nP2wESEdbzdCo0nkTINVmpjlqe9Y=;
        b=REiou8vmf1WpvneHBjO0OEMBeZbmioVQyeHqQUUJPWoPg8eIpSOulXfrDgdThqNAsI
         ot1/k84qJlhp/FesGKGyU/gdYaK8a6t8kXZgAgZSck2QxW4Ixl2sd+s2r4JOSfRSNXKj
         ld4l5lruj5XL+dnHrM5xrZ/m5uyWPaNscEgbht6yZd1Jm2NtIcG+LL7D/Q9WMimt1+bM
         DhIi3vEUUiNUp6O7rysd65sRcjnKNF5HO9rgtWzZXuC/7C8ndenKGRrYFBUpCDOH6C9d
         LoTAz1vDmTdVDpPhAqEjz3p3893pLXxhqGK0hcZ0YRdzX4F9qRa0yBisKs4t7U9f3N8P
         NW8w==
X-Forwarded-Encrypted: i=1; AJvYcCVrA8rn7iFVm7gCYFlNddy5RGRn6cIl3du3JyxwJ/gqJBpLLgl6Bn66poir5A3/6Pd8lL7LZt5YuVIMrQ==@linaro.org
X-Gm-Message-State: AOJu0YzI2ZZhDZLBkK0XCPWLbeVBliYBC+bfMaISPIDU1J8vC35UUPVN
	cyad1Ewa+16pxvuH61PYSFicy7cn6qHfEOHIrYumq5Er6dtU+cNh2ulmrSVzTgZGHg==
X-Google-Smtp-Source: AGHT+IGP2s7i/fjXTXuAysRxcFVM89tY2V68gj53XfUw4LuHNvuhkINNc1koSnV5DQik1etXhkknrw==
X-Received: by 2002:a05:6a00:3cc2:b0:710:6e83:cd5e with SMTP id d2e1a72fcca58-71dc5b140d9mr563847b3a.0.1727801214756;
        Tue, 01 Oct 2024 09:46:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652b5b3sm8262343b3a.161.2024.10.01.09.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:46:54 -0700 (PDT)
Message-ID: <f401ae3b-498f-450f-a82d-6be84a8550cb@linaro.org>
Date: Tue, 1 Oct 2024 09:46:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] target/arm/ptw: Use the ld/st_endian_p() API
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
 <20240930073450.33195-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: iCZ/mysTdyvV

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFJl
ZmFjdG9yIHRvIHVzZSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBsZC9zdF9lbmRpYW5fcCgp
IEFQSQ0KPiBObyBsb2dpY2FsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0t
DQo+ICAgdGFyZ2V0L2FybS9wdHcuYyB8IDE5ICsrKystLS0tLS0tLS0tLS0tLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL3B0dy5jIGIvdGFyZ2V0L2FybS9wdHcuYw0KPiBp
bmRleCBkZWZkNmI4NGRlLi5hMWE2YjFmZWMzIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvYXJt
L3B0dy5jDQo+ICsrKyBiL3RhcmdldC9hcm0vcHR3LmMNCj4gQEAgLTY5OSwxMSArNjk5LDcg
QEAgc3RhdGljIHVpbnQ2NF90IGFybV9sZHFfcHR3KENQVUFSTVN0YXRlICplbnYsIFMxVHJh
bnNsYXRlICpwdHcsDQo+ICAgICAgICAgICAgICAgZGF0YSA9IGxlNjRfdG9fY3B1KGRhdGEp
Ow0KPiAgICAgICAgICAgfQ0KPiAgICNlbHNlDQo+IC0gICAgICAgIGlmIChwdHctPm91dF9i
ZSkgew0KPiAtICAgICAgICAgICAgZGF0YSA9IGxkcV9iZV9wKGhvc3QpOw0KPiAtICAgICAg
ICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAgZGF0YSA9IGxkcV9sZV9wKGhvc3QpOw0KPiAt
ICAgICAgICB9DQo+ICsgICAgICAgIGRhdGEgPSBsZHFfZW5kaWFuX3AocHR3LT5vdXRfYmUs
IGhvc3QpOw0KPiAgICNlbmRpZg0KPiAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgLyog
UGFnZSB0YWJsZXMgYXJlIGluIE1NSU8uICovDQo+IEBAIC04NjAsMTYgKzg1Niw5IEBAIHN0
YXRpYyB1aW50NjRfdCBhcm1fY2FzcV9wdHcoQ1BVQVJNU3RhdGUgKmVudiwgdWludDY0X3Qg
b2xkX3ZhbCwNCj4gICAgICAgaWYgKCFsb2NrZWQpIHsNCj4gICAgICAgICAgIGJxbF9sb2Nr
KCk7DQo+ICAgICAgIH0NCj4gLSAgICBpZiAocHR3LT5vdXRfYmUpIHsNCj4gLSAgICAgICAg
Y3VyX3ZhbCA9IGxkcV9iZV9wKGhvc3QpOw0KPiAtICAgICAgICBpZiAoY3VyX3ZhbCA9PSBv
bGRfdmFsKSB7DQo+IC0gICAgICAgICAgICBzdHFfYmVfcChob3N0LCBuZXdfdmFsKTsNCj4g
LSAgICAgICAgfQ0KPiAtICAgIH0gZWxzZSB7DQo+IC0gICAgICAgIGN1cl92YWwgPSBsZHFf
bGVfcChob3N0KTsNCj4gLSAgICAgICAgaWYgKGN1cl92YWwgPT0gb2xkX3ZhbCkgew0KPiAt
ICAgICAgICAgICAgc3RxX2xlX3AoaG9zdCwgbmV3X3ZhbCk7DQo+IC0gICAgICAgIH0NCj4g
KyAgICBjdXJfdmFsID0gbGRxX2VuZGlhbl9wKHB0dy0+b3V0X2JlLCBob3N0KTsNCj4gKyAg
ICBpZiAoY3VyX3ZhbCA9PSBvbGRfdmFsKSB7DQo+ICsgICAgICAgIHN0cV9lbmRpYW5fcChw
dHctPm91dF9iZSwgaG9zdCwgbmV3X3ZhbCk7DQo+ICAgICAgIH0NCj4gICAgICAgaWYgKCFs
b2NrZWQpIHsNCj4gICAgICAgICAgIGJxbF91bmxvY2soKTsNCg0KUmV2aWV3ZWQtYnk6IFBp
ZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
