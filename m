Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1200579njc;
        Thu, 20 Mar 2025 12:52:24 -0700 (PDT)
X-Received: by 2002:a17:903:234e:b0:223:377f:9795 with SMTP id d9443c01a7336-22780ba3100mr9696185ad.0.1742500344479;
        Thu, 20 Mar 2025 12:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742500344; cv=none;
        d=google.com; s=arc-20240605;
        b=APWpG7ETO19DSZPyMFWPwLOcodahVFBamlXY146Q9xkZhuNEMjypUH/B2MfgZbsu/1
         5qMDoZO24G9DlzgkiiK++QNwApXhKgVTF7yCSUgCO8f8APWhtk+/af7+RdiuAStfhKvK
         +rfSbIPcztnRJWbICyNNCxaS23mSTNp0AEIW6gx3xHhb61OmahaTeHazUzA6JQVzc408
         oKM9Tn3IFs6VL0hd3JH83ceZPzJZjsMrXEt4C6/p3jmyvv6wALM2uI9es9dW74VAcikZ
         5WUsGJbx3fPv5fe/43QGWqWUJ7898j36HGwk6JvSLgqBEi9e8mrtmCodmY9dmT4r4W+E
         s2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZelqN++iCMoSo52o6BA78GDAobp/ZBCEMMpAtQoOxRQ=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=TLty1B2B2goo0UI2C8muzzWVuL/DcvmlHnfYiXDnfWnoE2VHpzgQYqEMh55zkmyIAW
         UPGjcd/esOzBu0Q54LcmCFI0MWWJUuB0RNLvTPXNTKGiZXzpH3WnB8KYODAlYDiKxYnL
         2+ygupyR/fuwY2ReefS/L+V1RCgZB2cwCKWeVqgHCGsOavcK1QYutn7fwQFdV9/TBkoE
         BSgfKcDa7MWWFjoBIXW1KXPceN5DT9yT1rBuSsyDzspyHLQPWREH9f8fc4wf3aGq70wx
         ih7L6pZ/tJxu6MpDzHwB4XGGh5ZwP5quusgDn0rPSu9+dTvsMWMiquQZCi3OV13QtFI7
         5wdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdpfloeR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780e24f29sor2872005ad.0.2025.03.20.12.52.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdpfloeR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742500344; x=1743105144; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZelqN++iCMoSo52o6BA78GDAobp/ZBCEMMpAtQoOxRQ=;
        b=OdpfloeRj8DK7D6TpcCGsOVxqC6cV+Dc24p8aCkPnKAkg1KkApsu+S5KtRrQNGVmad
         vTEKsR0k+vqhkGSaJQc1UjgRy8a3hYnNcfJLvZeiKwFbKH4o33BI3TQMFLICE+AKses7
         KXRTJGr7AC9m6VF/0B5SgL7/GnWRIUz+GSgeldAFmX4VDDraHC5A4SxrfA/GmTfMHGmM
         bcNtlE5iLRxgg0gdS9bliNCefpjQs7/9sPAdhQ2B4Obi8mKQmJ1i+o5ccyHM/DdEdufO
         jt4stne8e0zibsnnIlHY/C4E90wCWQl5QlpfVtJjov0/8GCYi8th14WwpUfEbp1gcQ7r
         ASFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742500344; x=1743105144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZelqN++iCMoSo52o6BA78GDAobp/ZBCEMMpAtQoOxRQ=;
        b=g8xCcz9ZUtDB5dWbyNWy9RX8W8ki3fb2RlyOqU54WWTof9z3suv65pHvEy/xjd/fTP
         A3Uc3iToToE2UKCQCrArISZchx5brnokStb0aGGouRBApzLAsx629NtTlpo6LinImSpB
         lXnEJzP2A8SKhkVZ0PvgkSWFJ86r9c+tlDAMm+h2CFpoTZwzPwrjgDPKQ0dWqEoqrq3Q
         d6O0VMvm4Qotcmz0bIQXYXTuTAMC2CT7f/YJWlJC8S5bNV7WtojqQscuWT1793+c4Hhs
         WEMFD4YynEuqDZAlY4Jgwg+eTMVDUnYyYy5VXbG1lGR0hcW9c/mvBZE3HpdNSfGDxiRE
         QTxg==
X-Gm-Message-State: AOJu0YxItOM/XwPIHTc5KNT8lLZplE2oa2qsamM/wOtbTWybDOc2woar
	jV2OnYUaMQvyTbJi9CRuOtH13QoIncwFwRxCt81xMzWFm63BDRKVvlyaHqE9HkMd7Xz8SDz3hrK
	hCss=
