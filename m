Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62607C88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 08:29:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6241-0002HO-7j; Mon, 14 Sep 2026 04:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x623x-0002HB-V2
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 04:29:18 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x623w-0003de-DG
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 04:29:17 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66f943b286fso1203715d50.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 01:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789374554; cv=none;
 d=google.com; s=arc-20260327;
 b=ZlGAWHgvirypaZvCkKCDijDm1/gNm9KEEX9qhzzKI5ZuSZIe/wlx3fLagNTniTDKB6
 L15pH9xjew76UBwfCbVdH+lHI8u1CMEhj2vnN9RNbsqkXIC6EqPtaZLEkqOwLj8cd2AU
 ZeOYOVb+WViTuoYBDxDJdZBhwlk2CvjsAv8sao0uCz4xZ8LfDBiWmU81fMFwYociSRKG
 EYi50KNaVlGc4xXl4e4sSH/29OK4zXwMpvXi4BcMDVPRUtrs28xOuRwhJyj7UrJlDYkh
 /5Pa+3/x4Wl4y8I57cvAOjazp0s65tXX46VUlBnvbUPcmFp3mpPr9MxWoDKON5Z/qXt4
 vgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2Qr1COfbzbGjjGmH1u+AT1lOlz+gyQ9J8lsk9rkGL1U=;
 fh=AoKQKMqZ1e0AllB3RMdVP9JPiV37xAQdfGLMsyk72No=;
 b=R19vU/6i9Ncr4WJ6Bb8dUD6nJjOOhwuL1ycSntxsy8gjrajgHupB50oET0Z+hRo2yJ
 WOA5SyZ/Qq03RrdEepo4hR/D69FFbkx0AfAOJ7XA7gOXPsVYJ/BEra+zDb5cu8ZBQI9M
 u/DOztE7dcfGxuwONz9GPP23qT/UcgAtC+QlhIoU6SVpjKVGSe87a5DTHOhoOLGMgo8W
 4e31jJcgn4DssEskCk6pMzUpzrBYyvsf412X17NW/9cIWGkmHp4maHM82nisVQ4givmL
 mhl+kbDDno26nQWB05GL8NzR5HgbLboNFDsKtHl86EFHnED3xI0awQQKOSLqJlMI2Rk0
 TdJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789374554; x=1789979354; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2Qr1COfbzbGjjGmH1u+AT1lOlz+gyQ9J8lsk9rkGL1U=;
 b=q+GoRs22Cp0C4beqDhH6I9AJ4dA/9aN0xQjaxqllt/IO3W+o9vpoYrrkJ77q1V3RY3
 R7nF/EeFem7A7e90JEBW1lzRFtHBpvQ1YubnMQ+jMC8iHRkTxdsBzp6Jn6tYYBfIlXXj
 OUjmAbWotBjIqvPgZp1cVEyX/Bxieev2x3LAwwJ7BPM1Xnk4Z6Y+RvFnJX5ZMR3FlalH
 u49iUjRTnUVIJaRnzf3jfLBZVrwQa6dyhCTXL8VaGY4ftpPZWOL7I/ulPZ1w0Uj3KhSB
 5u3C0dcPCFPxn0MzMKzERsDdZzQQ4bsi8KoRiSNCTJ0U5ndeI9RXEpwaOVEwGDczqU80
 TVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789374554; x=1789979354;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2Qr1COfbzbGjjGmH1u+AT1lOlz+gyQ9J8lsk9rkGL1U=;
 b=hi2O3m0v4agi3alx9ojDr3QRM0uZBK9/ZOG4gUW7VWpcZ1Xk3yRyIhRsKH6KzJh/U6
 Uj8VAFcL351kpJMAslNhl/nujtnQ/8ezWFL4Xh860TgAUcQlTnw1LcBXEcWbcTs/L7vg
 ljvjBkFsrj7PuOhUfCAWXcLK949XaIQ9MvHUrzQz9I1YRMyk1ybWCJwxhZzIUFwijp/v
 B03K90wgwnddUyg8TBJ4BuefMH9HJUSf8RMQP0MzqaJd2lSFqs18cYPjF6Ht72h87f0M
 fuRznVjh2lzxYeBzHnlHBakeHkhO0Qas8x/uVB2UImY7B7i8b1JCivZZFKK56UCqvPTr
 kn9g==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4djrSspEuU+Xxh3yQsf/UGLPtzX9i3VEeQIv2mLUMbFFuN7h2A6IUv2Oer+bjveUJSYh7Y4lsOg==@nongnu.org
