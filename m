Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1393209ejx;
        Tue, 27 Jun 2023 05:12:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7S7Cpz9sZKMYvzwXrI0P+69u3HJ1N6CDY9o2/VCAcFQDHYhmbCXJ+DvoYsNi/i8TnJzOvS
X-Received: by 2002:a05:6214:27e4:b0:635:ee77:8d69 with SMTP id jt4-20020a05621427e400b00635ee778d69mr2065541qvb.22.1687867958255;
        Tue, 27 Jun 2023 05:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687867958; cv=none;
        d=google.com; s=arc-20160816;
        b=n8LjdxW7HZHB3Q+XxGPbUL0zqtVQOrrPjmvehbBIM5HZtqFN7eNGegisB41uAiRard
         0sJ3YayinKCWmiMUvEPXt595RUQgdK9kGd+pE4lF4rVl+dCfSryBiSQMX8lUeJLZpbqN
         GKGO86yeJs1anwq0O9D4xK/8wqb1EzBtgV8RtG0zac9xwEO90P8uO1+LWs0WeLztUC3O
         bOVNVw59CF4hkhQwyrPHos7qh8rh19VxNa4LxWzxPhk/pCaSOR//rW6hiZZIkRjZ2Y85
         QvYZuDIKqlSAVBwNZRgHeSrlRI0/kr7KKgTeWNdwCgDvI22HJLdZ66zJ5XSCVB1rIdwG
         EdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+R0bx70T6FRoSzBP92juYNpgA41gealJZHkeJuD1QBk=;
        fh=wxXsFREv4Ek6t1hwyYmFWPnd1Z57BcRYjhnGgrbMJuk=;
        b=TuvwxUdzHzI5p6NXhUdQXpDPCo92N74W/UGCFxORZk5oWcXXrt54K/cfRtMXDoKGLq
         32deHUqtmXlca++xKYP27ZThcImiino9dyjkT7yIgzUuelr2bw7h6/Z05U9QxXl+oXCC
         CMC4/gK255T0iimLC8t10HyUf9KPXvXleOKnsrWFwIw8LW3/vsDW4UxmaiDw5DafPvy6
         FKgEFcnEn1OMPoyvD9lQ3jxfiAoG9EaFVCOjp68tke8kAozSKkFtM0y6NnQAml6elPhL
         jFr4OLjupgtV/eeAKcKN2BfY1ZVVzzyQFMWYRVFo3fLHfQEWzeg+09dlo7xkWlqyioO8
         V9eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1yZm554;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a05622a030400b003f78b03635bsi3029555qtw.768.2023.06.27.05.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 05:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1yZm554;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE7YZ-0005JE-LB; Tue, 27 Jun 2023 08:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE7YW-0005Ij-5D
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 08:12:24 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qE7YU-00023M-EA
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 08:12:23 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso2492019a12.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687867941; x=1690459941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+R0bx70T6FRoSzBP92juYNpgA41gealJZHkeJuD1QBk=;
 b=O1yZm554d1l/tG5AFVhQxYYr74GDUBmbAOH6uAFlO9BB49CNYiD+YkQAlXmYH7YAyf
 KVxpMbmdbKHFQEdi+oJXD3OBbgIgEXdj+0ecgzrcjbutzLOwgHF/H4sWu8n5AymjFPai
 MtK30tQplVD3HmmGfW21CjBQzLCNN/jc23/HOKFwLnT1Tn/GKGCKuZENefIz4I0xzZV0
 QsD+bEJZO+bbbwiM9XNl/DQSajiNPahdr7RGvWe9EMxEpwSGf5iQEe9mSDT2Wtw6ZLPI
 ZBk08H8LVRuopQAhDFBiUaVNL19cQnyA0y5Jnw3PvnmgQonACtnR7BCCi2UUsZ1Kq6oL
 1Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687867941; x=1690459941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+R0bx70T6FRoSzBP92juYNpgA41gealJZHkeJuD1QBk=;
 b=gUtFladHFhUI23yfgsLNeaf/kGjc1ltBt8NKEbd0lydgKLPMBCVGLBmGhpezhq3O9F
 qNq3HaYDJ75jEt9/rpGJ9otvUTbem+jjOODO8rPeSQtkS9RsYFe4jXN0TcIOr9hyErFf
 Fcg100qsfFOPe5pX+VP0qFcedoe50kJrBLv+uYyXdA4Lbn9jbNna8BiaFMyn/IczD2rq
 SwuuRWwPjQ2Ky0OKjvjF/keRGPkLbZQ+a+A0V3oLuy4vc803WlaZPA0RsRf+TzMN1SDM
 geWXjA2aX0foqcdCiD0DrFytV9QMu4yZefeLxnVbfn6pyjn0q2deQvizbqAdo2OQabBG
 Vtuw==
X-Gm-Message-State: AC+VfDxac+EZPIEtsOO3hsiAxFuW4RJe0rfkqgrLOqLOHvfJYvANz54K
 bf8x/hkX4vv3kXxQCpRuYcDyAO/gABUle4vV1v6E6w==
X-Received: by 2002:aa7:d405:0:b0:51d:907d:b927 with SMTP id
 z5-20020aa7d405000000b0051d907db927mr4636805edq.11.1687867940809; Tue, 27 Jun
 2023 05:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230626075207.623535-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230626075207.623535-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jun 2023 13:12:09 +0100
Message-ID: <CAFEAcA-K_2SLxbq90TpUyzLpiC0U2WVJe7ffaC_TH66K-=GV4A@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: add PCIe node into DT
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ydzDSfiYwyQR

On Mon, 26 Jun 2023 at 08:52, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Add PCI Express information into DeviceTree as part of SBSA-REF
> versioning.
>
> Trusted Firmware will read it and provide to next firmware level.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 0639f97dd5..b87d2ee3b2 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -171,6 +171,25 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>
> +static void sbsa_fdt_add_pcie_node(SBSAMachineState *sms)
> +{
> +    char *nodename;
> +
> +    nodename = g_strdup_printf("/pcie");
> +    qemu_fdt_add_subnode(sms->fdt, nodename);
> +    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_ECAM].base,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_ECAM].size,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_PIO].base,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_PIO].size,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO].base,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO].size,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].base,
> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].size);
> +
> +    g_free(nodename);


Why do we need to do this? The firmware should just
know exactly where the PCIE windows are, the same way
it knows where the flash, the UART, the RTC etc etc
all are in the memory map.

thanks
-- PMM
