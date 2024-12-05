Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp280415njb;
        Thu, 5 Dec 2024 09:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXclCH3oRUhyoLVgvDWeaZm95JfL8ZS/6iJ/s8WSlr37jMm0FXhgZKIy6DqRAuvp4ynFMlqTi108Wxq4w==@linaro.org
X-Received: by 2002:a05:6a20:729b:b0:1d8:fdf8:973c with SMTP id adf61e73a8af0-1e1653f2f48mr17060929637.29.1733418412166;
        Thu, 05 Dec 2024 09:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733418412; cv=none;
        d=google.com; s=arc-20240605;
        b=YZm3t+4pdeFOyLrcU+MNw5KJv+lv/39HOGT1yXfQhq6xgqLfLpJGBKYrGUAj3xga0W
         S3xUEDAIva7g1D4d1SjJ9CF4Mop/IRMR4WraS7jYBl7yyMwNsle8G4r56Od7QkCpn8iO
         B+XY70a2nwj/go47LMekYtoQJdP52T42wtuNoueXz3yXeTevcUWcfWgzNKps5+wn+KFD
         9VpOwSQI9FEHeLWhcrwArB2Ba15frI+LSNsPQXPKhGxx4TtypMncHoYo5dLN1/YzE0rs
         gXk7Dp0a5ji8LkRPS8OMGaNNf4uKFBBRyNjSND2jdKkGYBcIQ5AML9876IzUV3ZWR+j2
         Xr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lGYMY6WRm/CgvOKPzzv7GX+9rGXPyRw+TojADqecgy8=;
        fh=AjOhQTwRkuREeSPyIhA89ryWhOTyQ/kX4zYkgBsfX8s=;
        b=A5rsOYotT/Hv4icVxmfQsMwTM9PCEWZdXwrMlvHzn0i6ASFaAdewSZaZTyTT6E8K5A
         cmqFv77dZHH+0GvZfugnQDe3/sF1xswtZB9KUQ8CDBT7FFGOsqIIVXGnfcDnfNiHRK4D
         eBqTAfNeV/yaKy+lKnK7HngyVBWez1Cu+JN/jl9VQe+yV+nJx/Qs9jNGaCjSAd5JVqGC
         VNP3WV4v1khxqv451Z3VgbxCA0gGPXMcYCWpDl0OHK/18zMsXl+nvWDwY8hBOsYM9ao9
         pEK2Wc0prpHHWIbQhPJxjOL9hu9L5bkHmJrwSADgbXVBBjAqrqbaFqkbGJagQS64RlGC
         pw5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2kHuu8x;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725a2a96996sor1168818b3a.7.2024.12.05.09.06.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 09:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2kHuu8x;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733418412; x=1734023212; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGYMY6WRm/CgvOKPzzv7GX+9rGXPyRw+TojADqecgy8=;
        b=G2kHuu8xFNS2Mjk6Uzspo0Bc3n8CeOca01hPQe3hxcxLdky7XN1jGkkQgAUG9y9oUp
         4ZycO4hGsTH3rzq+zcrpQ7d/rKV/kds8mJznQL2cL4wkoVJHXu5Y37LUdCjLjnkLDtxO
         DGnNBhmUSpGZdoRauhcftKsReuIcBABYEzfm0/57Rokb2NlPg28r0uryZF3Jd2pew7/W
         Kyhc45+V+8uShJDSO59pWGU91LXFVq71wfjGuYNE7VtSQ7+nQASTuoK96CtK2lP0cVd0
         dOcG/2Yah6Pgy6RPlOLqUdzcYVxFvq9lNdsMz7ti9K8jDSdXx8MJjSAMzxqhEXsi5yIa
         xZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418412; x=1734023212;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lGYMY6WRm/CgvOKPzzv7GX+9rGXPyRw+TojADqecgy8=;
        b=Pt5QRekABHFbcw86khNWSTFTueOdXU7SU09vmDL2gnQsESda5T+sKjcJq0ItVPEKTH
         tutoeTQ01n5CJL14HIXuUeyDBxX0W+/0bgqGikc0Pq7XwfX3KEO9Oi5hhR3tNpB2oIvo
         zFOhRzwiJTC+Vw0S+Rc4n0gUsI4DbfNw1GNphErTmagW+Q2BiGic7RwrmiHm0wuEkVNe
         +JZ2DJm4KbM/SNyVF3gL9nWU9EgLVjJBx58da1XnhTI0eBQysGrBOWMYB2YCybxqkmKk
         1WSZqCZ/4F2QmBSI3txWoYryjtJKmLe6dCU0MzGKRu21XDiHSq4DxIh7/V/Q+GSBY3ZZ
         KZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuzjr4GRDOj+U4cAMG9eY3xUsb+SFi5HZsfgUjg+VApFBoED1uwm3MWtmkOnx+Sa4xxr3pAJgCDgmCpw==@linaro.org