X-Gm-Message-State: AFuF++l0HvihMfMI6kj4IXbyJhhtnFe/f1v6zwWfWDJxW+VRcc5ESblP
 HXPmcFGA7jdr15ZqlNj6agboZRPiJcacLoldDemQJdlUKMLp8h4tKE88gJ6ZRAY/ZqjTlxE0jfp
 MbNrIqlNm4TjRDYADyO4T5dYzJZUaKgDKozhdsjPwmA==
X-Gm-Gg: AYBFou2mz25M1XX1aP+bTKJayMNhk1lTCCDVvBM0jdNUcOBxhfSCVCm2vDhW0kzG4LG
 Mfrl1x3ZM1fB6RWWyh1zi0IcH1hB1QSWkEOCBzWl9Fx9zyvDD/uEohZGMyLWzCgAZAvIuXNAqtq
 SUzd3aCTk4qwOCcKssUbsU+Un5Y65y/anGDcSjljLWBPt1bRyI/cVVrYfOUfBTxxUcepZI2E40e
 OAiG8GVIIyzdBe7jFF8mZFZJauw/9G2oVh0fL3D4Uu6lBNanoBMTemXDkBLnssP3oPqfFpVH8Os
 lqV93j8Oj04+jdjKAvkwfbFViaCQFqemiLBcImHT8fuIXysk41Uq3Kn8uiFVg8glEcHF6g0JaSY
 6AqjYS2mz6+TmV/DEJ8K6XnEmaAEMiXi/XQtmmLR0N30KdTG2Kfg=
X-Received: by 2002:a05:690e:4147:b0:670:ff3d:e71a with SMTP id
 956f58d0204a3-6714e1de255mr258714d50.76.1789374553717; Mon, 14 Sep 2026
 01:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260906194438.93046-1-gilles.grimaud@univ-lille.fr>
 <20260906194438.93046-3-gilles.grimaud@univ-lille.fr>
 <CAFEAcA8OYNNDn7tV8gzoVcKnpNc5MZZ1u0AmbbNpRfuzdoqfKg@mail.gmail.com>
 <20260913183157.8294-1-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260913183157.8294-1-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 09:29:01 +0100
X-Gm-Features: AcwNN1UX5MSQXyEtj61DZSVfRkkKtbS9pQKkFJudWPtskFY9SW3y2E6ot8i0Bs4
Message-ID: <CAFEAcA-g_NBjCJ-6YMwUZrppnDLm9pC8WOYspNk+4YLCXWh+sw@mail.gmail.com>
Subject: Re: [PATCH v3 02/36] target/arm: allow Armv6-M to set CONTROL.nPRIV
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Sun, 13 Sept 2026 at 19:31, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> Hi Peter,
>
> Thanks, you are right. The v3 change incorrectly treated nPRIV as uniform
> across all M-profile CPUs.
>
> For v4 I will add a dedicated ARM_FEATURE bit for the optional
> Unprivileged/Privileged Extension. Cortex-M0 will leave it clear, while the
> Cortex-M0+ configuration used by the RP2040 will enable it. Writes to nPRIV
> will then be permitted when either the Main Extension or this new feature is
> present.

I would suggest making ARM_FEATURE_M_MAIN imply ARM_FEATURE_M_NPRIV
(or whatever we calli it) -- see arm_cpu_propagate_feature_implications()
where we do that sort of thing. That way we don't have to check both
feature bits.

thanks
-- PMM

