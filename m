Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB1BCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:22:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtQJ-0002Wq-Mx; Fri, 15 May 2026 10:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtQB-0002T7-KD
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:21:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtQ8-0007fz-Of
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:21:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so4774872f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854903; cv=none;
 d=google.com; s=arc-20240605;
 b=JtC16z+VuPDp8pZYJ+kOIbtmUZFTt2nAPc+7sm7yWPHXZE4quy+GZr1mD5x4mBIH7b
 RR80uOmQDK87TPorXXoLFyrI4u5QZMQjo82ZQsoNOryquXP25A8LmUxu9vV5h+bX7jvi
 FapbC7BO9NkkVzu0GZI0xTEpgcEbgnEc4z8JnXqH64TzVykl1mHG8dzlXQuM3AEiC+JF
 /N8lljg4kqSDz/0mDDZw1/j8phzxdut0Oc/5YOTxeLF6C2NCgdGm1JX/xyu86+hxEZRr
 vPahq1/nDB9KjsbTi6sY5lJ0riVxki7jUQcGB+PvIq91gd/4TUe9/SDDt0Kmd+wnPCt9
 7YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A6TigkJBMiYq0C6l+x61U2CsRJvEKK7w6lxRs19b8qU=;
 fh=0XX52kLCo4qspL3B/S5HCavMa4o50fvg3zU8gcGJVjs=;
 b=f6FzIeyG4wcAsIw7lI39HKdPbgGOI+DzsXYDeGiNG6MF5+u40hFnftK/MGJ3lZqE7F
 Yr2n8FmpL9gm6GLjJA+zPeGhP2fzgEUb+x16gHmZhwvfjRKw2u36SgMawm2uu61u1MgT
 rEnSxc+Pe+C0l4jhQGLqX5NKYcP6ylklfb79mXKGz1pyoQCU7Ke2a9Aq9I8Kjn7rXtho
 pePWtzclwdmh1BA0gzJ+X1VMAnRsuZXyUl/SJGCwsuetatfqukf/LvCfHvxIJQ9G7uzs
 ObprABiYX1w9+f4D4EmwcmDhu5wIkLw6QHdTph4BOWpSFe691XvL4kDzqlSLN+LazdgY
 FVfQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854903; x=1779459703; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6TigkJBMiYq0C6l+x61U2CsRJvEKK7w6lxRs19b8qU=;
 b=pvqawHvbyam7v9OrcS9Nyuj59VSkuxm8clE02SZMDlltEn9khSB84uzaEliAI3wgU6
 KJR94Fs9rOXPMZS+4G2fPpCtb6/dbVKFjSHUkL2ZuR+7w/evxthxUHrbX43wbYsYbgUr
 Zp8XDOBMUt3FRmtT2p3Xc1mRFAace5qRCENj+MwLvqgb5fSsMXvJtRP32gFUScvDzZ0p
 ASCveDx/xbMCgnZS5fjm1mjJbbkUT2SiZJlxk96Vn4iKbrJePHjh1cG/lAN+LHwc+2rz
 WLEAkyxa5wGGUfHBD5G2QmoiXpzi2YFk/lytHcbZ9ZN+spKSOfjsUayq4necZFhPmg0R
 tn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854903; x=1779459703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A6TigkJBMiYq0C6l+x61U2CsRJvEKK7w6lxRs19b8qU=;
 b=bLn/bQ2cNK4UoDjPVbULEJTGSqGuPVYw3nVYpLEF4parR+41ReZah9o+zCewHe5Q6L
 7cCmShNeuWI+Tc44eXDvJOL46PVZPOmlHaIGucPIuqkqZ0JKQZR6Em6LExnHz/d9H0rl
 crLW2OVZyAAI9TFk6x8VPfpEaHINZ5L/kNUo9AzmdGV4u87QPhZuJOZnUvK6Oi3PVTvc
 eODA/KkJzgOm5geC5GRGyWywnQx2vTMIrst25YqLY/WBY1BCEL9FyJh5Pk8yRkxFpHft
 CneMITibh6+BOHHEWJtKIfD+lv3sNP6LKnegeu0HAh2dzAOi6xsC3t3OsB7XGRMsVmBX
 I4kw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/YtIoNNJHB4l+ZHRyQcmHBej0ehyqpxZRNOsYcqgLRVGSFyLEjnidDwx8FYaAVrvfS6z1QscSjNQ==@nongnu.org
X-Gm-Message-State: AOJu0YzbGTsiGkGnK/09dbFIlu64uDQQ8ZWlHqurTkpM/RIXn1PtF7T1
 AnoCmTPmgMIzxkp2oAy992ehXqr+xrPk0lCvXaV0sBQZ1HFMYCsaZDp3M00RH+au8v2Hw8tcU4N
 vj5GVG41utEeg6cpNbYPtMAem3LJ+4T++I0gQN7ScDw==
X-Gm-Gg: Acq92OHbT6Y/7A5JvUHbe2gmbIK1dlnJCphQNnsyAqEsB80kyzOw1mduliikqkIrXln
 3+mfSIfJV7emlBvsb7TNHx90CSM1HEW5FdHgl388gF/VGdXXmPOufzrjhR8D2Q93awYpXUF7kvP
 lIQRv2cBdjvIDcWctniDIiLMIKr7xiazRa4TQ6pqgbbkTFATpN0ypPftJRQrR/Npqmrgm7o1aXV
 ghAO/u8XUHHZZ+0NKWk31Gc969cjYhs0CO0+J2F7sQusIzWUXleBdeEdYUe2wC+NNJHePBy8x61
 YAHQ1NPO/Inwbgcw1mNQzxThtHzoMj+D36H9VnDDEVJCgVnkGxYHrTbqHFyt
X-Received: by 2002:a5d:5847:0:b0:45d:b14b:2402 with SMTP id
 ffacd0b85a97d-45e5c5af3d6mr6003924f8f.11.1778854902940; Fri, 15 May 2026
 07:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-10-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-10-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:21:15 +0300
X-Gm-Features: AVHnY4LYCfEUJUHUVlifvR3EaIDMir3XRsfjNofjJEt5L_nV7qLPRilcUEM4tJw
Message-ID: <CAAjaMXbmCR10cGb8DsYF+vHFxb2NNVpxGJsijh76o3fOEXH=CQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] target/arm: Build cpu64.o as common object
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42c.google.com
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

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> While gdbstub64.o is already built once, build it as
> common object, reducing target-specific set in arm_ss[].
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

The commit message was copied from the gdbstub patch, but this patch
touches the decodetree a64 gen files

For the patch changes:

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


>  target/arm/tcg/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 9eeccb2adca..f821331fbee 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -27,15 +27,13 @@ translate32_d =3D [
>    decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-de=
code=3Ddisas_t16']),
>  ]
>
> -arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
>  arm_stubs_ss.add(files('stubs32.c'))
>
>  arm_ss.add(files(
>    'cpu32.c',
>  ))
>
> -arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> -  'cpu64.c',
> +arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64 + files(
>    'gengvec64.c',
>    'translate-a64.c',
>    'translate-sve.c',
> @@ -79,6 +77,9 @@ arm_common_user_system_ss.add(
>    'vec_helper.c',
>    'vfp_helper.c',
>  ))
> +arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
> +  'cpu64.c',
> +))
>
>  arm_common_system_ss.add(files(
>    'cpregs-at.c',
> --
> 2.53.0
>