X-Gm-Gg: ASbGnctqknEDaWrg380Rprz+R1Z2SjqzT8lD5sCg65ycnxHoPYbeH3Il4Z39tnb29i0
	2p/3uwUYFqW4rrA+YrIYJvdv6kpnd1sMBzK1W7xEsQWicsgWbWbq1VtDPCiv5ZzMzVKUIHoATJt
	ZDRGknGv4t6oREop6wrQh3kz0XLwRXc2n7Ck2dRmuo/4qkr65sRcjDQzdEaOSj7NixibXVx+iKl
	XZ7klNdcFyGbxemDNwjFNR5WsyTxW2J+Y+RxlebWcH/vlWoVKs8ivCo1vFC6GCj+7pmINBTsDIM
	OwTDf/e8cpqaed0ydBWuW+4gYmLjlgNE/hv4q6gYoDiCt7sT5odcMG4nXw==
X-Google-Smtp-Source: AGHT+IGJuf4ol3bGpAuFAEyjwcYYmBGqRJbdgnhUNcY24zfdKNi8RMFq0qjGpMDJHQaLBUjpTb3uLg==
X-Received: by 2002:a17:90b:4a11:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-3030ff09e7fmr572817a91.34.1742500343884;
        Thu, 20 Mar 2025 12:52:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f651asm1826915ad.209.2025.03.20.12.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:52:23 -0700 (PDT)
