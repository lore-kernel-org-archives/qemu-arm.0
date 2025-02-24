Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1878381njc;
        Mon, 24 Feb 2025 05:49:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+XgwQyr8ex5AUdny128hN+ywSYgH7jlKh7Gh8GQXQKcZqKoiOntMgNvJ56ChHDHZKoPQRP+fvfwtLtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3erxp6bJNMIWa4JcFAw5sPTMBshvoYqGxXrFILnetqqZqj8+TyURDO975TrTBJkGnRZCK
X-Received: by 2002:a05:622a:354:b0:471:fecd:103 with SMTP id d75a77b69052e-47222944e7dmr186465241cf.37.1740404978690;
        Mon, 24 Feb 2025 05:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740404978; cv=none;
        d=google.com; s=arc-20240605;
        b=HL++wtQlOUxxn5wi7tL9KBNtPVqvQIplo6fCLiRj2opqfHWuVzUiQA7LUengfR+T/6
         5IxPhX71xXUGJ44MGwniJN6Nmsk7yLR6e5z0nQQsee5esVJnQND5d+UZu+1mwXNtRBtZ
         1CpJVAit0CtIxdzYthuJnVzazNZNVFeL0Ah8LyDby/LfgXAbgeMbyf4aUk0ehENc8rbN
         AHXvYy4mXPWzP+sDX5I4QhRX/72k/0J/MylYm9KzeASaVplV1+mH4UwKoJyD/ZeQ6slm
         kTRodxKKTH4s6tV8lE/w5DE2bbhbW+wxNFDpv1ktgodl//abtg+/0/7K7RKjXaOangAz
         az+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I+M4tOQ6mll5tAQYc99RXePAKGb1f81J/xwo1gTYimI=;
        fh=zNa1wHnOOQ2JHtTyEChV918fWfG2eqp0Bal2h3cIVgM=;
        b=epbe6qXg8NO8JxgUOYkC6M3wZAfTC6CD027/1JhoDdngMcsB8qfBLBKmpoyMlpi7GS
         yJvLn8huRHwNVrf7aoeuPKDsSoaGwdYF2YH01ZXT7cimhxJx399NvIL7fwjrzcZQ9OV0
         vCAEMa8P+40DvCHTyXYLnVMEWyKINMDfLHanxM12Ua0KrvGazmlfpBif0HWFtdAneYOF
         eeoGrowxKqFNb8mZFiDjbiI1Yx3zVxnk0zdCsZ71PUKTNyCoatI3syEIskB+bfBlVuzo
         BXURpdZaiqWlIohOXu//AxAEGdSKxFGxQ1APMMaK720NVPZvdb11GFK48Uh5ogrYs+jm
         nl/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGQKM+oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f05b5a79si141081651cf.601.2025.02.24.05.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 05:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nGQKM+oh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmYpd-0000BK-Qo; Mon, 24 Feb 2025 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmYpc-00007v-L8
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 08:49:12 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmYpb-0008WV-5G
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 08:49:12 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6f7031ea11cso37898787b3.2
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2025 05:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740404950; x=1741009750; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I+M4tOQ6mll5tAQYc99RXePAKGb1f81J/xwo1gTYimI=;
 b=nGQKM+ohkOr+XZu6pl3LrmS4lQ0q6an0e0Y1V764w6lGIWhVZohoiMgr8zOUTKAZbL
 FdOzV/fE7SjwKOnQIeu3niJntufIxarq9H1B/7NVbKLgZuGVcV408tyZAsWsd9zL8uxL
 cJj+qmCL3JsF0xBsW1gbvd5sxsL0ulbt10e2vLbOBRXyH723sAkTgLSQvt2So8y91Bqk
 Mv3If2WrJBjLtzmuVevez+9XMs0fbD+7gqwZeQovDlY3ZMquHQ73l3Lo4YRl0cUv3DFj
 F9KoesB9qRz8vuo21ybiyD6MBA2EV72OqaVRmFRNDRjHWPnT2NDGjEDv4ZBS8fiM6XtE
 Kk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740404950; x=1741009750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I+M4tOQ6mll5tAQYc99RXePAKGb1f81J/xwo1gTYimI=;
 b=Fv2DdFjP1ZFIBckJXWppscQbR7rFHaQjbuME+huOgir6sKQemMjxcHDAG/k5inuJen
 TTcbW7QszyV3oB2uX/FJBStNUKPLwU4qIqIppBD/QbJNpS7XIOWG1EegsxMgL+aVh118
 3jMcrw5N/4LNkjL6N4dNSWg3cePYEvYWzNTYDZZaacsNe9fP0GCkS5tFM6XPVV+pLyif
 VCMDraHH/GplPE+AFFOY1YEIGqtXjnC6KB6LEwvjjmvea5uyio1Jtl+JeRpsfHyoGRBN
 OCiXe7AuzRTYehRfooVKrmSZU5GsZNQU/FabXTLSoLmok8CuhYLfWZwfH02JMSqpaKWr
 aT6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU87JwOD0/Jl96U1BsLDIs+7Bwb3zy8uPgyXrHxq2dcd5nXFv2UmGJq8scpJGlkFVvEzEiL8mRJLA==@nongnu.org
