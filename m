Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp313339njl;
        Tue, 1 Oct 2024 09:45:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnw9blVDdUVTpYZQo98VeblabPZyFyONUkU3ri7270JOxDv737ype9XzqVa9rLxClqWKOw+b3CTRTy+g==@linaro.org
X-Received: by 2002:a17:902:e88f:b0:20b:6c1e:1e13 with SMTP id d9443c01a7336-20ba9f18ba7mr59542775ad.23.1727801139814;
        Tue, 01 Oct 2024 09:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801139; cv=none;
        d=google.com; s=arc-20160816;
        b=d7xU5Ct9Za/8phPln/RS+SHuraiI68NunxZUfBkvZS4JsBkjnZ8B+iYfgEr+mo6r0c
         NYpsAyO8pTTKpBbp5N9GAy3l0etbJpRJUqpjjJJTdjM52Twpfev9aT8n7LPaD5VW7Ug8
         MsZz/ejqyVM5QvMaAi7ZDzYMIZUsyp2ZmHl2jiQv8BBCuQlUDPad0xa/LeY9kJCzIScX
         Y8e8SmL2iWyp+jE1YkDjsOxEdQU5yEAismCkIgR4Y7/NdgJEnrMZkHoptW2gjsiVwkRK
         nvaOgLsOXkakvX/L/zNcclpTDj+5tuADK6iCVZFppMu8cWEYviTa93N0UB5Z5QoaKs+Q
         wSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lsJSnuAxS8RZSzd2UMiRd3fh62oaT3/DBU+mJRHXMJ4=;
        fh=3a9eynEOUkr/Bs4LxgLagrIXDGxJJKZ4jDMhVsyBzlY=;
        b=w4fl6JQCHG5ejmUcw2jr38LhtxNlwe+hp4gKmCboE3QiLdWs/ec0w83jg8awmyrebN
         wJIGaRYbBV67V2MXYLTd/B+AGqynLO4oi8AeZH1fz5bpm0MzK/h8jMT8YFRE+U+Z/+kD
         2kBarFN24R1AK3a/UqoSl3ck00rMfK7E1nv9yg6s26SMensB80QQM7zG8rGXW6/kUstq
         atT3nz4zGsevNMV59UQWUtWJ5To2AR88eOGp9K8pxcgky+ahlO3OWopxuVn7TuFJr2dA
         gFWAVSfnng2vWj6iON1OCGEs4dXhEAvA5U5UL0ZNXdRCu9jQ5MTYab1STA5ZYkJ7oBCR
         oMWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wdKMGxWs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7e6c34815e7sor6595535a12.4.2024.10.01.09.45.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wdKMGxWs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801139; x=1728405939; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsJSnuAxS8RZSzd2UMiRd3fh62oaT3/DBU+mJRHXMJ4=;
        b=wdKMGxWsfOumgk13m2Nnvvx1jecAt3JPGd/BrEeLNgrtC/M8R+FuWIv5JSVO7N5Tfo
         Mtbt5VONxMgzY6R4+M/RmCI7GJ4TbvPxD5fgkEtsbSqUhrETvuSp+av5Pj0Ub8NvcIEH
         oHzyRzOxb+OSTtyX3hMTt8PkxXPaD3dhwHFD+Tp7G3OKq96G4D6+8JVOhWt1tjTQbFBH
         CLhivWxe/9PM9AB8x7QJ9zTllw4mURRF90IcrtD8hYQNBsSzM6zX2T0jaNfrhKmljHks
         v35bKGmYECa8unLVv9fe6ixnXgmKmhCXKFbOotQ60u1kxVLFlvIl5jUIcjoN0sWv3xQA
         DUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801139; x=1728405939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsJSnuAxS8RZSzd2UMiRd3fh62oaT3/DBU+mJRHXMJ4=;
        b=whiZwE7EsUS/s9qkXIeSXe6NV+FBeSFrNI6QCrHRjGy77Jlnxc6rFQv7J+xJhD4i7c
         97EB/kgTOLiCDw063C9XBftsT80tsE10R889gJPaKpHJJUS7NPrm9R7r14Rte4yUZiRj
         XNpOugturbxQFJrJK3JJK1KOqRYWmTItuNX4ArJBspra+KAIyvClNTl014Ab8ov86YPD
         vwBh4rrh6XUyfq+FdtNmaAGmRU6tGkT5GpDv1a5ZOH0Ih7cye7p/Ns5zazTtqug1ecOy
         WPdxeJrpXy7r8dqlzBzYnfDmtTmCWAZ+huN3KMwygJWBRmC34/TME9PyIJO6xEaW7cK7
         DVSw==
X-Forwarded-Encrypted: i=1; AJvYcCXniB2VUVLHu6otedgROPYsfD5LWifPtpnzf7b7k6UgZP7Sw49+dfXwLl34jQSQLCdDATTWvN/qpHezOg==@linaro.org
X-Gm-Message-State: AOJu0YzV5auhEVYQ8lgVj7jsGGw7GAfoCQzNkZAP7h8/0sMpwF3tS0hQ
	zD9M/b7HTbPI9qyrLineO/19GgljItjl+OCqhXM8Jp7gQ/Nv64jhZsgOAc6TihIOCA==
X-Google-Smtp-Source: AGHT+IHSIhkgJJstnW58Cn8P2W87djwsAX8GriYroUSpUaUQ5R37whB+UObowCK5XkEqly4EzogcTw==
X-Received: by 2002:a17:90a:bb0c:b0:2c9:90fa:b9f8 with SMTP id 98e67ed59e1d1-2e185211150mr333309a91.10.1727801139339;
        Tue, 01 Oct 2024 09:45:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c50e09sm10393238a91.9.2024.10.01.09.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:45:38 -0700 (PDT)
