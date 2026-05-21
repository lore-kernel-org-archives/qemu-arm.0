Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DCBCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:04:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ40k-0000hV-KI; Thu, 21 May 2026 10:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ40e-0000fw-GF
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:04:24 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ40c-00058t-Ng
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:04:24 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-65dd9b25829so4872065d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372261; cv=none;
 d=google.com; s=arc-20240605;
 b=BZfvWieXmg3nDrIpyAi3gqQ2zzwY5LSM88BVa2EZSEOnAji1k9Vxmpqzti+bwPdu9/
 T7a4LdoSHSlB1FB/IsWkA/DhWRlQ4BsgNDIZZ0B6+NWry6DMLHTBUPHDu7tGrQWNAb1S
 WCmjw+vnn0SaQyzshPe+15SmNgvuPMEBV3BPy5hY18EunhvTk901y+vPkjzKV3dFBTpN
 HElXZOeci9idpopEYfNWnkbc6BZhYQl3jQ7PQlihh2XT4WOWgze7aQoWGlAUT2XP+qp9
 4tIoL7BuBVyfb5eW/9S5TMILbjC7C/OHSKWmRO7WTbnhewny90uwGWjvf6JZbMD7cFGV
 ZxRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jkCKT/AC/dC7lUpr1/AfDWgiBCN/yo9Osm9aRvZhr6g=;
 fh=BNyK5Sl2tmDBZGusOgcV/+UEgEpAMEUyP8nCliFexGI=;
 b=cS35PBsEWQm6grnVgYDq5u5YyMSxkAydYVIKaAK4F9PiKE0ng0JqDPKaxvmEBlMlVc
 7Xo+m0Y7MyXR7q1p5Cd+qYaZLm966b9xnP7ZUrtxNVWdtprjmpSiOYHNdHTTKtAo6Nhc
 MJVDrqHsc8iiD19zY5SkOrzBpaIQnaJcWvO3R+F8wVOv0pupFl95MAiiZt1VQYweTTEC
 9lftXp0c1RxckCiBmuKgjSJuyNuARLmpbcHJgVsTs1nmvSOhpx0eHL5RLKxoq/Vhn8qh
 M1l1VsWkYj6C9Lm7gIhlniWE7UKdEfhlE00yn0TNdXAHwZqZtubaqTdtcFJg2XKHzuQT
 GoRA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779372261; x=1779977061; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jkCKT/AC/dC7lUpr1/AfDWgiBCN/yo9Osm9aRvZhr6g=;
 b=I77xyavXkjxmJndRsbGzxCpTIeu2gxrcJjvZq7ASde4sSDBY7g7myA8tmxT7Hobwxn
 6S26tPF+LCDSh8toIFtJIcXy2gHGRYNNPo0YIBFtfPttO++i8KdWtxUWzvrwl7cSoX52
 XedC8KGZQu4CgMqywmhBhCGiWHNDFt+COuOSzJHCz44IWFe9BOCPVfjz/qPVLzWVqOhD
 IjEox63eWn34WUWwckofCIkbF5UY7WbydcnSQ1Ubb2wV6cf49AmsjPk+nT6iZzuHKrHB
 Agdd3N4gRnTmW9MA7G/6NuZosl/20igeIFTaa9f2gLv4vk+GKPwAtL0o2sI7V9u/Qne7
 vOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779372261; x=1779977061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jkCKT/AC/dC7lUpr1/AfDWgiBCN/yo9Osm9aRvZhr6g=;
 b=YboH/R7rS6LlbGUgjO/Yoodo0UfdP0a3XeOlmpTTd4O0/KKhenm5ZmoDO7N2Asi0q8
 w0k0Yryq0h2PQCvMazARw8Lu7B6uj6AZuSHsG46dOo/nYPUlXi5NlIdMOaa1h0U7MS/9
 Qifa9zq29EC6ZB2/2jm7n3vWfx5d2xh/m8LE/zXgetmVtt/6DaD/txOl9VGkmGdF2gP/
 avHcsMMQh9OfhrtRlX7Cq6b2jtdVluHE2+4QSviJ5eg8wh5JBNpce/CeetBjoUWZXaK0
 AbXevkYOe6Furj1mVkVfcbicHCqkGNMvpYAlC5Sn+gFfCSpVl8AqSfsSy4UdUdJOlY85
 vc5g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GfirJ2tZpGEZovAPAoEo6bQAq4sgy1tL1jrU19tywFSfV3oM4OFi1GLbRiVpUD0uLdrSSmZH/5Q==@nongnu.org
