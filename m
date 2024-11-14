Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp90117njc;
        Wed, 13 Nov 2024 20:13:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEulkfnpX77HySeUcfd/a9TGiWVRzGnSNT9R9f1oMHkAWnu1pEtXNnxUhMjX0wFFwIOn2Iwi/cUfe7jg==@linaro.org
X-Received: by 2002:a17:902:f683:b0:20d:f55:8a17 with SMTP id d9443c01a7336-211b5bcc5c7mr70581475ad.6.1731557618182;
        Wed, 13 Nov 2024 20:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557618; cv=none;
        d=google.com; s=arc-20240605;
        b=e6DDdLNJakTSkt/PcAFtlNm0k8Yl7hiaxgejybQNVyL42Pxfl2CzWKsqopl67DthoO
         3hAn5w+VRGKS6kQlxBGUwobwc/FcrOGsOY/38/sdKJcklmzY17O+Y/eJbb9RtoUITpce
         ZKym01Zkq/t/DLkyHcUq54ibf0MPycPVwVEHQjuAIqFyw/L5/XVMpL8Xif74OYLs4Rp7
         +hWx46A5WcTvXKvgf06TfKR4oeYWfai5F1e66sfzylsD+m6EGapMSiCOpYcNVynoThHb
         R130n5bMhP83T5tJ7A7JKTfOEvt4H2DQKG32ZJX3h0YvZMiXn/hB/N+s8Urh+KjKTqFo
         ZfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8uDsC5HYEN4LMUpFD6Js0X22bzIkQyLv9O6arsIpmOE=;
        fh=XteCndZwiGXyUqoiWHj4cbzDIJ+yXC5cGPuR71a2EWQ=;
        b=iQKVO5Lz8b1XrQD953beez7Z3rgH4xdimrjEuekqlK4M6Xq2N6QogTzFPyX4R2pLCZ
         hEW/Ua2ok6V0Y/ot7bYnnbu0KTOqALGTHobF7yQjc9/h4zKMUlJjDrO3Am5uOPKg+INr
         lVT4x1jKGFgLXMRy3GlhQQLOGRHKFLb40FyYlP+t1XO9tjvJsaklCS/iND5TAsLqoURU
         lYMn04rZksRqwbHZR1EdmMIF/ILI51/kEHTZHnxkcsdUMGjv+loqScC+WwD8/ASGGGY+
         uv1448kaTHWD65NvfyQk6zum5XWjeaOu+Qrli6UeapRTYnjznuHkyEA0sA7y+SuUpyoV
         KG1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItTa4PdI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7cc7627sor1683715ad.6.2024.11.13.20.13.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItTa4PdI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557618; x=1732162418; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uDsC5HYEN4LMUpFD6Js0X22bzIkQyLv9O6arsIpmOE=;
        b=ItTa4PdI/JrDR4MF2WyrTkRh7mT7NKXlP1tA9ZxAFwYBtlTUPss6L4XSO/I0ZsZ+Xg
         X7La6U4n7WkPOIUVHCDlI1TwO+sr8PSwo6+6RrFuDWijQJsisMELKA3LgokLzsAj3dh8
         JTrlBF+Ocay00eBZcVZlfruSD2rfBhSg52NOO7/juGI0gl1WcktbAMT1cvDmgPGX77eJ
         ym0GBostluzQ/ybcCcc8n0Yxr7l9SrI+swMVPj/Tcd4LXboRifpCI2yuyGhq8Bxo2QGO
         GNlZCo6sC1R/kWWZvX5FUtUFJwZSRV19f0tDhBGJBBk2u20qPy37JtmdaDBCRokBcRmM
         eDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557618; x=1732162418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uDsC5HYEN4LMUpFD6Js0X22bzIkQyLv9O6arsIpmOE=;
        b=jC6mjTC5MYHTi7td8mxtNAXb6hl/sw4kuEYcvBXkMe3yBCCwbi6vVUo5H925/n0Jno
         m5R99yI2d8OSJHhpzeSVpYFF7UFaR3xr5L+4viKdLxgB1Fl3lOHynjQlXKS0QJo5dZqe
         W39Qe+TRiSwsa8MD9BJFwRRuYSTOInioZTmRqonXD3Vrre+A6KZ5QrwK+2I05k35AMpx
         Qp0AWaG4OX4VdU2/3+c9Dl34EyXBlZp6hbon2+VAsWR2EIpa26R4UDTS21sOIVxbuUJQ
         29nk62STllS49O3xyI1aHZ+hStKDIBNToLYW7jGxLAR+EpvmxGXkc5R9UMGhPHA1MkB1
         8Erg==
