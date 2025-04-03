Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4304187njd;
        Thu, 3 Apr 2025 11:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+qI2K6+FhP8dfxkrf8i0f/cene0h8H6w0HHE359825ETM3QecRxt6Wy79xYO/CqfEZ9Bvvd8IbIxcJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH5Je9O/mqClegHSYPHlzlKrByt1h+SrGOXLDM2VEQyHxDLOOxUUJrg6/ByqNNNjBIgASG2
X-Received: by 2002:a05:622a:11c9:b0:477:6e6a:8143 with SMTP id d75a77b69052e-479247e6a71mr7258271cf.0.1743704343110;
        Thu, 03 Apr 2025 11:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743704343; cv=none;
        d=google.com; s=arc-20240605;
        b=GkV/tkmL4dbGiI/9mE+Wk87z/EyOyUZRYfN0SYbL+EwjKAb6eoucCT7RjWnzTOAhXC
         +Fl5neE3RpEwWfw3xQ9nMSVK3P4rSrH49H2+3R3uSEBkTAcObIL5HTUttPbk3nPVHgDw
         yOmdt0Jdrjc6tXEfB0gP41/R1YEpaund3hgDhSzYRVxPe27umbXgecuhntKqKx5OCcK3
         aYEUYL0+oVfWeZOEQcxvi8ndpWhGcYoEnw0rBSM+kKkEkZr4iR8oVZ5vhQtwl2mx7G3o
         pa54h58R/dASohsAXbprMbWH48ULQRliZwXseMzG2OCjYaXgtI4/Fe4LRUIp2kzsryRp
         87lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d4me9HSa79DpI9hViQaLRRFC0BhvU5qGtbgKvQDgaM4=;
        fh=8FjEjYou3jgeV63mJYcLEmdkH7l2ZkXE1WL0tDpZFUM=;
        b=DytXjQODJR3MPPX/tHh1dZunCX34QaYGJ0Eo56ToaNWSDkK4+OYE6o8pcmb39rLSfz
         RcC1WHj2Ss5qouym6Hd8ducDoNRq5hzDhuK0cQv8lV5laBOCrltoG5BQvNtSmvOayc8H
         RHw8CT6nVnM6F+DBSs/nVHO8UwAiOzDhd9IcBevt/0NJJ+uR8qqtc1rh0Nm+oqRY5aT8
         KuoAH5wcSl/amursj6WYGWT7wYnBOGMVfEG9iWRhQKoBTncpP4NMgDM5xvT3d3vnkYbz
         1RXpUwnkF65GeBRCBrfds8rUzEzvIa1s6CPK4MqKHicd3uXeytxwRiqF7Wm/Q/bN72Ly
         gb+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v09ceJrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b1c63c4si15612251cf.568.2025.04.03.11.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Apr 2025 11:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v09ceJrR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0P9M-0002ns-FA; Thu, 03 Apr 2025 14:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u0P9K-0002nZ-W0
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 14:18:47 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u0P9J-0001M9-BT
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 14:18:46 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-af6a315b491so1103999a12.1
 for <qemu-arm@nongnu.org>; Thu, 03 Apr 2025 11:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743704323; x=1744309123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d4me9HSa79DpI9hViQaLRRFC0BhvU5qGtbgKvQDgaM4=;
 b=v09ceJrRYHDn6zjpsfv/50TGqvvqxH8N3rpzWSZ9CCNjlOMYRu5e90bMjTALPla2r/
 iB/8xSEeolFptTNIKTcIb33dotFbkzYiAS0rmal4pJsLUaHQJCBAS7hVm2kHD06udxER
 TSTeahhEvImqO15kR0uU+wHl7J2aT16vlpvd/xga18LY1UgNldYzO5ZXBWmITH+8vcb8
 kRv18w1PPQgw/DI0LzVY3B6a2wMtaNj4Hql/MlXmr0xK86Vmy0cMhxdWkvwmvYxxsMXq
 XXwJYemEnJUnNYfRAIk3YtzNG/1EGWnClECHGSowYcDUJpUDhoVSrUOswZtud20FQb7q
 OH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743704323; x=1744309123;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d4me9HSa79DpI9hViQaLRRFC0BhvU5qGtbgKvQDgaM4=;
 b=rIfv8COScCmJzvctFiLwvHCPqn4/8bGjNNE+HHrdRkV9Y0ieZaXA35XO5qqr1XqmT1
 XNkAsxwZ4U9SWym6o0ksQNzfa+uhPeQsete27k3395xd2Xm9lN0Mo+QZKuD6fR8xl2z3
 2P1ykw6ef1RJ8XbxlvigRa2uWemlNV4UZJygL1q9P6zyFr0xfNvgTMzR7z6W2XMTL+wS
 0HaRv40mBHkggQPDZVaikut+6exBvCp2nKcyTFbLi3sM5bnWYnif/JNXL4gAOYPa/1h8
 +3JsmO0J1QWYw+nPmm6xQrA6zKlIZ8DXEyISgLKkkBZUHmHFxu1vxaggA8644VbXjmDW
 /kSA==
X-Gm-Message-State: AOJu0YyIKVrWLSA5km4eNPmbBPRuV4qegjADTf19qSgxqO0XsiFMOCTq
 7KJNS1h6ctk6ln2ugB9vqm4kU4eGh7QQvRRUv87yhluqcb3pZc26BfOE5+9p6K0=
