Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp170890lfg;
        Mon, 16 Aug 2021 21:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/YcGMjg38hhZubu/2hT15Ot2rBJXCrp/9ZX6R07Fw73IuiDlYOoqj5SSyCqaNCRid1uzR
X-Received: by 2002:a25:e64a:: with SMTP id d71mr2145796ybh.142.1629175535672;
        Mon, 16 Aug 2021 21:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629175535; cv=none;
        d=google.com; s=arc-20160816;
        b=jILKESkuSDpapUH/KS3c1K9h9QZYRb2DGL36rFE4Erl6RFvZPhFTSMWk5Dkr6MMuuU
         lSkKVAF8wVvCz+ELKVwxaMKO5ykOXtGoqDbMGxJ8cFoo3b0p8dfTnW2qPhMgvxCm2t5P
         yhsqTnZ73PJwnSWC3LKQYVepj2/Vze77SxJvix9MtMklTnDRte78zqRkGhxX4CtyaXws
         rguknOtBv510JON2/wTzaPLaogtvSUstrC8moqbuuPAw0UUtiSsL7kvpT+LARCNHiyjx
         t0UlrCOjHmpWccl2wf/z9OYQuaFPJBZt0GkPP7BmRX0L0fftJ7BuD+2ccTZoywjohKx+
         4u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=8tttkbUxKuusxB9w6I46dtIKckY6h/KahExYq8PSW7I=;
        b=GAkXrs27KK5YmqmWv+y98x4vzOwP6Cv6CDG2+dN5wHRaS9jIS4ihKnLhRjboQuZY/V
         HU3Z1VGqxz6KJGrLEqMc9Oj+a3N6NT+KcrI4vKmWr2p7Dy99oT7K7j3ldCdZ7fH+a36W
         i5hiRelWPUZ0AygwjJ+H79+rvIX3uCUbwGeptqaFjKhZrMFJ2U98K6Ez0k2Bnq2djKUJ
         1OLqqNddh9TQzUjGTw54eOmR4lvb/Sog5qGzbZVyka1k8C2aay+GVJSrn4ReE3MCiZAv
         9KDXee+i74F127ewg+WB15DjkRx0BWx0nEm7K7kbpNsTeE87/2ACbIy9uDWbyM1HPm1/
         p7AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=AZ+spmf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si816994ybk.205.2021.08.16.21.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 21:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20150623.gappssmtp.com header.s=20150623 header.b=AZ+spmf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFqyl-0004am-2U
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 00:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mFqyG-0004ad-KL
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 00:45:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mFqyE-0005qF-8m
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 00:45:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id nt11so30104870pjb.2
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8tttkbUxKuusxB9w6I46dtIKckY6h/KahExYq8PSW7I=;
 b=AZ+spmf8KlZ+CelCa8GFd3V/wtfv5w2OM1wwCHp8fhRPZ0ysZWt2V7HoJ0Iz4SLudn
 Ge3dqt3mmGzBAJR3pDuHTR9q9b5CTJw7gzUiiWpju3K4wto2B3bby/j66HRBtVmzr4uv
 5usVk/894LVmmVrCX8rk7jQAXHnAh0JLHj3P8Klalq2gbXpVAFvH4c6PcFEWr2yudpPI
 Nit9hbU/NTtBmXuxJpnJYhjqI1v+HMtJpsDAzG2gBgXVLw7/icQliCJa8XxOjzbnWUWU
 gQQkOitMI5vZ9InE8eLrR1gIQyzrglhbGdeiH1K4axiBX6dHBrFbiOTkzeYvfdXqbz3o
 BVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8tttkbUxKuusxB9w6I46dtIKckY6h/KahExYq8PSW7I=;
 b=jR2FCRohR2kptMxfbGiO16nyF4rDFv5qUs3vFUdNlJYHk2n+87BWvPfCJ+gVFCFAai
 UptViZisyEfY609Thh1Buny4ya/peAsfLCu2Hd8vK4oMN0tLtQbZ0Pn+rHmhWD+o4vx9
 4+/4URhs1MbGCwrOWAUFOB0RN2tJtJuRO7dPiioudofPT1tHufwz3EeQaxK/A1wEcFT4
 dskOmNWsY4wimVAD2REEP0EinI/eUocQ41rlkJ02um/vClO6injRBkY+F62ZNeJiWBge
 +hhWTn/t3FwvYN6zncuxaJvLM3p+paf2GwSemM5lsTfI4ml8fm9QQJzBLGZsPnViMR7H
 mQsQ==
X-Gm-Message-State: AOAM5333n+Ot8wXQUI6Z5LVakAqtpYFppXua+AFoezEIaFk2ogI7hTi5
 MRv1tigeswQnM2cpUHBRnvhoWQ==
X-Received: by 2002:a65:5342:: with SMTP id w2mr1639875pgr.333.1629175500550; 
 Mon, 16 Aug 2021 21:45:00 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.245.86])
 by smtp.googlemail.com with ESMTPSA id m2sm807719pfo.45.2021.08.16.21.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:44:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 17 Aug 2021 10:14:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
In-Reply-To: <20210812033405.362985-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2108171014500.202364@anisinha-lenovo>
References: <20210812033405.362985-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aRUtA4qAw0VQ

ping ...

On Thu, 12 Aug 2021, Ani Sinha wrote:

> ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
> ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
> explicitly. This is a minor cleanup.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/arm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 4ba0aca067..38cf9f44e2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -25,7 +25,6 @@ config ARM_VIRT
>      select ACPI_PCI
>      select MEM_DEVICE
>      select DIMM
> -    select ACPI_MEMORY_HOTPLUG
>      select ACPI_HW_REDUCED
>      select ACPI_NVDIMM
>      select ACPI_APEI
> --
> 2.25.1
>
>
