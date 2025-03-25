Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2338204njc;
        Mon, 24 Mar 2025 18:48:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3Eo/F7/G5IgIQZ1Z0XclPoEh6I6m72+4/5irgPSx9NjKrgH+5CxJlOUd4IPIDYgutV5Puiwq0bx0eBw==@linaro.org
X-Received: by 2002:aa7:8883:0:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73905a276a9mr23243309b3a.16.1742867319560;
        Mon, 24 Mar 2025 18:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742867319; cv=none;
        d=google.com; s=arc-20240605;
        b=fT9ca2wIGz9oprVFAw6qTWNPshT0Uyq1xvslP7jYCttEZR3enDw6y2gVu1NBIFr1sB
         LBVGaO29QCnN4e+Aenjc0xSdQDdTkNdyJPrtUZnOX9p/75SK75s4MmDPI6TEHcG18Uxx
         cn4HEzXct5wsE68PfvWvK2kJ9ob+1aZIGGa0IgmfYeKjtmSw7DEnbRGpv9HzSA0SX2xK
         Hu2tDfS0sIjR+EM+Aanp8r6Rf4Q8GJIoZHbSollaDtda2Ivj2ao+HWkB4eF3Z+FYiy0F
         l55JCtQyV3pTLlJgx6Mumy6oIGFDSK8Hi+o4uw08kn0jPX8VlroW3Vd7QUHbvMGiIG0p
         DYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jepGxtMetxth7FUIkF6aKP1E2vtROZB2g8aTn+vFrpA=;
        fh=VkveZkWoAVR3eo3Fs40rEEc+vCeqRHAN/fP2UCYiDVE=;
        b=KBvPrFzvTZE1OUJjxYBzA5j9pV8kxQgsYje6dCbR2p6KS4kCZtHV90tDyBFj01ehCo
         fNAY1Hd6+Q5hEsGDvE9m5s6zW60z37njtNqc+hZ3oVEJ6ar8F2BZc1iWLtBCMlJtHqZi
         T8F+IFj2XKhW+nlprw94dkSYKMsShIz+s0ET/N01fZJxBOyXC83ZADfBYpDdUJ9Fk05W
         ScMGlS79lkR/wFclJ9kZGykEi6c4YWhJyPx5OtdlJLl/IzUu/aGwjUkyCtgmtFxxMMKX
         xbBuJbNNtId1kK5HjqPT7UephsN/eBjX57FSQLxFVKOoX6OZjHaYxkJ2qq6MOy/MFSfd
         EWnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XRannoXH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f98e2asor4766342b3a.1.2025.03.24.18.48.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 18:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XRannoXH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742867319; x=1743472119; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jepGxtMetxth7FUIkF6aKP1E2vtROZB2g8aTn+vFrpA=;
        b=XRannoXHRDUjBg+/2kNO6Zjoa/msFKMbNp6jnzWz0GVZ3m3C6IWJOqwaQcY5Tj/IsG
         PJnwhLfogQMBrJjGNkqJaZ239IgwDE81HajzcV+s9PKNI+DWgWSZ/oPVqDgEU3Tu02NJ
         eNS5ovYGPZmMVl8QF97AAhWgA+N3bn80EG0WkJnLmD4ZO/p1+cKFAohxRYjF29XsO6yT
         PnuDCGKqqCZ41AQjs+ACu8ykyMOAknBbkJnrL7Ni9U3J3O74aL9fLJxFHMNVFovNm1ig
         iP4sVYmbV4LCuOYNVbcscODJbZWX/h1+Yq8UC8XYXNWkzcN1gWPF7czCdFuMVOGEmJZE
         BPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742867319; x=1743472119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jepGxtMetxth7FUIkF6aKP1E2vtROZB2g8aTn+vFrpA=;
        b=By8KJIJNQ0Nll844x/j0HSbERpJ1d+mN1vegJZko/6nMAf9TuK/PrUjojpP6MiJI99
         XATD+cyd9mBZvbqlzGcLIvfhczIvtlyUPML95e8uKgBMs2+T5gzTcoiBf2AqPL+XgHky
         yZE57qW4jINAyilNtw1k6X4W+6HJbtyPxkXdSPa3oyyrjk8vllt/Qfa2WlSA3bHkvunp
         rprZdvggcUCgFfoJc95vH94w6Qvbb7NZRYgbwhbg0wf8YOl7YBbkPHvJRxlAgpPFpya+
         QW4Y45Vd40Kdn94nCdTT95vQP8EtqzkLB0bu62PmvYgR+ZWERfrigUUSeAKOZFmJBxEr
         ugbg==