X-Forwarded-Encrypted: i=1; AJvYcCUBBhc32Z5+IMeZ3sb+jZY+SoybS2GXfQszw5/NKHdvktmG/8QUkvrmjPBUZbWBhyYhYXLQL4nRcE7N7w==@linaro.org
X-Gm-Message-State: AOJu0YyxFsOK7B6toToMK/TxPv36n5CO4JFV5qj5l0yAHX5V/LsNZI2P
	Wqu6Lqwq7Es+3EPL/m+upAnu8DcPabvpUVHsS1GuI4pp6U023O3c92k+KFCaM3ATqQ==
X-Google-Smtp-Source: AGHT+IHBzQj2j/wYBez7Gm4MKcCxgkSeXlWt4tgwuFEcMmnshM5OpMbdungsYJH6jEkk56vj/Eo9ZQ==
X-Received: by 2002:a05:6a20:e607:b0:1db:92e5:d2a7 with SMTP id adf61e73a8af0-1dc7037e46emr7740980637.15.1731557617617;
        Wed, 13 Nov 2024 20:13:37 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b39766dfsm137544a12.58.2024.11.13.20.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:13:37 -0800 (PST)
Message-ID: <6567c939-8c09-4fa0-8851-5252bf8e7955@linaro.org>
Date: Wed, 13 Nov 2024 20:13:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] exec: Declare tlb_set_page_full() in
 'exec/cputlb.h'
Content-Language: en-US
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
 <20241114011310.3615-16-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 2vdyHlgT4iyq

