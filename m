Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2604482njb;
        Mon, 16 Dec 2024 17:37:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAyy8dItcCzGHG9JughTDEHuTT+m3Q1vMWpFjDgpErGHuHZd/mdLxFRCTKwi8GQHlxfU0JBYmVXF3EtQ==@linaro.org
X-Received: by 2002:a05:6a20:a107:b0:1e1:aef4:9cd0 with SMTP id adf61e73a8af0-1e1dfc18857mr23836206637.3.1734399438764;
        Mon, 16 Dec 2024 17:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734399438; cv=none;
        d=google.com; s=arc-20240605;
        b=epqLXWvTp1NxDtLuXbpDklPezJjzAJeoEAcIWdbDYwlZGShTDn2uEXx9g2MjXwAsAv
         mdje2pE4b3Qo9KNVqvqarezzsJLtYpksW30MWXN64sI/qKEeLp9OVBLZTulDZmw21onC
         3fO2Sww5tf0UA+zGyOvsaAFm/vspQidW+3MzWUlS4Qf3O3kAwwM5nuFStcIGY5v3Dfxg
         BFHonAkxJVJsAO80Mv2rk++plKkx+vTWnYZ2Ppfz3jqkQbGsIwrMFXENdWffD/c9Xzie
         AeNOPGhMgiwzoAQ70I3GvebJNZVJAc5J9nsn1DIC7nKnRm6PVgI3oQlUeDYdi3n/6miA
         yjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=58S9uhqOfe6b2kK2jKkLS81vpX910XTN9+ZeO7HTvTo=;
        fh=WsgJ94mdFzHgltGbqmHGXuwqSka39ELPzkaOKd3izqQ=;
        b=RyKfXRPsDpvEDFN9FVN8vuFelDhWRBemvGHb7fmLqg6bjAiM4H7p45IWXeVOhZB5EJ
         6prGj09vdrdP7sS3lB24/WHwYoCdOSFfdurIivmIO21n6SvLdqSl7zvgBcKZ+dmPsa1E
         qw3vTvjnSKU62TT5fCI1Ab/LpSteFld1ZNDlYqM6xOVSMUDh7HkVwN4SNWfHeqw4q23Y
         CIx/OehpGCB+jZSpbJj6olObHUpQ+eTPr2HrkwXArV2JPM/n7dPZcC9SNbmlsLY15F5u
         /5Jn9vdPkOwyjw/zQHPKZ3x4XCPbOjt5MfHj4H6bL8QuE3L2MDAT8BKwdXGtp5VKzmYi
         zSVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHY48v4H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72918b9cfd2sor5037198b3a.8.2024.12.16.17.37.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 17:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHY48v4H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734399438; x=1735004238; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58S9uhqOfe6b2kK2jKkLS81vpX910XTN9+ZeO7HTvTo=;
        b=WHY48v4HIBMmzjVceqghVh3sj67SZVJJP9roVjw34gCzF5UxLd1c99wwdXZBZ/GHk5
         nFb+Z7bJAWeqPhSPa4n/RKj20dd7G9iFBAL2UK/cDVRA5lbfah+HmwXQnOdlfapDIPO7
         d+FNa6L9yO/q0xsfe6/FQ2L66d+6Cea6iMskH00SNk54fo0CcoyCwEvj9aByJwZTByBE
         ghS4bokv/Md/kqliMnSzcMwLhzPB4fAQabesm/pQzFu8707MV3vXP9MJBwu/y48XNVMa
         8WJyERlxGbs0zqy3tlRfLiyfKZ5okUCLwYRjIFjKgJ3KQH6oZsdatSC42Z3WDrT2aRuI
         smVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734399438; x=1735004238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58S9uhqOfe6b2kK2jKkLS81vpX910XTN9+ZeO7HTvTo=;
        b=I+zo23ILVj0+xwgvJ6CC9/AwSfYiL4Bb2dBtqLAn7sf9HHs7fV4XgTkIXYTV3MIwXn
         W8UuccQIP8LUCd/4Y+aAp+FmZFTZXkW0G5nOS+NBE3MJQcHQkjCuDJz9nOLJAiZMfshA
         qfclPpqWFVFH/oq5wfLGCJ846U3nR362gm03ubc7sureYoI1YUCpJkdYgC3lQgDZRwRt
         X+qmeBsp+T7YzYi+3ZYux2epklVBxUNYCHDPoVocsCytuOEUzwFBF7sSSA0H4+qFyaQh
         AivaG0i/4Q/T2j934nXdiTMplhnRkW9jHIGVakK2EtCjFyR6buzN2W8S/UncxSAESuxd
         Q7JA==
