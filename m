Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp320229njl;
        Tue, 1 Oct 2024 09:57:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViDhHQjL3ku5E1l2aH/Qof3t6XW/SCcQdnPV3d+vWxi+Xp5cGEUxZ0VNe7QN//DVkXk3Q+i+MLg1e0Fw==@linaro.org
X-Received: by 2002:a05:6a00:10d2:b0:714:1ca1:7134 with SMTP id d2e1a72fcca58-71dc5d42599mr424302b3a.18.1727801870669;
        Tue, 01 Oct 2024 09:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801870; cv=none;
        d=google.com; s=arc-20160816;
        b=TFbxgZkbPosQYj9HAMCFIJPo5B+LUsNqbRfCWm2PYgXlHCVLyWTPfEnQBVXobvUNXn
         2kpVftnB22F/TJCws9ynugvFoFJp5OIyAr2ShLSZJF/Ah70jjxhOW9PDR7CT/uXcN++Z
         5gsiD9/fuLOCYU+29+JiBb9847Lfhzl9ekYJnbvXujO9t7+pqAgni7O5eM0irvxD+6aC
         56hW2fbwyDiqohX6/a25OX6Xf+b9Ell0jrExt/cQ8gDV2qCyLv9XWfVb55X/aK68gEzf
         ogvhgRtHyiFEkb1Psu9vHWYYNsNi10xrPK3GfZX8vVqeLHcKj4avm4gqJwDIsiaBV0Yw
         2sOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hko+oxlT08PXjzr7hkDSGu43O/zif8zFQn9O3Ptk/D8=;
        fh=l/9sW+T3ebBiasncpGIyHEmoHqB1wliAOZeLyWYnzsU=;
        b=ft5kml5BOrKAlAEBk/Rx0kqBgeVqNEP5eA6JYSQCFM3cKcSVIcdR9GiIJJHNB4pPGl
         0WSi0O95yCSdQ6CODRq4ka20kPBJeh4xgGX11Ec3TeIRsttWBrBL6pEYutn4Og6KmJD9
         laSPjrZHzxj4JGSuUrGnkfh8smsCXhhrEsynxUfjzZFuZakHpF9WvrwsHnst7ljuMU3v
         2paKrM5GQytFMW7yjaTUL360caGJ/2xVcVr4HEq0qYPIwhptp2hv2J7faP3mJNQSn3XJ
         0CyF3nF63C9Rjckh/ezjT8m270kq5fHNirOHmWjEZ3nk54YC4CRbNEhh/ljl1ff/Suh9
         6iLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYD2KDrj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71b264fc87bsor8352964b3a.7.2024.10.01.09.57.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYD2KDrj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801870; x=1728406670; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hko+oxlT08PXjzr7hkDSGu43O/zif8zFQn9O3Ptk/D8=;
        b=HYD2KDrjCkqniZGxWhDFM01IiwyzTH83rokH504Wu6tF4zSnMetFS9vOSkri9TVDCf
         La6eaCbx/5q2emH/L74cL+VI/ls1XZdV3aX0rDLzeV/eVBQYxT+60YMXXjyiqhDuYB1J
         0kwmF3b+kODP7sOwkH4a0Dfag7BfgHvFyqfIDqMZnKMbLAPu20yc/W76faNdGoojn/As
         +1/0vFCNf8lPAIjCohpYEYbpYjTiLRngKhOHZZQhOeWF5pXr8ENCwenAatxVuPtXikFw
         XwnL6UdQbMXadtq+yZGAdEhaagW49FkR7tu6xsjbWOr+1Rby3UzalelolgiiEMlm/p3E
         I6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801870; x=1728406670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hko+oxlT08PXjzr7hkDSGu43O/zif8zFQn9O3Ptk/D8=;
        b=YfVK8LJgi7JfpAPUmZ6NSwJxGvR0yHxgWzo3qc6vZfS3JS46OuS1Sl/6Qt84NoO69e
         Jm3k1horhfMqAxF6Ju6gqucEEWYloYsx3iWmmQ3L1D8LHDgvr9XWpcIyZnccbKuF/Mdv
         Skpb74lhW2v6+KHB9I4zTVWJLex+FTH4xX2J+V3HNBNjuEqpFQFjMvWoUA7rKrATULzl
         9mGcgS0Eaoxa1dVjz+9wrEKQUbcnRj2Uk8eMaKy6f5PeshKu525Bwgz95uwYp6DW4zx/
         jbkj1KVHZ89KcAvia6veH6nwaxtLb0qYVwTPS4Ji4DUFpDbiR6S3ipFhZgrnds4oBLrb
         XO6g==
