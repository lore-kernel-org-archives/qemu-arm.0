Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1148061njk;
        Wed, 18 Dec 2024 10:54:08 -0800 (PST)
X-Received: by 2002:a17:903:2346:b0:216:1e9f:c5db with SMTP id d9443c01a7336-218d71fc5a8mr63228815ad.28.1734548047964;
        Wed, 18 Dec 2024 10:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734548047; cv=none;
        d=google.com; s=arc-20240605;
        b=g8Jz0NMKh77r0x9zvfbIdmsDShToWS1+Lk4m6NYEVOWx0qfZND8VPZsHK9e9t4BB6o
         iR0pczFgtDoQxBrX80lEUN9m/7/EKvSX6R1DcUKvYaacm/fu3B+isBmpG6W1ZDGnsPub
         ZbTMsd5HZIMLFCRK0T3NdrRf/J0DBN/eXgOb1MwKGjGK5V8R3bm3wPgo3sIxrl6eu87h
         j59aLRhm+lMVckghs9/cRjFWJm0LNP2alShPKtRDOTD+TO5g0dSUwhD9QQgDKzrDweD4
         4VH7Ba7lv1wkfDw9jda6HvwEmEMpN/GApPCMNVW2Iq9ur9A561Kdr4WL7enJzxdXUZc3
         LDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ixIuQpaXxoXzTAhnAPS9JNQkA15zsXaCoMl3cuCCmmU=;
        fh=3dqwmVuWzk9s4hJzNtsUWCIkLpBbdVG95QEBCRNoc3M=;
        b=OljC/ypfMEh0m5SSoMl5vc75P4gD/eaSkgfLjQgpWBpS7qcsh/Yt5ArCXWmIJaR6rq
         eHqREixxeDyAR74CeH3/NRJ0Rwqx95WPi51m9H79IWlBPavJYwiSExNHTC0sOwtBoC53
         i1m0n93eovZl8h+zUunXKdSTo/a6b3v2DB3SD5WNC30dx4h8no9xpaCgZ5S9+TpsIIkd
         dJZk7YRUTdhfJaZ0On4kcO5Ge2Uwd36PEjgPY1l6moH+WqOZvVAbTjG4GBD/HDnrj8VD
         K3zJWUOOTolTcHlHEGZ35lZSsiBLm7vqhdo/uMfd/XJMLtXpG4ZlpJjTE8l1TB1SNjFu
         7N4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePqQawzh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-218a1e374casor54741235ad.12.2024.12.18.10.54.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2024 10:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePqQawzh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734548047; x=1735152847; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixIuQpaXxoXzTAhnAPS9JNQkA15zsXaCoMl3cuCCmmU=;
        b=ePqQawzhuLkT94rgmV9kLvEva5wd07vK7VO07k9OqxMqkoesi4xUzxrHdbDaF4qofS
         /G8RBE6afeHZ7xSwDd51rXPlvtlaB0T3mUPHTKuSgXwlpQ0yVKTsHBZ0gZJN2z+DRX3a
         +TdSQApnxz8fwsdkASvHa/Cczcew/Nmg8/wvyqa7N4jXgJ+qeQqcEaBvaDrOuRNmGAC/
         V7mbIHALbWm7KZFmER50kxDI8apTXlyjrWris5b9lKLP56yBeogJQgQQEKTKc9e1OVU+
         Il1j3b9ga5zR94iiKtpyBUvVBbsAxSfMwJAwC2W8JlBQQEPe2l+MG7mrjQiQ9ae+o+y3
         ytrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734548047; x=1735152847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixIuQpaXxoXzTAhnAPS9JNQkA15zsXaCoMl3cuCCmmU=;
        b=ZTBOvTYEsHGkgmkg1VEVNIGcW0YPn3SWSeNQz3MFSMpB7LBxzSg/QkHrgjjRdcC3Fl
         rBM+1ETa41PaUjT92k1EgFqCTA+PoTGy1TM5tbcTNqotTyyFjTE0fIItCeqSi3zRBi3v
         Cw0aybYN8HsWDlACdUeLlTJX7Fmmn5Lrkz9qcNogPN5EYy6ZwgMt1Xxm5qgsXRKk8xkT
         s5ACf/Pi5xv0SZHNhuZ8iZwk0ecmY/PataJQ6JGaFU80zuLbQ+neY3ijyO3PmBWRmL5Z
         d9dxb4CvMpOxk+WXs8wqguuDQmI5H1rYJ2OKIaNcvUojKuQgY1Scn9ssUdWt0HFsetjW
         ASnQ==
