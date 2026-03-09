Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D57FF4180E
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 16:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzdC2-00039B-S2; Mon, 09 Mar 2026 12:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzdBh-000313-VZ
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 12:10:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzdBf-0002qC-NP
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 12:10:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48539d21b76so10718495e9.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773072629; x=1773677429; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mBrdsfH8zkcr9CyEeAG3fxbrmPaBAIjJHWD1motCURk=;
 b=rdv56A+p5R6XQmmr/x22EvPC8rTbBFV4q/hZEyToKka2F8sh5rQ3AVayNIEdy+xIZD
 mSyu1EDkwh99HiWES0QQSkVKfrSWEjh2s4ySHNPntMW6L28QOzJyuTLDirdtcK8L5Vso
 Sp0g5+L5Au0+KdesQ0sh1mucbYiEhfFHL5bk5TwVI8wjrPAciyVBUO1JVHRt7oszpG+n
 19mX1L9Kq+jjqBmwZfcWlOjsYRBtV8Jlw93GcNigTgdfs6j1RReIO4CU4om9xliwYd08
 axHJyJjNfJ7s9iyia9+c65n7JZO5iOdJHJFjAN77xyStBpErsZQ8+qdsAU2SxXAsexCu
 AwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773072629; x=1773677429;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBrdsfH8zkcr9CyEeAG3fxbrmPaBAIjJHWD1motCURk=;
 b=o5p7oHma8wGrA8N9NsBYPfpfPsioJHK0/GivR4oL5wiQcKUQxpKxMtt9yC5jn0+zkD
 yDyXepoVjNDU+clmtwqKtFcqeIm8v3EWA+YLcFqKHs3tfhfFBPofNpYSow1rAX0m0JK6
 OI2K1F4fcAs7qlzLe3u8mu3vXrvrLBtoqPNgZEPMVooIWwsCfFoNkrxdpeSRVmo/sJTl
 Yjaly6+lpovkimaV7hX3h63MxFaefmH0Aw0HSlTnlrDJd1IHKuP7nuQRzHzu30QxaMTY
 h+RlhlnUJexcl4yAKqML8pd5v5ciVEHyPlwekdbVtJs8yvIqX7GbH7QxbuUb4LQzUJ+q
 FP7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZ8W/CFG+yVfFIPYGLigqHmf6vP0SDhmyxpyIfXDwI7/IgKwKjIP6zdTUSaZ4T5zodneazQclAw==@nongnu.org
X-Gm-Message-State: AOJu0YxYCHKfkYGgpFmEFcPo/BGVe7xD/oc8aAJ0ni6DtHJoP8w8F1X2
 U8ITQRKPigoGBlEVX06Id/qb6voOLsEpOJwX4lb4v4BfaBwAJ3I/4Yt35LBDEFIxImQ=
X-Gm-Gg: ATEYQzwWSgFw/beVB9SAAlfSKOygjZU0RwQ63epIZUOwp1ZI0IzewpoFnJdtbOlUzvo
 ash8vLexlLTnjI6aRkQqUhN2GzhhCdP0EmDC37Vi02FyqX57QIzdxaF5X1uwm7ltk8iITuL40Pa
 nLYwmMIZ7Tef7Mzj32fURUrDi1seIquK3LV9OEiTOu5aiF0jxlKjUwvi/Jb7AWUjiXklALPJT6B
 V3KVrqfstdRr/SIgJftSqELeAfJXiJ5G5Xu9nkyfe+PbbYQakb1Yfs3+gJIs+xgpuX41z5L12GY
 NEHTbkVZe380JzQqjogMCO3+6abF5x0Snz0QymcS49CEn2FGq4qgRvo0jXRHzEg7Cjb8wk4S92V
 DB/iXSp+ZgDB3YjffdeweXdF3c8UYOSEaEJtOInCo2WpXFCGYZF2seXeiFhaJP9xjyKLYN6w5Km
 WSvqfZijn2rqk8PE4j68Bi7laeazrTCzCG+Skv0uDlvdNFKBpaZbsTpEUSywh22OLUOw==
X-Received: by 2002:a05:600c:4443:b0:485:410c:119b with SMTP id
 5b1f17b1804b1-485410c1bfemr14214555e9.13.1773072628715; 
 Mon, 09 Mar 2026 09:10:28 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541ab9f9esm1531615e9.4.2026.03.09.09.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 09:10:28 -0700 (PDT)
Message-ID: <595ddc7a-de0c-4c21-91e8-626e76c7eca7@linaro.org>
Date: Mon, 9 Mar 2026 17:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/npcm_gmac: Catch accesses off the end of the
 register array
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>
References: <20260306154016.2194091-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260306154016.2194091-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/3/26 16:40, Peter Maydell wrote:
> In the npcm_gmac device, we create the iomem MemoryRegion with
> a size of 8KB, but NPCM_GMAC_NR_REGS is only 0x1060 / 4. This
> means there's a range of offsets that the guest can access
> that don't have gmac->regs[] entries. We weren't catching this,
> so the guest could get us to index off the end of the regs array.
> 
> Catch and log these invalid accesses.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3316
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/npcm_gmac.c         | 14 ++++++++++++++
>   include/hw/net/npcm_gmac.h |  3 ++-
>   2 files changed, 16 insertions(+), 1 deletion(-)

Queued via hw-misc, thanks.

