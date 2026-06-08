Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA443CD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 16:38:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWczO-0005yi-Ns; Mon, 08 Jun 2026 12:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWczJ-0005xs-Hc
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:38:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWczI-00023b-3m
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:38:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-beb44f97561so583744566b.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 09:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936686; cv=none;
 d=google.com; s=arc-20240605;
 b=O9PhFtgixtOCGK/meBE2RBY9kKUZsFvV6zAlWFkPEKTfMP2tcbzePsxU6UYBBOaeFa
 6NNAqNU636bK9V3quEo3Vn9s1mz9RORvjy9OlUx1l7LD/857AUrbb74tojK2K6LXM6u/
 boa1CBGhHCxj58MrvULgC1h0RT/xCZenTiPsZ0Gz1UHb3iPDIzSPxw72eSFTZE30XZOk
 r+AIh3cBPASjZUkcLE3vKvFTsQ3wOp8cBhc2O0BG5RJURjShYOebEB4v4aw9hNayDEWp
 zFQdKfcTwiMgcnmI/c31u6Ob0k1XXW8EZ7W9Uu5NGpK1dP88XMmLPr0bb3mxDCFaNv9P
 zQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LU/O22xhF9eujhgSHNvI1jakhAA/pQ6sANtgrbBeDCQ=;
 fh=XfMB6eUOljTC8e5kyMFGsp9uM5gHLH2GZvV/cCfkFWs=;
 b=JROi++NL/YorAXVp/SVcT2EAne+KYydp3r1WoB0HXXiPt6byqEu4+v0ujUMh0vQc8M
 Zs1Oif8GZeo5dH+8AR2qoLNz2+VDand479zunIVMqFSczxL5kX1AhedZ4JoBnJWC/0/6
 k4gZ1xK2f8Lhls12vYQK2i2UpibjaizF8oUoae3JjdKtqvZD38WqA8cEmt8BFTZmk8dN
 TitfrYJ0KThQIGQcE4yKne7NI8nyfD6AWu4r88JM8blH6VwMA6eljajmzwpd7Vu2NW9j
 sfFWHRH6hWDLa+GVEgvuFDX0SI80PNz2Y3VrTATaz/cowYmirzZGAUhZ7XwchkJr9niy
 b34Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780936686; x=1781541486; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LU/O22xhF9eujhgSHNvI1jakhAA/pQ6sANtgrbBeDCQ=;
 b=MRTt3hD0LZciyPqZ8M+kndAaP7G5GUaB1Pwgeb+fIGzjnIFtOMIagMgsjnA0f54dRL
 c1BUX6Qs7Cf2YuvKT/rKIWkdHp/3Dude38kY1Nf4mmwHSnQHydd57CFuwmra92ZN3uRu
 IYnQyk6OVW/8gDQbXlCariCxkbVHcXiMKx4srjSQJP+aEyRw9IHmXX+52pVfhrG3yTKk
 qw5tPeWbTSWFD1uYS7j9gfA4JN7sT/JW9JuNurenxDgKUcm64YJy48YXdpDbQMKe/JBE
 g6w8YEqCCS7KdNyZFqi91uF5/rGYRXII5oPv6nHyEvknuc4buRPRR6aHNgJhCOEhUZCZ
 2M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780936686; x=1781541486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LU/O22xhF9eujhgSHNvI1jakhAA/pQ6sANtgrbBeDCQ=;
 b=pCXNOHR7h539LZdmgwWtEaUT/eFPHjFiwrhsSZ24xPjV2NIgtcp5n8UihnrT42zlA5
 KxlLnetMtFoXAoqvc6VSDbkdSjzh3EEt1IS8r8YIaPoCV6XtQY04B3BhltiP3U+WKFVN
 GklspD7oovgS4uyPuxApkW/bikyirhILC7rLngUNmU98IV7ws0iDLhQRGoTHLGeM4DcM
 fYVxakd7zBQ4sdAskDjfIkvhHgiB0hf64hAFHQVAlNiqsG3CZsJBQlcDLrX5ax36gBDU
 +vnmFW78Cl30409yKqE0EKMVYrH/M/MCoqa8Ft0NO2UwAfqTG3WEpiivvVieUAWhGxon
 eacQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xleFyHWX5g/V+P/o5PqQ1BbrvfgI5rRssJzvjt2VfwZCoi2aYnWww1xsZ6UryPov6WdM51Ngjtg==@nongnu.org
X-Gm-Message-State: AOJu0Yy5LaeSoef6HHdLm1uxSQYC7wOl7yomsGJWL7qzsLOq2WE5ePZq
 MKvY/yaiGO8Zs8Gs9667Mx/ABPiqM1A6Bz+ycneIKHLlDZN+2aoTSnchL1L5SmowiXgofJFtaQp
 OHdQ6uX/0aiDAf64va/qbKcYkqVMiTvdkInJRtk81uA==
X-Gm-Gg: Acq92OG6DBjGyzYbrjHw7MI+nLivZl2ftrgtwz5vPYf1PTz8kfuHJES5LXvVoH/Yhbp
 TrRSKBSIqE6+ApOsxE+Fbe3G5UIKIlYRGgXT7IN4H6TQ2e0sraGSz3Kn5Nl0W3eFobTARxcXgch
 qNUiAlylVGaYZ5C54xe3Y+uHF/HcvmNS2rqwkbA3UVtLLWbNqIiyfQzIoh7b4XGIsoi3YDqRq3Y
 xvhvV2WuvBB0DZlIQ0mhvt1FEmQafSt33UpZASftUrAH88iecrDb3aRfnKRvZFsUyXA5WeilyLK
 8Lo8SXdbx4wBmiQS7YnyKNLMm2RT4Edm2U/swWr1Lrm5eaV+wgaybwaPUUdrTHoh2nvc/UIKgyp
 HZQ==
X-Received: by 2002:a17:907:944e:b0:bd3:1b13:7114 with SMTP id
 a640c23a62f3a-bf372d29b7cmr790782166b.37.1780936686241; Mon, 08 Jun 2026
 09:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-9-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 17:37:52 +0100
X-Gm-Features: AVVi8Ce0MyCIoVHZcnuuvN9yjbByCSgJWV5gRlvFuKlZT2wUrnnTJMJ5inF91mg
Message-ID: <CAFEAcA9wkOif_5dxU0xB2YGgcZiNZfY=d3YXvaM6sqc1dkDQUg@mail.gmail.com>
Subject: Re: [PATCH v9 08/45] target/arm: Implement BF1CVT, BF1CVTLT, BF2CVT, 
 BF2CVTLT for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  6 ++++++
>  target/arm/tcg/helper-fp8-defs.h |  1 +
>  target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
>  target/arm/tcg/translate-sve.c   | 23 +++++++++++++++++++++++
>  target/arm/tcg/sve.decode        |  6 ++++++
>  5 files changed, 52 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