X-Forwarded-Encrypted: i=1; AJvYcCV1swgeY8KV2wODxyelQ5mdDBu2o9eMZAeyLxDE14MvP+vh7NrtTK57tG++/EW0U+4CC1ow8jPlzneLag==@linaro.org
X-Gm-Message-State: AOJu0Yy2McuJrPtrOwHRkf35MHqYXzYmn3uI9t2eubJgQP54OzFIuJ67
	wqrYV7hNDDcX1VValpQLhlogpssiB9O4N1luI0H+gf9XbB+V6oGiiIgdstM0/5DTVg==
X-Google-Smtp-Source: AGHT+IGc9GjfY/0IIXK/QvZHhJGOR7lfFaXFQPLfCutrKDoc/LC49iLB97IxEZSPhDkBLhckfVixUA==
X-Received: by 2002:a05:6a00:1396:b0:717:8a87:7d02 with SMTP id d2e1a72fcca58-71dc5d5cfc2mr457688b3a.23.1727801870262;
        Tue, 01 Oct 2024 09:57:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bc88bsm8293331b3a.71.2024.10.01.09.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:57:49 -0700 (PDT)
Message-ID: <24067656-d292-4bd5-b7ad-d101d89ce755@linaro.org>
Date: Tue, 1 Oct 2024 09:57:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] hw/net/tulip: Use ld/st_endian_pci_dma() API
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
 <20240930073450.33195-14-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ODt8tprsvsXb

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFJl
ZmFjdG9yIHRvIHVzZSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBsZC9zdF9lbmRpYW5fcGNp
X2RtYSgpDQo+IEFQSS4gTm8gbG9naWNhbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
DQo+IC0tLQ0KPiAgIGh3L25ldC90dWxpcC5jIHwgMzIgKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L3R1bGlwLmMgYi9ody9u
ZXQvdHVsaXAuYw0KPiBpbmRleCA5ZGYzZTE3MTYyLi42YzY3OTU4ZGE3IDEwMDY0NA0KPiAt
LS0gYS9ody9uZXQvdHVsaXAuYw0KPiArKysgYi9ody9uZXQvdHVsaXAuYw0KPiBAQCAtNzEs
MzYgKzcxLDI0IEBAIHN0YXRpYyB2b2lkIHR1bGlwX2Rlc2NfcmVhZChUVUxJUFN0YXRlICpz
LCBod2FkZHIgcCwNCj4gICAgICAgICAgIHN0cnVjdCB0dWxpcF9kZXNjcmlwdG9yICpkZXNj
KQ0KPiAgIHsNCj4gICAgICAgY29uc3QgTWVtVHhBdHRycyBhdHRycyA9IHsgLm1lbW9yeSA9
IHRydWUgfTsNCj4gKyAgICBib29sIHVzZV9iaWdfZW5kaWFuID0gcy0+Y3NyWzBdICYgQ1NS
MF9EQk87DQo+ICAgDQo+IC0gICAgaWYgKHMtPmNzclswXSAmIENTUjBfREJPKSB7DQo+IC0g
ICAgICAgIGxkbF9iZV9wY2lfZG1hKCZzLT5kZXYsIHAsICZkZXNjLT5zdGF0dXMsIGF0dHJz
KTsNCj4gLSAgICAgICAgbGRsX2JlX3BjaV9kbWEoJnMtPmRldiwgcCArIDQsICZkZXNjLT5j
b250cm9sLCBhdHRycyk7DQo+IC0gICAgICAgIGxkbF9iZV9wY2lfZG1hKCZzLT5kZXYsIHAg
KyA4LCAmZGVzYy0+YnVmX2FkZHIxLCBhdHRycyk7DQo+IC0gICAgICAgIGxkbF9iZV9wY2lf
ZG1hKCZzLT5kZXYsIHAgKyAxMiwgJmRlc2MtPmJ1Zl9hZGRyMiwgYXR0cnMpOw0KPiAtICAg
IH0gZWxzZSB7DQo+IC0gICAgICAgIGxkbF9sZV9wY2lfZG1hKCZzLT5kZXYsIHAsICZkZXNj
LT5zdGF0dXMsIGF0dHJzKTsNCj4gLSAgICAgICAgbGRsX2xlX3BjaV9kbWEoJnMtPmRldiwg
cCArIDQsICZkZXNjLT5jb250cm9sLCBhdHRycyk7DQo+IC0gICAgICAgIGxkbF9sZV9wY2lf
ZG1hKCZzLT5kZXYsIHAgKyA4LCAmZGVzYy0+YnVmX2FkZHIxLCBhdHRycyk7DQo+IC0gICAg
ICAgIGxkbF9sZV9wY2lfZG1hKCZzLT5kZXYsIHAgKyAxMiwgJmRlc2MtPmJ1Zl9hZGRyMiwg
YXR0cnMpOw0KPiAtICAgIH0NCj4gKyAgICBsZGxfZW5kaWFuX3BjaV9kbWEodXNlX2JpZ19l
bmRpYW4sICZzLT5kZXYsIHAsICZkZXNjLT5zdGF0dXMsIGF0dHJzKTsNCj4gKyAgICBsZGxf
ZW5kaWFuX3BjaV9kbWEodXNlX2JpZ19lbmRpYW4sICZzLT5kZXYsIHAgKyA0LCAmZGVzYy0+
Y29udHJvbCwgYXR0cnMpOw0KPiArICAgIGxkbF9lbmRpYW5fcGNpX2RtYSh1c2VfYmlnX2Vu
ZGlhbiwgJnMtPmRldiwgcCArIDgsICZkZXNjLT5idWZfYWRkcjEsIGF0dHJzKTsNCj4gKyAg
ICBsZGxfZW5kaWFuX3BjaV9kbWEodXNlX2JpZ19lbmRpYW4sICZzLT5kZXYsIHAgKyAxMiwg
JmRlc2MtPmJ1Zl9hZGRyMiwgYXR0cnMpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9p
ZCB0dWxpcF9kZXNjX3dyaXRlKFRVTElQU3RhdGUgKnMsIGh3YWRkciBwLA0KPiAgICAgICAg
ICAgc3RydWN0IHR1bGlwX2Rlc2NyaXB0b3IgKmRlc2MpDQo+ICAgew0KPiAgICAgICBjb25z
dCBNZW1UeEF0dHJzIGF0dHJzID0geyAubWVtb3J5ID0gdHJ1ZSB9Ow0KPiArICAgIGJvb2wg
dXNlX2JpZ19lbmRpYW4gPSBzLT5jc3JbMF0gJiBDU1IwX0RCTzsNCj4gICANCj4gLSAgICBp
ZiAocy0+Y3NyWzBdICYgQ1NSMF9EQk8pIHsNCj4gLSAgICAgICAgc3RsX2JlX3BjaV9kbWEo
JnMtPmRldiwgcCwgZGVzYy0+c3RhdHVzLCBhdHRycyk7DQo+IC0gICAgICAgIHN0bF9iZV9w
Y2lfZG1hKCZzLT5kZXYsIHAgKyA0LCBkZXNjLT5jb250cm9sLCBhdHRycyk7DQo+IC0gICAg
ICAgIHN0bF9iZV9wY2lfZG1hKCZzLT5kZXYsIHAgKyA4LCBkZXNjLT5idWZfYWRkcjEsIGF0
dHJzKTsNCj4gLSAgICAgICAgc3RsX2JlX3BjaV9kbWEoJnMtPmRldiwgcCArIDEyLCBkZXNj
LT5idWZfYWRkcjIsIGF0dHJzKTsNCj4gLSAgICB9IGVsc2Ugew0KPiAtICAgICAgICBzdGxf
bGVfcGNpX2RtYSgmcy0+ZGV2LCBwLCBkZXNjLT5zdGF0dXMsIGF0dHJzKTsNCj4gLSAgICAg
ICAgc3RsX2xlX3BjaV9kbWEoJnMtPmRldiwgcCArIDQsIGRlc2MtPmNvbnRyb2wsIGF0dHJz
KTsNCj4gLSAgICAgICAgc3RsX2xlX3BjaV9kbWEoJnMtPmRldiwgcCArIDgsIGRlc2MtPmJ1
Zl9hZGRyMSwgYXR0cnMpOw0KPiAtICAgICAgICBzdGxfbGVfcGNpX2RtYSgmcy0+ZGV2LCBw
ICsgMTIsIGRlc2MtPmJ1Zl9hZGRyMiwgYXR0cnMpOw0KPiAtICAgIH0NCj4gKyAgICBzdGxf
ZW5kaWFuX3BjaV9kbWEodXNlX2JpZ19lbmRpYW4sICZzLT5kZXYsIHAsIGRlc2MtPnN0YXR1
cywgYXR0cnMpOw0KPiArICAgIHN0bF9lbmRpYW5fcGNpX2RtYSh1c2VfYmlnX2VuZGlhbiwg
JnMtPmRldiwgcCArIDQsIGRlc2MtPmNvbnRyb2wsIGF0dHJzKTsNCj4gKyAgICBzdGxfZW5k
aWFuX3BjaV9kbWEodXNlX2JpZ19lbmRpYW4sICZzLT5kZXYsIHAgKyA4LCBkZXNjLT5idWZf
YWRkcjEsIGF0dHJzKTsNCj4gKyAgICBzdGxfZW5kaWFuX3BjaV9kbWEodXNlX2JpZ19lbmRp
YW4sICZzLT5kZXYsIHAgKyAxMiwgZGVzYy0+YnVmX2FkZHIyLCBhdHRycyk7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyB2b2lkIHR1bGlwX3VwZGF0ZV9pbnQoVFVMSVBTdGF0ZSAqcykN
Cg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZz4NCg==