Message-ID: <465731e5-36f5-440a-bb4a-3ee0e51a30e2@linaro.org>
Date: Tue, 1 Oct 2024 09:45:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] qemu/bswap: Introduce ld/st_endian_p() API
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
 <20240930073450.33195-2-philmd@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ip/3MuL0qUQt

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IElu
dHJvZHVjZSB0aGUgbGQvc3RfZW5kaWFuX3AoKSBBUEksIHdoaWNoIHRha2VzIGFuIGV4dHJh
DQo+IGJvb2xlYW4gYXJndW1lbnQgdG8gZGlzcGF0Y2ggdG8gbGQvc3Rfe2JlLGxlfV9wKCkg
bWV0aG9kcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+IFRPRE86IFVwZGF0ZSBkb2NzdHJpbmcg
cmVnZXhwDQo+IC0tLQ0KPiAgIGluY2x1ZGUvcWVtdS9ic3dhcC5oIHwgMTkgKysrKysrKysr
KysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L2Jzd2FwLmggYi9pbmNsdWRlL3FlbXUvYnN3
YXAuaA0KPiBpbmRleCBhZDIyOTEwYTVkLi5lYzgxM2E3NTZkIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL3FlbXUvYnN3YXAuaA0KPiArKysgYi9pbmNsdWRlL3FlbXUvYnN3YXAuaA0KPiBA
QCAtNDMzLDQgKzQzMywyMyBAQCBET19TVE5fTEROX1AoYmUpDQo+ICAgI3VuZGVmIGxlX2Jz
d2Fwcw0KPiAgICN1bmRlZiBiZV9ic3dhcHMNCj4gICANCj4gKyNkZWZpbmUgbGR1d19lbmRp
YW5fcChiaWdfZW5kaWFuLCBwKSBcDQo+ICsgICAgICAgICAgICAgICAgICAgICAoYmlnX2Vu
ZGlhbikgPyBsZHV3X2JlX3AocCkgOiBsZHV3X2xlX3AocCkNCj4gKyNkZWZpbmUgbGRzd19l
bmRpYW5fcChiaWdfZW5kaWFuLCBwKSBcDQo+ICsgICAgICAgICAgICAgICAgICAgICAoYmln
X2VuZGlhbikgPyBsZHN3X2JlX3AocCkgOiBsZHN3X2JlX3AocCkNCj4gKyNkZWZpbmUgbGRs
X2VuZGlhbl9wKGJpZ19lbmRpYW4sIHApIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgKGJp
Z19lbmRpYW4pID8gbGRsX2JlX3AocCkgOiBsZGxfbGVfcChwKQ0KPiArI2RlZmluZSBsZHFf
ZW5kaWFuX3AoYmlnX2VuZGlhbiwgcCkgXA0KPiArICAgICAgICAgICAgICAgICAgICAoYmln
X2VuZGlhbikgPyBsZHFfYmVfcChwKSA6IGxkcV9sZV9wKHApDQo+ICsjZGVmaW5lIHN0d19l
bmRpYW5fcChiaWdfZW5kaWFuLCBwLCB2KSBcDQo+ICsgICAgICAgICAgICAgICAgICAgIChi
aWdfZW5kaWFuKSA/IHN0d19iZV9wKHAsIHYpIDogc3R3X2xlX3AocCwgdikNCj4gKyNkZWZp
bmUgc3RsX2VuZGlhbl9wKGJpZ19lbmRpYW4sIHAsIHYpIFwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgKGJpZ19lbmRpYW4pID8gc3RsX2JlX3AocCwgdikgOiBzdGxfbGVfcChwLCB2KQ0K
PiArI2RlZmluZSBzdHFfZW5kaWFuX3AoYmlnX2VuZGlhbiwgcCwgdikgXA0KPiArICAgICAg
ICAgICAgICAgICAgICAoYmlnX2VuZGlhbikgPyBzdHFfYmVfcChwLCB2KSA6IHN0cV9sZV9w
KHAsIHYpDQo+ICsjZGVmaW5lIGxkbl9lbmRpYW5fcChiaWdfZW5kaWFuLCBwLCBzeikgXA0K
PiArICAgICAgICAgICAgICAgICAgICAgKGJpZ19lbmRpYW4pID8gbGRuX2JlX3AocCwgc3op
IDogbGRuX2xlX3AocCwgc3opDQo+ICsjZGVmaW5lIHN0bl9lbmRpYW5fcChiaWdfZW5kaWFu
LCBwLCBzeiwgdikgXA0KPiArICAgICAgICAgICAgICAgICAgICAoYmlnX2VuZGlhbikgPyBz
dG5fYmVfcChwLCBzeiwgdikgOiBzdG5fbGVfcChwLCBzeiwgdikNCj4gKw0KPiAgICNlbmRp
ZiAvKiBCU1dBUF9IICovDQoNCk1heSBpdCBiZSB1c2VmdWwgdG8gaGF2ZSBleHRyYSBwYXJl
bnRoZXNpcyBhcm91bmQgbWFjcm8gdmFsdWUgdG8gcHJldmVudCANCmFueSBpc3N1ZSB3aGVu
IHVzaW5nIGl0Pw0KKChiaWdfZW5kaWFuKSA/IHN0bl9iZV9wKHAsIHN6LCB2KSA6IHN0bl9s
ZV9wKHAsIHN6LCB2KSkNCg0KRWxzZSwNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
