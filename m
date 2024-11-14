Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp90217njc;
        Wed, 13 Nov 2024 20:13:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnxCrJJSIvtqnewtxamqhGJj5QQ4pwQLO79RV4J8j633ixNv9EvuS162EZ1YTIMC5pBIZjClMeax6qCw==@linaro.org
X-Received: by 2002:a05:6808:1306:b0:3e5:ef2d:f53b with SMTP id 5614622812f47-3e79469e376mr20602750b6e.11.1731557639118;
        Wed, 13 Nov 2024 20:13:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557639; cv=none;
        d=google.com; s=arc-20240605;
        b=RHjjROovXWCX5AHXfaBdXiS4kzEDc9Io5c2bT4FoU6e5fRklNJYihEpWgREPQpTQHm
         BGDwMvEyY/lHzGRUYBwG1It+YVv/ugCt5tU++016nVeu7i9dE+sE6dX78vHgNHdFvg1d
         X0SzHRAa4hsTPCJEY+viVl8gijmJtqjGR1JnE4wfx2RwLyMOwXH1dPkpGUOrWn++RoOR
         u5Tl2eEo8DXDVHjHtGx1sDpJs74eLb/HHLPjH026dsuvyjVYNAAAb//qKT9Gv44nq4Xv
         jsFSpjQnLWR56nUeOWiLH58x7iUMOjyCtyb9KLd9r1MQhBO/yQuTd+jFj4Y0YGxqyqrQ
         PTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NI0KtHErs1HVTioMiCY/gWkuMqjAo5vsgkCR/gkoAvI=;
        fh=D2TpD5BRgcci/UaSw7VNClzbIJaboP84WgqnewsGxSo=;
        b=laOswRnbuhKclYchx6FAHgMHAtJv6rgcX0Kpc7W7cDDX8uyWauaxz2vS+KeFKKHvhi
         IP6ahj7wa9Hrnvrtu03XA8VlAlJrsqUgounc3kgjI4ak2OvsxzNyOzhZ/dwiqHdiVjQi
         20tbQLOZDC0k+MafdC7jZx5BkV7fjAsMnF0Q5C1i1mGAuCNbv86cK1pEK6AieisWXHkM
         V8U8pt7f0NYNPMFSGbnnurliLfXY9p2P96TxugxgvtSqkQRoleaoKO45Ftc+92UqatwC
         SNuLKcp19Z0wMTz/fZRJRyN2WD0SaAciWpRY1pRfBbCLGKBIHiHmWCDuTJrWXvxJAaFE
         laKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v0K9ph2Z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e7b85f3696sor75555b6e.17.2024.11.13.20.13.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:13:59 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v0K9ph2Z;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557639; x=1732162439; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NI0KtHErs1HVTioMiCY/gWkuMqjAo5vsgkCR/gkoAvI=;
        b=v0K9ph2ZRN2mL9OxUYDQ3119TA+hHazRKgaGn7ZUzflai341+BCRo4R6GUmIiXTdCY
         qUP9PyIMp2mKxb+OT35gJdh3Cgij7XUC7F+38orfBmPzE7jWwJUEfGu54n1tqITocCXg
         C+whyCOzGXDeb8FdqrkHyz9rob4Ij+AbMajVRi2Cqh2kOPHos1Pn33DyWnQSHPOeoGXV
         0DId8I4c0+qqhVfVxYb1BkhSwaGwHgoFy09ypdwgxMs2CS9eGnFVFh5dq13NwVfqZ2X3
         P/72v8dKCQxijJYZZSC7o+6luyAwh/Y2Ntf1/AYwCYwsMdnjf+QydELXkSQxdqSU5klm
         Utqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557639; x=1732162439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NI0KtHErs1HVTioMiCY/gWkuMqjAo5vsgkCR/gkoAvI=;
        b=Hg/OU33jKGxLrOmYzS/vOgmeiIAWiQ7BlhHYhsE8EUUW+SiykDNgD5MFZkfjkar3/u
         bgfuep3KI+jE6bOqPjJsOoni6svrq9i9893s0fWgSqbSHampoowUHrSTtplDXsodV7QI
         QnMBNW0DDeBareMJjuiz8Ii8LRmeaWvHFdwh9/5nNkmdomrSwBYfqldG5tI+a1jzNEwe
         dNlDqQho4d50kxq3NvVvPIwoaSM1UCH5wrN3TWevYCcrOAMKFS5ws2vIlOef+OPj66GV
         8O/L0Nl8lFZne/kv5kI5Wpi/JBOJ2oP6a1xXuaYhSHWm+bInn9d1hi1uyiGw1GJE1ZUj
         DosQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9mvX8XGMATazpsPM2j0a25GmBaDRCMIOhrayDp9+qgSO5WH5v/fSqYXvdPkG6ZIfCC0WGGCdwyPjedA==@linaro.org
X-Gm-Message-State: AOJu0YzOYOs9ITkrtaZfg0QSz9Tk7ktwRFX2Hd8/tcOa7jd7ibR3Okhy
	FKv2j83o6sInokd/So76DnsmRp5ibc6aCux6dl9vLt632haBmmlaiF4owMhDC2kyKQ==
X-Google-Smtp-Source: AGHT+IHYhmjsCgkzpWTEAK/fYsb6YpKUoFbLS2Hrlh1Lo3WdJNal1XB7y8TNYaoah7cc5fAS0a1AiQ==
X-Received: by 2002:a05:6870:40c2:b0:277:eb79:b4fb with SMTP id 586e51a60fabf-29560043547mr18293308fac.1.1731557638663;
        Wed, 13 Nov 2024 20:13:58 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b36da8d0sm117984a12.7.2024.11.13.20.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:13:58 -0800 (PST)
