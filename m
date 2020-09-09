Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp568484lfq;
        Wed, 9 Sep 2020 09:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGGlPSi2gnxL0B/u8XVT5sNe7I4F+sCE/Ng/0Xg9qiB5yGhFHHyX1UdRG73Kkx8jzudWwW
X-Received: by 2002:a25:dfc4:: with SMTP id w187mr6684931ybg.506.1599669165779;
        Wed, 09 Sep 2020 09:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599669165; cv=none;
        d=google.com; s=arc-20160816;
        b=mpGZyOcc7D5VkrZ70JMMPWZL//qVtXs6HsBtnTiqGIi9oLMM/2drrzrXywghuGmQQU
         MeRkVjxfznXS5FEZjntAs8+sCHGBQApcJj1W2MNJP6a3SBWZ7q20yHBogFx6pP3pw/E+
         pWhdT4Y7uixEakBti7QbRJ1jELxCoz9ZJbWKoGnBTEjMbnvowK205vAFufmkvNoWIF1C
         Wuo8IBQzoF6zoPZYkcXNzo+GXDdQPjVm6A9CCa6+PnKdWflug/1OJ4o5sa+WZF1UFLNG
         Wnl4Hf38EtANxWFcP30rG40jlZg0H81j3uFGwSvDDM7rtjcTvZfaVX7krrxs/e6CFVPQ
         gxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KXLyrBV+Zne9Kd9Fnk5SzTxaSXWRTMpJL9Top04nT34=;
        b=nAU01JkaqbkBMTKID80Wpig+GcBY0BEgWfj7P7PsJWBlAZJF0wugQ5h1LTywLo0tEk
         T27Q3rHkHl0laRy13WgGpggJ5G+cxLm3t+oZ9uDhpXY4gjsYu3tnHa+IMq3rh4mfK5Sb
         vKXHNG5hGBEsVy7XUh/vRwiJzwE3GTf3hXJvlNfN4IyeeOmIADKhqBrYlOf/QwubdiyN
         c8RxgoIZRhByGtPXGW0j29LcdDlth6injFoL2QToTuJxZ0roHkeQdxEYXwqShXb76X9+
         KDEsus6CurU949MuHxBvFJo8RBuU8r9uXIgVa/7yrw5ermN+ofFCM24/18X5p0yA0LQN
         i4ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=114l6nHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si3046264ybo.338.2020.09.09.09.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 09:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=114l6nHw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kG31Z-0000Ho-2H
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 12:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kG2xM-0004Cg-CP; Wed, 09 Sep 2020 12:28:24 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kG2xJ-0008SY-W7; Wed, 09 Sep 2020 12:28:23 -0400
Received: from [192.168.61.100] (lfbn-gre-1-357-82.w90-112.abo.wanadoo.fr
 [90.112.74.82])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6B04D21C31;
 Wed,  9 Sep 2020 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1599668897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXLyrBV+Zne9Kd9Fnk5SzTxaSXWRTMpJL9Top04nT34=;
 b=114l6nHwI7M/BzbZZ8cEoVJoqExbLtfFC/PaFqIf1PPkW8QYN0Pc42whw26WYHeskPspv4
 dbjWUH/80GgcjaxgA18wvwus66OEwLM9pzvtkY4oyHGFyZ4xlHwyblRjAYHVCB+uSCN4FB
 8KtPMO90CK0AGKBclJWxhBNMhov5DHM=
Subject: Re: [PATCH v1 1/1] hw/arm: versal-virt: Correct the tx/rx GEM clocks
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200909161514.622998-1-edgar.iglesias@gmail.com>
 <20200909161514.622998-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <3973f926-c038-25ef-a159-db680def4ae9@greensocs.com>
Date: Wed, 9 Sep 2020 18:29:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909161514.622998-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 12:28:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.576,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k6RyZ94bdGrR

On 9/9/20 6:15 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Correct the GEMs tx/rx clocks to use the 125Mhz fixed-clock.
> This matches the setup with the fixed-link 100Mbit PHY.
> I also avoids the following warnings from the Linux kernel
> driver:
> 
> eth0: unable to generate target frequency: 125000000 Hz
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   hw/arm/xlnx-versal-virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 4b3152ee77..43d74b850f 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -212,7 +212,7 @@ static void fdt_add_gem_nodes(VersalVirt *s)
>                                 s->phandle.ethernet_phy[i]);
>           qemu_fdt_setprop_cells(s->fdt, name, "clocks",
>                                  s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
> -                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> +                               s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
>           qemu_fdt_setprop(s->fdt, name, "clock-names",
>                            clocknames, sizeof(clocknames));
>           qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> 
