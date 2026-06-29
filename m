Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8EAC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 09:46:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1we8Z1-0008T5-5w; Mon, 29 Jun 2026 05:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1we8Z0-0008Sb-Iw
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 05:46:02 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1we8Yz-0000dE-83
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 05:46:02 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-664d78637f8so687814d50.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 02:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782726360; cv=none;
 d=google.com; s=arc-20260327;
 b=n/uCLtLFKE/tPKOTNX1nA3/8i735bVRs56n2nn9JyYH7eLeZiPBpoESNUnhye3MPyC
 3zSsMT1TIzQ/qZQeH07ABTzzfxffRdhVVba6QQmirIkGSoVt+HFAxXUkPV7idNL8SKt2
 7JZUerSaVEZObjG110HHWtxJLoLJ9TveDTRhji0wmHV3pCgH5eNWTiamEupdW2WwM+9U
 ccUy4pPgdR55Ne56t96t3Ni+HShRVHOYiq0eyF2v/ZpR5aAuy9OIXk+VRaNGtH98/EP1
 MVtHar+zo8Jw5fYYG1d9iinQfmZBr2+p4PMjZuB19XLgXgOJbWfBCtOhWJeN5/SLofz8
 qTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bVaKb0wHoqpaDhBnMrXMM6BN6qpR1i8rRXClnmPUMvk=;
 fh=DxfiTlndN8+qvDhmxw6Qxv3fy1uVXirLKF2CczRGy7I=;
 b=M1dx5QTg+FdYi51/ES86Vj+Gj8lsGf2N3b/Fbdj3NEoQc5DzSQxUaQHboD1Fgw1Kgi
 y+mz/zJR/PH88W3wGhVElk/85QO5tfxWMFQePfez0425EL+Ym8NHJClYFRwMQftX2vNy
 KujdriSoiHpIWpF7f67SN/UbLO16w4J1TnvZjroeWZiNFHjfZ2BhE6QNZeNr7An7jiN5
 zPVzxAQ5YIkIVR/94qbD4+615nCxTH407fW+fGVFn91AXeSExb8wgjLPvghopq4SyWv2
 VvcNJL4Zdq3RCqP17BL3xWzEV67/WGHLmvXaslcs0GROdcrRlte+okXOdpSKMvQQxVc2
 6TNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782726360; x=1783331160; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bVaKb0wHoqpaDhBnMrXMM6BN6qpR1i8rRXClnmPUMvk=;
 b=OFLSI5mkRKH/ubov4d+cCJVjGD3bxQmFPyxbUlqlvVRw2BRSUsjrzV1kxkYsKFCXmv
 dZdz9toLVvkNlv9GPnKdlfrrKZ/cnQE9t0l8K0xwhPUO+MK4iGHyazOo8xq1NF0ptE8O
 7vASVTdR8rg4VS4zC5mPcxr/CdTrGD2PlE+6mlfAkcLfLH0Sm+FRxgFS7dgaRYhptOw6
 hv8exGb2MGCwXJPkCRSKmUhmQ6m6hH3leuAj5s2p+DejprONb8BpgPwG2PgXOheoJvRI
 OPJAiGBMxhZh0FYPzOHKub5zyMwndT+5hOE7k53lpRmVQ7gt6Zk8oiQUquqoeXZz6rzy
 ARGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782726360; x=1783331160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVaKb0wHoqpaDhBnMrXMM6BN6qpR1i8rRXClnmPUMvk=;
 b=EBhoyf3Xqc/jQp7lE9VMdHp+McAzXBOeBdttpOn3028kKBm6H4uR3MO0SPi/7CJpTx
 1fFQTacAPMHdwkau3cUxw9KAElpLUyuQw3c6QqkkgWfG4bAq0gQ37UAqUXLc31RMk6Ki
 BpTNuq2IOi9SWDYNYJfP0QaSG6x2ampGgN9+XagIxNi9sPJUp7eORszCeC24EO3C+Fz3
 Up4MGYlf+S8XCAc1mA4kpSJ18E8sw7qe9zQtfwwPHBNUgHpn2RuxD7Aebfj6IDkx78Kj
 79+TjUcyCuD5y1EFJzZ3Av8N26E5lHFE6K6lH2hfR1CUH+qxtfc/SrANLvEUiPWyS9ZL
 3uzA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqoWAIleLNvono83lBRSiQ6whzF+NOCAnPj88xgcqjfcaFoGFjCUOX+wGE1VIbb+0FFSUeYWuEYkg==@nongnu.org
X-Gm-Message-State: AOJu0Yy5y+j5ADXFAzyRzWPgaesQWGraA9htBL4vEULW+VQW9lCkxfDU
 Kx9Zq6SU0EEq0pHE6+dWUtfQ+bEqcDtrEEZOsGDWF9sZ1TXjajOOX/KZpnQ7FA+O+KNmk64tnFc
 uYCJ0zmWDBawulRxW/btcM+qyNl5Dnvr/BGWGrtqanw==
X-Gm-Gg: AfdE7clONNPifvp4LRCuCEY5Sl8w/kPtmB2IlU9dhBLaeqmQeLdkosBg/yO7dnTyGVQ
 EhTwZLC3fU82bo9D4B1cA/PocmArhN9XRZD6kA8SWuO2GqCmnPGXmYn7Oqhtl5toBd2VfdSvmcl
 KC1w0WS+5NEqa4IiZLAXCLaV+eGHYMorc6rLQMRcn9E/yN861maQLS2mNJiRfObzIF0193RrKUF
 tSeOkZ/PitcR9jXL64oU00Rb43atUHVyrFddkHJRALkQp7x1BgxiG19QUkmvvXOHbQ9GX97W6De
 li2Ivq7ONPNGa9/mLnedEtA0PjV+pnqsa2lbcJdbv+FlLgh67UDATQ1/
X-Received: by 2002:a05:690e:11c9:b0:664:cd1c:3c1c with SMTP id
 956f58d0204a3-664cd1c64c7mr3255148d50.0.1782726359943; Mon, 29 Jun 2026
 02:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260629074133.187549-1-yujun@kylinos.cn>
In-Reply-To: <20260629074133.187549-1-yujun@kylinos.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2026 10:45:48 +0100
X-Gm-Features: AVVi8CeWgaXs7Up3Ocp6tnWSRn3h06_o6FPOpy1hHVj7NW3tv_SjqrN5zicIzK0
Message-ID: <CAFEAcA-wA3vMctLFwEct2QTbz8JZeNPP0ei+3RLbFbyeH8HHgQ@mail.gmail.com>
Subject: Re: [PATCH] hw/gpio/pca9552: fix off-by-one in QOM led index
 validation
To: yujun <yujun@kylinos.cn>
Cc: Glenn Miles <milesg@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Mon, 29 Jun 2026 at 08:42, yujun <yujun@kylinos.cn> wrote:
>
> pca955x_get_led() and pca955x_set_led() accept led indices equal to
> pin_count, but valid indices are 0..pin_count-1.  For a 16-pin device,
> led16 passes the current check and then accesses an LS register past
> max_reg.
>
> Use the same >= pin_count bounds check as pca9554_set_pin() and the
> gpio input handler assert in this file.
>
> Fixes: a90d8f84674 ("misc/pca9552: Add qom set and get")
> Signed-off-by: yujun <yujun@kylinos.cn>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

