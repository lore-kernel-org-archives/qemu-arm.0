Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2179766njc;
        Mon, 24 Mar 2025 12:29:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt+lU4SeaZy+F19dY5Alo++jze5H+D2pfMI8R+DtW8Z5hB0KQa7P2Wml5xGp4NZ+ufviRrhiQ6lTOzuA==@linaro.org
X-Received: by 2002:a17:902:e807:b0:224:584:6f07 with SMTP id d9443c01a7336-22780e0a7f3mr184571975ad.37.1742844588298;
        Mon, 24 Mar 2025 12:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742844588; cv=none;
        d=google.com; s=arc-20240605;
        b=XyuZsSrj5rOLTHh77pZAVHM+2QpP/w3izomAXVZX411oY4tFJ/5u55dpaMTUOxO0QQ
         wnoyofDZLdUhMhdHXiDAa/BU7cqGxwpknL/FdHgtZYex1saxZum784zAUP7md2ddK55p
         PLMMijxInjAgy0IydPgUxSSQVFMLBs0YNJ7TkOamOCR6AUW5nf5P752/bp0r3Uy8yHku
         Cgcc9Am/ACvO+neK4rkL6yGJAq7J59Oo6UttRZ8+1GY/EgXi2Q0pOi9cpcpnpMHE4bbt
         3W0QIOLIOQ+vHwqy7J5c007YuvjQHJjaHYULX5w/S3VsO1pSXYJJ1EVGSAe43OFwcGWQ
         cHuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1gUOcoZKrG0/H247Yd/mAPl9poiLhT/i9E2w+eB/X+g=;
        fh=viDSNeTMzusByowfX9nkjl6w9jkLCHnINEL5KHZcYQE=;
        b=XSW5IXhv0QXJ1ZGbGDTKS4wh9YDCI9adJNFd6w6uToRAR+pdULVRevldhx/DIZaHjZ
         CCa6RrXnJdKKsLAMfR3V2yEhRTplCZ1arIYimoQ2iBpcuhHtuMJ7acbdtAKw1kFamP+o
         vaPfMZKUjoJcgbwAx8QgAgTUHCJrNihf5gGjrW/T2qbCi4eafHV95hSM6BaWyDbANhCL
         3iWX0ITj46I6Hbanz6eNd3eCKf2nOzPJNF34zWi0ii16GcaUHq/vxtmxpFRae5dwSsWr
         o8Q7LylZYmHe9ObejcrD51qTr5i9/WcfIE4KFMtub/2e/2RNfosgxggC13cdfBMX2IaY
         s9wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6x3jz9g;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f58b76sor45196095ad.6.2025.03.24.12.29.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6x3jz9g;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742844588; x=1743449388; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gUOcoZKrG0/H247Yd/mAPl9poiLhT/i9E2w+eB/X+g=;
        b=V6x3jz9gApTswAcn2NhR/Vt0QMi3d9v6+178eP1+K7UqB6cO97zVy/hD6+iSUjr6RX
         xMXkhJ4q2g0Amkv0iCxCRrydv06Z72xo0n/kU1PhL7y8ifqaSDRLhyyt5DBvqm0Dnaic
         Ggbgl17OX4Ja9L4QWo2HKzXYjaYtB+rcdAfKdpX5YL+PICfxYF0NscAt7pnnuwwCABT3
         6y0gTeGgZS9v+s2gY79+ZOn1szp9zYlOd+i7vVNCXQ9yDZPPMclCzcLr96ysvJe45kRr
         DjJP5QI+jXF7HrZX07zmCHhS4Y3P5RmoWrkrZX/MIwPEV2FHQTK/YBJoR8QklwFv0sck
         7C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742844588; x=1743449388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gUOcoZKrG0/H247Yd/mAPl9poiLhT/i9E2w+eB/X+g=;
        b=DMwpE8IZQ28+DIMGSHwqD1TWoaM2If5+wpVeunWSc6ZZ+Gq7hW54lL1asxZZLwX1Oo
         tXRVZ0AA+Hn4EqYwCoMGwt22MZqUYw+jFSTbOqLN6LdIFnfAc3IB4zproqUOhH6B0PdM
         JptETRaZ2oSQAgwHFR2YfRPpGEVLjarV76pjZgAtmojeHsjaKcnLGvpYPlEOgu14TkOp
         Y75Ge91cKxvqokrgQlKgOfqCYEeTVxY6vFlTtsxrOBAamn33JqsSA2JAEBQ3WI9Lz4GP
         sZru5zRiTounYB6GqJXqd3MeUU80SkjZ/us2O/pyCEr2E9r5wLHE3PC7r9oekdwRA2cc
         8+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUYtZon/1RwGLf/Sib7Xb2oXMJOQvPiu0ZEklGCHctDaccPQn7QXI6vnyId+ag/gaVKHgYjUNR07FNsiQ==@linaro.org
X-Gm-Message-State: AOJu0YwKBc+nUiYsekolq9qO6svsWg7fBBcQMdVEcCzC4wqENzqonRJm
	XUIHcg0jYhSZfdl1XhDhu7XYyyK6P1S0uJ0+dBAchBcP3UNGptbknEZIRSH6DScs3w==
