Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1250849dlb;
        Tue, 10 Sep 2024 07:42:17 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:205:4bae:afea with SMTP id d9443c01a7336-2074c5def0bmr11458945ad.23.1725979337318;
        Tue, 10 Sep 2024 07:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979337; cv=none;
        d=google.com; s=arc-20160816;
        b=oSWBtat1NzuDy4WoY2SPXuF3Ls9NBJfhTSvKmsqslMamWIJm/ZuGbGe4oPSkLmnV4E
         sT+XpmKp0lOY/oG1/x1YLDev79S58gWpXDxLoPOx2HVeBOgKazQwMEwgBq7DOgpz0H0L
         ezKtFTUMKUghCRuH2rQhpNd6bgBFp/nwzQUgXhv6yPvgcUhsYbx0W7Rf64NBopQLUP2S
         oDfvGy4exqfCB9Y6/EtHXDwsSi1ZkOLaNiLAVNpS4hp04zwmKZ5Mc2visS4hdSR27Q8v
         SX5jDXZ/l0uOtEPemomimjYvYq3J9iEAnF4hY8Sb2ttDaMJi/xDGOh1YKEZWy329dRvn
         mLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WECIi+QSvb8y/ryL0QG9OzjVbZUKrYOSqO3Jesudx2Y=;
        fh=FLkZ1UhBvtv+NiZhvZkAdPJmE6xJU+OCqlRQdD0wjog=;
        b=OJ2mnWg+aLk6J0CjGl7aIR68dmdwP4UgGMg6xBa2SWOUt5xi1BshTxLfkG0sk5X+4o
         AMKSDqseFkKl0KBk7ZSgewOuIxc5vLapMcj/2O7h83Gy93/HIvKrwDRHtHxWz6+R2t7a
         TSJyAJ35uWKWD83lLZ3Y3Yle7/zzbETfXv4OgRwzx2qgX0XJwiV2Y1NKU/Q5yxeVgaCc
         qmtMfZ6VbexGICNHQpqDa9T6Evrie9iv1VIUAXw6DmTI3Jp915V2HrdtVTcFiX/5dfeS
         p87xF5mNxwyTSOs/uVvCTHG/uUzwz6dCmVbNqW7Wa0AL8Wt/2nVUWTVOspkjRdqQlL9m
         p4cA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pi4qL0Q1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710e1fd98sor39269605ad.2.2024.09.10.07.42.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pi4qL0Q1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979337; x=1726584137; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WECIi+QSvb8y/ryL0QG9OzjVbZUKrYOSqO3Jesudx2Y=;
        b=Pi4qL0Q12FcL8tFavPGNAv6NXdly9dTJSmssZhglNcRjlAPCNkzrStSxRA26xztUak
         keoiSwQHhxRznnecv/JsrebtXoopJoT5TbPB6leOywPdvnISAnBNy+YRRHadMF24tQxw
         yOwhIKyFROZjsQweiHtx3aXRDI2LP+xpcUzJ5ce6e96XFUnbcJcFTAiUsylOb0SEK1nb
         gf7YU6cknYIs0DApswoMM/G+CP2sMfOA9DUfjgPOmx4x2q3QbAl6Oqd4/1v1QmGvsyB6
         +v63QvVmitE3TKBeLdCj9oRqZRzZ0C4tuHkaA2jurFvBHYXVvwgr+gnQdwB9hwepo89j
         VD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979337; x=1726584137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WECIi+QSvb8y/ryL0QG9OzjVbZUKrYOSqO3Jesudx2Y=;
        b=cLVhG/gz72MDQHJsigwkAlCmz+RRaQPYavpaxf6z7fveZ7po6MlR4ogL+lclM1ZqiK
         XE7h7BsujwY4fJQnCjnbMVyChMwcDgaEJBtHRVVoHkjxFkmCaFlXiCQt5wAMswyB72to
         6tvg3ZftwUSS23nLCrTgIWcZ3+8FPwv/G2ova64n8LUrNeUYtiDYlotNDpFth+JT87jF
         K4yG7BTzfp18WsWQLmuNIoMrl2aYbmwr1W/ZXABjFk0AcMOWcbJkAB3AGSrNN5ugi67i
         MeBtxmO+UJEatJPmCRpsIyq8/R9OjxJFApnH2s19RmXOBXpUbCaAeWMmqs43pfQfCGHV
         Q8XQ==
