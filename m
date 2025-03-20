Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1195596njc;
        Thu, 20 Mar 2025 12:42:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:729a:b0:1f5:7d57:8322 with SMTP id adf61e73a8af0-1fe4342d010mr1118646637.26.1742499760392;
        Thu, 20 Mar 2025 12:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499760; cv=none;
        d=google.com; s=arc-20240605;
        b=h2Q1c9IMPcG11ifoYi6gbQXV0IOyERI3G41JMolVhdLubAUrZQ451i/AFGcZktQ+zS
         vHXDeAC8P34AavbFMy2BfJOhkH2NpT+PAkZLPVJJrFvMPdP6Ih1pSUEiEkzB7ZNNFUqH
         Jvt939se1c5whNfHS0Z+aI1LUBgnhpnaXdmhnN5FNcPAK8xhTkcw0+12qQrfAESg6PR9
         /egvNCSPCMw7+bnrA7czw5WIkeGHo8cwj2Iq83bNcs3VOJL5t1Ma5S0dmrVa7Bce/bmR
         rIx/wx7vriB4g7Y9TT9mMP9/O0QH30L+8jq/gj9qsLqBo/35wmxVHXYtBuqqwnsY5ukb
         Pf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=A1A2OLohCw6tV7LJ1/cg/Afzs5REC66QQgYuFKn7Obs=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=SeEqf/Nm8132BMtaWb4TW2rJR5OShKPO7gE5Fo1Ix79DPwPvF+c8K/hTj9pBDYGQig
         YPZsQeJadyR5OyIdVdkrOSpp0VtNRmL7XtKdR6IOmxrhg2QtQ61A6kcGmFgkbvJcIlxm
         Ex4c1zgqFwGiIdEqrFg1FtYV6MKZhdvsKzUD5ooumm34n5oodbnf5uM1uqjlZOwjKNuQ
         anTUGZgftP1+vj5qzSfWDyJO9UafWONi5CmmNqIOeyzmtTFmKfTBRZMWH9yfzEcvhgeo
         EABsEiTDfTMnv6vwTmILaANaIMX25AvI1dWhvk4ClcO20UGUSf5A9yrHwsLT8/q8iesm
         8lyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8wHJqq0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a33fd8sor263334a12.6.2025.03.20.12.42.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8wHJqq0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499760; x=1743104560; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1A2OLohCw6tV7LJ1/cg/Afzs5REC66QQgYuFKn7Obs=;
        b=D8wHJqq0Pur+Sl0NlNTDIdydqVXBUfBK1DxLEsmks6HA9ym5Y13VZ5ziGVrLi8whSj
         iyTp4VxMkDfXyiRhAsf27dgaiGL70RDeW28j6IS0Wzx5KxP9hNezxsmPAROpK0x9o8Y4
         W9XM+lKGxyq9xu50CoVGARETi2w0SGfDGNttRRScr8Ptub2w3xZL9iVpODCDJcBXQU3J
         q1BrjduK3bQzTOuzieD2IrFUhIRXSttrZjeYqXAbF1jJOcM7paIpO3Aa05aOXhO/rlFi
         dTj3khRrVo4JhQKSFXeGVKwkjOrBXykLPAN3scxn42wb6WdptiC9ErwP09Mk8rfr0QAe
         lw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499760; x=1743104560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1A2OLohCw6tV7LJ1/cg/Afzs5REC66QQgYuFKn7Obs=;
        b=vs0KNdhLmVdifzyO6Jts6UXrpo4qIxPEmNei1j/xl367gFPLnvIHygLgJQ7gb/dU/r
         u+eSMeQPJahAK0k7NsvfoJyF3KaHDYiBimBd4zXAiJsuce5kkFV4iU4fjUM2dFHQJjQH
         jpE0c9o7DlxeCrdJshAW+D9bPK4bp1Yt+VfWn9fl0jSg1aQC6NTciTJeXQATOWOdR0tY
         oa2gt++b4nvTMfFu5DGIIzQiStMf1qV1lk8w1vBEx8gvHAI5qmcdxNbMCUC9e9LsSa/S
         LrZSOUOrKsd7+QcZgZskPo1IM4k940NUMHjDtDIWtVankU8YIYIkltBu60DzqccZ3Iz/
         euOQ==
