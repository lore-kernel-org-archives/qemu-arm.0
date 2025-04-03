Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4306266njd;
        Thu, 3 Apr 2025 11:22:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDyMwmzKqyA1dELPn7MnG7uOns6isOQO+03LhTJObFsqio9TdfW3SmZk7EgPQZ1aUFqinTxcVpdg8O2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEIMYPLlHPdObi9kTjOKQqG3BC/YpCK9bCeosYkOpW/rxqrhfLYVX9L4Hq3lw1EZ3nEJQdl
X-Received: by 2002:ac8:45d1:0:b0:476:98d6:141c with SMTP id d75a77b69052e-4792491d613mr7148521cf.18.1743704570043;
        Thu, 03 Apr 2025 11:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743704570; cv=none;
        d=google.com; s=arc-20240605;
        b=GkBBBtN28ANQZMZ5FxKZSTDCwEmdlD8azwVdo+DDAyeilL24xBRgGLcip/R6DMTINk
         bntluhEGxf3ktUgs27VbvIzdbU52338gmggZIuRHf0iFmul53ZEVEsl3D9fQ50yWbHPD
         y6pzcfJpREoN3j4dRKzcpmTq6illLThrB5hiy13bs314dVNwdYi0t6bNlHFAAZnRhZmC
         jKUQNWhoE6iUSgKr/eLLlQhphEIHPQ5AHI0K8VBKvwj+5EdjwdVSXnrlqhhoGlYnj3mR
         3KmjzCtSEnTNTj9eOwC5A46Tj0cFzBYBVhbwG8sVOFO5YKeRUHDb8JAgylagzkKqtgbZ
         5zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8Ir7/JHdNyExaAATw5WuR3k8dp564h4khHdSuzTycVI=;
        fh=8FjEjYou3jgeV63mJYcLEmdkH7l2ZkXE1WL0tDpZFUM=;
        b=TfQJXgFuQxdtQopmu64LXgrJBjty+sz//A5ldWJtocJfdiOyiIzOtVN6piHAKm7VAR
         jmvvqn9YFJBaweIIJezz5KkD6V4SZThYkoFAyUIa+prp+ESetTJ2a/3OtLyzNmXXvWY5
         1jKiyqg2WHvmsk07X9PRNJqvthTYz8J+WkuunXW9+BgUE3IVQ14f6DOlDq7JAuTb4ZY5
         ywN0xr+RBJ3bC1g7GWXchZ0aZFir6tE9FPJo7DWzX/FRTfUAkVr0OoUtfPp3ZxzockiS
         MrcRRCChDoiGjgNuvCOH3srq39tdpzMVF28529Hn29RuvGWq11E9MQwwNRFpojGbQQv/
         vtLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NclNRrI4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4791b05cce3si15300491cf.66.2025.04.03.11.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Apr 2025 11:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NclNRrI4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u0PD9-0004M1-JL; Thu, 03 Apr 2025 14:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u0PCx-0004Jo-Ll
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 14:22:32 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u0PCv-0002Do-Jl
 for qemu-arm@nongnu.org; Thu, 03 Apr 2025 14:22:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-736ee709c11so1113264b3a.1
 for <qemu-arm@nongnu.org>; Thu, 03 Apr 2025 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743704546; x=1744309346; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Ir7/JHdNyExaAATw5WuR3k8dp564h4khHdSuzTycVI=;
 b=NclNRrI48j5hzUvDuiFK/4cjnyDkBnVKMF7uW2HbhZF+GYc0iHgJZOAmYbVPv1zepo
 AeIk01ve1EKj14CKWhi5gzKCeytNjC9TzIqBlbaeDfhPijgd+cvWVJdbYZZuFmz22Xqh
 IrB7bpXVP/CRIlBLeXWIqOTTKF2U7ptgBWwjDxfdzjzc+J6kPI+AoEj7NsmPZNZJvENL
 00MRaW1MK0mBh1i+UZzjvHxtB4FAoomRikL/osxGDAHqqUWX6BcU82+8FfHXSRWxTZJv
 x+yzioGsweZdKTUH6c/CDLrIW1jjcGVbWu3qpWZpBOid4m+264x7OA3oisvM/k3wAmcd
 JgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743704546; x=1744309346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Ir7/JHdNyExaAATw5WuR3k8dp564h4khHdSuzTycVI=;
 b=V1brIib2Pub0cv00KF3DtgMAKK2czwppYsZXeHVjBJSBj3zUy/y6DDPLq37hP98XwF
 BFzGC0ZvrdmPQQgNbRP7cT4ur5WlIj2vBvMF/FCh2xQef/vtwOCabbgYaIXw+QKDdf3L
 oB9CXkFkSyWUYosfqJKUwVaAbl2AQ+kwsKKRwYhzd1jsOdvcahsi8BPraVWaUyOPC0QI
 drkBjGafG9rabxt7u9Migut9lvr96TyvfIJ5fKTsdf4uVBfFFIQ/kAgfChxWkFN4w5Qf
 enhyw9DgA24z59Z+c4pjJ5KY9dZXfhrNLB9rLrH5Vf+W35FPxovRDDsfU+5/FnozUs26
 nQ7w==
