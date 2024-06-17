Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp411639ejb;
        Mon, 17 Jun 2024 12:12:02 -0700 (PDT)
X-Received: by 2002:aa7:85d5:0:b0:704:32f6:8986 with SMTP id d2e1a72fcca58-705d711e964mr9776231b3a.17.1718651522522;
        Mon, 17 Jun 2024 12:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718651522; cv=none;
        d=google.com; s=arc-20160816;
        b=0cy+9G/MeXTRwUmMag6Ef/Lqt4cgODP3NsqBiYcaYlgGPDvIIH3Gn+dt7nVpUX3ioY
         0/dd5y2AUKJjxreH3Ub8yKTpmy6fxEV2YqEJPNter4FYu+PDF9+YmmrgA9ozd/nRm4qH
         n+dXasZTBQyABv3UWK1ZZHaIwMHMl+jp0tyf1xrn0tkiYrmZU65B6/2QFBOdagH6uCW4
         ZwLBdzqelxFIHv9cEy57i9iWjitxC4DrlC+v2w0QV/+6h707K9UL3cBJRK4d35kVi+L9
         jMdKjF0yetTRGqndlaQi05YsJBLPMdO0qmC9Q6oFTMoNjTtk6CFhM2homC86y8a2vn6C
         8/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=27m3jkUizoYonw2agAsRnLxLdTrKJ2tqvnlMBNPR110=;
        fh=CClnVqYt+MLrcJadfwLefwf2KA8Ij831PvAUJDCe6Io=;
        b=mxVZnBY8NQ9Ar+azUNe0kWOjAJ3jpZUYtBan9ZnmoThP1gOQMfJ7V20/MLwgYeZQ/c
         eH+dBbqQ7Xi7luwcwwp5y+IwsIMX9u5T82yEnqMOJswlYDQWxrxjcqHZJKGm8hQPAtws
         DNFXOm7n2fcoTmIW0ixD56L6uAEZjL+kC0SbOaHfBnZoDBe3ophUb9urBO4UibxHSiD8
         yFa+RJeleKyLnnbQopThdXXoES5cLuBv1fHDveMbZQMRQusiY6JgAl2aPgllNO4215DZ
         nV4MQpJ1RenoezU1FEdXcQyvtq/GN6KoRJOTtzSIRze5aDlThG6G5m3csLigNGRqAgXb
         dC0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZGpCyPI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-705ccb83ab9sor4443542b3a.10.2024.06.17.12.12.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2024 12:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AZGpCyPI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718651521; x=1719256321; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27m3jkUizoYonw2agAsRnLxLdTrKJ2tqvnlMBNPR110=;
        b=AZGpCyPIRTjG7cc/Eip9kUL+EOvJNiZk0VGwyL45p1h7k28d+csCKpcOkdqslTDZEk
         WHSxX+ktAUPlOso3iGxFkCTp7Wtti1hZJLuaU4YYvl/a6x1ihRE+SKJV1CE9+dERMwFt
         LXLlzFKv1tcck7nrkP8zEmoN0byz2twrak/ictJuSIhDLSaWf7wqkwIbQJawht9dxEi7
         sObNpBwJCf//Y1EnPuzDc0BxkXL/e3sikcqI0+gAfH3e0qP7EPaFK5h/LTj0/Eq67Io6
         MLf7GGduVf26dSaewX+pwXCs0K1/4p+q3AAZhbLgva0vt+KuMG6q/JYdUlP4qqqUZk45
         8tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718651521; x=1719256321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27m3jkUizoYonw2agAsRnLxLdTrKJ2tqvnlMBNPR110=;
        b=sqB2Ko+LpX8nRWhpuLq2tRXEX42kMUsFInNuJoDC9vtC0dMOKEZmYDFLMHgbULA3B3
         IsYa1sSp3Ksqx+wCIeGykP2Ee2isyprL93J1Z5GshFZaFel8QrSJTB9QB/Z8z0O2EPjT
         Kz3dpDVmHdBIv+YSImkhdUuWrVeP6wvkWz3z21gbRIRoh3vIVHRArZQ5YIv1Y2cNcb4H
         PGZN/SQ89YZbGYtJW2gJAYLD106ytRZSZf3samNv22tosT5cFDVJQezb7YEeTFp7iJlu
         Ln5J8e7y8z+OPrBqWI7Po98wt6Z2qa9SiMIQBDVyn5aoHWea5GuNhFDHviLPcmHLKFfw
         hayw==
X-Gm-Message-State: AOJu0Yxq5ljGzeZAMzFazy3WcVUbw6lEv30NSan1brDRqEkRpNzvP+xQ
	8H5BH31t1rZglyKcNd7Njl/jzzNX8Ysf47h9mAPjs8apwmhjI/wuvXH35PUrOaB0NaGpuEhtbNy
	T+fGg9A==
