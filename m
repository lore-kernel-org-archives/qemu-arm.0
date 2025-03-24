Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2168463njc;
        Mon, 24 Mar 2025 12:08:30 -0700 (PDT)
X-Received: by 2002:a17:902:dc86:b0:224:192a:9154 with SMTP id d9443c01a7336-22780d8a58cmr181643975ad.26.1742843310221;
        Mon, 24 Mar 2025 12:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843310; cv=none;
        d=google.com; s=arc-20240605;
        b=CdNM88WavrW7SO2n9uYCPdl1245Lfm+9lDgauAQQRWVM9HeAt0v/f/RYt3caydVypN
         7V85GSKlchTJ4Wxuq1ZKrDOmmasfGM3xki1RCpUo0JDL/UDKd4RkFczolW6Nb7ffHCZM
         zscYLvgIK+ssDWmbFE04iwiaSSsPMn50xM6PCp5kJohZz5S/QnylbfC1wxBHI6wO0DaB
         LinaOeL5jd9yLRbbRdBLuxt0HL1L2i9D7nOb7kQyUq19dFsJRFpyACDdsAEZn5fxGymq
         quFSGtNBTrmlMndNaDDMaMkIOxIhbIWSfvKhIsDOAVQqHmVjRdEC6G6678brxtFSczFS
         JTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3hxd9TjbuxbbcSjEYfZrsu0AQmn+kcJqOpgfKlf0s18=;
        fh=S5GSTan/Ij3m0L5gXmsaN27XyTPq7TyOvTnLDu8EFk8=;
        b=CjiKisx6fWRPPWkum/FUs9w52wVf1p0KSmCYgcjDvOWwZhDwouDsHDSJ3d5GJD53Va
         k3sUUAW30jkTTFoeYRvHtIFpiG/LvFVcm/dpddZ/XknT1IeK1vpWmD1AWFpkT7CU8uqh
         XAZ+a1uy6DPwfGtW1nzQy9HbG9idZpm/e8LpnZjmU+Pb9mvag5fACFRl+st6GKO+xAab
         lHAoVatAg+fpqlOH4rjD29Musu5OBObxiwZuJ4clUlzbhUN0EwUD6vtm2fUktzksMk6b
         3CNu8/cTRBn5RzUSfuUl7yqXhqROCZtHIXkQwFV8rueblNf+pAnBt2kHFhnlTC7AlTS5
         fHEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sx2RmDIB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f92589sor7410609b3a.2.2025.03.24.12.08.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sx2RmDIB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742843310; x=1743448110; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hxd9TjbuxbbcSjEYfZrsu0AQmn+kcJqOpgfKlf0s18=;
        b=sx2RmDIBWMg2VfaxTq92sBXSY8VxdfpFY/7gPjg4xgY6mavMXKcPQx58hH3wSGtGrB
         y1Es8vm6xV3Jf9XFfk2mNniNaQV20Z7Lg/txxrbhbo4pIYkVI2Ydw3oPAqj/wUjxPwh7
         Tjbvbtd2Hkdcckokbsds5YKkktoKcLRr4R4bRvhdQZJofY8UZrfubhKQChPjUJVUoids
         jvqEp+PGsDQ9ETdtb2qogzwOuDI0porPK3U8RinzXmaHXO4QXX6YXGmPfFEZ584q0x11
         Pf4EvU2Xz1b8/qChq8vX5HAP2PXLAyQ8U9FKTSKWV/PQ3VneisPOYS1NRVYCia5hVJ/f
         9ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843310; x=1743448110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hxd9TjbuxbbcSjEYfZrsu0AQmn+kcJqOpgfKlf0s18=;
        b=Flwyba1/z1VLVlxhjtNhVvXnRU05Bu7v4UuNPnYtmN5UFbsAbgJehIMbIOegOcME/U
         zGu8h43mg8j7acOAKpJHpWpIAMl1ZiEmzuYgYBwnTvaDXWRZDKiDNDyVOMF3se5vnfIi
         GPePIsj5kHJi0hv9mRFf3bKN6JzcM4g1fFH4Adnc43bKtakmv3mWeyHmv1HKE07xcOCK
         h1sPYeWt4s7A808mdONSsvbF81CruCKuW0W08F8sGU9ucrQFmnvr+wZjGc/zj0EgoHT7
         zChR3qP+ecLhVURys8bAF1bOHL2gg8M3wca4sAaWIGm0nQphLl2cNKw+1MnxQ4W4h6X2
         GPzg==
