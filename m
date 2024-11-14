Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp89338njc;
        Wed, 13 Nov 2024 20:11:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqilUl8Mw+68PBbMd0n84kEPdPuOpk4v7Ar88OhgY/mF6/7Cmja6uy5UZbDuzv9XA9SQnoBHYRtcVuDw==@linaro.org
X-Received: by 2002:a17:902:cf12:b0:20c:9983:27be with SMTP id d9443c01a7336-211c501cc4emr8576555ad.27.1731557475175;
        Wed, 13 Nov 2024 20:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557475; cv=none;
        d=google.com; s=arc-20240605;
        b=ieO2vrivIMbH8p0/PALgrsRXZBkTXWEV1eEtIazd1Gpdcu33dSF870IjfNOJ12HvnF
         uq7O6XVxcZ2mRlNrog4SyO9EFprdwYZCDVzzTcDcLp5oLMaBNYtQAVs3ligbDyMBEcjl
         epEfBATj3CDDrxeVRlWw85m5oI2NwmiAaK/xkOmS41MUw3Yxkk5ZFzdZLvqtj+E9UTIl
         uNi9LBL+HTwXuJggZG4m7VVeg/5uXG5xCvf1u2Ur39wwAXjxEVNVNlRYjMI+G82K/6zU
         tzMC8WsP6I1bNum3UKCKTYzWug5hFLCyrZiNcXZjAXPNYnAUw+OBVfQFGTDoOjA9wSt9
         F4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0XxgsVbh6WLMBu6c5e3A7oFTEFNkwa2SFFQqmoidBOw=;
        fh=iZXMGBfF0Y9j07XMKCCE/ZuTbts/FYGAUc2dbc1ohX4=;
        b=kdVIZ4B7n2v4Hfd2QyMSMiglBJip6koliWIU7ScXUCKC01uMBXrCehMsnY+eoNC1nx
         TeBYVza9uiVokpX44ALEKgtPLtSBXhJSjZZnCiPmIr7PDfTw6KOIb02dzv0RcJNx/wb3
         87SObZADei6vxrKri4Gi233luMfnDNACSc2x/1FzH6cChTVwYLLu/kj1WfW0S8C5xSWA
         p5e67xnOP2bUEOdQuF+/0pNrGVlLH/usgF8aL37RkjEqso0J8YFrbcsSskjTuMX10zNe
         3674IUeIcb50QF0C/QFhWSgj7hv3AuugsilartEFMRweFYNO76bw7DIyChyL6lO9f5/y
         p7Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k//d7ZQT";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7cf7a17sor1426675ad.15.2024.11.13.20.11.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:11:15 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k//d7ZQT";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557475; x=1732162275; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XxgsVbh6WLMBu6c5e3A7oFTEFNkwa2SFFQqmoidBOw=;
        b=k//d7ZQTzyoa2hwlZKTausWojCSaGfGhpdWcWY+zuZxW6d75wdovAeDTkN/MHx+tmU
         PZSvPWoXjWS4ptXxRvhy19FzT3aDH0eKYfKgJPsa0P68oYHbdnh3A7BgGkRy/TbPo68E
         +wzydHMtEsU089gVPq4SExClU0sEuh08GKB6zldgopXreza/7HLcNWPuI697wiRWommB
         jJe4JM0uVN+nYck90yATuLMei2AieQZt49QViEzsfYqM/55JjzdmtiRpkp1kiVX/qpW/
         CUD5aMmB93gJC5PMO5/5VHSp5imyaDbemliuGBFi0aFP4x67w1iuoTRbm3ql3HrZYrfD
         3+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557475; x=1732162275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XxgsVbh6WLMBu6c5e3A7oFTEFNkwa2SFFQqmoidBOw=;
        b=tgfXs6Ecbwts/VYmelsVeFSKqsqQelFfNS+2ifv7Fc+yIp7FqBID3V6JoW4wYEd+EK
         NkBr65vjbtGx3dxTzahkYmbfVC10cspxFaVqbcJLCNpUInwzypxYCZW/+yzOUMdhgUUD
         SuvUs7xorvpfIRalEKBytMfxiuXVPnS4mNorV3GOygWwGp7ucjqhT6+8YallDpikUuhL
         n4jkSf1HJ2Z74eemGtEPwBvkXZMCOeobtEkzZ7L2GkQRENhlFNwy1ZvMREfiOWhxRq2a
         phxFcxtVX+qpUQXgcaozzpMajfl4YufSGUQl3sNnchVuMF8ePfgzTjNuNoTS0aD3LeiV
         Mfrg==