X-Gm-Message-State: AOJu0YwSKj3HwxBIIUMteAzC5M6fYIhX9kiLiFRM43OScVT0Tr7Piam+
	QaQVYbeCjqMVbNkxfqouMuy5dWnucgk05HyBxQtbzYa4cVVEMMM5kuB5YfmB/xkjAi59AIb/Lab
	uQwOm/PHG
X-Google-Smtp-Source: AGHT+IEJNMP+c+ZWnHamnMDrxG7esqV/JIpVESJVeVzdP6t9WaMEEtMrInPK0qklQcGcMBwfN/ZRcw==
X-Received: by 2002:a17:90a:ba82:b0:2d8:f7c6:e1dd with SMTP id 98e67ed59e1d1-2dad5135862mr15161745a91.37.1725979336707;
        Tue, 10 Sep 2024 07:42:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbfe6ce1sm8612323a91.12.2024.09.10.07.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:42:16 -0700 (PDT)
Message-ID: <bba53a1a-72d3-49dd-a7d6-4901a3812d1b@linaro.org>
Date: Tue, 10 Sep 2024 07:42:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] tests/docker: update debian i686 and mipsel images
 to bookworm
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
 <20240910140733.4007719-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240910140733.4007719-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: /B4mDgOVQZrB

T24gOS8xMC8yNCAwNzowNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBXaGF0ZXZlciBpc3N1
ZXMgdGhlcmUgd2VyZSB3aGljaCBzdG9wcGVkIHRoZXNlIGJlaW5nIHVwZGF0ZXMgd2hlbiB0
aGUNCj4gcmVzdCB3ZXJlIGhhdmUgbm93IGJlZW4gcmVzb2x2ZWQuIEhvd2V2ZXIgbWlwczY0
ZWwgY29udGludWVzIHRvIGJlDQo+IGJyb2tlbiBzbyBkb24ndCB1cGRhdGUgaXQgaGVyZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4NCj4gLS0tDQo+ICAgdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1pNjg2
LWNyb3NzLmRvY2tlciAgIHwgMTAgKysrKy0tLS0tLQ0KPiAgIHRlc3RzL2RvY2tlci9kb2Nr
ZXJmaWxlcy9kZWJpYW4tbWlwc2VsLWNyb3NzLmRvY2tlciB8IDEwICsrKystLS0tLS0NCj4g
ICB0ZXN0cy9sY2l0b29sL3JlZnJlc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArKy0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9kb2NrZXIvZG9ja2VyZmls
ZXMvZGViaWFuLWk2ODYtY3Jvc3MuZG9ja2VyIGIvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVz
L2RlYmlhbi1pNjg2LWNyb3NzLmRvY2tlcg0KPiBpbmRleCAzZmU4ZWU2MjNkLi4yMzI4ZWUx
NzMyIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLWk2
ODYtY3Jvc3MuZG9ja2VyDQo+ICsrKyBiL3Rlc3RzL2RvY2tlci9kb2NrZXJmaWxlcy9kZWJp
YW4taTY4Ni1jcm9zcy5kb2NrZXINCj4gQEAgLTEsMTAgKzEsMTAgQEANCj4gICAjIFRISVMg
RklMRSBXQVMgQVVUTy1HRU5FUkFURUQNCj4gICAjDQo+IC0jICAkIGxjaXRvb2wgZG9ja2Vy
ZmlsZSAtLWxheWVycyBhbGwgLS1jcm9zcy1hcmNoIGk2ODYgZGViaWFuLTExIHFlbXUNCj4g
KyMgICQgbGNpdG9vbCBkb2NrZXJmaWxlIC0tbGF5ZXJzIGFsbCAtLWNyb3NzLWFyY2ggaTY4
NiBkZWJpYW4tMTIgcWVtdQ0KPiAgICMNCj4gICAjIGh0dHBzOi8vZ2l0bGFiLmNvbS9saWJ2
aXJ0L2xpYnZpcnQtY2kNCj4gICANCj4gLUZST00gZG9ja2VyLmlvL2xpYnJhcnkvZGViaWFu
OjExLXNsaW0NCj4gK0ZST00gZG9ja2VyLmlvL2xpYnJhcnkvZGViaWFuOjEyLXNsaW0NCj4g
ICANCj4gICBSVU4gZXhwb3J0IERFQklBTl9GUk9OVEVORD1ub25pbnRlcmFjdGl2ZSAmJiBc
DQo+ICAgICAgIGFwdC1nZXQgdXBkYXRlICYmIFwNCj4gQEAgLTQ4LDE2ICs0OCwxNSBAQCBS
VU4gZXhwb3J0IERFQklBTl9GUk9OVEVORD1ub25pbnRlcmFjdGl2ZSAmJiBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHB5dGhvbjMtb3BlbmN2IFwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcHl0aG9uMy1waWxsb3cgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBw
eXRob24zLXBpcCBcDQo+IC0gICAgICAgICAgICAgICAgICAgICAgcHl0aG9uMy1zZXR1cHRv
b2xzIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcHl0aG9uMy1zcGhpbnggXA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBweXRob24zLXNwaGlueC1ydGQtdGhlbWUgXA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBweXRob24zLXZlbnYgXA0KPiAtICAgICAgICAgICAg
ICAgICAgICAgIHB5dGhvbjMtd2hlZWwgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBw
eXRob24zLXlhbWwgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBycG0yY3BpbyBcDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHNlZCBcDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHNvY2F0IFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3BhcnNlIFwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICBzd3RwbSBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHRhciBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRlc3NlcmFjdC1vY3IgXA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICB0ZXNzZXJhY3Qtb2NyLWVuZyBcDQo+IEBAIC02OSw4
ICs2OCw2IEBAIFJVTiBleHBvcnQgREVCSUFOX0ZST05URU5EPW5vbmludGVyYWN0aXZlICYm
IFwNCj4gICAgICAgZHBrZy1yZWNvbmZpZ3VyZSBsb2NhbGVzICYmIFwNCj4gICAgICAgcm0g
LWYgL3Vzci9saWIqL3B5dGhvbjMqL0VYVEVSTkFMTFktTUFOQUdFRA0KPiAgIA0KPiAtUlVO
IC91c3IvYmluL3BpcDMgaW5zdGFsbCB0b21saQ0KPiAtDQo+ICAgRU5WIENDQUNIRV9XUkFQ
UEVSU0RJUiAiL3Vzci9saWJleGVjL2NjYWNoZS13cmFwcGVycyINCj4gICBFTlYgTEFORyAi
ZW5fVVMuVVRGLTgiDQo+ICAgRU5WIE1BS0UgIi91c3IvYmluL21ha2UiDQo+IEBAIC0xNDUs
NiArMTQyLDcgQEAgUlVOIGV4cG9ydCBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUg
JiYgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ2ZGVwbHVnLWRldjppMzg2IFwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbGlidmlyZ2xyZW5kZXJlci1kZXY6aTM4NiBc
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnZ0ZS0yLjkxLWRldjppMzg2IFwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICBsaWJ4ZHAtZGV2OmkzODYgXA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ6c3RkLWRldjppMzg2IFwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgbmV0dGxlLWRldjppMzg2IFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3lz
dGVtdGFwLXNkdC1kZXY6aTM4NiBcDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9kb2NrZXIvZG9j
a2VyZmlsZXMvZGViaWFuLW1pcHNlbC1jcm9zcy5kb2NrZXIgYi90ZXN0cy9kb2NrZXIvZG9j
a2VyZmlsZXMvZGViaWFuLW1pcHNlbC1jcm9zcy5kb2NrZXINCj4gaW5kZXggMGQ1NTlhZTRi
YS4uNGFjMzE0ZTIyZSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVz
L2RlYmlhbi1taXBzZWwtY3Jvc3MuZG9ja2VyDQo+ICsrKyBiL3Rlc3RzL2RvY2tlci9kb2Nr
ZXJmaWxlcy9kZWJpYW4tbWlwc2VsLWNyb3NzLmRvY2tlcg0KPiBAQCAtMSwxMCArMSwxMCBA
QA0KPiAgICMgVEhJUyBGSUxFIFdBUyBBVVRPLUdFTkVSQVRFRA0KPiAgICMNCj4gLSMgICQg
bGNpdG9vbCBkb2NrZXJmaWxlIC0tbGF5ZXJzIGFsbCAtLWNyb3NzLWFyY2ggbWlwc2VsIGRl
Ymlhbi0xMSBxZW11DQo+ICsjICAkIGxjaXRvb2wgZG9ja2VyZmlsZSAtLWxheWVycyBhbGwg
LS1jcm9zcy1hcmNoIG1pcHNlbCBkZWJpYW4tMTIgcWVtdQ0KPiAgICMNCj4gICAjIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9saWJ2aXJ0L2xpYnZpcnQtY2kNCj4gICANCj4gLUZST00gZG9ja2Vy
LmlvL2xpYnJhcnkvZGViaWFuOjExLXNsaW0NCj4gK0ZST00gZG9ja2VyLmlvL2xpYnJhcnkv
ZGViaWFuOjEyLXNsaW0NCj4gICANCj4gICBSVU4gZXhwb3J0IERFQklBTl9GUk9OVEVORD1u
b25pbnRlcmFjdGl2ZSAmJiBcDQo+ICAgICAgIGFwdC1nZXQgdXBkYXRlICYmIFwNCj4gQEAg
LTQ4LDE2ICs0OCwxNSBAQCBSVU4gZXhwb3J0IERFQklBTl9GUk9OVEVORD1ub25pbnRlcmFj
dGl2ZSAmJiBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHB5dGhvbjMtb3BlbmN2IFwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcHl0aG9uMy1waWxsb3cgXA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBweXRob24zLXBpcCBcDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgcHl0aG9uMy1zZXR1cHRvb2xzIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcHl0
aG9uMy1zcGhpbnggXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBweXRob24zLXNwaGlu
eC1ydGQtdGhlbWUgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBweXRob24zLXZlbnYg
XA0KPiAtICAgICAgICAgICAgICAgICAgICAgIHB5dGhvbjMtd2hlZWwgXA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBweXRob24zLXlhbWwgXA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBycG0yY3BpbyBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNlZCBcDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHNvY2F0IFwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgc3BhcnNlIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICBzd3RwbSBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHRhciBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHRl
c3NlcmFjdC1vY3IgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICB0ZXNzZXJhY3Qtb2Ny
LWVuZyBcDQo+IEBAIC02OSw4ICs2OCw2IEBAIFJVTiBleHBvcnQgREVCSUFOX0ZST05URU5E
PW5vbmludGVyYWN0aXZlICYmIFwNCj4gICAgICAgZHBrZy1yZWNvbmZpZ3VyZSBsb2NhbGVz
ICYmIFwNCj4gICAgICAgcm0gLWYgL3Vzci9saWIqL3B5dGhvbjMqL0VYVEVSTkFMTFktTUFO
QUdFRA0KPiAgIA0KPiAtUlVOIC91c3IvYmluL3BpcDMgaW5zdGFsbCB0b21saQ0KPiAtDQo+
ICAgRU5WIENDQUNIRV9XUkFQUEVSU0RJUiAiL3Vzci9saWJleGVjL2NjYWNoZS13cmFwcGVy
cyINCj4gICBFTlYgTEFORyAiZW5fVVMuVVRGLTgiDQo+ICAgRU5WIE1BS0UgIi91c3IvYmlu
L21ha2UiDQo+IEBAIC0xNDMsNiArMTQwLDcgQEAgUlVOIGV4cG9ydCBERUJJQU5fRlJPTlRF
TkQ9bm9uaW50ZXJhY3RpdmUgJiYgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ2
ZGVwbHVnLWRldjptaXBzZWwgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ2aXJn
bHJlbmRlcmVyLWRldjptaXBzZWwgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ2
dGUtMi45MS1kZXY6bWlwc2VsIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICBsaWJ4ZHAt
ZGV2Om1pcHNlbCBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnpzdGQtZGV2Om1p
cHNlbCBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIG5ldHRsZS1kZXY6bWlwc2VsIFwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc3lzdGVtdGFwLXNkdC1kZXY6bWlwc2VsIFwN
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2xjaXRvb2wvcmVmcmVzaCBiL3Rlc3RzL2xjaXRvb2wv
cmVmcmVzaA0KPiBpbmRleCAxOTlkNWZhZDg3Li5jNjA0OTBhN2ZhIDEwMDc1NQ0KPiAtLS0g
YS90ZXN0cy9sY2l0b29sL3JlZnJlc2gNCj4gKysrIGIvdGVzdHMvbGNpdG9vbC9yZWZyZXNo
DQo+IEBAIC0xNTksNyArMTU5LDcgQEAgdHJ5Og0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRyYWlsZXI9Y3Jvc3NfYnVpbGQoImFybS1saW51eC1nbnVlYWJpaGYtIiwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJhcm0tc29mdG1t
dSxhcm0tbGludXgtdXNlciIpKQ0KPiAgIA0KPiAtICAgIGdlbmVyYXRlX2RvY2tlcmZpbGUo
ImRlYmlhbi1pNjg2LWNyb3NzIiwgImRlYmlhbi0xMSIsDQo+ICsgICAgZ2VuZXJhdGVfZG9j
a2VyZmlsZSgiZGViaWFuLWk2ODYtY3Jvc3MiLCAiZGViaWFuLTEyIiwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBjcm9zcz0iaTY4NiIsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHJhaWxlcj1jcm9zc19idWlsZCgiaTY4Ni1saW51eC1nbnUtIiwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ4ODZfNjQtc29mdG1t
dSwiDQo+IEBAIC0xNzEsNyArMTcxLDcgQEAgdHJ5Og0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRyYWlsZXI9Y3Jvc3NfYnVpbGQoIm1pcHM2NGVsLWxpbnV4LWdudWFiaTY0LSIs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibWlw
czY0ZWwtc29mdG1tdSxtaXBzNjRlbC1saW51eC11c2VyIikpDQo+ICAgDQo+IC0gICAgZ2Vu
ZXJhdGVfZG9ja2VyZmlsZSgiZGViaWFuLW1pcHNlbC1jcm9zcyIsICJkZWJpYW4tMTEiLA0K
PiArICAgIGdlbmVyYXRlX2RvY2tlcmZpbGUoImRlYmlhbi1taXBzZWwtY3Jvc3MiLCAiZGVi
aWFuLTEyIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBjcm9zcz0ibWlwc2VsIiwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICB0cmFpbGVyPWNyb3NzX2J1aWxkKCJtaXBz
ZWwtbGludXgtZ251LSIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibWlwc2VsLXNvZnRtbXUsbWlwc2VsLWxpbnV4LXVzZXIiKSkNCg0KUmV2
aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9y
Zz4NCg==