X-Gm-Message-State: AOJu0YzfoA9mRox0rxDE6bkkDHaSxf+oQaovfFKrgYacsdpcTJRgWbvl
	WyKs75uPh1vBuBCesaVPYwlE+Vy51g40er6zLVmE1ac0oeb6hVlueHFQwAe0uvxqoHp0WrU4L4G
	vmAQRvA==
X-Gm-Gg: ASbGncsoeOZVzk6E2g74vrysyk0r4gUBj6ZKk1W9q8vDiBmAS3E5zEAdh9/hT/KCKUg
	PyOR3OOrHX1Nvq9MgNJp4sone8PCZsS41+6BIhBzmfFcKqUM3stZssxCXBWNjMVE1Mv1WV1QIo3
	0wxC6Zi/D0vysOa3vL9GhI/2SVtDqYSj9xpiYG2Dr0LTfdoccAecul0kBbUz/Oemn1cmU4JnL2A
	lb5c6sCj16NJ7Mbd7UpPGQUEfwTp+5NilBIYQaZGbVBA2eiS7r8K/VyT14AWJY+hW1G/e3gpvnH
	3S4ASmmUHJeaGIvU7Xsm/M+VZE1E71IlbXdhzrcvT9bnwLKjeC/OL3bPrw==
X-Google-Smtp-Source: AGHT+IEXNdbwNQppmYqzEzNovtbETxCADLuZzrBPE/gdXQXMi/p+ji+5wXCtxNdSyQQaivhkUEEM5Q==
X-Received: by 2002:a05:6a00:4fc7:b0:736:326a:bb3e with SMTP id d2e1a72fcca58-73905a13e8fmr21613771b3a.15.1742843309548;
        Mon, 24 Mar 2025 12:08:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fab72asm8388431b3a.27.2025.03.24.12.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:08:29 -0700 (PDT)
Message-ID: <0e93f4d6-16ca-4462-a621-dcbc200685e7@linaro.org>
Date: Mon, 24 Mar 2025 12:08:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] include/exec: fix assert in size_memop
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: T+Y742a67he+

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBXZSBjYW4gaGFuZGxl
IGxhcmdlciBzaXplZCBtZW1vcHMgbm93LCBleHBhbmQgdGhlIHJhbmdlIG9mIHRoZSBhc3Nl
cnQuDQo+IA0KPiBGaXhlczogNGI0NzNlMGM2MCAodGNnOiBFeHBhbmQgTU9fU0laRSB0byAz
IGJpdHMpDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGlu
YXJvLm9yZz4NCj4gDQo+IC0tLQ0KPiB2Mg0KPiAgICAtIGluc3RlYWQgb2YgMTI4IHVzZSAx
IDw8IE1PX1NJWkUgZm9yIGZ1dHVyZSBwcm9vZmluZw0KPiAtLS0NCj4gICBpbmNsdWRlL2V4
ZWMvbWVtb3AuaCB8IDQgKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL21l
bW9wLmggYi9pbmNsdWRlL2V4ZWMvbWVtb3AuaA0KPiBpbmRleCA0MDdhNDdkODJjLi42YWZl
NTBhN2QwIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2V4ZWMvbWVtb3AuaA0KPiArKysgYi9p
bmNsdWRlL2V4ZWMvbWVtb3AuaA0KPiBAQCAtMTYyLDggKzE2Miw4IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbWVtb3Bfc2l6ZShNZW1PcCBvcCkNCj4gICBzdGF0aWMgaW5saW5lIE1l
bU9wIHNpemVfbWVtb3AodW5zaWduZWQgc2l6ZSkNCj4gICB7DQo+ICAgI2lmZGVmIENPTkZJ
R19ERUJVR19UQ0cNCj4gLSAgICAvKiBQb3dlciBvZiAyIHVwIHRvIDguICAqLw0KPiAtICAg
IGFzc2VydCgoc2l6ZSAmIChzaXplIC0gMSkpID09IDAgJiYgc2l6ZSA+PSAxICYmIHNpemUg
PD0gOCk7DQo+ICsgICAgLyogUG93ZXIgb2YgMiB1cCB0byAxMjguICAqLw0KPiArICAgIGFz
c2VydCgoc2l6ZSAmIChzaXplIC0gMSkpID09IDAgJiYgc2l6ZSA+PSAxICYmIHNpemUgPD0g
KDEgPDwgTU9fU0laRSkpOw0KPiAgICNlbmRpZg0KPiAgICAgICByZXR1cm4gKE1lbU9wKWN0
ejMyKHNpemUpOw0KPiAgIH0NCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBp
ZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg0K
