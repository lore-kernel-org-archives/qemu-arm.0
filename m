Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp657246njc;
        Fri, 21 Mar 2025 17:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjP2DVDtIb0kmJT1WAHe2BrVAK7xViPt+UrLbg+jVcJXeWnVrllNils5xUWuIdMyJBHsLNqTQj6F/YGg==@linaro.org
X-Received: by 2002:a05:6a00:1301:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-739059ffb1amr9143248b3a.18.1742601678404;
        Fri, 21 Mar 2025 17:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742601678; cv=none;
        d=google.com; s=arc-20240605;
        b=Oz0Y1WVhSrihaLHTv9ghFgZRhKI4fcj7HmUkeDr4KMFJYEFJqp9QQ6s6c5BihCCawQ
         s1BpxW246Eeog/dG/nR47M6LBGLHqlsHKqdjWRMhZcTi1taiA64enkTPii6YToiY2cu2
         4S/SCP2IrMIqL1MaR2+Rh/zcjtQIrP9R5IKXWjAq+mBb+ISMYIHZbVq0rTYNPfxUv+tt
         f8tK9XqqseQ85YnRifsoGFyumG+/2upM3QIC84M+1qegRqnZss5hqOUBjRVZgyRbv8vW
         bVAbI4IU6RqCMvfURrpWS0y98r2XolRBvMbLATF7AUQv38V1ih2+HBalTrrgsy4RE7AW
         nD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8jIF53UuilIp95lERWLD96FBJysroCAg3PsA4TvpjMo=;
        fh=qducaYFu3pfMOlAqDxTSAE+Hvh/RWdDvGQb9WOc9yEY=;
        b=PJBP3yO/b60JU2yQz67x7PbHm3cQ3WgaoR54yBc862afN7LZDUjqzMffYACnhTgUAK
         JJbL2Q/nNFcwwO3I/OT4HObysBzDvkdlG5iR1T71iwv5Ki0sMKod7HriDSKUMNzt3TWr
         Hw7Vx0PkaOwCDbTw/Iha4IO59k1TiZ93/EazxiSy3N2MlbKnMp+T2II2Mm3J7+zZmuYq
         dV89uqO5njpA7r0qCQ2za10uXQx+FK8ijNatbCxVN6eLEIkm5AxZerJBm2O3Fpyv23e3
         /jvfhe18Ns1BiQpDWM+KBUTp7e6wPSUKFxm64Gc2AgSjTQR2PkYtnrbp0E8dqJrAMazl
         aOsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsRybKxr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7390601f07fsor1697048b3a.8.2025.03.21.17.01.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 17:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsRybKxr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742601678; x=1743206478; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jIF53UuilIp95lERWLD96FBJysroCAg3PsA4TvpjMo=;
        b=NsRybKxrSZLHpa2g3x9jipReJqpwAlnPKn3ichweFxZ8yOxnso0WuWIHgetN5FdIQW
         HqiFZ3BJ4Q9vKB8jXXSG33PlSUX58sXNQkd/BpN6+mUL6TaJakLSviIrsz3X2trERCjq
         hJx62tHNy/2Wy57VFfXN9YjcIvWWo9PLd7vcpCx1nxay3TWDzZLNCbZ7VeElwlB+dpOQ
         yJo+/VhJE/BqQ8sDPhzmNTvP1AuIaNH9FtTjhCWiTyTMfW2D/bsrvmAxbhh+jmj9SiRK
         DpWmdcJR/5EvqBUmQpFOHJ1DjmGS0yb1qH5aS5AQz6SZx60BBYMmtkRqyqssopwozagi
         FMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742601678; x=1743206478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jIF53UuilIp95lERWLD96FBJysroCAg3PsA4TvpjMo=;
        b=tvPQHxTjJMBy48imjzP02t95rmq+AL86XwxFkVa/ORni6qB0QUHKNPKovrdo+4KTnS
         Fum66Of5kmYCuDiW172KX1A/hxEnOg92UsgzTyXSYbYCA3msHRWrMw75KR3O/OrTRaOz
         fKWftxvHvxZMp4DSBnbC3yubQ3tsBc9WYHnSIII5WHbFrPQrfW3KJWovVLacwD1qO9/M
         uqRtwpbazzoljruQT6u39vOBp0NR1BK45sTaq1sr+uiB2Fi1p03hIwv6yN1xOOiv4ghg
         kgvYHPK6L7yTnMEERynvKSqt8VQMEj2pH92ABmN1uY7C64nLV6NkmiAlgODFYiTLrE36
         Sibw==
