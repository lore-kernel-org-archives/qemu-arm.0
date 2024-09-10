Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1250985dlb;
        Tue, 10 Sep 2024 07:42:34 -0700 (PDT)
X-Received: by 2002:a05:6870:a54b:b0:278:237:57ea with SMTP id 586e51a60fabf-27b82ea9594mr14714259fac.28.1725979353935;
        Tue, 10 Sep 2024 07:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979353; cv=none;
        d=google.com; s=arc-20160816;
        b=Mg7VIdyExXpEgDZqcNma0qfHIQtWJWjh54xANndjNKCnaWo06HR0BfD9rmMNVjcxu1
         gk4cNsVZ9slSxfqzAhxzAYOQDz/wtIm9ZB+WjEJj/3QapqPiAv1z6OUOMWvL3jfKduCY
         LN+cbksPbp7JXqB1eKud73mUygqQ1I9AQASt8CV6IAKPM9uoIBBcFCRM5tX0Yw7tzOBw
         UEcXZWtAyy7M31nrxDZq60gWfFSp+aiD+YXq1j0Sq50/8/xTNqVMByXmjhO9pIy9/8QH
         oyhLvoBMrdCQrzHhbhK8VgJzd7SzH1HHmjugaUkX5Ld/FJncsMxcltx2QuJJApBkekcb
         kWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wWRtKX4Fc0XZZzY4iDmqemDW+Sl8iS5dOb2n/7LmYl4=;
        fh=FLkZ1UhBvtv+NiZhvZkAdPJmE6xJU+OCqlRQdD0wjog=;
        b=YOjW2/TMBYykCnFzfGVxoMih4P/g2k14thS86wxoKEC+izvTA6C9ms/xJVjTzcBFGl
         vmR3nz8GRGY+S9JLUJI4/Ki2TJ1SqaqHRRSHUshZ/iIx1vMf48UNvLnBIQ47SAvMI+UE
         tOwALMja1sWAgNe5PjoAXQ8Z7TNfGGXO9izVClU4FGoRh+VsYDEY3fVxrRw0nbOfG2xs
         N35BJr5JQYO9w4NA9C83BtPxFCwiPMS/b0744f59I/BlBFfeGJxwDjUY4aDltI/rABoU
         J0hF1DK5QVbLKdpmYMBUjd9bk3gVVhEIjjXVtJ/PU/ikbopcT2m6UZaWTuoGjkwaX2kr
         c0qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZ7pXXGs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-27ba409399esor1708124fac.15.2024.09.10.07.42.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZ7pXXGs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979353; x=1726584153; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWRtKX4Fc0XZZzY4iDmqemDW+Sl8iS5dOb2n/7LmYl4=;
        b=lZ7pXXGsdiBxIo0IijLY8kWnJnldgos5RzrT+Z5BH02zUpOOR7FSh59Zl0yMNTgjo0
         XvDGR60nTWmUjyRI3taJoMQMGVRUHJU9zBnfttfbc3bpqRW1cER6Y+RL205I0J8Qitmk
         63NnAwrynpyAOvV0Emda+4y/1N+7p2UOrP1pIloa9BbxUHXn7XlT3NJzbbzh9XL3ZuFU
         bBvQ7E5iv2EjtIfs9TqlSRKizYDFOspHpOq6j2Nt/dn3QeuC2inhOhdERs6ab2XbqYzu
         bpPrImfRY7TEpG92JjKMhm/QpXTm3JTmYFkTBrWOR84G4pidFciucvZtdO0Vhi3CYo/u
         yYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979353; x=1726584153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWRtKX4Fc0XZZzY4iDmqemDW+Sl8iS5dOb2n/7LmYl4=;
        b=O42ygZkSPJNjZ9B9q33BNCPpIN/QcZcZV/gnlpItoVTaOQYIHayhADdJ8KdUaqcAOL
         +RWYz/AAGL64ESLqITVNE1yjVGhOc/cx+4oPYq3ODCBbFuHaBY6YuJrTUDB2IhAo+fa2
         NumQ/9cnZsQGgON+8EXgydeQ5vp7G0h4MYTppwQNh26IuRsYNKBezNUF3hVq3jQ5hIzp
         5byLkFSV8av7fSRCoXI8g8CCMv2lfyjEYsWmie6bEepSOS4uezx9xaS/M9Unmqdv7LrL
         K8158OZFmi99smRU3TLh03hcKhWraHjA1hs5gSHXy5jl60GvqFVWJxFWhbWZOl9M4dq9
         FOyw==
X-Gm-Message-State: AOJu0YxVhxP3empUjUQRQ0ljEDq71lxfyVFgIII1x55x0v8DBlrpIIyr
	bHzkpERcxITL47Hl0l8Zd5z6hvF+xjcqIVUKq9fyRczBo7a6Mx0myHNOWqoYWtAdH3x7/WIvpff
	E0qPOIoh2
