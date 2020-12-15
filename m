Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3364819lfq;
        Tue, 15 Dec 2020 02:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI+UUsyamtsdkkMOb+7qfKeQ71TnTgFl/I4BA93nnwxRRnwjc+7ezGCPyFqgejTILqjuQ9
X-Received: by 2002:a25:5844:: with SMTP id m65mr40647151ybb.46.1608028148876;
        Tue, 15 Dec 2020 02:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608028148; cv=none;
        d=google.com; s=arc-20160816;
        b=tj5k7uMpvbwgdz37Kye48/hWalW5YJyBN3CnuzvEDuDiR6YQJ1VFicWVb6My9GYOmc
         uWvrNbwz2Y0emvbev8+sc23hdMuc44ppSbrTNTA6dX6iQSOMmX0MEuPLwq85LJilYCKl
         aALem3G5adnEmIuuD6CPb6/EGPNECNx9vnuVFyCXEdF6RiTPvZvEm0HUQG+NKd5zZsq/
         0FYvBz4WsLv6W6ABIpCGf19rRzEGi9fZPLSHmnPO7mD0xy2+3nfXEqzDdJ4OvQxbrtLu
         nqiJHCfaTNcEQqm+ZEBL9FkrgPL7gLEyFZVPe0Z8iMaaIQ2cWR/d+rKTytWpp73KUF7o
         fDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vp81HsV1iQ+PMc9LD7SqthI07dLGzBlC445E7TNpubg=;
        b=NAm3cmvSI1gNzCHMxyVWTFXnHmGPGHTfDdwBEKxHi4/sn9YiV2w6ofpsniyTrIIMUc
         65hkTsTxgvBfQp6Q7rHMmb+1PXeGpROcEzAvdhcM8O00Z7fhuVgnYKbs36MUMbLwF33E
         WoZSt+oAfZGEJGZ5H/VC4UgqGEUC7nKEru74N9YiKOpmasFC3Jmp9oenveaGOIekdb5H
         YdZtHT21dgZHfohC2J5MD3XrhFo9RIhFK4RWD8UIy5D0roQvSRH0PyKuhs4pzh5Pih6g
         Wa9Icr5l+G91UirnZcCTJVSDCBScjRSOt8X0IS6829MF3plMRcy6bSjfDx/UxqMUBSEi
         xMFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BuMfUZm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si12259927ybo.197.2020.12.15.02.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 02:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BuMfUZm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp7Zs-0005dZ-4u
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 05:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kp7ZG-0005dK-Eb; Tue, 15 Dec 2020 05:28:30 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kp7ZD-00077w-Ui; Tue, 15 Dec 2020 05:28:30 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 1047B21A8F;
 Tue, 15 Dec 2020 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1608028102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vp81HsV1iQ+PMc9LD7SqthI07dLGzBlC445E7TNpubg=;
 b=BuMfUZm657kuZCKlQZ/AORiOmaux00SqzQQkB/orprTh+R+WIWLiJ9B/mXNwn7HebHIRw/
 c+4AFaJIFo8ZIfdkxhwAj84q7casZlpF+k1vjZgH1J4fRdZhBKVR8jHyjiFG6Tg7fNmcOQ
 LjjX0mVost0rZ/kRDiz/qzx1HWFj33A=
Subject: Re: [PATCH v1 1/1] intc/arm_gic: Fix gic_irq_signaling_enabled() for
 vCPUs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20201214222154.3480243-1-edgar.iglesias@gmail.com>
 <20201214222154.3480243-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <4629d690-3e6d-69a1-c5f9-2b6faca51bc3@greensocs.com>
Date: Tue, 15 Dec 2020 11:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201214222154.3480243-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 figlesia@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mDm4JnWFibR9

On 12/14/20 11:21 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Correct the indexing into s->cpu_ctlr for vCPUs.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Hi Edgar,
Nice catch! Thanks.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

-- 
Luc

> ---
>   hw/intc/arm_gic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index c60dc6b5e6..af41e2fb44 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -141,6 +141,8 @@ static inline void gic_get_best_virq(GICState *s, int cpu,
>   static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
>                                       int group_mask)
>   {
> +    int cpu_iface = virt ? (cpu + GIC_NCPU) : cpu;
> +
>       if (!virt && !(s->ctlr & group_mask)) {
>           return false;
>       }
> @@ -149,7 +151,7 @@ static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
>           return false;
>       }
>   
> -    if (!(s->cpu_ctlr[cpu] & group_mask)) {
> +    if (!(s->cpu_ctlr[cpu_iface] & group_mask)) {
>           return false;
>       }
>   
> 