Message-ID: <509556a4-1e34-4db3-a7bf-3242896cf91b@linaro.org>
Date: Wed, 13 Nov 2024 20:13:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] exec: Declare tlb_set_page() in 'exec/cputlb.h'
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
 <20241114011310.3615-18-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: pVB9GkzmUATZ

T24gMTEvMTMvMjQgMTc6MTMsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBN
b3ZlIENQVSBUTEIgcmVsYXRlZCBtZXRob2RzIHRvICJleGVjL2NwdXRsYi5oIi4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9leGVjL2NwdXRsYi5oICAgfCAxMSArKysrKysr
KysrKw0KPiAgIGluY2x1ZGUvZXhlYy9leGVjLWFsbC5oIHwgIDkgLS0tLS0tLS0tDQo+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9jcHV0bGIuaCBiL2luY2x1ZGUvZXhlYy9j
cHV0bGIuaA0KPiBpbmRleCBhZTQ3OThhMDE3Li45MDc1ZDk0ZWM1IDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2V4ZWMvY3B1dGxiLmgNCj4gKysrIGIvaW5jbHVkZS9leGVjL2NwdXRsYi5o
DQo+IEBAIC0xMDgsNCArMTA4LDE1IEBAIHZvaWQgdGxiX3NldF9wYWdlX3dpdGhfYXR0cnMo
Q1BVU3RhdGUgKmNwdSwgdmFkZHIgYWRkciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGh3YWRkciBwYWRkciwgTWVtVHhBdHRycyBhdHRycywNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludCBwcm90LCBpbnQgbW11X2lkeCwgdmFkZHIgc2l6ZSk7
DQo+ICAgDQo+ICsvKioNCj4gKyAqIHRsYl9zZXRfcGFnZToNCj4gKyAqDQo+ICsgKiBUaGlz
IGZ1bmN0aW9uIGlzIGVxdWl2YWxlbnQgdG8gY2FsbGluZyB0bGJfc2V0X3BhZ2Vfd2l0aF9h
dHRycygpDQo+ICsgKiB3aXRoIGFuIEBhdHRycyBhcmd1bWVudCBvZiBNRU1UWEFUVFJTX1VO
U1BFQ0lGSUVELiBJdCdzIHByb3ZpZGVkDQo+ICsgKiBhcyBhIGNvbnZlbmllbmNlIGZvciBD
UFVzIHdoaWNoIGRvbid0IHVzZSBtZW1vcnkgdHJhbnNhY3Rpb24gYXR0cmlidXRlcy4NCj4g
KyAqLw0KPiArdm9pZCB0bGJfc2V0X3BhZ2UoQ1BVU3RhdGUgKmNwdSwgdmFkZHIgYWRkciwN
Cj4gKyAgICAgICAgICAgICAgICAgIGh3YWRkciBwYWRkciwgaW50IHByb3QsDQo+ICsgICAg
ICAgICAgICAgICAgICBpbnQgbW11X2lkeCwgdmFkZHIgc2l6ZSk7DQo+ICsNCj4gICAjZW5k
aWYNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oIGIvaW5jbHVkZS9l
eGVjL2V4ZWMtYWxsLmgNCj4gaW5kZXggMmIzMTRkNjU4Yi4uMmU1ODU0MDAwNSAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmgNCj4gKysrIGIvaW5jbHVkZS9leGVj
L2V4ZWMtYWxsLmgNCj4gQEAgLTE3NCwxNSArMTc0LDYgQEAgdm9pZCB0bGJfZmx1c2hfcmFu
Z2VfYnlfbW11aWR4X2FsbF9jcHVzX3N5bmNlZChDUFVTdGF0ZSAqY3B1LA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgaWR4
bWFwLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgYml0cyk7DQo+ICAgDQo+IC0vKiB0bGJfc2V0X3BhZ2U6DQo+IC0gKg0K
PiAtICogVGhpcyBmdW5jdGlvbiBpcyBlcXVpdmFsZW50IHRvIGNhbGxpbmcgdGxiX3NldF9w
YWdlX3dpdGhfYXR0cnMoKQ0KPiAtICogd2l0aCBhbiBAYXR0cnMgYXJndW1lbnQgb2YgTUVN
VFhBVFRSU19VTlNQRUNJRklFRC4gSXQncyBwcm92aWRlZA0KPiAtICogYXMgYSBjb252ZW5p
ZW5jZSBmb3IgQ1BVcyB3aGljaCBkb24ndCB1c2UgbWVtb3J5IHRyYW5zYWN0aW9uIGF0dHJp
YnV0ZXMuDQo+IC0gKi8NCj4gLXZvaWQgdGxiX3NldF9wYWdlKENQVVN0YXRlICpjcHUsIHZh
ZGRyIGFkZHIsDQo+IC0gICAgICAgICAgICAgICAgICBod2FkZHIgcGFkZHIsIGludCBwcm90
LA0KPiAtICAgICAgICAgICAgICAgICAgaW50IG1tdV9pZHgsIHZhZGRyIHNpemUpOw0KPiAg
ICNlbHNlDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIHRsYl9mbHVzaF9wYWdlKENQVVN0YXRl
ICpjcHUsIHZhZGRyIGFkZHIpDQo+ICAgew0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91
dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
