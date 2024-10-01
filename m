Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp318621njl;
        Tue, 1 Oct 2024 09:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxnZQB/sQkkDWFW7VRXNsfjBmm2NfPC3mM3iO90T2U/gAseYYgGD7xzSHEBGEnHqPhRAz+4xqc4IlFMQ==@linaro.org
X-Received: by 2002:a17:90a:b383:b0:2d3:d45b:9e31 with SMTP id 98e67ed59e1d1-2e18454c0c1mr447068a91.2.1727801691514;
        Tue, 01 Oct 2024 09:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801691; cv=none;
        d=google.com; s=arc-20240605;
        b=B+Zgga6PmheIwWXvCwykwKE/gnPiIzgLDJwUDAO3xkPLx0ye+aBXgI4d4a69GZDNoE
         pgAc4BTk0vZmzVrF+77KLfqs+a4zFdRy8VwpVlGpzQ0c0zVRbxCv6NCdkW+zvCq+kk5I
         IIjWhsuNjAtzuILIeoceOE3L24xfoAo+dFpUf5nEdbRKCboYMeGL9LFGV2n9gmGyDrJe
         JQj/yaKufBptfnJk0IDgkwLAF2TiB/Rl0rf3g3hGUffRtt59N72tevC0Mc9150lDVPNf
         GXbK06UgZzkHcvVLRGGLaDyvEuuI+8vF8M3VXqubaVNAkcv2Hlp3tkYZeTFvbDeqNxY+
         bq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O3cQn7nEZVffi+N047IKUq9RZEYs/lpyONaUZxn39k4=;
        fh=6tGLl3ers6Ls7/T9YUCM7ww/pyIW8oE9QB7d3PMraxw=;
        b=EKhD5rcoHOZEKi48AwREDXiVXFvUP0G+AyvhMWBMvAmFSsh03uvHidV5XBsRgjBV3p
         t8XYV9MwePWfF1Rgp/J42XkvuGiEGhVl4v0DDZcObcmi6I2KUafvRpVro5QhtgqTzETM
         ffPEq9tAnM5yYt9jV8r4kg65NbSlreeoRGXPNWeNqZhmk2o6A/xhR7NKWvLeas41+AiW
         M0gxaToCPtW69CsNO2jyJ3D5Nn4Kh+7XUbCYHzFJTV5AXx+LMXlL1OHK9JexahNGAcJW
         fGCsg1ne2AvEPVeBs9DYywxEm0izi1pGHYMytOrqIBj8SU90wmeBvidPb8Z92n0CZRI0
         8PMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LedH757r;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20b5b11936fsor52634565ad.13.2024.10.01.09.54.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LedH757r;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801691; x=1728406491; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3cQn7nEZVffi+N047IKUq9RZEYs/lpyONaUZxn39k4=;
        b=LedH757r19kmJAv1pSlwncjXlWvIiPDDhcXhK8PLaYATtldTjkDX34Et5l96kAZAG2
         RMUA/C46Qk35XMl9oPR/1WZYfPzi+Hf8Im8gw90JNhBTG6Si+opKJCz04uFDAPY2Y73X
         ISCtuEiINyCZMZhIeF6DNl0u0ZN91UMjn3XkGKs8XjRCuX8vih3k+uKprkhRNOPyTdn0
         ZKdeJWYnqY14xj86+cmb+fbBd+b14TqA5kAmtOTfsvQVEvRSuMu2P2Zu6xoShDbl7em3
         vdLGHOlID0/lrjWlpUrQ37mnDMQ/cR0kJEOdtHwBpFgtuDRo9oSc7hStIOgw5+cs3b6D
         Wj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801691; x=1728406491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3cQn7nEZVffi+N047IKUq9RZEYs/lpyONaUZxn39k4=;
        b=DMUlO4DRe2Cf1uesQ7LXavcEuFe3JIgYhg/6r8oUDTq+pWoyWOs2XfiwGx78zVriz0
         yD1ZKEFzi1DLIBO9yY+aRa7fkxvXixjvElMZFfb1Dp6Yp/tBYfbtp+u5ev6uGQgHE631
         qe7F77H/1oNdjNPc4V213JDxLY+w+h/LuFl59lvlhi1//8p8LD+CarBr2Jn92RnbE5g+
         3Yz/WOoU2KrqBG3AZR62O898hPJE0TSxC2bPSd17cZFy2fLR+U2Tp17I0pCSGb2oZcPi
         odN012jxJkkOvP7B/v9RdjRAR8Pml2LwU13UDdTiHJUG1rexBrp4dfLkxZZ5dSQD+vzK
         oyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4qCXu0LIMV4TukcKBSALj6d54j1JbbXbzyTXqDcpahcoJGJUGnjcqONLGRRnsQ6xMsOf4TImELzXc9g==@linaro.org