X-Gm-Message-State: AOJu0YwRsPa8AYFiQpKao7o/NDWKWtzQ5XxeFaYAlD0hIR0YhCFr/uFt
	SXHq136D2u5Rlxv/n3+7sX2q9SZdAMpn/R++TOH5C5a4tOHJvnX2lkDiMH0Gj1KaYKOg82dfPkp
	1+dnLAw==
X-Gm-Gg: ASbGncsk+8ykS9XFaa8kzj+RDjOLwfYfQJNmklfgIgpfvLUpmdmEoWKDzdRSX3E5G2s
	pZSYze8PYe3A9oJLqroT0d1VSxvBPbf0XawbmTRdGR3sBxQ0ypUF+MVWDYnq4tMQ1OthNyGov8O
	s7UBhFwtZXdwMQZHO0jfQD7SpgRa0Z3UplusQPs2B3sSiqOy/RvSZ22WikFxr8WB34NMH+JQLfD
	ubnLv0bljMU5ivZrzDD2Cr7ueT4mb7xHjI5b1VPMkqJz/ZgoICTRdIJVcRjW5QjWvABEw==
X-Google-Smtp-Source: AGHT+IHYbHsjxiObOpOR2o+XcvtGqz3o3ISnCRn16bu1MPnlWfV16yYIQwDNzQzLV7T+C9Ajtq6DXw==
X-Received: by 2002:a17:902:e5d2:b0:215:577b:ab77 with SMTP id d9443c01a7336-218d7252841mr56094345ad.39.1734548047416;
        Wed, 18 Dec 2024 10:54:07 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5404csm79648545ad.150.2024.12.18.10.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 10:54:06 -0800 (PST)
Message-ID: <bd1f77f4-76b6-45f5-a709-1d2fc44932a0@linaro.org>
Date: Wed, 18 Dec 2024 10:54:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
 <7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
 <b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
 <6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
 <19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
 <87pllq69l6.fsf@draig.linaro.org>
 <CAFEAcA_xe5QEPsrByM8ems_rxt-KsVRAgkKhGk24X-1J0vcCDA@mail.gmail.com>
 <75ff92e0-7384-4af4-bc9f-64a6b0febc9f@linaro.org>
 <8734il5oiy.fsf@draig.linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <8734il5oiy.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Xg5UY8OLLbeM

