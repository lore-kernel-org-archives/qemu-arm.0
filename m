Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp475601njb;
        Wed, 4 Dec 2024 12:04:58 -0800 (PST)
X-Received: by 2002:a05:6a20:9149:b0:1e0:d1c3:97d1 with SMTP id adf61e73a8af0-1e16bee16efmr9568132637.29.1733342698787;
        Wed, 04 Dec 2024 12:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733342698; cv=none;
        d=google.com; s=arc-20240605;
        b=AbM1CGsVoGl1qM+emBJUaGe1PPSQEOzRg56gxjPLp6+2FqBhDp5soczc3vNS4/4d6r
         7nwmOBaYpe0Chr/hyv/bM3r2iqtnrjzhgicX6s+GKGtp2Fd4NKedZN5lypEwVD5F4vMi
         sKI6Fd/f2BvGGjpO/cKuGQI19U5ddaHLckDidLIqQ19sXWej3TKFB2bPv1cG+40KL42j
         4ThN3BiInO/uJLfN14cg30R3hVG3XCxCQ1+lq7GNHDJNrAAGm3lcbIJqcU6lo2GfDm6B
         Js0sp/e4cI7/64d7ogKMgKS3vmDZLjjVVtJLekRD8f/Kj7JGjFh15TgCa5prqC0LMRhj
         A1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Nnv71+rW9GA7t2uIqnUeOj8gJtCmfjXmgXPNueQy4H8=;
        fh=YK7c/j2Ab02I3v+LXT+Yelid9+tW+9f6a7X/++Ng9EY=;
        b=SIdTmTiFgARq3dSL3RPDTyYocpXoC4vuFX21PfB1RNyaE0lJJIWG9POTze1nzd2Oj+
         KoneGmw2+L0JW0qmsgO5E6xkWEeFu5K04IT93zyLMLVtIrn/lT9oH2H/iQRsoCLmJbXr
         uxszt694s1PpWpsrcbKj/q75AnjHSz6zffCEWAdlHzPWdkWv5+UYg2FLbNRum+dz/g3T
         NIW4fj0WbbpKFZFgEGZ+MF6DQE18+jHS1McqmYJ3dyoVxAuL/D7qcMsp7kST0JVUBL2G
         axou3AWnQu7FEarzoX3LvNgtZCy2y3pQsgFIDMdlfMlm6PbJOt1h9ZijZl9GSEe32xW5
         T6dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dFunHVNR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c25991esor9124188a12.1.2024.12.04.12.04.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 12:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dFunHVNR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733342698; x=1733947498; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nnv71+rW9GA7t2uIqnUeOj8gJtCmfjXmgXPNueQy4H8=;
        b=dFunHVNRVw06/E6Egz0Mu9NxnC0w8Q/V11FIKmyKjRCHz7dghz1TxeobnmOiNiH/VM
         m0CeeL6Ghc9IR8saFSrMNNTsaoLxfgPI51hNGm2Bt1Ujjs19aItuHoHrXkiVFMhdzoX9
         m/dNq5pBSOMOPgnkjujmUnWFIQDf1IXJUPx3eg8fCV/03dgDm30vp0iMnsMdbFc3tHXR
         f0YWKyAUH17DSTC6/+m4e5uja6Hic7G0ldkTkxCr4zgBDeIenZKUgx9nRCA2ihNBOgjX
         hMYCsccF7bmr3LrDYRJbde26PDdd/6neBILnabFnveNUlgI+tJKcl9jRy51tpicBVMdK
         XPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733342698; x=1733947498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nnv71+rW9GA7t2uIqnUeOj8gJtCmfjXmgXPNueQy4H8=;
        b=oLujO8bsMJQsDsCcUb4MOXq7g7VY5EA7z0ZrUUe7DDP+9JvzHIxDyE8krLTux72drI
         8HccnjKsJaqVg7vefqwOQRuvIiP41x9ReR3QJZm4wLriP6d4e79O8JFTHVt00h8EUXhe
         al9AyKZFTNf146Hz0qkKrehq1absk+EfrtJzH3Y3g4yMctN3vPh7EUeLd+nckl1q7G/G
         y1jzPFzTwhMfHGm99SDF0WaCDeh2qzVv7sUUzvflkaGc/JPvLFH9A8/OFOYasmXLmmmk
         +/H9RDsc8ZSslPDYP81u3EMCAWI9cp2GEY7UiFk4H8TZrf1QvhcxW+rw38IEUmSbDwO7
         8LoA==