X-Gm-Gg: ASbGncteycefpcB26bpbf6DmRDSF8OGek8Y5BC0D7TvQ0zROwhoiJJtkW1f7Glj4iuQ
	eMZd7w5MiUW744r4SDmwkK3eshBmyRM8xPg5snPit6IOA2kaNpmtuLUJAUok26sBROSv56ojakk
	ul70hZa5QE6Nw6kg9thexyyH62hyKmrVdifTevpSj6ivHGe473/A7fGhbbiiCQ7xuyEShXUiuTm
	bRG0d42R1sFK/1ZbpvZTLlbg78CO91tdyMZSWMJmEZVNv7Isd20XgpBIYOg7b3+asm+UY5wL/7H
	vtd8zjQm/pe4aK4cQNSNnGKyc2W15cCAOelMIAsP3rjhXifumrLAwAE1Vw==
X-Google-Smtp-Source: AGHT+IGGYsjhX7I7RU76Us6G+2Nch1LnIuc5jadip1mEvQxLqxby8JHpciyNivOWWbUIAH2SajLwVw==
X-Received: by 2002:a17:902:ecc4:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-22780da4003mr222366165ad.29.1742844587546;
        Mon, 24 Mar 2025 12:29:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811bd195sm74815175ad.132.2025.03.24.12.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:29:47 -0700 (PDT)
Message-ID: <7a60e516-e224-4766-830d-20e14bba3c8e@linaro.org>
Date: Mon, 24 Mar 2025 12:29:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] target/ppc: convert gdbstub to new helpers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-10-alex.bennee@linaro.org>
 <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c99b4b18-2222-4868-9e2d-78305e530663@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: mVQHbLDD5H7E

T24gMy8yNC8yNSAxMDozOSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMjQv
MjUgMDM6MjEsIEFsZXggQmVubsOpZSB3cm90ZToNCj4+ICsgICAgI2lmZGVmIFRBUkdFVF9C
SUdfRU5ESUFODQo+PiArICAgIE1lbU9wIGVuZCA9IE1PX0JFOw0KPj4gKyAgICAjZWxzZQ0K
Pj4gKyAgICBNZW1PcCBlbmQgPSBNT19MRTsNCj4+ICsgICAgI2VuZGlmDQo+PiArI2VuZGlm
DQo+IA0KPiBUaGF0J3Mgd2hhdCBNT19URSBpcyBmb3IuDQo+IA0KPj4gKy8qDQo+PiArICog
SGVscGVycyBjb3BpZWQgZnJvbSBoZWxwZXJzLmgganVzdCBmb3IgaGFuZGxpbmcgdGFyZ2V0
X3Vsb25nIHZhbHVlcw0KPj4gKyAqIGZyb20gZ2Ric3R1YidzIEdCeXRlQXJyYXkgYmFzZWQg
b24gd2hhdCB0aGUgYnVpbGQgY29uZmlnIGlzLiBUaGlzDQo+PiArICogd2lsbCBuZWVkIGZp
eGluZyBmb3Igc2luZ2xlLWJpbmFyeS4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjaWYgVEFSR0VU
X0xPTkdfQklUUyA9PSA2NA0KPj4gKyNkZWZpbmUgbGR0dWxfcChhZGRyKSBsZHFfcChhZGRy
KQ0KPj4gKyNkZWZpbmUgZ2RiX2dldF9yZWdsX3ZhbHVlKG0sIGIsIHYpIGdkYl9nZXRfcmVn
NjRfdmFsdWUobSwgYiwgdikNCj4+ICsjZWxzZQ0KPj4gKyNkZWZpbmUgbGR0dWxfcChhZGRy
KSBsZGxfcChhZGRyKQ0KPj4gKyNkZWZpbmUgZ2RiX2dldF9yZWdsX3ZhbHVlKG0sIGIsIHYp
IGdkYl9nZXRfcmVnMzJfdmFsdWUobSwgYiwgdikNCj4+ICsjZW5kaWYNCj4gDQo+IFN1cmVs
eSB5b3UncmUgbm90IGludGVuZGluZyB0byByZXBsaWNhdGUgdGhpcyBpbiBhbnkgdGFyZ2V0
IHRoYXQgY2FuIGhhdmUgbXVsdGlwbGUgc2l6ZXM/DQo+IFRoaXMgaXMgbm90IGFuIGltcHJv
dmVtZW50Lg0KPiANCg0KSWYgSSdtIGNvcnJlY3QgKGFuZCBmcm9tIHYxKSwgcHBjIGlzIHRo
ZSBvbmx5IGFyY2hpdGVjdHVyZSBoYXZpbmcgDQpyZWdpc3RlcnMgZGVmaW5lZCB3aXRoIHRh
cmdldF9sb25nIHR5cGVzLg0KDQpTbyBhdCB0aGUgdGltZSBJIHN1Z2dlc3RlZCB0byBlaXRo
ZXIgbW92ZSB0aGUgbWFjcm8gZGVmaW5pdGlvbiBpbiBhIA0KaGVhZGVyIChoZWxwZXJzLXRh
cmdldC5oKSBhbmQgZGVhbCB3aXRoIHBwYyBsYXRlciwgb3IgcmVwbGFjZSBwcGMgDQpyZWdp
c3RlcnMgZGVmaW5pdGlvbiwgd2hpY2ggaXMgc3VyZWx5IG1vcmUgY29tcGxpY2F0ZWQgdG8g
ZG8gYXQgdGhlIG1vbWVudC4NCg0KTW92aW5nIG1hY3JvIGRlZmluaXRpb24gZGlyZWN0bHkg
aW4gdGhpcyBmaWxlIChpZiBpdCdzIHJlYWxseSB0aGUgb25seSANCm9uZSBuZWVkaW5nIGl0
KSBpcyBvayBmb3IgbWUgYXMgd2VsbC4NCg0KPiANCj4gcn4NCg0K