X-Gm-Message-State: AOJu0YyZDQ/iNxnTVgAeEpNYzp5HyipH48JxIeZ6Mzc2kWih3lE2U3Ap
	iA724/C9W3Fb3uvnXuycrGqiSwdw619jEXLCLnQy9HqV9t37JGHEkConqNGG+J27CQ==
X-Gm-Gg: ASbGncvxGEflsnAvc9N9IcDcOWNMyePjZNKpVctjs0gbY6gIbpuOdudKstIaVzJzYxe
	KGgMl6WK7rbRWgsYiL6VgzGKZb9PFBuCpabV7jsUqIURpmCm3l3TFE3QrwVbCfNXBgxVJbF0tby
	ToHswJf7jEjOlANOpTI40tBTKNP4fz+x21CNzfGfwTheonmr5ZZYCdr/Snqtu+BvGar/qic0EAB
	FWajHyGXCXtq1jnYzpHsqOoCq5zxu2cA8GmfGc6+IKGcPD5r9LaQV2ESf3PkRmna6grSTmkQOUV
	puKo1yPRbhXSbOA1+U1V3w==
X-Google-Smtp-Source: AGHT+IFp4yg6KGElUVOp5ATJGDG25H8hEXBoGjCT7NXdnuYwYJh48jND6l21XzghxXEQ4laPZPBaUA==
X-Received: by 2002:a05:6a00:3d03:b0:720:36c5:b548 with SMTP id d2e1a72fcca58-7257fcb8d37mr13764873b3a.16.1733418411387;
        Thu, 05 Dec 2024 09:06:51 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2cc5e70sm1468645b3a.174.2024.12.05.09.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:06:50 -0800 (PST)
Message-ID: <7765df38-eb5a-462f-8145-72891b309c5a@linaro.org>
Date: Thu, 5 Dec 2024 09:06:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs/system/arm/fby35: document execute-in-place
 property
Content-Language: en-US
To: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, alex.bennee@linaro.org,
 Alistair Francis <alistair@alistair23.me>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
 <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
 <0121beea0cbf51268ce6c9e20e7c16660ec6b9fb.camel@codeconstruct.com.au>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <0121beea0cbf51268ce6c9e20e7c16660ec6b9fb.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: xQ+ZLQAMidiN

T24gMTIvNC8yNCAxOTozNywgQW5kcmV3IEplZmZlcnkgd3JvdGU6DQo+IE9uIFdlZCwgMjAy
NC0xMi0wNCBhdCAxMjozOSAtMDgwMCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+IFNp
Z25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZz4NCj4+IC0tLQ0KPj4gIMKgZG9jcy9zeXN0ZW0vYXJtL2ZieTM1LnJzdCB8IDMgKysr
DQo+PiAgwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RvY3Mvc3lzdGVtL2FybS9mYnkzNS5yc3QgYi9kb2NzL3N5c3RlbS9hcm0vZmJ5
MzUucnN0DQo+PiBpbmRleCBiZjZkYTZiYWEyYS4uZWQ5ZmFlZjM2M2MgMTAwNjQ0DQo+PiAt
LS0gYS9kb2NzL3N5c3RlbS9hcm0vZmJ5MzUucnN0DQo+PiArKysgYi9kb2NzL3N5c3RlbS9h
cm0vZmJ5MzUucnN0DQo+PiBAQCAtNDUsMyArNDUsNiBAQCBwcm9jZXNzIHN0YXJ0cy4NCj4+
ICDCoMKgwqDCoCAkIHNjcmVlbiAvZGV2L3R0eTAgIyBJbiBhIHNlcGFyYXRlIFRNVVggcGFu
ZSwgdGVybWluYWwgd2luZG93LA0KPj4gZXRjLg0KPj4gIMKgwqDCoMKgICQgc2NyZWVuIC9k
ZXYvdHR5MQ0KPj4gIMKgwqDCoMKgICQgKHFlbXUpIGPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICMgU3RhcnQgdGhlIGJvb3QgcHJvY2VzcyBvbmNlIHNjcmVlbiBpcw0KPj4gc2V0dXAuDQo+
PiArDQo+PiArVGhpcyBtYWNoaW5lIG1vZGVsIHN1cHBvcnRzIGVtdWxhdGlvbiBvZiB0aGUg
Ym9vdCBmcm9tIHRoZSBDRU8gZmxhc2gNCj4gDQo+IEJpdCBvZiBhIG5pdCwgYnV0OiBzL0NF
Ty9DRTAvIDopDQo+DQoNCk15IG1pbmQgd2FzIHByb2JhYmx5IGNvbmRpdGlvbmVkIFsxXSBh
ZnRlciByZWFkaW5nIEZhY2Vib29rIDopLg0KDQpbMV0gaHR0cHM6Ly90ZWNoY3J1bmNoLmNv
bS8yMDExLzA2LzI1L2ltLWNlby1iaXRjaC8NCg0KTW9yZSBzZXJpb3VzbHksIEknbGwgZml4
IHRoYXQsIHRoYW5rcyENCg0KPiBBbmRyZXcNCg0K