X-Gm-Message-State: AOJu0YyPJKdK24uTQKcfXCRLa6wrcZGMzNENdDVT/R21XTJrUdG039eR
 rw0yfWalg9z/yvjAQUiRQa8tUqPKFuaKjCt1sxLN1DBK+HuawG78Z/6X8czPCgg=
X-Gm-Gg: ASbGncvtIIVtk8LA2MZfgq1svzzSmRoaIuaTyCkcpXaEKKUbE6Ui6BzNMXDuEq2tchh
 QZ8XJHI6hHC/GSg5+9/dlIjh2lgFxMcoP0ntPqyfBhQl+nOuzXBAcGEnRO85wPvS5EQgN0RKUtc
 UmjSYNBKKQtwdrx9z/GX8oORvqvU7+NJ8//BWP+Rzb5wCNJqnCrhgdHMpjs+q6jLKS7iaj/nBZn
 7QdLfNG8yh3NqJV5ZAPDz5SXLDaHrFMORZ+gqajpRhe/zuyLA3o1+lfIo4deq59Y9ZloAfqhWwv
 8Rte2AzzhNzEk+f1SPJlJAds6Lvl2bMApU5XlKsiYLQaVKRxBqYjrRtoIIGrrH7a4he9
X-Received: by 2002:a05:6a00:2e16:b0:736:69aa:112c with SMTP id
 d2e1a72fcca58-739e4b4d68amr591974b3a.9.1743704546590; 
 Thu, 03 Apr 2025 11:22:26 -0700 (PDT)
Received: from [192.168.1.87] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0b3f5asm1863924b3a.131.2025.04.03.11.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 11:22:26 -0700 (PDT)
Message-ID: <cecbab0f-56f2-434a-8508-8a4df2992259@linaro.org>
Date: Thu, 3 Apr 2025 11:22:25 -0700
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: XY+rAnf3bp3B

T24gNC8yLzI1IDE1OjIzLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gVGhp
cyBzZXJpZXMgaXMgbW9yZSB1c2VmdWwgZm9yIGhldGVyb2dlbmVvdXMgZW11bGF0aW9uIHBy
ZXBhcmF0aW9uDQo+IHRoYW4gc2luZ2xlIGJpbmFyeSwgYmVjYXVzZSBpdCBhbGxvd3Mgbm9u
LUFSTSBody8gY29kZSB0byBjb25maWd1cmUNCj4gQVJNIGNvcmVzLCBzbyBub3QgdXNpbmcg
dGFyZ2V0LXNwZWNpZmljIEFQSXMuIEkgZmlndXJlZCBzb21lDQo+IHBhdGNoZXMgY291bGQg
YmUgdXNlZnVsIHRvIFBpZXJyaWNrICJidWlsZCBody9hcm0gb25jZSIgc2VyaWVzIChpbg0K
PiBwYXJ0aWN1bGFyIGFybV9jcHVfaGFzX2ZlYXR1cmUpLg0KPiANCg0KSSdtIG9rIHdpdGgg
dGhlIGNsZWFudXAgcGFydCwgYXMgSSBzZW50IGEgcmV2aWV3ZWQtYnkuDQoNCkhvd2V2ZXIs
IEknbSBub3Qgc3VyZSBpbiB3aGljaCBjb250ZXh0IG5vbi1BUk0gaHcvIGNvZGUgd2lsbCBy
ZWFsbHkgbmVlZCANCnRvIGRvIGl0LiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgd2Ugc3RpY2sg
dG8gbWFuZGF0b3J5IGNoYW5nZXMgZm9yIG5vdywgDQppbnN0ZWFkIG9mIGFudGljaXBhdGlu
ZyBmdXR1cmUgbmVlZHMsIHdoaWNoIG1pZ2h0IGJlIHJlYWwgb3Igbm90Lg0KV2UgY2FuIGlt
cGxlbWVudCB0aG9zZSBjaGFuZ2VzIG9ubHkgYXMgcGFydCBvZiBhIHNlcmllcyB0aGF0IHJl
YWxseSANCm5lZWRzIGl0Lg0K
