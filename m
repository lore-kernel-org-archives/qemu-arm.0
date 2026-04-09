Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F83EA3C21
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 10:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAmE2-0001XA-4a; Thu, 09 Apr 2026 06:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAmDz-0001SK-2l
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 06:02:59 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAmDx-0006zT-HK
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 06:02:58 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-65005a8840dso653859d50.0
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 03:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775728976; cv=none;
 d=google.com; s=arc-20240605;
 b=Xz2L/YZ4o+T8LXefQV2ZVguYeqDhujuf4lFrb3NfmasAPzg1eKQj4WXcQ5j1D+7LeY
 LzfgKJxBvyAOUvqTEmr0IMgHwdEWYbjsUExv7bGaXm6leHfca5i3WkwvCqQRcHaC+ORO
 631/GH8qSpegYBpQs1lwH7knd3BjqfigZbEHolJX8CJIjJsuAm/C+E9HtnpK6XWo0IUq
 o5aJYWfFec+sj9+VFy5OnDqwBrGtABiF8+Z9R94hygjn4j5tTtwaeiQu17u50ZfmOhZY
 FLSZO3Xwr9Xd8ATCiNRG36UJK9Whw5pGtNUgvHVtyOD592+CFGhD3BKnfgd9ewycksPH
 pFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tgI2iP8Na7SJHYxQqxIsvVgP3n0/H2Ro+rDmqpBa+Mc=;
 fh=/V7/VQjVP8UdDPYJbbQ+IhOpa3wE+YiVrMw/jPo6q4Y=;
 b=CTab8rK8yuIWnPjpGsFMLqhgbzP+NP6FHWVUUorAqJlos01D1w6B1Ih9k9fiuTlnXs
 eixuolF4POdSU5LaDhjuSnlE7iRCUlZ87hyBJTV7xA02qUGLEUgBUak3brquUOlxMeLh
 ICLn5Z/N2T5FpMHRpjULRZZCFFraSIKDSbattsidyPbiG1McASb02KWBtdAj2xEH7p6Q
 6I3fyFuvWgBiMm4Mwu3WGSKZkrASx8HSRf/DYhzB8Wka59BX7wcx6vmVYdWjg/lp74WR
 cUc1FDVRxak1YAevSgDSzzcWemdLFy4Fl7KBXhNXjAjYwNHwL1hu2UTVRrBEBk3InUP3
 Gqfg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775728976; x=1776333776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tgI2iP8Na7SJHYxQqxIsvVgP3n0/H2Ro+rDmqpBa+Mc=;
 b=OIhpDnt5OUQZHvi2PwMf52m/r9O0RNvWF6+bPr9EwL8xQZRzndPQMhv31EeihfoKab
 tEtlR34kUWUO6U1bE5ZO17juRb+4nHfoUA/c5kPotMDCWcMvd8bqxJcIBwHkA183P4xp
 edhJKh4hEEpkaTyef3B08YJ2jg2tSypVQz1QYIijFCFRVGQIhz0JdLIc4L5cyFnseYaA
 h0zEdw6v0ijOlS6q4vECf35yfkewUPIQ8HPPDWkjjzK4kMsMUPHphi3lMQ2H0uOu9PHm
 Dj/XhQ+2IEiFol47e/D0XPbeGobbNHXVfyep3qTDrukM7Qu2VEI2WaaVNh+xbEcfYRgf
 DZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775728976; x=1776333776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tgI2iP8Na7SJHYxQqxIsvVgP3n0/H2Ro+rDmqpBa+Mc=;
 b=O3FFeetZpFZVcZqD+Bkt4rstXluOp2VKWh0jn3u77iPLTomt50BdJnUSoK3I9oF4Nh
 LOzsj063xuWnDipI5oVGlBGm7E7oUaqAd6TxaywK4beLossaJZZy8lQaXK8KCg1L9psN
 lOh4WGkHIvIO6jzK5WwlYwKOgF7HGoolg6iF8MVTLs3Ja4oRBIa5pZdW/xAbOuTaf+08
 a/HMHckjruZ+5zTXwEe3dwxb263xGuVrqpibzHOYqsAmThBa9zRzlRESWkgP4Yw9ATWH
 4VklfcAt1PPOkVbWiNOUEuV8T4hjQIqSuqrwJ7jxt2Gbknqmmxz+vr+PwgE3wuPZtNn3
 AeXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfsq6tpCyuKMt/leEsq922aQZYWsIaHzpzIi/kxsxZAnxEGCTXdShLE2+R7pZCgW+wD7B41wDe5Q==@nongnu.org