X-Forwarded-Encrypted: i=1; AJvYcCWMb/GUftugeKFge96nWWFGhK3M8dvEZObjpUXxG6cbt0Sigrm8mIvdnenZhzgqGfEYYjr/1wmlrvvmjg==@linaro.org
X-Gm-Message-State: AOJu0YxH7d8V8sTIAHrBwfvmfq71HzNOC9WZcl7Xn2PU/rh5IHDWyPmr
	mnwJnkAbr3uhsH/fJ7alDLP2OhLexZj7nlA5SRmIqEQzVSNc4h+/+w4WlSFaKOYOQA==
X-Gm-Gg: ASbGncu7B+o4to5RxKaVDbU1jsOACg+2wm0j7Pb4DaVucoTXOrQdKeATKcoFjAdo0/S
	KwmInYIEkNI4xYeLXUwSCsFjz83wg0U/qD2P0LCmArcPjB+zlzIcGyif/8jZqVjgkxzd3f6odhe
	srfwhcmNrB2kxEoB0ogxRJAjL3BtWcoOw/gCGqoZdZ4gNC/+3GKPGoO/oYXkEx1+uU50ApxxPdv
	lZiyeiVZMyM/tJh6E2d2K9FaYh76CKBiDJTWYIxrRhCXqY7pwRWEIFxg2Jqovgw4ZIHWMrEKzid
	3EfoROJNs9ofOWdRQeQ7gOsiJOvo
X-Google-Smtp-Source: AGHT+IEBgl1hnPj4HXBP9uZZaA3d+A2ih14wjGSoHZ+0RaZbtAoP3bUfaoqg/F/qFJuOQZQwO+Ufkw==
X-Received: by 2002:a05:6a00:32ca:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-7290c10d751mr22431588b3a.3.1734399438223;
        Mon, 16 Dec 2024 17:37:18 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5c3662csm4718560a12.71.2024.12.16.17.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 17:37:17 -0800 (PST)
Message-ID: <19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
Date: Mon, 16 Dec 2024 17:37:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
 <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
 <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: YstJvizbnb9l

