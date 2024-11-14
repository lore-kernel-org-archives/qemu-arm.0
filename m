Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp2040dll;
        Thu, 14 Nov 2024 09:23:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXS03oZBgm8TvcRF5z150DfT/SYct7ybRl0//p6AVZer2PCaDkrNB5IqR4j6ogb5j4zREeGEhZivEXeUA==@linaro.org
X-Received: by 2002:a17:903:1787:b0:211:ced6:7056 with SMTP id d9443c01a7336-211ced67094mr7107695ad.30.1731604426063;
        Thu, 14 Nov 2024 09:13:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731604426; cv=none;
        d=google.com; s=arc-20240605;
        b=EvNk39kRp5l728WL8+B0EAGFBGoOjETwqVPl7jnaoXxTaZVeWdK3GhRcr/HTBKOLHU
         aFPfx9X3/ooZyRxTK1bewTzlG/3GgbOyUbj5+Qc8JlgmXgoe6RGBMpsTaYZs7KBhL8A2
         IzU8vNcFmAwbi7nITw6KHS5IaPLaVHogDV+vcZMvTIg3j1sGEkxdlZr5JqLZprYvlsfl
         EvIeoCrRqYj4F+C5+vVAOHWc2Fc0gvBc7593DyJVvGD+yhT8DCK5/j0HnDfzo5RGtnks
         ZUwdpV/BwWb4PTK15mJQBSxwamQnrI1Dl8BcDQ12aXuZISCpPCqlw8GVirWS85iNLXI/
         6Nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1S4kl0Wc7DondKyIIA0GBxvrpljQ86jixVzu7yYNSIk=;
        fh=/hqMst2T+3LHc6KmLdiL6qjx4LQVLVm1o+vDJUYOA9o=;
        b=fKQynh0J0K7U10yQByYeubQ24E44epZ0OxYy/heI1BvmJ+V7C3TtcveOsH2N/cWn4U
         aRhmvsbeDkkeW8diIRp4YjslzfO6zYsAy4zWMFWCYw6NVeAG7pQvr3tyvLPttrPK6Rbm
         53E1ghXxSZl7gcqVXaXvZsp9xHPJa7tcbWcZATu1abEyegv8Cd2/yreqJZtk4hRMqBJB
         eUfYMSH7F5C+FGR+k4MX0EDlHEEv6F6Wxp0r6ZuHl0gWBJ2qAyjVndqG6YEZnbJwlD4S
         wZGhlKhqE3CDink5jfnx5aiM4MN0E9Fw5w6R4iqWAy87yVmtnXZacDK2KGoYhKUIBGYa
         daWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijmPUKy9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7ce1c68sor10794665ad.11.2024.11.14.09.13.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 09:13:46 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ijmPUKy9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731604403; x=1732209203; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1S4kl0Wc7DondKyIIA0GBxvrpljQ86jixVzu7yYNSIk=;
        b=ijmPUKy9rZi/eaqMz1vlCcUk6e3mkn2FzV3kuO+YiqLvlcd6cVc7EapB3a5yW6JTOP
         6qMJIdb3bthzuYgbNVIvFjPAA5f4s155sQ/DEo8zZspiEmAND9lTwJUKp/hTeYXY5KaU
         wDcgjVJVBDUhxCVrHDxPg36f7XJqNbcd2GlxrOaygOy9aET1a0kDa8RYl81T8kD6fIZP
         sqe+JzdtuEX1ioVAqVWGLSVxkPWZB6bZYJ+Rl90UTWyLOvP9l1rF4TblijWlwPkriYio
         dV7vmxErYl4e+wUDUmQgyiSSXnrzSCXrgMUwZCiEDFV1redexb8+VZ6m/9ZvUgT3cve/
         +hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731604403; x=1732209203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1S4kl0Wc7DondKyIIA0GBxvrpljQ86jixVzu7yYNSIk=;
        b=a2LcRrhDxYhnEGy6cIPW/dBrKP0YDzNdTdHvSMOKO0gS16tv3juI0ccHRqTCcqva2x
         buHZLs2lduTXSIjq/hGb90bo5EHa+ehdY1JXvw1led8TqQZaCldOmDr1ZXbfi6mMlr1T
         ph5y43bjs2MIJHsB1CDlUEFbDPwevtI0iBLnlfNSZ/A02KpZCMgDo1P1ySvt/pkhRqjW
         cxUtwXGt5C52FwddU5V5LBjuuErYB/72maSa0d5TJe236Xc6lop2kEFiF9+gXY5kwdod
         2N50TpX0t4Pa/EecJVEj/GjV4KHchq+vPi9lVdHHY7AaTTxZNvgseuQq66DWnHvt64YM
         7ckw==
