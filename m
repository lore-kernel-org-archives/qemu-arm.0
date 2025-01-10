Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp472292njn;
        Fri, 10 Jan 2025 14:59:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNrkEzDTEEoVkGbzH4SekTdNatOskcOFEQMwzoWSIhyW/fAUhwuAo9FeBdDm2nHkVryiCerGW+PLCGWA==@linaro.org
X-Received: by 2002:a17:902:e810:b0:216:2804:a241 with SMTP id d9443c01a7336-21a83fb0a86mr180176075ad.37.1736549966880;
        Fri, 10 Jan 2025 14:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736549966; cv=none;
        d=google.com; s=arc-20240605;
        b=TokcDcqgtMDAmxgZfWQM8oVbSUc9bE8YoTjsl8dlWsLU+qRP+Oi+TFNzfRyf4jGFeW
         mXQVbhIiTM1uFhMCnpomlzjh++Ui/7MmatlCBPMuGaE1xXStW3MsoaDBqZjpjAPswXjA
         AxvkPia6bg7tijjHLi1vcdHC2nuT5xXdDF4vt1F9WmBtgpHP4jX4S6eOvgYOiiWhNni6
         rCgiKjMqX8HaP6/CH6OQWJWyv3noYADUM97+Os3OvCPYwzXtTagStKPym2+zqKR5wU9i
         0JPdTL4HQ/k9kbmKDfmG1nUIDZfJko9X2jNCUK0IYRV72k6iI7zOFfB76frRdDc4Uimp
         WRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xO1gZhEiz7qswTy1afo9NzQZly0JQn3J43Li6lQRGgU=;
        fh=cUh8UsxkW6TgDQ5uwZj+fNuJLIxrVXqBSGsO+98pSAQ=;
        b=YMTwvR/eoHF6ZZPZNowHOOho0HCDKGqA0NsWM/L+Hm+kcXNnITkpj6ymy4fhWnIyYT
         wRhlg84Cf1zFvn1jIBEuDolBM6ZAuL43QvLx78J/lIgXKMcYm0v7ZNKHh79o0IF2DUXO
         JiHZucrw67KPuSLJ38OceezzTxrxGfe630zpavJlVourDX/HBPCVPrkUG0UqYVuu17SC
         WrZnvJUtQP5AKpYb+kfPzbvK5CX/Nw8NkApeteXrCGP9CVaIESyOV7lofLjOpkYMOvqd
         Oqi2l+azECR34ED8s4X3/VMHIofk1Pq7mcAj0KQ0DWrHs7+nHzgFP1LgHVbMQ/SCuOXc
         nt9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZkHDGo3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21a9170f41csor30634075ad.10.2025.01.10.14.59.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 14:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HZkHDGo3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736549966; x=1737154766; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xO1gZhEiz7qswTy1afo9NzQZly0JQn3J43Li6lQRGgU=;
        b=HZkHDGo3uSOXWMWA+2vnAh+rgqeTUtvSJVjJC+J4gA1SSrHK/ysQjU9k1grF/m/gY0
         Ptf41RJEkUt84EKNHPxKVQnW2J8kC2EmmRfdmoajbag4S3/RpdFfa/ar0EGu63xmbHC3
         LdEwEkRt8Qn2WOYn1pDrk0U2cXw/ulSeHaKCxeBr+W4rlzky1b7IiLaQhK5LDy6P2vI5
         h5cprB87lY9fmjHuUR8cZnrAk2AlVa/YDFBPykynwvo4ADIS214gUhGkHSIx1ZCmlgpg
         sJR/SZf9yizWuTdySULqjWI1yoGHnXbXIWQZedTSxb30nRSRQKNvuCZKD09oHxC/m5kZ
         uh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736549966; x=1737154766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xO1gZhEiz7qswTy1afo9NzQZly0JQn3J43Li6lQRGgU=;
        b=mj78rh0mKegAU8eKufWcNRGLKLbD+ewCpj75Cht7l8cJXrJLOBzE4JpHIC8iH9tPQY
         CRH5xZD7E1Nw0wCgzeMGvLoVfrYla5hPYERDfCyfV0TjRM/x8Igw7kD0tN7F806oXipp
         fTbxRuifDZYg7OrI7rXEzFPKw3Rr63AM5AqaOtwmByQw6ALe4uL1Ert54YVStczaETPs
         uWI9BD76PGsbOqJc4FiCARHPlNlmDFcLqZRFqYzN/zW0d87nTV4JEZMHLyJdzQtqNIPM
         wN4IJGv19oi4xbPRLXr5jkzQpZRZvaYGhnC5kI1C7UnjA6bme4YAm2erZjszIJalOj2M
         e/og==
X-Forwarded-Encrypted: i=1; AJvYcCXQpUlI/nIXbVuoRWFgiyNZ0vcG4AY77bfH0S8QHMobPIJ2FoXP9T2I/k+KLODdx3iUNgl94WL8NigGFw==@linaro.org
X-Gm-Message-State: AOJu0YwrqUHCyikArkBe39SN/gTTHOkPhvOCEEXGaYXDD/I5AZ6Xubso
	wQE2UvygBXIhWE7Q157b+3cHHxgu7Sp/oCf5YuKOOJKYEgoPWIxI96g1Vhesn6knjA==
