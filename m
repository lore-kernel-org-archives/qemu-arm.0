Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3758369njc;
        Tue, 19 Nov 2024 22:29:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeUo0fveT+fqlQTXtHXkmI8TihtXhMvuLxiRi5ani6ovzH8uPrFd00cz18Wrag20/WyD6ql35MEZBriA==@linaro.org
X-Received: by 2002:a05:6830:1cd:b0:717:fbfe:52d4 with SMTP id 46e09a7af769-71ab3177cc1mr1513004a34.8.1732084178956;
        Tue, 19 Nov 2024 22:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732084178; cv=none;
        d=google.com; s=arc-20240605;
        b=ISw3ieRNlwcpEYi1uhmOxqs8WTpMF2fQexYpptv8RuV06ohcmknpyRJ2DCOXv0F0x9
         ZvBLqelN2ryvs3h9TAsrJzZHo0QTba3cvWCuzqXIrnhbDcyqOrWKwFO5oCuW+RT1fKur
         +3uONsdoKXk4uiU5PyYmgxtWihYYPDctRUl3+1b/7p5e/EqYfRXLnzCy9zE4ASIrxLnJ
         rxVZ6tnTv5Lz0ArNoA8Jnu5pqrkXaVGyJxq/khqx8aqmdBYvidxPiLkykBbLaQf9Gwpx
         HKeOOge3WH88KDJGrLtmLC9P3cm0/juIoSLXkMDz4Jru2lhEy6A4mzC70mgC5c+Ji9J4
         Xxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1GVP68nyuDefceK1RhYkPlb+WdyURxuIQytWQmEjrCM=;
        fh=VuDFjVCj3o+s27PZvq19nutbCLECnN8AC0vjrL/mKJo=;
        b=bcSq5kzVwiJN8TLaWMdj+gjA/rv+EMZ48fttlucYTVlx2xUeevwbSilgeGfuVLxqQ7
         btqEHOfuqpDZk8D5jMFJNfP2hGU5MROi/zZ32sg2Bf/FDpfQoirgnyd97Ld+3T2t4eYk
         USQjW2chqOM1P0KHD+KrnuO1q/AAOrKSJZBHDEb3NRTjCmH3FH2siWKa08T5TVV7IPi+
         B66VUe+3rMFL3gSQY5ZEvXvElfBTCxZUkVrdU2uLTUsG9KgTfhlUJa3Yo8YCiMDZAeQ5
         gBlcVB7fPyZNCfxNGPaV5w832AvFVJ6P2j7jjYPfwQUYEBRNEtpLK+zckxblBEcnVcYU
         wpHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQyob3mM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7f8b3a16d42sor9753828a12.6.2024.11.19.22.29.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Nov 2024 22:29:38 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQyob3mM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732084178; x=1732688978; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GVP68nyuDefceK1RhYkPlb+WdyURxuIQytWQmEjrCM=;
        b=WQyob3mMwNxcRZ86djN523iCV7BwPPdrybpBuAAA+mmZ3uNUTHP3AQYqcU/Dr+Nsao
         ZKXsMV13b0/BIXjRLAGNlFCQ5K1huAJgt14uoB10jhTI3JOCE2h5vr5HaYt+oljgeqkk
         X6gx4Mgs/km4odcC5n92L6f1v/xEovsZbc0SXsWZKvjHoLDtDgtuKZfo68joIR4UPrur
         4rzSrbhBFcIbWulzYBJCKcoN36fB9JS6OX543D1cHyIbgUfTipkDaSQUn5zvJW382I7q
         +bH9vUszjjIgKP5fMVlibhEdihKe1vKNGuEuTfYBjnLmRffm7u3ErOZV4yJg7PiNEXhF
         ekSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732084178; x=1732688978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1GVP68nyuDefceK1RhYkPlb+WdyURxuIQytWQmEjrCM=;
        b=bO5tfRVTCIRzr4v56FSGrX+1F+OFDtlgWlX8o921jlTMnMMczsDSDuFL6xOiiZsHHd
         QfwgeBqPqHVzzYbzkMM7gOUuJQabxOhkp7YBgpEALq+R86T1MJiEPbwDnAn5vFAoOxPl
         YeMOKg5BOHYSrb0Ui6CrhBfyYjKdcoCbBee20HFxEtofrCMbN0xvngyii2ldIOcKL4g0
         L2sfnTUX7mlZ7FCqF4lADqr5pOF6VtNoC+NkyepKQEsi5Ij1nGxpWSX+m6srKCDznJUJ
         eYVa0+tk+Jn37f6KmBSOvGjU/JxIBZgRUq7yGmoJcNZp2lpLW1dGrjCNRXpPGNcTg+Xa
         RXmA==