X-Forwarded-Encrypted: i=1; AJvYcCXUhvFh7GWft9M3vXy7k3z+Qd21pXlMUGtQbQRr419Il7PDn4nn5rmzn++vsJ8EDX9Az4Wnk0b93DlF5Q==@linaro.org
X-Gm-Message-State: AOJu0YwXkw/PmYsHF0B/T21bH9e+j2SdFfVnGSdEWBnzFaZ7YaGb9Rbn
	ThtPfNyL8R7vq3P5Pk4WqsPNbOBJHNGrPO36N1NgAKeupUetPL9l55Tehzw1tmSGWg==
X-Google-Smtp-Source: AGHT+IHFEx+3uNH+loQ5sdWRXNzX/DUBg7iLKPz2X2MyhTvyYrflvy+P05asaSgwQyFwFNDhunF4yA==
X-Received: by 2002:a17:903:4306:b0:20c:f0dd:c408 with SMTP id d9443c01a7336-21183521d2bmr211430885ad.20.1731604403141;
        Thu, 14 Nov 2024 09:13:23 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7d37fb7sm13045565ad.262.2024.11.14.09.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 09:13:22 -0800 (PST)
Message-ID: <a5d8253f-b25f-4c1c-bccf-3a6185f21dc2@linaro.org>
Date: Thu, 14 Nov 2024 09:13:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] exec/translation-block: Include missing
 'exec/vaddr.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-4-philmd@linaro.org>
 <8406e329-5b09-4960-b5b7-baca62d3747c@linaro.org>
 <50fac36d-86af-48ce-890a-033887da05e1@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <50fac36d-86af-48ce-890a-033887da05e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 4mcWOwutTSwc

