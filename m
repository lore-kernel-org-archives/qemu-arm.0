Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68A1CEE343
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 18:21:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLQKR-0003cd-T9; Tue, 18 Nov 2025 13:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLQKQ-0003bX-3j
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 13:21:22 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLQKO-0008Bv-KR
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 13:21:21 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42b3ad51fecso4227864f8f.1
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 10:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763490078; x=1764094878; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3cCp0GVg4DQazg6OaNDuPBMPUVotUpy9uO56eOuSk24=;
 b=vliEgMXgNN+r6llJfxIt9TQvb2CrMzWI4O4QICzIv/YDSin3S7nr0Ri3tVCkeLqLg7
 bWyUDbFt4JzHzMrYymCz00x16V0x/gQOHklfAibAzgFUDnmXOK0FoQDGwA76+goX+Rur
 V+VN7VRd0crIYnpKx/J2XyOC7Ep1qHVn/rqqJQzPyFX6gIOir5zRntuX/0MqhnHMeKO5
 EAQK1N3M1lgRYnT2LdhMoP0lfXrBqlESbI3wGUHqa2+FbTtiEnHYN3ISIS2tnaGC0oNw
 mUm5l+sK7m73SCW3bPWwmGWkrj2R90JaPPUQvzjCmQXiPTid+zMGFCUNLlzKlVvSsrBS
 fm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763490078; x=1764094878;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3cCp0GVg4DQazg6OaNDuPBMPUVotUpy9uO56eOuSk24=;
 b=OfTLr8eylhZMeU2pm/yVlp4S/q+yI6HcJjk8mS6cgP98H7DKwndXv4cu65gQxH1qEI
 puk4+YAIL5YVK/0Gxo2fQ2MRcAb+5MShaF50XEh2su0h9Wu0BdJ5N5RLYU/ar2QlZp2+
 B2aPaPb89XSdQxLms61Ku6opHCGC3sf4bnOuZSEhs68z19jFnDFHEkIp5v0Fvk2Yft8q
 WAt5GLjegXa/TNy+LKhjHHhcMRZdaKZX0spQofj5+E17zb94/gLK7y81cPBJYzKXJ5nc
 tUy9nVcqtddAbKl7QfBRI0A9cZY8kt50Yq1bnKYyls1Sk4gYvvXsXDH0ZPqnaRJiakEt
 YAPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+8BFAxsoS/xjJ5mr7ysGXbT8UwEK3M1rCyY8RWCFIS0Q2cO5nJhxs/61ouYae6n3WgEW5cSnfvg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2luDf0yPIqkfFNjZ2tVM2U4qGrg8CRHAnNSrKS2ewD5DtAXtR
 Xe3S9UJLg3Skjx5oWspyzbyseodtM5wvMPOApyZaWTnR8+78o1mC6kDukMm37Snuqpk=
X-Gm-Gg: ASbGncs88XfHslhdQ7KlBJtI9WdpYOxguLVQUf3bkTK8enRueSzMVEUefAOr8ok3nxR
 ngFVsumEyP7QO4d4ofd0VV0HSkzS1alOjQdnAu4BM9yID1W87okqr1YbsSZYxsBVJuRhVdYk+Vz
 B4Ecofue28KqLPGyVNW2afh9noZQ4ZUlwCSn99jWaj6xAG1aXWdHCgpalOoVrJ1+whu3pEa8nSZ
 bygW61ymfPycRpqMHuO4Avet4bJ7FiDXWldLmUgMRb1fdcyvDXa93obUgXrH66EZNL98na0h2pa
 7/xbwp0ekwsSSAdttkOkjEWWzx0pipLdyKLoDSxFAfJ0wJg0PmKzTAt0RcNrhzW7SznjMmyk4+4
 nos3YJ05VrSSvExHRFdMr6YKHguZffz4hLYHxHaaR811KWSLpKJwbEQj9CcI+TjNh2QH37fdwV6
 +CFuOuqiXlcAeubhwTVSOO38tEh6gCnmevAoCg3XGuEsX3xKg/nzxQaA==
X-Google-Smtp-Source: AGHT+IGa54ulDtbjqkB6ax4RLtM4dNXJzV8/VVRil9O5Lt5V5u35Zw30azbkIYyX1esIHvjwqWU3ig==
X-Received: by 2002:a05:6000:2901:b0:42b:3e60:18cd with SMTP id
 ffacd0b85a97d-42b5933dfdemr15603230f8f.11.1763490077614; 
 Tue, 18 Nov 2025 10:21:17 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e7aea7sm33212249f8f.1.2025.11.18.10.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 10:21:16 -0800 (PST)
Message-ID: <843115a5-d9bb-4efa-b829-d93549c2ef35@linaro.org>
Date: Tue, 18 Nov 2025 19:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2] hw/arm: Re-enable xenpvh machine in
 qemu-system-arm/aarch64 binaries
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
References: <20251117091253.56009-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251117091253.56009-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 17/11/25 10:12, Philippe Mathieu-Daudé wrote:
> While registering the ARM/Aarch64 machine interfaces
> in commit 38c5ab40031 ("hw/arm: Filter machine types
> for qemu-system-arm/aarch64 binaries"), we missed the
> XenPV machine. Correct that.
> 
> Reported-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
> 1/ Review got likely unnoticed by Xen folks because no
>     Xen-specific entry in MAINTAINERS:
> 
>     $ ./scripts/get_maintainer.pl -f hw/arm/xen-pvh.c
>     Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM TCG CPUs)
>     qemu-arm@nongnu.org (open list:ARM TCG CPUs)
>     qemu-devel@nongnu.org (open list:All patches CC here)
> 
> 2/ Should we restrict it to aa64 only?
> ---
>   hw/arm/xen-pvh.c | 2 ++
>   1 file changed, 2 insertions(+)

Patch queued, thanks.

