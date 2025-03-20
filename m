Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1214717njc;
        Thu, 20 Mar 2025 13:16:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-73905a63bd5mr1254245b3a.20.1742501810639;
        Thu, 20 Mar 2025 13:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742501810; cv=none;
        d=google.com; s=arc-20240605;
        b=UlgE8J5qJcnnzN2beg6778NC3nKLBWL4l26h+yLYtIrHC42MAg5w6PV+jB2KPml1jS
         4C30PXqjHZ1bAJw0a/z/hjheNW6hPAZGYyPYOvq0AO4rfBbPN7DdF4WL0G7tTyC6Bk69
         iwKY9OHNS97uEm6Nj15XfuVETGeBV25ihE6GIKyqDxBr5B1JAu6g2ZoGS6GC+5GXX+ea
         F8Ua8K1U5JFhlVEwF/hAY17HXWmIflDMoL9ZG/E1eDgz9mo8+zrWKREx7+sFWuzKkP3T
         kNb/5Fiqeqme63YKR53852VEOsFhRnQYojB0/tmI/6xYYTmFFkKQDRR2MTmQKA+8zyFS
         Ldtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ztqrQSVxttMzOhz+XxSD7fJmmQFkQ9AG5S8dAxDfpyU=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=jO213o93bw3G0yPMa2VDaal5wg6BRuetKlqXadF633v9aRQlNsbk+G3VoDHldV9DkY
         9tiWwZ9ZGAiToNZrGGzMP1OK+Zs98pzhDXr6rgPDAlvUi4pojZP2Bh58p59qE/f1iqjN
         QEQkZV7Jy0mBB2dUpGYGQPhiS4+uwPQ6gJE8PUTMsBS6rm7/gN0uHOeoc608IcVhRukS
         dGeTwoidrwcgVWWLUeOhu1i12aqdTc5q2luWm5OvL2cHqqFjLqTWLBOlAPDSqplhV55G
         xcqcMAnkpeRe9bDas3tQtPNN+Z/7UHs9uhI7QzkaHmlefexZ5wG7nJHU/9jbh5lk5Ctp
         k/iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myfDgzSo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739060285bfsor218219b3a.5.2025.03.20.13.16.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 13:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=myfDgzSo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742501810; x=1743106610; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztqrQSVxttMzOhz+XxSD7fJmmQFkQ9AG5S8dAxDfpyU=;
        b=myfDgzSoujfttLNACcT/U8lA6TrK92SEdJqaKb6lvaJ8OmJ0Y+ui7pQm2/zkE0wo+t
         0CU4KSZnAclKr22JOJ9MehCYReNBvWoixs/quXx4agHmgVKWDac5CDigvjS0oJPtrzuE
         xWjy+6fqsNXRpOoTrpPimULy48QTS6Ydl7+0usq/crK0MQEkmBxF3yG3aYGLxDP6/DII
         aulWhZl4/ZDJxK1/ttbOTHuXm+K6IxW1sbJqSwkp+skhlULYS+8X5mtdRIWpNnYJGnIZ
         AFfU61gqTmHvKAvY0MHa/zio/8YKdWXc05FBm+eMR7ZT1QV8KH/GExO2o0Cy/Fx8Mrk0
         YO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742501810; x=1743106610;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztqrQSVxttMzOhz+XxSD7fJmmQFkQ9AG5S8dAxDfpyU=;
        b=j/C1X29E9yNrtUDyUWWUIXnxf6tF1lmly09bFGmglpXQJ3nfn/610L3MvS4ssLpeO7
         gztHKreAUOP1mNZsIGIRtQ0TB+YoGYNCO208pd7QJbAHsjulyR9X1kqYxykX/NPL8POz
         rOep3hs6MbgJohghEBmvNwQjNrvEAJ88WMl1MAZdvg5zqcxBAJYDt9jHRk9DILCKCnL8
         PGI0ymdp1GJ/V8CcYzJUDWxNhjhqD2N3kcrIQr9T3o6tFzj5ZXwyujZz38nPCvj+ajxP
         di3FGCIp84hwHaVHuyvR/nBGzeB5qNu0baAFc31nGEg5YrZkrx65FenuTAz8BIsMpmp+
         bTtQ==
