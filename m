Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A123C4451B
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Jul 2026 08:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wl0Wn-0004Tg-4a; Sat, 18 Jul 2026 04:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wl0Wm-0004TA-2z
 for qemu-arm@nongnu.org; Sat, 18 Jul 2026 04:36:08 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wl0Wk-0000TL-Hl
 for qemu-arm@nongnu.org; Sat, 18 Jul 2026 04:36:07 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-81ef11a0972so17050627b3.1
 for <qemu-arm@nongnu.org>; Sat, 18 Jul 2026 01:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784363765; cv=none;
 d=google.com; s=arc-20260327;
 b=LYHZjJ629d5B1YgcJcfgctNgclatMBBtnMj9+Waw1b4oqXyF7dK8AX8Zq/a8+SbqXV
 Nk1H2k45UCjmiCx8xqlJ6kerjrJQtlEcQO6R0H6pMKsqnAoPA4frpP0JPJ8ULi/KaYwm
 nCSFYU4ZrOaZGiXq4MgSMwbykpwygj8DayFSHHEPVhNIZF3oSMLaJRYuPq4c0lXUiL26
 OThVCEo2tMZ5dv8JQDpOilUagKJhBEVBrdLhOJyuPyauCfKOKJ9OuDon5H2ABO+fBwCZ
 QHCEqjFSXeTtrNgC1oX/91xLCuRvp8cAe9vUR+miZCBhIGg2qihHJWUwXpcj1+DBp3DQ
 Vw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1bhdRA+bAZrwL/W/YVvs3hmG2rI0cukExJuEs58QV0A=;
 fh=+cDv2dAHmeKgXXqXOG0RFJcXPK/7PTC1MP/D9m1w8t0=;
 b=Inqchn45fsv4c3y7tBCj/JBeiEyFt8MfjoxoSOgPlS2CPjKxbkJxQzxRKS+IblNfQt
 kuMyE/C/Zaw9m46GErkyq5kwAx8LRQIeVox873mTzzDbUCgR3EhLnAQA4j24PJvNGuGL
 O3v45HAkK+R1PrFaAcKYmgvtazi74Qx+34J9VrLqgj8fRyHHBSGobarKMbrMykCcygVo
 ZllIa3ELot/+nCd2CEtNTK08ndrOsiPreDj7L1Nn6Zu94DrFcltf5Krt8x0X3+QJa0w9
 3TophZFUQjo0X2gFfOjZ0P5ObHRiUzA2REH0MBcWJ1ZKksWuKGNBIBVJnfWBdDpKy1Zx
 Y5CA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784363765; x=1784968565; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1bhdRA+bAZrwL/W/YVvs3hmG2rI0cukExJuEs58QV0A=;
 b=nDGYbfpwFQNxXCRPK1/ypB85KWDNNCLcYW2279ETW+zuwMPc9p9LUwadv47GgKu5uJ
 L4RTieDCu3A/8U4kLbV9XvAKJkRKSmy0ycet0TImmnQM+ItzKmwpp/Zffmz+u0wg9dGo
 ORCWC0//RJwlrMXpXw3sJgq3EXbPTAXFLJXnJXq1DINOZcbYm9fVWvuShO+eB3Kjx5e/
 3gJFv9pzN1bdZwiHCotmtM9u9rj4VtJpc7rkuMlplFeDLFuZbyuWXiKey/fvHPePEwaz
 nh2FgSM+MZHGrPhxDnW8XPL4x/sNK2SZ7EKYLKk9No4Wl8E7QS9+tgcNvkmO/m2F4j9V
 Aztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784363765; x=1784968565;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1bhdRA+bAZrwL/W/YVvs3hmG2rI0cukExJuEs58QV0A=;
 b=GyS1tTjuBWfu5TGydqNPBLZtXH+qa3VF9w8R1WymEmtB+J4cMhewama+pT5Tn+0Xdv
 NOYFlo1ljrYoOBuXpfux/+P6Scqy2qfwQNCKXjkdeNU5NmtxPe0RRZwZDyH1H9SIG87H
 48wXwL3tqtdxfyooqZ/keN4LXR4WQ5ImPgDKlS3Y3TqJO8ALHFiuklcOoyFeCZH7Esiq
 MXK9VGLH/OaXM4oAcbR+s7SlbYvqyDAoTRb9OqkN0XZ1so+sU0vpL0YiPuRsFjL+dSYN
 5oDJA5fjduehcQMpIKUIWOYew/YFGayFia40m6a3hgdmEPytSdMyYuGo4979D06gZvph
 uBhw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFkOqbf1y3XNrWc+6F7Uzb2tnJjzjEE1l8Dti8coKnWhwGTa40K4Ob5hKMpjqfDDSPmaFOczT9Ug==@nongnu.org
