Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372E3CCF2C9
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3jv-0008My-Jo; Sat, 17 Oct 2026 08:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3jj-00089c-Hs
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:42:13 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3ji-0004AZ-48
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:42:07 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8ab37e44643so4765447b3.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240925; cv=none;
 d=google.com; s=arc-20260327;
 b=nf+E8ucGp9wmOLEjty7NGPHAhY/qyoA/2+H+zNpj16pxyOzjhCy/Vk06tcDFL2By9w
 atKmhLIF39UjQC8AyxqjSB6oKEsBGeSqgRi/wmYtajZ4VqQjlZST2XFI4L7GbHGolK8V
 O3ckIgW/r3V5PMZNrWHGg+CGemNkxhf2BKP8SjmK4vxmyeJ1JyBGx8YVj6aEOa2cIOyC
 XPgzKyPPQfRHleayx0rMbB+OEuOCmaC7ZyX0a9jOVcYqFvnrzVGwmMCYiWdv5r2sLwII
 MvYQK8WoJ/SZRoqm5OHuMZBlBSGK0POZeQfrv6a3NaVMd6sn6hKgWwlUobB6ATGoSP0K
 JdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TNjtibBQf0l5DDWWq6EfcgjI+8g6A9kd4BHUDWDDkpE=;
 fh=dmYAmLLGMfpGq5aAaD8pC1qDFnR11myWxoKCX3cThnE=;
 b=c2EJT48YzMDTbiKKgwo9WgjU+rL3hSkqub/45Ko2Kq0nZMaRRkwvcCcon00VCb6InM
 jXaa6LMn0AvrW9FNU4wlChw+dx/ZnzutPPNyLpvbvCTXj4qJvtUjUnEKMWj3uASGnoY6
 BNWE97Qdnpv/xX/82Z25DKwdeRVEPxrqJweG2oR83HJKTA2V1w8SRT1J1UKNy9aklo0l
 T5OdGOAiCFNTmwvoQDZxX8/OC5r+oDzkGMaHRudkdSpX3zip4cdO+03Un/2qTbD9+Byu
 A47U5z4rBZxgBDuuWhrTWhqoQzO6MVcSFKCzrpQ/1o6Ec8ftF1xS6v3mV794fdoEFUsY
 Zqfg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240925; x=1792845725; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TNjtibBQf0l5DDWWq6EfcgjI+8g6A9kd4BHUDWDDkpE=;
 b=xnxfRWe/VFlhNVRZ01vnOc6b0sF2Wfd2tIh6tWbaibOgLhdnmwWrqK0YX/9tffLFEt
 toe4jVTAx4IfZhlVo1/1cV91VXVac+zI8Jbupu0wKFyFXDlDANBK4IE7q7JCTLIm+WG9
 DRvFAi5IEbUA7ZrfWWeK1zRDALiOYllFBqP4CE95vs8s5dD0k81iFo44OcJK+tdK33+c
 q+CDJ5Bu8oe0F+7c3zINymkUFo1kt1igTDbHI0QBTLEwTgNLihXYqu07vfgY/eHirzmf
 rM8jqP4QZmC1qHChXPAUrKB2cn29Z0nrs0hw/QFYKpekAIyNdrAWnNPEBZDSok++nUGe
 Z8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240925; x=1792845725;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TNjtibBQf0l5DDWWq6EfcgjI+8g6A9kd4BHUDWDDkpE=;
 b=dl49C8dvnXW8WjZKBvRBlUu8LX+mb1R8uniR6XzpSfevNUWLvRAdbVXdDhHo/kfZCH
 6fGSR8AVzyT4+AIr3xSkePCysS+KuPTOxVEaXb4I0E7WAaCvsXnU2og4H9FQOFzNYRsE
 0w0U/xYvcfzIGq6TiLKxq3L9I18rh6XIcjtcrhcln5UvoWzzn3tq8DjRb60yrGDRssPu
 kDZz36nATEgDnAKW71oos7hRNpX28PADFxIJ5/42O1ga45fwCQy1c2YrjcxdkWIy2/cp
 K18K0WVtTqkEuqVADrUS61TgBKunRIiOx0vtnUD+vM0jbD5ecR2SVd/NK0ImjltAhgSo
 /3YQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByGTIxUtks7wswUEsYlbfPDMC0O0/2cZkzwKx6BZ3QATFBv4NybhTLWBvqSCoeH4vQhvV/YFBHFvw==@nongnu.org
X-Gm-Message-State: AFq9FYIPi/Z6KBQcpyPMGuq57GXvtO6l6bUm4zMR0vyAuEQGL+9qhDA6
 N0rbfii89bYlXitG6OWwbPR0RQu/GtyLvUJ0zgY1/31KqTjRQxK6M8RG0hnucYu8mEFjXgU0O8I
 OWNw2d0rKzsMIb96/7H8duYbT3I5wQywrmL42/RZ6mw==
X-Gm-Gg: AYBFou0/fmBqYh0I7s0pIrPqJqzqeC+EZbgwXAOWge7+3pz4BZwdBOph1WOXBxcBCfm
 CVNdzoM6c6XZBK9RmFitB8PtcHjOcEJuP9zmNbJrM2NeQK6QNDJAuuwT2SLZFll0fXEtjtVkquf
 1dQ2TKKrFZNPfZo3e76m8q27ynTZDB83kTH4lvGPMhWymgpe8gaH4cY2icJIm6ahtGzWsgMQNyG
 yZWUF1Wim8COYLL+LOOZA9kp5aFbsoktk2xLk+IRZL13XHBBfVXGCm1mDe8tehFUkJud7/0KNO8
 d45gmEdIB0vXVYWs7q1SS0OhoW9rat0/X4P7TfayCt+TYjFG4MbsB+Zp7pGVNz4ZrlfPOZIxvEi
 wOcTFa2D3bpEZAuTX6mcY1uON5yBcwRRMpWWai5M=
X-Received: by 2002:a05:690c:15:b0:89a:63da:fa8b with SMTP id
 00721157ae682-8b0f2208ed3mr9226377b3.70.1792240924680; Sat, 17 Oct 2026
 05:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-10-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-10-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:41:53 +0100
X-Gm-Features: AclHuK_yBBZsqqS76yrkVs4BjNTtIshJKyc2WdSO36G_CQWD7Zi-CA_z8f2n1Zk
Message-ID: <CAFEAcA9N1v7wX_qr2_tPCVhzmGB8QXoOU8Gj9ZGATOD1RpUd_g@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] hw/net/bcm2838_genet: add GENET register access
 macros
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add offsetof()-based byte-offset macros for the register block
> layouts added in the previous patches (INTRL0/1, UMAC, TDMA/RDMA
> and their per-ring registers, HFB filters), used by the MMIO
> read/write dispatch implemented in the following patches.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

