Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1193533njc;
        Thu, 20 Mar 2025 12:38:18 -0700 (PDT)
X-Received: by 2002:a17:902:cec4:b0:219:e4b0:4286 with SMTP id d9443c01a7336-22780db462fmr8952445ad.29.1742499498224;
        Thu, 20 Mar 2025 12:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499498; cv=none;
        d=google.com; s=arc-20240605;
        b=T/VlZhugUXY2e+8K5kplgRBaJ7M9u0TbIdzEBz2TTq/DbNPJE8Rgy88L9cuKB8PiT4
         As1MyMM5w/lqVPUhCCETveo/jWSZyDFlyWkKtMzQaGtn9PSX8PuhxgyxRfbB+V2Tqvv1
         2xhmhMPiiABTRFXZBbIDNYfbU5EnGSHDWZdArWajZ/7wHsQ9m440i45Dpa8rxB+LaCAU
         lerRDAhKyBk0SFG5v8xad6wCNCJ6lgPo32EarogZT8+v+XLmFnbZZGFst3wAvzTf1pEE
         Q8H5jh4Xv6kXEVujcpRD+b+bve58wNyY4libeisC9VzL4r+Wc9Kw1BBSXFEQRKdsuE2k
         o1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HkRqz1OAck1Yy9ziknZYHoLh+Epglm7iJJh0XilfQrg=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=XH3XJLXCzOQz/pj3D6yjn6iyNHmjM9dXfFOgymPapGID9iFbl6wbS9cNa8aVxyB/Lk
         uhnxIpnX2H3zvMAJ9zKyilgFxyl2fUO8baYZUKwOMWJBVasseUv1+Z3bQNVVt79QNOaO
         j7eNED0MW8DFy8NIqS346XE8qS9YyoqOsY+Bu5Cue+hKcaevXz9HmgQYNsuhvNsqDwm5
         evFyTmLHJnqzQhjjE0tqtVzT1Yq2S6DhfZz0b/aemOkT9CSn/oukf7OEntu1knxVARb4
         gra5GdSVUKCp9Zx1tkNVoVhx+T7rZJityAzDkOC7EezAJsWwsjVX9Xdo+8F+YAL68exZ
         Qgxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xzq9mfLJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f25e9csor1638445ad.10.2025.03.20.12.38.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xzq9mfLJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499498; x=1743104298; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkRqz1OAck1Yy9ziknZYHoLh+Epglm7iJJh0XilfQrg=;
        b=Xzq9mfLJOuGgGRQEIVujib85LipybV99FiW3oOgHCNU5M+31bpo3pCExXCW1obGXUr
         /Dhs99/av0wpcUHd8DQXSQQYfYhVGsKWjlakxVsWbGaWvsjWyXqBfQL7iTaEztr7aSGI
         Cu3TRjfoG0UwhAAfR23F4RBt/6TWRxnERixh1jcLdBpT6BxGDrysqWJ1IyuMMHa7knTA
         Z+56hF2QQPu0+q3L6j+nIVCLI177JtALSmqvMmETsu40NkiJNnhF3WC66TSmtmh3Og3w
         4TFY+x+xRYTVtAk25HElPt/fhzhsV1xs61CW+KP4vyvOJy4U9MqzcLNc4yJc06gN375f
         q48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499498; x=1743104298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkRqz1OAck1Yy9ziknZYHoLh+Epglm7iJJh0XilfQrg=;
        b=M+AOztT4ooHlB75+d27au4IqopR1P/i6byZmFD1VyGLz2S8/0+L3t0gcjaq/EIGat3
         j+x4bosYdIUOzHHM35BRSnLK9TwHmKZp0aPZ1YbHxb0CsAZGHmBAm2gBNU2YYMwwM+Jw
         ol/dwHtiOj4tSQu3a913oGEg9QPXl/rQIn/noFaDz7P5ectDXcu0hhyop5tm4+pMeh/r
         RxkLuhFU8UGk5WGZEWD4V49HiRpCvWK75oROUKZGAzkQniTcch1beF5oJ4Vmvp8l3VlY
         6BtYGBaOcKgPcPJa3MUcA1xWOMn8uz7dv5ONdJAbAzSgLNQ7iPwvMp4cVbwGwEsTM8yS
         5IRA==
