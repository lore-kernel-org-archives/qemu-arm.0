Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8299ACCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3X3-0005MN-69; Sat, 17 Oct 2026 08:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3X1-0005M2-C2
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:28:59 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3X0-00032L-03
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:28:59 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8ab38a051aaso5973397b3.3
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240136; cv=none;
 d=google.com; s=arc-20260327;
 b=b0+y+KjcDYP72T/ok90klL115pLyNLsIzlJcY0o5NBiy3e8EuZRdAQQu1zxePg8qE7
 0gqu8PEsgiknDct9D69cd/YaFaRhg5XjPgdvuGExzMG5wpJcVZDV5bIqTrpDMCnq4C3E
 WozpUAyecpk8Y/JmdYwYz8jsv/D/i6bQ9fgRSBDLzkZkyPC1jKJUE29seGhctLU0piDd
 O/FnuQQPPFEvNlejlTLTqfQfpCsM9WunQj4NY4D4k1nEnf8L5KeCNFJkN8fhgpgkB+JV
 lZjypg21TORyi/U9NOSlmHkmKbWdOEU7crBsJnYtcBEVVzSFxIZWfoHo+USKlAj2G8ri
 Z5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/sNTgQFv/eKcm5zHjeu8YQV6xL+v8MGYv1wNELBXuA0=;
 fh=4Ll0Fbj4UjpTOgoDr5mXGuRFdcSHg46okRTrqNUXRcg=;
 b=KBVPWdPMZCgblExj05n8WJ1Gs9PyCXVeQ5ryAxsw4AZVryFrhZe7nncnUNnH/h2RDD
 k8U3JpTBllWvjTPmeVJZZfkwhg3UlXqdmj5gb1b+/tMqjMm8fcGrVEziK8hWdyxX9NQS
 CF3HZsJD6uACuEHpCqa+wGmh3KBKL9D8Kq0KW5c3Lphk/NoXnhyoqR1RHrNxTq0pbcf+
 v7tCBeC+eD9QDkNcDRH5FwfbCvt60tYkjMqIs1l1TCzosiXV6FzPm0BdT1iPdmoB/5SN
 u2a+/bqFVx7aDXxs41gunKrsOyZpDMJkj28ALVOAfTTnhLclz+pu/aSpAfhM2yHyfDe0
 OmQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240136; x=1792844936; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/sNTgQFv/eKcm5zHjeu8YQV6xL+v8MGYv1wNELBXuA0=;
 b=yOJcKpa1B0tb+la+qENdrKVasm9mgB8U3t8r00j+PkrxdvN5X7RqtgWYwtWUhmXMcY
 d3gD0RpxLryQVoBTBAhogoXda5gkAuILh85piyK30jsjJys9jeTSJRBXzNJKFbgMOduw
 J+iPL/8cRfAlNOq6kf4px7Os4twqCn7LNwhKW0NxLM4IYeVhGRhKdRTve980VSdLcWHC
 ydWF9mZynsa7lDX1MWEuSKIqb7Q3iCllmgAzQklCdyQ+bMp9ZQZdM6ne5BCxWWT5bp+E
 wtqrhRM/5Rn3dlde/7gd2daNux0msSk1LIeqaqlfnOp7S3XVwaO6HSjjMzSwWOTDw3Mg
 inKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240136; x=1792844936;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/sNTgQFv/eKcm5zHjeu8YQV6xL+v8MGYv1wNELBXuA0=;
 b=TPQgRTnzzrLaNzUdJAt0p7tUQs5HiaC0zQV5PM20zpLBP1hp1wn8v6CySe9D5sIx9d
 b9kCd2U5sirYDlvGF7HktL2qtWUZgBIKTsnsF7hSzAP0V03BDUPmRDnlsAi+B2aDq9Hv
 jYR/BBaKVlRVhcCFjATRI6cl+SriXGCsyN4p78v5iGPsj7hBqAT/EN/ZBIN70z9j9BV4
 qQvJXAcmFWi+lz2P2L1z+HVYNbcVeezPzIJMG/deuGAR1ATHBrjV/e0IBbeCj51XopNm
 OpPAtD4G7YtVVhgSPeX2I7iGkIpLm9zn8N6bZfjannRxuxbVRbp5EHhCJKoajUEvCVbI
 I9+g==
X-Forwarded-Encrypted: i=1;
 AKwUvByolMtx7GoknXDw4ImhAyLUJ3sfAXBvDm6/OK80fE9cHY8TYN4eehvQtvrKHHwUsmQ/CFIW1kNCbg==@nongnu.org
X-Gm-Message-State: AFq9FYIhX6zZjskJbBLcl/6lmO7dC5LdB5rghYbj5f4DJTQAiJnLq6H4
 FgVHlyVeWv5SFxxF0vutdsewwhTTcy8kjPXrbvByrfJ6bbrf/sczNCYPrv/nhgZTtZcfJNL01MW
 ejfC+uRi4EG48d410KCErN7qrYQiRauX0Ai5f3aF9TQ==
X-Gm-Gg: AYBFou2NZC5XNxuH9cdJQhO+BlKH5eI2a6xmkim4v3m02/i4E3BN8boualzeL8XPuSy
 C+8zoQk9EPO6uiiL25qvNG8y5fidnLh0hKIoPMwUOPGHsQRy5pMjlWKPaoBJrtaknrFFR8WFh24
 hAdEJ01DKEL5YZHxn8tlRHNHxsr9Onn2DnwnTSc/SNY4vQSeaZmacxGaGJ4jXyQRuAz33PUqlZ0
 GJcnslEGlKBQzYdF9oqSxYgz2IFqkfctDj6EYthnSNuDctogs8OJOVir739TmhjMfiAMyiZYfYe
 sf3abBq2iqqYqewfcJ8qdZKPnz4vCmV5ICbEsYmxGJPflm/s+7C6Qpfo8w2g7mF8gj1LF0MBkfV
 ivyIBT42PalZXwl9rCKGkF1WwPpiFeoR9GgRFa70=
X-Received: by 2002:a05:690c:e3e4:b0:8b0:cfe6:29b2 with SMTP id
 00721157ae682-8b0f21f18e5mr10117717b3.41.1792240135798; Sat, 17 Oct 2026
 05:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181111.60491-1-marcelomanzo@gmail.com>
In-Reply-To: <20261015181111.60491-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:28:44 +0100
X-Gm-Features: AclHuK9WBB_vtuGtSl_k2-oNO_-dZMEfrgROiKsejIYp08Qd3q_CGI7Wc-ADTTc
Message-ID: <CAFEAcA9A-hU8bVJdN3c_k4D_dPds2VOgMV1qnHq8LUBJQkfW2w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm/raspi4b: RNG200 and thermal sensor
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> This series adds the BCM2711 RNG200 hardware random number generator
> and the dummy thermal sensor to raspi4b, carrying forward two more
> patches from Sergey Kambalin's stalled Raspberry Pi 4B series
> (patchwork series 829638). Patches 1 and 3 are Kambalin's code with
> his authorship and Signed-off-by kept, adapted only for API drift
> since 2024; patches 2 and 4 wire the devices into the SoC, and patch
> 5 extends the existing functional test.
>
> v2: thanks to Peter for the review. Now based directly on current
> master -- v1 was written on top of the "working PCIe and GENET" series
> and so did not apply to master; it no longer depends on that series.



Applied to target-arm.next, thanks.

-- PMM

