Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057DBCD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:12:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ48c-0004oF-Dm; Thu, 21 May 2026 10:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ48a-0004nj-M5
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:12:36 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ48Z-0003RE-9Z
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:12:36 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65c3ea2ebf7so7106372d50.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372754; cv=none;
 d=google.com; s=arc-20240605;
 b=MmLw1v29WAYjndcP2rfKhvHGXwu86GyKiT6OHU9zysvVwph4sbhhejA3Oc/Oq6okjM
 KMvWkx5qxdNqAkZV2fhYPOkRISX/Ff6eDgHSqX+XTJCDDjBJys2a21SpbtNRiq9wT6p+
 mn5vK0qgxJRP0Ss0Nzvpmr+KbWKDs6CD9sEv2oaZ7EiDdT3vl0Cr0WXofKEuFAzPCsFq
 t7Ih1fKlk80eld8KOUUc53yL8QU7QEmLeUx8n1SduUhj/BxXVrcXE6SoQDd+/Bd2bF07
 JL37qSp3MmDIGhcTQcxIQ8Q4nKLd6eTa3WHxYuHOAlIk++pEgj1fTwSn1HD86FJ3CXnn
 Fzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mT/AbABjzM58u3C5Q9GG366NHFjzePd8p9hzPdUhed4=;
 fh=VlgnUrm0tqz6FoG23GqOu7xgUE9meLkuHuPhTtTNdTM=;
 b=d94eUpFs1k7TfuVNej87OrcKzZPwVdhcHX7W0Jo3DPOHGmWg5H/W/KVgE72ym082F2
 CSYnh2Z3XRc20MkeeWogo2doKeHFvJcPfiHE10sycEsylkvcs70f8Kd84ZZXKIhFgGSB
 J1byXwXdQf+3LodJ9tpMDM7bV5DPKEApSgo80wWmmnPNurLpIO7hO36AERumJDg+sKxU
 jACSfLCMhYZnYdYmGVRA4gF8H3Gy/UzXBPubLcKzUs0S283/EmP0Ct/bBZQW1Jtr/57v
 EG1ujP+OkQLexQSzYvL28NCHsMyzvg0uxKafA7/+YRARNW67o2DcLiVJXhg4ilNi9TI3
 Y41g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779372754; x=1779977554; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mT/AbABjzM58u3C5Q9GG366NHFjzePd8p9hzPdUhed4=;
 b=yw143KftKysLIZ0IR7P2dB1+lfJdHfq0rxQ4C1XqLrKSPOIfCHrPNA02j6jI6Zqju1
 XYResAAQodxEmZ8Ii62bUfvfDSriO3L34iXX/o9z97fNzCiMWuDUII4P7bJ1hgFZTiDv
 PH94AnL0Eo7dNYO+rJWE77bzlEgY4nr/5kNu2LSZypDoeSYgnqJcCpcbnzPTQUaOjVMu
 K9niE5RNdwBiMKgKrnZa/Ljua8IEV1WrKjmyp5PHfnptXF5PlO71rE34vHU9AmmaAAp9
 jcQ62pIZKGKYDVuA3EsCxrQEaLFBnhuc8quTyVH4WSC/svdDykGCLzOkWIMxfHRCuODl
 0Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779372754; x=1779977554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mT/AbABjzM58u3C5Q9GG366NHFjzePd8p9hzPdUhed4=;
 b=Q65PRQfiD6itj6qCA8c1cKH/xFXzFUzqcTf+suumkWqaj0fbYCbff4prDv3lvDBk8W
 v7+0h+aF8fGhJwj7kMY0kSNlWQCSPPTjKUfeb+bg5EK0qhK6URDo3uDPvyHtjXslN2ee
 pcGt8QHcmd8isGkqNc7LsXi/JK0oawBKSmi6tCrnwpZxvll8YzlHZJ5WNXiZWIVbw/9B
 oFjwt2A33+MaeIyXoZ5gb3YRKG/u0G2tciXsy4MGg1yJxnT12U/Uhs8ZpAiSOXDhz5lX
 1tt7/gqn2a84HHPpCiJDCdIlyLeV3qzVMkaYSR5Af1gQZVbaFedKVrrFrwMJWmANt8Z9
 8ETw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+O4ORAlBf713XDk34M3KgBvD29xWaWgGIftYgqrsGlwVSopCNASK9ijKv1QLH5SaqDiRYq/g0BSg==@nongnu.org
X-Gm-Message-State: AOJu0YxuYM06Hr9J2YlCnkI49d+pCs4S4bE3nAksPLYPNYuY7n/y0+w3
 cYHdDAfYMhC8zHqiXBE3Pm0lA2Ue+44/Aoaus5uLhqIuNU0CrmPxwycPaluu7+ApWK1WPyQ+40c
 LwRHjWDlRVwvNSeXtQCveOfZQR4HJaX8WX1yhxOLrxCzxrWedLatI
X-Gm-Gg: Acq92OEV1ZQzFhU1Tx3EZThXKsD28LjEx1/Spp/DKU5TujuqPEgQFa1Uq/tk8WXBeqP
 ShpJsV8ktcFKsDqjs4SFsUMBLextZumitAF+Hk/k6LNtOMACE1AUqZycuBsOm2kOQAjfF4tIUKy
 NQ6WEUOpURJYsLektdyusBIiLf8YoJ9FUax/bAKvWEI70YnetVPm5vuePahupOMvNQRa6+EMlvk
 rZ160ZlKOsiyUcS5iRcQsOeem3E8UVE6M1Eyifacf0P2wbz0Jiaor+8egDynTM+EdXYvRmVKjtd
 j/52yTpiZqBDIKA3pXyXap0Fr10NnpRliKy5cuwpok550kJU/bd9fpyvG0oJqiKVYKU=
X-Received: by 2002:a05:690e:4005:b0:64e:d622:9d1a with SMTP id
 956f58d0204a3-65eae045b97mr2637745d50.4.1779372753959; Thu, 21 May 2026
 07:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-9-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:12:22 +0100
X-Gm-Features: AVHnY4LQxL8I8qb7HnS3AHNVviYTR7M_w_hzxrbQDzacAUwMOfGewCJmpHFs7Ms
Message-ID: <CAFEAcA-F_UuHZV5USWQCiDZ+693aK4=g2d+2arpJ+-iRK9kxTA@mail.gmail.com>
Subject: Re: [PATCH v6 08/64] target/arm: Introduce FPMR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Wed, 20 May 2026 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce the special register FPMR and its fields.
> Migrate it when present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

