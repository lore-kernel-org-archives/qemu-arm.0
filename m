Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1251349dlb;
        Tue, 10 Sep 2024 07:43:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d2:b0:714:28c7:2455 with SMTP id d2e1a72fcca58-718e33539abmr17294873b3a.6.1725979390449;
        Tue, 10 Sep 2024 07:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979390; cv=none;
        d=google.com; s=arc-20160816;
        b=BmZ+Fxmp/n5oxTa8gQOh7r2Kd5h5xRdnMY0+iIPtBY+4CIgma801AvV+HQiFx0G4Fo
         dXHkMlDFX5UHTeCr3I3EVH3jDbih7/WpOZnynCMdzEixbOHKHlfjxGmwc/LFvB8BJIpa
         vKosmJfeBkEBHEz6//cEazRzWbuxnUbk14aa7dQRtj7zrv/PoICLudbeQQMvHJ06c9Bw
         Jx9byuSwk+gCli/9qH8hmvC1cEOztxYGXean4bj5E9WTPJqhX4pFi1bGqVZZRAow9gmA
         jkxvoGFqL6r1RP+qNQ2+apISB2MPlO0h/H+DMp//QmclUwGlRucNggnq3GO60d7R+nIX
         B8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jyO6ZEBsvHTirm3n5JF1PC/HjUbNXf8pwzGy7+XrHR4=;
        fh=FLkZ1UhBvtv+NiZhvZkAdPJmE6xJU+OCqlRQdD0wjog=;
        b=bHHrxlQEGSLHw5NZE02DRH54u2G6ID88F1wOiIO6j1Ke2ypCzNiT1Z+v6e5bJ7P0Mb
         KGxFaqFk05NnQnA09GL0WtIiT9u4NbuMle+GahvXnvinQAO4L9Lq+hjTPA3lK1xgNsqG
         wQ8Does0hg2WdOuMyV/NxFntDtRn5PUseihURZ4+JMao1u4ySIwHA/AtlpeGy/A7z0il
         sTCLar0WI8HdlwIy53gKz37HVHP8HegGvZiFnT+Kb4MVQN43PhZcddsAG2OdAHdDs/or
         AT4zUp0T8MOKeuOyO6vviiD2oFtGOkyVu2nuc0f6WT3e8MroAHACKdMzTDK0Rwa/lT0d
         jpAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hfph+Vgo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e597ec36sor5071430b3a.9.2024.09.10.07.43.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hfph+Vgo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979390; x=1726584190; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyO6ZEBsvHTirm3n5JF1PC/HjUbNXf8pwzGy7+XrHR4=;
        b=hfph+VgoDyW6riO8GKjkJ8Uq/V6WtmBZ6hn+lezenWrkINxUAdqM/7Bk0QU/YEf+fX
         JO8euv5uNOjr3ASWue66AiwxDe05qg3VG7IwURIWRcQRe8j0BJQV4z+0HwiZxsi6IEae
         f1PFyymK/v8H15yUcCFfdKmuv0eWYTutzXnk64XcyQEpIeNRRwSyr/bvjCWF+AaRUmA6
         wjHj3i+u0CXbekHc/bFbEMO2TDZWS0HXzXEE/JGg2iC+w3Dd6Ta0whZeH/sVbSI+177D
         ExXn3/ORwT68Ay9PTzentb2fCvrjRd4UtohRBDFI0EzUI4qv1EuZfGA7DXTMnrcARd5q
         xFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979390; x=1726584190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyO6ZEBsvHTirm3n5JF1PC/HjUbNXf8pwzGy7+XrHR4=;
        b=QpHGegaaMZq3uG8YitOMJnnIBmr5RaxVOjyBh25MLKToOe4PTsMrD59MnY6wPqABj/
         qHJ8aiRtYRBwX1QAxmif3L7ltxM41KwaD4umgZ2+vB4IRa8C0lvgR32vXd2Qh3XccEhO
         A1kBf8tR02oYBWZoMyeTry3rYYGkHGw79pAuG/MQqHmJKuJRURRNfnWADozD6WLKU9VK
         dL+eoHgT2kOnHmHX91Q4x+OUxjs113sqlV5AjAwFmAi+DhS6T5SuJc4N3jUMGWzM3VZk
         reAru8sxoV58ODaeZG3OUzGc54F8FUOhwpVj2ufp2cFLe4FDScn7ST4RBZj+wvMRg6wO
         TyVQ==