X-Gm-Gg: ASbGncvL1H09AN5zmB8MYeV2EUQMYXRYb2n38se+FB6fMNe0ZvJn+Vist2wYGWBCUYe
	cB+u/hflZEUcj1m4LHo5s+wLZqozag3DI1zx8OFtYOrvfW5ZcOK0FzfOAEBx6vivJNZYavJzSWp
	GkrvXkSzIfVMnCNv+3PULGVWgAcKgJ4JdsUCSN7Ct4UbQ/6EwuhSTWUJGtNtfPRT8N9YBrwqS0m
	atyebghgSllK6gYbG/WmG6B24YTDlEtQrMbCMj3n56+V9kBvU03h+3QvYWxTYHBwhm5kg==
X-Google-Smtp-Source: AGHT+IFKiXzYwTNQwHK7rQsE2nt4Wqk3UwcViTRpJPGCy5KQeMMA9BWlgfROlFoMHuSc2b4Qngcp9g==
X-Received: by 2002:a17:903:1206:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21a83f5d8c3mr165067195ad.27.1736549966338;
        Fri, 10 Jan 2025 14:59:26 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f256b4csm17857425ad.215.2025.01.10.14.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 14:59:25 -0800 (PST)
Message-ID: <77f1cf6d-afba-4311-a15b-50594cb5fda0@linaro.org>
Date: Fri, 10 Jan 2025 14:59:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration
 information
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
 <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
 <331d0b7b-40db-4a6b-80ba-178892f60506@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <331d0b7b-40db-4a6b-80ba-178892f60506@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: fQE54yCpohBO

T24gMS8xMC8yNSAxMzoyOSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDEwLzEvMjUgMTc6MzAsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+PiBPbiBUaHUsIDE5IERl
YyAyMDI0IGF0IDE4OjMyLCBQaWVycmljayBCb3V2aWVyDQo+PiA8cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNr
IEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiAg
ICBkb2NzL3N5c3RlbS9hcm0vdmlydC5yc3QgfCAxNCArKysrKysrKysrKy0tLQ0KPj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+
DQo+Pj4gZGlmZiAtLWdpdCBhL2RvY3Mvc3lzdGVtL2FybS92aXJ0LnJzdCBiL2RvY3Mvc3lz
dGVtL2FybS92aXJ0LnJzdA0KPj4+IGluZGV4IGQyNTI3NWMyN2NlLi45ZjE0NTdjZjlhMiAx
MDA2NDQNCj4+PiAtLS0gYS9kb2NzL3N5c3RlbS9hcm0vdmlydC5yc3QNCj4+PiArKysgYi9k
b2NzL3N5c3RlbS9hcm0vdmlydC5yc3QNCj4gDQo+IA0KPj4+ICtWTSBtaWdyYXRpb24gaXMg
bm90IGd1YXJhbnRlZWQgd2hlbiB1c2luZyBgYC1jcHUgbWF4YGAsIGFzIGZlYXR1cmVzIHN1
cHBvcnRlZA0KPj4+ICttYXkgY2hhbmdlIGJldHdlZW4gUUVNVSB2ZXJzaW9ucy4gVG8gZW5z
dXJlIHlvdXIgVk0gY2FuIGJlIG1pZ3JhdGVkLCBpdCBpcw0KPj4+ICtyZWNvbW1lbmRlZCB0
byB1c2UgYW5vdGhlciBjcHUgbW9kZWwgaW5zdGVhZC4NCj4+DQo+PiBUaGlzIHBhcmFncmFw
aCBpcyBnb29kLCB0aG91Z2ggLS0gdGhhdCAnbWF4JyBkb2Vzbid0IHdvcmsgZm9yIG1pZ3Jh
dGlvbg0KPj4gaXMgaW1wb3J0YW50LCBhbmQgd2Ugc2hvdWxkIGRlZmluaXRlbHkgZG9jdW1l
bnQgdGhhdC4NCj4gDQo+IEFoIHllcywgSSd2ZSBiZWVuIHRoZXJlLiAyIGNsb3NlLWJ5IGNv
bW1lbnRzOg0KPiANCj4gLSAnbWF4JyBpcyBub3QgcmVzdHJpY3RlZCB0byB0aGUgJ3ZpcnQn
IEFSTSBtYWNoaW5lLCBidXQgdGhpcyBkb2N1bWVudA0KPiAgICAgaXMgYWJvdXQgaXQsIHdo
YXQgYWJvdXQgb3RoZXIgQVJNIG1hY2hpbmVzPw0KPiANCj4gLSBNb3JlIGdlbmVyYWxseSwg
Im1heCIgQ1BVIHdvbid0IG1pZ3JhdGUgZWFzaWx5IChpbiBkaWZmZXJlbnQgdmVyc2lvbnMp
DQo+ICAgICBvbiBhbGwgdGFyZ2V0IGFyY2hzLg0KPiANCj4gTm90IHN1cmUgd2hlcmUgdG8g
ZG9jdW1lbnQgdGhhdDsgbWF5YmUgYSBnZW5lcmljIGNoYXB0ZXIgdGhhdCBjYW4gYmUNCj4g
aW5jbHVkZWQgaW4gYSBib2FyZC5yc3QgdGVtcGxhdGU/DQoNCkl0J3MgYSBnb29kIHBvaW50
Lg0KTWF5YmUgc29tZXdoZXJlIGluIGRvY3MvZGV2ZWwvbWlncmF0aW9uLCB3aGVyZSB2ZXJz
aW9uaW5nIGlzIG1lbnRpb25lZD8NCg==
