Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA4BCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:16:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtKW-0004h2-Cq; Fri, 15 May 2026 10:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtKR-0004fZ-UB
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:15:52 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtKQ-0005SF-7y
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:15:51 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so51341425e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854549; cv=none;
 d=google.com; s=arc-20240605;
 b=Aazza+qJemHvkkjlvLkY3TAEYXB8BxUXCA4k+2g/etzIoV4JroQuAj0CExWHrfKwnw
 n0uXWRvcvrmRvdAJhdF7w0H8wj74rre50ZAAAHCMzpEg//zC1GDxwGShQR74zQnASUCS
 6FYVI5UAVL7Wc50cy6V3/9NNXWGF5Y2u7978Lz0nNBpIZuTXEHAVeQeEcljs8L/NDSra
 finXkBq8vJcvwzvpqgl/lgHcFJGU6uqyjwueW7KC2kBYItIVpchsytjA0wWDel0UUZDr
 D4gKahE/4hDpULa29hBbq/CZ2944xaXdIJi6cnr6Bsxqo1LyrtqEvTzt4ozntFX676ak
 qnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1d9w2+FoGd+jgDsmSJm8V0KL/IwlX9fOqPjHhF1Gaq8=;
 fh=LYoSReHF6uBLnaqWAiybS9Z+uyPkeGphNoFBbfdBWj4=;
 b=Jab8189tzKxHR7Up5hZNcbzvdRRubodnGl8RAupq3qiXBSuh+bUPRWWsFcKOi2Q4NB
 a+e8OOZf+dZB1DKdW8p1wqtJ5aEjG8cTjnzqM0FRNIgGNm5GyqawbCRCG9uo90DrOgKT
 NSMX9bpt3xzSXtz7rm45O0YxsUcdXqH197yxMvvyRlUet/WaPMjC2BKhqdiL9nEN9Pt1
 kEqHf4DgCwQd/0ZykGU+AbVfmalXIBuUBvw8lf7OvTS4xugp4IjagD5o9M5T8EzLVmvs
 9+RF54Irrakbtg9jlTgR7sQh+dXlRZLGgvZAXws+a+0YsUV27QazIVlvgJeILhZlqkvU
 U4Yw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854549; x=1779459349; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1d9w2+FoGd+jgDsmSJm8V0KL/IwlX9fOqPjHhF1Gaq8=;
 b=zei09q3nlQ/DeVFzuVbaUbAMTL3qfzFLd1zncEx6iEHJOssY0pxOkrCZ7r6VPqYtEK
 idFivpuQpdjb2HD8O3tQL8a8Ct80y3M7NPRiqi/SlQj2gHVq0xobrd7zCZlBGPmQdsac
 aBf1DQQPjuTc9kRO+lKPlx9s6uXmd9GE2k2zQT5EP2kADbUHZeF+BPOcsKqjTAMJQAeI
 FsJHOllJpSG9721OnIlopgNEH+YWnL3D0aVc3WjIQvsCdAjylHEHcIN/4Xoz+CKwMunM
 g+GzLLUlnZ5rwYzWllrjqobMKpCU9wdr9Y4h1czloydd+/cICw2+XYMdKf9cFc47m5ME
 g4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854549; x=1779459349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1d9w2+FoGd+jgDsmSJm8V0KL/IwlX9fOqPjHhF1Gaq8=;
 b=VAe95IniU/DCjaexhcGYqCgHMNjYpEld5aLc69So8lkOFo1ZRn83VtJBRuiOFnW9wC
 O1UOs3Z7uEPU2O0pOD5iIbbLBgVSkSpvwq8K7eCVmo7mnOMJNQbungwACwMMjNmD3ukb
 5+Vbg+vR0Mmmdwayv26OM1AfZk04yOHb+LEE8SwsyuNgUpg/KhKT5DnvGnzpXLHzsNHG
 5BzHoZowSToS7knDQLU/u+npsWzy6gVCtQdgOTdgJC4GTGIXs/yBe1Fa3Pr0KxWT+t52
 1yMfhD75YSeV33D5fwTVnzJkKF3XkFk9ItiI97YxENVnhEA58OHbAlbBNE9+k8Sd3Heu
 3z3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ivKA0rytgznqR4YNHv6nBMJJ2YpeDGJ/MzSfe6QarNm7gaQggvYQGlcUOJyNwr/tn6ulNVB6MyA==@nongnu.org