X-Forwarded-Encrypted: i=1; AJvYcCXoY2tNJ1GNS62BFUWmzrBreOrAa6yUCRrgQ6gx/ZZGQ+mWnmAgceDN+PKx/dLyGwzG0ZlMq3VnC3612Q==@linaro.org
X-Gm-Message-State: AOJu0YwLqR9gVGKZKdx6a3U/r0dIc9STdwd8uexfmpxcfxZlFnyp0fmC
	yCyuJfTzlWMa396PiJvdBAKv8iAjS3QhWtD4EsjKRjcXeyz0Dt/yg1NiXBcYNdJszw==
X-Gm-Gg: ASbGncun9lsndoCu/UcZF8s47zT61u6Auqppdae1rxM/l6CxlX2htEblcGcEaGrKKsb
	34wOXd0IhPG88HuiqHKbJwY4b3wRPAwOTEpONZQGQUHmQpZtdxxpqHktuX3FZEW9YP3SjYZeMP+
	0FMPJltuf4tsyG34/GhROW2BRp4DWFHA1kGIj7RP5WuUvrUp7LfTPSxbT+M+o4cKI6627v17QXB
	DsPeii+dlcGpF1K2tv1lPOe5cyq7StUNQAsAxar5YiMZyi1aJaOWQ01EPBwvKOcvlQYNoRgm6JC
	2lvmSijpNdC/XucgjvG/2w==
X-Google-Smtp-Source: AGHT+IEAMNsZFkOAyKDLzrDIreDMiakfpwTGWdiMlDAQI8UDHnUqB4k1v7z9IktdgmZ+aCAAUPKDEw==
X-Received: by 2002:a05:6a20:3953:b0:1d9:3b81:cdd3 with SMTP id adf61e73a8af0-1ddae1fa439mr2641549637.1.1732084178482;
        Tue, 19 Nov 2024 22:29:38 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef8da27sm790332b3a.91.2024.11.19.22.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 22:29:38 -0800 (PST)
Message-ID: <2e1ad112-6bf6-460d-96b0-8f87f1b44fb6@linaro.org>
Date: Tue, 19 Nov 2024 22:29:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/devel: add git-publish for patch submitting
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
 <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
 <ZzxWeG-UKT0odfL8@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ZzxWeG-UKT0odfL8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: K+zrimo3diI7

