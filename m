Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp261377eja;
        Thu, 22 Feb 2024 06:06:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUA31q5im5ISUqIzMPuvWQYJvK3gcOgXlwrs3m16RNwW5lrdpimWp6eR3XDCRza1b2sDABq6o2/P8sc1KqHWZ+wvYzY7VzN
X-Google-Smtp-Source: AGHT+IEe4hhAOBgR/GZNv5Yac3A+7xt0q7pkMAg8WbPjTxJlI/34UCvtvHJxlwSJm92T7kwWs4b5
X-Received: by 2002:a05:620a:3b8c:b0:787:8b7d:5bdb with SMTP id ye12-20020a05620a3b8c00b007878b7d5bdbmr4589846qkn.34.1708610808131;
        Thu, 22 Feb 2024 06:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708610808; cv=none;
        d=google.com; s=arc-20160816;
        b=IhjxCNBO6Uew0neSbv6r/Gbz5PWKG6H9lVTUyJiMEroGt0gMcVWRkj2S07esPsKGDU
         kIN7vOgCi9mloHRk7QFe8JicITeaYAHOiY1ebZX0GN2xMab03hbnh0BCsg8neJ5B4AyI
         yGW8n18zZEDS1GscXo77KE31Ao2I3O4QpiDrMwf+Yi480PctBDRRiypg1lbxZbvnNfDS
         l9IQQs7DnbcK7jUUGtwuZP9m5Kxu0P7lWi7Deq/nQZpAQ1rG+TKF63NPfw+pY4nayual
         l70fkCnj4jIdd5+B5Y89AtkFDRxStF2oG1EceuLv8ihh8Bl4AVh1xtPTtMXk8fE+QA/h
         X3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/gN+lxFiYIXXg/JZudh8kyx+u16dFl+hMXNnhT9WrOo=;
        fh=+90cESXR7K8Fmmwu5ql562gtHaiuxLsbt+esAzN6Paw=;
        b=dIxRDULFStE32oC0VJhXs+fMaRwPUSq5fcIiLzzuq7FacM4jcO1UMilIar5wHqMEio
         eBd9FVGvrlUR3tXNZL2Ow33v/Tn90whvn4SjSh+WznvCQTONy7P4s4/92HqqAqv1mCno
         aPYbCGBZ4gJ5vpgwPjoB5qh0Nz6jsSEUrwA/OW58wcqoiEzlKa5zngcsB7xfejVv7jHX
         CFRQQbmPvDyvN2zKuv7rudDXftlgDCwuwm3SkQLfvdh41dP0isxFKt5Ibhcz3kQGl3jp
         OCMfzmxYyb8nTOQXXADEoCRazgrTHd7wrM/2vOQbc/aidySUjdiXMYzZm46M9W23v50G
         UBbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cahoZx/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05620a454b00b00787a19f9f0fsi1082561qkp.126.2024.02.22.06.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 06:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cahoZx/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd9id-0007XX-Rt; Thu, 22 Feb 2024 09:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9ic-0007WY-Lp
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 09:06:34 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9iZ-0002ie-CE
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 09:06:34 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so11460003a12.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 06:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708610786; x=1709215586; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/gN+lxFiYIXXg/JZudh8kyx+u16dFl+hMXNnhT9WrOo=;
 b=cahoZx/EJXNOvr/Y6daFJZHEoZ5WHBgXd8fzS94h4TNsLmX5JsGyAk/xBqybNgR+nh
 8pWd61NnFpyNExKTRhZq8dqt7L9JiF7uImJvtOabT8XjUX7eVUAhHBCzmLJkXp3mLIkG
 yMcPbwAzxC5ChstOufFXWKyUCDVPaGkGpwz9XQBJGTC3w/jh9pDfFuiQB3hZ30Bb/Tpd
 H6ZP15Kwup9S5sp793lbpsfGOStG2dCgOQ0xJB2Pw6KAxKUaWWWeZTKj4BvipdnjTTiE
 fd5/3QtZi2yQu/G+/neTDqGGXf9mganalrqzaK6OXAK+2xte98vyqHjSNkRqF39jFTsT
 0vJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708610786; x=1709215586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/gN+lxFiYIXXg/JZudh8kyx+u16dFl+hMXNnhT9WrOo=;
 b=FUZv1qLUa4hSylVx3STxiLsThWLX4sAMH20chQSgTCVTVpxSbSt2b5EPkhKMVLfJqC
 DwjOuc+UzOtPhz7PVFLXUIKP/nqsL8kYCSBAovJTljeyv+ttRaCTR/4k3nFtEEIcUoAt
 t0mkl6gN9YFnWzrH/qGHIsowbkjWOzuEMGqcaSf8MRBP67RcVTT+t90rVuxw2umDt7UE
 FUT/OWrX4Thq5jt8aovpBW7o3v6CEmyk2tdZNefq46oFjRfdgLznOgwWhpHJYpa7AERf
 FxjlqhzLitvoS4SFQwdGAvZPlVSUZ7KGTCszBl3MmAkDHeRrrO39pnOMP785GDTdeEn2
 B3vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcwCPSwUT/EIGeuDEWF7VNM3z8y7MZHX3n/i2Bmb0fPWGWFB++WQG/H9zQ8LupVm2BddlqZVAVKW0AvO1xLzVp3dcW
X-Gm-Message-State: AOJu0YxKzH9iXM3WbCQtdWbkmJQsaJu60VMknPMLk59L2xgVdIcf4ZKB
 x/85p2Cxj3UvFjr/RG4J7IMVqjM1MmW1qQfk51QxJDf238yJCW9jZZTx8iNWloMQlkE5sgtVTrp
 zBM9rRWsV049miPip2TT6T3YcwzWjfjc4+xhAJA==
X-Received: by 2002:aa7:db42:0:b0:565:d5b:c9ab with SMTP id
 n2-20020aa7db42000000b005650d5bc9abmr2697386edt.39.1708610786663; Thu, 22 Feb
 2024 06:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20240219105637.65052-1-sai.pavan.boddu@amd.com>
In-Reply-To: <20240219105637.65052-1-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 14:06:15 +0000
Message-ID: <CAFEAcA-NBxOa9fXW6kEN4cyFgxwzO1dWOHxsUNcOj35YYnY6Tg@mail.gmail.com>
Subject: Re: [PATCH v2] xlnx-versal-ospi: disable reentrancy detection for
 iomem_dac
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: AwAk8G8yyi4K

On Mon, 19 Feb 2024 at 10:56, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> The OSPI DMA reads flash data through the OSPI linear address space (the
> iomem_dac region), because of this the reentrancy guard introduced in
> commit a2e1753b ("memory: prevent dma-reentracy issues") is disabled for
> the memory region.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
> ---
> Changes for V2:
>         Added code comments.
>
>  hw/ssi/xlnx-versal-ospi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index c7b95b1f37..c479138ec1 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1772,6 +1772,12 @@ static void xlnx_versal_ospi_init(Object *obj)
>      memory_region_init_io(&s->iomem_dac, obj, &ospi_dac_ops, s,
>                            TYPE_XILINX_VERSAL_OSPI "-dac", 0x20000000);
>      sysbus_init_mmio(sbd, &s->iomem_dac);
> +    /*
> +     * The OSPI DMA reads flash data through the OSPI linear address space (the
> +     * iomem_dac region), because of this the reentrancy guard needs to be
> +     * disabled.
> +     */
> +    s->iomem_dac.disable_reentrancy_guard = true;



Applied to target-arm.next, thanks.

-- PMM