X-Gm-Message-State: AOJu0YxY1BTyZoY8odw4ChHJVKZ4P0H3kWtQyVwZ7rlU8chB2i6+E8fr
	16G6yJTV5G7spLqAtgLjNNB7XAGVPvMGeV8GTe6pN17BYhuorX6oy/GbrBph7ZAIDpchL8M71vt
	xY9s=
X-Gm-Gg: ASbGncuwao5tBeZxvaAybKgueYeJClS+vmtXl5IiE8kw9GgA4bTQR0wE/EatsWMhka4
	+s2xqaK5vC0otxyIsy9JqCbWeYglhIiCN4Cvutb/TzsZNqiSJUfyOp9mGLB/GXAZ5FqPCozc4X8
	HjodjC0aevLGTsWGykZKnCBWRyDFLyFRTSZaOj7iyDJdNK0A6cKFOFfwoIXCNx82PLoEjyq0a0d
	04N6tMX68l4DLnXO+5CzVJpaiTg4K7fH/Cbuenag03JIrxPBbEyWO6t4bELzcWeXQ3wqhLC83Pn
	OikFC3w9jFeqh2dEIMIZPE93frniG+EdNTxgIvfwQYPebHcGCBxKb5PIog==
X-Google-Smtp-Source: AGHT+IEO76nE2wEph+0oKrK9Yf0BfU2C1u178PeCDlq0mONJYRjqbevgvYTAnz1LWdrLXtfFvgzqxw==
X-Received: by 2002:a17:902:e881:b0:223:501c:7576 with SMTP id d9443c01a7336-22780c6be64mr9347475ad.12.1742499497715;
        Thu, 20 Mar 2025 12:38:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811e34dasm1704585ad.199.2025.03.20.12.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:38:17 -0700 (PDT)
