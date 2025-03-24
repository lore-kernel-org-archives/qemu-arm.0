Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2181701njc;
        Mon, 24 Mar 2025 12:33:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2647:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-3030fe7223bmr21273558a91.1.1742844807550;
        Mon, 24 Mar 2025 12:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844807; cv=none;
        d=google.com; s=arc-20240605;
        b=PyeX42NTvg6+k7kH/Vp2EOgAywRYn/uNc4Uicq4UXMfJMGGLKPLDnhkxQkOugW0lOc
         YrkEKIU/jOtK4vc5cdo1g2nxZ0t4xiHh0zD76Ox/XJGlCfeOBvC0B3a5Pne/kZL2n+Oi
         JPQt2KuZlGnmq6R5ovx823j77uoh4DNtjX7y4g8ay744E1cAukmz41rZtLApeEOISCBo
         Nx79sZjGePh9PEpRNcJnt38SNMgX0WTCORQGSrmGnreyU0mRhgNmW4ienIT+Dgb/m7Bs
         p4jGPSL8vxbY547XSFphr7UGbzvUNRE7Laazh11gI8Em7TbDbjb/a8S8VIy7zFg9Hm1n
         kvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FADuRUtGLKd5sUeVMt2YSVy5VQl69kAnhXYEbSw0eyg=;
        fh=tSeUy6+dgkVxRMHQMoSkjPyjU/Dt4mSriyqhVbuUcLY=;
        b=JiUi/F7ctTUF7wHWsrCinp2yHBdJ+Nb7+CcU9dqSKF/6/h5MGkBSt503x+jMUDTIIN
         PABnmAMi4PkFJEaoHReb/9D6ZycDo2tUBI5brBzsMlE81C1kTAReVm3oiUX9O34HsS8z
         ZgclNt09tbW9533qAosJqKskSjP9DpWVjcwHlSge0uby1FnSN8HHjKvQWfB+1z4tpRiQ
         OeIdPNG0Ybs8vcXKw5UANOc6NVRBNURfCo1/kaT65mzKpB/NVXg0x1KRyxXtI3WCXGKm
         oTBCzFRSpirYD4FILSFdTDmLO3lqQfinYSxT5D/cT2/+CaZEmg3MsufO+kkFx+5JLYcy
         TscQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJko9kKZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f58b76sor45230245ad.6.2025.03.24.12.33.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJko9kKZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844807; x=1743449607; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FADuRUtGLKd5sUeVMt2YSVy5VQl69kAnhXYEbSw0eyg=;
        b=sJko9kKZ2KvXsf4o7YuAn94XVqJhYTShnDufz51zUfdTxUNfhxQjIwuJHDaNqScaHX
         yYSXUZJ8tbYcPMlUU/9u8Ii0jgAUOCSo9QGVSUKPG6mLN5X0X3rhL++Il53AR530jAv+
         EWj3/zq90SVpEuI7eXW6a0Wfwfxrgnxc3cFtvcLs7Ky3T0UBIm0zDYcu5taLu8fLCiM2
         haRu4zg8QtvjT1SxFZEhBlpa4ykBmnPyTqed2xiSK627CM9LodEhYiA8NqeHqcbesXn/
         NNxfmjbX2QIzCzX/4+PT+3cAbygEkHInn2rH2oQ61wyl0XMIXTsMcDvr47pR6Q4x6rMm
         RuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844807; x=1743449607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FADuRUtGLKd5sUeVMt2YSVy5VQl69kAnhXYEbSw0eyg=;
        b=asS83O8ewuGYwq/F1oRytZQdhLUHOb499XJq80f3+bwnhjZMn/E7Vpn2dZToPXS9Je
         GctoBJkFSyX7CDrkdjdY0dwA5W77w0Aa4BAL6T66JOUBxM676U7LiSvHO+FqpiMDw3Ey
         1VyuRDRCybGfhR4Z7l0vifHBAR9lEz1IgCZ6m1+t2Xeju/GdnHHBFwm1TbNaS8tBhNp5
         eqJCqr6ya9FM1VmTYMkURecxLk7oHI3pPKg5Xrv303ZiqA+8B5j+0tuXN3cOVJ+sGxw3
         1kgbJ+A/0b0bxqHBOOWDnWmNaxesoPrqOsS773vaxI+PO/yXN8fO0+N31ciAeAyQLgE7
         0fhw==
X-Gm-Message-State: AOJu0Yx5GV/Xp1ZO546/yRFxQQ9YeGIvbOU7gJGSqVYV//eYNFTExO/m
	U0eLBfB+Awl0YU/H949+BFVJZm/+3KO7xW+yzr2z5kQd8CjwrdbwTvjVlxvEsQIr8FhKuKoqgql
	RAYykow==
X-Gm-Gg: ASbGncvZzO5KLeqC4XBYUCokPbvBHSTmkCurTdFXXJy4R8WGLAlPBGVnfIDXFPHNnhT
	6Lh+B5v/sI9ZgGpaRhLUwy03A/S1pseaXgDIR2mkHry+9Yq8xvv0PdIIDrqbQ3rNeD6d/u2DcU/
	Q2ffmVNLPA9Ec7mSFUbtsSyHNG/di/q4hxHS23+3CGKZZtaB3vEjBvZSqxhR3PwH6i1bRj9396v
	GEaHxzXRDJIXIakwFO7GeTu9RP/eKUc1UNjuswz0cMRCwvq2zslcz+Aon2CEGe4S2wWDun4nH1V
	eJgSyRXzEP8I37/ZjXfqorKm4TRSux6BpQjuE22ILw6WTjoaW4s/Z7lfjDVNnOeVwCXI
