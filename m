Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1168984njk;
        Wed, 18 Dec 2024 11:24:59 -0800 (PST)
X-Received: by 2002:a17:902:f648:b0:216:48dd:d15c with SMTP id d9443c01a7336-218d7229e58mr52055495ad.27.1734549899234;
        Wed, 18 Dec 2024 11:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734549899; cv=none;
        d=google.com; s=arc-20240605;
        b=MNl2xtI9Go3g0fRga03may35v1kX8rYxyZSMD+6ZJQHawTxwaNMmxyVbdKCghZou95
         00Kah9C0A1sVhpjr/IQkQj0uyNNHJppzklD8m97otmUu5NDNUlVLOHPC7NL46c9qcYzb
         aBKSdPTlxuSOuRC+HhS/n8/qQD5CffRmLpjupvuKNVwGfSVtyT4vus4HzmFEdMkRwnJe
         nqGaeWfjhREzOmfUkUP2b0maVZeRSyalTGAWaewBp7JypQ4a5jnGj4kadTDmvjiLluSn
         mDlOmkg39oM8Z1y0J4s7KMf9IJG9yuw/ndFG2jDkxW2I3niMauPVFnVGfykHj8EWuRJe
         SE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JfUscx0jbEjPXvLFeN/Jykxlq3K75yKfPSrrMS76CQw=;
        fh=74jXV+jotPqkJjWxoy8uwgQ84yoVfn7mCq38RUmKX+U=;
        b=KkR3qpRVXf1VLx9j2FJQb7tyNzDWrV0VbrB7Ff/qrqKFua6hdu+sSJXbHO0kP9+8Zd
         BiyGC6cBNiHxtYLwN8IpiJjzSj258EiTLZc1NiKLOExREfF7pcjDKaBn93Bba0wyh7ek
         qFc28tIQtJfBIdUUGAvPlSDRl/npJTYqMYaim6gginNYVI4pGNmD8PUBxpfD4gWge5WN
         kc9yBxbOy2nsWfSzwarmKNV3I4A90yiCpEhTgLch2NBe+NiaggGwJMyLOA0ng/nZPAXu
         ws5YJy+fbVYnRWsBtQsu29bLlbHvsNcd08T3y6JynhmkbXS4mqrbk0jQK9ozGggPN6Vs
         d+ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hf+UvuSV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-218a1e72844sor76291745ad.18.2024.12.18.11.24.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2024 11:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hf+UvuSV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734549899; x=1735154699; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfUscx0jbEjPXvLFeN/Jykxlq3K75yKfPSrrMS76CQw=;
        b=Hf+UvuSVAlCBHC7y+rQUz9gnahydvw/unxZYTeXy6LL4mf0y+Tq8WvHwo0IF7z1Nl8
         nFaM9vKf8H1KsjBgHmUA2vIDJUajzlgBpALnDkoqf/6v4IgJWbBkxj8i42VlURQQXbip
         n1Lr0xnKKSYUhdFW05CEGK3BZqcdd/Hn58qA014sJnd3SJd+yqY3+S71eNvR5/LMx1/U
         6hzLsfaDMdbo3LBz0984zt6c3hO2WSkqNosAqDQfb2MI96bO+KEbqyJgPziJTp2PnDeM
         nGMZDkCVfH2dqatQkvwThxZKy+5KCbqg+Z+vRhOK+sw+RdHymZP8/1A3N1IlEeJ66Jb6
         eWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734549899; x=1735154699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfUscx0jbEjPXvLFeN/Jykxlq3K75yKfPSrrMS76CQw=;
        b=vPtWifksSFirbbFuIcLfVctsebqKTReDq46bNCiqAlvn0tVuvDO5vBgFtRNhl3eKq2
         pzAvo1Zqr7q01L01Qia7zlLbwgQZVDAE4ylfP0IxkaTR/1qcoryZhTA35d913mQ3kg3R
         tUoji267yXyMlNzl6myUO4QNp9S8FUbMlwp2jyi91NEDnj0x/LzOeOAfAPKAsoZxR7Sx
         YrPgKICdjLcpTbUOQbTkHJJDAlAJlLN9A7DWBhhbEMU+/cHMYuCuMkUNUHcFvuaa4Mxb
         mZGW2eYXmlzr0KbP8E+Fy3fftSbA6dcCJo9j3zbqtk5IEkCvXigITlVrl4gIZ7Lxr1ws
         LrJw==