X-Gm-Message-State: AOJu0YzWvUNFCjEGdXL1ZIs3w8HWrjUtJsBXlfPDHbAk21FqsBzNF66/
	Yetuf0As+geDj3afT5iG9VxgWTQLG3QFBZ9dRW+bXQ2XqYPVbjmd3x4HCQx7XgGZpn+NGO8CjTn
	gYcDQ4w==
X-Gm-Gg: ASbGncvavbzM9+RtNq2+UaArTAi86+15Nd7OS1mHVTzuRrfMH5FLAr5OIwv/gz1GfEE
	ULeEkOiJWlFhcWJoXO0Fg7hRBZn2L0COS+RssVy5Y2OsoDDxKO/l0QhCUCGbUrDq91QKXzwANdF
	1dM0Ax9eXJEcV6XbdDfXkIekdsL/4q0TgGxzTWNU2ehzFpDgBx5U0DfGmgVAVOYRvb76NWpslbX
	zxpHuA5NASYetPZfPGf2BRlHr5zjxEXKMqDJ9uRWXhqN97riVsJI8MzWEEMAInRDAC+LFkhUAtF
	fQTG2QmepRHkCvgxk6Hl5A==
X-Google-Smtp-Source: AGHT+IGuVDDp8VLB9IPM6Tk9931pTC/c2PD9N5IN9kikQ+p67vwnXXDubjFWHYUbPdrnBQmPwk3bbA==
X-Received: by 2002:a05:6a20:918d:b0:1e0:f495:1bd9 with SMTP id adf61e73a8af0-1e16bdd3296mr8455695637.8.1733342698352;
        Wed, 04 Dec 2024 12:04:58 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3a0c3csm11763116a12.76.2024.12.04.12.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 12:04:57 -0800 (PST)
Message-ID: <2e88ea19-fdae-429c-a674-a0fd5d91eced@linaro.org>
Date: Wed, 4 Dec 2024 12:04:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/functional/aarch64: add tests for FEAT_RME
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, mathieu.poirier@linaro.org,
 jean-philippe@linaro.org, marcin.juszkiewicz@linaro.org,
 gustavo.romero@linaro.org
References: <20241203213629.2482806-1-pierrick.bouvier@linaro.org>
 <87frn3bxfg.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87frn3bxfg.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: kaRzVgRm815T

T24gMTIvNC8yNCAwMTozOCwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBUaGlz
IGJvb3QgYW4gT1AtVEVFIGVudmlyb25tZW50LCBhbmQgbGF1bmNoIGEgbmVzdGVkIGd1ZXN0
IFZNIGluc2lkZSBpdA0KPj4gdXNpbmcgdGhlIFJlYWxtcyBmZWF0dXJlLiBXZSBkbyBpdCBm
b3IgdmlydCBhbmQgc2JzYS1yZWYgcGxhdGZvcm1zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4gDQo+
IFF1ZXVlZCB0byB0ZXN0aW5nL25leHQsIHRoYW5rcy4NCj4gDQoNClRoYW5rcyBBbGV4Lg0K
DQpGWUksIHRoaXMgdGVzdCB0cmlnZ2VycyBhIHVic2FuIGlzc3VlLCB0aGF0IEkgZml4ZWQg
aW4gWzFdLg0KDQpBcyBQZXRlciBkaWQgZ29vZCBlZmZvcnRzIHRvIGNsZWFudXAgdWJzYW4g
aXNzdWVzIHdlIGhhZCAobm9uZSBsZWZ0IGZyb20gDQp3aGF0IEkgdHJpZWQpLCBpdCB3b3Vs
ZCBiZSB1bmZvcnR1bmF0ZSB0byByZWludHJvZHVjZSBvbmUgYXQgdGhlIHNhbWUgDQp0aW1l
IHdlIG1lcmdlIHRoZSBjdXJyZW50IHBhdGNoLg0KDQpbMV0gDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9xZW11LWRldmVsLzIwMjQxMjA0MTk1MTExLjI5MjExNDEtMS1waWVycmljay5i
b3V2aWVyQGxpbmFyby5vcmcvVC8jdQ0K
