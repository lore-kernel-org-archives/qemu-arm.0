Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2FCD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSZss-0000Nz-CF; Thu, 28 May 2026 08:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZsk-0000NF-VZ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:30:39 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSZsh-0004tO-MP
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:30:38 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7dc2b658544so7866087b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971434; cv=none;
 d=google.com; s=arc-20240605;
 b=hrLAKdqjLntkzNt7vRX70cuXabEhQxLoPgN2VTDzE+L/9VvABb0g4OXanf32A7UMqO
 tBPjyJdtDOcU1ZfTgeoRM834bY5h7+POvKnTEbPrVENATTOeC0CnNoeBfkvhF2HG9IJJ
 9bJgWXIcmtBAOF/B7MgOW1Kw9E/w4KJvOMQxnxbxeLC5Ybj+liqWXP+KQr1fQtIXxinK
 YQAjgkxQJJTeieiUfNIetLUtB/yCHu9vQUafFU/eziYMF+jNTMBLIUS/iS69eyLgUFjt
 31dEja8vOYnzfVKvIL8tfJZH1gx+CYA9aj72IgI46qFaOoEUPQqYY3UAQaHMgk48oQOw
 fC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4pvj0dvBibQpvPV6F4+6ZWxhtEE49L4JLE26jtC8kfk=;
 fh=6BQsTya0si4Mut9U8ARTvQle+M+8HvugMOMpDamBglY=;
 b=BCnKDkfe/xy7+bmpr/OX6RwLSAu19cpYMNUrDtWGA8jdfDf3SsbA9r80VYM9yZKwIN
 HT3qOdJSC+TlHXn9UR5cRbuEfTjdJgNjJzVFuuVNPK7P0TfJBq8Cwac8yzTlfrlY99Gc
 TMGZE60L90SEeTBgla+NXs0BFDCOS8vjACOPXWL+NFYhu++/nWRuWEWmHowwYE9k8aNm
 bZe8/u3v1fayV2Jw76POvfLDdYYimIzcguu0sujDi2ffgaprq+ODZdUMcZOx8Hymz6DR
 J1V5cvQ1VVH8r5KiJ0V6QekTV1bFbaE+im1MWHjApi8UK30pszCnwunawh1y5Z5LLS7N
 9RkA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779971434; x=1780576234; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pvj0dvBibQpvPV6F4+6ZWxhtEE49L4JLE26jtC8kfk=;
 b=UJIVF3pk7jnMPkCgjAGl7uHuR8ga1OebC2mnwVHeIwWFDKKh4EaDrHg+Lrh3vbQZKG
 KBr1YN9hwJ+9s04cx0VUvVrwoDiPbvGZpJa5Zl2Up+yoJiOctjLdyecvnsVR/DVQSmS9
 Fcc7E6O6PCQkzIw591KJZVNdMsBMVe5Ne5u7Tre2fo3QkpEwHZj1W2TkHXGQONrLFcrf
 Y6HD40mZjVotJ5L07y1M7iiH3CRfvm0Rncj0NYjcySjgFngLdHHK8rmbmHiplKvnDYEu
 HradqWHJRjuTVc9YFwB4rsJJP1kLVijtjtGneO+OtfPZB6knpL0fRnKGLntCb/Cyi92T
 a6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779971434; x=1780576234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4pvj0dvBibQpvPV6F4+6ZWxhtEE49L4JLE26jtC8kfk=;
 b=q2c8kxezr/LzILu1mRzyK1Xt0SErnYBRmq2sd4jfPVo6En8wbUi0ubxl+OGpEhE5GC
 lIZykCaca+7PPt8LEEk7TNV3sGUYc5GgZyBeu4slJNBkujK01Yb0vKXc9yZumfMbRofP
 egAuxB0nHROg2jNNbTa6Yrgd5r4jxgQz/jgsnZJgxrD+huaBhMSzsuwofz7qaPorQgSc
 r8PtQgkj6ufg5Gg5xDrOEK2Pn9PQfT21ATLeMffyobJAF88apQE/gmFpO1qfi6KMPtwC
 GBEx9GrF/AX4kU64HJPYAN/wncQeuKKoOZuCCBFneEG8H1hgIG2lmq9z5BqqflGMuX+R
 X3Kg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZoUHCxbfLUrnayDVmLSmAvq9VrmFyreNXB3qF2OvLgAm3GmI5V3y+3bB7pf6VVQinKdvvARvYOA==@nongnu.org
