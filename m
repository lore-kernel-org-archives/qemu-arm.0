Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3360002njb;
        Tue, 22 Oct 2024 13:39:49 -0700 (PDT)
X-Received: by 2002:a17:903:948:b0:20b:5351:f690 with SMTP id d9443c01a7336-20fa9e0999dmr5814275ad.16.1729629589034;
        Tue, 22 Oct 2024 13:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729629589; cv=none;
        d=google.com; s=arc-20240605;
        b=DWNWH7ToizFdRcEudDaEFfr1fMal4D726SxLVksxV8RkLYlYRBR8+JtgP2GgSB05MB
         g4ur7TdAKZI+Il4JFJgymUsjFL2CCgFPt9YaSc9NiZ0gODkD9Z7s+vvYQw0mxmep8nLg
         GV3ridR8nBHudw57SPGJHS/Ov3G/3Nl8IPXJM294cfM6BbNlnoqrNyV1QJbSjiyY7DJt
         ZIllXBpMqFWkXuvSjHVzgKceK1uctg4G0l47daMoYfUqJAA6asqI6DHaLj/NQDTQnqhg
         T4+C2X+ZxOAPBKORBrN61zSaOoaioiLIePqM36eSKecWB6/pGTU+UCbK6oRH2oBXuGbV
         uo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8716lgN4vd3OakIyJc2Ibs0xllERoZjKZIQIBT2RF3o=;
        fh=UbtwuqjEwy8eyyubkDAczwrUlBOxzHjWAQtFhVTm/ZE=;
        b=XlfzuV+aBQxlmEllWZBHQoorcFwm02rjrN7jWLtupZhY3tl03wliBkPq85xlhCiIoR
         9ffBH9oqzLj0uvjh4ALIkOoRxZl3Cw3B1OD/p91T3CgPtsoyjcHC3cfXXpy0EnQCcN9H
         SF86HFe2Q++svdQi0ecq8akBwCKWDkMITaRDTAW31M9Eum1qqeEhWmppXTIp90HtMtys
         WjQJjeIgVkvb7MN2NoGzKzlc18GDHHfZR0CDfgkD8Ryh+k5cYJoZN1Wzsh77x8AOnvsx
         2AQQ2JS2ytV/l+ZjaffUjELe0eqUolopcOFIarHdqGHliITAu/+YGq4rvnvnOJQiLK+Y
         8MHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jm1fdRom;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7ef4a4basor35744985ad.6.2024.10.22.13.39.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jm1fdRom;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729629588; x=1730234388; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8716lgN4vd3OakIyJc2Ibs0xllERoZjKZIQIBT2RF3o=;
        b=jm1fdRomZ4im4vTBX6EhCYlRb/w6F+FOPLv74PH+64miPUqMklcDiWknKrQxmJ6eEP
         FIkaPxTg+15RH6/nKM+InTIFU7EzALByJ7fPeLCo6UGfYY0MwcwFrPESFYvfwU4Vbeln
         dsmH7uUBtKoxR3y7vxNNPL3Xe/66tRgro+TzvWPUfJ5sPbytZyYcsOVyv8lFna3X6KDH
         rPc3HpY7nX9YkDQip+murDSJ29GIOCvElXzdLD0M2gNrWKJh5J3/8EWJ5RRDDEL2TgBl
         HhEg43ILZQP8QYbcs29iBKEFbWs2PBwsyxrHknRUgKlpZz5yZ2abGnd9wZabEKE3ppUP
         5vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629588; x=1730234388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8716lgN4vd3OakIyJc2Ibs0xllERoZjKZIQIBT2RF3o=;
        b=TsD0Su1bE5BzGQmmFYh88W19ZBIeGRpecr6nhOt3R7kIHSgWsBXpsaUD3eX6VBQjNX
         cBAHPJalbEWgWcmCZOS6L5gn+cLoQhFUwcOzzWKl94x1HRu9U+elp08Sxh1QiMLkqMBn
         Bmiy2GO9VtgS6VViiSnY0k3s4WPVTQ4ov2de2E2GHidSLVhlkyOmu0ImV58HKwQUo96j
         KsQnv8NL4BMx5fEWddOq/1mP9lguHA0nuMElFvA9jTLXhd8ikVrGRqfBnEBalABiAEkc
         G65lIHflbTjha2I19HWLmwB4ZQ8kEeUm9+0SR6R1nQkDFFM7QUW55pVqZSQf5TlGkum2
         E4Jw==