X-Gm-Message-State: AOJu0Ywi48qBK1Sc6CedkVfkyXY7nqY+v5lBwlJ6qnNxVnydBRge3ADF
	drsRIbobbRTFjBXx7ljNp4gy8xgalgzpvZkcry2HlL2KliVzzzmicp9FiYUWy8xGfxpM9f3+C1V
	2KY59453d
X-Google-Smtp-Source: AGHT+IGMjU0fA05WEKFgQRHJPXzIMha2aabJrITNU/7AOQE76iOWk3Pf/eqzZTMgXnfQ4rcJRtz2QA==
X-Received: by 2002:a05:6a00:22d2:b0:714:28c7:2455 with SMTP id d2e1a72fcca58-718e33539abmr17294824b3a.6.1725979389825;
        Tue, 10 Sep 2024 07:43:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe28cbsm1450341b3a.73.2024.09.10.07.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:43:09 -0700 (PDT)
Message-ID: <9c4aa57b-73c2-4ecb-961e-0d61031f5690@linaro.org>
Date: Tue, 10 Sep 2024 07:43:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/26] scripts/ci: update the gitlab-runner playbook
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
 <20240910140733.4007719-5-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240910140733.4007719-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: X1MN0NdFKj55

T24gOS8xMC8yNCAwNzowNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgdXBzdHJlYW0g
aW5zdGFsbCBpbnN0cnVjdGlvbnM6DQo+IA0KPiAgICBodHRwczovL2RvY3MuZ2l0bGFiLmNv
bS9ydW5uZXIvaW5zdGFsbC9saW51eC1yZXBvc2l0b3J5Lmh0bWwNCj4gDQo+IE5vdyByZWZl
ciB0byByZXBvc2l0b3JpZXMgYW5kIGEgc2V0dXAgc2NyaXB0LiBNb2Rlcm5pc2UgdGhlIHBs
YXlib29rDQo+IHRvIHVzZSB0aGUgcHJlZmVycmVkIGRlbGl2ZXJ5IG1ldGhvZC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4N
Cj4gLS0tDQo+ICAgc2NyaXB0cy9jaS9zZXR1cC9naXRsYWItcnVubmVyLnltbCB8IDM5ICsr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Njcmlw
dHMvY2kvc2V0dXAvZ2l0bGFiLXJ1bm5lci55bWwgYi9zY3JpcHRzL2NpL3NldHVwL2dpdGxh
Yi1ydW5uZXIueW1sDQo+IGluZGV4IDdiZGFmYWI1MTEuLjU3ZTdmYWViZjEgMTAwNjQ0DQo+
IC0tLSBhL3NjcmlwdHMvY2kvc2V0dXAvZ2l0bGFiLXJ1bm5lci55bWwNCj4gKysrIGIvc2Ny
aXB0cy9jaS9zZXR1cC9naXRsYWItcnVubmVyLnltbA0KPiBAQCAtNDksMzAgKzQ5LDUxIEBA
DQo+ICAgICAgIC0gZGVidWc6DQo+ICAgICAgICAgICBtc2c6IGdpdGxhYi1ydW5uZXIgYXJj
aCBpcyB7eyBnaXRsYWJfcnVubmVyX2FyY2ggfX0NCj4gICANCj4gLSAgICAtIG5hbWU6IERv
d25sb2FkIHRoZSBtYXRjaGluZyBnaXRsYWItcnVubmVyIChERUIpDQo+ICsgICAgIyBEZWJp
YW4vVWJ1bnR1IHNldHVwDQo+ICsgICAgLSBuYW1lOiBHZXQgZ2l0bGFiLXJ1bm5lciByZXBv
IHNldHVwIHNjcmlwdCAoREVCKQ0KPiAgICAgICAgIGdldF91cmw6DQo+ICAgICAgICAgICBk
ZXN0OiAiL3Jvb3QvIg0KPiAtICAgICAgICB1cmw6ICJodHRwczovL2dpdGxhYi1ydW5uZXIt
ZG93bmxvYWRzLnMzLmFtYXpvbmF3cy5jb20vbGF0ZXN0L2RlYi9naXRsYWItcnVubmVyX3t7
IGdpdGxhYl9ydW5uZXJfYXJjaCB9fS5kZWIiDQo+ICsgICAgICAgIHVybDogImh0dHBzOi8v
cGFja2FnZXMuZ2l0bGFiLmNvbS9pbnN0YWxsL3JlcG9zaXRvcmllcy9ydW5uZXIvZ2l0bGFi
LXJ1bm5lci9zY3JpcHQuZGViLnNoIg0KPiArICAgICAgICBtb2RlOiAwNzU1DQo+ICAgICAg
ICAgd2hlbjoNCj4gICAgICAgICAgIC0gYW5zaWJsZV9mYWN0c1snZGlzdHJpYnV0aW9uJ10g
PT0gJ1VidW50dScNCj4gICANCj4gLSAgICAtIG5hbWU6IERvd25sb2FkIHRoZSBtYXRjaGlu
ZyBnaXRsYWItcnVubmVyIChSUE0pDQo+ICsgICAgLSBuYW1lOiBSdW4gZ2l0bGFiLXJ1bm5l
ciByZXBvIHNldHVwIHNjcmlwdCAoREVCKQ0KPiArICAgICAgc2hlbGw6ICIvcm9vdC9zY3Jp
cHQuZGViLnNoIg0KPiArICAgICAgd2hlbjoNCj4gKyAgICAgICAgLSBhbnNpYmxlX2ZhY3Rz
WydkaXN0cmlidXRpb24nXSA9PSAnVWJ1bnR1Jw0KPiArDQo+ICsgICAgLSBuYW1lOiBJbnN0
YWxsIGdpdGxhYi1ydW5uZXIgKERFQikNCj4gKyAgICAgIGFuc2libGUuYnVpbHRpbi5hcHQ6
DQo+ICsgICAgICAgICAgbmFtZTogZ2l0bGFiLXJ1bm5lcg0KPiArICAgICAgICAgIHVwZGF0
ZV9jYWNoZTogeWVzDQo+ICsgICAgICAgICAgc3RhdGU6IHByZXNlbnQNCj4gKyAgICAgIHdo
ZW46DQo+ICsgICAgICAgIC0gYW5zaWJsZV9mYWN0c1snZGlzdHJpYnV0aW9uJ10gPT0gJ1Vi
dW50dScNCj4gKw0KPiArICAgICMgUlBNIHNldHVwDQo+ICsgICAgLSBuYW1lOiBHZXQgZ2l0
bGFiLXJ1bm5lciByZXBvIHNldHVwIHNjcmlwdCAoUlBNKQ0KPiAgICAgICAgIGdldF91cmw6
DQo+ICAgICAgICAgICBkZXN0OiAiL3Jvb3QvIg0KPiAtICAgICAgICB1cmw6ICJodHRwczov
L2dpdGxhYi1ydW5uZXItZG93bmxvYWRzLnMzLmFtYXpvbmF3cy5jb20vbGF0ZXN0L3JwbS9n
aXRsYWItcnVubmVyX3t7IGdpdGxhYl9ydW5uZXJfYXJjaCB9fS5ycG0iDQo+ICsgICAgICAg
IHVybDogImh0dHBzOi8vcGFja2FnZXMuZ2l0bGFiLmNvbS9pbnN0YWxsL3JlcG9zaXRvcmll
cy9ydW5uZXIvZ2l0bGFiLXJ1bm5lci9zY3JpcHQucnBtLnNoIg0KPiArICAgICAgICBtb2Rl
OiAwNzU1DQo+ICAgICAgICAgd2hlbjoNCj4gICAgICAgICAgIC0gYW5zaWJsZV9mYWN0c1sn
ZGlzdHJpYnV0aW9uJ10gPT0gJ0NlbnRPUycNCj4gICANCj4gLSAgICAtIG5hbWU6IEluc3Rh
bGwgZ2l0bGFiLXJ1bm5lciB2aWEgcGFja2FnZSBtYW5hZ2VyIChERUIpDQo+IC0gICAgICBh
cHQ6IGRlYj0iL3Jvb3QvZ2l0bGFiLXJ1bm5lcl97eyBnaXRsYWJfcnVubmVyX2FyY2ggfX0u
ZGViIg0KPiArICAgIC0gbmFtZTogUnVuIGdpdGxhYi1ydW5uZXIgcmVwbyBzZXR1cCBzY3Jp
cHQgKFJQTSkNCj4gKyAgICAgIHNoZWxsOiAiL3Jvb3Qvc2NyaXB0LnJwbS5zaCINCj4gICAg
ICAgICB3aGVuOg0KPiAtICAgICAgICAtIGFuc2libGVfZmFjdHNbJ2Rpc3RyaWJ1dGlvbidd
ID09ICdVYnVudHUnDQo+ICsgICAgICAgIC0gYW5zaWJsZV9mYWN0c1snZGlzdHJpYnV0aW9u
J10gPT0gJ0NlbnRPUycNCj4gICANCj4gLSAgICAtIG5hbWU6IEluc3RhbGwgZ2l0bGFiLXJ1
bm5lciB2aWEgcGFja2FnZSBtYW5hZ2VyIChSUE0pDQo+IC0gICAgICB5dW06IG5hbWU9Ii9y
b290L2dpdGxhYi1ydW5uZXJfe3sgZ2l0bGFiX3J1bm5lcl9hcmNoIH19LnJwbSINCj4gKyAg
ICAtIG5hbWU6IEluc3RhbGwgZ2l0bGFiLXJ1bm5lciAoUlBNKQ0KPiArICAgICAgeXVtOg0K
PiArICAgICAgICBuYW1lOiBnaXRsYWItcnVubmVyDQo+ICsgICAgICAgIHVwZGF0ZV9jYWNo
ZTogeWVzDQo+ICsgICAgICAgIHN0YXRlOiBwcmVzZW50DQo+ICAgICAgICAgd2hlbjoNCj4g
ICAgICAgICAgIC0gYW5zaWJsZV9mYWN0c1snZGlzdHJpYnV0aW9uJ10gPT0gJ0NlbnRPUycN
Cj4gICANCj4gKyAgICAjIFJlZ2lzdGVyIFJ1bm5lcnMNCj4gICAgICAgLSBuYW1lOiBSZWdp
c3RlciB0aGUgZ2l0bGFiLXJ1bm5lcg0KPiAgICAgICAgIGNvbW1hbmQ6ICIvdXNyL2Jpbi9n
aXRsYWItcnVubmVyIHJlZ2lzdGVyIC0tbm9uLWludGVyYWN0aXZlIC0tdXJsIHt7IGdpdGxh
Yl9ydW5uZXJfc2VydmVyX3VybCB9fSAtLXJlZ2lzdHJhdGlvbi10b2tlbiB7eyBnaXRsYWJf
cnVubmVyX3JlZ2lzdHJhdGlvbl90b2tlbiB9fSAtLWV4ZWN1dG9yIHNoZWxsIC0tdGFnLWxp
c3Qge3sgYW5zaWJsZV9mYWN0c1tcImFyY2hpdGVjdHVyZVwiXSB9fSx7eyBhbnNpYmxlX2Zh
Y3RzW1wiZGlzdHJpYnV0aW9uXCJdfGxvd2VyIH19X3t7IGFuc2libGVfZmFjdHNbXCJkaXN0
cmlidXRpb25fdmVyc2lvblwiXSB9fSAtLWRlc2NyaXB0aW9uICd7eyBhbnNpYmxlX2ZhY3Rz
W1wiZGlzdHJpYnV0aW9uXCJdIH19IHt7IGFuc2libGVfZmFjdHNbXCJkaXN0cmlidXRpb25f
dmVyc2lvblwiXSB9fSB7eyBhbnNpYmxlX2ZhY3RzW1wiYXJjaGl0ZWN0dXJlXCJdIH19ICh7
eyBhbnNpYmxlX2ZhY3RzW1wib3NfZmFtaWx5XCJdIH19KSciDQo+ICAgDQoNClJldmlld2Vk
LWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