T24gMTIvMTYvMjQgMTE6NTAsIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPiBPbiAxMi8x
Ni8yNCAxMzoyNiwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+IE9uIDEyLzE2LzI0IDEx
OjEwLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+PiBPbiAxMi80LzI0IDE1OjEyLCBQ
aWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+PiBxZW11LXN5c3RlbS1hYXJjaDY0IGRlZmF1
bHQgcG9pbnRlciBhdXRoZW50aWNhdGlvbiAoUUFSTUE1KSBpcyBleHBlbnNpdmUsIHdlDQo+
Pj4+IHNwZW50IHVwIHRvIDUwJSBvZiB0aGUgZW11bGF0aW9uIHRpbWUgcnVubmluZyBpdCAo
d2hlbiB1c2luZyBUQ0cpLg0KPj4+Pg0KPj4+PiBTd2l0Y2hpbmcgdG8gcGF1dGgtaW1wZGVm
PW9uIGlzIG9mdGVuIGdpdmVuIGFzIGEgc29sdXRpb24gdG8gc3BlZWQgdXAgZXhlY3V0aW9u
Lg0KPj4+PiBUaHVzIHdlIHRhbGtlZCBhYm91dCBtYWtpbmcgaXQgdGhlIG5ldyBkZWZhdWx0
Lg0KPj4+Pg0KPj4+PiBUaGUgZmlyc3QgcGF0Y2ggaW50cm9kdWNlIGEgbmV3IHByb3BlcnR5
IChwYXV0aC1xYXJtYTUpIHRvIGFsbG93IHRvIHNlbGVjdA0KPj4+PiBjdXJyZW50IGRlZmF1
bHQgYWxnb3JpdGhtLg0KPj4+PiBUaGUgc2Vjb25kIG9uZSBjaGFuZ2UgdGhlIGRlZmF1bHQu
DQo+Pj4+DQo+Pj4+IFBpZXJyaWNrIEJvdXZpZXIgKDIpOg0KPj4+PiAgwqDCoMKgIHRhcmdl
dC9hcm06IGFkZCBuZXcgcHJvcGVydHkgdG8gc2VsZWN0IHBhdXRoLXFhcm1hNQ0KPj4+PiAg
wqDCoMKgIHRhcmdldC9hcm06IGNoYW5nZSBkZWZhdWx0IHBhdXRoIGFsZ29yaXRobSB0byBp
bXBkZWYNCj4+Pj4NCj4+Pj4gIMKgwqAgZG9jcy9zeXN0ZW0vYXJtL2NwdS1mZWF0dXJlcy5y
c3QgfMKgIDcgKysrKystLQ0KPj4+PiAgwqDCoCBkb2NzL3N5c3RlbS9pbnRyb2R1Y3Rpb24u
cnN0wqDCoMKgwqAgfMKgIDIgKy0NCj4+Pj4gIMKgwqAgdGFyZ2V0L2FybS9jcHUuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4+Pj4gIMKgwqAgdGFyZ2V0
L2FybS9hcm0tcW1wLWNtZHMuY8KgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+Pj4+ICDCoMKg
IHRhcmdldC9hcm0vY3B1NjQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzMCAr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4+Pj4gIMKgwqAgdGVzdHMvcXRlc3Qv
YXJtLWNwdS1mZWF0dXJlcy5jwqDCoCB8IDE1ICsrKysrKysrKysrLS0tLQ0KPj4+PiAgwqDC
oCA2IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0K
Pj4+Pg0KPj4+DQo+Pj4gSSB1bmRlcnN0YW5kIHRoZSBtb3RpdmF0aW9uLCBidXQgYXMtaXMg
dGhpcyB3aWxsIGJyZWFrIG1pZ3JhdGlvbi4NCj4+Pg0KPj4+IEkgdGhpbmsgdGhpcyB3aWxs
IG5lZWQgdG8gYmUgdmVyc2lvbmVkIHNvbWVob3csIGJ1dCB0aGUgb25seSB0aGluZyB0aGF0
IHJlYWxseSBnZXRzDQo+Pj4gdmVyc2lvbmVkIGFyZSB0aGUgYm9hcmRzLCBhbmQgSSdtIG5v
dCBzdXJlIGhvdyB0byBsaW5rIHRoYXQgdG8gdGhlIGluc3RhbnRpYXRlZCBjcHUuDQo+Pj4N
Cj4+DQo+PiAgIEZyb20gd2hhdCBJIHVuZGVyc3Rvb2QsIGFuZCBJIG1heSBiZSB3cm9uZywg
dGhlIHVzZSBjYXNlIHRvIG1pZ3JhdGUgKHRjZykgdm0gd2l0aCBjcHUgbWF4DQo+PiBiZXR3
ZWVuIFFFTVUgdmVyc2lvbnMgaXMgKm5vdCogc3VwcG9ydGVkLCBhcyB3ZSBjYW4ndCBndWFy
YW50ZWUgd2hpY2ggZmVhdHVyZXMgYXJlIHByZXNlbnQNCj4+IG9yIG5vdC4NCj4gVGhpcyBk
b2Vzbid0IGFmZmVjdCBvbmx5IC1jcHUgbWF4LCBidXQgYW55dGhpbmcgdXNpbmcgYWFyY2g2
NF9hZGRfcGF1dGhfcHJvcGVydGllcygpOg0KPiBuZW92ZXJzZS1uMSwgbmVvdmVyc2UtbjIs
IGNvcnRleC1hNzEwLg0KPiANCg0KSSB0aGluayB0aGlzIGlzIHN0aWxsIGEgY2hhbmdlIHdv
cnRoIHRvIGRvLCBiZWNhdXNlIHBlb3BsZSBjYW4gZ2V0IGEgDQoxMDAlIHNwZWVkdXAgd2l0
aCB0aGlzIHNpbXBsZSBjaGFuZ2UsIGFuZCBpdCdzIGEgYmV0dGVyIGRlZmF1bHQgdGhhbiB0
aGUgDQpwcmV2aW91cyB2YWx1ZS4NCkluIG1vcmUsIGluIGNhc2Ugb2YgdGhpcyBtaWdyYXRp
b24gc2NlbmFyaW8sIFFFTVUgd2lsbCBpbW1lZGlhdGVseSBhYm9ydCANCnVwb24gYWNjZXNz
aW5nIG1lbW9yeSB0aHJvdWdoIGEgcG9pbnRlci4NCg0KSSdtIG5vdCBzdXJlIGFib3V0IHdo
YXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIG1ha2UgdGhpcyBjaGFuZ2UgYXMgDQpzbW9v
dGggYXMgcG9zc2libGUgZm9yIFFFTVUgdXNlcnMuDQoNClBldGVyLCBBbGV4LCBkbyB5b3Ug
aGF2ZSBhbnkgc3VnZ2VzdGlvbiBvbiB0aGlzIHRvcGljPw0KDQpUaGFua3MsDQpQaWVycmlj
aw0KDQo+IA0KPiByfg0KDQo=