X-Gm-Message-State: AOJu0YwfRST9yc85E/rnwFSc55T5A3JuwZNKr82ERxK77zn+fKAtyDy1
 lihVuc2qlhui9Sqg3Hkj1BCDDOZwzDROSeVztGwU3JLAs4pqiPugdSn57dltYfXqf7jc7Xwb8hX
 tS7hcahOCwfgW9ntJcfxrDxCLjhfYVtRxUAtReA==
X-Gm-Gg: ASbGncvuLRMQSYUgQ9IC8HR5t7GP5VxOJQWUiSauYwgj6086kPbZg3uOrFXqjdjsfTG
 Rbj3I4FQjiIf/FfZO+amrkYRgO2UOYxNwqVRBrmAz7WzhWwapeJt1Gl/LH2PZabogw4eOZ+u0CH
 bYwADnIHH+
X-Received: by 2002:a05:690c:4989:b0:6f9:82a8:e5dd with SMTP id
 00721157ae682-6fbcc365f82mr103673837b3.29.1740404948039; Mon, 24 Feb 2025
 05:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20250221145419.1281890-1-mochs@nvidia.com>
In-Reply-To: <20250221145419.1281890-1-mochs@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2025 13:48:56 +0000
X-Gm-Features: AWEUYZnEk0p8LXBYiirBPHKlN1COmmRsO6ZpuSdANnTpj-SFDWKtD4UfC-sN3ys
Message-ID: <CAFEAcA_8DwF21QnFxR8F8xNi4ZgvtVa4sgFOuymZt+W9mxmb8A@mail.gmail.com>
Subject: Re: [PATCH v6] hw/arm/virt: Support larger highmem MMIO regions
To: "Matthew R. Ochs" <mochs@nvidia.com>
Cc: qemu-devel@nongnu.org, nicolinc@nvidia.com, nathanc@nvidia.com, 
 eric.auger@redhat.com, qemu-arm@nongnu.org, 
 shameerali.kolothum.thodi@huawei.com, ddutile@redhat.com, ankita@nvidia.com, 
 philmd@linaro.org, gshan@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cdqao5zOlIga

On Fri, 21 Feb 2025 at 14:54, Matthew R. Ochs <mochs@nvidia.com> wrote:
>
> The MMIO region size required to support virtualized environments with
> large PCI BAR regions can exceed the hardcoded limit configured in QEMU.
> For example, a VM with multiple NVIDIA Grace-Hopper GPUs passed through
> requires more MMIO memory than the amount provided by VIRT_HIGH_PCIE_MMIO
> (currently 512GB). Instead of updating VIRT_HIGH_PCIE_MMIO, introduce a
> new parameter, highmem-mmio-size, that specifies the MMIO size required
> to support the VM configuration.
>
> Example usage with 1TB MMIO region size:
>         -machine virt,gic-version=3,highmem-mmio-size=1T
>
> Signed-off-by: Matthew R. Ochs <mochs@nvidia.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
