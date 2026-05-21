Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9591ECD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:58:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3uA-0000iy-B2; Thu, 21 May 2026 09:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3tt-0008IP-Mw
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:57:29 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3ts-0000xp-8o
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:57:25 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-651c5d525f6so6357030d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779371842; cv=none;
 d=google.com; s=arc-20240605;
 b=M2J5gN5ukKzn3cvgF428bnInm57KhU0f50DQcfY6ySbZg6gSdzGbEPvKuk0d7vAIjZ
 dE4jgHMniT8W/U1KNWeFxnUmEi1sPgQbTgFPQKa/XqefLDAuRD6LtF7dQ/YSw44AFAYh
 /OV0M67aVC4JG0V4YG/mn39kBAwUKppvs8vLPySI9MLi0pQbJybMMLJjZ9dLYBLg/uuU
 IQV3IlNJQKeEGJNJo8jVhhDV/WHT/NOjPNW630FSQajgHgTa4YdiBPjjhHWNO0KDXyqZ
 BrHYqXvSKwW8Fop4tyrfXyiEy1rt2XxQlmQOVUKJVMHZAuoiCy0BE7PTjMgJuDH/o8n/
 4fwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=e+9v4n/h0v0fvZvcCQ7SjM1IakuPAtpdG2C6HfBk1hI=;
 fh=6szMz9QjrAgON+vZ+fm5MR9T8Lk8Q44NvrP6GPz0p9M=;
 b=EkusVxXHcqPZhflauarWjUO90p3gLHpKV0QyIIU73i+T0xTG2zKGkBrJ0EUGPkrchI
 HCNg5qDwns/Y9NzXvxdFUfjg26YeO6iklR3fUN+qvSoXe4b7lyCEmAx7UNLUc2yqr28b
 hQGf4LnhKpay///JPYay/1IlJk54yta1TJDqQsKqZSSO7lCM+58D3XeIF4ruRWGju7AJ
 00/b0yde0mWq7SgZ94/czkW3vPrBTF8TWEGcBfgAs+W1BJ/UVK23QWNk/YFlWBnRxyn3
 L7Lt5Idk33w9ryv/4oajJQR5cQAU5A/qcGsJS/UClDjdUO1jw4L77MWddgtY8Nqh3wNJ
 cEDg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779371842; x=1779976642; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e+9v4n/h0v0fvZvcCQ7SjM1IakuPAtpdG2C6HfBk1hI=;
 b=cx+E660VjjRZi1Ycn3ET0MjshL0R9Id9EiyMJqnbCGQa8SaIIRkxm848Zui6Hh2lFN
 TcqhfO7sSGssgjUW0wCLxmIDso2mIDzTfZiTmhBcTvedvHSfnnAiiUSjpf5BDdi39RSm
 Bol3w9txLXsZ8Aa5y2rY11CIQ/9v5KlxkL7gb7vJAVKEyC1th+ESxFI5UD7TiED02RXt
 OA43ArsCgsc9pRsi92bSsDb6NnzNaxvYBv8dZupgaChXf8lQPd6fyYVRLmWjmLqLcJWz
 KHhovMswBMERJ3Idyt2LAcK+2OyX8eOtNeQi9dk72IoLgoosRj8MzpIqSWut4+/ML9Ib
 T/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779371842; x=1779976642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e+9v4n/h0v0fvZvcCQ7SjM1IakuPAtpdG2C6HfBk1hI=;
 b=Mo3nQ1vxcZLc+zc7HIsxp7fRGC87c8mEqSN1NnC+VGEaJqSSFONhfy/IZtbWRBHxyJ
 f/2cdenvSrKGESpxY8JM0CFcW4gX7+2LB0nLiYVPkBFcM/GtEJxzLmkemKC8jnd4cMww
 R/3bvcSAPhv1dYhH3x9On2IqUmfDwWHoj5aSY3H+SdkdN0MfzWvDN0WoOuzICNBcyIOG
 jGObThv7syf+7PmRjo3UsjJpyg4T4y24MVcjRmpHLGuvUsQAOIi4o9HmQdtbwawfmqtO
 l/pughIrGVLnr8m0bktfXq0TsL/Fedki4u+CFIHd+DVih01bogQcBQNRQBIaWupeVfYf
 gp4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jcSdRVcOvM+0sNIj2AchwrrS/4FEk6vRh0jvCuojFx7eL1pgdJmf7TcrlweKb8xNzxLfhw0HUsQ==@nongnu.org
X-Gm-Message-State: AOJu0YzehnF6pkF3H+3SKZF9Q+USrTk6aHkjSpQY5dgJUgdD+mbkRZrp
 HbHrFcqBoV58DWPQ8aDOTXAereE8JhltdnWwfkrIkM07EKd35LBnVb09YDL1e3RdhV8JQeobHuX
 IRjtwenx1LbxmIz9uBVfSLvCvLru4s3ue4PMLnNaPUCXferccAI+b
X-Gm-Gg: Acq92OFc7wN16ZjyObV4ML2P5AGBNR6DZ0dkOHHY7qw2CDTULqV7wBVBTT70DyUxa+g
 9QPbwHj2opkl6npARtP+782o37XXRV5ckCiZTerlmCzmP3c+svDyHiEsPu+Nfx01N08sRWZagAR
 Sys9NLcRQGN2TaL/HJk1spmJ2BIspB1xs2ZZIGCyUnyXrltOYblYL0OMOCpqvGQuGHjyAMwu9VH
 wl5sYOzBt+e8EHqlW2Ci+H4FYpHfzlUFHfUI8nqAS6F/ZvLW6zJvkGLaLgHMnIl0zDTIJwVIsjw
 JXP0Vj1BcXtb6n4sN9dXkOCkARTfgS/vdWoMsNA3KHvodqv5JAF5vZlyBr3X3SsqhLM=
X-Received: by 2002:a05:690e:1510:b0:651:b86f:3657 with SMTP id
 956f58d0204a3-65eae2ed599mr2254385d50.36.1779371842331; Thu, 21 May 2026
 06:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-6-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:57:11 +0100
X-Gm-Features: AVHnY4JH3aKAqlQYarF13-f7r3KbRw8yRH-mvD7xmBKZDCHafnOIiWr6ndff_Hk
Message-ID: <CAFEAcA-cBgyNjJ=-D__fjwP_jVDuxH-1z1QaZbOXua7Sb+inWg@mail.gmail.com>
Subject: Re: [PATCH v6 05/64] target/arm: Enable FEAT_FAMINMAX for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Wed, 20 May 2026 at 19:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