T24gMTEvMTMvMjQgMTc6MTMsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBN
b3ZlIENQVSBUTEIgcmVsYXRlZCBtZXRob2RzIHRvICJleGVjL2NwdXRsYi5oIi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdXRsYi5oICAgICB8IDIzICsrKysr
KysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmggICB8IDIy
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICB0YXJnZXQvc3BhcmMvbW11X2hlbHBlci5j
IHwgIDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDIzIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9jcHV0bGIuaCBi
L2luY2x1ZGUvZXhlYy9jcHV0bGIuaA0KPiBpbmRleCA1Mzg2ZTUzODA2Li5mNjIwNWQ1MzA2
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMvY3B1dGxiLmgNCj4gKysrIGIvaW5jbHVk
ZS9leGVjL2NwdXRsYi5oDQo+IEBAIC0yMSw2ICsyMSw3IEBADQo+ICAgI2RlZmluZSBDUFVU
TEJfSA0KPiAgIA0KPiAgICNpbmNsdWRlICJleGVjL2NwdS1jb21tb24uaCINCj4gKyNpbmNs
dWRlICJleGVjL3ZhZGRyLmgiDQo+ICAgDQo+ICAgI2lmIGRlZmluZWQoQ09ORklHX1RDRykg
JiYgIWRlZmluZWQoQ09ORklHX1VTRVJfT05MWSkNCj4gICANCj4gQEAgLTU3LDQgKzU4LDI2
IEBAIHZvaWQgdGxiX3Jlc2V0X2RpcnR5X3JhbmdlX2FsbChyYW1fYWRkcl90IHN0YXJ0LCBy
YW1fYWRkcl90IGxlbmd0aCk7DQo+ICAgDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICsvKioNCj4g
KyAqIHRsYl9zZXRfcGFnZV9mdWxsOg0KPiArICogQGNwdTogQ1BVIGNvbnRleHQNCj4gKyAq
IEBtbXVfaWR4OiBtbXUgaW5kZXggb2YgdGhlIHRsYiB0byBtb2RpZnkNCj4gKyAqIEBhZGRy
OiB2aXJ0dWFsIGFkZHJlc3Mgb2YgdGhlIGVudHJ5IHRvIGFkZA0KPiArICogQGZ1bGw6IHRo
ZSBkZXRhaWxzIG9mIHRoZSB0bGIgZW50cnkNCj4gKyAqDQo+ICsgKiBBZGQgYW4gZW50cnkg
dG8gQGNwdSB0bGIgaW5kZXggQG1tdV9pZHguICBBbGwgb2YgdGhlIGZpZWxkcyBvZg0KPiAr
ICogQGZ1bGwgbXVzdCBiZSBmaWxsZWQsIGV4Y2VwdCBmb3IgeGxhdF9zZWN0aW9uLCBhbmQg
Y29uc3RpdHV0ZQ0KPiArICogdGhlIGNvbXBsZXRlIGRlc2NyaXB0aW9uIG9mIHRoZSB0cmFu
c2xhdGVkIHBhZ2UuDQo+ICsgKg0KPiArICogVGhpcyBpcyBnZW5lcmFsbHkgY2FsbGVkIGJ5
IHRoZSB0YXJnZXQgdGxiX2ZpbGwgZnVuY3Rpb24gYWZ0ZXINCj4gKyAqIGhhdmluZyBwZXJm
b3JtZWQgYSBzdWNjZXNzZnVsIHBhZ2UgdGFibGUgd2FsayB0byBmaW5kIHRoZSBwaHlzaWNh
bA0KPiArICogYWRkcmVzcyBhbmQgYXR0cmlidXRlcyBmb3IgdGhlIHRyYW5zbGF0aW9uLg0K
PiArICoNCj4gKyAqIEF0IG1vc3Qgb25lIGVudHJ5IGZvciBhIGdpdmVuIHZpcnR1YWwgYWRk
cmVzcyBpcyBwZXJtaXR0ZWQuIE9ubHkgYQ0KPiArICogc2luZ2xlIFRBUkdFVF9QQUdFX1NJ
WkUgcmVnaW9uIGlzIG1hcHBlZDsgQGZ1bGwtPmxnX3BhZ2Vfc2l6ZSBpcyBvbmx5DQo+ICsg
KiB1c2VkIGJ5IHRsYl9mbHVzaF9wYWdlLg0KPiArICovDQo+ICt2b2lkIHRsYl9zZXRfcGFn
ZV9mdWxsKENQVVN0YXRlICpjcHUsIGludCBtbXVfaWR4LCB2YWRkciBhZGRyLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBDUFVUTEJFbnRyeUZ1bGwgKmZ1bGwpOw0KPiArDQo+ICAg
I2VuZGlmDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMvZXhlYy1hbGwuaCBiL2luY2x1
ZGUvZXhlYy9leGVjLWFsbC5oDQo+IGluZGV4IGQ3OTIyMDM3NzMuLjc5NjQ5NTM3YjAgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oDQo+ICsrKyBiL2luY2x1ZGUv
ZXhlYy9leGVjLWFsbC5oDQo+IEBAIC0xNzQsMjggKzE3NCw2IEBAIHZvaWQgdGxiX2ZsdXNo
X3JhbmdlX2J5X21tdWlkeF9hbGxfY3B1c19zeW5jZWQoQ1BVU3RhdGUgKmNwdSwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90
IGlkeG1hcCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGJpdHMpOw0KPiAgIA0KPiAtLyoqDQo+IC0gKiB0bGJfc2V0X3Bh
Z2VfZnVsbDoNCj4gLSAqIEBjcHU6IENQVSBjb250ZXh0DQo+IC0gKiBAbW11X2lkeDogbW11
IGluZGV4IG9mIHRoZSB0bGIgdG8gbW9kaWZ5DQo+IC0gKiBAYWRkcjogdmlydHVhbCBhZGRy
ZXNzIG9mIHRoZSBlbnRyeSB0byBhZGQNCj4gLSAqIEBmdWxsOiB0aGUgZGV0YWlscyBvZiB0
aGUgdGxiIGVudHJ5DQo+IC0gKg0KPiAtICogQWRkIGFuIGVudHJ5IHRvIEBjcHUgdGxiIGlu
ZGV4IEBtbXVfaWR4LiAgQWxsIG9mIHRoZSBmaWVsZHMgb2YNCj4gLSAqIEBmdWxsIG11c3Qg
YmUgZmlsbGVkLCBleGNlcHQgZm9yIHhsYXRfc2VjdGlvbiwgYW5kIGNvbnN0aXR1dGUNCj4g
LSAqIHRoZSBjb21wbGV0ZSBkZXNjcmlwdGlvbiBvZiB0aGUgdHJhbnNsYXRlZCBwYWdlLg0K
PiAtICoNCj4gLSAqIFRoaXMgaXMgZ2VuZXJhbGx5IGNhbGxlZCBieSB0aGUgdGFyZ2V0IHRs
Yl9maWxsIGZ1bmN0aW9uIGFmdGVyDQo+IC0gKiBoYXZpbmcgcGVyZm9ybWVkIGEgc3VjY2Vz
c2Z1bCBwYWdlIHRhYmxlIHdhbGsgdG8gZmluZCB0aGUgcGh5c2ljYWwNCj4gLSAqIGFkZHJl
c3MgYW5kIGF0dHJpYnV0ZXMgZm9yIHRoZSB0cmFuc2xhdGlvbi4NCj4gLSAqDQo+IC0gKiBB
dCBtb3N0IG9uZSBlbnRyeSBmb3IgYSBnaXZlbiB2aXJ0dWFsIGFkZHJlc3MgaXMgcGVybWl0
dGVkLiBPbmx5IGENCj4gLSAqIHNpbmdsZSBUQVJHRVRfUEFHRV9TSVpFIHJlZ2lvbiBpcyBt
YXBwZWQ7IEBmdWxsLT5sZ19wYWdlX3NpemUgaXMgb25seQ0KPiAtICogdXNlZCBieSB0bGJf
Zmx1c2hfcGFnZS4NCj4gLSAqLw0KPiAtdm9pZCB0bGJfc2V0X3BhZ2VfZnVsbChDUFVTdGF0
ZSAqY3B1LCBpbnQgbW11X2lkeCwgdmFkZHIgYWRkciwNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgQ1BVVExCRW50cnlGdWxsICpmdWxsKTsNCj4gLQ0KPiAgIC8qKg0KPiAgICAqIHRs
Yl9zZXRfcGFnZV93aXRoX2F0dHJzOg0KPiAgICAqIEBjcHU6IENQVSB0byBhZGQgdGhpcyBU
TEIgZW50cnkgZm9yDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvc3BhcmMvbW11X2hlbHBlci5j
IGIvdGFyZ2V0L3NwYXJjL21tdV9oZWxwZXIuYw0KPiBpbmRleCA5ZmYwNjAyNmI4Li43NTQ4
ZDAxNzc3IDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvc3BhcmMvbW11X2hlbHBlci5jDQo+ICsr
KyBiL3RhcmdldC9zcGFyYy9tbXVfaGVscGVyLmMNCj4gQEAgLTIwLDcgKzIwLDcgQEANCj4g
ICAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPiAgICNpbmNsdWRlICJxZW11L2xvZy5oIg0K
PiAgICNpbmNsdWRlICJjcHUuaCINCj4gLSNpbmNsdWRlICJleGVjL2V4ZWMtYWxsLmgiDQo+
ICsjaW5jbHVkZSAiZXhlYy9jcHV0bGIuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9wYWdlLXBy
b3RlY3Rpb24uaCINCj4gICAjaW5jbHVkZSAicWVtdS9xZW11LXByaW50LmgiDQo+ICAgI2lu
Y2x1ZGUgInRyYWNlLmgiDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVy
cmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
