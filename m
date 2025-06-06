Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp782425njc;
        Fri, 6 Jun 2025 01:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1hUXVs/jQWxpAZN6TbbZvgdMRRzCC3OZ8bP6lt4CtI1hihKSxaNNfkA/rPfTeYbfH8X7LNE+TyX3mfw==@linaro.org
X-Google-Smtp-Source: AGHT+IGGzwfjlj3Huowby1n6+VJlRbXD7kFLSf1abVkTPE2Ex/kQ6FGPMVwdKTL6qG/QDU/d2fO2
X-Received: by 2002:a05:622a:591b:b0:4a4:4166:6646 with SMTP id d75a77b69052e-4a5b9a05843mr50826141cf.4.1749200012672;
        Fri, 06 Jun 2025 01:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749200012; cv=none;
        d=google.com; s=arc-20240605;
        b=PBxzhKUP6MV/js9PMkBt6k0Gy4z1ZzO2YAYk2hAGGWDFXJWsz9D/iCEFHiaVYYoqwC
         NDsGIt6oEJvohpp69eaw4T1kI6cy9WVw+jLEkrSlHzd/loIgj0mH9I6/c/hC5X83p6IZ
         SnVHoe9jwTZcuGr7X5MLDnaN4tdMJ7F7grKqDFveu7NCsjp0Ej0mxLa27sZdGWENlimk
         QOmRkr9BYH6kKmsuuExnwRYcIRmmEC8Qcg+sLy0OQC0mqLBL2+vegoliySOsoqGfqYwq
         aLxbJF0sT91xFcm0Szc4JwrnXiR1xXLyXH4b1QvN3HFWJnfPhayosyCU9iNuGReQZ27h
         /lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aR0oWFRYp6PORWHRUJow1gQr4dzui71+QM7wq6vxm3g=;
        fh=+z9udM67uj62iwHXCFK2iCfaxFON8DeK4+yNjkJiKRE=;
        b=Ja2j4oT4nxezIquLaG8h9InpYloeWD3rTFqJYUAKxh0M7Eg9RBYrkeOmK0mAT13aSQ
         1BnLCPJsn6TfPI9cF6IYmhJ+RyyXrJUiEyiTYIjX57cqSoaeWczm1YhuJc/M/z73VPN/
         XWGQCheSnT8+mUYIU4rJ/A+mYvZxpnOrHt3gKZ3KHi8ut3iTtfVx0YOTHBeig+Vlw94k
         DZHD3DF1/hVrzhq8g42R7enA7CAlZZnWwawZGZyEvyD4sy1cHfsWIIggz/qE4lXlOg42
         9kg0rm15g3XmsuH+61vjq5SlqmBmYJEkl6Tz9Myt3LGzv0c26O9bC/11hYwweY0IGEDq
         s5QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5uFpTGh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198cece7si11980411cf.656.2025.06.06.01.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jun 2025 01:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5uFpTGh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNSpH-0004sB-7S; Fri, 06 Jun 2025 04:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNSp8-0004rL-CU
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:53:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uNSp5-0003xk-Fw
 for qemu-arm@nongnu.org; Fri, 06 Jun 2025 04:53:13 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1359320f8f.0
 for <qemu-arm@nongnu.org>; Fri, 06 Jun 2025 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749199989; x=1749804789; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aR0oWFRYp6PORWHRUJow1gQr4dzui71+QM7wq6vxm3g=;
 b=e5uFpTGhS55pz0K3gOs02MptkCna1C0FZpdDCWxDyFm7os8FbUWu3pl4OGJzkF+5vd
 YpJvUaztl6pyrN07W6sY3VcW2pi+WnzU7kwulbsnWt0tmWLw3trtjV+syti1LD97Kxhr
 wViSH8h2IC++ktNDoWCMYkQYng5+J4FPx4FjWv6zTDMrrfilojQcYlYrrwqg66buBj1W
 J/1XefmK44RfVeB6b7fODPfaJMnhkdx7Cc1CK2BBxSmvzEBT3MYppnqpI6yQJEyV7nfn
 0lAI0Zv7m1uBY45CVOws6/XgJhsfXDnaUv8cmvXEeWfT8gREwau7IS3UB0BcTvYUyXLJ
 1ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749199989; x=1749804789;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aR0oWFRYp6PORWHRUJow1gQr4dzui71+QM7wq6vxm3g=;
 b=v8w70pZJa5j6mBwQk8ztJvwkTc45NAmcu0AZDNcmAhJ+1YwYMEwhVzrGL2Dnyh9ZDs
 kKQosXX3wYmjbPII+XlA50ZWHcuUMC1UUVSUQZtG8VHgb/SZpItzrm6ilDzdjS/k8/06
 GuPRGIsPMQ5kKJ76gDHX8Vk3LJSdZvE6JtkSgYJoa5iV7arTp76eUueoEF1dbQCp0aps
 I1oSE/Gr2BQHt8eR/+VXvhnioJMY4Vx8AQ8+YQq8CI1hTuWrUeT2wpNzoketjwApbdz+
 DdCz+REM841l1+ynppqX31+EXV76PsUoPqJoA2xLDWDD4SHX3nuN0ukIMl6KIjHHVvjw
 dsVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK458YRIhOcu6Ih5LQDJerDWpJ5EKaq+TjKyFI3uFUKeCMg9Xuh8V2g8+3Mh5E8p5xVlQ9ck0IEA==@nongnu.org