T24gMTIvMTgvMjQgMDE6MjcsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gUGllcnJpY2sgQm91
dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+IA0KPj4gT24g
MTIvMTcvMjQgMDI6MzgsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+Pj4gT24gVHVlLCAxNyBE
ZWMgMjAyNCBhdCAwNzo0MCwgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
PiB3cm90ZToNCj4+Pj4NCj4+Pj4gUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmll
ckBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+Pj4+DQo+Pj4+PiBPbiAxMi8xNi8yNCAxMTo1MCwg
UmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+Pj4+Pj4gT24gMTIvMTYvMjQgMTM6MjYsIFBp
ZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4+Pj4+IE9uIDEyLzE2LzI0IDExOjEwLCBSaWNo
YXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+Pj4+Pj4+IE9uIDEyLzQvMjQgMTU6MTIsIFBpZXJy
aWNrIEJvdXZpZXIgd3JvdGU6DQo+Pj4+Pj4+Pj4gcWVtdS1zeXN0ZW0tYWFyY2g2NCBkZWZh
dWx0IHBvaW50ZXIgYXV0aGVudGljYXRpb24gKFFBUk1BNSkgaXMgZXhwZW5zaXZlLCB3ZQ0K
Pj4+Pj4+Pj4+IHNwZW50IHVwIHRvIDUwJSBvZiB0aGUgZW11bGF0aW9uIHRpbWUgcnVubmlu
ZyBpdCAod2hlbiB1c2luZyBUQ0cpLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gU3dpdGNoaW5n
IHRvIHBhdXRoLWltcGRlZj1vbiBpcyBvZnRlbiBnaXZlbiBhcyBhIHNvbHV0aW9uIHRvIHNw
ZWVkIHVwIGV4ZWN1dGlvbi4NCj4+Pj4+Pj4+PiBUaHVzIHdlIHRhbGtlZCBhYm91dCBtYWtp
bmcgaXQgdGhlIG5ldyBkZWZhdWx0Lg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gVGhlIGZpcnN0
IHBhdGNoIGludHJvZHVjZSBhIG5ldyBwcm9wZXJ0eSAocGF1dGgtcWFybWE1KSB0byBhbGxv
dyB0byBzZWxlY3QNCj4+Pj4+Pj4+PiBjdXJyZW50IGRlZmF1bHQgYWxnb3JpdGhtLg0KPj4+
Pj4+Pj4+IFRoZSBzZWNvbmQgb25lIGNoYW5nZSB0aGUgZGVmYXVsdC4NCj4+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4+IFBpZXJyaWNrIEJvdXZpZXIgKDIpOg0KPj4+Pj4+Pj4+ICAgICAgICB0YXJn
ZXQvYXJtOiBhZGQgbmV3IHByb3BlcnR5IHRvIHNlbGVjdCBwYXV0aC1xYXJtYTUNCj4+Pj4+
Pj4+PiAgICAgICAgdGFyZ2V0L2FybTogY2hhbmdlIGRlZmF1bHQgcGF1dGggYWxnb3JpdGht
IHRvIGltcGRlZg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gICAgICAgZG9jcy9zeXN0ZW0vYXJt
L2NwdS1mZWF0dXJlcy5yc3QgfCAgNyArKysrKy0tDQo+Pj4+Pj4+Pj4gICAgICAgZG9jcy9z
eXN0ZW0vaW50cm9kdWN0aW9uLnJzdCAgICAgfCAgMiArLQ0KPj4+Pj4+Pj4+ICAgICAgIHRh
cmdldC9hcm0vY3B1LmggICAgICAgICAgICAgICAgIHwgIDEgKw0KPj4+Pj4+Pj4+ICAgICAg
IHRhcmdldC9hcm0vYXJtLXFtcC1jbWRzLmMgICAgICAgIHwgIDIgKy0NCj4+Pj4+Pj4+PiAg
ICAgICB0YXJnZXQvYXJtL2NwdTY0LmMgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLQ0KPj4+Pj4+Pj4+ICAgICAgIHRlc3RzL3F0ZXN0L2FybS1j
cHUtZmVhdHVyZXMuYyAgIHwgMTUgKysrKysrKysrKystLS0tDQo+Pj4+Pj4+Pj4gICAgICAg
NiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEkgdW5kZXJzdGFuZCB0aGUgbW90aXZhdGlv
biwgYnV0IGFzLWlzIHRoaXMgd2lsbCBicmVhayBtaWdyYXRpb24uDQo+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4gSSB0aGluayB0aGlzIHdpbGwgbmVlZCB0byBiZSB2ZXJzaW9uZWQgc29tZWhvdywg
YnV0IHRoZSBvbmx5IHRoaW5nIHRoYXQgcmVhbGx5IGdldHMNCj4+Pj4+Pj4+IHZlcnNpb25l
ZCBhcmUgdGhlIGJvYXJkcywgYW5kIEknbSBub3Qgc3VyZSBob3cgdG8gbGluayB0aGF0IHRv
IHRoZSBpbnN0YW50aWF0ZWQgY3B1Lg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAg
IEZyb20gd2hhdCBJIHVuZGVyc3Rvb2QsIGFuZCBJIG1heSBiZSB3cm9uZywgdGhlIHVzZSBj
YXNlIHRvIG1pZ3JhdGUgKHRjZykgdm0gd2l0aCBjcHUgbWF4DQo+Pj4+Pj4+IGJldHdlZW4g
UUVNVSB2ZXJzaW9ucyBpcyAqbm90KiBzdXBwb3J0ZWQsIGFzIHdlIGNhbid0IGd1YXJhbnRl
ZSB3aGljaCBmZWF0dXJlcyBhcmUgcHJlc2VudA0KPj4+Pj4+PiBvciBub3QuDQo+Pj4+Pj4g
VGhpcyBkb2Vzbid0IGFmZmVjdCBvbmx5IC1jcHUgbWF4LCBidXQgYW55dGhpbmcgdXNpbmcg
YWFyY2g2NF9hZGRfcGF1dGhfcHJvcGVydGllcygpOg0KPj4+Pj4+IG5lb3ZlcnNlLW4xLCBu
ZW92ZXJzZS1uMiwgY29ydGV4LWE3MTAuDQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiBJIHRoaW5r
IHRoaXMgaXMgc3RpbGwgYSBjaGFuZ2Ugd29ydGggdG8gZG8sIGJlY2F1c2UgcGVvcGxlIGNh
biBnZXQgYQ0KPj4+Pj4gMTAwJSBzcGVlZHVwIHdpdGggdGhpcyBzaW1wbGUgY2hhbmdlLCBh
bmQgaXQncyBhIGJldHRlciBkZWZhdWx0IHRoYW4NCj4+Pj4+IHRoZSBwcmV2aW91cyB2YWx1
ZS4NCj4+Pj4+IEluIG1vcmUsIGluIGNhc2Ugb2YgdGhpcyBtaWdyYXRpb24gc2NlbmFyaW8s
IFFFTVUgd2lsbCBpbW1lZGlhdGVseQ0KPj4+Pj4gYWJvcnQgdXBvbiBhY2Nlc3NpbmcgbWVt
b3J5IHRocm91Z2ggYSBwb2ludGVyLg0KPj4+Pj4NCj4+Pj4+IEknbSBub3Qgc3VyZSBhYm91
dCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0byBtYWtlIHRoaXMgY2hhbmdlIGFzDQo+
Pj4+PiBzbW9vdGggYXMgcG9zc2libGUgZm9yIFFFTVUgdXNlcnMuDQo+Pj4+DQo+Pj4+IFN1
cmVseSB3ZSBjYW4gb25seSBob25vdXIgYW5kIGFwcGx5IHRoZSBuZXcgZGVmYXVsdCB0byAt
Y3B1IG1heD8NCj4+Pg0KPj4NCj4+IFdpdGggYWxsIG15IHJlc3BlY3QsIEkgdGhpbmsgdGhl
IGN1cnJlbnQgZGVmYXVsdCBpcyB3cm9uZywgYW5kIGl0DQo+PiB3b3VsZCBiZSBzYWQgdG8g
a2VlcCBpdCB3aGVuIHBlb3BsZSBkb24ndCBwcmVjaXNlIGNwdSBtYXgsIG9yIGZvcg0KPj4g
b3RoZXIgY3B1cyBlbmFibGluZyBwb2ludGVyIGF1dGhlbnRpY2F0aW9uLg0KPiANCj4gVGhl
cmUgaXMgYSBkaWZmZXJlbmNlIGJldHdlZW4gbWF4IGFuZCBvdGhlciBDUFVzLiBGb3IgbWF4
IGFzIGhhcyBhbHJlYWR5DQo+IGJlZW4gc3RhdGVkIG1pZ3JhdGlvbiBpcyBsaWtlbHkgdG8g
YnJlYWsgYW55d2F5IGJldHdlZW4gUUVNVSB2ZXJzaW9ucyAtDQo+IHdlIHNob3VsZCBhbHNv
IG1ha2UgdGhhdCBjbGVhciBpbiB0aGUgZG9jcy4gQnV0IGZvciB0aGUgb3RoZXIgQ1BVcyB3
ZQ0KPiBuZWVkIHRvIGhvbm91ciB0aGUgZXhpc3RpbmcgZGVmYXVsdHMuDQo+IA0KDQpJJ2xs
IGFkZCB0aGlzIGluIHRoZSBkb2MgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4NCg0KPj4gSW4g
YWxsIG91ciBjb252ZXJzYXRpb25zLCB0aGVyZSBzZWVtcyB0byBiZSBhIGZvY3VzIG9uIGNo
b29zaW5nIHRoZQ0KPj4gImZhc3Rlc3QiIGVtdWxhdGlvbiBzb2x1dGlvbiB0aGF0IHNhdGlz
ZmllcyB0aGUgZ3Vlc3QgKGJlaGF2aW91cg0KPj4gd2lzZSkuIEFuZCwgZm9yIGEgcmVhc29u
IEkgaWdub3JlLCBwb2ludGVyIGF1dGhlbnRpY2F0aW9uIGVzY2FwZWQgdGhpcw0KPj4gcnVs
ZS4NCj4+DQo+PiBJIHVuZGVyc3RhbmQgdGhlIGNvbmNlcm4gcmVnYXJkaW5nIHJldHJvIGNv
bXBhdGliaWxpdHksIGJ1dCBpdCB3b3VsZA0KPj4gYmUgYmV0dGVyIHRvIGFzayBwb2xpdGVs
eSAod2l0aCBhbiBlcnJvciBtZXNzYWdlKSB0byBwZW9wbGUgdG8gcmVzdGFydA0KPj4gdGhl
aXIgdmlydHVhbCBtYWNoaW5lcyB3aGVuIHRoZXkgdHJ5IHRvIG1pZ3JhdGUsIGluc3RlYWQg
b2YgYmVpbmcNCj4+IHN0dWNrIHdpdGggYSBzbG93IGRlZmF1bHQgZm9yZXZlci4NCj4gDQo+
IFRoaXMgaXMgd2h5IHdlIGhhdmUgY29tcGF0aWJpbGl0eSBsb2dpYyBzbyBpdHMgZWFzeSB0
byBkbyB0aGUgcmlnaHQNCj4gdGhpbmcgYnkgc3BlY2lmeWluZyB0aGUgUUVNVSB2ZXJzaW9u
IGluIHRoZSBtYWNoaW5lIHR5cGUuDQo+IA0KPj4gSW4gbW9yZSwgd2UgYXJlIHRhbGtpbmcg
b2YgYSB0Y2cgc2NlbmFyaW8sIGZvciB3aGljaCBJJ20gbm90IHN1cmUNCj4+IHBlb3BsZSB1
c2UgbWlncmF0aW9uIGZlYXR1cmUgKHNhdmUvcmVzdG9yZSkgaGVhdmlseSwgYnV0IEkgbWF5
IGJlDQo+PiB3cm9uZyBvbiB0aGlzLg0KPiANCj4gV2UgY2FuJ3QgYXNzdW1lIGl0cyBub3Qu
IFdlIGV2ZW4gaGF2ZSBleHBsaWNpdCB0ZXN0cyB0aGF0IGNoZWNrDQo+IG1pZ3JhdGlvbiBk
b2Vzbid0IGJyZWFrIGJldHdlZW4gbWFzdGVyIGFuZCAkUFJFVlNUQUJMRS4NCj4gDQo+PiBC
ZXR3ZWVuIHRoZSByaXNrIG9mIGJyZWFraW5nIG1pZ3JhdGlvbiAod2l0aCBhIHBvbGl0ZSBl
cnJvciBtZXNzYWdlKSwNCj4+IGFuZCBoYXZpbmcgYSBkZWZhdWx0IHRoYXQgaXMgMTAwJSBm
YXN0ZXIsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyDQo+PiB0byBmYXZvciB0aGUgc2Vj
b25kIG9uZS4gSWYgaXQgd291bGQgYmUgYSA1JSBzcGVlZHVwLCBJIHdvdWxkIG5vdA0KPj4g
YXJndWUsIGJ1dCBzbG93aW5nIGRvd24gZXhlY3V0aW9uIHdpdGggYSBmYWN0b3Igb2YgMiBp
cyByZWFsbHkgYSBsb3QuDQo+Pg0KPj4+IFRoYXQgd2FzIHdoYXQgSSB0aG91Z2h0IHdlIHdl
cmUgYWltaW5nIGZvciwgeWVzLiBXZSAqY291bGQqIGhhdmUNCj4+PiBhIHByb3BlcnR5IG9u
IHRoZSBDUFUgdG8gc2F5ICJ1c2UgdGhlIG9sZCBiYWNrLWNvbXBhdGlibGUgZGVmYXVsdCwN
Cj4+PiBub3QgdGhlIG5ldyBvbmUiLCB3aGljaCB3ZSB0aGVuIGxpc3QgaW4gdGhlIGFwcHJv
cHJpYXRlIGh3X2NvbXBhdA0KPj4+IGFycmF5LiAoR3JlcCBmb3IgdGhlICJiYWNrY29tcGF0
LWNudGZycSIgcHJvcGVydHkgZm9yIGFuIGV4YW1wbGUgb2YNCj4+PiB0aGlzLikgQnV0IEkn
bSBub3Qgc3VyZSBpZiB0aGF0IGlzIHdvcnRoIHRoZSBlZmZvcnQgY29tcGFyZWQgdG8NCj4+
PiBqdXN0IGNoYW5naW5nICdtYXgnLg0KPj4NCj4+IFdoZW4gd2UnbGwgZGVmaW5lIGh3X2Nv
bXBhdF8xMF8wLCBhbmQgaHdfY29tcGF0XzExXzAsIGRvIHdlIGhhdmUgdG8NCj4+IGNhcnJ5
IHRoaXMgb24gZm9yZXZlcj8gKFNhbWUgcXVlc3Rpb24gZm9yICJiYWNrY29tcGF0LWNudGZy
cSIpLg0KPj4NCj4+PiAoSXQncyBub3QgdGhhdCBtdWNoIGV4dHJhIGNvZGUgdG8gYWRkIHRo
ZSBwcm9wZXJ0eSwgc28gSSBjb3VsZA0KPj4+IGVhc2lseSBiZSBwZXJzdWFkZWQgdGhlIG90
aGVyIHdheS4gUG9zc2libGUgYXJndW1lbnRzIGluY2x1ZGUNCj4+PiBwcmVmZXJyaW5nIGNv
bnNpc3RlbmN5IGFjcm9zcyBhbGwgQ1BVcy4gSWYgd2UgYWxyZWFkeSBtYWtlIHRoZQ0KPj4+
IGRlZmF1bHQgYmUgbm90ICJ3aGF0IHRoZSByZWFsIENQVSBvZiB0aGlzIHR5cGUgdXNlcyIg
dGhlbiB0aGF0J3MNCj4+PiBhbHNvIGFuIGFyZ3VtZW50IHRoYXQgd2UgY2FuIHNldCBpdCB0
byB3aGF0ZXZlciBpcyBjb252ZW5pZW50Ow0KPj4+IGlmIHdlIGRvIGhvbm91ciB0aGUgQ1BV
IElEIHJlZ2lzdGVyIHZhbHVlcyBmb3IgdGhlIGltcGxlbWVudGF0aW9uDQo+Pj4gZGVmYXVs
dCB0aGVuIHRoYXQncyBhbiBhcmd1bWVudCB0aGF0IHdlIHNob3VsZCBjb250aW51ZSB0byBk
bw0KPj4+IHNvIGFuZCBub3QgY2hhbmdlIHRoZSBkZWZhdWx0IHRvIG91ciBpbXBkZWYgb25l
LikNCj4+Pg0KPj4NCj4+IEZvciB0aGUgVENHIHVzZSBjYXNlLCBpcyB0aGVyZSBhbnkgdmlz
aWJsZSBzaWRlIGVmZmVjdCBmb3IgdGhlIGd1ZXN0DQo+PiB0byB1c2UgYW55IHNwZWNpZmlj
IHBvaW50ZXIgYXV0aGVudGljYXRpb24gYWxnb3JpdGhtPw0KPj4gSW4gb3RoZXIgd29yZHMs
IGlzIHRoZXJlIGEgc2NlbmFyaW8gd2hlcmUgcG9pbnRlciBhdXRoZW50aWNhdGlvbiB3b3Vs
ZA0KPj4gd29yayB3aXRoIGltcGRlZiwgYnV0IG5vdCB3aXRoIHFhcm1hezMsNX0/DQo+PiBJ
ZiBubywgSSBkb24ndCBzZWUgYW55IHJlYXNvbiBmb3IgYSBjcHUgdG8gZmF2b3IgYW4gZXhw
ZW5zaXZlDQo+PiBlbXVsYXRpb24uDQo+IA0KPiBJZiB0aGUgdXNlciBhc2tzIGZvciBhIHNw
ZWNpZmljIENQVSBtb2RlbCAobm90IGEgc3BlY2lhbCBjYXNlIGxpa2UgbWF4KQ0KPiB3ZSBz
aG91bGQgcHJvdmlkZSB0aGUgbW9zdCBhY2N1cmF0ZSBtb2RlbCB0aGF0IHdlIGNhbiBhcyBl
eHBsaWNpdGx5IHNldA0KPiBieSB0aGUgdXNlci4gV2UgZG9uJ3QgdHJhZGUgYWNjdXJhY3kg
Zm9yIHNwZWVkIChjLmYuIGRpc2N1c3Npb25zIGFib3V0DQo+IGZsb2F0aW5nIHBvaW50IGFu
ZCBJTkVYQUNUIGRldGVjdGlvbikuDQo+IA0KPj4gSW4gdGhlIGFjY2VsZXJhdG9yIGNhc2Us
IHdlIHJlYWQgdGhlIHZhbHVlcyBmcm9tIHRoZSBob3N0IGNwdSwgc28NCj4+IHRoZXJlIGlz
IG5vIHByb2JsZW0uDQo+Pg0KPj4+IC0tIFBNTQ0KPiANCg0K
