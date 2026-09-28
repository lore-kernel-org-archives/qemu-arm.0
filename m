Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA4CA5FA3
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 18:36:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBGDd-0002vo-Hv; Mon, 28 Sep 2026 14:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBGDY-0002tT-EC
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:36:49 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBGDW-0006oq-Jm
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 14:36:48 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4aa8d882so3684488d50.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790620605; cv=none;
 d=google.com; s=arc-20260327;
 b=AwDAivwo55VJIGzY4rabKVxSwkTtKVq8VkEoqLYjvxv+s3J0aRtkPJkdW0/fICJ4SE
 LVMAQdLI8LrhmxOlUi80dk/1rQ98JLTE/E4X5twGiejO0WJaRrDIq9VvK8mi4M9UoMNw
 P/hucBEQ/Lhnfv+EX0qxPRE4H5FKgL7+vlW+/zOIe0Of0hXFApaYXAej7PxLr0qA77hZ
 sdwCQvpBsf3cpw4JxzwvUHYUCOyHMSIiZqtvApKtvWneHr2bf7E5mMCgLVO8gzgQL7MR
 vIwnc7ZJCq9QgWygq4zdRPvbKiOZAJtu1iON1V9+s3CGG2GILDdTP2chQVMHung2mIQL
 anoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VfXZmPzgDoa5P7dYUzGaXCTyNeVCE8jiaFThkqVF1Ik=;
 fh=bIcoAI0B2vlpQXp7Fl8kvp9ULapviFvaSde3Joy9UB8=;
 b=qyOkebrSYqJ0PuUscIxqKKia2MBrguvgXHtEaVVBtRp7I1CeFg8NO+qAvnI51IqLUd
 kO0H+enq/Ysfof17Hg4yLUu/mjFeF2nrxJvXCqyK7he2gEmqHYqU1fxeMDYHcYaeGm3a
 d+OIU9H6G9TdjedhcDiPPICoi8pNvGJlItojhdRT2/UiVXtZ+ZW5zMWUQndTNL0i6BYf
 +K04xrbjbAhSMNWm+JAgy93Z7vXkK2BhKI7quMsehGUaZg90OXjILLPcCRa1UVn2nCMU
 roQRH5qT+s0PR3YfqrxrbVqcFlp1SvH2mfPT+1oOpYFi+dThQRT4d3qB6rR3araNqU+D
 XG0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790620605; x=1791225405; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VfXZmPzgDoa5P7dYUzGaXCTyNeVCE8jiaFThkqVF1Ik=;
 b=gg6dP/l+zH/BNNBGvswMLKDL7RQu87T2crEnKFj6la1O05anexmsONE/vTAYAsE2b8
 dSsiSOdNKGzuOkZkGoG1+ELcQl8sRzY6tk/+3xNntXeM6vkOAtpUNCht5EwepbEjaSIq
 LtM6yXA6fBJAF/Ey2bUQ0xGcacSbeDlORT7LIpWQeVhe9iOyP3YGOgwXXMys0EWmDf4a
 OvDULyCj274V4S7FP+XjWDp0YGzZwaE+BJ+WWLqe3SIuVVvGcSMjvcxk+mmWTKVXaynZ
 rIcUMBxa3nhNaf2Lh1rdqvNGwNyYXrf9L9X8pf8noICvZ1/9po0oLQSW4rCruRUBwoRq
 Un2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790620605; x=1791225405;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=VfXZmPzgDoa5P7dYUzGaXCTyNeVCE8jiaFThkqVF1Ik=;
 b=okyx/MGZN7XAjSIQg7WhdRZAcR9llKEkwe4Xbh9EQM/xZmfqtEIuBk5VWY0sXS/Psa
 DJ9M5zKYO1o/I4w+S/Bcnq76SDnBA6ErkrAI3LGt5XAruEdrRZCFK6BTOEwnTw0COBee
 WohqB8E66PNd1D1TvUVuftVFxu6fbgTLsj3qsTwQt7oVfj4zXZ7K42IMZvsl9qe+a1KA
 9fcK4iQbMNbdaytRhj1mtmbP3B3I8mcBf5dH6vZejg9zzhZincxtXSbiU5eEyZjhZAmW
 hbSMs9cf3qhy+cKjoOJQS182BRCcRI42PPs943HUnzgEspKbtDgBLE69YmMglcrr52xS
 8w0w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwnl/mco8Q86lV6Q8AM351hkkUhEmFZ/762dcI+J6/bZXWib1a/iQuJwuG2os+y4TJaiUxDdhCuQw==@nongnu.org