X-Gm-Message-State: AOJu0YyXu7nvfVP2maKYy8OJH38RU7Q4KU2OhAN/FjvSElFyClB5T6+K
 nvDGThQTm38zk5arnHizDgI5SUqAeM33tq8AokrVijTNKz5Yi0CMeICSUCgYtmjTvF8=
X-Gm-Gg: ASbGncuxLpm8xtBydu5EoBniE/LeSnWTxkhQEgibmNHhEAhEG5r/G7E33qwTqyYnkSb
 OZWssBEWrvC11WpsnYhwJ2zj89SJypPOArO+M4FYiE/CiXE9TyGlBFqo1c/uO7RR5mKe0aW0VMV
 vBA6K8iUvGAE6LdqNnJOOAj8ufL0s4FKT/vyz9dV/2wcrvc2tc5XTR2e2h0X4wD/+4kRX8y8RNE
 lANkiqAt6nX3tMZ6fV/BqeqrBBwIYNpl0RaA0oDQgNPtory7JkPupU7WARL/Q5b+UEBc7Xlptss
 2rWEWEm2IaBo4QrzwRO5GD0MMZ89JAtwYTy27760qQ4WnVFWvPAmb6Wh00jSz5tZuobeUu0IUDc
 lOEoNH/wMEq8fFsfDSV8xcpYQE7br9Q==
X-Received: by 2002:a05:6000:26d0:b0:3a4:f70e:bc25 with SMTP id
 ffacd0b85a97d-3a5314412b1mr2468223f8f.27.1749199988602; 
 Fri, 06 Jun 2025 01:53:08 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244ed76sm1234515f8f.78.2025.06.06.01.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 01:53:07 -0700 (PDT)
Message-ID: <23897d70-b747-4c2b-ad71-e521ffb4f4bc@linaro.org>
Date: Fri, 6 Jun 2025 10:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] system: Forbid alloca()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250605193540.59874-1-philmd@linaro.org>
 <CAFEAcA9WF75iiL8WmcTYQ2ph7NLuMTXtarPp6HouEZ_nHhg1EA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9WF75iiL8WmcTYQ2ph7NLuMTXtarPp6HouEZ_nHhg1EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: eVEeU/cQ3xxn

On 6/6/25 10:37, Peter Maydell wrote:
> On Thu, 5 Jun 2025 at 20:35, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Eradicate alloca() uses on system code, then enable
>> -Walloca to prevent new ones to creep back in.
>>
>> Philippe Mathieu-Daudé (4):
>>    hw/gpio/pca9552: Avoid using g_newa()
>>    backends/tpmL Avoid using g_alloca()
>>    tests/unit/test-char: Avoid using g_alloca()
>>    buildsys: Prohibit alloca() use on system code
>>
>>   meson.build                 | 4 ++++
>>   backends/tpm/tpm_emulator.c | 4 ++--
>>   hw/gpio/pca9552.c           | 2 +-
>>   tests/unit/test-char.c      | 3 +--
>>   4 files changed, 8 insertions(+), 5 deletions(-)
> 
> There is also a use of alloca() in target/ppc/kvm.c
> in kvmppc_load_htab_chunk(), so I suspect that patch 4
> here will break compilation on PPC hosts with KVM enabled.

Oops sorry I missed that one :/