T24gMTEvMTQvMjQgMDc6MjMsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBP
biAxNC8xMS8yNCAwNDoxMCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+IE9uIDExLzEz
LzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4+PiAndmFkZHIn
IGlzIGRlY2xhcmVkIGluICJleGVjL3ZhZGRyLmgiLg0KPj4+IEluY2x1ZGUgaXQgaW4gb3Jk
ZXIgdG8gYXZvaWQgd2hlbiByZWZhY3RvcmluZzoNCj4+Pg0KPj4+ICDCoMKgIGluY2x1ZGUv
ZXhlYy90cmFuc2xhdGlvbi1ibG9jay5oOjU2OjU6IGVycm9yOiB1bmtub3duIHR5cGUgbmFt
ZQ0KPj4+ICd2YWRkcicNCj4+PiAgwqDCoMKgwqDCoCA1NiB8wqDCoMKgwqAgdmFkZHIgcGM7
DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgIF4NCj4+Pg0KPj4+IFNpZ25lZC1v
ZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4+
PiAtLS0NCj4+PiAgwqAgaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmggfCAxICsN
Cj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4NCj4+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9leGVjL3RyYW5zbGF0aW9uLWJsb2NrLmgNCj4+PiBiL2luY2x1
ZGUvZXhlYy90cmFuc2xhdGlvbi1ibG9jay5oDQo+Pj4gaW5kZXggYTZkMWFmNmU5Yi4uYjk5
YWZiMDA3NyAxMDA2NDQNCj4+PiAtLS0gYS9pbmNsdWRlL2V4ZWMvdHJhbnNsYXRpb24tYmxv
Y2suaA0KPj4+ICsrKyBiL2luY2x1ZGUvZXhlYy90cmFuc2xhdGlvbi1ibG9jay5oDQo+Pj4g
QEAgLTksNiArOSw3IEBADQo+Pj4gIMKgICNpbmNsdWRlICJxZW11L3RocmVhZC5oIg0KPj4+
ICDCoCAjaW5jbHVkZSAiZXhlYy9jcHUtY29tbW9uLmgiDQo+Pj4gKyNpbmNsdWRlICJleGVj
L3ZhZGRyLmgiDQo+Pj4gIMKgICNpZmRlZiBDT05GSUdfVVNFUl9PTkxZDQo+Pj4gIMKgICNp
bmNsdWRlICJxZW11L2ludGVydmFsLXRyZWUuaCINCj4+PiAgwqAgI2VuZGlmDQo+Pg0KPj4g
SSdtIGEgYml0IGNvbmZ1c2VkIGJ5IGNvbW1pdCBtZXNzYWdlLCBidXQgaXQgc2VlbXMgdGhh
dCB0aGlzIHNlcmllcyBoYXMNCj4+IHNvbWUgY29tbWl0cyB0aGF0IHdpbGwgbm90IGNvbXBp
bGUuIElzIHRoYXQgc29tZXRoaW5nIGFjY2VwdGFibGU/DQo+IA0KPiBCZWNhdXNlIGNvbW1p
dHMgbXVzdCBiZSBiaXNlY3QtYWJsZSwgdGhhdCBpcyBub3QgYWNjZXB0YWJsZS4NCj4gDQo+
IEkgdG9vayBhIGxvdCBvZiBjYXJlIHRvIG1ha2UgdGhpcyBzZXJpZXMgYnVpbGFibGUgb24g
ZWFjaCBzdGVwLA0KPiBidXQgbWlnaHQgaGF2ZSBtaXNzZWQgc29tZXRoaW5nLiBDYW4geW91
IHBvaW50IG1lIGF0IHRoZQ0KPiBjb25maWd1cmF0aW9uIHVzZWQgYW5kIGJyb2tlbiBwYXRj
aD8NCj4gDQo+IEknbGwgcmV3b3JkIHRoZSBjb21taXQgZGVzY3JpcHRpb24gYXM6DQo+IA0K
PiAtLS0NCj4gJ3ZhZGRyJyB0eXBlIGlzIGRlY2xhcmVkIGluICJleGVjL3ZhZGRyLmgiLg0K
PiAiZXhlYy90cmFuc2xhdGlvbi1ibG9jay5oIiB1c2VzIHRoaXMgdHlwZSB3aXRob3V0IGlu
Y2x1ZGluZw0KPiB0aGUgY29ycmVzcG9uZGluZyBoZWFkZXIuIEl0IHdvcmtzIGJlY2F1c2Ug
dGhpcyBoZWFkZXIgaXMNCj4gaW5kaXJlY3RseSBpbmNsdWRlZCwgYnV0IHdvbid0IHdvcmsg
d2hlbiB0aGUgb3RoZXIgaGVhZGVycw0KPiBhcmUgcmVmYWN0b3JlZDoNCj4gDQo+ICAgICBb
ZXJyb3JdDQo+IA0KPiBFeHBsaXRseSBpbmNsdWRlICJleGVjL3ZhZGRyLmgiIHRvIGF2b2lk
IHN1Y2ggcHJvYmxlbSBpbiBhDQo+IGZldyBjb21taXRzLg0KPiAtLS0NCj4gDQo+IERvZXMg
aXQgY2xhcmlmeT8NCj4gDQoNClllcyBpdCdzIG1vcmUgY2xlYXIgbGlrZSB0aGF0LiBUaGUg
Y29tbWl0IG1lc3NhZ2Ugc2VlbWVkIHRvIGltcGx5IHRoYXQgDQp5b3Ugd2VyZSBmaXhpbmcg
YnVpbGQgb25lIHN0ZXAgYXQgYSB0aW1lLg0KDQo+PiBJZiBpdCdzIG9rLA0KPj4gUmV2aWV3
ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4N
Cj4+DQo+IA0KDQpUaGFua3MsDQpQaWVycmljaw0K