X-Google-Smtp-Source: AGHT+IFxv+Eb8Uix1q5A1SIdx1xdvEpXw03o0WmtAHDHnOjghn5v8Zdyb7qdf9pihwte7tuUJCw0Lw==
X-Received: by 2002:a17:903:230f:b0:224:1c1:4aba with SMTP id d9443c01a7336-22780e25885mr214185895ad.50.1742844806928;
        Mon, 24 Mar 2025 12:33:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f442fsm75190975ad.227.2025.03.24.12.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:33:26 -0700 (PDT)
Message-ID: <52ce235a-147c-44ea-9188-9e6abb176264@linaro.org>
Date: Mon, 24 Mar 2025 12:33:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] include/gdbstub: add note to helpers.h
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-12-alex.bennee@linaro.org>
 <729ee2cc-ecaf-41d0-afbd-25f51952dbeb@linaro.org>
 <87v7ry2v84.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87v7ry2v84.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: tXv3a+hOFobj

T24gMy8yNC8yNSAxMDoyOSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiAyNC8z
LzI1IDExOjIxLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4gV2UndmUgbm90IHlldCBkZXBy
ZWNhdGVkIGJ1dCB3ZSBzaG91bGQgc3RlZXIgdXNlcnMgYXdheSBmcm9tIHRoZXNlDQo+Pj4g
aGVscGVycyBpZiB0aGV5IHdhbnQgdG8gYmUgaW4gYSBzaW5nbGUvaGV0ZXJvZ2VuZW91cyBi
aW5hcnkuDQo+Pg0KPj4gV2h5IG5vdCBkZXByZWNhdGU/DQo+IA0KPiBJIGd1ZXNzIHBoaWxv
c29waGljYWxseSBkbyB3ZSBleHBlY3QgdG8gZXZlbnR1YWxseSBjb252ZXJ0IGFsbCBmcm9u
dGVuZHMNCj4gdG8gdGhlIG5ldyBBUEkgb3Igb25seSB0aG9zZSB0aGF0IHdhbnQgdG8gYmUg
aW4gdGhlIHNpbmdsZSBiaW5hcnk/DQo+IFNob3VsZCBJIGp1c3QgYmUgbW9yZSBleHBsaWNp
dDoNCj4gDQo+Pj4gICAgICoNCj4+PiAgICAgKiBUaGVzZSBhcmUgYWxsIHVzZWQgYnkgdGhl
IHZhcmlvdXMgZnJvbnRlbmRzIGFuZCBoYXZlIHRvIGJlIGhvc3QNCj4+PiAtICogYXdhcmUg
dG8gZW5zdXJlIHRoaW5ncyBhcmUgc3RvcmUgaW4gdGFyZ2V0IG9yZGVyLg0KPj4+ICsgKiBh
d2FyZSB0byBlbnN1cmUgdGhpbmdzIGFyZSBzdG9yZSBpbiB0YXJnZXQgb3JkZXIuIENvbnNp
ZGVyIHVzaW5nDQo+Pj4gKyAqIHRoZSBlbmRpYW4gbmV1dHJhbCByZWdpc3RlcnMuaCBpZiB5
b3Ugd2FudCB0aGUgYXJjaGl0ZWN0dXJlIHRvIGJlDQo+Pj4gKyAqIGluY2x1ZGVkIGluIGFu
IGV2ZW50dWFsIHNpbmdsZSBRRU1VIGJpbmFyeS4NCj4+PiAgICAgKg0KPj4+ICAgICAqIENv
cHlyaWdodCAoYykgMjAyMiBMaW5hcm8gTHRkDQo+Pj4gICAgICoNCj4gDQo+IA0KPiAgIFRo
ZXNlIGFyZSBhbGwgdXNlZCBieSB0aGUgdmFyaW91cyBmcm9udGVuZHMgYW5kIGhhdmUgdG8g
YmUgaG9zdCBhd2FyZQ0KPiAgIHRvIGVuc3VyZSB0aGluZ3MgYXJlIHN0b3JlIGluIHRhcmdl
dCBvcmRlci4NCj4gDQoNCklmIHRoZSBmaXggaXMgYW4gZWFzeSAic2VkIGxpa2UiIHdpdGgg
c3RhdGljIHR5cGluZyBndWFyYW50ZWUgKHNvIG5vIGJ1ZyANCmNhbiBiZSBpbnRyb2R1Y2Vk
KSwgd2UgY2FuIHByb2JhYmx5IGp1c3QgZG8gaXQgb24gYWxsIGV4aXN0aW5nIHRhcmdldHMs
IA0KYW5kIHJlbW92ZSB0aGlzLg0KDQpJZiBpdCdzIGhhcmQgb3IgZXJyb3IgcHJvbmUsIHRo
ZW4gSSB3b3VsZCBzYXkgaXQncyBvayB0byB1c2UgYSAib25lIA0KdGFyZ2V0IGF0IGEgdGlt
ZSIgYXBwcm9hY2guDQoNCj4gICBOZXcgZnJvbnQtZW5kcyBzaG91bGQgbm90IGJlIHVzaW5n
IHRoZXNlIEFQSXMgYXQgYWxsLiBUaGV5IHNob3VsZCBiZQ0KPiAgIHVzaW5nIHRoZSBlbmRp
YW4gbmV1dHJhbCByZWdpc3RlcnMuaCBhcyBzaG91bGQgYW55IGFyY2hpdGVjdHVyZSB0aGF0
DQo+ICAgaW50ZW5kcyB0byBiZSBpbmNsdWRlZCBpbiBhbiBldmVudHVhbCBzaW5nbGUgUUVN
VSBiaW5hcnkuDQo+IA0KDQo=
