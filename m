Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3F9E98FDB
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 09:41:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAlsh-0001WV-Cw; Thu, 09 Apr 2026 05:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAlsg-0001Vx-3m
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:40:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAlse-0001dJ-3Q
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:40:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so4164385e9.1
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775727654; x=1776332454; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4s4U4hC2ghdczoWrVYARbsjOeBNZlC8PGpb2hWgnoWc=;
 b=XqXezwIwGgxY2ve+iwiy3//W1KTY7KaAlGDquBSxQ7C4oGL1ZSDWgxcYDQZzl7soAV
 AAu5IBojThJuntmT3xqWHdZ0viLzNCnd1SBcT42IDFP9q81JpRj6OLUmpk0dhxGgFJAP
 IRKVnhRt8lqJtnx2jeehQhb73rogHZu1DrBc+UyU/F97BztX1ev/bfMsyFoWprWjqA1n
 tFDopaHZN473+fIwe7AZBy7oMqnU7/7mlKDLxykH/4xdwuTD/IsLRJimzPlXcA70octQ
 R0TQWhRL5AwZELdNUH88SS0MiraU/dV7bwIwos3noPH0KWhEiNEyw70LCHgEuo2tCAzx
 e27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775727654; x=1776332454;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4s4U4hC2ghdczoWrVYARbsjOeBNZlC8PGpb2hWgnoWc=;
 b=lj8hJ50t2ynW/0h2MCXbnaLbamT8vI+tgutiyue1iTT+mDVPMFSJhBPSNrbmKEc1Ty
 NQHjijt4tRCIyOGr4++5CgmUP18NxRm8Km7+J4tha24/VqOJ1RmcKybjnZ0Mxs8crPij
 JNXkL/5l6GX9SKvnAiXm3OCmhd1Dlp+CLgCWXGm5hCMA1lw5PFAXyYCbwfrtvIOuwbne
 ADiLQuLKU6+gqxMOo8MO1PwBRXlzQz2rJl2itCRA+xKEDbpNNxhPyrwZvsD9P5uK6ZB1
 BjNuR/NueIvvisLdbKxLWDuYug/ZI8OWl+FeyeRhFIbQizZOIby0yZ6Ljzx6/STrgvZO
 cD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVexCoAlZ8jlMi/m/9RW2hvmxw4V+p4ZUpYsRvhp5O3XfzLGvAXjL3uV8UiFeuHSp43N0AdaiwQRw==@nongnu.org
X-Gm-Message-State: AOJu0YxVTlZLdXuZRA/b8w/HiXa+HIMDfyyILdkXknbQcTJC8fhQasO9
 NM48bNrKUZ3bFkneYM1P3wnbVh+h3v5nQAmh3Vzt7Cqn6/G3jRauEJ3LgOgVZP47xG8=
X-Gm-Gg: AeBDietpJSXAovpoKeH1j+E9exLd8r/VnI8nbR79mJ1hbmeEfa5yRV0Aqq9pSTVbG99
 CAzkAljQHEBE7YppdW6YxIxA+k+HTAHrGJLGKoTwSjftj1Nbjryx3UyAM8SYoNv5zWB+fTe3OOO
 uP8JxkqGJXLicZ04iMlAhLdDNlQVWMLYCKKgwQ2OneSm+vZSMxq2+gVY0PyNGN9iG6I72Lz81l+
 Xfol3IG+DiKuDqSV+RKB2+WKMXo3fCflxKSzsGfcy2h7006N8qZhQzKrEP6i+83nJ/maaR7ajsM
 NwETwFMS0Yt4m8eBRfYTFCBIa189nJNrJnxbM34DzjH4rO8ABDkkJphvmPyMCunelK03jDM9NE/
 8NdQ1xA8J1jXePt9EqwOxU2ROMKEeOke6Lsp2mdyM6UrnJNHi/XYJJLoucX2wVpXSfCi1fT/ga9
 nqfUTn+Fg5eRJ6nxUYO3brF9B2Hwu7CT9p4Rv7Q8C35B9sC80PXmnBATrUtv6kB/VQFg==
X-Received: by 2002:a05:600c:c081:b0:480:1c69:9d36 with SMTP id
 5b1f17b1804b1-488ccfd947emr28902825e9.17.1775727654307; 
 Thu, 09 Apr 2026 02:40:54 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd0cb7b7sm20685215e9.3.2026.04.09.02.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 02:40:53 -0700 (PDT)
Message-ID: <7f7f6217-4432-449c-a3fe-83d97265a9d7@linaro.org>
Date: Thu, 9 Apr 2026 11:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/loongarch: Use hex unit addresses in FDT CPU nodes
Content-Language: en-US
To: Vivian Wang <wangruikang@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
 <20260409-fix-unit-address-v1-2-946840930af2@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260409-fix-unit-address-v1-2-946840930af2@iscas.ac.cn>
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

On 9/4/26 08:40, Vivian Wang wrote:
> These unit addresses should have been in hex, not decimal, as per de
> facto convention [1]. Fix them.
> 
> Link: https://lore.kernel.org/devicetree-spec/CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com/ # [1]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>   hw/loongarch/virt-fdt-build.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/loongarch/virt-fdt-build.c b/hw/loongarch/virt-fdt-build.c
> index 6c06b36fca..5875c6d9ae 100644
> --- a/hw/loongarch/virt-fdt-build.c
> +++ b/hw/loongarch/virt-fdt-build.c
> @@ -66,7 +66,7 @@ static void fdt_add_cpu_nodes(const LoongArchVirtMachineState *lvms)
>               continue;
>           }
>   
> -        nodename = g_strdup_printf("/cpus/cpu@%d", num);
> +        nodename = g_strdup_printf("/cpus/cpu@%x", (unsigned)num);

No need to cast to unsigned explicitly, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

