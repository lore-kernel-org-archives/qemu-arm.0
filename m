Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp13874njc;
        Tue, 6 Aug 2024 20:47:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuA4rGC2kpCuNXfEPnrVY6kVRsxu61aU4PhRpThqkwczR3tDOI7vEKR4PnTzgTBnqqD3wyz1ohWJ1x9Y3F9pqpPYmGw9Jp
X-Google-Smtp-Source: AGHT+IEq6qrKO7Cco/Z8eOUuIGBHivaVIADdGIUnHVyIkETky3ES7EYPeUh+6LD0lu05tixs57Rj
X-Received: by 2002:a05:6214:5687:b0:6b5:4e5d:7cfd with SMTP id 6a1803df08f44-6bb983e9314mr196760736d6.23.1723002455169;
        Tue, 06 Aug 2024 20:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723002455; cv=none;
        d=google.com; s=arc-20160816;
        b=VeKU9nY+5AgBOJc8INnIs6hqdh4ARIV6uMptUzrwnA9IzKWPf/TF2jd9RLNOnwPKTJ
         NepXIdC8kPzh9ylHEkBBInJ5oEhkV/hrSuPc9LIBZYfaojGR+y4qnh34bKBV984bAAXx
         2TwIKMc92guweJecCf2RrigBV/ThsmCtgP5wPdPUoYlvZn+roLyxcppb4dm9KL62aybo
         G3TN3di1xYzli+aDq+Yf9fU2K/7uRxjF8/sGIyTOn8luo/CkXDX70Rqb2MhobRRgnmJC
         YEK8KKuqpf6g1v5pSmc116Zz/5E8LJ4jbUjebjV/9ilun40jXxExwFf2aipSNm725pMw
         tzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rMePUQ3LpHJEeKd6TGojMj79dN1NpaAlqdu9z4L6pMg=;
        fh=4QyFpQu1XCHJQdIKLRcfvl9O8H27d26UsVKqio23ZP0=;
        b=GA9wi9nMIVu6/H/c5V5MVTJE+Puqf7J0Q/y5FYuDvjmsErmeCCozcwc28eV3+ptYhA
         Dp4tq8tsmucu1Z62zVNPxmFesZHi6gQnxxDbMSiXLGoClWUEU8F3EYm9/0VZjVJWMDPz
         XthKcV1vp3nfgKHwe6ms83zbTDI8mEtLwLgmC9vUDCv82cZc3JJgOJb/ETYXfg9Nb+qJ
         2CEP1lmlFIEd2W9qk71yZFlopMnP8LHHnb7zq5W8keoA8UshCP6DMYmVtmYFhHlpa3gY
         wycdiG5a/tTEEuadt1e0lE6jMRLy1XbnU/luN0M9wumj2rqWaAFRIDnsr/tutD/L4GOt
         G96Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rawmSzKx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8ee31bsi8813626d6.348.2024.08.06.20.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2024 20:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rawmSzKx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbXe2-0000UE-Eu; Tue, 06 Aug 2024 23:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbXe0-0000Mj-Ph
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 23:47:24 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbXdy-0003Pt-WD
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 23:47:24 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1fda7fa60a9so11735195ad.3
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2024 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723002441; x=1723607241; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rMePUQ3LpHJEeKd6TGojMj79dN1NpaAlqdu9z4L6pMg=;
 b=rawmSzKxD8heNbO5l2Tg++Y/Ll+gBB8wrFolyD4fvmAsWobTzD2pIi85WfVKFQbTMj
 uXcwwBlamgMRIQNG9bprF2qOxpW5scaqbgVRmTAGuFhvTeiq4QaNKJeQtErG9D68AC7k
 fDnJFiryvsXdatzCmJKCwi8qIlhrwnKBdgb7MRzgJiLH8jjHmSccB+gUpTYFJ/GVmzIq
 DAhPdIH/ZJZULOB95/CkvJJIDbWs3tJUODqrvJ3J9vpkgvyatW19XFY6u/lHGBWwWk+G
 f862P66eEkHB9IN8UduPy2z2j1C6RsWPvADZErd7ASN2LoahTAo7DZiFxwMi08B9MTMw
 qChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723002441; x=1723607241;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rMePUQ3LpHJEeKd6TGojMj79dN1NpaAlqdu9z4L6pMg=;
 b=NzkHA6+5nU5I8WxkdFRVZa6nEEUERGmRX89a0pjYYzKZr9eS8fIaakJ/L5ahSl5f5k
 zZVH6ycgJo9nB/2lS3SWGbePE9Yu6xpdw/jnKOUZgLq8bRiFSBzT2nIoGi7EY4LL4RxG
 fZ7Axx48FCtGaTdjL8xKGLycu+pr5a7xl1QSJxAlsVo9UMGKrJw8naPZ+0zy5MFCLEO5
 zV8v4JaT6qRRijbgNN93/wpXi36OX0o49fb99Qo/ppoDosZX96tSyl7b/RKzQcvYB79k
 SOmUNXd5fKmZYdS/LQx/kp9tQdU73hVm+PSsku9o38CuHfp9ljXXXUUJGlnyuLdOyzD9
 kEHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGI8VEZKG2yPus821Ws3pe8cWzv5QWdMTX4bi7kvhJR71OL8fq+mePqei8qEDwhaYEdWRa/S7VPncl/ij0JOdd+iqv
X-Gm-Message-State: AOJu0YzsJ4ziaHi0po0jaxUgE3uC+Ad9i/7C+NR5YI3/QQmmfc+Qcabz
 B+GlYNT2km/1Wqde8oQVgS78ipOvoRRkv8gzMbd4uQEGqtL2AAdRKR1dFHwZFHU=
X-Received: by 2002:a17:902:db02:b0:1fb:779e:4fd0 with SMTP id
 d9443c01a7336-1ff57294d1bmr199322375ad.24.1723002441253; 
 Tue, 06 Aug 2024 20:47:21 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:e01b:92e5:d779:1bc0?
 (2403-580a-f89b-0-e01b-92e5-d779-1bc0.ip6.aussiebb.net.
 [2403:580a:f89b:0:e01b:92e5:d779:1bc0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f19bd5sm95288145ad.50.2024.08.06.20.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 20:47:20 -0700 (PDT)
Message-ID: <4e45c886-cb93-4906-8559-65205703f52c@linaro.org>
Date: Wed, 7 Aug 2024 13:47:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1? 2/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240806141940.22095-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jj4XpcgKskIb

On 8/7/24 00:19, Philippe Mathieu-Daudé wrote:
> When configuring QEMU with --without-default-devices and
> not including machines using a GIC, the GIC model is not
> built in but the 'query-gic-capabilities' command still
> returns false hopes about GIC:
> 
>    {"execute": "query-gic-capabilities"}
>    {"return": [{"emulated": true, "version": 3, "kernel": false}, {"emulated": true, "version": 2, "kernel": false}]}
> 
> Restrict the command to when the GIC is available. If it
> isn't we'll get:
> 
>    { "execute": "query-gic-capabilities" }
>    {"error": {"class": "CommandNotFound", "desc": "The command query-gic-capabilities has not been found"}}
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2484
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   qapi/misc-target.json | 4 ++--
>   hw/intc/arm_gic_qmp.c | 2 ++
>   hw/intc/meson.build   | 2 +-
>   3 files changed, 5 insertions(+), 3 deletions(-)

Ah, nevermind my final question for patch 1.

Entire series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
