Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05EDF99C95
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Apr 2026 22:15:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wEDwo-0007W9-P4; Sat, 18 Apr 2026 18:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEDwm-0007UO-VI
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:15:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wEDwk-0007vI-HA
 for qemu-arm@nongnu.org; Sat, 18 Apr 2026 18:15:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so9776915e9.2
 for <qemu-arm@nongnu.org>; Sat, 18 Apr 2026 15:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776550525; x=1777155325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WXMY94dCqMOHOzrMoTrJrkjU0/9AwmWK8Mg4e8KOnjw=;
 b=jnC8ZkZ9AvJ4L9CBoG7zY78/Xkbva0vK/5qwpV8kUMCAylfxqzknek27ke8qo2sJlT
 pbQQk20KM5hJ4KrwWEsSnn2aB+30UMjv9geucdvURFtQ1fK56i6C9OKD2ByUGUsOycTI
 odHE0HEcYScwKGINZLPJ6fQiJoNsro8yguM7HF8hWmm6BJqMU2c7bLQE654nH4gvUEy1
 WvAAeBDMYrqHn7tEcU9mXU+Nk6eH9/JD5IA7rveuiJw91jo0vxR4Z43Gucnzrm7SCG5h
 kYmki5QYc5Pi4UrCnApwIonO1ttJmhaJHNFc81HIhziNRO4Ah7T2dUDMRP1YCQ/YRd0y
 keDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776550525; x=1777155325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WXMY94dCqMOHOzrMoTrJrkjU0/9AwmWK8Mg4e8KOnjw=;
 b=HfAGMJPMzF/TSPanbARPP7uLBd1fWZ2XgqjATK76IXlesnij64he7IAbtMewYA0wRk
 FM5kbvRQKD52kxjT8PlAh7giISJNlLlHvAKozWLapm2m6UxjTKRUlQjwxGAB2Ih5oars
 mwdpxloOZU9Sy/7Q1Ph2cIhTnzRySDeRcsv24ypINUhlzKUXea+RNU/51h+2Rtt84qeC
 JGlQiYBEbxC6uTTn+fW7kC20+/Gk7lDlUMfPFVcOB249vXY0SiJngA+VKQi7ovh2dcuO
 Mi1KpG/TbVARpLl/QRkHEgHankuCGyt/3kVmRBeT+lMyGdphwkdGt1jGbyagk49y0tfD
 Gf1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+BU8m7S7G+LvZnWlWSUzHlc2K3zIFD/eFNsa8alcYMgAqZvRWPQo988m09Vx1oQII5Jwvk3X++7w==@nongnu.org
X-Gm-Message-State: AOJu0YwlHxnVwgGoNODLQquVs9SH2xf3Z5NCQoq9KBt1+++16zTPqe83
 gXwlDlXKCmcsublKm/+pcvhcvxMMTEJ5Gchgtvcp6EobXWKRT2j6Fm9DOfBmS2P7Xoo=
X-Gm-Gg: AeBDievvthmxJd8EozgOvTf6abAxAnpGxRRSEQSqj/sJU4x9IDnh7fym92dEBDyo8Wj
 QMi9Jk2H3VLw8l4KKyFn1sgzpYxJOCaP2JXa6k9i9nf5jMZQI/ypuzYFa3PbrXFr/v94WqBeTAG
 /sncUINcL598TXDHmPI8TcTUkVoUuhSU0IN+au/Hw5uSQxFNyqfClBzaHYWDbNI3aqj87e5yJjR
 FgKh3LXlasMFwGVFZQlILSr2QqLBR/UYhFf0yAZaa8ExUEk3l2vEwibpcKGipPAHkUQYJfJoXcG
 6KqmMr0fekL+Du0fm4hKB0Czm7E/CVidz9Hy5nOiuY8vsP0+HMrZzWoxvt8GVDdx0IWGVSe3q25
 prxjvSea2+KT45KRAHC9bnBHxB74wtPH3JEK5vaNFYvuVHsXTd5N3wlJ0nFgzRu8KtKxSxBAg+V
 RuIHlRkOdrzrTsWkbykqIF6jur4lbkNbLmucbmEJXQQw6sMAdK3isZfwjGDIrDXekRESVC0WIUz
 1zuc71eZE+XgYA=
X-Received: by 2002:a05:600c:8183:b0:486:fe39:28b7 with SMTP id
 5b1f17b1804b1-488fb752e3cmr97206495e9.9.1776550524870; 
 Sat, 18 Apr 2026 15:15:24 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm166680665e9.10.2026.04.18.15.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Apr 2026 15:15:24 -0700 (PDT)
Message-ID: <f9be05f5-d08d-4e31-9705-9d48e93761e8@linaro.org>
Date: Sun, 19 Apr 2026 00:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] target: Rename cpu_get_phys_page_{,attrs_}debug
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260417173105.1648172-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 17/4/26 19:30, Peter Maydell wrote:
> Rename cpu_phys_page_debug() and cpu_phys_page_attrs_debug() to
> cpu_phys_addr_debug() and cpu_phys_addr_attrs_debug().
> 
> Commit created with:
>   sed -i -e 's/cpu_get_phys_page_debug/cpu_get_phys_addr_debug/g;s/cpu_get_phys_page_attrs_debug/cpu_get_phys_addr_attrs_debug/g' $(git grep -l cpu_get_phys_page)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/core/cpu-system.c        | 6 +++---
>   hw/i386/vapic.c             | 4 ++--
>   hw/xtensa/sim.c             | 2 +-
>   hw/xtensa/xtfpga.c          | 2 +-
>   include/hw/core/cpu.h       | 8 ++++----
>   monitor/hmp-cmds.c          | 2 +-
>   plugins/api.c               | 2 +-
>   system/physmem.c            | 2 +-
>   target/sparc/mmu_helper.c   | 6 +++---
>   target/xtensa/xtensa-semi.c | 2 +-
>   10 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

