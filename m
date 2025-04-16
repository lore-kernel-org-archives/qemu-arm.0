Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp245465njk;
        Wed, 16 Apr 2025 10:14:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh3zIMzfL2N9CvCt6STuk95JapX8xz5AfFVZhBWzqlfZxnr4nV49/x2i6XyowVyNolJZhAVMODmsXFhw==@linaro.org
X-Google-Smtp-Source: AGHT+IESMoLhZnDuu5W3lVT3BpaY6KWVpzqC1vqpx4xREik4vSpotMiaq5BWun6cZkXuY4ZxDxJ0
X-Received: by 2002:a05:6102:675:b0:4c1:935a:2446 with SMTP id ada2fe7eead31-4cb592e4ab3mr1898958137.19.1744823659100;
        Wed, 16 Apr 2025 10:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744823659; cv=none;
        d=google.com; s=arc-20240605;
        b=Ybs8op3DMRANJRvz66b/ZYdUz5XkBe8gINYP7lIEMP7g/ly6QSt1kSTfF3AiOJkWyS
         cm+LkJdEry7VPacs8ePEZv6CXIXmnzMdaUzkTq8UYb7d6T7lYCJC2CsIHteXD2iKaiSP
         dDECOTkSlQgqEnM2lmTcK5QsDQZouZbDOCzGzWzg3Zr7AglcUfNVh0qF+aGBJuWDaYRx
         1A9g/KHlIcv/pLAZhsVdR+myhvGFvz9WnTZJki2pa9ynPI1jAU+yjY9XxGbozE89ALIo
         9ic+VYfJv3jVNsxV8R4xoAn5Uj/byuo41iioQT1r30HhuasPI2/ioi2hSwbifUXjsMMm
         4YMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wa4KAGukhNqJEA5YzTqcGsVsMUfMRq1+94sJWEHIve8=;
        fh=ZNA9s3B/gNtCfGT0dYavj/4QDhiZKbyiyFWdfIGBUr8=;
        b=MwuKcE04TMU4cC/4xc8r1t3KKa9dAUP5rl4rNQYm/UMMwXriD9dsjqL+1YwMICUpTi
         cPsv0fbfrOE8kxuTvt230Ko1kFncH9jlFn8Fe0Ie6iYlV1fuJOarUcbpCGrOmfqDOZZu
         THOrRaI6O2/qwL7UsK1aDxFIAkunjKTIT1CPvhQ26GiHjDsrUxMOgcnmoIj29ncXl+XH
         yPc7V7TQED8giXeq8uOkxp3jKgJOiHhf1c2otlpRM2t2hEdchmeixJLTlKun+OOb67eo
         dDYMgrWA04ylKLX5tYjZJbNAcjElw3Ye89FQ02i302uKfTijLuRvz/epEvZa0AcZ9yeW
         DHwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtUq+cpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4cb6020d4edsi321093137.598.2025.04.16.10.14.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 10:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtUq+cpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u56KN-0006OU-Nd; Wed, 16 Apr 2025 13:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u56K7-0006Lz-G0
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 13:13:25 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u56K2-0005sE-Kt
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 13:13:18 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so6035954b3a.2
 for <qemu-arm@nongnu.org>; Wed, 16 Apr 2025 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744823590; x=1745428390; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wa4KAGukhNqJEA5YzTqcGsVsMUfMRq1+94sJWEHIve8=;
 b=QtUq+cpylTj27mn8hYhcfrOoqsAL98OtrCPoE7h/cwOStqcsQBj0tFDwyzYCJ58MTI
 uEdcBQFzQivGbuZqzc521DljZ3IiwYkzu1Ubn3eNjx75GeDfZK8fY/4+1qZUquBdR22e
 Zooe8098DsZzreuOxANQ1kXqCFw+3L8O0E1uDVWfZeQApNsF52kLXZfNbEXSe3c1v1Rz
 zHhpn3wy4Yg1FbbJdYk1gCWcSTZ8AcV58lnR+AeAesKRFySqM1gs2yxeHJkzWs7qAgcG
 cmsq1fIh0RMHW3u/RUSZ7MR9QYIPEyJvT2oPRzVrir7hdTiqF3pvVhWxX+dBPx1F49id
 bQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744823590; x=1745428390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wa4KAGukhNqJEA5YzTqcGsVsMUfMRq1+94sJWEHIve8=;
 b=Pz9juCmda8zWFhcsb4A5h3Oj7gAv1aVjVMig9yBpuhFIT3JyK08GDJ4+jKwBCqd2bV
 xe7V0b9L2PSc1u5DKhM/UOFbnLwbaLpXvi1DNvSnzmKo1yYfq0OOiFYzjDGW5J5YrTE2
 9LM3bVSSSMVeB4BQRd+fFQfrN9RMTmY4BezJ68p/pq5aM2zFimgQI0HjJ+xRvCCUEjHL
 kr6qtdRe8g6Fm2nFH5Movum2/KwO99p1Onf8f7HArF3zfzSmTSxKSFUzJqDD4isfgrUU
 OXiPtaTdftGjWAAOlVLCplTtZyP1c8pRhLyHJJpuuMFEDD95pNpC9SSh2+aJOdd9UpoW
 4lEQ==