X-Forwarded-Encrypted: i=1; AJvYcCUr3bJAq6hvY8gTEE3L3ZAMo/esVJ+dpcCt5NDkXr8eTWiKwHJEiLzSEEzGpO7GAkZw3wnyePToWccMOg==@linaro.org
X-Gm-Message-State: AOJu0Yw3PJbaWu1ArjrzOkHOJ/HjsMzDdXGWwo7YOKoz9kImAyu6KWFp
	uNYlzw3X1qtn649bIkDHWd4d1n32b84tAzk7Onap9Gr2kMl9kgSrcYhSTYWcWlTWWQ==
X-Gm-Gg: ASbGnctfGuG6UODn5mHXJLro1ILONrNtneaiHVYoz9nEBxglEuIsm5HIaW41BkMhHme
	csDs+CKOp/zDykzVY/EkbbOKdjNjyH8Sg16zEiIN97891Hz/vDpWY45y4aWx9gZm3xWdMoBJNBL
	w/rNFFDYBm4EP0GkfABkN6HIXr1enKe/pqWVntkKvhtKbIA54dG6VTHteZw3LFoSlFqeCdwgFhY
	6jof0/hlL8si7Qo6ROaOebMUvmE7ZGHPHQeFe6YD/PD+4MuWgkI9h+GmyrkRxkq5+l4RAJddUc6
	N8wqBdSIvmB/Zi16d69G8e6uX0XAdhw5sppPlIw1eCAgnhko7T6oT2A8zQ==
X-Google-Smtp-Source: AGHT+IHoINdwL8jgY5FqgvZtk5Q6BeVpE4yF1ws/NywnBXzBwUcbjtM6+wv8Mc2pJC11Q5+zeW1xjA==
X-Received: by 2002:a05:6a20:12cf:b0:1f5:86f2:a674 with SMTP id adf61e73a8af0-1fe42f326e4mr25190629637.12.1742867318910;
        Mon, 24 Mar 2025 18:48:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a23b2asm7923700a12.50.2025.03.24.18.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 18:48:38 -0700 (PDT)
Message-ID: <60aa7341-e462-4334-bc85-f70f6d48e392@linaro.org>
Date: Mon, 24 Mar 2025 18:48:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/30] hw/arm/armv7m: prepare compilation unit to be
 common
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-27-pierrick.bouvier@linaro.org>
 <0c9055a3-2650-4802-a28c-e5d79052bc81@linaro.org>
 <6cce9fd1-d008-4b63-a77f-c091fcd933e0@linaro.org>
 <67313299-0ce6-457d-ace7-73ad864a0eb0@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <67313299-0ce6-457d-ace7-73ad864a0eb0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: qVV0k1oYrxOX

