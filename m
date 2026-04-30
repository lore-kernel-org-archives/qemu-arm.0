Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5883FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 14:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wISXM-0002Dm-5r; Thu, 30 Apr 2026 10:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISXJ-000269-Pi
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:38:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISXH-0002o0-Qg
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:38:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-44a14580111so148708f8f.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777559918; x=1778164718; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pt/6Tssxcg3GQ/+W+7CLqtasUkOu/tSuW4Ia5egDNiY=;
 b=whQZWJhOQtGdfxiXgFw9TrMxJ3NbY2ql270j8LtQYNh0eUEsKZY49M91fM8OnoLagS
 xiSrOl4QTboe1cezosLI4dGMU96uZ5JPEoQOje2YD7fv6TbeGDNos3d02fKlIdYLkBMO
 YgHbICbu8H3IFWJHlz2UVgskhQvPdqIzYRPvKMgLGET7o3sjJd2NpY93R/rTMmMsc9YW
 OzgLGZidyPBbA720exeHNUWBfw93rUGVzlu1g6KhIUet3nms5SGwbIkb5WvaWGZYGHV1
 N3KJvhnoUSJZzwOgaFPhahwuNKsGAS/hg8Fv8QIUb2ZPgmAR8pH1JxA6r/h/iq+1igCN
 gEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777559918; x=1778164718;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pt/6Tssxcg3GQ/+W+7CLqtasUkOu/tSuW4Ia5egDNiY=;
 b=RWBRolUzJEJ2RcBuWvX6NW71qmHlbjqj0g9yAyNIf6pnzU417oehKYFZo2XISFjDN3
 af9JGFckwdH/FJCN0+odw64b3NpFPufkz7tfoXG8YyMbXMHjVVD4EjVt7cKM/tHbym2R
 y3YMwpe1mtBp1WiXYRoBhvn3mI28UVLQ37fGYnyvjUB07bCfPrAdEpTyVGtAHNbYrIjT
 o+QIr2yHadeu3/L2m7AfemDIy0ReoVjAdAl4v4ignjZcyPbR7+kI2CGdvr2H8qwgAK6l
 GIpTz1iX45heOzKRAd1lqtp520acjpfj5k+oiDyEtfErz2VFewfI7CSI+vFnh38p24j5
 uRRQ==
X-Gm-Message-State: AOJu0Yyz7dCUFsm24fVnCuzSmjHrjAlSyWGMrXDhhfCT2t44HZ0KoDC1
 wZoUpe/D2Gf1WowhHnpXkw+MPpXRQkNdqTFvBggVPVqViJRwfZu4s8WwRu8UkQIVgTQ=
X-Gm-Gg: AeBDiesKm3nXSdYhG2hdMSprdlyHtAAEmrRCh2CyMjygEjx51ggair7/3E93AA7sGIb
 myofUJQNSRjLomCdxxBzyTRYjIXZlKVJ89vci6hpHisAoROWCix7ZfBiyNPvgpgs/MG8z3CRwbl
 xSWzDZ6hIfaGlJ3UXOWSy8aRajhw0t16eG6HiaSpJsP9lItjBVq0d7umDpgJ2UwWjQoLmmmk55Q
 EFaS01yijqTAKv+DfFmozAro+755XYqVgkzKJWsPOd/MYw+2PyQVaZkliJA653npuJh7s4XsbkE
 d5tUdQ1dCqmV6pChxUNscys7j2OIzNMCpEwL6kcbc6r3UdeAtbne3Hgj9JgTyDfSvfXC2cQ5CCR
 hhMePw+w+2dMXHRCWpGg7RGq2iyBsixWRwVFjuR8U3F+tqWoobLPkBogNRd7LYP1RrpHJ5WGd9I
 Vhyj/CxW5sGjgnzM6mM66ygUoRptRlC3VDBg8e5BRIDEaOpPlBakUD6Vgb2yiT8OvVooZv5t04G
 bpn
X-Received: by 2002:a05:6000:1a8f:b0:441:1e41:194 with SMTP id
 ffacd0b85a97d-4493d02c36amr5697052f8f.17.1777559917982; 
 Thu, 30 Apr 2026 07:38:37 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b7217b20sm12950691f8f.22.2026.04.30.07.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 07:38:37 -0700 (PDT)
Message-ID: <943120f9-c8a6-43db-b210-a3524c7b4a7e@linaro.org>
Date: Thu, 30 Apr 2026 16:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/25] target/xtensa/xtensa-semi: Use
 cpu_translate_for_debug()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
 <20260430093810.2762539-23-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260430093810.2762539-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 30/4/26 11:38, Peter Maydell wrote:
> We want to remove the cpu_get_phys_addr_debug() function; update the
> xtensa semihosting code to use cpu_translate_for_debug() instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/xtensa/xtensa-semi.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

