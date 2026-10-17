Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8D8CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 13:15:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI4FP-0006F8-GH; Sat, 17 Oct 2026 09:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI4FA-0006B4-UC
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:14:37 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI4F9-0006xz-81
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 09:14:36 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-8b0db268bd8so4195287b3.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 06:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792242874; cv=none;
 d=google.com; s=arc-20260327;
 b=StzHJ+OADBu2X2HZalOkHq3VIjQoZ71oWTo9dvLjv4wOLFbYzSJ8SMr5mGgwYv8mVK
 UXsqlKNcuWOjdw1ONT3eMmN6z7EIm3pBFzkcAp3CZWD7+bu6D+AbSwnNzacJ7XMA3x7J
 ugCgUQpGTmnkq703TOaEfTBH6Ohg2kE0Oj12jcbv+v5lZuwQHDrSo3Iyato4ePAusut/
 ZMUiSQ8kEMDcWr7Yub4KpOuxq/XmzS1GwAH13A2z63ASs2QhcVmXjn9nyLaQxyqN5+JW
 0ZXxPRn1KepcOhskc+0zi3ofF6VxhnxK+D3b09hngOVWZNh7oPHVE7tiie0S8yRTRyS4
 qv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qEWOcn5RYwvYVIGDAT1q/wdyqeEISGmxEITvVszWRNc=;
 fh=PXpyShR+LMquinamJJv4uqqHjXS42Q61JW4lEVgki5U=;
 b=BSK/rt4/qxFLJo9LG9HK87bc/eIJEIRkx65wPjL5RNiW3vwF6Yn2EYr7MmQWAzuze1
 dp7IFQAo6M5wGyH7gGdQsHTj0HjgAxZ4cZszWpxvRwBnus5FVU+Aj4Br2yNmaVm3Y422
 y5vrBpg6vDb98igppfPGeZOmqzl6xJ7GzK1SRy2cEHSxRlTngL049+exC6SQv5ExwmuR
 c90mYhzOtWUj7Ul7hJD+wVo2oZzAfXz0qCgQp+TNB3v+ef+x+TAlJw5sWw5H5e79CdDz
 2I6rUcBsS7f9ULRKaX8rDEBd+RliQ9xBmG0NBO7DW1QdyPEyjXQkeWK7rjBJtvpj+w/e
 OwPg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792242874; x=1792847674; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qEWOcn5RYwvYVIGDAT1q/wdyqeEISGmxEITvVszWRNc=;
 b=sSiHce37PiyniKcAJtzquj888uyRCgwTg6bhsAj/TVvuzexNtmyIQ3qa4vgUiINz8t
 BeF3RmOO+amVrdloO5rsITotleGs8plsR7xQ2pFKtUe8uvgP7VYW4JQwISQ37vpd1Dsf
 juYK0hK3iTdX/QOTLk8g04bxLdhEFNJpk3DKJH6nnXPLCc7eOavva8goQ7xLBWrRgt+F
 j3JVNGFwgQAzNFq6LJ6MI5caBiLG5p7HSe+wfgNkYHITgViSONeNHlsI9TJ23UobFqGl
 Lu66dBEWjWO0YLjWM75RouXUWje646B4i7ChDpqT8XVmgPBIws5dU9xU7StCLOn0QQXq
 yjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792242874; x=1792847674;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qEWOcn5RYwvYVIGDAT1q/wdyqeEISGmxEITvVszWRNc=;
 b=EGlmZXE+aoXK3vunBbTW3Bd+iK7mnwYugDNU2WnHqyqVF58Xe4CbBAG+w1j4HXQFIg
 kzdKHtJC0fcJABEnAUyT9BimmLMSUFLCft90q+LuNxtrIS/O9GXKsUAhGfFkz+TmD7EV
 Y3s/xsE6K+08v641xU1cAq/uVMYxbTQ2KwmFpMr+NKWT0YjxvSeTGbmMPOhYSqSS0JjS
 n0KtGlSTUOz/xS/6bbhDqBDeLfyhgI9cZPpoIZclmWQXPhG4c2BBMQJlrP/gK9BG2NLv
 ax/k2FlHHIOPNCPMspGWez/cv6dxUDMSlfa7ee3OTnXmEXSrBamSxun4pqECaZ2fpOS+
 LgBw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4dnp+Ojr4txiReEz7OmXQ8x4I7eNwG/vXyEhnH//TbmEsNdml6awSMAPU/3yCljmUfP+wLLsUyg==@nongnu.org
X-Gm-Message-State: AFq9FYKzeHI1H+GZArdlURXxW+1kUYtTC5XzJ+sdoN3mqOBQURcJKo/m
 MgC0xKUoVj2rozIs3dLSHBCJwKbDLgXP50S6ao/6K2xA5GdmkXxZ9O1f+j0lkkNIY+P9aJmo49C
 I15Z9jLAb2m9JP5u2w0Jhe/gMbNO8GVvHm4q8GpsUVQ==
X-Gm-Gg: AYBFou0jU7OAu1lgu96gMzVH7t3PlSkJwR13s4M4pnAti7GDNB3Yzzjx1ukkxmJHwza
 Rrh3FGDEdkcFJPzwJ+aMMBp6V8T6Viw68LtE1cAdpkM6zxRmvdzsfJ7WN6ZdWJrlHRG69hAfteS
 xPVqI5xdfi1p942zdu7GxqsXQA+M9eaPhUdyRiWdLfvszYUcixOfJGd9JLIXO0a4xuGOAEXOqBG
 +YWqUlWiAtlGWP7R3QqErT1LdOPi/4eJIEDPptRXZ+H7rYZnkckCG86taF2nQZmm7BeYuzSRTKa
 CrfE9B466b+9+ESaAzv6DNq4H3IfQWuJdE90Q4xOF8LIGR9BkjoAExzBX5m0DtMGWcKh8tH8OtV
 /XHaXG97Kx8NbNkuoa+BL6jgj7heeV8Rf1D/Mi7VHH8k/mWU25g==
X-Received: by 2002:a05:690c:6893:b0:8b0:ecff:f223 with SMTP id
 00721157ae682-8b0f2188e80mr10625377b3.37.1792242873821; Sat, 17 Oct 2026
 06:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-15-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-15-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 14:14:22 +0100
X-Gm-Features: AclHuK_zYUtq4yQVq23K3JynxC_1UL7quBQsPnT4HXp_V0ngxKXhI966H8ryyyM
Message-ID: <CAFEAcA8_voS7tWiBSgdgmJ35+zqpuoUK929sXVgGb_OHewutNA@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] hw/arm/bcm2838: enable BCM2838 GENET controller
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
> Wire the BCM2838 GENET device (added in the previous patches) into
> the SoC: instantiate it in the peripherals block with
> qemu_configure_nic_device() so it picks up a -nic/-netdev from the
> command line, map its register region at the real BCM2711 physical
> offset, and route its two interrupt lines through the GIC. Also stop
> raspi4b from masking out the "brcm,bcm2711-genet-v5" device-tree
> node, now that the controller it describes is actually implemented.
>
> Adapted from patches 19-29/41 of Sergey Kambalin's Raspberry Pi 4B
> series (patchwork series 829638) against current QEMU master.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(you can keep that R-by even with the rebase fixup that
the nodes_to_remove processing loop goes away when this
lands after the RNG200 series.)

thanks
-- PMM