Message-ID: <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
Date: Thu, 20 Mar 2025 12:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
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
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: /YhjcJM/tIdi

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgYWltIG9mIHRo
aXMgd29yayBpcyB0byBnZXQgcmlkIG9mIHRoZSBlbmRpYW4gYXdhcmUgaGVscGVycyBpbg0K
PiBnZGJzdHViL2hlbHBlcnMuaCB3aGljaCBkdWUgdG8gdGhlaXIgdXNlIG9mIHRzd2FwKCkg
bWVhbiB0YXJnZXQNCj4gZ2Ric3R1YnMgbmVlZCB0byBiZSBidWlsdCBtdWx0aXBsZSB0aW1l
cy4gV2hpbGUgdGhpcyBzZXJpZXMgZG9lc24ndA0KPiBhY3R1YWxseSBidWlsZCBlYWNoIHN0
dWIgb25jZSBpdCBpbnRyb2R1Y2VzIGEgbmV3IGhlbHBlciAtDQo+IGdkYl9nZXRfcmVnaXN0
ZXJfdmFsdWUoKSB3aGljaCB0YWtlcyBhIE1lbU9wIHdoaWNoIGNhbiBkZXNjcmliZSB0aGUN
Cj4gY3VycmVudCBlbmRpYW4gc3RhdGUgb2YgdGhlIHN5c3RlbS4gVGhpcyB3aWxsIGJlIGEg
bG90IGVhc2llciB0bw0KPiBkeW5hbWljYWxseSBmZWVkIGZyb20gYSBoZWxwZXIgZnVuY3Rp
b24uDQo+IA0KPiBUaGUgbW9zdCBjb21wbGV4IGV4YW1wbGUgaXMgUFBDIHdoaWNoIGhhcyBh
IGhlbHBlciBjYWxsZWQNCj4gcHBjX21heWJlX2Jzd2FwX3JlZ2lzdGVyKCkgd2hpY2ggd2Fz
IGRvaW5nIHRoaXMuDQo+IA0KPiBUaGlzIGlzIHN0aWxsIGFuIFJGQyBzbyBJJ20gaW50ZXJl
c3RlZCBpbiBmZWVkYmFjazoNCj4gDQo+ICAgIC0gaXMgdGhlIEFQSSBzYW5lDQo+ICAgIC0g
Y2FuIHdlIGF2b2lkIGxvdHMgb2YgKHVpbnQ4X3QgKikgY2FzdGluZz8NCg0KRXZlbiB0aG91
Z2ggdGhlIHNlcmllcyBoYXMgYSBnb29kIGludGVudCwgdGhlIGZhY3Qgd2UgbWFrZSBldmVy
eXRoaW5nIA0KImdlbmVyaWMiIG1ha2VzIHRoYXQgd2UgbG9zZSBhbGwgZ3VhcmFudGVlcyB3
ZSBjb3VsZCBnZXQgYnkgcmVseWluZyBvbiANCnN0YXRpYyB0eXBpbmcsIGFuZCB0aGF0IHdl
IGhhZCBwb3NzaWJpbGl0eSBvZiBtaXN0YWtlcyB3aGVuIHBhc3Npbmcgc2l6ZSANCih3aGlj
aCBoYXBwZW5lZCBpbiBwYXRjaCA0IGlmIEknbSBjb3JyZWN0KS4gQW5kIGV4cGxpY2l0IGNh
c3RpbmcgY29tZXMgDQphcyBhICpzdHJvbmcqIHdhcm5pbmcgYWJvdXQgdGhhdC4NCg0KQnkg
cGF0Y2ggNywgSSB3YXMgcmVhbGx5IGZlZWxpbmcgaXQncyBub3QgYSB3aW4gdnMgZXhwbGlj
aXQgZnVuY3Rpb25zIA0KcGVyIHNpemUuDQoNCklmIHRoZSBnb2FsIG9mIHRoZSBzZXJpZXMg
aXMgdG8gZ2V0IHJpZCBvZiBlbmRpYW4gYXdhcmUgaGVscGVycywgd2VsbCwgDQp0aGlzIGNh
biBiZSBmaXhlZCBpbiB0aGUgaGVscGVycyB0aGVtc2VsdmVzLCB3aXRob3V0IG5lZWRpbmcg
dG8gDQppbnRyb2R1Y2UgYSAiZ2VuZXJpYyIgc2l6ZSBoZWxwZXIuIE1heWJlIHdlIGFyZSB0
cnlpbmcgdG8gc29sdmUgdHdvIA0KZGlmZmVyZW50IHByb2JsZW1zIGhlcmU/DQoNCj4gICAg
LSBzaG91bGQgd2UgaGF2ZSBhIHJldmVyc2UgaGVscGVyIGZvciBzZXR0aW5nIHJlZ2lzdGVy
cw0KPiANCj4gSWYgdGhpcyBzZWVtcyBsaWtlIHRoZSByaWdodCBhcHByb2FjaCBJIGNhbiBo
YXZlIGEgZ28gYXQgbW9yZSBvZiB0aGUNCj4gZnJvbnRlbmRzIGxhdGVyLg0KPiANCj4gVGhl
cmUgYXJlIGEgZmV3IG90aGVyIG1pc2MgY2xlYW4tdXBzIEkgZGlkIG9uIHRoZSB3YXkgd2hp
Y2ggbWlnaHQgYmUNCj4gd29ydGggY2hlcnJ5IHBpY2tpbmcgZm9yIDEwLjAgYnV0IEknbGwg
bGVhdmUgdGhhdCB1cCB0byBtYWludGFpbmVycy4NCj4gDQo+IEFsZXguDQo+IA0KPiBBbGV4
IEJlbm7DqWUgKDEwKToNCj4gICAgaW5jbHVkZS9nZGJzdHViOiBmaXggaW5jbHVkZSBndWFy
ZCBpbiBjb21tYW5kcy5oDQo+ICAgIGdkYnN0dWI6IGludHJvZHVjZSB0YXJnZXQgaW5kZXBl
bmRlbnQgZ2RiIHJlZ2lzdGVyIGhlbHBlcg0KPiAgICB0YXJnZXQvYXJtOiBjb252ZXJ0IDMy
IGJpdCBnZGJzdHViIHRvIG5ldyBoZWxwZXINCj4gICAgdGFyZ2V0L2FybTogY29udmVydCA2
NCBiaXQgZ2Ric3R1YiB0byBuZXcgaGVscGVyDQo+ICAgIHRhcmdldC9wcGM6IGV4cGFuZCBj
b21tZW50IG9uIEZQL1ZNWC9WU1ggYWNjZXNzIGZ1bmN0aW9ucw0KPiAgICB0YXJnZXQvcHBj
OiBtYWtlIHBwY19tYXliZV9ic3dhcF9yZWdpc3RlciBzdGF0aWMNCj4gICAgdGFyZ2V0L3Bw
YzogY29udmVydCBnZGJzdHViIHRvIG5ldyBoZWxwZXIgKCFoYWNreSkNCj4gICAgZ2Ric3R1
YjogYXNzZXJ0IGVhcmxpZXIgaW4gaGFuZGxlX3JlYWRfYWxsX3JlZ3MNCj4gICAgaW5jbHVk
ZS9leGVjOiBmaXggYXNzZXJ0IGluIHNpemVfbWVtb3ANCj4gICAgdGFyZ2V0L21pY3JvYmxh
emU6IGNvbnZlcnQgZ2Ric3R1YiB0byBuZXcgaGVscGVyDQo+IA0KPiAgIGluY2x1ZGUvZXhl
Yy9tZW1vcC5oICAgICAgICB8ICAgNCArLQ0KPiAgIGluY2x1ZGUvZ2Ric3R1Yi9jb21tYW5k
cy5oICB8ICAgMiArLQ0KPiAgIGluY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaCB8ICAzMCAr
KysrKysNCj4gICB0YXJnZXQvcHBjL2NwdS5oICAgICAgICAgICAgfCAgIDggKy0NCj4gICBn
ZGJzdHViL2dkYnN0dWIuYyAgICAgICAgICAgfCAgMjQgKysrKy0NCj4gICB0YXJnZXQvYXJt
L2dkYnN0dWIuYyAgICAgICAgfCAgNTcgKysrKysrKy0tLS0NCj4gICB0YXJnZXQvYXJtL2dk
YnN0dWI2NC5jICAgICAgfCAgNTMgKysrKysrLS0tLQ0KPiAgIHRhcmdldC9taWNyb2JsYXpl
L2dkYnN0dWIuYyB8ICA0NCArKysrLS0tLQ0KPiAgIHRhcmdldC9wcGMvZ2Ric3R1Yi5jICAg
ICAgICB8IDE5NCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gICA5
IGZpbGVzIGNoYW5nZWQsIDI1NyBpbnNlcnRpb25zKCspLCAxNTkgZGVsZXRpb25zKC0pDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaA0KPiAN
Cg0K
