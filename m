Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp523999njc;
        Fri, 11 Apr 2025 08:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRA+yfxUcEEwF8u5bHiTM7K4LMg1BlogFcusCykzMexbHS1xV17VMm0BpbX4smaWvoDZZzzn8gpXZuNw==@linaro.org
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6d00:ba05 with SMTP id adf61e73a8af0-20179995d63mr5249360637.38.1744385298933;
        Fri, 11 Apr 2025 08:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744385298; cv=none;
        d=google.com; s=arc-20240605;
        b=emflYY01T1xPztN4/D1LsKvbyG+ODPB0t5WpldcpENiuOlY8Y8gdkJkJ0+AK4CCpWS
         JALjwN7b3A7FxdXkqHpXLK306lDKwCLfSjq3r9VHLjb4Y69k6DgfHRP5a20VvfxrX8OH
         qhGDLZz/Ea2QmZxqjjJ7csUZh7S+hEj1iGliYdnz9V70NlArUyveGJUceiHc1rIv45af
         eazulT+QooyA9V1J/RpTDFL42A6BiFcKhBbvNFvKg4UFPtab4yyg8rfRNK5+D43eYFxi
         /Rxcg66CFQ6TWxzgbTyWduYlMmdOZ7LxtIcmXHzxt0yjV/wsKBM4QJoXX94Wxgk+J8+O
         LGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PUAXomRvCtwsCzZCH7Q/FVlBhvZ0s7flP3e1LTaAUDI=;
        fh=iSrb9GXBVQV8zxXlK9f6N8KGigAL8B2oAxrtAZ5rz/o=;
        b=FXSfl+XODa8qQF17ZfAH0PoZpPUOXjPzfL7uprQ7v9p0xhIEOWx3n1TDAFZhqtUE3Z
         G//Q1Asx7L3MMDcC7B1zEPbOEpzLNmyJq8X0nSofIAe2KEU1YUJrhGrUMTE5J+RR7O7G
         sYIyIO6WKzeA0IoI2JAEoo6CbXr5KNtCrMDcp0fvs9ohzoHrmE+O2xB1YODUPGg5rIk/
         8gIB2j7+f/8Z0EZVXDV0SW2G2c1fCeFH87FkelxGDa7b0qmSWuWBI5TsUoHnL/Pqs5Pt
         Y3xzaeZG8NbobSQrlLBCZWLTGxN6eF+T179HfdhTCWRzY6io1rY/ijwUXcCxtsD7BmVu
         3P3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u2S+IL/e";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1e38622sor3635375b3a.6.2025.04.11.08.28.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Apr 2025 08:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="u2S+IL/e";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744385298; x=1744990098; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUAXomRvCtwsCzZCH7Q/FVlBhvZ0s7flP3e1LTaAUDI=;
        b=u2S+IL/eib5u8mhnsS2Hg6FwAqLVykmEDzvrP/v2ICKtduuRDr0MpUm7lgBRsR9yMY
         VYXQLJUyZjHmx2qGTWMt+kehWz3ka3F9fkIWccnZFVnvXlCSqfo59bWeYtyO+QwySsTd
         6yTHF5RNPl5QkGgtYJIWRfDF8OdXLCrupT7Egp262oK0ZyAfzZYPPhPJhpBHt5PhWHny
         k9lYoKMT1GbL4kk4nm4iYBkR0KAfTZZECH+m1ypAeyrcg9fF/twuNno3rwGdXzDSBcB6
         VBuayB6q5l8+Zt9I6GDQti11G++mxDp9GG7bMWo8XQpaANhTD4Vunh+SNFxI07ZtyGMW
         +eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744385298; x=1744990098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUAXomRvCtwsCzZCH7Q/FVlBhvZ0s7flP3e1LTaAUDI=;
        b=KIHbG1x2b45JHB1eN69adqeE6Pxfdf1ouakm/+ZayBMNMzREXbHagGvrI/WZnamP9g
         rXD3M2ivNwYOn/SwLpgG715tXqHroM8I/7+3DAS+w3fsUiqh5sKImYWV0NoJ2o6ca95I
         19MlzSogi4dr0qgH7UXioJ15yAateh3Lyw2Ad2EJNNVd9BtcFTXK3XK+KG/XaFlFr6db
         SrX5ousK+n9DXg3YvHHtGNcYKTVQ5y9JVyKhYv0twhnFkzVFVouowhXsBbVUoqzn87p7
         jzsJd1DJ9KWB/B2tRDvAcZa0Wz8lQCMOGz0pcotPvUmoyFH+FE8exnFM1G65gn+lzNFB
         5mQw==
