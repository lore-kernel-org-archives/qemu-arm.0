Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D72CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3kV-0001C0-Qy; Sat, 17 Oct 2026 08:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3kR-00019f-5T
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:42:51 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3kO-0004Jp-BO
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:42:50 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ab38a051aaso6028457b3.3
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240964; cv=none;
 d=google.com; s=arc-20260327;
 b=V92bXGXJQ1vUGGD7Un8XSDSpP6ngHhMc7YzmXz2hK/6sR1bhJbUuzfaIBGFMm+OIKP
 kaAM+iFhpMZTnlXGPHrpXNTSL2f9Ev4tjOsIoNgNpw1/NrBALGrgE1XrXTOtD20cyLgi
 ccJ6fD1w6QUYmoOxBoZQ2lyyk/8pUmjJGECK9iWfqrcOYMAIZPhACQ8huePRzyAILE6V
 sRQaoAyRcq0B7TjUc/k6YSJ036AT5GIr6ZGV3YMQpjLQpaLiBWhuY7+4bZkUzSDaKguq
 3lA1OJtISm1bd7dOzVn42fOKsJswA/kohc4qF+QvlRfYUo/YtsCT10ixEDoiRPHOUIzB
 1JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Lws8Tb4aw4cS+GBBTx89l9hWdf4AfSDK+rtzkOVpL/Y=;
 fh=7L6KPGvgcyakQWY1OD5Tl1VHbbPB5OP/U+Bqibx7pPk=;
 b=pXrnChnQgveynhuA+1o4F1gf04I2wPsVdE77QTJdFhWmXaDvCNnZjDhKD9NrJAb25e
 KYaZ4eRVa15iyImcW8mOr4djnNaTe8DExVPV0H81VQBvDmj1X+yBELqaLvjSb4mYk5mF
 71MNVx4LKST47EkdjXYOaAoqCuKVbUhS3NGrN9NRcmq9JdOiQqaetTh0f3mjtEsrdkfJ
 +d7lEG0BuczO6LyxJfwKwTWnrIXI7aJmX7q7osZUKiqS2PWBf5PGLH7b3qQ+WEClhSiv
 KcisFuH7WcsGyHpNnffaGu7quIuqKcGjZzyuQu+S62dPzyknheaqZ0HxFbn6JBH99bga
 6G1Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240964; x=1792845764; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Lws8Tb4aw4cS+GBBTx89l9hWdf4AfSDK+rtzkOVpL/Y=;
 b=o0wi3W4AZ8OwgqvxyDAcK/ufKHNJkRKI2BQ3dUdMubeWp7bbobkgm8LT95LtHZP2fY
 KaHtPVYmn+AfgDprACa84qsgko6H6Rw3vCeJ+5mDhX0yhxqRJhZ/n1M80lFLn8U2zd59
 YVNfxcVyBNcIxxyZg2LGuQe+L8AIGLrXvc0SBCfkkyq23r5kctbxsK/ferED0ETu9Grm
 cyiBIzXphiG3pzkduwqEOv7mwNR2eULPvdyJDW0T5ZXoEpNRYw7gA4TxwtbVJ5dOQhbo
 YUVBOh6HUymlRaQHIJT0yLPRfYeyLl6lq14ry+QwLyMtybV1Tp6pvVYOpcsRaMjpiT5Y
 2f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240964; x=1792845764;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Lws8Tb4aw4cS+GBBTx89l9hWdf4AfSDK+rtzkOVpL/Y=;
 b=zQGMezpBy70iWzjq3uHbO9yH1WlvJdxQxsRErr1i6HIvZSsCUXRsTTR+ps3SWgyZh9
 BuDqKjjCX6Kh9YzWgawZqHskydG6evt4s0NTjU2W3RZXh+L/RK8t5A6C668FRV3Bhbxa
 wq+iMCtRKnpxdmeEoGHJtmcEj0q1OvnxFWp0Q97tIVqambnf5E5E8VPQ2wyRoNPrIibS
 ycVEr7NLoxqmkMC7VvgX0gecF33MXvOQhxBW7VbJ+2ojQSBBfY5TwLe0pRufJFTSikd7
 5YlVizNZc3Kh1zXw1APP6uvEk7pcCW1AaSpkaBOE+JELV0K1wXqz4xwl/Li+D+9Brlki
 D/Lg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPT6czFIigW8ubRdSIwSAyHudjYaXZ20L8AAEdkQosBop5LJE7968JdSkgkl9qAXcsEcdit19D0A==@nongnu.org
X-Gm-Message-State: AFq9FYLhpsnm6HhqT6OaJExhQUYTZxh8pMWe0ymo123YK+oduXUPEcx0
 WClaUk6kpf5/2u4iryBiVrF16KTVGKbNMrlVGPHgTFicwgiMJXf2zGQENPMKCqoMn/AjQ2ul9US
 CNiiDTUcIag/lj/d8CJLQBQnGdl23ASNUOHH0YoDhDg==
X-Gm-Gg: AYBFou3n/ZQTHNzv5EwM7WArf7VMoDyXX6rVDNou/3BdqXE0bKMysnN/ZxlM4pCXMMc
 KDciU1h9A4CwHMOlhWF135JNJhSLZ22gCRz9Dn1DdZtlRznem0v0vVTIt5naSoxHj0+ZS+K387G
 DL6ETUjAkTidAURkZLJGONMUMENx3xDqUIhRVzXy78r0WaCgf60ffrdF/qhG8md5ksE/+yue4oN
 gUX6eOWvW7f/X7e1DTJ2X8PR/AnMBHehXRFhTMpPzkOVcAPWQmUdjkb0IcMPxV4MOGisXRTAnl5
 /m8olhuUZWfpIxCvWZJKX3for1uRi6koc9MXclxVG2tB1nBd6lC30xsvfkqqxK/cRXusaHQTfOx
 i3Rs6/BveUe/0lDuFfW0K5UnB05wZyThU1B/WQSo=
X-Received: by 2002:a05:690c:9a13:b0:873:5c7b:c102 with SMTP id
 00721157ae682-8b0f222301amr9707397b3.58.1792240964239; Sat, 17 Oct 2026
 05:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-5-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-5-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:42:33 +0100
X-Gm-Features: AclHuK_mJv06pfcsn4a94sOCKn9v_eJXQ6gDrvsM81IlSNFD1ymKxmelB0lmX3w
Message-ID: <CAFEAcA-D7rmx-YC1TTra0Bv-P9rzjbz=2AJ4XUgdDWntBTs23g@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] hw/net/bcm2838_genet: add GENET stub device
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add a bare-bones BCM2838 GENET (Gigabit Ethernet) sysbus device:
> MMIO region registration, an out-of-range read/write handler that
> just logs, and a reset callback. No register-level behavior yet;
> that comes in the following patches.
>
> Adapted from patch 19/41 of Sergey Kambalin's Raspberry Pi 4B
> series (patchwork series 829638) against current QEMU master. The
> reset callback and class_init() use the current Resettable-phases
> API (ResettableClass / resettable_class_set_parent_phases()) rather
> than the plain DeviceClass::reset hook the original patch used, and
> headers moved under hw/core/, both API changes since the series was
> originally posted.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

