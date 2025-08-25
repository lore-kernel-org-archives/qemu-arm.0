Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C1ECA0EFA
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 11:01:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqUwV-0001bY-HW; Mon, 25 Aug 2025 07:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqUwQ-0001Z8-N0
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 07:00:46 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uqUwH-0001PO-SI
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 07:00:44 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b614ccbe4so4786505e9.0
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 04:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756119625; x=1756724425; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Z9gLB6t4WTsyxU0WyG4/tSwaslhDhXaC+KLyfeWZw0=;
 b=n16BBfZFfyOpYQMRm7LgKLliimuyTGbXylrMX1Hfc9SHsP7BZh5Eg4ydRB5TlaKd+4
 R1S0gdTtdTVh+Cc9lX5tOidHjkF/Wl4cd4QcEcNWqDQveRukc34YxbseV82ZMCsg8bIF
 N9w2+JuPJSXbh5tpf/EA0MAxGmNOd0xRYT3hT239+ZgkXeNR8Aa/Pwc25aMQ8lQ7QmAs
 zkGHorCcwoVE/gZajVJrbQ7tjsX5EGAuOohOlJVdhiC9mJmD2dig5XEiGWqpiDth7hHK
 OnKExr601q0AXZpeluFTz7qcRqKh0yD0BNK+P9lV7uvVR+rAyDv4rp6xrZW1mhAnqwfn
 0ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756119625; x=1756724425;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Z9gLB6t4WTsyxU0WyG4/tSwaslhDhXaC+KLyfeWZw0=;
 b=mUe4SBIcEoXDECDFI51nSmL0pM90qb0OpwyvlgZJtHrMdsdlZj2WAaRWMSbQvyTsNS
 suYyv/bWO12eSMF/el0w4JOBqmnKxs20YDSJsa+rKzomCGtTwDjvb2MBNZaG3YNbipbG
 Dw6PlI0bCH6088+DPFB67Va4brQFVmLdS957+1oLoHrdu5zXB90kUr3U3HulFbId2DOs
 +wUNDizL8cf2aIih0pI6sJxH+Dtd6W0Ir6deVmovmaKFup+cVTgVZ16bN4+APFJf2Wj5
 sDudSjPYGfYztTtLSdGMtwtvr9klhoTgHx/3tfsJ+i6jA7jadUOURSYGCjDVRipMzRbQ
 34qQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYIORblAZaj1uqk58iIQZ6YlowHxQKJAgJy2DyCI5GPlf3nMDujKAvnz3fDPqlJZjjoGtjYpSzYQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx6NwKuAekxTwHM2ysPXYLXgbVG4HMr5hQSYmCxhYjdsffxKBma
 zmh1HTVUJzaaSl1aUYU5YCIyiO5W5HRr4LlCVZZK1xvDT90ln6gzbkSR4MvvWiBkdHs=
X-Gm-Gg: ASbGncsAicdmTzn1kpSiXKAuXmznhKh4hFc2cit1OK5L69yPIwqzZNlxIFu0pGxImmR
 StdPHhfdow6NLGTcbIYSqGhjZOYASK1SjbqvYFxJqwaCpUkKq+CrOft5lNT19E97FyApCOcNlqR
 4aNpyBEX3oW3scR0p93dA3BDTV3nlA0MgZ+72EsseN+o/Wuz4jWwMTRZCtRIv0rRI6r9FvSB6C6
 BmG3waNdxxaFtndwcDxWxk6uHWNQ3Ih0jcP9vqLKfJtuIuG7A34wXUs1NdbF4PMM0VSn83A/01s
 /0B8x7BhDnA4s3iat8tW0wkxJbrmQS7lESoPKz5cAV+4/nriMZSYKosdWnU+8UWz8ASiKSfMTHT
 84bCPvw+NbNqUXY3Cxr6AvBrH7odyYKeh7xNE3AsDGtjxLVoxlrRUlz/RlblZ23jpZA==
X-Google-Smtp-Source: AGHT+IF2y44N3DSfaLPfMFjZaC6sva/ydKImAdWtaN+/nexDk4z7FF91T0qdz5DHIGXzkftBDLXEDw==
X-Received: by 2002:a05:600c:198e:b0:458:b068:777a with SMTP id
 5b1f17b1804b1-45b517d2dcemr116623545e9.30.1756119623777; 
 Mon, 25 Aug 2025 04:00:23 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b5744a45asm105226135e9.8.2025.08.25.04.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:00:23 -0700 (PDT)
Message-ID: <3a80c5e5-9889-4830-9a00-5d4d92141a3a@linaro.org>
Date: Mon, 25 Aug 2025 13:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/9] hw: npcm7xx_fiu and mx_pic change
 .impl.unaligned = true
To: CJ Chen <cjchen@igel.co.jp>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <20250822092410.25833-4-cjchen@igel.co.jp>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250822092410.25833-4-cjchen@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Hi,

On 22/8/25 11:24, CJ Chen wrote:
> By setting .impl.unaligned = true, we allow QEMU to pass along
> unaligned requests directly as-is, rather than splitting them into
> multiple aligned sub-requests that might cause repeated device
> callbacks or unintended side effects.
> 
> Signed-off-by: CJ Chen <cjchen@igel.co.jp>
> Tested-by: CJ Chen <cjchen@igel.co.jp>
> Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
> ---
>   hw/ssi/npcm7xx_fiu.c | 3 +++
>   hw/xtensa/mx_pic.c   | 3 +++
>   2 files changed, 6 insertions(+)


> diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c
> index 8211c993eb..6bf524a918 100644
> --- a/hw/xtensa/mx_pic.c
> +++ b/hw/xtensa/mx_pic.c
> @@ -270,6 +270,9 @@ static const MemoryRegionOps xtensa_mx_pic_ops = {
>       .valid = {
>           .unaligned = true,
>       },
> +    .impl = {
> +        .unaligned = true,
> +    },
>   };

Surely a distinct patch.