X-Forwarded-Encrypted: i=1; AJvYcCUipO0LKfFN4UVw+BZyvn15rm0+Yq/8dpaZ/dK6k1RQhz0GjkqQ88nFq3mVQiT2HGx+NbdMJcapazhaZg==@linaro.org
X-Gm-Message-State: AOJu0Yy3+K22J3DKOHmio+ezLLihiMR+e/xyeBjQN2+jny7ZGpJRz/Gq
	XblpyVo+TaTO3mzXu2gafoL/ZV6g84LUp4WvLuixEI6YT/WUrTRQwxtCcQCk7DoV9w==
X-Gm-Gg: ASbGncucIp29vTWpnlYbRrS7j8Tt2zmUQUIty2BQFx1PiYijpGCP9YT7RROU+NCjLf6
	lqhPh7G9SGfyVRj8OVhXUlUD0yVcUitHXuEg4tgUVPZhdmdnA/onlxV4QYr2uCzUMnACGAiSxDY
	Tpomc0NU4VJFVsNXakfIjjCN62ntUmm+bliJOQq0nHui20EtRf+c54LikLLg8K9FJFqJkQ7NTQl
	XXABj6+g9UiS7gCK3LMB9AUA/NM9Myk2as5e0ueTMSY/oa1UC0GO+0iPUbtBslIDhqkx6UqO9sb
	hTO15MazxVbeTK9nAcxwHylJ/7sOV4s/CFJgg1H13IMjClEgX+5N4w==
X-Google-Smtp-Source: AGHT+IGwRLD44lLzlKb3cd1yIqxRyeI0/6yalZiLFwzce5Jq8dTp0VCQN9yWzNqpb5FRZABQX9b5Bg==
X-Received: by 2002:a05:6a20:4f92:b0:201:85f4:ad0a with SMTP id adf61e73a8af0-20185f4bb86mr1113527637.30.1744385298404;
        Fri, 11 Apr 2025 08:28:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f10b3sm1645927b3a.118.2025.04.11.08.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:28:17 -0700 (PDT)
Message-ID: <b360cb8f-0e5b-4811-b625-29e0538ba61b@linaro.org>
Date: Fri, 11 Apr 2025 08:28:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enable QEMU to run on browsers
Content-Language: en-US
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <20250409192115.GA5528@fedora>
 <dc36c24e-dc4a-4c24-97b7-8b812441ffce@linaro.org>
 <CAEDrbUZ4mbCT-npk8Nha4fDd9a5PGguAxS_RD0wG96gpQRUp+g@mail.gmail.com>
 <CAEDrbUYM3aK5ErvF=+oV=q-NVLO0uzxbYjHzcxPGvTLp7yNtwA@mail.gmail.com>
 <83f44749-0eea-48f0-8aa5-3882132e30d0@linaro.org>
 <CAEDrbUbjD0d-pP_s1oV7gSuFoDpKTDiXd7bQf6p5hQUcN_iT+g@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAEDrbUbjD0d-pP_s1oV7gSuFoDpKTDiXd7bQf6p5hQUcN_iT+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: RjPlcNIOAdfM