X-Gm-Message-State: AOJu0YxQ2N13HVZBX89jNRSs/KqWqacs9NEYxU4CjIN8op8iDIyPPi4h
 T6jBn4SmKLMssEeEh8ty2xV+mlIPicnKOTpnkIZaMF/N/C3DVOmwq5COX6rpBsh4EIs541MSlQj
 trQQGZgsghBmlwb/wk8PvVTu5MO8XVdGVJZ3Jx7p9/w==
X-Gm-Gg: AfdE7ckyyNLIGjdX9CmHqD2jD6LljdjQEV3iG6LP9rr/T0P0JPfEjhOQzK12EHIBKyj
 5bRHr5EwJhB+0K6/jXu0ulvqLXh5xrPmj5HeXZOxj/aRo4vWva3X3My8aLBFrkXwOkny9x0QFg3
 O4ZQKoHJMIKh9sMICXkDtbfvXc6G0br6yMBurGJ9SdgiTlRQ9woxXQa1Ym6Um4TrOx3lKyqFbyl
 LRNDJ8v/gkr61UqAycD/3ra3qyLVCibREqnKl4q10BQrKXeOAiFfX0hkxOK3h9mpyAWyHpPP2YN
 40ioodluhBkZs490DubfXOB8weuHggAJ6ZYGMCaFAlmt7Q==
X-Received: by 2002:a05:690c:6107:b0:81e:bbcd:f5c3 with SMTP id
 00721157ae682-81ef25e16eamr20044647b3.36.1784363765260; Sat, 18 Jul 2026
 01:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260713064617.85374-1-jay.chang@sifive.com>
In-Reply-To: <20260713064617.85374-1-jay.chang@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2026 09:35:53 +0100
X-Gm-Features: AUfX_myELAvPEZOQ84O3IQo3tQ5Iritm3JvnM1UFUffMQLDNjrHx4iHCNzjBWr8
Message-ID: <CAFEAcA8B6aT3oSpB86Kxxkb6sFJ3GXf306UUtWhDsK8qrRw0EQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xilinx_axienet: Fix PHY register 17 link status
 reporting
To: Jay Chang <jay.chang@sifive.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowangio@gmail.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 13 Jul 2026 at 07:46, Jay Chang <jay.chang@sifive.com> wrote:
>
> The Marvell 88E1111 PHY register 17 (PHY Specific Status Register)
> bit 10 reports real-time link status. Previously, this register
> returned a fixed value of 0x8800 with bit 10 always cleared,
> causing U-Boot to always detect "No link" even when the link
> was up.
>
> Signed-off-by: Jay Chang <jay.chang@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/net/xilinx_axienet.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 970732b162..9f5f65ecfa 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -103,6 +103,9 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
>          case 17:
>              /* Marvell PHY on many xilinx boards.  */
>              r = 0x8000; /* 1000Mb  */
> +            if (phy->link) {
> +                r |= 0x0400; /* Link is up */
> +            }
>              break;

This matches the Marvell PHY datasheet, so seems reasonable.

Applied to target-arm.next, thanks.

-- PMM

