Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58DBCD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 16:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWcxi-0004fh-16; Mon, 08 Jun 2026 12:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcxg-0004do-JT
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:36:28 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcxf-0001W3-6x
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:36:28 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-bf84a2b2077so83126166b.2
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 09:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936586; cv=none;
 d=google.com; s=arc-20240605;
 b=cf49Ztr1qyniEKmWGYtkONJfPpsgM6EeyC/6i4g4oI+TtaTco1X3Xro39ZOwfzxhFi
 79/8F2UeebhOa4M7Mq9sDlZOl4cfsc4QpTIge9AqudUVhQiXqtqU6f3xAtJ61428hPfb
 ALSP4eT96idaCpeEG9yDgteAoJTKEwavEEsA3y0k5JT6Pz9YtkRlfz7a47H6edP1ELP8
 kpVi8tjUe6NS1JRX8WoyIgV7hhLzmTQYQnRY5yl4pSpstI/18/dM3SMQtNB+Yj4symla
 yelPLKY2LZX35doXYon6+CnUN+mfiICrOcnA8gr+py7TyMu9JMaU1EfLmmW+tTVAdMCr
 k0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=kotqG5Ye5LBCP9kExSR/ej4DX5cozJ7d5httb5bFsT0=;
 fh=UGg9B4bSMdYN0caDryFzn181OfeTfzxfa2/U6ZX9luM=;
 b=L41YvoQ8RZ4jPIYEeAUTWSgvub5Df4brSs9jfj+0PK439Jm57PMVjzUprWgVpVUHCm
 e1qsuZDGg5tveQKRQ0V8j/1PrPmvlcmVl32ZMdT1BAWx+ppupLwQjYK4UU19bgGNOBjK
 E0Zy5SXGuKnEVvFoyOJkHG5DgUwp6UMql5PNjqLAAH4lSas3GcQj5t+KrL0HcaacL/dJ
 GioBJDQAoAaYtUTxxhx4WhDAFtiCMotMeXpCsndbuZ11P20m37O4VJ0Xuk4LrDGJld26
 jqHGQhpFseIBdlrOlVe27e67jle4zCexl0uYvzKHtMaNr/cn1822LEcawq0JOkVqGSHg
 wfug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780936586; x=1781541386; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kotqG5Ye5LBCP9kExSR/ej4DX5cozJ7d5httb5bFsT0=;
 b=iOhZhNf1HUiaG1HHeegKff6gkkhimgeoqvcpvMjXainP6e6lIiZerejji3uGd6dzEd
 kb0T3PALMucH8JfPDa5NCN7FMfLML8j6mt4vxJNwmXTAStVXNURLYZvBWILkADvzRtS1
 yAnzNpU1N6VQbG/1W7PXR57bcLQVS6iBwc7A9/dGPjPUMOmF6LH71G0NbyeA/JfBLKKH
 xvXV/smQfisd1F+UW3TX8O/Cyvavy/AeMHeXjXTIAclHUI75GqaZxAgzEWOc7tNgbTP9
 XVeT1TV8+Z9St7Y5zh7wUYC8UsCJb4LXbJzC/uKnZlDmyK7gAs8jra4I1UVBJwUC5i/a
 UQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780936586; x=1781541386;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kotqG5Ye5LBCP9kExSR/ej4DX5cozJ7d5httb5bFsT0=;
 b=qcM5J4Q/JRz5NIisN8qG0osWtO06QLE2TdOCD+bWhN5YHsoKk3198NAwGw3N12of66
 KWgdLmC9oKQl6DfYz4A53zSOKnhMV/Xx7aLqfrVsHocErUJia2xWX6Q1k+zTQXe4Yq46
 0Rf7cF+8aEgHXH0btf4I5MpfSwObe76U38cBjAY1fwYFVGMQg9QAPgZ7iTaqnmL0UieS
 9lvAeOIQ8qDPa5kkNWA0qvrqsVUNt9H9wNSvubHtil55SzVCg/W9KCBVsSGx7kclpxKs
 4B01rSrT807z0axzPeORVxNaPRE2mDv0J88hqbZv2lBvIykHSUtwlL2m0gaR1Zib79rZ
 GV9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mjqbB7QfJDxAAdGGIraoh6xIQ2sb6Zdgtehc73cWGgmgKeTW7+fqFbwfliXwG3S9/tlzaG1buhg==@nongnu.org
X-Gm-Message-State: AOJu0Yxl/Pl3fHL9N752GOmZ4w9HFLmFhudOkRQ1jhxup+tqT0GxihdM
 SMdoaebIS72yDGGLN3rQFqhBlWo3RWl8qg22dlXXdMyhbw6fHehxzd/Dk84gQqYXzURYzZEgjqu
 qUI7pGaF86adOsRKMG58wgjpP7l0/J+o6WdYD3XgJmA==
X-Gm-Gg: Acq92OF5C9y3L4f8KcKyWa+R9RD9h/dQXZ1LNDkYW22/YyaYQt+VlWphO0PET4oKAgL
 h9k9swc/ZnUDFZy2kMs9aV6b7dWZkPiI1ALkR7VwTTEOVzJYDpxi1CVX6n8Z+tYzhUDHY+IY7dM
 EWHGOuZFi5Yw8wdoRWrUhpYcNVQTeYjiBJ5nlZlsHec1qG89WjSPU2HhMFAyACR5MvOon9FQqSl
 WLCRmfqVLbio40iFomxIRrtPQAPwBUYaswykK/SjUntkRfRLbrtdLC5HkTqd1GaC9cWahdjPALO
 v2iOPlKUl/oKtJ2feL6VM0loe/vajbCUcnfFece0xvogquefBfI0ziml890E9iWusAjEy2WKLbQ
 eSQ==
X-Received: by 2002:a17:906:df46:b0:bf7:a616:cafa with SMTP id
 a640c23a62f3a-bf7a616cc2amr126678966b.34.1780936585463; Mon, 08 Jun 2026
 09:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-7-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 17:36:11 +0100
X-Gm-Features: AVVi8CcKx1Ig_TwULcZODUCjVhLfi6_WnHdlPORQJVy7urKoxUwDaa4N1S_eFkw
Message-ID: <CAFEAcA_nhSBvR-7vkisJU2NcZkjT9xDsYGQRLi6A_NKBzCuzgA@mail.gmail.com>
Subject: Re: [PATCH v9 06/45] target/arm: Set e4m3_nan_is_snan
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Wed, 3 Jun 2026 at 04:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The unique e4m3 nan encoding is SNaN for Arm.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

