Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp845303ejc;
        Thu, 23 Feb 2023 07:47:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+DLzSiVhSIUIqeEGNMG1GlXCOkjUXG9UTsUMdoShW2qXtjrROQ1D6nCx7joyQZGVnw3Ot8
X-Received: by 2002:a05:622a:1821:b0:3bf:b75a:d7b6 with SMTP id t33-20020a05622a182100b003bfb75ad7b6mr822119qtc.11.1677167273844;
        Thu, 23 Feb 2023 07:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677167273; cv=none;
        d=google.com; s=arc-20160816;
        b=nGMTEvK9vOa+Wg9n4wFhh3VWjxB2SrROrLcTu9ktU9UuOpK2tZUz70lkA4N9U7SHjR
         MMV2IF/uOlPZRmfWs5gvAByL5G84vgqbb6mpj6F1B6aKNZ27NXODL5i6ZyTDHypGbzsT
         EPoA/yJfqrLV2vtzwdEIb+9Bx7VDU5VEplrdt6MZRCGQhZ9myGqhIyOThFzeQLsU+QVq
         JxAdQguXmrIYwurKhBVui6DpJpec62bDweApn2XSPEeHhgE5aOpBen0dSkDlj4ZehiYa
         hRzTIA7r9Pyewirmwfh7l24IFAG/4QD14gxpISs6sIdQNUBmTp8MfH5d1gwMVJ0CUdR1
         +AsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tIw0+UwQ1Nusj5/1tqd0LaZGFfvkZzNO/I/Y5rAHz1w=;
        b=rqSglYvL7yjQJ8nuj5Y/fW5zFsW5Q0HwTVHnyyiSWD4uGWD35nACCu1efUuqaq57Uf
         qUjRP1K/Qk1yuUZdsUSkijfK4mQRrum3LZO9rqDGcgFB+QpEWyVUXOlXpScv3uYl5/T8
         j0YuO8RK92JS6spa1Utz4apB7n/ZotQ7DG14ahiIFCfV1z8djMCswv88ieNBDnItCIxG
         Dn2Jzp59hgY8L8KBOKZmjhESA0uLM9fW/O0uoV5xa9gQ/UMze5AJEkhfWnkYwHypKEE4
         eyjBblt9hTDAyU3+DNzLRfSkr54RdgKxy1UDmekuCkDj0B4yEso9wkN9NLMbovCDULYb
         CNMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HLkCBgLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 142-20020a370c94000000b00729ed548e27si3192432qkm.214.2023.02.23.07.47.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:47:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HLkCBgLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVDon-0000QI-MV; Thu, 23 Feb 2023 10:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDom-0000PF-2T
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:47:36 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDok-0001sh-8g
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:47:35 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e5so14463369plg.8
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 07:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tIw0+UwQ1Nusj5/1tqd0LaZGFfvkZzNO/I/Y5rAHz1w=;
 b=HLkCBgLTw2149VrVLvgcSiyH7SbYnyja6LtNQ6C+GK/CV1jKg5/jgMP3wPOvwbDgIf
 dQjvsHRqvSJBfA6nAlVHtHgz3YXJP9tAg/DnhDo0zX8qnxNXlQk/7A2dVd3rpw9HYYIb
 O2Si/tzhG0luvv+K5frPgKzlV69LYQQAJWCYNqLnAB0/Lmk2tz4p6pcqhLjzGJzPE2Un
 G2PA/ll0TfdYEo2Cc1DDVXKzLNfl8wIBpNcQUPCFAxOZrYSjWxOPeD3Pv/ATUZkAIJ/u
 YMrxHOgPj8mneH3MY2zEsT5TScJPz2OzBaqca52VnkLLGayW7jpP2sxlvc7wXOFWGi45
 /k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIw0+UwQ1Nusj5/1tqd0LaZGFfvkZzNO/I/Y5rAHz1w=;
 b=4RiCkrkehgHcVMey/LCrpjgYDsQNCf0/gCIc8ZksyE8idUCfiL2obewSF3jrPrTlID
 mNnDZrMUknqa6jqQzlc2V5p9AdR7Cc2A1E36VcY92uEUj0UNPCgHDDfWiJlxZqlaFyj/
 RAHQPnJz/PXgy1Hd1sCBUat6o2pNoQiC9v/RBLQ7VGzS/ha6dmC8EmY+Wt64/yLrC8A8
 3WFJuHuNabhdAHrCm1YLG6idy++XAjZoW7FF7GM/bmysGkWSUcGTqtq+2Jv82u6WGLug
 CXxsAB3wNetva8x53r+kCoeLtZMC80ihhpECsTVEOdcXulUYofz2xbVeWA0UP1tHBZQu
 p5Ow==
X-Gm-Message-State: AO0yUKWlm2MetxVzf83zSSJRm9UaC+ZVgpGJ0obkKK43sP1fpbMWLSaE
 Kk+bvQluJaRgFrn2Xh9pxwYcT/Bk9HanclqU2gdNnQ==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1226520pjb.137.1677167252783; Thu, 23
 Feb 2023 07:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-9-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:47:21 +0000
Message-ID: <CAFEAcA919w-ApFzPrVkS_RC-x2_ObWQVdmgxLs+KF++WzG_HMg@mail.gmail.com>
Subject: Re: [PATCH v1 08/19] target/arm: Add atom_data to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zuI6BjRJmkr6

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this to record the default atomicity of memory operations.
> Set it to MO_ATOM_WITHIN16 if FEAT_LSE2 applies.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h     | 14 +++++++++++---
>  target/arm/translate-a64.c |  4 ++++
>  target/arm/translate.c     |  1 +
>  3 files changed, 16 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