X-Google-Smtp-Source: AGHT+IHJp9kki1S5nqQIolzKisaYTlpNMGUfjzK19P8zMd64Akc3JmfaA+GFDQrTwd8jRGGi6m08pA==
X-Received: by 2002:a05:6a20:918f:b0:1b8:4107:ce4d with SMTP id adf61e73a8af0-1bae7e0a009mr11147821637.19.1718651520766;
        Mon, 17 Jun 2024 12:12:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fede16b269sm5981045a12.34.2024.06.17.12.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 12:12:00 -0700 (PDT)
Message-ID: <13caad47-a0ae-4d39-98b6-208d3c0cd8fb@linaro.org>
Date: Mon, 17 Jun 2024 12:11:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-10-alex.bennee@linaro.org>
 <31ba8570-9009-4530-934d-3b73b07520d0@linaro.org>
 <db8d82d4-c88d-45ac-bc99-e85a4240add2@linaro.org>
 <87frtcsp7q.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87frtcsp7q.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: In2jWZZiXfqY

T24gNi8xNi8yNCAxMTo0MywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiA2
LzEzLzI0IDAxOjU0LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4+PiBPbiAx
Mi82LzI0IDE3OjM1LCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4+IEZyb206IFBpZXJyaWNr
IEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+Pj4NCj4+Pj4gVGhp
cyBwbHVnaW4gdXNlcyB0aGUgbmV3IHRpbWUgY29udHJvbCBpbnRlcmZhY2UgdG8gbWFrZSBk
ZWNpc2lvbnMNCj4+Pj4gYWJvdXQgdGhlIHN0YXRlIG9mIHRpbWUgZHVyaW5nIHRoZSBlbXVs
YXRpb24uIFRoZSBhbGdvcml0aG0gaXMNCj4+Pj4gY3VycmVudGx5IHZlcnkgc2ltcGxlLiBU
aGUgdXNlciBzcGVjaWZpZXMgYW4gaXBzIHJhdGUgd2hpY2ggYXBwbGllcw0KPj4+IC4uLiBJ
UFMgcmF0ZSAoSW5zdHJ1Y3Rpb25zIFBlciBTZWNvbmQpIHdoaWNoIC4uLg0KPj4+DQo+Pj4+
IHBlciBjb3JlLiBJZiB0aGUgY29yZSBydW5zIGFoZWFkIG9mIGl0cyBhbGxvY2F0ZWQgZXhl
Y3V0aW9uIHRpbWUgdGhlDQo+Pj4+IHBsdWdpbiBzbGVlcHMgZm9yIGEgYml0IHRvIGxldCBy
ZWFsIHRpbWUgY2F0Y2ggdXAuIEVpdGhlciB3YXkgdGltZSBpcw0KPj4+PiB1cGRhdGVkIGZv
ciB0aGUgZW11bGF0aW9uIGFzIGEgZnVuY3Rpb24gb2YgdG90YWwgZXhlY3V0ZWQgaW5zdHJ1
Y3Rpb25zDQo+Pj4+IHdpdGggc29tZSBhZGp1c3RtZW50cyBmb3IgY29yZXMgdGhhdCBpZGxl
Lg0KPj4+Pg0KPj4+PiBFeGFtcGxlcw0KPj4+PiAtLS0tLS0tLQ0KPj4+Pg0KPj4+PiBTbG93
IGRvd24gZXhlY3V0aW9uIG9mIC9iaW4vdHJ1ZToNCj4+Pj4gJCBudW1faW5zbj0kKC4vYnVp
bGQvcWVtdS14ODZfNjQgLXBsdWdpbiAuL2J1aWxkL3Rlc3RzL3BsdWdpbi9saWJpbnNuLnNv
IC1kIHBsdWdpbiAvYmluL3RydWUgfCYgZ3JlcCB0b3RhbCB8IHNlZCAtZSAncy8uKjogLy8n
KQ0KPj4+PiAkIHRpbWUgLi9idWlsZC9xZW11LXg4Nl82NCAtcGx1Z2luIC4vYnVpbGQvY29u
dHJpYi9wbHVnaW5zL2xpYmlwcy5zbyxpcHM9JCgoJG51bV9pbnNuLzQpKSAvYmluL3RydWUN
Cj4+Pj4gcmVhbCA0LjAwMHMNCj4+Pj4NCj4+Pj4gQm9vdCBhIExpbnV4IGtlcm5lbCBzaW11
bGF0aW5nIGEgMjUwTUh6IGNwdToNCj4+Pj4gJCAvYnVpbGQvcWVtdS1zeXN0ZW0teDg2XzY0
IC1rZXJuZWwgL2Jvb3Qvdm1saW51ei02LjEuMC0yMS1hbWQ2NCAtYXBwZW5kICJjb25zb2xl
PXR0eVMwIiAtcGx1Z2luIC4vYnVpbGQvY29udHJpYi9wbHVnaW5zL2xpYmlwcy5zbyxpcHM9
JCgoMjUwKjEwMDAqMTAwMCkpIC1zbXAgMSAtbSA1MTINCj4+Pj4gY2hlY2sgdGltZSB1bnRp
bCBrZXJuZWwgcGFuaWMgb24gc2VyaWFsMA0KPj4+Pg0KPj4+PiBUZXN0ZWQgaW4gc3lzdGVt
IG1vZGUgYnkgYm9vdGluZyBhIGZ1bGwgZGViaWFuIHN5c3RlbSwgYW5kIHVzaW5nOg0KPj4+
PiAkIHN5c2JlbmNoIGNwdSBydW4NCj4+Pj4gUGVyZm9ybWFuY2UgZGVjcmVhc2UgbGluZWFy
bHkgd2l0aCB0aGUgZ2l2ZW4gbnVtYmVyIG9mIGlwcy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K
Pj4+PiBNZXNzYWdlLUlkOiA8MjAyNDA1MzAyMjA2MTAuMTI0NTQyNC03LXBpZXJyaWNrLmJv
dXZpZXJAbGluYXJvLm9yZz4NCj4+Pj4gLS0tDQo+Pj4+ICAgICBjb250cmliL3BsdWdpbnMv
aXBzLmMgICAgfCAxNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+Pj4+ICAgICBjb250cmliL3BsdWdpbnMvTWFrZWZpbGUgfCAgIDEgKw0KPj4+PiAgICAg
MiBmaWxlcyBjaGFuZ2VkLCAxNjUgaW5zZXJ0aW9ucygrKQ0KPj4+PiAgICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbnRyaWIvcGx1Z2lucy9pcHMuYw0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0
IGEvY29udHJpYi9wbHVnaW5zL2lwcy5jIGIvY29udHJpYi9wbHVnaW5zL2lwcy5jDQo+Pj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAuLmRiNzc3Mjky
NjQNCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9jb250cmliL3BsdWdpbnMvaXBz
LmMNCj4+Pj4gQEAgLTAsMCArMSwxNjQgQEANCj4+Pj4gKy8qDQo+Pj4+ICsgKiBpcHMgcmF0
ZSBsaW1pdGluZyBwbHVnaW4uDQo+Pj4gVGhlIHBsdWdpbiBuYW1lcyBhcmUgcmVhbGx5IHRv
IHBhY2tlZCB0byBteSB0YXN0ZSAoZWFjaCB0aW1lIEkgbG9vaw0KPj4+IGZvcg0KPj4+IG9u
ZSBJIGhhdmUgdG8gb3BlbiBtb3N0IHNvdXJjZSBmaWxlcyB0byBmaWd1cmUgb3V0IHRoZSBj
b3JyZWN0IG9uZSk7IHNvDQo+Pj4gcGxlYXNlIGVhc2UgbXkgbGlmZSBieSB1c2luZyBhIG1v
cmUgZGVzY3JpcHRpdmUgaGVhZGVyIGF0IGxlYXN0Og0KPj4+ICAgICAgICAgSW5zdHJ1Y3Rp
b25zIFBlciBTZWNvbmQgKElQUykgcmF0ZSBsaW1pdGluZyBwbHVnaW4uDQo+Pj4gVGhhbmtz
Lg0KPj4+DQo+Pg0KPj4gSSBhZ3JlZSBtb3N0IG9mIHRoZSBwbHVnaW4gbmFtZXMgYXJlIHBy
ZXR0eSBjcnlwdGljLCBhbmQgdGhleSBhcmUNCj4+IGxhY2tpbmcgYSBjb21tb24gImhlbHAi
IHN5c3RlbSwgdG8gZGVzY3JpYmUgd2hhdCB0aGV5IGRvLCBhbmQgd2hpY2gNCj4+IG9wdGlv
bnMgYXJlIGF2YWlsYWJsZSBmb3IgdGhlbS4gSXQncyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3
ZSBjb3VsZCBhZGQNCj4+IGluIHRoZSBmdXR1cmUuDQo+Pg0KPj4gUmVnYXJkaW5nIHdoYXQg
eW91IHJlcG9ydGVkLCBJJ20gdG90YWxseSBvayB3aXRoIHRoZSBjaGFuZ2UuDQo+Pg0KPj4g
SG93ZXZlciwgc2luY2UgdGhpcyBpcyBhIG5ldyBzZXJpZXMsIEknbSBub3QgaWYgSSBvciBB
bGV4IHNob3VsZA0KPj4gY2hhbmdlIGl0LiBJZiBpdCdzIG9rIGZvciB5b3UgdG8gbW9kaWZ5
IHRoaXMgQWxleCwgaXQgY291bGQgYmUgc2ltcGxlcg0KPj4gdGhhbiB3YWl0aW5nIGZvciBt
ZSB0byBwdXNoIGEgbmV3IHBhdGNoIHdpdGgganVzdCB0aGlzLg0KPiANCj4gSXRzIG15IHRy
ZWUgc28gSSdsbCBmaXggaXQgdXAuIEknbGwgYXNrIHlvdSBpZiBJIHdhbnQgYSByZXNwaW4g
Oy0pDQo+IA0KDQpUaGFua3MgQWxleC4NCg==