X-Gm-Message-State: AOJu0Yzdzw7EMpOPtOHXaHCsPlL9eLtiIaEdzRJwnurEFFyeMYOIfnbi
	l4PVL9qsWupNsj7oKD2H56x0iGZ/CFEKRpJgTc6n5T+e6A218q2x8fHA1hhiQKsUSRba7+bJX+a
	1XPQ=
X-Gm-Gg: ASbGncskJpkmZ71nVuYrb0UE6NYG6dMkkC5aH0DGf8EzaxH1TqLA5/obVR8RSzwllu8
	4Hpm9G6tepnrEmOxwKSM7+6Z7d2Uoe48CNaZJIYtbKblPb70kTIg9Ft9BZQNZt1mSmDCK7JMZ9p
	TFueA/17RkzQMVf8fEj/HMw+FlcYEh9Ifsrj5vzveCNQsfzoaAJb3g+9OdQXMsUB6UBPIyPYMmA
	0z1VQnXniHhZEjkNILicKSekT678HDAVR/mueAJAu9Q+JDb1bmtZs7gKW6O9RHnQqtQvKNTNH5k
	CSuKuplU27Sx4XRr8uKjz2NTQrxKQL4iSWHWo4Acz67UG3v0xIf9xgR8VA==
X-Google-Smtp-Source: AGHT+IGSb0jdF+GUsIEj620+4ctbFJYRWhG5h/WsSgGVNNDvAUjGFuYKVQa/USlU1r5DVYl2ukVdQg==
X-Received: by 2002:a17:90b:1c0d:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-3030fb216b9mr921847a91.0.1742499759801;
        Thu, 20 Mar 2025 12:42:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58c243sm4349169a91.16.2025.03.20.12.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:42:39 -0700 (PDT)
Message-ID: <798bcb21-a627-4578-a335-59920916e473@linaro.org>
Date: Thu, 20 Mar 2025 12:42:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] target/ppc: expand comment on FP/VMX/VSX access
 functions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-6-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 9OEgTXnJXMmg

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBNYWlubHkgYXMgYW4g
YWlkIHRvIG15c2VsZiBnZXR0aW5nIGNvbmZ1c2VkIHRvbyBtYW55IGJzd2FwcyBkZWVwIGlu
dG8NCj4gdGhlIGNvZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIHRhcmdldC9wcGMvY3B1LmggfCA3
ICsrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3BwYy9jcHUuaCBiL3RhcmdldC9w
cGMvY3B1LmgNCj4gaW5kZXggZWZhYjU0YTA2OC4uMWU4MzNhZGUwNCAxMDA2NDQNCj4gLS0t
IGEvdGFyZ2V0L3BwYy9jcHUuaA0KPiArKysgYi90YXJnZXQvcHBjL2NwdS5oDQo+IEBAIC0y
OTA2LDcgKzI5MDYsMTIgQEAgc3RhdGljIGlubGluZSBib29sIGxzd19yZWdfaW5fcmFuZ2Uo
aW50IHN0YXJ0LCBpbnQgbnJlZ3MsIGludCByeCkNCj4gICAgICAgICAgICAgIChzdGFydCAr
IG5yZWdzID4gMzIgJiYgKHJ4ID49IHN0YXJ0IHx8IHJ4IDwgc3RhcnQgKyBucmVncyAtIDMy
KSk7DQo+ICAgfQ0KPiAgIA0KPiAtLyogQWNjZXNzb3JzIGZvciBGUCwgVk1YIGFuZCBWU1gg
cmVnaXN0ZXJzICovDQo+ICsvKg0KPiArICogQWNjZXNzIGZ1bmN0aW9ucyBmb3IgRlAsIFZN
WCBhbmQgVlNYIHJlZ2lzdGVycw0KPiArICoNCj4gKyAqIFRoZSByZWdpc3RlciBpcyBzdG9y
ZWQgYXMgYSAxMjggYml0IGhvc3QgZW5kaWFuIHZhbHVlIHNvIHdlIG5lZWQgdG8NCj4gKyAq
IHRha2UgdGhhdCBpbnRvIGFjY291bnQgd2hlbiBhY2Nlc3Npbmcgc21hbGxlciBwYXJ0cyBv
ZiBpdC4NCj4gKyAqLw0KPiAgICNpZiBIT1NUX0JJR19FTkRJQU4NCj4gICAjZGVmaW5lIFZz
ckIoaSkgdThbaV0NCj4gICAjZGVmaW5lIFZzclNCKGkpIHM4W2ldDQoNClJldmlld2VkLWJ5
OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