X-Gm-Gg: ASbGnct1BoFQD8sAgTdGOkKIR73zQnaE0kq4aOiT8VrLyOB7Qy6OWc2MCahmVvU/ayH
 slJDCw+HRpRTHj9IZEAzItl6s9EpY7VyD0OaRAvLuXttIHNfFFIYLZ035yGih7uNZ4kbEylUih2
 1KEGlOfVTLCNEtc/V6nwX8oh8hU57JuxP4mocySKbFYsmueFAmOFw6pcAu43iFulp+w7k352E+0
 T6r36vaB4D7G+WM7Axz8A4PBVhLM+W8Wfri4eVWt8Sbu45VT9Ulv6tBtKvPCyfmjDzqtk3ZjGs6
 +nJT+0KPGWD7hyxBK6edPkd2jeFyWzYZeqitS7iRkaMQcJOSOeUseU/hEQ==
X-Received: by 2002:a17:90b:5251:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-306a48b3f74mr722833a91.32.1743704322834; 
 Thu, 03 Apr 2025 11:18:42 -0700 (PDT)
Received: from [192.168.1.87] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-305983bce79sm1851742a91.37.2025.04.03.11.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 11:18:42 -0700 (PDT)
Message-ID: <3aebe513-dd84-4cff-a191-97bc948aae01@linaro.org>
Date: Thu, 3 Apr 2025 11:18:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 00/13] arm: Spring header cleanups
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8mIrma27CD6y

T24gNC8yLzI1IDE1OjIzLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gVGhp
cyBzZXJpZXMgaXMgbW9yZSB1c2VmdWwgZm9yIGhldGVyb2dlbmVvdXMgZW11bGF0aW9uIHBy
ZXBhcmF0aW9uDQo+IHRoYW4gc2luZ2xlIGJpbmFyeSwgYmVjYXVzZSBpdCBhbGxvd3Mgbm9u
LUFSTSBody8gY29kZSB0byBjb25maWd1cmUNCj4gQVJNIGNvcmVzLCBzbyBub3QgdXNpbmcg
dGFyZ2V0LXNwZWNpZmljIEFQSXMuIEkgZmlndXJlZCBzb21lDQo+IHBhdGNoZXMgY291bGQg
YmUgdXNlZnVsIHRvIFBpZXJyaWNrICJidWlsZCBody9hcm0gb25jZSIgc2VyaWVzIChpbg0K
PiBwYXJ0aWN1bGFyIGFybV9jcHVfaGFzX2ZlYXR1cmUpLg0KPiANCj4gUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgKDEzKToNCj4gICAgdGFyZ2V0L2FybS9jcHUtZmVhdHVyZXM6IEluY2x1
ZGUgbWlzc2luZyAnY3B1LmgnIGhlYWRlcg0KPiAgICB0YXJnZXQvYXJtL3FtcDogSW5jbHVk
ZSBtaXNzaW5nICdjcHUuaCcgaGVhZGVyDQo+ICAgIHRhcmdldC9hcm0va3ZtOiBJbmNsdWRl
IG1pc3NpbmcgJ2NwdS1xb20uaCcgaGVhZGVyDQo+ICAgIHRhcmdldC9hcm0vaHZmOiBJbmNs
dWRlIG1pc3NpbmcgJ2NwdS1xb20uaCcgaGVhZGVyDQo+ICAgIGh3L2FybTogUmVtb3ZlIHVu
bmVjZXNzYXJ5ICdjcHUuaCcgaGVhZGVyDQo+ICAgIHRhcmdldC9hcm06IFJlc3RyaWN0IGlu
Y2x1c2lvbiBvZiAnbXVsdGlwcm9jZXNzaW5nLmgnDQo+ICAgIHRhcmdldC9hcm06IE1vdmUg
c29tZSBkZWZpbml0aW9ucyBmcm9tICdjcHUuaCcgdG8gJ211bHRpcHJvY2Vzc2luZy5oJw0K
PiAgICBody9hcm06IEluY2x1ZGUgbWlzc2luZyAndGFyZ2V0L2FybS9ndGltZXIuaCcgaGVh
ZGVyDQo+ICAgIHRhcmdldC9hcm06IEV4dHJhY3QgUFNDSSBkZWZpbml0aW9ucyB0byAncHNj
aS5oJw0KPiAgICB0YXJnZXQvYXJtOiBFeHRyYWN0IGZlYXR1cmUgZGVmaW5pdGlvbnMgdG8g
J2NwdV9oYXNfZmVhdHVyZS5oJyBoZWFkZXINCj4gICAgdGFyZ2V0L2FybTogQWRkIGFybV9j
cHVfaGFzX2ZlYXR1cmUoKSBoZWxwZXINCj4gICAgaHcvYXJtL3JlYWx2aWV3OiBSZXBsYWNl
IGFybV9mZWF0dXJlKCkgLT4gYXJtX2NwdV9oYXNfZmVhdHVyZSgpDQo+ICAgIGh3L2FybS92
aXJ0LWFjcGk6IFJlcGxhY2UgYXJtX2ZlYXR1cmUoKSAtPiBhcm1fY3B1X2hhc19mZWF0dXJl
KCkNCj4gDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2
aWVyQGxpbmFyby5vcmc+DQo=