X-Forwarded-Encrypted: i=1; AJvYcCX7wNzLOncomuhfNzt7sPajSgJjRxDF+ZakA/sHZyI2nSAH+ubgzujw7eWzm8sT0jETBPavEQzB5e8R6A==@linaro.org
X-Gm-Message-State: AOJu0YwNcO1imYMTft918bhX3HYv77fUSZml2a1y/RcQe+OUNkekNIvF
	Bd0/cOtsDxXvdHNd/qLdWmTTz3WgWvmgOKBek7jhK9mG0uD+pXZuOurIIVCwdVa5rQ==
X-Gm-Gg: ASbGnct3ZBhTrcbYHySvQMvBi5BfyGBHEAr9SR9OW7gFjs4MrXbc6QvKY0n7+xxGqf2
	XYPoic3jdTGwd4oRh+P9XiFlgKclMWZgvEhWy1nRhVk4KHn29Sr4eKEdquMVU+AVis9LYezUZ57
	je8NjVGfXqcDDRC7V+wRcpuFWSZTg5qjkZtpH+ckG9fTnDslsV7mAGSlYb+Nu6800t7GMt641VJ
	A2B/76HfzEUvrAatdkpx1flx9LXbOVvRrRByq+N7BGgTJ1hq09UiQ+6Y15L1QrtpvWS7jRv5YVA
	OrNJ77h6zhPS8t4DF0AEP8037Ra3EXnDOJ/7mDurzfLaNyPbWWbG3iueFg==
X-Google-Smtp-Source: AGHT+IFycojw9Uun5vxQflyFUKmw9FGit8EBg4TDZCtmc6CLRIFEIQnJbgKlCoaW1zxWlIPsnn0Hhg==
X-Received: by 2002:aa7:88c7:0:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-7390593d43fmr7967391b3a.2.1742601677692;
        Fri, 21 Mar 2025 17:01:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618f080sm2780961b3a.176.2025.03.21.17.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 17:01:17 -0700 (PDT)
Message-ID: <ebd25730-1947-4360-af36-cf1131f4155c@linaro.org>
Date: Fri, 21 Mar 2025 17:01:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
 <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
 <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
 <216a39c6-384d-4f9e-b615-05af18c6ef59@linaro.org>
 <c0e338f5-6592-4d83-9f17-120b9c4f039e@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c0e338f5-6592-4d83-9f17-120b9c4f039e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: jMngh3o1kRxd