X-Gm-Message-State: AOJu0YxdUF3KQ9IofrUM3wTkGkAsIG/hExxPuaSNggzaUdiMGCKODC8B
 6/oT9/AI3lensnBvenOW4iPO0DdGvnj6j3j8iM8pnXtFou64DLCjhWSN/q23JTrU9986fUYCkG9
 J6ULAAc6UmxLWsr3rqQBP6TZ7EJVcS5NePZi7ncoGOg==
X-Gm-Gg: Acq92OHexIH3HJTb6wDdnpqw9RNVCGjeG0/8V5DFxIDz0UCylfmgULg8zIvu8RbPuy9
 17RnNoRS88N+UUg+u+RGt48fyMfoqoDN4vWyuAeHWbLyKOT9sIiWCMV9RtGZAUSUqcO4WqAX7Wc
 KUQcwvxwwF9iMBHtxGaRZ+GDrqjSkEq+6BlYnqKErNl9vG9Vuy+JAs3+a3PYRSsLZtO9lQg6N56
 sae9871UFrOJhH4Z3W8sJcjptE+8YAfvGa53Oum6ZUKgxdMYEURIG/wpsxP3M4yYeCIKGgzyj9x
 ZDg/ke7XdcIsu1lFeCJZwgowmdlY+5Dm4NgIRAWylo1DEjZvE2AHj4bc4ZOQ+/oPq0c=
X-Received: by 2002:a05:690e:14c1:b0:65e:b2fc:bc08 with SMTP id
 956f58d0204a3-65eb2fcbdd3mr1966884d50.6.1779372244802; Thu, 21 May 2026
 07:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-7-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:03:53 +0100
X-Gm-Features: AVHnY4K_qHnx-uIikVd_EdclqX5Uyx1keBUVSkvfo_7yJTHAz5P4mbcJYh5NRIw
Message-ID: <CAFEAcA_mtLpE9dYJOyvs==j8xdsrgys4nVv=_RewFPT8hqJN7w@mail.gmail.com>
Subject: Re: [PATCH v6 06/64] target/arm: Update SCR bits for Arm ARM M.a.a
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

On Wed, 20 May 2026 at 19:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 15a13b9292..0a11dd9002 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1820,6 +1820,17 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>  #define SCR_AIEN              (1ULL << 46)
>  #define SCR_GPF               (1ULL << 48)
>  #define SCR_MECEN             (1ULL << 49)
> +#define SCR_ENFPM             (1ULL << 50)
> +#define SCR_TMEA              (1ULL << 51)
> +#define SCR_TWERR             (1ULL << 52)
> +#define SCR_PFAREN            (1ULL << 53)
> +#define SCR_SRMASKEN          (1ULL << 54)
> +#define SCR_ENIDCP128         (1ULL << 55)
> +#define SCR_DSE               (1ULL << 57)
> +#define SCR_ENDSE             (1ULL << 58)
> +#define SCR_FGTEN2            (1ULL << 59)
> +#define SCR_HDBSSEN           (1ULL << 60)
> +#define SCR_HACEBSEN          (1ULL << 61)

Typo: should be HACDBSEN.

(Hardware Accelerator for Cleaning Dirty ??Bit?? State ENable.
The Arm ARM doesn't say what the "B" is for but it's in the
FEAT_HACDBS feature name and all the register names. "Bit"
is my guess.)

>  #define SCR_NSE               (1ULL << 62)
>
>  /* GCSCR_ELx fields */
> --
> 2.43.0

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

