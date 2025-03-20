Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1195661njc;
        Thu, 20 Mar 2025 12:42:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3381:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-1fe42f74fdbmr1136466637.15.1742499769901;
        Thu, 20 Mar 2025 12:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499769; cv=none;
        d=google.com; s=arc-20240605;
        b=W7omkwDu6EkNk8cX/0mA0kujLW82Xi+hecKKLi/pAopuxyhqctyW5MjrCS9E8ojmAQ
         d4wLyY4kHm+Bs8qCtltV1ILtyz8Fi5z4Pt5ZPtr1Wwo692ZtB/qrsV4+k+UhTjszLDA6
         Nq1nEul295tzxN7haIEHyJAw6Y7nQBUOfaTaE7J20cuVB/V5Kgnt4ey4UYiL80dwX1v5
         ISLv0Wm8azD5WsFMBFW2to4SWCkrtddCVhELJLMzdTGWd4saZHC6doTbXiF/aZOp7ESI
         5Ska+dzPfy/+viirSi5dVHfeI5olR8ZTYCF3/5GihCjNJM+WacdmAjs9jtBEyKlx33XZ
         rO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G0AEfQRk1HyxDN1rNugcfjkcXy9GNLJe54yuEZAkHSg=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=k3Ngt+g6t8FmJhzImf0ckrUSYq5N7uzgQQqHfoeB+JX7tjsfw2C1CbwKIza38oZujZ
         Qd5NRreqe/+yAHgxMSlcPObM+xBNlLW/zWsyma6EaMe7EZrE8+5SfSPOeB6U6hocZly4
         5nC7Pow6Hyi6KSCNG2Z55I7D2s2KL474KW/oqGggqZAwmf8+RdEAPnJrrDHdZD6be5WO
         Eae/Ic3OQf+MYvUPPp704evoRkdLqee48tZONzqpKhBdK3jaVZgrRqphBaswYzPosGED
         k4w8TuM1d5don/uAkeFx82ufKyPkXUyyxmB14OoegeLS6MtgNRwyjO34jx0XCTPU2oi4
         SCOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T3jIUrRI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905fd31bdsor163151b3a.3.2025.03.20.12.42.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T3jIUrRI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499769; x=1743104569; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0AEfQRk1HyxDN1rNugcfjkcXy9GNLJe54yuEZAkHSg=;
        b=T3jIUrRIpv6P74NmRFDTP2ITsutRaJyGdxh2wbDBSJ8Ib4nHXkOUuHY9jYcsFRHZeI
         x4rRBya6FtJWqUWQZeHqc8hVOrV0ghK3WKRffrosCJhFWPXLqQowg3i2t1beDkaTKDOG
         evxpKM10AUx57ALJuXSdSKCkzh/YfMiJdrAN0GEE1+SKe7/ZOhbHR12Wp+w1ckF9qLTZ
         NIZqSp0tkqQgcNwomGXlkbXYwdO62SM4Pj8FP7iQ+eaOmIGONL2/F+jr7GnNHhqJDc4h
         ljw++IP74Y9N7ZHwQIxlM5Ppz6Ov6gCbrcX2nC5ZkB78rQOh2AemWY+FctJkRK1Zxgrs
         UsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499769; x=1743104569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0AEfQRk1HyxDN1rNugcfjkcXy9GNLJe54yuEZAkHSg=;
        b=HypR9HeTTia4Jd7aMRdm25wrsed3sdo/gid4VTzkdjSACxc8EMa5Cd+yiTm3Gzf1eE
         RVt/1KYvGnJq/0VdWmO1jDs+VDo38y9M/0yAlrbuUdrTavQCj4JaXp6AWPos33nWwDuj
         2Ne3SSZvIaQxIQbRbMxpqYcDSc6A4IHmpThWEsyQkF4KwwSPinJvyZiL28Brn68wxkKF
         yz0BGVEcnc6FBMz59i0WGASu/4IC33A1+UxN8Gw2O81BD8p+pRF+R8DgVKayyFQ1S8ga
         +iVKtq6VTugbNzllZhtKH6AzDtcchWolXwFQQnSWlGTd+F5RdB8vWGQK2F7IpuR3AgAV
         3cYg==
X-Gm-Message-State: AOJu0Ywl5ralbGFzdZeqSmFmqllNwtRTjY9G/OaSGE4v+3rN+QC15Rv3
	9wcfX5Vf7l92dWuyYvhyiL/eE5fxmp3E4rLWUizJTC3hHzAVyUiLXuWRprD6blHOkjGLLeBP0pj
	ir4o=
X-Gm-Gg: ASbGncuxGyWhXZg2z0bxWJenyEBlwEIUqmOtS7teOovFXBhn7LU2qi/m/9Y12zU6u7+
	C+QUxsI+ls12hL3efIoOBwhZPauPqxiECJq+nN+ELuReZvVQt7ZXpQTnV2EWapXx1VC2FsLdx4e
	Ql23aYOsLmS+9bDQsWB2ikqSLrKHzq3La3H59J0FP2T7V3nauKGQTON2KO6qZliNbkVhFDv4+Mv
	UKVwX9GWQFYzFPqewt1AiPRpU8XCMzkpyuXurCkIc5Bx8WdHjW95S3EOEZysq5VMvi4Tou7L8sx
	E/sYyV0sUXDwpG69Af0qKt754fGsPoG2ny1kjq25ePm6/HHxuQO9M5y7ow==
