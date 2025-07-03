Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp440323dyc;
        Thu, 3 Jul 2025 03:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvAy4PZ/JSHLrzNZH2K5z2gxVb8DXl3ZjVYAhD/s9bq6+uEta6EkfB/XqowBvskUJ5xqsJnuVl9fpsKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IET+05SeOB8jTvXgmWoK+aHly5RRaujcHt/L1tHyAmMSyAOQct8VlUoj50Ze0fVqx+PW8QX
X-Received: by 2002:a05:622a:7289:b0:4a9:8696:4c7f with SMTP id d75a77b69052e-4a986964cc8mr37405601cf.23.1751538993817;
        Thu, 03 Jul 2025 03:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538993; cv=none;
        d=google.com; s=arc-20240605;
        b=Y9YmPuhgc42Zww2XVC0EA5+AWpe694slQ8vgPHfb0yS5aL4quVPUO5ROXw0GtF271X
         oOBCjQtb/lP9QHCqKznNWOIzj+xn9lqRuTvQAE4nvTS53oWLRkPOI9l1bs2bZSfRWAYG
         3LgZZGhpOzuz1563O5O800wornRzdpt3pgOkTo6RXG6w+FN8oNsBcCJJMcLuy+tC2s3/
         h9DheC3OSdkA8ukKbKV+NB8OpqezCCZevITnBtf7fHwLt4ESIj3H7+DANMGd2BH4Ewp4
         9meBOFGfdKwkhdnEhwQol6gBEYf68DJPe4fSxFWxgIHq3ll2iQ58+asyroqVYzMM1q0W
         iE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KF6zoX91AyM6LhsFaWF5PbY2Ng+TsVki1uz84skKwBI=;
        fh=o6w3pwjYvalxlrAExHg2ea0ezRNBrHaqVABQvfl4+xI=;
        b=JGJWplB0ZHHsE6fQD2P7FAxzcvN+ta8dPzMEJpMsen+B6vm5YEco/iBLJaa6hzq5R6
         b7xBqQ654NRqepaHx+PXqaicI0LmPB4v/QBKHxdxGIbHIwXDQDLzlyPFmu5GUC2S1zwF
         V5mIx3GUZX8WerGiW1bYOol632GFzdbaeHhi5eTrglvo01zcJgo5z332AGhS3yAANpKA
         F25ckBAXYwNS/GqOniPapxSQPQjFhyhzUpVQJq1oBWq/nfwHeVDj4dJ298OpRUNFVVao
         jsTAnNPDFAoEK1FWb5Mj749vnBwWAhWXgD/Z8yjFlaLa3GCDhi9CZq6lobFT8+ZFU950
         n2Iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qnnWJIfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0fdb7bsi138256841cf.24.2025.07.03.03.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qnnWJIfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXHIj-0002Mk-Aj; Thu, 03 Jul 2025 06:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHIf-0002Ji-MV
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:36:18 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHId-0001b1-Q3
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:36:17 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-708d90aa8f9so79915267b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538974; x=1752143774; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KF6zoX91AyM6LhsFaWF5PbY2Ng+TsVki1uz84skKwBI=;
 b=qnnWJIfViFeDm8W7z0TlDd4cAh02ODq9K0BoozTj+uF/4CeDIHA+hrUP1NQdM4iQ8q
 eNbWQ2xINi8NbiOwGJSpGYsxFmumx/SEYHd0p/E9quzQgAfy1piRg+4nFxWsn5N8Q0Hl
 cPDRInzd8usW/EINNYNgFJdHFqBFaGIbiewBM5l1bDB9t77ltGGc40MGgZUv5K8eWETG
 zdXjR15HuZWoyqW2EFvKic3vNtWwafaz82nBZBvCJ1hLU616HkVUpUFtzVJpxNo2eHQd
 DJ2I/t+hGHPmSyZVd5sJbO1iXKPodUyXR3rNIx2E3HljUBJ+iQ4C0eh1EbEbvXI8FROT
 ZidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538974; x=1752143774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KF6zoX91AyM6LhsFaWF5PbY2Ng+TsVki1uz84skKwBI=;
 b=SFeza19Lps4l2Cb/vSxShEJjykWdnNrrJXNvahWc6vkyFfGA/mWnidoCir6WdIaPxH
 GesXLewHmgJcVul4eUArXJmWtpk+KjcK88bPTPU0CvxZRgqUQEsUwgR8f/W32NPVdpyi
 +66ca+Uq5e6Vzf2SjUa4AwK2jI2wUMyWVbp7skmkbLto9YQTfEQPCp2yxspYZNLmylMz
 R5VsE2FAvbbnL1m111gKX8I4KfMmTzswLkY7zXLEiT8OBrD3vFVy/ceJk3Fvdj8vMBOp
 2Jn2Lq2bd3SLATHyc8nGXh8eqV26pGwQQs701XNOSVKEPAGXYeDlyqST64Suj5UMw5JR
 TPEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOfp0iEZmltOSxcnY+nFHygewWa+pXhmw8150oFKk4U8rmjntC6T+h3cyZpTYh7+mGMNWW0oxdbw==@nongnu.org
X-Gm-Message-State: AOJu0YwJiZFkQldLS5PZRS/kBdD0BdH/TF4wQUvsrbjaLn02ctPTxuY7
 mWd/8qcCYd16PA+nLScIIZ525YxIe09nxq9E5JmoEQf7DN0OXOUyZezPCSyA1zCcADrfURAVdQB
 Ft4GfVzA0qO+8yxs8Hs2HR28Niapdz+127X0Myp0PbA==
X-Gm-Gg: ASbGncsxaQFsCE/D/v1V//iOfAJ8ahOJOY9nOK4xm1yastgH0xAJxbWexU4MRkee9XT
 mbJledDJlZ2UXZvGTWUOdkudOwJnjUr+GpInZuiyeEXDwrNvWDfqJi8Jpa0m66DyT4X432Qhlkw
 bQ1Wgql/yLZkic6XtoIGQgdIrqMa1d4O95U/4v7Rc+K0uH
X-Received: by 2002:a05:690c:8689:20b0:716:5986:e4c7 with SMTP id
 00721157ae682-7165986e512mr31052747b3.11.1751538974362; Thu, 03 Jul 2025
 03:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-62-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:36:02 +0100
X-Gm-Features: Ac12FXySC4Att10MwcFNYdvmftAY2lt-q2zsS9oXeKMQ5jzheEpgPC1jfmK6ITg
Message-ID: <CAFEAcA_W=Mf9odOjV4d28M=MpC27GBFz0i_Uj3JJ8Gp2GzQJAQ@mail.gmail.com>
Subject: Re: [PATCH v3 61/97] target/arm: Fold predtest_ones into
 helper_sve_brkns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: VPXNws1upCBo

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Merge predtest_ones into its only caller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