X-Gm-Message-State: AOJu0YyYe/ECs7eDyJbaexSnqTTg23kTXVmKTomPfFIMIKSvF0EcMsUd
 DAB9EvAsdteWXBnyLwyBMz2JESqF6pvQc48gsoZL3neJRwUkt/HiKcqrOJP/Jy35gLm/hpkfK2N
 lkBmkk0Mbfa3Z+B4m2rpw94ymdtF5Ed0v3HziqNrWig==
X-Gm-Gg: Acq92OFWo4kufVtpdMa7xZuE1bykCTlziynEDokyX5MPv6yjytCuR9k07Ru+Z4AhgKw
 kiT0JGcp5+I6NoIE2sgGcna0S7Y3ahpulJCCBaM2SDqFo2lwUm1mAqEoPoUkcuT4bYjco9l0ZlG
 YA7v9clDQb8dHzRd3cEo/58Q3Mvrtcah1r4rP+ODw3G/e+/h+or7dWxQMA+mp4vB5buDFqtzxuY
 QIPHW3XmuMQ7+TvhTKG8EybgKuRed/I6w1vYdhV1UJvucdK3dwm9EWEeozwlveIz62E3nSdEaMQ
 iaJrmkaRWC03bI+L6WtWtzzqJJkQnipu7bChcz/d0kPQeWdDPWItNtgNeM2hryN4Vow7qi9R1z/
 5Kw==
X-Received: by 2002:a53:d050:0:20b0:65c:7352:7afc with SMTP id
 956f58d0204a3-65ec98ea67bmr21313766d50.31.1779971433909; Thu, 28 May 2026
 05:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
 <20260518073401.11279-12-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-12-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 13:30:21 +0100
X-Gm-Features: AVHnY4LS69lDHy96y5bDPvR7CE_spwANsS5WL3dXpgHusQ-W-NuvVVHpQkB1fnk
Message-ID: <CAFEAcA9s8ztFQY2pbpnx8f_EEQwNgKg_jSBxVjj0qqia8Omn7g@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] hw/arm/xilinx_zynq: Add flash type as machine
 class property
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Introduce ZynqMachineClass with qspi_flash_type field to allow
> different Zynq-based machines to specify their flash device
> type. The base Zynq machine defaults to n25q128.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

> @@ -152,7 +153,11 @@ static inline int zynq_init_spi_flashes(uint32_t bas=
e_addr, qemu_irq irq,
>
>          for (j =3D 0; j < num_ss; ++j) {
>              DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit++);
> -            flash_dev =3D qdev_new("n25q128");
> +
> +            if (!flash_type || !flash_type[0]) {
> +                flash_type =3D "n25q128";
> +            }

This seems a bit unnecessary -- we always pass in
zmc->qspi_flash_type at all the callsites, and that should
never be NULL or an empty string, because we've already done
the "what should the default type be?" handling in
zynq_machine_class_init().

If we do get NULL or an empty string here, that's a QEMU bug
in either this class or its subclasses, which will be fairly
quickly detected when we pass the bogus value to qdev_new().
I would just drop this if().

> +struct ZynqMachineClass {
> +    MachineClass parent_class;
> +    const char *qspi_flash_type;
> +};

Because we've now given this class its own class struct,
we need to add to the zynq_machine_type TypeInfo:

   .class_size =3D sizeof(ZynqMachineClass),

Otherwise the QOM machinery won't allocate enough space for it.

thanks
-- PMM

