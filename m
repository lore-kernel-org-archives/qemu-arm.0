Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp620130lfq;
        Sat, 9 Apr 2022 12:20:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZvNdO0k/SRRiHPYKkckiPJBJDl9+Re+ePAG69kZzI5Ism7uz6YW04qtXBo0mUais9eH0R
X-Received: by 2002:a05:6214:f0b:b0:443:c100:737c with SMTP id gw11-20020a0562140f0b00b00443c100737cmr20771338qvb.38.1649532046342;
        Sat, 09 Apr 2022 12:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649532046; cv=none;
        d=google.com; s=arc-20160816;
        b=Cfv6E0+5VrJL5O9LxmxEOHlq/4GR9VsBALUB1bX0pV4OUsLPmOzemluxhE8zl+fu/Y
         ZF6zuzMeIzDpY0rjClnigricNL7Qeuk9EIeOvPUlcjNhcYySAvnnh3v6MYLCzgAziKZj
         Cy3Fz6pEhr7NCvWvXKfoJp7PajK1iyYCcwCw+zgHUqts/LdNf3yvqLDfGju40EBhKMSp
         qNFH5oR1XZVB2tWET49bM9ZvbNxP1WahFe7tB2aaIiMciepi0DZl2w3BH+tBDtZba+TD
         IChOX8GCYPrloOuQQUxuz5kTwNE4fmXHQYi59z97a4mksIhxpuJDFTqCYWYomjIpS0cd
         rAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=is6yeiSacSKhf9W+7glsLtTAKVzs4aaTXeLOlqtIRb0=;
        b=Qxxh2EuzvlkmQ2Ij8QobYWBAxVGt5TAuudgtlKsv6yM5oyiSP0kkuwdxReh341cSiC
         dgUV5hEu3P0OfSc1+ClqdWj1wZKBDkryxjlDYBaBgZ9/hNerF9QUuseniKS03O+wW82C
         slw0TaPt5/EJ8snfXwoM4vLQxZR2/fa3Cw7UUcFRnLNUPPZYfdJElHA/BozuwoGhrolc
         s0vO6RDSA8W0PFZkFqLGtuHIpAHVrTMxmREKP4vQ0KPg0Ul56J/Kl9Dy8wME6wDFYKvr
         BeI3UIycv5r2kCumKWgn9g+wYLTMqSWGP7utSAtzmkH3Y7DCqGuMR+puFIu6A8fJfhGe
         k0NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QP9y7PrC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020a05620a245000b0067e4be23a8csi2643790qkn.721.2022.04.09.12.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 12:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QP9y7PrC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndGdZ-0001TY-QR
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 15:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGdP-0001S4-VH
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:20:35 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGdO-0000jp-AJ
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 15:20:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c23so10760585plo.0
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 12:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=is6yeiSacSKhf9W+7glsLtTAKVzs4aaTXeLOlqtIRb0=;
 b=QP9y7PrCzIyC6vAH1VfNn7jPjgWVuzOKcKreWdeKXxr0R8vVveU7bGQWAQ4tHG0XhX
 5TYY2G2nzULWQ0Li5YL+fQt5xfsTd1AqfodGoKXa9R7mx77l/8V7GABRHuUYWQl7nwmZ
 3LzXLPddjtPovRpLfJfrxab9UwC+pxu51k51QozcN+RTJU0yNi+N9l33q0b+3ZH5i57D
 OJ5y8ybOwffT+r5exrDn8VJVGDvXqiNWKLWSq2yN4K0zjiItPPNpzNHYKaitVvT6wxhh
 H8J7vwR2BXJMyZqWVFsXPzR5xiq8jBZb3n+VvIX1Z1+m3bJveYAzHAG1MDG0GJ7DfJZM
 Qy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=is6yeiSacSKhf9W+7glsLtTAKVzs4aaTXeLOlqtIRb0=;
 b=SVrkZRbe5sjumP/DbkgPnX5HU24cg6HAxnJGi8QSRq5xJqaxJ+cd/VDKSBRx9HcpWw
 4KrmDpmE6bg0PbTjLt75eNLImyCuiFwtmwDBDXpwJ+LBTz01wVuCFhRIM0QUvhnJvf6j
 RgnkJk3c9MFHRdFK0O3vohvKsxBIAHsafhu1zTy/lzdRf+iVSU8A99YbmuuatGB5YAnE
 ZMKZkBcsjwCkgON7tPFnz06y6DsxjEhs8Sbng4b7JP2LwM6+wTG6TO56f4jqKikAi5Iu
 oNWByhBWERtm+AZRZlIjEYVVUkfC2TyUcOq4tbvBefE32rbgG+m0rZbMf91bMcr1SooZ
 vozw==
X-Gm-Message-State: AOAM530u1Y/gFQVV3MndDOLOGbQarYqJTRqSxAaLy0mQtb6BFAIndiBU
 TV4oOoFqIOpqHO78v5c2zIsu8Q==
X-Received: by 2002:a17:90a:14f:b0:1cb:55d9:42d9 with SMTP id
 z15-20020a17090a014f00b001cb55d942d9mr8173653pje.196.1649532032692; 
 Sat, 09 Apr 2022 12:20:32 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00088a00b004f7ceff389esm31471726pfj.152.2022.04.09.12.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:20:32 -0700 (PDT)
Message-ID: <3a9e2d33-8174-d480-50e4-4da0985bc486@linaro.org>
Date: Sat, 9 Apr 2022 12:20:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 25/41] hw/intc/arm_gicv3_cpuif: Support vLPIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 16ZvQSWPz048

On 4/8/22 07:15, Peter Maydell wrote:
> The CPU interface changes to support vLPIs are fairly minor:
> in the parts of the code that currently look at the list registers
> to determine the highest priority pending virtual interrupt, we
> must also look at the highest priority pending vLPI. To do this
> we change hppvi_index() to check the vLPI and return a special-case
> value if that is the right virtual interrupt to take. The callsites
> (which handle HPPIR and IAR registers and the "raise vIRQ and vFIQ
> lines" code) then have to handle this special-case value.
> 
> This commit includes two interfaces with the as-yet-unwritten
> redistributor code:
>   * the new GICv3CPUState::hppvlpi will be set by the redistributor
>     (in the same way as the existing hpplpi does for physical LPIs)
>   * when the CPU interface acknowledges a vLPI it needs to set it
>     to non-pending; the new gicv3_redist_vlpi_pending() function
>     (which matches the existing gicv3_redist_lpi_pending() used
>     for physical LPIs) is a stub that will be filled in later
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2632,6 +2735,12 @@ static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
>       GICv3CPUState *cs = opaque;
>   
>       gicv3_cpuif_update(cs);
> +    /*
> +     * Because vLPIs are only pending in NonSecure state,
> +     * an EL change can change the VIRQ/VFIQ status (but
> +     * cannot affect the maintenance interrupt state)
> +     */
> +    gicv3_cpuif_virt_irq_fiq_update(cs);

I'm a little bit surprised this is here, and not in arm_cpu_exec_interrupt (or a 
subroutine).  Is this because if a virq has highest priority, we have to find the highest 
prio physical interrupt?


r~