X-Gm-Message-State: AOJu0YxL12iQUpjVbzdYYUYEJqgxqfyFDdCCNrzb/+YheS2iOckqPCzM
	pNq113mZXK9RjKFC3W3Zevg/Oww1RUlvUaAHcQfJJv4rXIWQ2bh+z5ODIpYaS8qHFQ==
X-Gm-Gg: ASbGncvaY0EYGhehsJsULM9HwxHnrjVOoxiw92Ctj1BjdXwAp+4qFyJ6bRdsT5E69+q
	gWBV+t1pENWRk2EsGvvjqmZyEzaDL71gMUT/p03KsNYVy3X9BF1HuJWk9E5v1iBn5/mJGMqL7n9
	2BtUbdEhxhgVWsHnh6uHsSZaO3oSZFSQK5Au529fe0/4FAGjKyonju4PKbJt41IaKJUHHwxHyPO
	wExFj8w7BMxKTnmSdtF/bKHpG4nRLrQjUua3rB9HtqXGqdTkq7AbK5gnJN5u0T+TVahQQ==
X-Google-Smtp-Source: AGHT+IFapxYW2N/XWO5iA9/GwEjqm25mur3b3FIfIUFRVMvvXKUDEypEZbbf0ziLoxqOCwpp5U4Uxw==
X-Received: by 2002:a17:903:944:b0:217:803a:e47a with SMTP id d9443c01a7336-218d6fcd456mr68609975ad.4.1734549898714;
        Wed, 18 Dec 2024 11:24:58 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb35esm80013535ad.62.2024.12.18.11.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 11:24:58 -0800 (PST)
Message-ID: <1c5c58c6-a5aa-47bf-8098-c31bad65633b@linaro.org>
Date: Wed, 18 Dec 2024 11:24:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
 <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
 <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
 <19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
 <87pllq69l6.fsf@draig.linaro.org>
 <CAFEAcA_xe5QEPsrByM8ems_rxt-KsVRAgkKhGk24X-1J0vcCDA@mail.gmail.com>
 <75ff92e0-7384-4af4-bc9f-64a6b0febc9f@linaro.org>
 <CAFEAcA8YNcft8KU8mytHv+H71L7L8d=QBgQmSAmq9J7Ny23=tA@mail.gmail.com>
 <48dd3afc-d78d-4bd9-9392-873d5a8ac26a@linaro.org>
 <f2bdc8f2-5735-400c-b15f-06289b467826@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f2bdc8f2-5735-400c-b15f-06289b467826@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: rui7kezmOdkD