X-Gm-Message-State: AOJu0YyyU0h5bW4j0vA1VWm77gz531B28PUvWoQ4d5nBI4f0lUwRx+5R
	LXTkcRKlWiUbdX3fWa89O1mMcCYIODh71uGSFeof6tJfhrZq+aJBc40kF9n53ufnkQ==
X-Google-Smtp-Source: AGHT+IEDEMrKyQMPd+BiZ4CYsvwxxBY/lnfLrgLbMPfCrue60H7W6dQHiqZLmefC4ebSmQXFthsXkA==
X-Received: by 2002:a17:903:1c4:b0:205:8407:6321 with SMTP id d9443c01a7336-20bc59c3bbcmr3930355ad.9.1727801691036;
        Tue, 01 Oct 2024 09:54:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e2f798sm71477785ad.183.2024.10.01.09.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:54:50 -0700 (PDT)
Message-ID: <51ed8524-e732-469f-823a-90b29668674f@linaro.org>
Date: Tue, 1 Oct 2024 09:54:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] hw/virtio/virtio-access: Use ld/st_endian_phys()
 API
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
 <20240930073450.33195-11-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: d2+zekGZdhvF

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFJl
ZmFjdG9yIHRvIHVzZSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBsZC9zdF9lbmRpYW5fcGh5
cygpIEFQSS4NCj4gTm8gbG9naWNhbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+
IC0tLQ0KPiAgIGluY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby1hY2Nlc3MuaCB8IDI3ICsrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcv
dmlydGlvL3ZpcnRpby1hY2Nlc3MuaCBiL2luY2x1ZGUvaHcvdmlydGlvL3ZpcnRpby1hY2Nl
c3MuaA0KPiBpbmRleCBiOTIwODc0YmU4Li4zN2E0MjQwN2VhIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2h3L3ZpcnRpby92aXJ0aW8tYWNjZXNzLmgNCj4gKysrIGIvaW5jbHVkZS9ody92
aXJ0aW8vdmlydGlvLWFjY2Vzcy5oDQo+IEBAIC00MywzMCArNDMsMjEgQEAgc3RhdGljIGlu
bGluZSB1aW50MTZfdCB2aXJ0aW9fbGR1d19waHlzKFZpcnRJT0RldmljZSAqdmRldiwgaHdh
ZGRyIHBhKQ0KPiAgIHsNCj4gICAgICAgQWRkcmVzc1NwYWNlICpkbWFfYXMgPSB2ZGV2LT5k
bWFfYXM7DQo+ICAgDQo+IC0gICAgaWYgKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2
ZGV2KSkgew0KPiAtICAgICAgICByZXR1cm4gbGR1d19iZV9waHlzKGRtYV9hcywgcGEpOw0K
PiAtICAgIH0NCj4gLSAgICByZXR1cm4gbGR1d19sZV9waHlzKGRtYV9hcywgcGEpOw0KPiAr
ICAgIHJldHVybiBsZHV3X2VuZGlhbl9waHlzKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlh
bih2ZGV2KSwgZG1hX2FzLCBwYSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUg
dWludDMyX3QgdmlydGlvX2xkbF9waHlzKFZpcnRJT0RldmljZSAqdmRldiwgaHdhZGRyIHBh
KQ0KPiAgIHsNCj4gICAgICAgQWRkcmVzc1NwYWNlICpkbWFfYXMgPSB2ZGV2LT5kbWFfYXM7
DQo+ICAgDQo+IC0gICAgaWYgKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2ZGV2KSkg
ew0KPiAtICAgICAgICByZXR1cm4gbGRsX2JlX3BoeXMoZG1hX2FzLCBwYSk7DQo+IC0gICAg
fQ0KPiAtICAgIHJldHVybiBsZGxfbGVfcGh5cyhkbWFfYXMsIHBhKTsNCj4gKyAgICByZXR1
cm4gbGRsX2VuZGlhbl9waHlzKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2ZGV2KSwg
ZG1hX2FzLCBwYSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdWludDY0X3Qg
dmlydGlvX2xkcV9waHlzKFZpcnRJT0RldmljZSAqdmRldiwgaHdhZGRyIHBhKQ0KPiAgIHsN
Cj4gICAgICAgQWRkcmVzc1NwYWNlICpkbWFfYXMgPSB2ZGV2LT5kbWFfYXM7DQo+ICAgDQo+
IC0gICAgaWYgKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2ZGV2KSkgew0KPiAtICAg
ICAgICByZXR1cm4gbGRxX2JlX3BoeXMoZG1hX2FzLCBwYSk7DQo+IC0gICAgfQ0KPiAtICAg
IHJldHVybiBsZHFfbGVfcGh5cyhkbWFfYXMsIHBhKTsNCj4gKyAgICByZXR1cm4gbGRxX2Vu
ZGlhbl9waHlzKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2ZGV2KSwgZG1hX2FzLCBw
YSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB2aXJ0aW9fc3R3X3Bo
eXMoVmlydElPRGV2aWNlICp2ZGV2LCBod2FkZHIgcGEsDQo+IEBAIC03NCwxMSArNjUsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgdmlydGlvX3N0d19waHlzKFZpcnRJT0RldmljZSAqdmRl
diwgaHdhZGRyIHBhLA0KPiAgIHsNCj4gICAgICAgQWRkcmVzc1NwYWNlICpkbWFfYXMgPSB2
ZGV2LT5kbWFfYXM7DQo+ICAgDQo+IC0gICAgaWYgKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2Vu
ZGlhbih2ZGV2KSkgew0KPiAtICAgICAgICBzdHdfYmVfcGh5cyhkbWFfYXMsIHBhLCB2YWx1
ZSk7DQo+IC0gICAgfSBlbHNlIHsNCj4gLSAgICAgICAgc3R3X2xlX3BoeXMoZG1hX2FzLCBw
YSwgdmFsdWUpOw0KPiAtICAgIH0NCj4gKyAgICBzdHdfZW5kaWFuX3BoeXModmlydGlvX2Fj
Y2Vzc19pc19iaWdfZW5kaWFuKHZkZXYpLCBkbWFfYXMsIHBhLCB2YWx1ZSk7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCB2aXJ0aW9fc3RsX3BoeXMoVmlydElPRGV2
aWNlICp2ZGV2LCBod2FkZHIgcGEsDQo+IEBAIC04NiwxMSArNzMsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgdmlydGlvX3N0bF9waHlzKFZpcnRJT0RldmljZSAqdmRldiwgaHdhZGRyIHBh
LA0KPiAgIHsNCj4gICAgICAgQWRkcmVzc1NwYWNlICpkbWFfYXMgPSB2ZGV2LT5kbWFfYXM7
DQo+ICAgDQo+IC0gICAgaWYgKHZpcnRpb19hY2Nlc3NfaXNfYmlnX2VuZGlhbih2ZGV2KSkg
ew0KPiAtICAgICAgICBzdGxfYmVfcGh5cyhkbWFfYXMsIHBhLCB2YWx1ZSk7DQo+IC0gICAg
fSBlbHNlIHsNCj4gLSAgICAgICAgc3RsX2xlX3BoeXMoZG1hX2FzLCBwYSwgdmFsdWUpOw0K
PiAtICAgIH0NCj4gKyAgICBzdGxfZW5kaWFuX3BoeXModmlydGlvX2FjY2Vzc19pc19iaWdf
ZW5kaWFuKHZkZXYpLCBkbWFfYXMsIHBhLCB2YWx1ZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0
YXRpYyBpbmxpbmUgdm9pZCB2aXJ0aW9fc3R3X3AoVmlydElPRGV2aWNlICp2ZGV2LCB2b2lk
ICpwdHIsIHVpbnQxNl90IHYpDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxw
aWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