X-Forwarded-Encrypted: i=1; AJvYcCU81Pf1ruAqmFPHEmInUIZaxRdV4YiyjFfYQJEznWGZdmecsHj04B6dybeBSKGBxljZD6k/UOlgmuN4lg==@linaro.org
X-Gm-Message-State: AOJu0YxlpLhLNkBUkFTJaFUKuX9w0GaFquy5K2kVuFLlOOLEOtP40N6x
	iLyZBqObfFwn22zLrn5DL7/QbE6Jq+Lwo/qODDgwLLHw6GbzBVEsR/zSdYgVUT5qbw==
X-Google-Smtp-Source: AGHT+IHTgPfiUUJx4xE6zTpq/2sJPjH4HXxH8Yh8JVcZAsQWRP08Jl1HxMSx4513W9vccQZdRIIKeQ==
X-Received: by 2002:a05:6a20:72a5:b0:1db:e883:e055 with SMTP id adf61e73a8af0-1dc832a5e90mr1247753637.7.1731557474748;
        Wed, 13 Nov 2024 20:11:14 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a9bcfc0sm242604b3a.163.2024.11.13.20.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:11:14 -0800 (PST)
Message-ID: <2d6b8b11-60cd-4484-a930-f43b215fbc97@linaro.org>
Date: Wed, 13 Nov 2024 20:11:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] accel/tcg: Include missing
 'exec/translation-block.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 0MdezDLaLNh/

DQoNCk9uIDExLzEzLzI0IDE3OjEyLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gVEIgY29tcGlsZSBmbGFncyBhcmUgZGVmaW5lZCBpbiAiZXhlYy90cmFuc2xhdGlvbi1i
bG9jay5oIi4NCj4gSW5jbHVkZSBpdCBpbiBvcmRlciB0byBhdm9pZCB3aGVuIHJlZmFjdG9y
aW5nOg0KPiANCj4gICAgYWNjZWwvdGNnL3RjZy1hY2NlbC1vcHMuYzo2MjozNjogZXJyb3I6
IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ0NGX0NMVVNURVJfU0hJRlQnDQo+ICAg
ICAgIDYyIHwgICAgIGNmbGFncyA9IGNwdS0+Y2x1c3Rlcl9pbmRleCA8PCBDRl9DTFVTVEVS
X1NISUZUOw0KPiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXg0KPiAgICBhY2NlbC90Y2cvdGNnLWFjY2VsLW9wcy5jOjY0OjI2OiBlcnJvcjogdXNl
IG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllciAnQ0ZfUEFSQUxMRUwnDQo+ICAgICAgIDY0IHwg
ICAgIGNmbGFncyB8PSBwYXJhbGxlbCA/IENGX1BBUkFMTEVMIDogMDsNCj4gICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAgICBhY2NlbC90Y2cvdGNnLWFjY2Vs
LW9wcy5jOjY1OjM0OiBlcnJvcjogdXNlIG9mIHVuZGVjbGFyZWQgaWRlbnRpZmllciAnQ0Zf
VVNFX0lDT1VOVCcNCj4gICAgICAgNjUgfCAgICAgY2ZsYWdzIHw9IGljb3VudF9lbmFibGVk
KCkgPyBDRl9VU0VfSUNPVU5UIDogMDsNCj4gICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGFjY2VsL3RjZy90
Y2ctYWNjZWwtb3BzLmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9hY2NlbC90Y2cvdGNnLWFjY2VsLW9wcy5jIGIvYWNj
ZWwvdGNnL3RjZy1hY2NlbC1vcHMuYw0KPiBpbmRleCAzYzE5ZTY4YTc5Li4yMjQ4NmM1ZGZm
IDEwMDY0NA0KPiAtLS0gYS9hY2NlbC90Y2cvdGNnLWFjY2VsLW9wcy5jDQo+ICsrKyBiL2Fj
Y2VsL3RjZy90Y2ctYWNjZWwtb3BzLmMNCj4gQEAgLTM1LDYgKzM1LDcgQEANCj4gICAjaW5j
bHVkZSAiZXhlYy9leGVjLWFsbC5oIg0KPiAgICNpbmNsdWRlICJleGVjL2h3YWRkci5oIg0K
PiAgICNpbmNsdWRlICJleGVjL3RiLWZsdXNoLmgiDQo+ICsjaW5jbHVkZSAiZXhlYy90cmFu
c2xhdGlvbi1ibG9jay5oIg0KPiAgICNpbmNsdWRlICJnZGJzdHViL2VudW1zLmgiDQo+ICAg
DQo+ICAgI2luY2x1ZGUgImh3L2NvcmUvY3B1LmgiDQoNClJldmlld2VkLWJ5OiBQaWVycmlj
ayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