X-Gm-Message-State: AOJu0YzNFF6T3Yhh7gJaUidJwPkQJc8Ty1LvRlRbo/4vMxqVTbGvYtkb
	oAlpmf20rWyr6px9p9FDDJLgjvRhT7Pvvw8x1DhMoA3lammg3UuR5hiy+5eWLAYitVo5GxcIcQc
	Glt1FIh4s
X-Google-Smtp-Source: AGHT+IF1OaRSF/uO0aEsCCNn9rL9J/Dcu/AyvZOh73bRHQ8pyrVuOGOlGXYGIiRXLfzK3teLBdcL9A==
X-Received: by 2002:a17:90b:4b0d:b0:2c8:65cf:e820 with SMTP id 98e67ed59e1d1-2e76b5b6b34mr236574a91.2.1729629588547;
        Tue, 22 Oct 2024 13:39:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389146sm6646573a91.26.2024.10.22.13.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:39:48 -0700 (PDT)
Message-ID: <244addee-9fa0-4476-aa40-a4a316336e61@linaro.org>
Date: Tue, 22 Oct 2024 13:39:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] testing: Enhance gdb probe script
Content-Language: en-US
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-16-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 0WBOd5J/Vjjg

T24gMTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gRnJvbTogR3VzdGF2
byBSb21lcm8gPGd1c3Rhdm8ucm9tZXJvQGxpbmFyby5vcmc+DQo+IA0KPiBVc2UgbGlzdCBh
bmQgc2V0IGNvbXByZWhlbnNpb24gdG8gc2ltcGxpZnkgY29kZS4gQWxzbywgZ2VudGx5IGhh
bmRsZQ0KPiBpbnZhbGlkIGdkYiBmaWxlbmFtZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIFJvbWVybyA8Z3VzdGF2by5yb21lcm9AbGluYXJvLm9yZz4NCj4gTWVzc2FnZS1J
ZDogPDIwMjQxMDE1MTQ1ODQ4LjM4NzI4MS0xLWd1c3Rhdm8ucm9tZXJvQGxpbmFyby5vcmc+
DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4NCj4gLS0tDQo+ICAgc2NyaXB0cy9wcm9iZS1nZGItc3VwcG9ydC5weSB8IDc1ICsrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
OSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9z
Y3JpcHRzL3Byb2JlLWdkYi1zdXBwb3J0LnB5IGIvc2NyaXB0cy9wcm9iZS1nZGItc3VwcG9y
dC5weQ0KPiBpbmRleCA2ZGM1OGQwNmM3Li42YmNhZGNlMTUwIDEwMDY0NA0KPiAtLS0gYS9z
Y3JpcHRzL3Byb2JlLWdkYi1zdXBwb3J0LnB5DQo+ICsrKyBiL3NjcmlwdHMvcHJvYmUtZ2Ri
LXN1cHBvcnQucHkNCj4gQEAgLTE5LDU4ICsxOSw2MSBAQA0KPiAgIA0KPiAgIGltcG9ydCBh
cmdwYXJzZQ0KPiAgIGltcG9ydCByZQ0KPiAtZnJvbSBzdWJwcm9jZXNzIGltcG9ydCBjaGVj
a19vdXRwdXQsIFNURE9VVA0KPiArZnJvbSBzdWJwcm9jZXNzIGltcG9ydCBjaGVja19vdXRw
dXQsIFNURE9VVCwgQ2FsbGVkUHJvY2Vzc0Vycm9yDQo+ICtpbXBvcnQgc3lzDQo+ICAgDQo+
IC0jIG1hcHBpbmdzIGZyb20gZ2RiIGFyY2ggdG8gUUVNVSB0YXJnZXQNCj4gLW1hcHBpbmdz
ID0gew0KPiAtICAgICJhbHBoYSIgOiAiYWxwaGEiLA0KPiArIyBNYXBwaW5ncyBmcm9tIGdk
YiBhcmNoIHRvIFFFTVUgdGFyZ2V0DQo+ICtNQVAgPSB7DQo+ICsgICAgImFscGhhIiA6IFsi
YWxwaGEiXSwNCj4gICAgICAgImFhcmNoNjQiIDogWyJhYXJjaDY0IiwgImFhcmNoNjRfYmUi
XSwNCj4gLSAgICAiYXJtdjciOiAiYXJtIiwNCj4gKyAgICAiYXJtdjciOiBbImFybSJdLA0K
PiAgICAgICAiYXJtdjgtYSIgOiBbImFhcmNoNjQiLCAiYWFyY2g2NF9iZSJdLA0KPiAtICAg
ICJhdnIiIDogImF2ciIsDQo+ICsgICAgImF2ciIgOiBbImF2ciJdLA0KPiAgICAgICAjIG5v
IGhleGFnb24gaW4gdXBzdHJlYW0gZ2RiDQo+IC0gICAgImhwcGExLjAiIDogImhwcGEiLA0K
PiAtICAgICJpMzg2IiA6ICJpMzg2IiwNCj4gLSAgICAiaTM4Njp4ODYtNjQiIDogIng4Nl82
NCIsDQo+IC0gICAgIkxvb25nYXJjaDY0IiA6ICJsb29uZ2FyY2g2NCIsDQo+IC0gICAgIm02
OGsiIDogIm02OGsiLA0KPiAtICAgICJNaWNyb0JsYXplIiA6ICJtaWNyb2JsYXplIiwNCj4g
KyAgICAiaHBwYTEuMCIgOiBbImhwcGEiXSwNCj4gKyAgICAiaTM4NiIgOiBbImkzODYiXSwN
Cj4gKyAgICAiaTM4Njp4ODYtNjQiIDogWyJ4ODZfNjQiXSwNCj4gKyAgICAiTG9vbmdhcmNo
NjQiIDogWyJsb29uZ2FyY2g2NCJdLA0KPiArICAgICJtNjhrIiA6IFsibTY4ayJdLA0KPiAr
ICAgICJNaWNyb0JsYXplIiA6IFsibWljcm9ibGF6ZSJdLA0KPiAgICAgICAibWlwczppc2E2
NCIgOiBbIm1pcHM2NCIsICJtaXBzNjRlbCJdLA0KPiAtICAgICJvcjFrIiA6ICJvcjFrIiwN
Cj4gLSAgICAicG93ZXJwYzpjb21tb24iIDogInBwYyIsDQo+ICsgICAgIm9yMWsiIDogWyJv
cjFrIl0sDQo+ICsgICAgInBvd2VycGM6Y29tbW9uIiA6IFsicHBjIl0sDQo+ICAgICAgICJw
b3dlcnBjOmNvbW1vbjY0IiA6IFsicHBjNjQiLCAicHBjNjRsZSJdLA0KPiAtICAgICJyaXNj
djpydjMyIiA6ICJyaXNjdjMyIiwNCj4gLSAgICAicmlzY3Y6cnY2NCIgOiAicmlzY3Y2NCIs
DQo+IC0gICAgInMzOTA6NjQtYml0IiA6ICJzMzkweCIsDQo+ICsgICAgInJpc2N2OnJ2MzIi
IDogWyJyaXNjdjMyIl0sDQo+ICsgICAgInJpc2N2OnJ2NjQiIDogWyJyaXNjdjY0Il0sDQo+
ICsgICAgInMzOTA6NjQtYml0IiA6IFsiczM5MHgiXSwNCj4gICAgICAgInNoNCIgOiBbInNo
NCIsICJzaDRlYiJdLA0KPiAtICAgICJzcGFyYyI6ICJzcGFyYyIsDQo+IC0gICAgInNwYXJj
OnY4cGx1cyI6ICJzcGFyYzMycGx1cyIsDQo+IC0gICAgInNwYXJjOnY5YSIgOiAic3BhcmM2
NCIsDQo+ICsgICAgInNwYXJjIjogWyJzcGFyYyJdLA0KPiArICAgICJzcGFyYzp2OHBsdXMi
OiBbInNwYXJjMzJwbHVzIl0sDQo+ICsgICAgInNwYXJjOnY5YSIgOiBbInNwYXJjNjQiXSwN
Cj4gICAgICAgIyBubyB0cmljb3JlIGluIHVwc3RyZWFtIGdkYg0KPiAgICAgICAieHRlbnNh
IiA6IFsieHRlbnNhIiwgInh0ZW5zYWViIl0NCj4gICB9DQo+ICAgDQo+ICsNCj4gICBkZWYg
ZG9fcHJvYmUoZ2RiKToNCj4gLSAgICBnZGJfb3V0ID0gY2hlY2tfb3V0cHV0KFtnZGIsDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1leCIsICJzZXQgYXJjaGl0ZWN0dXJl
IiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLWV4IiwgInF1aXQiXSwgc3Rk
ZXJyPVNURE9VVCkNCj4gKyAgICB0cnk6DQo+ICsgICAgICAgIGdkYl9vdXQgPSBjaGVja19v
dXRwdXQoW2dkYiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLWV4Iiwg
InNldCBhcmNoaXRlY3R1cmUiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICItZXgiLCAicXVpdCJdLCBzdGRlcnI9U1RET1VULCBlbmNvZGluZz0idXRmLTgiKQ0KPiAr
ICAgIGV4Y2VwdCAoT1NFcnJvcikgYXMgZToNCj4gKyAgICAgICAgc3lzLmV4aXQoZSkNCj4g
KyAgICBleGNlcHQgQ2FsbGVkUHJvY2Vzc0Vycm9yIGFzIGU6DQo+ICsgICAgICAgIHN5cy5l
eGl0KGYne2V9LiBPdXRwdXQ6XG5cbntlLm91dHB1dH0nKQ0KPiArDQo+ICsgICAgZm91bmRf
Z2RiX2FyY2hzID0gcmUuc2VhcmNoKHInVmFsaWQgYXJndW1lbnRzIGFyZSAoLiopJywgZ2Ri
X291dCkNCj4gICANCj4gLSAgICBtID0gcmUuc2VhcmNoKHIiVmFsaWQgYXJndW1lbnRzIGFy
ZSAoLiopIiwNCj4gLSAgICAgICAgICAgICAgICAgIGdkYl9vdXQuZGVjb2RlKCJ1dGYtOCIp
KQ0KPiArICAgIHRhcmdldHMgPSBzZXQoKQ0KPiArICAgIGlmIGZvdW5kX2dkYl9hcmNoczoN
Cj4gKyAgICAgICAgZ2RiX2FyY2hzID0gZm91bmRfZ2RiX2FyY2hzLmdyb3VwKDEpLnNwbGl0
KCIsICIpDQo+ICsgICAgICAgIG1hcHBlZF9nZGJfYXJjaHMgPSBbYXJjaCBmb3IgYXJjaCBp
biBnZGJfYXJjaHMgaWYgYXJjaCBpbiBNQVBdDQo+ICAgDQo+IC0gICAgdmFsaWRfYXJjaGVz
ID0gc2V0KCkNCj4gKyAgICAgICAgdGFyZ2V0cyA9IHt0YXJnZXQgZm9yIGFyY2ggaW4gbWFw
cGVkX2dkYl9hcmNocyBmb3IgdGFyZ2V0IGluIE1BUFthcmNoXX0NCj4gICANCj4gLSAgICBp
ZiBtLmdyb3VwKDEpOg0KPiAtICAgICAgICBmb3IgYXJjaCBpbiBtLmdyb3VwKDEpLnNwbGl0
KCIsICIpOg0KPiAtICAgICAgICAgICAgaWYgYXJjaCBpbiBtYXBwaW5nczoNCj4gLSAgICAg
ICAgICAgICAgICBtYXBwaW5nID0gbWFwcGluZ3NbYXJjaF0NCj4gLSAgICAgICAgICAgICAg
ICBpZiBpc2luc3RhbmNlKG1hcHBpbmcsIHN0cik6DQo+IC0gICAgICAgICAgICAgICAgICAg
IHZhbGlkX2FyY2hlcy5hZGQobWFwcGluZykNCj4gLSAgICAgICAgICAgICAgICBlbHNlOg0K
PiAtICAgICAgICAgICAgICAgICAgICBmb3IgZW50cnkgaW4gbWFwcGluZzoNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgIHZhbGlkX2FyY2hlcy5hZGQoZW50cnkpDQo+ICsgICAgIyBR
RU1VIHRhcmdldHMNCj4gKyAgICByZXR1cm4gdGFyZ2V0cw0KPiAgIA0KPiAtICAgIHJldHVy
biB2YWxpZF9hcmNoZXMNCj4gICANCj4gICBkZWYgbWFpbigpIC0+IE5vbmU6DQo+ICAgICAg
IHBhcnNlciA9IGFyZ3BhcnNlLkFyZ3VtZW50UGFyc2VyKGRlc2NyaXB0aW9uPSdQcm9iZSBH
REIgQXJjaGl0ZWN0dXJlcycpDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxw
aWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