X-Google-Smtp-Source: AGHT+IFgJCbMzTGbeWoMX//toeZsQ5JHXO+vw5ladHiYw8vEcgutw76JIuyJHKEsluDQEpheraunHA==
X-Received: by 2002:a05:6a21:9185:b0:1f5:6e00:14c4 with SMTP id adf61e73a8af0-1fe43477c1cmr948910637.42.1742499769410;
        Thu, 20 Mar 2025 12:42:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd6557sm217847b3a.64.2025.03.20.12.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:42:49 -0700 (PDT)
Message-ID: <44b007cc-f7ea-4191-a911-c5c3984df99a@linaro.org>
Date: Thu, 20 Mar 2025 12:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] target/ppc: make ppc_maybe_bswap_register static
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
 <20250319182255.3096731-7-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: IeGUzO161ayJ

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBJdCdzIG5vdCB1c2Vk
IG91dHNpZGUgb2YgdGhlIGdkYnN0dWIgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgdGFyZ2V0
L3BwYy9jcHUuaCAgICAgfCAxIC0NCj4gICB0YXJnZXQvcHBjL2dkYnN0dWIuYyB8IDIgKy0N
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9wcGMvY3B1LmggYi90YXJnZXQvcHBjL2NwdS5o
DQo+IGluZGV4IDFlODMzYWRlMDQuLjk1MGJiNmUwNmMgMTAwNjQ0DQo+IC0tLSBhL3Rhcmdl
dC9wcGMvY3B1LmgNCj4gKysrIGIvdGFyZ2V0L3BwYy9jcHUuaA0KPiBAQCAtMzAxNiw3ICsz
MDE2LDYgQEAgc3RhdGljIGlubGluZSBib29sIHBwY19pbnRlcnJ1cHRzX2xpdHRsZV9lbmRp
YW4oUG93ZXJQQ0NQVSAqY3B1LCBib29sIGh2KQ0KPiAgIA0KPiAgIHZvaWQgZHVtcF9tbXUo
Q1BVUFBDU3RhdGUgKmVudik7DQo+ICAgDQo+IC12b2lkIHBwY19tYXliZV9ic3dhcF9yZWdp
c3RlcihDUFVQUENTdGF0ZSAqZW52LCB1aW50OF90ICptZW1fYnVmLCBpbnQgbGVuKTsNCj4g
ICB2b2lkIHBwY19zdG9yZV92c2NyKENQVVBQQ1N0YXRlICplbnYsIHVpbnQzMl90IHZzY3Ip
Ow0KPiAgIHVpbnQzMl90IHBwY19nZXRfdnNjcihDUFVQUENTdGF0ZSAqZW52KTsNCj4gICB2
b2lkIHBwY19zZXRfY3IoQ1BVUFBDU3RhdGUgKmVudiwgdWludDY0X3QgY3IpOw0KPiBkaWZm
IC0tZ2l0IGEvdGFyZ2V0L3BwYy9nZGJzdHViLmMgYi90YXJnZXQvcHBjL2dkYnN0dWIuYw0K
PiBpbmRleCAzYjI4ZDRlMjFjLi5jMDllOTNhYmFmIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQv
cHBjL2dkYnN0dWIuYw0KPiArKysgYi90YXJnZXQvcHBjL2dkYnN0dWIuYw0KPiBAQCAtODEs
NyArODEsNyBAQCBzdGF0aWMgaW50IHBwY19nZGJfcmVnaXN0ZXJfbGVuKGludCBuKQ0KPiAg
ICAqIFRBUkdFVF9CSUdfRU5ESUFOIGlzIGFsd2F5cyBzZXQsIGFuZCB3ZSBtdXN0IGNoZWNr
IHRoZSBjdXJyZW50DQo+ICAgICogbW9kZSBvZiB0aGUgY2hpcCB0byBzZWUgaWYgd2UncmUg
cnVubmluZyBpbiBsaXR0bGUtZW5kaWFuLg0KPiAgICAqLw0KPiAtdm9pZCBwcGNfbWF5YmVf
YnN3YXBfcmVnaXN0ZXIoQ1BVUFBDU3RhdGUgKmVudiwgdWludDhfdCAqbWVtX2J1ZiwgaW50
IGxlbikNCj4gK3N0YXRpYyB2b2lkIHBwY19tYXliZV9ic3dhcF9yZWdpc3RlcihDUFVQUENT
dGF0ZSAqZW52LCB1aW50OF90ICptZW1fYnVmLCBpbnQgbGVuKQ0KPiAgIHsNCj4gICAjaWZu
ZGVmIENPTkZJR19VU0VSX09OTFkNCj4gICAgICAgaWYgKCFGSUVMRF9FWDY0KGVudi0+bXNy
LCBNU1IsIExFKSkgew0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJp
Y2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
