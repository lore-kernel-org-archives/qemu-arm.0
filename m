Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1089241ejb;
        Thu, 7 Mar 2024 03:57:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURpC4yLg8oTjNX0RJSSMBsPUZlkccY4Jicjiq479WUHTM6XgvWZyvMPenmSCBOUUFiY3Ea1JIIvv1Ap1FprBJCZye+nb+g
X-Received: by 2002:a05:6512:3a92:b0:513:4a02:1fe6 with SMTP id q18-20020a0565123a9200b005134a021fe6mr1625897lfu.64.1709812647483;
        Thu, 07 Mar 2024 03:57:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709812647; cv=none;
        d=google.com; s=arc-20160816;
        b=PEhhMHF89mzo/6DYYsrVakipnD9E9Z70sugBCXcYZxx4p+yocSFxm7yuru1Ns4UGLX
         oC7TgkLbV/fU/zndHvFjKCNJrvT1fhTxhzGaUnn5W6ql7VSB/18p7tMpxclHj5Cv8mgY
         Kf6fvpJQicLZBTvW7ajMfg7jMJdJXm7RUuWAQpSqNxKQRwKUojCTv91QKqitrsxkMD8c
         ZmQJjm25+KWfR93UPpFYuFfnUHTuiWOkSNJ/4xf76aq1tBZWzEU9nOv0ayi71twCRbkR
         yZme4xbnSMp8mO2fsl5C89YNau2gS2zcxGs+gdyAi9gdCmnc8sqEzuWdn1mgw0cGvE3f
         9X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=57A09yidrpDPUR1r7F8CHS4CvBdl9GurP/NjYKl3Cg4=;
        fh=OWGA9vUjtp1UdvplLRtb/MoiqqGFnwrePB1YCRZuJUQ=;
        b=w0Tfh53HEIVGm4VKza6cfP4P8nMmpMfhIkpmAFr52GGzwjMP4RljpWWVhub+WfmQ4j
         pWt9Vsf1c0SAB6BghvV0zvRFAWmtQdgBUBZZPMvVO5Zr0nO57pShgE0YVfPvimzS+Pde
         knrZjbVtRBcIbjEWhUllbRLAzUllukUywBtd38p9mbo1zy8YzFXnHmVsdfM7d8iN5ljm
         bEaNh/yL9vSSCY2uErjkyIaOUS2TV3Rg4t/TM5ReUD01edrcTq8RPf9WKEU1zg+Hl32O
         12d6cLppBNuNJmePamyLxFVeYS1Oiq99OHElBG1eTWrDqen3yj2P+TyXzN+RoobNkP+5
         TkuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKX0zyAp;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h19-20020adfa4d3000000b0033e01fb6d2esor923355wrb.6.2024.03.07.03.57.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 03:57:27 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BKX0zyAp;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812647; x=1710417447; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=57A09yidrpDPUR1r7F8CHS4CvBdl9GurP/NjYKl3Cg4=;
        b=BKX0zyApNCtKRAtphmpoh9175wIqaduIon3k3HxJNdnyeXxoF/U0yOsemBmj8IysA/
         FHKEw553XUdPRZhbDv6cMwJolwsuOTCJb61FFY1SM4M3iyyDWREYH8whcgwhQJ/bgVuA
         q2oUsmeDfN97k3Yj7eeXQW4pcSVBvQGXA8KcDAr4Ts//X7QvgDJi3vY0nZ1KjAqT/9/e
         Osc2oy0Jrnd+blSjik4y1StRDDfu8zvunRZ4rqLrAx0sc3i1OOL8lesAE+xBEh/Jez0o
         MEJpKL3WclezK0Um8TdnkTN2uwj1F6Dgx0TKsNp/5zPr/3drdZwgWZBCPPcKpmsSyfLX
         joOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812647; x=1710417447;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57A09yidrpDPUR1r7F8CHS4CvBdl9GurP/NjYKl3Cg4=;
        b=CrtB0/4uN4qCw5p0e8NiOrGRLk1w3exoaspm28MWLHKsYgtXz5EX1g7aMitK4d8/FX
         kZwCaOZyyQ1fj+FTEweLi9tZdAjmhLuCxS3YpjUMJXruBuZg6coaUYliE3ZZzZSU1VSr
         KuQmPBrH0XJbEhUsly5hIM2JslmV8O0Ms5dIIW6l30sSmsrUismh+wUfChzbKfnU4vFg
         DYsdAPs6rbraeJf2AlataPD4w3W3ZzCB1H1Pmm9YDABd1VKMQvFU8IbenexBCzgHg87c
         VAvUf3tZZkR0LPg5Y53+PoS1fly8Itjnl8Nntjfs4ct7R2BbSgcEadUP37snQnqUlCIx
         /A0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOV/R+nRRBTR5OWDbD++v+m+pQ0e9wx9w4nLy+uS/M/0YrNqDiPZohCVogZYU7v9ENzy6hwhsn+ayzUY9bO8bKmue5A6uJ
X-Gm-Message-State: AOJu0Yz/+HaVeORtWyd44ybNhfG+bWX/8QP55R+PrHlCPR6IhzLVHHIv
	Nlo0g0A2Hcg33y0ubPQkGQBYhTaJswz8Retouryiu7BrdG/8/IL37+UOw8lSeXUmjiucJjibN9Q
	7DW98pw==
X-Google-Smtp-Source: AGHT+IESCFwpHQmPxOg130/0yHnqMR5/u93SMsub5nGrOR8b42+ayiblaPN9pioxp+dZdBxzB/xsng==
X-Received: by 2002:a5d:6e90:0:b0:33e:d27:4f8c with SMTP id k16-20020a5d6e90000000b0033e0d274f8cmr12927971wrz.6.1709812647026;
        Thu, 07 Mar 2024 03:57:27 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
        by smtp.gmail.com with ESMTPSA id ck4-20020a5d5e84000000b0033e2b9f647asm14506048wrb.31.2024.03.07.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:57:26 -0800 (PST)
Date: Thu, 07 Mar 2024 13:55:56 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 5/9] hw/xen/hvm: Expose xen_read_physmap() prototype
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-6-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-6-philmd@linaro.org>
Message-ID: <9z7vo.cvkkbfxdigjz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: ad0s3GAZHjEs

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>In a pair of commit we are going to call xen_read_physmap()
>out of hw/i386/xen/xen-hvm.c.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/hw/xen/xen-hvm-common.h | 1 +
> hw/i386/xen/xen-hvm.c           | 4 ++--
> 2 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
>index 0fed15ed04..536712dc83 100644
>--- a/include/hw/xen/xen-hvm-common.h
>+++ b/include/hw/xen/xen-hvm-common.h
>@@ -97,6 +97,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
> 
> void cpu_ioreq_pio(ioreq_t *req);
> 
>+void xen_read_physmap(XenIOState *state);
> void xen_arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> void xen_arch_set_memory(XenIOState *state,
>                          MemoryRegionSection *section,
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index a65a96f0de..789779d02c 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -525,7 +525,7 @@ static void handle_vmport_ioreq(XenIOState *state, ioreq_t *req)
> }
> 
> #ifdef XEN_COMPAT_PHYSMAP
>-static void xen_read_physmap(XenIOState *state)
>+void xen_read_physmap(XenIOState *state)
> {
>     XenPhysmap *physmap = NULL;
>     unsigned int len, num, i;
>@@ -573,7 +573,7 @@ static void xen_read_physmap(XenIOState *state)
>     free(entries);
> }
> #else
>-static void xen_read_physmap(XenIOState *state)
>+void xen_read_physmap(XenIOState *state)
> {
> }
> #endif
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