T24gMy8yNC8yNSAxODoyMiwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMjQv
MjUgMTQ6MzEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzIzLzI1IDEyOjQ4
LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+PiBPbiAzLzIwLzI1IDE1OjI5LCBQaWVy
cmljayBCb3V2aWVyIHdyb3RlOg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+Pj4+IC0tLQ0KPj4+PiAgwqDC
oCBody9hcm0vYXJtdjdtLmMgfCAxMiArKysrKysrKy0tLS0NCj4+Pj4gIMKgwqAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL2h3L2FybS9hcm12N20uYyBiL2h3L2FybS9hcm12N20uYw0KPj4+PiBp
bmRleCA5OGE2OTg0NjExOS4uYzM2N2MyZGNiOTkgMTAwNjQ0DQo+Pj4+IC0tLSBhL2h3L2Fy
bS9hcm12N20uYw0KPj4+PiArKysgYi9ody9hcm0vYXJtdjdtLmMNCj4+Pj4gQEAgLTEzOSw4
ICsxMzksOSBAQCBzdGF0aWMgTWVtVHhSZXN1bHQgdjdtX3N5c3JlZ19uc193cml0ZSh2b2lk
ICpvcGFxdWUsIGh3YWRkciBhZGRyLA0KPj4+PiAgwqDCoMKgwqDCoMKgIGlmIChhdHRycy5z
ZWN1cmUpIHsNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFMgYWNjZXNzZXMgdG8g
dGhlIGFsaWFzIGFjdCBsaWtlIE5TIGFjY2Vzc2VzIHRvIHRoZSByZWFsIHJlZ2lvbiAqLw0K
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXR0cnMuc2VjdXJlID0gMDsNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIE1lbU9wIGVuZCA9IHRhcmdldF93b3Jkc19iaWdlbmRpYW4oKSA/IE1P
X0JFIDogTU9fTEU7DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gbWVtb3J5
X3JlZ2lvbl9kaXNwYXRjaF93cml0ZShtciwgYWRkciwgdmFsdWUsDQo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX21lbW9wKHNpemUpIHwgTU9fVEUsIGF0
dHJzKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfbWVt
b3Aoc2l6ZSkgfCBlbmQsIGF0dHJzKTsNCj4+Pg0KPj4+IHRhcmdldF93b3Jkc19iaWdlbmRp
YW4oKSBpcyBhbHdheXMgZmFsc2UgZm9yIGFybSBzeXN0ZW0gbW9kZS4NCj4+PiBKdXN0IHMv
VEUvTEUvLg0KPj4+DQo+Pg0KPj4gR29vZCBwb2ludC4NCj4+DQo+PiBCeSB0aGUgd2F5LCB3
aGF0J3MgdGhlIFFFTVUgcmF0aW9uYWxlIGJlaGluZCBoYXZpbmcgQXJtIGJpZyBlbmRpYW4g
dXNlciBiaW5hcmllcywgYW5kIG5vdA0KPj4gcHJvdmlkZSBpdCBmb3Igc29mdG1tdSBiaW5h
cmllcz8NCj4gDQo+IEZvciBzeXN0ZW0gbW9kZSwgZW5kaWFubmVzcyBpcyBzZXQgdmlhIGEg
Y29tYmluYXRpb24gb2YgQ1BTUi5FLCBTQ1RMUi5CIGFuZCBTQ1RMUi5FRSwNCj4gZGV0YWls
cyBkZXBlbmRpbmcgb24gYXJtdjQsIGFybXY2LCBhcm12NysuDQo+IA0KPiBJdCBpcyBJTVBM
RU1FTlRBVElPTiBERUZJTkVEIGhvdyB0aGUgY3B1IGluaXRpYWlsaXplcyBhdCByZXNldC4g
IEluIG9sZGVuIHRpbWVzLCB2aWEgYQ0KPiBib2FyZC1sZXZlbCBwaW4gKHNvbWV0aW1lcyBz
d2l0Y2hlZCwgc29tZXRpbWVzIHNvbGRlcmVkKS4gIFdlIG1vZGVsIHRoZSBib2FyZC1sZXZl
bCBwaW4NCj4gdmlhIHRoZSAiY2ZnZW5kIiBjcHUgcHJvcGVydHkuDQo+IA0KPiBJbiBhbnkg
Y2FzZSwgZm9yIHN5c3RlbSBtb2RlIHdlIGV4cGVjdCB0aGUgZ3Vlc3QgdG8gZG8gdGhlIHNh
bWUgdGhpbmcgaXQgd291bGQgbmVlZCB0byBkbw0KPiBvbiByZWFsIGhhcmR3YXJlLiAgRm9y
IHVzZXIgbW9kZSwgd2UgY2FuJ3QgZG8gdGhhdCwgYXMgd2UncmUgYWxzbyBlbXVsYXRpbmcg
dGhlIE9TIGxheWVyLA0KPiB3aGljaCBuZWVkcyB0byBrbm93IHRoZSBlbmRpYW5uZXNzIHRv
IGV4cGVjdCBmcm9tIHRoZSBndWVzdCBiaW5hcmllcy4NCj4gDQoNCk9oIHllcywgdG90YWxs
eSBtYWtlcyBzZW5zZS4gVGhhbmtzLg0KDQo+PiBJZiB0aG9zZSBzeXN0ZW1zIGFyZSBzbyBy
YXJlLCB3aHkgd291bGQgcGVvcGxlIG5lZWQgYSB1c2VyIG1vZGUgZW11bGF0aW9uPw0KPiAN
Cj4gSU1PIGFybWJlLWxpbnV4LXVzZXIgaXMgZXh0aW5jdC4NCj4gDQo+IERlYmlhbiBuZXZl
ciBoYWQgYmlnLWVuZGlhbiBzdXBwb3J0IGF0IGFsbC4gIElmIHRoZXJlIHdhcyBzb21lIG90
aGVyIGRpc3RybyB3aGljaCBoYWQgaXQsDQo+IEkgZG9uJ3QgcmVjYWxsIHdoaWNoLiAgT3Ro
ZXJ3aXNlIHlvdSdkIG5lZWQgdG8gYm9vdHN0cmFwIHRoZSBlbnRpcmUgdG9vbGNoYWluLCB3
aGljaCB0byBtZQ0KPiBzZWVtcyByYXRoZXIgYmVzaWRlIHRoZSBwb2ludC4NCj4gDQo+IA0K
PiByfg0KDQo=