Message-ID: <710df6fc-33d2-4024-90ad-19543572c2eb@linaro.org>
Date: Thu, 20 Mar 2025 12:38:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] target/arm: convert 32 bit gdbstub to new helper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: MGd1dYywhmp4

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBGb3Igc29tZSBvZiB0
aGUgaGVscGVycyB3ZSBuZWVkIGEgdGVtcG9yYXJ5IHZhcmlhYmxlIHRvIGNvcHkgZnJvbQ0K
PiBhbHRob3VnaCB3ZSBjb3VsZCBhZGQgc29tZSBoZWxwZXJzIHRvIHJldHVybiBwb2ludGVy
cyBpbnRvIGVudiBpbg0KPiB0aG9zZSBjYXNlcyBpZiB3ZSB3YW50ZWQgdG8uDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+
IC0tLQ0KPiAgIHRhcmdldC9hcm0vZ2Ric3R1Yi5jIHwgNTcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5z
ZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0
L2FybS9nZGJzdHViLmMgYi90YXJnZXQvYXJtL2dkYnN0dWIuYw0KPiBpbmRleCAzMDA2OGMy
MjYyLi4xNGQ5MzFiMGJmIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvYXJtL2dkYnN0dWIuYw0K
PiArKysgYi90YXJnZXQvYXJtL2dkYnN0dWIuYw0KPiBAQCAtMjAsNyArMjAsNyBAQA0KPiAg
ICNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+ICAgI2luY2x1ZGUgImNwdS5oIg0KPiAgICNp
bmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4gLSNpbmNsdWRlICJnZGJzdHViL2hlbHBlcnMu
aCINCj4gKyNpbmNsdWRlICJnZGJzdHViL3JlZ2lzdGVycy5oIg0KPiAgICNpbmNsdWRlICJn
ZGJzdHViL2NvbW1hbmRzLmgiDQo+ICAgI2luY2x1ZGUgInN5c3RlbS90Y2cuaCINCj4gICAj
aW5jbHVkZSAiaW50ZXJuYWxzLmgiDQo+IEBAIC0zMywxMiArMzMsMTYgQEAgdHlwZWRlZiBz
dHJ1Y3QgUmVnaXN0ZXJTeXNyZWdGZWF0dXJlUGFyYW0gew0KPiAgICAgICBpbnQgbjsNCj4g
ICB9IFJlZ2lzdGVyU3lzcmVnRmVhdHVyZVBhcmFtOw0KPiAgIA0KPiAtLyogT2xkIGdkYiBh
bHdheXMgZXhwZWN0IEZQQSByZWdpc3RlcnMuICBOZXdlciAoeG1sLWF3YXJlKSBnZGIgb25s
eSBleHBlY3QNCj4gLSAgIHdoYXRldmVyIHRoZSB0YXJnZXQgZGVzY3JpcHRpb24gY29udGFp
bnMuICBEdWUgdG8gYSBoaXN0b3JpY2FsIG1pc2hhcA0KPiAtICAgdGhlIEZQQSByZWdpc3Rl
cnMgYXBwZWFyIGluIGJldHdlZW4gY29yZSBpbnRlZ2VyIHJlZ3MgYW5kIHRoZSBDUFNSLg0K
PiAtICAgV2UgaGFjayByb3VuZCB0aGlzIGJ5IGdpdmluZyB0aGUgRlBBIHJlZ3MgemVybyBz
aXplIHdoZW4gdGFsa2luZyB0byBhDQo+IC0gICBuZXdlciBnZGIuICAqLw0KPiAtDQo+ICsv
Kg0KPiArICogT2xkIGdkYiBhbHdheXMgZXhwZWN0IEZQQSByZWdpc3RlcnMuIE5ld2VyICh4
bWwtYXdhcmUpIGdkYiBvbmx5DQo+ICsgKiBleHBlY3Qgd2hhdGV2ZXIgdGhlIHRhcmdldCBk
ZXNjcmlwdGlvbiBjb250YWlucy4gRHVlIHRvIGENCj4gKyAqIGhpc3RvcmljYWwgbWlzaGFw
IHRoZSBGUEEgcmVnaXN0ZXJzIGFwcGVhciBpbiBiZXR3ZWVuIGNvcmUgaW50ZWdlcg0KPiAr
ICogcmVncyBhbmQgdGhlIENQU1IuIFdlIGhhY2sgcm91bmQgdGhpcyBieSBnaXZpbmcgdGhl
IEZQQSByZWdzIHplcm8NCj4gKyAqIHNpemUgd2hlbiB0YWxraW5nIHRvIGEgbmV3ZXIgZ2Ri
Lg0KPiArICoNCj4gKyAqIFdoaWxlIGdkYiBjYXJlcyBhYm91dCB0aGUgbWVtb3J5IGVuZGlh
bmVzcyBvZiB0aGUgdGFyZ2V0IGFsbA0KPiArICogcmVnaXN0ZXJzIGFyZSBwYXNzZWQgaW4g
bGl0dGxlLWVuZGlhbiBtb2RlLg0KPiArICovDQo+ICAgaW50IGFybV9jcHVfZ2RiX3JlYWRf
cmVnaXN0ZXIoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikNCj4g
ICB7DQo+ICAgICAgIEFSTUNQVSAqY3B1ID0gQVJNX0NQVShjcyk7DQo+IEBAIC00NiwxNSAr
NTAsMTcgQEAgaW50IGFybV9jcHVfZ2RiX3JlYWRfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNzLCBH
Qnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikNCj4gICANCj4gICAgICAgaWYgKG4gPCAxNikg
ew0KPiAgICAgICAgICAgLyogQ29yZSBpbnRlZ2VyIHJlZ2lzdGVyLiAgKi8NCj4gLSAgICAg
ICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIobWVtX2J1ZiwgZW52LT5yZWdzW25dKTsNCj4gKyAg
ICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnaXN0ZXJfdmFsdWUoTU9fVEVVTCwgbWVtX2J1Ziwg
KHVpbnQ4X3QgKikgJmVudi0+cmVnc1tuXSk7DQo+ICAgICAgIH0NCj4gICAgICAgaWYgKG4g
PT0gMjUpIHsNCj4gICAgICAgICAgIC8qIENQU1IsIG9yIFhQU1IgZm9yIE0tcHJvZmlsZSAq
Lw0KPiArICAgICAgICB1aW50MzJfdCByZWc7DQo+ICAgICAgICAgICBpZiAoYXJtX2ZlYXR1
cmUoZW52LCBBUk1fRkVBVFVSRV9NKSkgew0KPiAtICAgICAgICAgICAgcmV0dXJuIGdkYl9n
ZXRfcmVnMzIobWVtX2J1ZiwgeHBzcl9yZWFkKGVudikpOw0KPiArICAgICAgICAgICAgcmVn
ID0geHBzcl9yZWFkKGVudik7DQo+ICAgICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAg
ICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIobWVtX2J1ZiwgY3Bzcl9yZWFkKGVudikpOw0KPiAr
ICAgICAgICAgICAgcmVnID0gY3Bzcl9yZWFkKGVudik7DQo+ICAgICAgICAgICB9DQo+ICsg
ICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVlKE1PX1RFVUwsIG1lbV9idWYs
ICh1aW50OF90ICopICZyZWcpOw0KPiAgICAgICB9DQo+ICAgICAgIC8qIFVua25vd24gcmVn
aXN0ZXIuICAqLw0KPiAgICAgICByZXR1cm4gMDsNCj4gQEAgLTExNSwxOSArMTIxLDIyIEBA
IHN0YXRpYyBpbnQgdmZwX2dkYl9nZXRfcmVnKENQVVN0YXRlICpjcywgR0J5dGVBcnJheSAq
YnVmLCBpbnQgcmVnKQ0KPiAgIA0KPiAgICAgICAvKiBWRlAgZGF0YSByZWdpc3RlcnMgYXJl
IGFsd2F5cyBsaXR0bGUtZW5kaWFuLiAgKi8NCj4gICAgICAgaWYgKHJlZyA8IG5yZWdzKSB7
DQo+IC0gICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzY0KGJ1ZiwgKmFhMzJfdmZwX2RyZWco
ZW52LCByZWcpKTsNCj4gKyAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnaXN0ZXJfdmFsdWUo
TU9fVEVVUSwgYnVmLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAodWludDhfdCAqKSBhYTMyX3ZmcF9kcmVnKGVudiwgcmVnKSk7DQo+ICAgICAgIH0NCj4g
ICAgICAgaWYgKGFybV9mZWF0dXJlKGVudiwgQVJNX0ZFQVRVUkVfTkVPTikpIHsNCj4gICAg
ICAgICAgIC8qIEFsaWFzZXMgZm9yIFEgcmVncy4gICovDQo+ICAgICAgICAgICBucmVncyAr
PSAxNjsNCj4gICAgICAgICAgIGlmIChyZWcgPCBucmVncykgew0KPiAgICAgICAgICAgICAg
IHVpbnQ2NF90ICpxID0gYWEzMl92ZnBfcXJlZyhlbnYsIHJlZyAtIDMyKTsNCj4gLSAgICAg
ICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZzEyOChidWYsIHFbMF0sIHFbMV0pOw0KPiArICAg
ICAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnaXN0ZXJfdmFsdWUoTU9fVEVVTywgYnVmLCAo
dWludDhfdCAqKSBxKTsNCj4gICAgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgICAgICBzd2l0
Y2ggKHJlZyAtIG5yZWdzKSB7DQo+ICsgICAgICAgIHVpbnQzMl90IGZwY3I7DQo+ICAgICAg
IGNhc2UgMDoNCj4gLSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCB2ZnBfZ2V0
X2Zwc2NyKGVudikpOw0KPiArICAgICAgICBmcGNyID0gdmZwX2dldF9mcHNjcihlbnYpOw0K
PiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBidWYs
ICh1aW50OF90ICopICZmcGNyKTsNCj4gICAgICAgfQ0KPiAgICAgICByZXR1cm4gMDsNCj4g
ICB9DQo+IEBAIC0xNjYsOSArMTc1LDExIEBAIHN0YXRpYyBpbnQgdmZwX2dkYl9nZXRfc3lz
cmVnKENQVVN0YXRlICpjcywgR0J5dGVBcnJheSAqYnVmLCBpbnQgcmVnKQ0KPiAgIA0KPiAg
ICAgICBzd2l0Y2ggKHJlZykgew0KPiAgICAgICBjYXNlIDA6DQo+IC0gICAgICAgIHJldHVy
biBnZGJfZ2V0X3JlZzMyKGJ1ZiwgZW52LT52ZnAueHJlZ3NbQVJNX1ZGUF9GUFNJRF0pOw0K
PiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBidWYs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1aW50OF90ICop
ICZlbnYtPnZmcC54cmVnc1tBUk1fVkZQX0ZQU0lEXSk7DQo+ICAgICAgIGNhc2UgMToNCj4g
LSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCBlbnYtPnZmcC54cmVnc1tBUk1f
VkZQX0ZQRVhDXSk7DQo+ICsgICAgICAgIHJldHVybiBnZGJfZ2V0X3JlZ2lzdGVyX3ZhbHVl
KE1PX1RFVUwsIGJ1ZiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHVpbnQ4X3QgKikgJmVudi0+dmZwLnhyZWdzW0FSTV9WRlBfRlBFWENdKTsNCj4gICAg
ICAgfQ0KPiAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+IEBAIC0xOTYsNyArMjA3LDggQEAg
c3RhdGljIGludCBtdmVfZ2RiX2dldF9yZWcoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICpi
dWYsIGludCByZWcpDQo+ICAgDQo+ICAgICAgIHN3aXRjaCAocmVnKSB7DQo+ICAgICAgIGNh
c2UgMDoNCj4gLSAgICAgICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCBlbnYtPnY3bS52
cHIpOw0KPiArICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVM
LCBidWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1aW50
OF90ICopICZlbnYtPnY3bS52cHIpOw0KPiAgICAgICBkZWZhdWx0Og0KPiAgICAgICAgICAg
cmV0dXJuIDA7DQo+ICAgICAgIH0NCj4gQEAgLTIzNiw5ICsyNDgsMTEgQEAgc3RhdGljIGlu
dCBhcm1fZ2RiX2dldF9zeXNyZWcoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICpidWYsIGlu
dCByZWcpDQo+ICAgICAgIHJpID0gZ2V0X2FybV9jcF9yZWdpbmZvKGNwdS0+Y3BfcmVncywg
a2V5KTsNCj4gICAgICAgaWYgKHJpKSB7DQo+ICAgICAgICAgICBpZiAoY3ByZWdfZmllbGRf
aXNfNjRiaXQocmkpKSB7DQo+IC0gICAgICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWc2NChi
dWYsICh1aW50NjRfdClyZWFkX3Jhd19jcF9yZWcoZW52LCByaSkpOw0KPiArICAgICAgICAg
ICAgdWludDY0X3QgY3ByZWcgPSByZWFkX3Jhd19jcF9yZWcoZW52LCByaSk7DQo+ICsgICAg
ICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVRLCBidWYsICh1
aW50OF90ICopICZjcHJlZyk7DQo+ICAgICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAg
ICAgcmV0dXJuIGdkYl9nZXRfcmVnMzIoYnVmLCAodWludDMyX3QpcmVhZF9yYXdfY3BfcmVn
KGVudiwgcmkpKTsNCj4gKyAgICAgICAgICAgIHVpbnQzMl90IGNwcmVnID0gKHVpbnQzMl90
KSByZWFkX3Jhd19jcF9yZWcoZW52LCByaSk7DQo+ICsgICAgICAgICAgICByZXR1cm4gZ2Ri
X2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBidWYsICh1aW50OF90ICopICZjcHJlZyk7
DQo+ICAgICAgICAgICB9DQo+ICAgICAgIH0NCj4gICAgICAgcmV0dXJuIDA7DQo+IEBAIC0z
NzUsMTIgKzM4OSwxMiBAQCBzdGF0aWMgdWludDMyX3QgKm1fc3lzcmVnX3B0cihDUFVBUk1T
dGF0ZSAqZW52LCBNUHJvZmlsZVN5c3JlZyByZWcsIGJvb2wgc2VjKQ0KPiAgIHN0YXRpYyBp
bnQgbV9zeXNyZWdfZ2V0KENQVUFSTVN0YXRlICplbnYsIEdCeXRlQXJyYXkgKmJ1ZiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICBNUHJvZmlsZVN5c3JlZyByZWcsIGJvb2wgc2Vj
dXJlKQ0KPiAgIHsNCj4gLSAgICB1aW50MzJfdCAqcHRyID0gbV9zeXNyZWdfcHRyKGVudiwg
cmVnLCBzZWN1cmUpOw0KPiArICAgIHVpbnQ4X3QgKnB0ciA9ICh1aW50OF90ICopIG1fc3lz
cmVnX3B0cihlbnYsIHJlZywgc2VjdXJlKTsNCj4gICANCj4gICAgICAgaWYgKHB0ciA9PSBO
VUxMKSB7DQo+ICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgfQ0KPiAtICAgIHJldHVy
biBnZGJfZ2V0X3JlZzMyKGJ1ZiwgKnB0cik7DQo+ICsgICAgcmV0dXJuIGdkYl9nZXRfcmVn
aXN0ZXJfdmFsdWUoTU9fVEVVTCwgYnVmLCBwdHIpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0
aWMgaW50IGFybV9nZGJfZ2V0X21fc3lzdGVtcmVnKENQVVN0YXRlICpjcywgR0J5dGVBcnJh
eSAqYnVmLCBpbnQgcmVnKQ0KPiBAQCAtMzkzLDcgKzQwNyw4IEBAIHN0YXRpYyBpbnQgYXJt
X2dkYl9nZXRfbV9zeXN0ZW1yZWcoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICpidWYsIGlu
dCByZWcpDQo+ICAgICAgICAqIGJhbmtlZCBhbmQgbm9uLWJhbmtlZCBiaXRzLg0KPiAgICAg
ICAgKi8NCj4gICAgICAgaWYgKHJlZyA9PSBNX1NZU1JFR19DT05UUk9MKSB7DQo+IC0gICAg
ICAgIHJldHVybiBnZGJfZ2V0X3JlZzMyKGJ1ZiwgYXJtX3Y3bV9tcnNfY29udHJvbChlbnYs
IGVudi0+djdtLnNlY3VyZSkpOw0KPiArICAgICAgICB1aW50MzJfdCByZWczMiA9IGFybV92
N21fbXJzX2NvbnRyb2woZW52LCBlbnYtPnY3bS5zZWN1cmUpOw0KPiArICAgICAgICByZXR1
cm4gZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNT19URVVMLCBidWYsICh1aW50OF90ICopICZy
ZWczMik7DQo+ICAgICAgIH0NCj4gICAgICAgcmV0dXJuIG1fc3lzcmVnX2dldChlbnYsIGJ1
ZiwgcmVnLCBlbnYtPnY3bS5zZWN1cmUpOw0KPiAgIH0NCg0KUmV2aWV3ZWQtYnk6IFBpZXJy
aWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg0K