T24gMy8yMS8yNSAxNToxOSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDMvMjEv
MjUgMTM6MTEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBPbiAzLzIxLzI1IDEyOjI3
LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4+PiBPbiAzLzIxLzI1IDExOjA5LCBQaWVy
cmljayBCb3V2aWVyIHdyb3RlOg0KPj4+Pj4gTW1tLCBvayBJIGd1ZXNzLsKgIFllc3RlcmRh
eSBJIHdvdWxkIGhhdmUgc3VnZ2VzdGVkIG1lcmdpbmcgdGhpcyB3aXRoIHBhZ2UtdmFyeS5o
LCBidXQNCj4+Pj4+IHRvZGF5IEknbSBhY3RpdmVseSB3b3JraW5nIG9uIG1ha2luZyBUQVJH
RVRfUEFHRV9CSVRTX01JTiBhIGdsb2JhbCBjb25zdGFudC4NCj4+Pj4+DQo+Pj4+DQo+Pj4+
IFdoZW4geW91IG1lbnRpb24gdGhpcywgZG8geW91IG1lYW4gImNvbnN0YW50IGFjY3Jvc3Mg
YWxsIGFyY2hpdGVjdHVyZXMiLCBvciBhIGdsb2JhbA0KPj4+PiAoY29uc3QpIHZhcmlhYmxl
IHZzIGhhdmluZyBhIGZ1bmN0aW9uIGNhbGw/DQo+Pj4gVGhlIGZpcnN0IC0tIGNvbnN0YW50
IGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlcy4NCj4+Pg0KPj4NCj4+IFRoYXQncyBncmVhdC4N
Cj4+IERvZXMgY2hvb3NpbmcgdGhlIG1pbihzZXRfb2YoVEFSR0VUX1BBR0VfQklUU19NSU4p
KSBpcyB3aGF0IHdlIHdhbnQgdGhlcmUsIG9yIGlzIHRoZQ0KPj4gYW5zd2VyIG1vcmUgc3Vi
dGxlIHRoYW4gdGhhdD8NCj4gDQo+IEl0IHdpbGwgYmUsIHllcy4NCj4gDQo+IFRoaXMgaXNu
J3QgYXMgaGFyZCBhcyBpdCBzZWVtcywgYmVjYXVzZSB0aGVyZSBhcmUgZXhhY3RseSB0d28g
dGFyZ2V0cyB3aXRoDQo+IFRBUkdFVF9QQUdFX0JJVFMgPCAxMjogYXJtIGFuZCBhdnIuDQo+
IA0KPiBCZWNhdXNlIHdlIHN0aWxsIHN1cHBvcnQgYXJtdjQsIFRBUkdFVF9QQUdFX0JJVFNf
TUlOIG11c3QgYmUgPD0gMTAuDQo+IA0KPiBBVlIgY3VycmVudGx5IGhhcyBUQVJHRVRfUEFH
RV9CSVRTID09IDgsIHdoaWNoIGlzIGEgYml0IG9mIGEgcHJvYmxlbS4NCj4gTXkgZmlyc3Qg
dGFzayBpcyB0byBhbGxvdyBhdnIgdG8gY2hvb3NlIFRBUkdFVF9QQUdFX0JJVFNfTUlOID49
IDEwLg0KPiANCj4gV2hpY2ggd2lsbCBsZWF2ZSB1cyB3aXRoIFRBUkdFVF9QQUdFX0JJVFNf
TUlOID09IDEwLg0KPiANCg0KT2suDQoNCiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB3ZSBt
YWtlIHN1cmUgdGxiIGZsYWdzIGFyZSBzdG9yZWQgaW4gYW4gDQppbW11dGFibGUgcG9zaXRp
b24sIHdpdGhpbiB2aXJ0dWFsIGFkZHJlc3NlcyByZWxhdGVkIHRvIGd1ZXN0LCBieSB1c2lu
ZyANCmxvd2VyIGJpdHMgYmVsb25naW5nIHRvIGFkZHJlc3MgcmFuZ2UgaW5zaWRlIGEgZ2l2
ZW4gcGFnZSwgc2luY2UgcGFnZSANCmFkZHJlc3NlcyBhcmUgYWxpZ25lZCBvbiBwYWdlIHNp
emUsIGxlYXZpbmcgdGhvc2UgYml0cyBmcmVlLg0KDQpiaXRzIFswLi4yKSBhcmUgYnN3YXAs
IHdhdGNocG9pbnQgYW5kIGNoZWNrX2FsaWduZWQuDQpiaXRzIFtUQVJHRVRfUEFHRV9CSVRT
X01JTiAtIDUuLlRBUkdFVF9QQUdFX0JJVFNfTUlOKSBhcmUgc2xvdywgDQpkaXNjYXJkX3dy
aXRlLCBtbWlvLCBub3RkaXJ0eSwgYW5kIGludmFsaWQgbWFzay4NCkFuZCB0aGUgY29tcGls
ZSB0aW1lIGNoZWNrIHdlIGhhdmUgaXMgdG8gbWFrZSBzdXJlIHdlIGRvbid0IG92ZXJsYXAg
DQp0aG9zZSBzZXRzICh3b3VsZCBoYXBwZW4gaW4gVEFSR0VUX1BBR0VfQklUU19NSU4gPD0g
NykuDQoNCkkgd29uZGVyIHdoeSB3ZSBjYW4ndCB1c2UgYml0cyBbMy4uOCkgZXZlcnl3aGVy
ZSwgbGlrZSBpdCdzIGRvbmUgZm9yIA0KQVZSLCBldmVuIGZvciBiaWdnZXIgcGFnZSBzaXpl
cy4gSSBub3RpY2VkIHRoZSBjb21tZW50IGFib3V0ICJhZGRyZXNzIA0KYWxpZ25tZW50IGJp
dHMiLCBidXQgSSdtIGNvbmZ1c2VkIHdoeSBiaXRzIFswLi4yKSBjYW4gYmUgdXNlZCwgYW5k
IG5vdCANCnVwcGVyIG9uZXMuDQoNCkFyZSB3ZSBzdG9yaW5nIHNvbWV0aGluZyBlbHNlIGlu
IHRoZSBtaWRkbGUgb24gb3RoZXIgYXJjaHMsIG9yIGRpZCBJIA0KbWlzcyBzb21lIHBpZWNl
IG9mIHRoZSBwdXp6bGU/DQoNClRoYW5rcywNClBpZXJyaWNrDQoNCj4gDQo+IHJ+DQoNCg==