X-Gm-Message-State: AOJu0YzQLG4hkEWFFIO7W0deVwLTqUvjWqrs/sg/yhBXZuXuXHzv/Xbi
 QZaF9nj+H1mjm1BfjIVQve6juk5WIJsPecxkC5dvU/Xn/jMtv7ceugmdYF0a2MpyQOnSoEUdmUM
 pieJCmCkpaHx8dgChj/Mmav5grZ4NUtySpItMjL9VIw==
X-Gm-Gg: AeBDietdrKGAN7Yt3Va0HcX5jYxLzw2Wk8LatxI4b1z7MIUMiqWFgu8L2gDh/waClBa
 t1OVrTfdWxSSU/BIFlVhKsZvG4WbPi0qMBn5b6B2/jO38TIChibPq50nf+PHhy64ddFFDvv4+Gz
 6unph3LXof+CHvv+yNY4sJ1HB8jEZFVkHVlyGW/mwtJ+U3ythSroa6OD+g+9iYprmY+7co9p+W1
 xXVNH/Er3CMrUlWiCeueTSD/4qoIcdBPOrAHvY1mp1h+mPws/h5XN5LXt3cmlsjHxabwXDotzWw
 QkmJTYnr7fxDQ5KvluscanK15VonVlowNNc9bJWv04VLNjHQfE9qiq2wAe5RfPqsB6U=
X-Received: by 2002:a05:690e:1341:b0:650:2770:804c with SMTP id
 956f58d0204a3-650486876b7mr22385160d50.10.1775728975927; Thu, 09 Apr 2026
 03:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
 <20260409-fix-unit-address-v1-4-946840930af2@iscas.ac.cn>
In-Reply-To: <20260409-fix-unit-address-v1-4-946840930af2@iscas.ac.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 11:02:44 +0100
X-Gm-Features: AQROBzB4vOFQCtBThFeVNhz-rrhkYkTmkKfY55-jiNqvz73txdiekCaE2oNV-30
Message-ID: <CAFEAcA9uoDVk+eu=V_twEyLH6f5pa_BA4oqd8GkXBwAazFqVhQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/or1k: Use hex unit addresses in FDT CPU nodes
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 9 Apr 2026 at 07:40, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>
> These unit addresses should have been in hex, not decimal, as per de
> facto convention [1]. Fix them.
>
> Link: https://lore.kernel.org/devicetree-spec/CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com/ # [1]
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  hw/or1k/or1k-sim.c | 2 +-
>  hw/or1k/virt.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/or1k/or1k-sim.c b/hw/or1k/or1k-sim.c
> index f1b1f63274..b851e48c16 100644
> --- a/hw/or1k/or1k-sim.c
> +++ b/hw/or1k/or1k-sim.c
> @@ -138,7 +138,7 @@ static void openrisc_create_fdt(Or1ksimState *state,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
>      for (cpu = 0; cpu < num_cpus; cpu++) {
> -        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> +        nodename = g_strdup_printf("/cpus/cpu@%x", (unsigned)cpu);
>          qemu_fdt_add_subnode(fdt, nodename);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible",
>                                  "opencores,or1200-rtlsvn481");
> diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
> index 39f54058ab..ac644f128e 100644
> --- a/hw/or1k/virt.c
> +++ b/hw/or1k/virt.c
> @@ -162,7 +162,7 @@ static void openrisc_create_fdt(OR1KVirtState *state,
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
>      for (cpu = 0; cpu < num_cpus; cpu++) {
> -        nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> +        nodename = g_strdup_printf("/cpus/cpu@%x", (unsigned)cpu);
>          qemu_fdt_add_subnode(fdt, nodename);
>          qemu_fdt_setprop_string(fdt, nodename, "compatible",
>                                  "opencores,or1200-rtlsvn481");

The maximum number of CPUs in both these boards is 4, so this makes
no actual difference to the node names we create. That would be
worth noting in the commit message.

-- PMM

