Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4103CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:08:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kC2-0002jU-Ge; Fri, 17 Oct 2025 09:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kC0-0002iV-3o
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:24 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kBp-0004K8-V5
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:08:23 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-783fa3aa35cso2248157b3.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706487; x=1761311287; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EOX/WQzjT3o9PGNahJE4722CtdJpXS5IBHnPBT0VUDM=;
 b=UdkHh2gacpFisYOPvtwBlPl2LlLJYoIZ9l1icWx7yJfkk2UAU3V26Y+JNVxF7OapMy
 5/tuU360qrzlY6dYNCG6QqXf5pFEkt+V8T6Fft9/5B+2PQaCSIIz2Fzx4rGlYDcdTUHB
 iq7LdGYP22/x3N941aZIyo/R0QK1rOPQgfEftBzsdEfp2bYUbSl6aXTatJodBzeupAvK
 ipPwTTk7fpVWpm+XUPAKXwcuDAUA+No2l8ir6zG0PgKbojBbuSWoPUDzfi7fdFgh0QqU
 Ez1cOVR+bFw7XGbfBO0HiHe0Me/oPUzDc7OE3yMWb5RD7wG0ODP/d5hGfHdlMtvO4RJy
 cF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706487; x=1761311287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOX/WQzjT3o9PGNahJE4722CtdJpXS5IBHnPBT0VUDM=;
 b=VdCwb+91RCMeKnRlAoOvOIiJvjmVATPcv77zduXYhM3XxDSOa6Do7Y/w+K8AscJjVU
 6E6U1jLOl+VvAsyzGzO3BTJXsru+KOf43MUuebcrzoyvf85N2upnbsrUXtMK/7O8Pv6q
 CCrHUIdbUMsCvugyuFzaJfa+KOjwIVyx97gDN/8g/S9Ql8EtWsVEXy9JchmtvrD+nHap
 ZvGvM1fk0901FHDEefBEghZzVm3ozVqD9Zjhho4kPM3wEtqzTESmqXWUzyb8OuRKAyHs
 40i/fwRIc2OxGtGTlhmn5ZJg8JRzTC7WdxxxByDxbPiDHSrEv3xH/awniTfetn9lhyQw
 XYww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC0VleOHhZ1SxlsL2d/g2Rd/Uia0bjgvQ2dY+fCrwIXTA74xHELZYEbUr3iFkq3Em9OvFn4GObkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy33DUdGnIy+LZg7zrVEc6Exp8cZlYNle0cFMWajjR3D5cDurFV
 Lxw9ilS5be7Xu+n+Od9vFzFTQ8F+8txWe9rDzpYHa4+kps5q+cwqra6flI0b5M5knTxlx9gbrtc
 +YC0mBtxPa4b0ogDvCWxKEwblNgkklXfl4G4NDCzFOmfThG2UAETU
X-Gm-Gg: ASbGnctDpXZXCCJpqUPlJ1dFzf4qnjLbVJyuKNrO8j8hi+OOb2gfyFKAnSimLb97RMR
 iFji4dNs8q0yAG1YLpDsdHffcFeeqjV1zUk3kJaOsbjxkM8onZxoCZLYKGaZEqSmcE0S8AO/gNe
 WNTf5M9n+54CeqcX0JIN5QFBZvad3UMB3i0MAKdTsEfvDwsgcqfZ65+TC2wu4ZLKHnEq6gRfQrC
 iD2VgsY8+Oo8nko5/fDfs29Zn90IBSm+avCRoQCZ3qLMdlZAvIBxIdVyC0VFQ==
X-Google-Smtp-Source: AGHT+IEFbB606H3WvX0IzjfN8a597azWq+klDlZ7sxXgfG/SUzB6I+NBNevaACbSMczjwGlWLfMMSO5lpIjK3ZrplK4=
X-Received: by 2002:a05:690e:1244:b0:635:4ecd:75a3 with SMTP id
 956f58d0204a3-63e1625a89fmr2698520d50.49.1760706487046; Fri, 17 Oct 2025
 06:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-7-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:07:55 +0100
X-Gm-Features: AS18NWBxzU_bVcjTrG4rD959H0fu-VKTlD1ZIXpJyduFZZNSMo5bKAQzicReWVc
Message-ID: <CAFEAcA--zMJxjLmivDCjRoGfQp5gVMLe8J0_RSZom3Esz=OE0g@mail.gmail.com>
Subject: Re: [PATCH v2 06/37] target/arm: Add raw_read128, raw_write128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 14 Oct 2025 at 21:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h |  6 ++++++
>  target/arm/helper.c | 21 +++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

