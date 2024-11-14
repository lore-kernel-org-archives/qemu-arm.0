Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89362njc;
        Wed, 13 Nov 2024 20:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaSl2hA7nr+pZICOZWRHtZVcr193999gyr49wmMKLZVEKcxznCWSs1OoJXIG4wnQxVqW6odfw9wHvvFA==@linaro.org
X-Received: by 2002:a05:6830:7317:b0:715:7099:ffe8 with SMTP id 46e09a7af769-71a6e44b8famr826788a34.12.1731557480830;
        Wed, 13 Nov 2024 20:11:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557480; cv=none;
        d=google.com; s=arc-20240605;
        b=GlI8QeL93hxLvSvXVYj9T1WFLUWmDfwob6Cfo/4gzwXT39pgWws7qEu1R0XWHRw/C4
         yWGcjj8VhC/AynjZpo2FO/S9FdzgblnXwe/SIYYJS8HQ84Vchj2Xzj5l6W1fHU3zUR6/
         I3JT8ZOlUAqvUGum7LdZlfOCTTuMPQJHijIddA8KOnfxTnwxjy5MIjRIY4lGdLbhPLJX
         LauQElnnISr5GTz0fDJmEaGqkVS8RQtJbeXFt0LTIBhO9Mt9MyHbMwkD3dvoWXAurM/0
         zo2vyQnGAeRa4Up3dxbR1smWf6O4v6oEHETsrH4aTo+gHfSIXpx00lwmET+OhZtpRZDa
         hkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jv9JiIWJE1vzQVPFyvVwvDKEKOfDWoMPFigOySU3qgw=;
        fh=r+3LBmJIoWQ5dJHKg6w+J2QectlTWMI20jwzHn8sl08=;
        b=kUyTrBn3V1PX188pjOK+bybeOUGMngeQFFi3HI0kUyIka4l5jq0D1FDlLioPsX0kW3
         SvUjDfPaGjsvrLhZDgy2HHeIeIKKe/mlHgP+5byVN+Ajhjko6tstQw6bDLWEWP9o43V1
         3x9wFmN3snNJlkies8/R+eYivhVQ+YzgMz4yFz620U9TrkLSNBkPdFHYI2V2ERFjaO5y
         7E1EGRjuY/k7VRnFoTa+6lor5NgQQcARF7SyEq8+QUn8ZU2izzykgr3/lLD30V3LKHjc
         BOOKSZGMMlUrTkUuTZpL8kiAki9LmPZO0lrWAnMYWQ5xzuUFO8oKAiqbiLbfN/1Gs+bY
         augw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvba91Z5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7f8b3a30a34sor134978a12.6.2024.11.13.20.11.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:11:20 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvba91Z5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557480; x=1732162280; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jv9JiIWJE1vzQVPFyvVwvDKEKOfDWoMPFigOySU3qgw=;
        b=uvba91Z5wSWNNcqeevFuwTU7KKbboNTT02viNMqrnj46Yd4boMfEouFThY3wo7XN0j
         mtTUofW0IAvJgEombsyDhsrpgnq0+SdU4d4IbQglMA9yoY8Y9mSClNl9HL9aLSEfmv2b
         ZATbXts7TC2VziIBsfHUGaiOoH21IAde3LUN1wx+t/ENDtiMbBOlI5UQGZB9W66PkfML
         DERwEfKFtRrRthXohNgEyjDrIXsohlMNYOgEIEb+BMNmzWIvUxuWcwFaif7WH2wUFsaQ
         6VBLD72VKTLopfLaWfQf2Z4RzlRhPKKJF8JJTzXWlCgrmQ5ZGuaM6OF6jWnHolamhlgU
         Yg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557480; x=1732162280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jv9JiIWJE1vzQVPFyvVwvDKEKOfDWoMPFigOySU3qgw=;
        b=gp1TrHlrM5BdiQS74S5HcHi4AKaWjwHcaeCOOSBXsuUVaxFJfGDfhOBhBSMLKN+2/S
         GHAbnUUJK03KyIFBq6YTTK17t8IHruJf9Kieb8Bpmq0DLu5rtdRWRBH5VLHRQ9QEpgUg
         5vJGBDn6MI2L7O+I5PvwTCJJ38KAyTuIawBnB8Li1bG2GBlRNxM7BH4/hUp6zb8LwkEn
         8JuY9FoV95Y1bxccBPJGg6dpQMuKIt897u4X8lkNeVdSAd9ah5PYPyGH0XyDAwnioALI
         1D9uj0ytUXT8HgiUYkgyLPe9L9Y6XW2JhnkA+l6Za45+kgN5wq3ArVFdq/NLh6QDXZXF
         ldSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBFK51O0VGajCF7dpzPyZebNCw+mLuuy2duVr6O4btwTtwEUeL/lEvHUW2E3E1JOayRGLuuPzRM6XOPg==@linaro.org
