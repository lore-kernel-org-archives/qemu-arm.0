Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC8CCC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHL4j-0005LR-Ep; Thu, 15 Oct 2026 09:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL4U-00057y-Ty
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:00:44 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL4R-0002WL-2G
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:00:33 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8ac4806e210so37368697b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 06:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792069228; cv=none;
 d=google.com; s=arc-20260327;
 b=GA7npHeVA+aEf0cTRwORYw3CtrdeMb5TKDWU/N0TTN+YGaP4LqgGElJxgOFdr6XcdB
 87jTtqUBYIgfSuDh6sWKZ97HOwF7trHv0jV/1FniWgaNmT302Fw3uP6fDY72/NGVMD+W
 oOofAnufZciaI7Fv8c8lZxceIAXsCRwrAf41y4fRRqKMOXDLWUyGchvxzZvLICnKAJ8g
 oJzSpEG1DHe4qwWhd1diFWfgCBApr2fppbIlD3HbVomdrLLqlAcdscFSchNWezgerx0j
 yiQE5SCHPNpfREiCoBpIffwquQLTTMKTyY/qcCMdMj0HGC+QlSeqn73sKKFfpWmvwNzP
 5Hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bn/3MWZ6+pzWmy5HApT88TUDX3P4dHWElt2hPV96Ees=;
 fh=wzrsyjrBTEV6/Ltzsic8kjt7wGSZNsacVMxYCy0i4CM=;
 b=RwilUo/09XPckpG/MAbw4JAYiWcPSLL2er/M/JqmcyZL9fC07AKYO4U9Flie9cOciF
 0s5gYxhzHhl4bwKkGUb/2+ws7jJvsgNR0G8qMy/EmXqj+WmiwOE49I8CR47qM3Igo9nl
 OE+xVS6ld6TKR42TZiYNufhP3q4Wph6qzvvpONEq9HnxYDJrJY3XWlwtiPaJE3eqoyBW
 9DIxDQY5Cawhy97VsHlH+BicUI5Uulrz2MRUtmc7/DDfmwlw3KBC96PXGrEzHA+ZGpYl
 8kEJp2Njj+vGtg63/ZBtIuQpFruAJr5Exgwo7miMaM2wpUtDKP4RU2PuJ0gN4Jvje94p
 xiZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792069228; x=1792674028; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bn/3MWZ6+pzWmy5HApT88TUDX3P4dHWElt2hPV96Ees=;
 b=yJm0kXxVOxBieC+GEMYRFL++c387u5K3PLd9D0Z7WKW0W/a5zG0F9R5OoY3rpIP2iC
 8UlyAHUePlN7YnUJtUxhcPynLSYouJacXFgtHzs/s+Bs2DxdR2TCSiAObjb1277t/EGO
 /fnx4p70dGYz1b1OSWTFm5n7YtsQ6d8yiO7/QP8a7CJXzCYbtcKWlXqrPcR0yM87NT0D
 S7qlMHKELG6pGi5Tp6M9LihE+sJYIuOxGbRYXMDJ8g0uXd3Lo+DOAUk4Gynal4M4guQ7
 8scHvHHmWoBNfmmlprXVJk31CqAO5Yk6ylotHwwEbQTUxo+9dS8QVDlzfWC8ENQbQwnW
 2kjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792069228; x=1792674028;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bn/3MWZ6+pzWmy5HApT88TUDX3P4dHWElt2hPV96Ees=;
 b=jpjYM4rRNm96x0ZIqRPettkXXNRM1USu/0ReZDRPSJBoc2k6+lcqR/E9P6tOY8GqND
 RvZLVyWBGpkdtR6Jr0G9U0KSmsAWE+MhJLKrovGjGHbBoEUyMCsnZXLW0YZGoXAssdiH
 8KscXDyVPRsSDMpHImb5eBrm1IF34EDlOG2sxJcOZji9X+8oeLNiwb1ugqkerTHEeFIm
 ORI26yHVZbJiSF7BXlwe9EQyerYSTLjQWyDEbWmmprL3FuLoQ8Dy0eInP1c3UqtPPtTG
 xOlMj57Kz319yu5bfYGQhXdHdCGaIrrfB2CovdTv4n+/8LgHpjwofJwv32f6SvyNuoqq
 VZxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWl23eQHX5qYttwAk65Qtm8GqsDkd+IM0N3uVG3Aqf4GtB3QErqo8A1EKHES9kJLNn5JQ3AEYaeg==@nongnu.org
X-Gm-Message-State: AFq9FYJBG6bctsVQz5/myH4hgtzL6QrkTJFI5W4v1/IX/wXmjZOmPhea
 g388f9xOvSKy8vtLLLXySEcMUv0HBZZ3O8gIXkxzOdWtvQqzBIkSdAobfoXafRbgvvKeEVec8wI
 kesthAkyGXOF+jpmyBA/kzCCe4y+LuBfx+5jGZfcegw==
X-Gm-Gg: AYBFou0lMyO19Lg8OGHSRCs2gQco6xRuiXO0v+wxOqRmZ+qPHjyhkiqDI2Z9oabDuI5
 9tVYpvRJkGFr3E5GqKp4kEyNyYaCYvWON2SuJygUN48JNhdudcSCfaUWCj8CVZJ2YlKONNUiaon
 aKqEPznJgbRH8vzstqt8CQvXN1vdXKHvMzeDFD+iNM+jReKvw4o3VDAzqdkKofvZERIxdvOKa2/
 bRYaFaqoOKisx8zZLnArXNzRY+p9vQzwihUEV+nBh7Pdrpp+eITL7daODgF/bEk2lRrMHh92so3
 wBPhDxD5u4giUra//OJ5MTKhmyU727mPU8g9+rBiwN4sW7+sYD4uAC/ZYE3AbKKvO5x56HKMoSJ
 mi+l8lWQaCajyIubLqm9C2kRzjm9uV+kuDVQTdx0=
X-Received: by 2002:a05:690c:f04:b0:8b0:aba3:a3d1 with SMTP id
 00721157ae682-8b0aba3ab78mr44146037b3.54.1792069228245; Thu, 15 Oct 2026
 06:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
 <20260725012635.4925-5-marcelomanzo@gmail.com>
In-Reply-To: <20260725012635.4925-5-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 14:00:16 +0100
X-Gm-Features: AclHuK-Gv1nvvdERFlt0jDjABa3TPDTn7ppCfJRs3QZBT8d8G5bYw3ohfxm0faw
Message-ID: <CAFEAcA9SYNyjUnvf2S_8E82Jm+uOX2nLC=iYHktZHeqic2f+tQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/arm/bcm2838: enable BCM2838 thermal sensor
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sat, 25 Jul 2026 at 02:26, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Wire the BCM2838 thermal sensor (added in the previous patch) into
> the SoC: instantiate it in the peripherals block and map its
> register region at the real BCM2711 physical address.
>
> This is also the last device masked out of the raspi4b DTB, so drop
> the "brcm,bcm2711-thermal" node-removal entry -- and with it the
> whole nodes_to_remove[] mechanism in raspi4_modify_dtb(), which is
> now empty (GENET, PCIe, RNG200, and this thermal sensor were the
> only four devices it ever masked, and all four are now implemented).
>
> Adapted from patch 17/41 of Sergey Kambalin's Raspberry Pi 4B series
> (patchwork series 829638) against current QEMU master.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