X-Gm-Message-State: AOJu0Yydf3W0IvvUDJwtA0wq+BscDFuJwDAZXwJeY1HACdLbKhxua6ww
 Our+Xeik2bTpnJ61dSjAmoTouHOZLQO1nTvw2Niv/3vlzW+EqylWD8nZRzgYgic=
X-Gm-Gg: ASbGncsVedEIc6YAAsCi6HIQ3Q8tGObmsoKhmHoD1jMMoxYBPimJfbOZ4hZnNcgtghB
 q4nPMtS8NQvP7tUCEfXc6zykt/3g2olMb62yXwr3rVcQ210/qSB7MjEQjYUzUwkKt02dkkH7x7X
 QsKGOv7TeguwA9DTdQobHjsVs3i3s4+oLB0Few4emP2nBgEJKwbg1R/yBGtzb/cA7nHzPTb0Y2r
 JKOVvCAPpMFI6m30hR2gJz98YOTqiU+rR8Ns+TC22iDiGvTgLf6zPsiPn/xL9jnQXwSTNkPoAdw
 GLELIAprE4Bt/b9f7ypE43NgMe9RYUvM+2aB2eUgNB/ssnP0gE3knw==
X-Received: by 2002:a05:6a00:1145:b0:736:4a5b:7f08 with SMTP id
 d2e1a72fcca58-73c267fe1dbmr3998712b3a.22.1744823590191; 
 Wed, 16 Apr 2025 10:13:10 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198926sm10666499b3a.20.2025.04.16.10.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 10:13:09 -0700 (PDT)
Message-ID: <e30bcd1e-6df2-469d-af6d-67b2a263690d@linaro.org>
Date: Wed, 16 Apr 2025 10:13:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
 <20250415172246.79470-3-philmd@linaro.org>
 <655c920b-8204-456f-91a3-85129c5e3b06@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <655c920b-8204-456f-91a3-85129c5e3b06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: DxfI6qozaXXF

T24gNC8xNi8yNSAxMDowNSwgUmljaGFyZCBIZW5kZXJzb24gd3JvdGU6DQo+IE9uIDQvMTUv
MjUgMTA6MjIsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4gQ1BVQVJNU3Rh
dGU6OnBjIGlzIG9mIHR5cGUgdWludDY0X3QuDQo+IA0KPiBUaGF0J3Mgbm90IGEgZ29vZCBh
cmd1bWVudC4gIEl0J3MgYSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MsIGFuZCB1c2luZyB2YWRk
ciB3b3VsZA0KPiBzZWxmLWRvY3VtZW50IHRoYXQgZmFjdC4NCj4NCg0KSWRlYWxseSwgc2hv
dWxkIHdlIHVwZGF0ZSBDUFVBUk1TdGF0ZTo6cGMgYWxzbz8NCg0KPiANCj4gcn4NCg0K