T24gMTIvMTgvMjQgMTE6MjAsIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPiBPbiAxMi8x
OC8yNCAxMzowOCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+IE9uIDEyLzE4LzI0IDA1
OjUxLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0KPj4+IE9uIFR1ZSwgMTcgRGVjIDIwMjQgYXQg
MjE6MDgsIFBpZXJyaWNrIEJvdXZpZXINCj4+PiA8cGllcnJpY2suYm91dmllckBsaW5hcm8u
b3JnPiB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMTIvMTcvMjQgMDI6MzgsIFBldGVyIE1heWRl
bGwgd3JvdGU6DQo+Pj4+PiBPbiBUdWUsIDE3IERlYyAyMDI0IGF0IDA3OjQwLCBBbGV4IEJl
bm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4g
UGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPiB3cml0ZXM6
DQo+Pj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBzdGlsbCBhIGNoYW5nZSB3b3J0aCB0byBkbywg
YmVjYXVzZSBwZW9wbGUgY2FuIGdldCBhDQo+Pj4+Pj4+IDEwMCUgc3BlZWR1cCB3aXRoIHRo
aXMgc2ltcGxlIGNoYW5nZSwgYW5kIGl0J3MgYSBiZXR0ZXIgZGVmYXVsdCB0aGFuDQo+Pj4+
Pj4+IHRoZSBwcmV2aW91cyB2YWx1ZS4NCj4+Pj4+Pj4gSW4gbW9yZSwgaW4gY2FzZSBvZiB0
aGlzIG1pZ3JhdGlvbiBzY2VuYXJpbywgUUVNVSB3aWxsIGltbWVkaWF0ZWx5DQo+Pj4+Pj4+
IGFib3J0IHVwb24gYWNjZXNzaW5nIG1lbW9yeSB0aHJvdWdoIGEgcG9pbnRlci4NCj4+Pj4+
Pj4NCj4+Pj4+Pj4gSSdtIG5vdCBzdXJlIGFib3V0IHdoYXQgd291bGQgYmUgdGhlIGJlc3Qg
d2F5IHRvIG1ha2UgdGhpcyBjaGFuZ2UgYXMNCj4+Pj4+Pj4gc21vb3RoIGFzIHBvc3NpYmxl
IGZvciBRRU1VIHVzZXJzLg0KPj4+Pj4+DQo+Pj4+Pj4gU3VyZWx5IHdlIGNhbiBvbmx5IGhv
bm91ciBhbmQgYXBwbHkgdGhlIG5ldyBkZWZhdWx0IHRvIC1jcHUgbWF4Pw0KPj4+Pj4NCj4+
Pj4NCj4+Pj4gV2l0aCBhbGwgbXkgcmVzcGVjdCwgSSB0aGluayB0aGUgY3VycmVudCBkZWZh
dWx0IGlzIHdyb25nLCBhbmQgaXQgd291bGQNCj4+Pj4gYmUgc2FkIHRvIGtlZXAgaXQgd2hl
biBwZW9wbGUgZG9uJ3QgcHJlY2lzZSBjcHUgbWF4LCBvciBmb3Igb3RoZXIgY3B1cw0KPj4+
PiBlbmFibGluZyBwb2ludGVyIGF1dGhlbnRpY2F0aW9uLg0KPj4+Pg0KPj4+PiBJbiBhbGwg
b3VyIGNvbnZlcnNhdGlvbnMsIHRoZXJlIHNlZW1zIHRvIGJlIGEgZm9jdXMgb24gY2hvb3Np
bmcgdGhlDQo+Pj4+ICJmYXN0ZXN0IiBlbXVsYXRpb24gc29sdXRpb24gdGhhdCBzYXRpc2Zp
ZXMgdGhlIGd1ZXN0IChiZWhhdmlvdXIgd2lzZSkuDQo+Pj4+IEFuZCwgZm9yIGEgcmVhc29u
IEkgaWdub3JlLCBwb2ludGVyIGF1dGhlbnRpY2F0aW9uIGVzY2FwZWQgdGhpcyBydWxlLg0K
Pj4+DQo+Pj4gSSB0aGluayB0aGUgcmVhc29uIGlzIGp1c3QgdGhhdCB3ZSBkaWRuJ3QgdW5k
ZXJzdGFuZCBob3cgbXVjaA0KPj4+IG9mIGEgcGVyZm9ybWFuY2UgaGl0IHRoZSBhcmNoaXRl
Y3RlZCBhbGdvcml0aG0gZm9yIHBvaW50ZXIgYXV0aA0KPj4+IGlzIGluIGVtdWxhdGlvbi4g
U28gd2UgdG9vayBvdXIgZGVmYXVsdCBhcHByb2FjaCBvZiAiaW1wbGVtZW50DQo+Pj4gd2hh
dCB0aGUgYXJjaGl0ZWN0dXJlIHNheXMiLiBUaGVuIGxhdGVyIHdoZW4gd2UgcmVhbGlzZWQg
aG93DQo+Pj4gYmFkIHRoZSBlZmZlY3Qgd2FzIHdlIGFkZGVkIGluIGEgZmFzdGVyIGltcGRl
ZiBhdXRoZW50aWNhdGlvbg0KPj4+IGFsZ29yaXRobSwgYnV0IHdlIHB1dCBpdCBpbiBhcyBu
b3QtdGhlLWRlZmF1bHQgYmVjYXVzZSBvZiBvdXINCj4+PiB1c3VhbCBiaWFzIHRvd2FyZHMg
ImRvbid0IGNoYW5nZSBleGlzdGluZyBiZWhhdmlvdXIiLg0KPj4+DQo+Pg0KPj4gSSB1bmRl
cnN0YW5kIHRoZSByZWFzb24gYmVoaW5kIHRoZSBjdXJyZW50IGNob2ljZS4NCj4+IEZvciBt
eSBwZXJzb25hbCBrbm93bGVkZ2UsIGlzIHRoZXJlIGEgUUVNVSBwb2xpY3kgZm9yICJicmVh
a2luZyBjaGFuZ2VzIj8NCj4+DQo+Pj4+IEkgdW5kZXJzdGFuZCB0aGUgY29uY2VybiByZWdh
cmRpbmcgcmV0cm8gY29tcGF0aWJpbGl0eSwgYnV0IGl0IHdvdWxkIGJlDQo+Pj4+IGJldHRl
ciB0byBhc2sgcG9saXRlbHkgKHdpdGggYW4gZXJyb3IgbWVzc2FnZSkgdG8gcGVvcGxlIHRv
IHJlc3RhcnQNCj4+Pj4gdGhlaXIgdmlydHVhbCBtYWNoaW5lcyB3aGVuIHRoZXkgdHJ5IHRv
IG1pZ3JhdGUsIGluc3RlYWQgb2YgYmVpbmcgc3R1Y2sNCj4+Pj4gd2l0aCBhIHNsb3cgZGVm
YXVsdCBmb3JldmVyLg0KPj4+PiBJbiBtb3JlLCB3ZSBhcmUgdGFsa2luZyBvZiBhIHRjZyBz
Y2VuYXJpbywgZm9yIHdoaWNoIEknbSBub3Qgc3VyZSBwZW9wbGUNCj4+Pj4gdXNlIG1pZ3Jh
dGlvbiBmZWF0dXJlIChzYXZlL3Jlc3RvcmUpIGhlYXZpbHksIGJ1dCBJIG1heSBiZSB3cm9u
ZyBvbiB0aGlzLg0KPj4+Pg0KPj4+PiBCZXR3ZWVuIHRoZSByaXNrIG9mIGJyZWFraW5nIG1p
Z3JhdGlvbiAod2l0aCBhIHBvbGl0ZSBlcnJvciBtZXNzYWdlKSwNCj4+Pj4gYW5kIGhhdmlu
ZyBhIGRlZmF1bHQgdGhhdCBpcyAxMDAlIGZhc3RlciwgSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8NCj4+Pj4gZmF2b3IgdGhlIHNlY29uZCBvbmUuIElmIGl0IHdvdWxkIGJlIGEg
NSUgc3BlZWR1cCwgSSB3b3VsZCBub3QgYXJndWUsDQo+Pj4+IGJ1dCBzbG93aW5nIGRvd24g
ZXhlY3V0aW9uIHdpdGggYSBmYWN0b3Igb2YgMiBpcyByZWFsbHkgYSBsb3QuDQo+Pj4NCj4+
PiBUaGUgcG9pbnQgaGVyZSBhYm91dCAiYnJlYWtpbmcgbWlncmF0aW9uIiBpcyB0aGF0IHdl
IGhhdmUgYSBzdHJvbmcNCj4+PiBzZXQgb2YgcnVsZXM6DQo+Pj4gIMKgICogaWYgeW91IHNh
eSAiLW1hY2hpbmUgdmlydC04LjIiIHlvdSBnZXQgImV4YWN0bHkgdGhlIGJlaGF2aW91cg0K
Pj4+ICDCoMKgwqAgdGhhdCB0aGUgJ3ZpcnQnIG1hY2hpbmUgdHlwZSBoYWQgaW4gUUVNVSA4
LjIsIGFuZCBpdCBpcw0KPj4+ICDCoMKgwqAgbWlncmF0aW9uIGNvbXBhdGlibGUNCj4+PiAg
wqAgKiB3ZSBjYW4gbWFrZSBjaGFuZ2VzIHRoYXQgYXJlIG5vdCBtaWdyYXRpb24gY29tcGF0
aWJsZSBvbmx5IGlmIHdlDQo+Pj4gIMKgwqDCoCBlbnN1cmUgdGhhdCB0aGV5IGFyZSBub3Qg
YXBwbGllZCB0byBvbGRlciB2ZXJzaW9uZWQgbWFjaGluZSB0eXBlcw0KPj4+ICDCoMKgwqAg
KG9yIGlmIHRoZXkncmUgdG8gZGV2aWNlcyB0aGF0IGFyZSBvbmx5IHVzZWQgaW4gbWFjaGlu
ZXMgd2hpY2gNCj4+PiAgwqDCoMKgIGRvIG5vdCBoYXZlIHZlcnNpb25lZCBtYWNoaW5lIHR5
cGVzIGF0IGFsbCkNCj4+PiAgwqAgKiBUQ0cgJy1jcHUgbWF4JyBpcyBhIHNwZWNpYWwgY2Fz
ZTogaXQgaXMgbm90IGEgZml4ZWQgdGhpbmcsIGFuZCBzbw0KPj4+ICDCoMKgwqAgaXQgbWF5
IGFjcXVpcmUgbmV3IG5vbi1taWdyYXRpb24tY29tcGF0aWJsZSBjaGFuZ2VzIGJldHdlZW4g
dmVyc2lvbnMNCj4+PiAgwqDCoMKgIChhbmQgc28gaWYgeW91IGNhcmUgYWJvdXQgVk0gbWln
cmF0aW9uIGNvbXBhdCB5b3UgZG9uJ3QgdXNlIGl0KTsNCj4+PiAgwqDCoMKgIGJ1dCB0aGlz
IGlzIG5vdCB0cnVlIG9mIHRoZSBuYW1lZCBDUFUgdHlwZXMgdGhhdCBtYXRjaCByZWFsDQo+
Pj4gIMKgwqDCoCBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbnMNCj4+Pg0KPj4+IFRoaXMgcGF0
Y2ggYXMgaXQgc3RhbmRzIHdpbGwgbm90IHByZXNlcnZlIHRoZSBtaWdyYXRpb24NCj4+PiBn
dWFyYW50ZWVzIHRoYXQgd2UgbWFrZS4gU28gd2UgbmVlZCB0byBmaXggaXQgYnkgZWl0aGVy
Og0KPj4+ICDCoCAqIG9ubHkgbWFraW5nIHRoZSBkZWZhdWx0IGNoYW5nZSBvbiAtY3B1IG1h
eA0KPj4+ICDCoCAqIG1ha2luZyB0aGUgZGVmYXVsdCBjaGFuZ2UgYmUgYm91bmQgdG8gdmVy
c2lvbmVkIHR5cGVzDQo+Pj4NCj4+DQo+PiBJJ20gbm90IHN1cmUgdG8gZm9sbG93IHlvdSBv
biB0aGlzIHNlY29uZCBhcHByb2FjaC4gVGhlIGNwdSBpcyBub3QgdmVyc2lvbmVkLCBhbmQg
aWYNCj4+IHNvbWVvbmUgdXNlIC1tYWNoaW5lIHZpcnQgKG5vbiB2ZXJzaW9uZWQpLCBpcyB0
aGVyZSBhIGd1YXJhbnRlZSBpdCBzaG91bGQgc3RheSBwb3NzaWJsZSB0bw0KPj4gbWlncmF0
ZT8NCj4+DQo+PiBJbiBvdGhlciB3b3JkcywgY2FuIHdlIGJyZWFrIHRoZSBtaWdyYXRpb24g
d2l0aCAiLW1hY2hpbmUgdmlydCAtY3B1IG1vZGVsIj8NCj4gDQo+IFllcywgYmVjYXVzZSAi
dmlydCIgaXMgYW4gYWxpYXMgZm9yICJ2aXJ0LTxjdXJyZW50PiIuDQo+IEZvbGtzIHdobyBy
ZWx5IG9uIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5IG11c3QgdXNlICJ2aXJ0LTkuMiIgZXRj
Lg0KPg0KDQpUaGFua3MsIEkgZGlkbid0IHJlYWxpemUgdGhpcywgYW5kIGl0IG1ha2VzIHNl
bnNlIG5vdy4NClRoZW4sIEknbGwgY2hhbmdlIHRoZSBiZWhhdmlvdXIgZm9yIGFsbCBjcHVz
IHVzaW5nIHRoZSBzYW1lIHBhdHRlcm4gYXMgDQpjbnRmcmVxLg0KDQo+IFRodXMgaGF2aW5n
IGEgZ2xvYmFsIHByb3BlcnR5IHNldCBieSB2ZXJzaW9uIDkuMiBjb21wYXQgd2hpY2ggc2F5
cyAidXNlIHFhcm1hNSBhcyBkZWZhdWx0DQo+IHBhYyIgd2lsbCB3b3JrLiAgSXQncyBhIGxp
dHRsZSBiYWNrd2FyZCBoYXZpbmcgdGhlIHZlcnNpb24gb24gdGhlIGJvYXJkLCBub3QgdGhl
IGNwdSwgYnV0DQo+IHdlJ3ZlIGRvbmUgaXQgYmVmb3JlLCBhcyBQZXRlciBtZW50aW9uZWQg
cmUgY3B1IGNsb2NrIHRpbWUgYmFzZS4NCj4NCg0KV2UgY2FuIHNlZSBpdCBhcyAidGhlIHBs
YXRmb3JtIGNvbmZpZ3VyZWQgc29tZSBkZXZpY2VzIHNwZWNpZmljYWxseSIsIA0KYW5kIGl0
J3MgYW4gYWNjZXB0YWJsZSBhbmQgbXVjaCBzaW1wbGVyIHNvbHV0aW9uIHRoYW4gaGF2aW5n
IHZlcnNpb25lZCANCmNwdSBmb3IgdGhpcyB1c2UgY2FzZS4NCg0KPiANCj4gcn4NCg0K