T24gMTEvMTkvMjQgMDE6MTIsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6DQo+IE9uIFR1
ZSwgTm92IDE5LCAyMDI0IGF0IDA5OjQxOjQwQU0gKzAxMDAsIE1hcmNpbiBKdXN6a2lld2lj
eiB3cm90ZToNCj4+IFcgZG5pdSAxOC4xMS4yMDI0IG/CoDE4OjIzLCBQaWVycmljayBCb3V2
aWVyIHBpc3plOg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJy
aWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+PiAgICBkb2NzL2RldmVsL3N1
Ym1pdHRpbmctYS1wYXRjaC5yc3QgfCAxNCArKysrKysrKysrKysrKw0KPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZG9j
cy9kZXZlbC9zdWJtaXR0aW5nLWEtcGF0Y2gucnN0IGIvZG9jcy9kZXZlbC9zdWJtaXR0aW5n
LWEtcGF0Y2gucnN0DQo+Pj4gaW5kZXggMzQ5YzMyZWUzYTkuLjk1MzY4MmYyMGNiIDEwMDY0
NA0KPj4+IC0tLSBhL2RvY3MvZGV2ZWwvc3VibWl0dGluZy1hLXBhdGNoLnJzdA0KPj4+ICsr
KyBiL2RvY3MvZGV2ZWwvc3VibWl0dGluZy1hLXBhdGNoLnJzdA0KPj4+IEBAIC0yMzcsNiAr
MjM3LDIwIEBAIGF0dGFjaG1lbnRzIGNhbiBiZSB1c2VkIGFzIGEgbGFzdCByZXNvcnQgb24g
YSBmaXJzdC10aW1lIHN1Ym1pc3Npb24uDQo+Pj4gICAgLi4gX2lmX3lvdV9jYW5ub3Rfc2Vu
ZF9wYXRjaF9lbWFpbHM6DQo+Pj4gK1VzZSBnaXQtcHVibGlzaA0KPj4+ICt+fn5+fn5+fn5+
fn5+fn4NCj4+PiArDQo+Pj4gK0lmIHlvdSBhbHJlYWR5IGNvbmZpZ3VyZWQgZ2l0IHNlbmQt
ZW1haWwsIHlvdSBjYW4gc2ltcGx5IHVzZSBgZ2l0LXB1Ymxpc2gNCj4+PiArPGh0dHBzOi8v
Z2l0aHViLmNvbS9zdGVmYW5oYS9naXQtcHVibGlzaD5gX18gdG8gc2VuZCBzZXJpZXMuDQo+
Pj4gKw0KPj4+ICs6Og0KPj4+ICsNCj4+PiArICAgICQgZ2l0IGNoZWNrb3V0IG1hc3RlciAt
YiBteS1mZWF0dXJlDQo+Pj4gKyAgICAkICMgd29yayBvbiBuZXcgY29tbWl0cywgYWRkIHlv
dXIgJ1NpZ25lZC1vZmYtYnknIGxpbmVzIHRvIGVhY2gNCj4+PiArICAgICQgZ2l0IHB1Ymxp
c2gNCj4+PiArICAgICQgLi4uIG1vcmUgd29yaywgcmViYXNlIG9uIG1hc3RlciwgLi4uDQo+
Pj4gKyAgICAkIGdpdCBwdWJsaXNoICMgd2lsbCBzZW5kIGEgdjINCj4+DQo+PiBZb3UgcmVj
b21tZW5kICdiNCBzaGF6YW0nIGluIDMvNyBwYXRjaCBzbyB3aHkgbm90IGhlcmU/IEJvdGgg
J2I0JyBhbmQNCj4+ICdnaXQtcHVibGlzaCcgc2VlbSB0byBkbyBzYW1lIHN0dWZmIC0gaGFu
ZGxlIHBhdGNoIHNlcmllcyBhbmQgc2VuZCB0aGVtDQo+PiB1cHN0cmVhbS4NCj4gDQo+IGdp
dC1wdWJsaXNoIGlzIHdoYXQgd2UgYWxyZWFkeSByZWNvbW1lbmRlZCB0byBwZW9wbGUgYm90
aCBlbHNld2hlcmUgaW4NCj4gdGhpcyBmaWxlLCBhbmQgbW9yZSBwcm9taW5lbnRseSBpbiB0
aGUgUkVBRE1FLnJzdCBmaWxlLCBzbyBtYWludGFpbmluZw0KPiB0aGF0IHByYWN0aWNlIGlz
IGNvcnJlY3QuDQo+IA0KDQpBdCB0aGUgdGltZSBJIHN0YXJ0ZWQgd29ya2luZyBvbiBRRU1V
LCBJIG1pc3NlZCB0aGF0IGluZm9ybWF0aW9uLCANCmJlY2F1c2UgSSBmb2N1c2VkIG9uIHRo
ZSBtYW51YWwgKG1pc3NpbmcgdGhlIGNvbnRlbnQgb2YgdGhlIFJFQURNRSksIHNvIA0KdGhh
dCdzIHdoeSBJIGFkZCBpdCBoZXJlIGFzIHdlbGwuDQoNCj4+IGI0IGFsbG93cyB0byBrZWVw
IFRvL0NjIGVtYWlscyBpbnNpZGUgb2YgY292ZXIgbGV0dGVyIHdoaWNoIG1ha2VzIGl0IGVh
c3kgdG8NCj4+IG5vdCBtaXNzIGFueW9uZSBuZWVkZWQuDQo+IA0KPiBnaXQtcHVibGlzaCBh
dXRvbWF0aWNhbGx5IENDJ3MgcGVvcGxlIGJ5IGNvcnJlbGF0aW5nIHRoZSBmaWxlcyB0b3Vj
aGVkIGluDQo+IHRoZSBjb21taXRzIGFnYWluc3Qgb3VyIE1BSU5UQUlORVJTIGZpbGUsIHNv
IGl0ICJkb2VzIHRoZSByaWdodCB0aGluZyINCj4gaW4gdGhlIG1ham9yaXR5IG9mIGNhc2Vz
LiBXZSByZWNvbW1lbmQgaXQgYmVjYXVzZSBpdCBtYWtlcyBpdCBtdWNoIGhhcmRlcg0KPiBm
b3Igbm92aWNlIHVzZXJzIHRvIG1lc3MgdXAgcGF0Y2ggc2VyaWVzIHN1Ym1pc3Npb24uDQo+
DQoNCkkgYWdyZWUgd2l0aCB0aGF0LiBGcm9tIG15IHBlcnNvbmFsIGV4cGVyaWVuY2UsIHRo
ZSBoYXJkZXN0IHBhcnQgd2hlbiANCm9uYm9hcmRpbmcgd2l0aCBlbWFpbCB3b3JrZmxvdyBp
cyBtb3JlIHRvIHVuZGVyc3RhbmQgaXQgKHdoaWNoIHN0ZXBzIHlvdSANCmdvIHRocm91Z2gg
dW50aWwgdGhlIGNvbnRyaWJ1dGlvbiBpcyBhY2NlcHRlZCksIG1vcmUgdGhhbiBsZWFybmlu
ZyBhIA0Kc3BlY2lmaWMgdG9vbCBpbiBwYXJ0aWN1bGFyLg0KU28gaGF2aW5nIGEgInNpbXBs
ZSIgdG9vbCBsaWtlIGdpdC1wdWJsaXNoIGlzIGdvb2QuDQoNCj4gV2l0aCByZWdhcmRzLA0K
PiBEYW5pZWwNCg0K