X-Google-Smtp-Source: AGHT+IFgTFdjpuoaiHApP15tub66oG6PB2tqjYWZWOukXIgPdDeqbAzUOEO9JnKqI4DvWblh11Vb6g==
X-Received: by 2002:a05:6870:e414:b0:25e:b999:d24 with SMTP id 586e51a60fabf-27b82b69ab8mr16155913fac.0.1725979353435;
        Tue, 10 Sep 2024 07:42:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823736318sm4821228a12.12.2024.09.10.07.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:42:32 -0700 (PDT)
Message-ID: <a4908f0b-1c59-447e-b63f-03fd8265607f@linaro.org>
Date: Tue, 10 Sep 2024 07:42:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/26] docs/devel: fix duplicate line
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
 <20240910140733.4007719-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240910140733.4007719-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: xYTp5GsKjxVt

T24gOS8xMC8yNCAwNzowNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBJIGd1ZXNzIHRoZSBz
YW1lIGNoYW5nZSBjYW1lIGluIHZpYSB0d28gcGF0Y2ggc2VyaWVzLiBSZW1vdmUgdGhlDQo+
IHJlcGV0aXRpb24uDQo+IA0KPiBGaXhlczogMmE4NTFmY2E5ZiAoZG9jcy9kZXZlbDogcmVt
aW5kIGRldmVsb3BlcnMgdG8gcnVuIENJIGNvbnRhaW5lciBwaXBlbGluZSB3aGVuIHVwZGF0
aW5nIGltYWdlcykNCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBkb2NzL2RldmVsL3Rlc3RpbmcvbWFpbi5yc3Qg
fCA2IC0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RvY3MvZGV2ZWwvdGVzdGluZy9tYWluLnJzdCBiL2RvY3MvZGV2ZWwv
dGVzdGluZy9tYWluLnJzdA0KPiBpbmRleCBlOTkyMWE0YjEwLi4wOTcyNWU4ZWE5IDEwMDY0
NA0KPiAtLS0gYS9kb2NzL2RldmVsL3Rlc3RpbmcvbWFpbi5yc3QNCj4gKysrIGIvZG9jcy9k
ZXZlbC90ZXN0aW5nL21haW4ucnN0DQo+IEBAIC01MDAsMTIgKzUwMCw2IEBAIGZpcnN0IHRv
IGNvbnRyaWJ1dGUgdGhlIG1hcHBpbmcgdG8gdGhlIGBgbGlidmlydC1jaWBgIHByb2plY3Q6
DQo+ICAgICAgYENJIDxodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21hc3Rlci9kZXZlbC9j
aS5odG1sPmBfXyBkb2N1bWVudGF0aW9uDQo+ICAgICAgcGFnZSBvbiBob3cgdG8gdHJpZ2dl
ciBnaXRsYWIgQ0kgcGlwZWxpbmVzIG9uIHlvdXIgY2hhbmdlLg0KPiAgIA0KPiAtICogUGxl
YXNlIGFsc28gdHJpZ2dlciBnaXRsYWIgY29udGFpbmVyIGdlbmVyYXRpb24gcGlwZWxpbmVz
IG9uIHlvdXIgY2hhbmdlDQo+IC0gICBmb3IgYXMgbWFueSBPUyBkaXN0cm9zIGFzIHByYWN0
aWNhbCB0byBtYWtlIHN1cmUgdGhhdCB0aGVyZSBhcmUgbm8NCj4gLSAgIG9idmlvdXMgYnJl
YWthZ2VzIHdoZW4gYWRkaW5nIHRoZSBuZXcgcHJlLXJlcXVpc2l0ZS4gUGxlYXNlIHNlZQ0K
PiAtICAgYENJIDxodHRwczovL3d3dy5xZW11Lm9yZy9kb2NzL21hc3Rlci9kZXZlbC9jaS5o
dG1sPmBfXyBkb2N1bWVudGF0aW9uDQo+IC0gICBwYWdlIG9uIGhvdyB0byB0cmlnZ2VyIGdp
dGxhYiBDSSBwaXBlbGluZXMgb24geW91ciBjaGFuZ2UuDQo+IC0NCj4gICBGb3IgZW50ZXJw
cmlzZSBkaXN0cm9zIHRoYXQgZGVmYXVsdCB0byBvbGQsIGVuZC1vZi1saWZlIHZlcnNpb25z
IG9mIHRoZQ0KPiAgIFB5dGhvbiBydW50aW1lLCBRRU1VIHVzZXMgYSBzZXBhcmF0ZSBzZXQg
b2YgbWFwcGluZ3MgdGhhdCB3b3JrIHdpdGggbW9yZQ0KPiAgIHJlY2VudCB2ZXJzaW9ucy4g
IFRoZXNlIGNhbiBiZSBmb3VuZCBpbiBgYHRlc3RzL2xjaXRvb2wvbWFwcGluZ3MueW1sYGAu
DQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo=