X-Gm-Message-State: AFq9FYIDbAyiMd7S0YwxlJhu55pGx393Dc0Q35qxCtOZ0XLAWSGHis8F
 YgBz4a97vKUYBDK4fIMoVIK8gRh9f538pImY7+Gf+x7l2z6L0rHi2AJCqgE9hC7hj+V0CxxMMyr
 EFtTLtgur+esagqqRTbbgV6gQyTLxQlDJ4ZXOAPue9Q==
X-Gm-Gg: AYBFou2BNYiB8YF1hEHaUZMBfQ84Twx7FWR7iRSUVI2fTUx4GJav7PGwNFlaXa81VB2
 MbzkfTdfHd8C/xJFiYWY8uvEx1ccJwIik9MtvBp+FF3TxVXsSS52w3fFKo4C2T01G+5O5LepDMh
 KLb8J5tSBIpeVESGNmantKEq7dj898inbB/fn4yCo+C9oJEaBr72j/oY+hoWTs1GzvYqC8NbGIt
 wzV37kfN+FXdpNGsubwW5hko7hUNLZ8majjEHT5/+dECpvS2X+7VJalTQUBPA1V6sVnfGmOKC0S
 c4Skr8516hpN/9B7XiFRls1YKDZaSdIjd4CengCc5ZoLWEROyFvaw+IzkdRn7gGH6H82U+HjG7m
 cofHyExrzUeZtHZJbePVHSR0ZYDouHkfN6Xhet/4=
X-Received: by 2002:a05:690e:1c0e:b0:675:2f4a:53dc with SMTP id
 956f58d0204a3-6752f4a58afmr2673831d50.22.1790620604759; Mon, 28 Sep 2026
 11:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-4-shentey@gmail.com>
In-Reply-To: <20260921214710.29422-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 19:36:33 +0100
X-Gm-Features: AclHuK9ClvGMFqhPwyX4dBQX_CUXvMzYGlZX3KWQSLED_vyBuWm5Ogp3zn5RoBc
Message-ID: <CAFEAcA8XL_THyxPv4dBi6qe7O-J7cTiHUmoBp6jaqx0F4mHOjw@mail.gmail.com>
Subject: Re: [PATCH 03/42] hw/arm/imx8mm-evk: Fix reference count of SoC object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>, 
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
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

On Mon, 21 Sept 2026 at 22:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Using sysbus_realize_and_unref() requires object_new() rather than
> object_new_with_props(), otherwise the initial reference count is
> subtracted twice, i.e. ends up being one too low.
>
> Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit)
> board")
> cc: qemu-stable
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/imx8mm-evk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
> index c3215b11cb..6de0d9c4a2 100644
> --- a/hw/arm/imx8mm-evk.c
> +++ b/hw/arm/imx8mm-evk.c
> @@ -83,8 +83,8 @@ static void imx8mm_evk_init(MachineState *machine)
>      ims->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>      ims->bootinfo.modify_dtb = imx8mm_evk_modify_dtb;
>
> -    s = FSL_IMX8MM(object_new_with_props(TYPE_FSL_IMX8MM, OBJECT(machine),
> -                                         "soc", &error_fatal, NULL));
> +    s = FSL_IMX8MM(object_new(TYPE_FSL_IMX8MM));
> +    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));

Ah, yes, I vaguely remember this. We noticed this was the wrong way
to do it for imx8mp-evk.c, in this thread:
 https://lore.kernel.org/qemu-devel/CAFEAcA_cYDwOFP_h_pKyUQ0kKmT671iZiNntzMC5O5tF=1cC=A@mail.gmail.com/
but not before I incorrectly suggested using it in the imx8mm
patchset that was just landing in the tree at that time.

This patch makes imx8mm do the same thing as imx8mp used to do
and eg imx6ul does now, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I do notice that we also have the approach that you changed
imx8mp-evk to in 8099d86d3, where we have the SoC struct
directly embedded in the machine state struct and can use
object_initialize_child(). But we don't need to adopt
that here (especially as I think there's an unresolved
design discussion about whether we should prefer to avoid
the "embed struct in struct" pattern entirely in future).

thanks
-- PMM