X-Gm-Message-State: AOJu0YwXPIaUyfPxyYOIFjMwnxlt9PLQJmIw8Mv4dRadnTWXsOB2TA//
	SbNKBXdv1+wTE+2wms99THBxTd6CucbxWpAj/H8vcKqcgG31gfUlL8fhwqMsrmZjTdcaLRZtTew
	U4Hc=
X-Gm-Gg: ASbGncvV/G5iFF1/puxoZvviwqzgy4pCki5L8NptgY8RUnV+FE+qksJF4+grRx9uiaU
	bV01jgiswsJcHcHqyd2Zp7wPAcmLE3qKgVaaGcYRvRx0o2hRcpb9pzLq9KGjx9RQaoDojBO9c+V
	vldZKRjWlydIBrxKuDdB9zGl/BPBtL0HCHhZwU8mLGW6CEws0VFwsI10FQ9ugrnFyTkccX35E3m
	oJc4SqO5xYTvK3QvL0YXXxXbIUz+hIgIr5y1eH+zzZpgpuASAg/m5+T2DQpa3aA9bwaoasrIUd7
	rdBm66JlrZSJOsxdfeAkjk7YfbVLvXbOZwFZlX7Uxus/L96kf7kXYsBnVjUOT8nzh/Mm
X-Google-Smtp-Source: AGHT+IFES38x6iH+cV5rc1c12rPZNCzJ+9KazpLQF+Z75dxcDEQWw0ZF4FsGeJNbr0xzzfX8n+NDow==
X-Received: by 2002:a05:6a00:1812:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7390598df4emr1155932b3a.4.1742501809874;
        Thu, 20 Mar 2025 13:16:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611cae4sm240043b3a.101.2025.03.20.13.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 13:16:49 -0700 (PDT)
Message-ID: <7444c007-d8f1-4c55-ab4a-15becdf1c932@linaro.org>
Date: Thu, 20 Mar 2025 13:16:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
 <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
In-Reply-To: <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: L5jkejNWNeWe

