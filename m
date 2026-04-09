Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CA7E98FDD
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 09:42:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAltd-0002A8-PY; Thu, 09 Apr 2026 05:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAltY-0001z0-6A
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:41:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAltQ-0002Gw-TK
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:41:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so415868f8f.2
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775727701; x=1776332501; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+8+VUiGXz/KBYfn2QYKbors7gxAzS8hUuH0VayBvlUo=;
 b=bR+sM89sFAJfe4taRvSxdOciWJeCsxQ6PtdQ/h+LJ9ikrRXNn2UrdWaolhUb4nJFjZ
 VfY41S5a1Re9rBrrJEYi8PcGF/0RN4g2otc13PddbVzaZ8igq3zUji2B9qBThMAekmPC
 Ak+ndnLgKVeN9R9dip4OY/4XzycT/qRREmLN9xxU7jiaHDigGdlNfRAwL2/hmUTbv06c
 ncH+vc7bH0PEfwGZZyc6WpOhTsEYTLk/bvDqCPGhV/efdNkJpoRXHr8ZBWtEOIXjUmzS
 PNThvM6gcQmChtME1nQNugRz8IuDgMwSok+++/V/asNRCW+4sYooSkc6fPzzpPPgMfHU
 DkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775727701; x=1776332501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+8+VUiGXz/KBYfn2QYKbors7gxAzS8hUuH0VayBvlUo=;
 b=oMDlYGLRTsmw5poPtOpy/JqAQ4yApsQmp+G9Hpdbnd1pl1Bb6R+kSeZysJKBoKrltL
 isAfC0yrUxFxvNwk3vrjtFHG/scjiWSluXBWR3Mc0yykfr13srpaC9kOehfACGrJuI+P
 mKAGCEWMUk3JkVftlWKlL2++nxg6NygaQ1iVYixuhnUIcCOmdbW0ZDfpnnWFNVcCcFUe
 yQCSHnVGAAU1SnTkJ2iWmGJeutznLimX2h7cwZqIzTUM40LUefWqXhcqPtwYMOdAUtbN
 5vM+Ht+0YyOjyx0XxU+H50PNegVqM9Wui86kFN2RSwkqQ3n4TztnmetVc0gJhKYe4YZV
 L1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTo1piQxdZJofjc6ssVHcFgpw5JcMBFTdKGwGSbwnZuTCvMEqJU4Rr5F8ww+M53K4/viJEWrxl0w==@nongnu.org
X-Gm-Message-State: AOJu0YyGeKYpWq8R/ADKCPiWLNUESpSEQKTZ++1lFe6uC7/Gr01o3j2B
 sFMmqWKyzbYJRtuLfkLGy87KSt1xYYYoGe4V6dchz/Xb3fNeCdDoqG7+x3ILFKR5+hA=
X-Gm-Gg: AeBDieu+09sWkT/AuJIiJZymr32aU3jON7di3is7Jb6e/zykyl6uWr6ZFxKOVb+ympB
 gMMe9gOKq991KGH2UrIU04vJqwlU1B9pHXVqaJ/x7xgQj6s4jCvljd+LM6TsR25icx/Kwx03P1l
 ga1Ka1wjzAHc/Fdnr18LGYKOpqtxVunyPkjyLHa6gS7r+p3e+f0p3qYDX0mUCU3rbNmdPJ9W0tx
 v+glN4JErv0YRqnNzo8Q9ukBCISCtIMCRHTzM+RtXucsk5rc6SYnoKgfVtxBozLbyOP8Qvdiawg
 hwcxrLBX1p9be7QeOw5PAsjls/zQA8YW1amw5/rTtxQsXRuWhdUUx85KCIOtKOujq49o4QzR1gw
 Smicm/HFnXLvIdLr08+L/KpnITGB8uj4NDdsPxW/n485Z1maUcQLqHTpm7ibmMLjHwJ2C0xf5s5
 7n4NKHi2ok2UrxDZXGCfHGWP09fQuYaBNIdJ5NhRsGNf6d/hQpyXJ0ZLCUxncxdTVEyQ==
X-Received: by 2002:a05:6000:4201:b0:43d:e31:68d1 with SMTP id
 ffacd0b85a97d-43d2928fd52mr34867086f8f.21.1775727700809; 
 Thu, 09 Apr 2026 02:41:40 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e52a0sm62750693f8f.30.2026.04.09.02.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 02:41:40 -0700 (PDT)
Message-ID: <7fcff35b-383d-4dac-bfcc-3d889db35df0@linaro.org>
Date: Thu, 9 Apr 2026 11:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hw/riscv: Use hex unit addresses in FDT CPU nodes
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
 <20260409-fix-unit-address-v1-5-946840930af2@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260409-fix-unit-address-v1-5-946840930af2@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
>   hw/riscv/sifive_u.c | 9 +++++----
>   hw/riscv/spike.c    | 4 ++--
>   hw/riscv/virt.c     | 4 ++--
>   3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7ec67b2565..54f3bcc3b2 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -168,8 +168,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>   
>       for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
>           int cpu_phandle = phandle++;
> -        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> -        char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> +        nodename = g_strdup_printf("/cpus/cpu@%x", (unsigned)cpu);
> +        char *intc = g_strdup_printf("/cpus/cpu@%x/interrupt-controller",
> +                                     (unsigned)cpu);

No need to cast to unsigned explicitly, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