X-Gm-Message-State: AOJu0Yxg5EpV0hUqEWEvc05f+mO7Vs9tvU4bOGCZmZZtGYQpSFjfr0G5
	2Q6/bFeCBz3M67ezen4K36ZWkDwhYGbz9qTECtWGLLuPUEYyWLQ1vuUUFqm53O+hqA==
X-Google-Smtp-Source: AGHT+IFoAFkaZFZZOJ7c9cP095EN8WOpPtRWl4mfrdTnHnZbBu2sZ5qMOL69fVHp1jC2U5l3LhQysA==
X-Received: by 2002:a05:6a20:7484:b0:1db:e338:b5bc with SMTP id adf61e73a8af0-1dc832a5e81mr1115831637.5.1731557480361;
        Wed, 13 Nov 2024 20:11:20 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a9bcfc0sm242604b3a.163.2024.11.13.20.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:11:19 -0800 (PST)
Message-ID: <5270010b-5deb-488c-83b2-f8cb8b6966ae@linaro.org>
Date: Wed, 13 Nov 2024 20:11:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] target/i386/helper: Include missing
 'exec/translation-block.h' header
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
 <20241114011310.3615-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: GsEyE9Zc8zVD

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gVEIgY29tcGlsZSBmbGFncyBhcmUgZGVmaW5lZCBpbiAiZXhlYy90cmFuc2xhdGlvbi1i
bG9jay5oIi4NCj4gSW5jbHVkZSBpdCBpbiBvcmRlciB0byBhdm9pZCB3aGVuIHJlZmFjdG9y
aW5nOg0KPiANCj4gICAgdGFyZ2V0L2kzODYvaGVscGVyLmM6NTM2OjI4OiBlcnJvcjogdXNl
IG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllciAnQ0ZfUENSRUwnDQo+ICAgICAgNTM2IHwgICAg
IGlmICh0Y2dfY2ZsYWdzX2hhcyhjcywgQ0ZfUENSRUwpKSB7DQo+ICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICB0YXJn
ZXQvaTM4Ni9oZWxwZXIuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9pMzg2L2hlbHBlci5jIGIvdGFyZ2V0
L2kzODYvaGVscGVyLmMNCj4gaW5kZXggMDFhMjY4YTMwYi4uNzVjNTJlMjE0MyAxMDA2NDQN
Cj4gLS0tIGEvdGFyZ2V0L2kzODYvaGVscGVyLmMNCj4gKysrIGIvdGFyZ2V0L2kzODYvaGVs
cGVyLmMNCj4gQEAgLTIxLDYgKzIxLDcgQEANCj4gICAjaW5jbHVkZSAicWFwaS9xYXBpLWV2
ZW50cy1ydW4tc3RhdGUuaCINCj4gICAjaW5jbHVkZSAiY3B1LmgiDQo+ICAgI2luY2x1ZGUg
ImV4ZWMvZXhlYy1hbGwuaCINCj4gKyNpbmNsdWRlICJleGVjL3RyYW5zbGF0aW9uLWJsb2Nr
LmgiDQo+ICAgI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0ZS5oIg0KPiAgICNpZm5kZWYgQ09O
RklHX1VTRVJfT05MWQ0KPiAgICNpbmNsdWRlICJzeXNlbXUvaHdfYWNjZWwuaCINCg0KUmV2
aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
Zz4NCg0K