T24gNC8xMS8yNSAwNzozNiwgS29oZWkgVG9rdW5hZ2Egd3JvdGU6DQo+IEhpIFBpZXJyaWNr
LCB0aGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ICA+IGZpcnN0LCBjb25ncmF0
cyBmb3IgdGhpcyB3b3JrIQ0KPiAgPiBJdCB3b3VsZCBiZSByZWFsbHkgbmljZSB0byBoYXZl
IHRoaXMgYXZhaWxhYmxlIHVwc3RyZWFtLCBzdGFydGluZyB3aXRoIGENCj4gID4gbW9kZXN0
IFRDSSBwb3J0LCBiZWZvcmUgaGF2aW5nIHRoZSB0Y2cgYmFja2VuZCBhbHNvLg0KPiANCj4g
U3VyZSwgSSdsbCBzcGxpdCB0aGUgcGF0Y2ggc2VyaWVzLCBzdGFydGluZyB3aXRoIHRoZSBU
Q0kgcG9ydC4NCj4gDQo+ICA+IERvIHlvdSBoYXZlIHJlY2VudCBpbmZvcm1hdGlvbiBhYm91
dCB3YXNtNjQ/IEl0IHNlZW1zIHRvIGJlIHNvbWV0aGluZw0KPiAgPiB0aGF0IGhhcyBiZWVu
IGRpc2N1c3NlZCBmb3Igc2V2ZXJhbCB5ZWFycywgd2l0aG91dCByZWFsbHkgc2VlaW5nIGFu
eQ0KPiAgPiBwcm9ncmVzcy4NCj4gDQo+IEFjY29yZGluZyB0byB0aGUgYWRvcHRpb24gc3Rh
dHVz4oCvWzFdLCB3YXNtNjQgaXMgc3VwcG9ydGVkIGJ5IHJlY2VudCB2ZXJzaW9ucw0KPiBv
ZiBDaHJvbWUgYW5kIEZpcmVmb3guIEVtc2NyaXB0ZW4gYWxzbyBzdXBwb3J0cyB3YXNtNjTi
gK9bMl0uIEhvd2V2ZXIsIGl0IGlzDQo+IG5vdCB5ZXQgc3VwcG9ydGVkIGJ5IFNhZmFyaSBv
ciBsaWJmZmnigK9bM10sIGFuZCBJIGhhdmVuJ3QgZm91bmQgYSByb2FkbWFwIGZvcg0KPiB0
aGUgYWRvcHRpb24uDQo+IA0KDQpHcmVhdCwgSSBkaWRuJ3Qgbm90aWNlIG1ham9yIGJyb3dz
ZXJzIHdlcmUgYWxyZWFkeSBzdXBwb3J0aW5nIGl0Lg0KRXZlbiBpZiBTYWZhcmkgZG9lcyBu
b3Qgc3VwcG9ydCBpdCwgbWF5YmUgaGF2aW5nIHRoZSB0d28gb3RoZXIgbWFqb3IgDQpvbmVz
IHdvdWxkIGJlIGVub3VnaCB0byB0YXJnZXQgdGhpcy4NCg0KUmVnYXJkaW5nIGxpYmZmaSwg
b3VyIHVzYWdlIG9mIGl0IHNlZW1zIGxpbWl0ZWQgaW4gdGNpLCBJIHdvbmRlciBpZiB3ZSAN
CmNvdWxkIG5vdCB3b3JrYXJvdW5kIHRoaXMuIE9yIGV2ZW50dWFsbHkgc2VlIGlmIGVuYWJs
aW5nIHdhc202NCBpcyBhIGJpZyANCndvcmsgaW4gbGliZmZpIGl0c2VsZi4NCg0KPiBbMV0g
aHR0cHM6Ly93ZWJhc3NlbWJseS5vcmcvZmVhdHVyZXMvIDxodHRwczovL3dlYmFzc2VtYmx5
Lm9yZy9mZWF0dXJlcy8+DQo+IFsyXSBodHRwczovL2Vtc2NyaXB0ZW4ub3JnL2RvY3MvdG9v
bHNfcmVmZXJlbmNlLyANCj4gc2V0dGluZ3NfcmVmZXJlbmNlLmh0bWwjbWVtb3J5NjQgPGh0
dHBzOi8vZW1zY3JpcHRlbi5vcmcvZG9jcy8gDQo+IHRvb2xzX3JlZmVyZW5jZS9zZXR0aW5n
c19yZWZlcmVuY2UuaHRtbCNtZW1vcnk2ND4NCj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9s
aWJmZmkvbGliZmZpLyANCj4gYmxvYi82YTk5ZWRiODA4MmY3NWU1MjNlMGQ2ZWJhYmE0MjIx
OGI4MGUxMGM4L1JFQURNRS5tZCNzdXBwb3J0ZWQtIA0KPiBwbGF0Zm9ybXMgPGh0dHBzOi8v
Z2l0aHViLmNvbS9saWJmZmkvbGliZmZpLyANCj4gYmxvYi82YTk5ZWRiODA4MmY3NWU1MjNl
MGQ2ZWJhYmE0MjIxOGI4MGUxMGM4L1JFQURNRS5tZCNzdXBwb3J0ZWQtcGxhdGZvcm1zPg0K
PiANCj4gID4gQXMgUGhpbGlwcGUgc2FpZCwgd2UgY2FuJ3QgcmVhbGx5IHJldmVydCB0aGF0
IChpdCdzIG5vdyBhbiBhc3N1bXB0aW9uDQo+ICA+IGZvciBvdXIgc29mdG1tdSBpbXBsZW1l
bnRhdGlvbiwgYW5kIHdvdWxkIGJyZWFrIGNvZGUgaWYgd2UgZW5hYmxlZCBpdA0KPiAgPiBh
Z2FpbiBub3cuKQ0KPiAgPg0KPiAgPiBUaGF0IHNhaWQsIHdlIGNhbiBhbHdheXMgaGF2ZSBh
IGZpcnN0IHZlcnNpb24gc3VwcG9ydGluZyBvbmx5IDMyIGJpdHMNCj4gID4gdGFyZ2V0cy4g
QW5kIGxhdGVyLCB3aGVuIHdhc202NCB3aWxsIGJlIGF2YWlsYWJsZSwgd2UgY2FuIGV4dGVu
ZCB0aGlzIHRvDQo+ICA+IGFsbCByZW1haW5pbmcgb25lcy4NCj4gDQo+IFRoZSBtYWluIGNo
YWxsZW5nZSBJJ20gc2VlaW5nIGlzIHRoYXQgSSBjb3VsZG4ndCBmaW5kIGEgY2xlYXIgdGlt
ZWxpbmUgZm9yDQo+IHdhc202NCBhZG9wdGlvbiBzbyBpdCdzIGRpZmZpY3VsdCB0byBwcmVk
aWN0IHdoZW4gaXQgd2lsbCBiZSB3aWRlbHkNCj4gYXZhaWxhYmxlLg0KPiANCj4gUmVnYXJk
aW5nIHRoZSByZXZlcnQsIHRoZSB3YXNtIGJhY2tlbmQgc3VwcG9ydHMgNjQtYml0IHdvcmRz
LCBzbyB0aGUgcmV2ZXJ0DQo+IGludHJvZHVjZWQgaW4gcGF0Y2ggMDYvMTAgaXMgcGFydGlh
bCwgYXMgYWxzbyBwb2ludGVkIG91dCBieSBQYW9sby4NCj4gDQoNCk9rLCB0aGFua3MgZm9y
IHBvaW50aW5nIGl0LCBJIGRpZG4ndCByZWFsbHkgcmVhZCBpbnRvIGRldGFpbHMgb2YgdGhl
IA0KcGF0Y2gsIGFuZCBzaW1wbHkgYXNzdW1lZCB5b3Ugd2FudGVkIHRvIHJldmVydCB0aGlz
IGNoYW5nZSBjb21wbGV0ZWx5LiANCklmIHdlIGNhbiBoYXZlIGEgc29sdXRpb24gb25seSBh
ZmZlY3RpbmcgZW1zY3JpcHRlbiBidWlsZHMsIEkgdGhpbmsgaXQncyBvay4NCg0KUmVnYXJk
cywNClBpZXJyaWNrDQo=