X-Gm-Message-State: AOJu0YxRvdCZC1XCmgT3OzGb/dWPqCiwoAX4uVcmPLyN3DFQ8Hg89cDR
 ZbofhYCqCjRLSecOZEK3T2zcQAKXTfAm8ZA2I5Ivn+NzX/6qMvY1jxLY3BU0qnkCh1J+MN4pLUa
 qA22FRCdMbiVEGkUEbl85XS/XSaBUMkGtSoEtKXdCig==
X-Gm-Gg: Acq92OGW8Ebw11MXC5mglHCG4B7X5GaD8HQvc367BhxJaMVaaT9R281NJKGEIhi7JHo
 ZPJJd35S+s64aBv/hxSfSlteUZKGG19UdbJUFLDcVTtUfoUhJ04chzPtY5YaPTWmc0Pf44i4yOq
 vwmrrt1GceXCD3zeG+oPmSB+2uqLGaARy7Nry75VWbDU1Gou3sqM7cvTugq3B3NgU5vUIyimyCw
 z7ZSgDCruTckbjKY+uPbiALFMJEqfaaCWc2ajFbi8I22UfSnu5/rPrzxbjq2DdJb7GrgB/IC67t
 D+PNCWi2HCuNj9g5smLIromexxuwPYHD2JsE6HLGNApBKEoG/Q==
X-Received: by 2002:a05:600c:354d:b0:48f:e230:72f9 with SMTP id
 5b1f17b1804b1-48fe662a15cmr52279165e9.30.1778854548663; Fri, 15 May 2026
 07:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-3-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-3-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:15:22 +0300
X-Gm-Features: AVHnY4KxUoiTXLy6v457wFnHOe1l4XGFsG5OkaTn0uvdLNPjkFS8n_GtdCZRcQE
Message-ID: <CAAjaMXaaFZmYys0Kw6p3Bfb-qzWD4Jy-+Q7igpqJPNPKtbkkmA@mail.gmail.com>
Subject: Re: [PATCH v6 02/20] hw/arm/raspi: Initialize 64-bit CPU types during
 DeviceRealize()
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
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
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

On Fri, May 15, 2026 at 5:10=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> bcm2836.c models 3 similar SoC: BCM2835, BCM2836 and BCM2837.
> The BCM2837 is a 64-bit only SoC (Cortex-A53), only available
> in the 64-bit binary.
>
> If we build this file as common object, all BCM SoCs become
> available in both 32 and 64-bit binaries; however when running
> the introspection test on the 32-bit binary, the BCM2837 init()
> method tries to init the Cortex-A53 type -- although not
> realizing it -- which is not available. This can be avoided by
> deferring the CPU type initialization to the SoC DeviceRealize
> step (this is safe because nothing uses the CPU type before,
> only the GIC access them, just after their realization).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/arm/bcm2836.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index ee2f44debd1..03825e69d06 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,12 +25,7 @@ static void bcm283x_base_init(Object *obj)
>  {
>      BCM283XBaseState *s =3D BCM283X_BASE(obj);
>      BCM283XBaseClass *bc =3D BCM283X_BASE_GET_CLASS(obj);
> -    int n;
>
> -    for (n =3D 0; n < bc->core_count; n++) {
> -        object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
> -                                bc->cpu_type);
> -    }
>      if (bc->core_count > 1) {
>          qdev_property_add_static(DEVICE(obj), &bcm2836_enabled_cores_pro=
perty);
>          qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count=
);
> @@ -65,6 +60,11 @@ bool bcm283x_common_realize(DeviceState *dev, BCMSocPe=
ripheralBaseState *ps,
>      BCM283XBaseClass *bc =3D BCM283X_BASE_GET_CLASS(dev);
>      Object *obj;
>
> +    for (int n =3D 0; n < bc->core_count; n++) {
> +        object_initialize_child(OBJECT(dev), "cpu[*]", &s->cpu[n].core,
> +                                bc->cpu_type);
> +    }
> +
>      /* common peripherals from bcm2835 */
>
>      obj =3D object_property_get_link(OBJECT(dev), "ram", &error_abort);
> --
> 2.53.0
>