T24gMy8yMC8yNSAxMjo1MiwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gT24gMy8xOS8y
NSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPj4gVGhlIGFpbSBvZiB0aGlzIHdvcmsg
aXMgdG8gZ2V0IHJpZCBvZiB0aGUgZW5kaWFuIGF3YXJlIGhlbHBlcnMgaW4NCj4+IGdkYnN0
dWIvaGVscGVycy5oIHdoaWNoIGR1ZSB0byB0aGVpciB1c2Ugb2YgdHN3YXAoKSBtZWFuIHRh
cmdldA0KPj4gZ2Ric3R1YnMgbmVlZCB0byBiZSBidWlsdCBtdWx0aXBsZSB0aW1lcy4gV2hp
bGUgdGhpcyBzZXJpZXMgZG9lc24ndA0KPj4gYWN0dWFsbHkgYnVpbGQgZWFjaCBzdHViIG9u
Y2UgaXQgaW50cm9kdWNlcyBhIG5ldyBoZWxwZXIgLQ0KPj4gZ2RiX2dldF9yZWdpc3Rlcl92
YWx1ZSgpIHdoaWNoIHRha2VzIGEgTWVtT3Agd2hpY2ggY2FuIGRlc2NyaWJlIHRoZQ0KPj4g
Y3VycmVudCBlbmRpYW4gc3RhdGUgb2YgdGhlIHN5c3RlbS4gVGhpcyB3aWxsIGJlIGEgbG90
IGVhc2llciB0bw0KPj4gZHluYW1pY2FsbHkgZmVlZCBmcm9tIGEgaGVscGVyIGZ1bmN0aW9u
Lg0KPj4NCj4+IFRoZSBtb3N0IGNvbXBsZXggZXhhbXBsZSBpcyBQUEMgd2hpY2ggaGFzIGEg
aGVscGVyIGNhbGxlZA0KPj4gcHBjX21heWJlX2Jzd2FwX3JlZ2lzdGVyKCkgd2hpY2ggd2Fz
IGRvaW5nIHRoaXMuDQo+Pg0KPj4gVGhpcyBpcyBzdGlsbCBhbiBSRkMgc28gSSdtIGludGVy
ZXN0ZWQgaW4gZmVlZGJhY2s6DQo+Pg0KPj4gICAgIC0gaXMgdGhlIEFQSSBzYW5lDQo+PiAg
ICAgLSBjYW4gd2UgYXZvaWQgbG90cyBvZiAodWludDhfdCAqKSBjYXN0aW5nPw0KPiANCj4g
RXZlbiB0aG91Z2ggdGhlIHNlcmllcyBoYXMgYSBnb29kIGludGVudCwgdGhlIGZhY3Qgd2Ug
bWFrZSBldmVyeXRoaW5nDQo+ICJnZW5lcmljIiBtYWtlcyB0aGF0IHdlIGxvc2UgYWxsIGd1
YXJhbnRlZXMgd2UgY291bGQgZ2V0IGJ5IHJlbHlpbmcgb24NCj4gc3RhdGljIHR5cGluZywg
YW5kIHRoYXQgd2UgaGFkIHBvc3NpYmlsaXR5IG9mIG1pc3Rha2VzIHdoZW4gcGFzc2luZyBz
aXplDQo+ICh3aGljaCBoYXBwZW5lZCBpbiBwYXRjaCA0IGlmIEknbSBjb3JyZWN0KS4gQW5k
IGV4cGxpY2l0IGNhc3RpbmcgY29tZXMNCj4gYXMgYSAqc3Ryb25nKiB3YXJuaW5nIGFib3V0
IHRoYXQuDQo+IA0KPiBCeSBwYXRjaCA3LCBJIHdhcyByZWFsbHkgZmVlbGluZyBpdCdzIG5v
dCBhIHdpbiB2cyBleHBsaWNpdCBmdW5jdGlvbnMNCj4gcGVyIHNpemUuDQo+IA0KPiBJZiB0
aGUgZ29hbCBvZiB0aGUgc2VyaWVzIGlzIHRvIGdldCByaWQgb2YgZW5kaWFuIGF3YXJlIGhl
bHBlcnMsIHdlbGwsDQo+IHRoaXMgY2FuIGJlIGZpeGVkIGluIHRoZSBoZWxwZXJzIHRoZW1z
ZWx2ZXMsIHdpdGhvdXQgbmVlZGluZyB0bw0KPiBpbnRyb2R1Y2UgYSAiZ2VuZXJpYyIgc2l6
ZSBoZWxwZXIuIE1heWJlIHdlIGFyZSB0cnlpbmcgdG8gc29sdmUgdHdvDQo+IGRpZmZlcmVu
dCBwcm9ibGVtcyBoZXJlPw0KPiANCj4+ICAgICAtIHNob3VsZCB3ZSBoYXZlIGEgcmV2ZXJz
ZSBoZWxwZXIgZm9yIHNldHRpbmcgcmVnaXN0ZXJzDQo+Pg0KPj4gSWYgdGhpcyBzZWVtcyBs
aWtlIHRoZSByaWdodCBhcHByb2FjaCBJIGNhbiBoYXZlIGEgZ28gYXQgbW9yZSBvZiB0aGUN
Cj4+IGZyb250ZW5kcyBsYXRlci4NCj4+DQoNCkxvb2tpbmcgYXQgaW5jbHVkZS9nZGJzdHVi
L2hlbHBlcnMuaCwgZ2RiX2dldF9yZWcxMjggY2FuIGJlIHNvbHZlZCBieSANCnVzaW5nIHRh
cmdldF93b3Jkc19iaWdlbmRpYW4oKSBpbnN0ZWFkIG9mIFRBUkdFVF9CSUdfRU5ESUFOLCB3
aGljaCBpcyANCmFscmVhZHkgd2hhdCB0c3dhcCBwcmltaXRpdmVzIGFyZSBkb2luZy4NCg0K
Rm9yIGdkYl9nZXRfcmVnbCwgSSB3b3VsZCBnZXQgcmlkIG9mIGl0IGNvbXBsZXRlbHksIGJ5
IGVkaXRpbmcgYWxsIA0KdGFyZ2V0cyBnZGJzdHViLmMsIGFuZCByZXBsYWNpbmcgd2l0aCBn
ZGJfZ2V0X3JlZzMyIG9yIGdkYl9nZXRfcmVnNjQgDQpleHBsaWNpdCBjYWxscy4NCnBwYyBp
cyBhIHZlcnkgbmF1Z2h0eSBib3ksIGJlY2F1c2UgcmVnaXN0ZXJzIGFyZSBkZWZpbmVkIGFz
IA0KdGFyZ2V0X3Vsb25nLCB3aGlsZSBvdGhlciBhcmNoIHVzZSBmaXhlZCB0eXBlcy4gVGhl
IHNvbHV0aW9uIG1pZ2h0IGJlIGFzIA0Kc2ltcGxlIGFzIGNoYW5naW5nIHBwYyByZWdpc3Rl
cnMgZGVmaW5pdGlvbiB0byB1aW50NjRfdC4NCklmIGl0J3MgdG9vIGNvbXBsaWNhdGVkLCB5
b3UgY2FuIHBvc3Rwb25lIHRoZSBwcm9ibGVtIGJ5IGxlYXZpbmcgDQpnZGJfZ2V0X3JlZ2wg
ZGVmaW5lZCBvbmx5IGluIHBwYyBnZGJzdHViLCBhbmQgY2xlYW4gdXAgYWxsIG90aGVyIGFy
Y2guDQpUaGFua3MgdG8gc3RhdGljIHR5cGluZywgaXQgd2lsbCBiZSBlYXN5IHRvIHNwb3Qg
YSB3cm9uZyBnZGJfZ2V0X3JlZ2wgDQpjb252ZXJzaW9uLCBzbyBpdCdzIGEgbm8tcmlzayBv
cGVyYXRvbi4NCg0KRm9yIGxkdHVsX3AsIGxkdHVsX2xlX3AsIGFuZCBsZHR1bF9iZV9wLCBp
dCdzIGEgc2ltaWxhciBnYW1lLiBJdCdzIA0KaGFyZGVyIGJlY2F1c2Ugb25seSByZXR1cm4g
dHlwZSB3aWxsIGRpZmZlciwgYW5kIHlvdSBtaWdodCBtaXNzIG9jY3VyZW5jZXMuDQpBIHNh
ZmUgd2F5IGNvdWxkIGJlIHRvIHJlcGxhY2UgbGR0dWxfcCBieSBjYWxsIHRvIGEgZnVuY3Rp
b24gdGFraW5nIA0KcmV0dXJuIHZhbHVlIHRocm91Z2ggcG9pbnRlciBpbiBwYXJhbWV0ZXIu
IFRoaXMgd2F5LCB5b3UgY2FuIHJlcGxhY2UgDQplYXNpbHkgd2l0aCBsIGFuZCBxIHZhcmlh
bnRzLCB3aXRob3V0IGFueSByaXNrIG9mZiBpbXBsaWNpdCBjb252ZXJzaW9uLg0KQW5kIGZv
ciB0aGUgb25lIGxlZnQgZGVwZW5kaW5nIG9uIHRhcmdldF91bG9uZy90YXJnZXRfbG9uZywg
bGVhdmUgdGhhdCANCmZvciBub3csIGFuZCBtb3ZlIGxkdHVsKl9wIHRvIGEgdGFyZ2V0LWhl
bHBlci5oIGluY2x1ZGVkIG9ubHkgZm9yIGFyY2hzIA0KbmVlZGluZyB0aGlzLg0KDQo+PiBU
aGVyZSBhcmUgYSBmZXcgb3RoZXIgbWlzYyBjbGVhbi11cHMgSSBkaWQgb24gdGhlIHdheSB3
aGljaCBtaWdodCBiZQ0KPj4gd29ydGggY2hlcnJ5IHBpY2tpbmcgZm9yIDEwLjAgYnV0IEkn
bGwgbGVhdmUgdGhhdCB1cCB0byBtYWludGFpbmVycy4NCj4+DQo+PiBBbGV4Lg0KPj4NCj4+
IEFsZXggQmVubsOpZSAoMTApOg0KPj4gICAgIGluY2x1ZGUvZ2Ric3R1YjogZml4IGluY2x1
ZGUgZ3VhcmQgaW4gY29tbWFuZHMuaA0KPj4gICAgIGdkYnN0dWI6IGludHJvZHVjZSB0YXJn
ZXQgaW5kZXBlbmRlbnQgZ2RiIHJlZ2lzdGVyIGhlbHBlcg0KPj4gICAgIHRhcmdldC9hcm06
IGNvbnZlcnQgMzIgYml0IGdkYnN0dWIgdG8gbmV3IGhlbHBlcg0KPj4gICAgIHRhcmdldC9h
cm06IGNvbnZlcnQgNjQgYml0IGdkYnN0dWIgdG8gbmV3IGhlbHBlcg0KPj4gICAgIHRhcmdl
dC9wcGM6IGV4cGFuZCBjb21tZW50IG9uIEZQL1ZNWC9WU1ggYWNjZXNzIGZ1bmN0aW9ucw0K
Pj4gICAgIHRhcmdldC9wcGM6IG1ha2UgcHBjX21heWJlX2Jzd2FwX3JlZ2lzdGVyIHN0YXRp
Yw0KPj4gICAgIHRhcmdldC9wcGM6IGNvbnZlcnQgZ2Ric3R1YiB0byBuZXcgaGVscGVyICgh
aGFja3kpDQo+PiAgICAgZ2Ric3R1YjogYXNzZXJ0IGVhcmxpZXIgaW4gaGFuZGxlX3JlYWRf
YWxsX3JlZ3MNCj4+ICAgICBpbmNsdWRlL2V4ZWM6IGZpeCBhc3NlcnQgaW4gc2l6ZV9tZW1v
cA0KPj4gICAgIHRhcmdldC9taWNyb2JsYXplOiBjb252ZXJ0IGdkYnN0dWIgdG8gbmV3IGhl
bHBlcg0KPj4NCj4+ICAgIGluY2x1ZGUvZXhlYy9tZW1vcC5oICAgICAgICB8ICAgNCArLQ0K
Pj4gICAgaW5jbHVkZS9nZGJzdHViL2NvbW1hbmRzLmggIHwgICAyICstDQo+PiAgICBpbmNs
dWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmggfCAgMzAgKysrKysrDQo+PiAgICB0YXJnZXQvcHBj
L2NwdS5oICAgICAgICAgICAgfCAgIDggKy0NCj4+ICAgIGdkYnN0dWIvZ2Ric3R1Yi5jICAg
ICAgICAgICB8ICAyNCArKysrLQ0KPj4gICAgdGFyZ2V0L2FybS9nZGJzdHViLmMgICAgICAg
IHwgIDU3ICsrKysrKystLS0tDQo+PiAgICB0YXJnZXQvYXJtL2dkYnN0dWI2NC5jICAgICAg
fCAgNTMgKysrKysrLS0tLQ0KPj4gICAgdGFyZ2V0L21pY3JvYmxhemUvZ2Ric3R1Yi5jIHwg
IDQ0ICsrKystLS0tDQo+PiAgICB0YXJnZXQvcHBjL2dkYnN0dWIuYyAgICAgICAgfCAxOTQg
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+PiAgICA5IGZpbGVzIGNo
YW5nZWQsIDI1NyBpbnNlcnRpb25zKCspLCAxNTkgZGVsZXRpb25zKC0pDQo+PiAgICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9nZGJzdHViL3JlZ2lzdGVycy5oDQo+Pg0KPiANCg0K
