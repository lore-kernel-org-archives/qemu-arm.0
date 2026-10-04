Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC822CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:19:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOvi-0003QR-RI; Sun, 04 Oct 2026 12:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOvh-0003Q1-CY
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:19:13 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOvf-0001OS-WD
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:19:13 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 00721157ae682-8aef5f85003so2875447b3.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130751; cv=none;
 d=google.com; s=arc-20260327;
 b=clenaTolPc4wsO5y4Sih1JpJsDtr5V+AAd88bDIBLnAiAHvKAPV7Pd9xXvQTsZzsfR
 zOzCco5wlBC9EHsJedMy8MoUYD67CsAeHqQ8oOxZ1Rkb51TNKwN+xSfjBYS0GjSf3YPK
 C/Jgz41zP3NqpBL9+BV2QhUwq2+aDyfOlN2JsNa2IwiGVXvgr6SIgCPkRIQbBwRGqvnC
 0SSQDCdNGl/3u983Iz8YOZo165RshkbuL/TUezahjFN2a5sPCZWq5kGF7hlRe4DWuxw3
 ofJDK/AGjQ6sfH5cz/rCTcuoBfVGCwscds9EYdtCb4dIY6itilgH0Cu1QEbbUi79BRWM
 XnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nVyMLZGNdLhI1P8JwCR4uPXvAjjlF5nWABPKxGFTaBE=;
 fh=dZOtkov/AWmbg+insdrcWGFrQCVmn/n9i0rVwDUEIhE=;
 b=NzQ79DYzG+RLb9niz40fmJjFI9Dxmk7bUzBkOahbJd9zlIOsgAPEBZTJHFZfCQ1lYh
 XTJUVdYvU+IoVoc5PlK+fu0RqIPTwTV7OmBtT++RLjrKTzqp4FOQScZh0ZYEH1OiZ4uD
 asRoS/+XNvG0cZ/2DoD9rbbdDRoEUIPdCKNVxMhaejHizmsQAF9eTL/w7BFsw7/bFlVf
 E4xyXbF41ljxqkBrhMqmXHP7NT6DeHy0LzT8frvlk0ic6Uo14gKQNBUwD/FKkYQl/VSG
 f+LyQDhVFDntGpqJzlSbR7NIy1jTsFUSOU6ahSjWU1pBh8CUvRDC3HcgLNFKhiCLAdmm
 0amA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130751; x=1791735551; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nVyMLZGNdLhI1P8JwCR4uPXvAjjlF5nWABPKxGFTaBE=;
 b=CUYOdWC09zfGxWfsEfRiu4UuKUjZGRd/xt3R6mtrMEOmDtCLH/ZglffIZua3Wxpck6
 uRsP3SUKJveE829Foks8K/DBvN2OJVZruh/X0DdFwgm9qQ2x9rJmvWWT7Kb3s3TPew1n
 r8OBIJgd2EciLaaO7TVygiHwG8u245tfpGvOaAzHvmZsmaBhePwtc5ObDsVlLEjYQOcy
 ATK+4RYZa6wsuiX1W9CpI57haJS6nbFklGHRhg7Dh/xEvP1i37uMTY2+BrSWK3wumooG
 Ina37l1lqWiX+8WrnDokkalpoX4o3uSDw61YogAmzJwMsZnxpCUY7in4P2y+m0gp1afM
 nJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130751; x=1791735551;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nVyMLZGNdLhI1P8JwCR4uPXvAjjlF5nWABPKxGFTaBE=;
 b=0oT93ARbYozpeiZPh2kiBawPXKnJr+H1hN1s+MIh1bOcjQRSdQQVll4lUyZ+koRHnE
 GcYHSypJSiZFMCw/VYlnA7ilmyqXeK+r2NcYq3u80wiO8M1HGmlJjKlgBxINO8UWDTB+
 Zdz3fmo3gRhk0k/v6vjgUSM2lvLNaxinQbqfTW4Ix2NRJxU7W9triR9GNurnxL2f1XpA
 Di5vMek3NaW3qhCWFlvqZNHikZsnfWd8yspQFdglwxii9Gd4HW9My+LlkJIWh3cfHlF6
 TesZE+x6C6QDfaXRxIYAYuvACHEWZuQY6d0e9kHQCfu+f6542Q5pD5VeJcPhLkvV8V5E
 L+5A==
X-Forwarded-Encrypted: i=1;
 AKwUvByXTdwRaNvRjothqIUIkw4ImGn4OCHwOdlMMA0aGdH1JvdJ+o+7fjEr6RtDnW/USgjRDSJnyEXr3A==@nongnu.org
X-Gm-Message-State: AFq9FYLOq+HnQ/Ih9watSVhz+JlYlRi8DCj+KqSQKM1ZaIpYhGPk16Qy
 wcs7BjwqBN6oB/RA5EMlLUwrNid+3aL5G1RHZqAOEOdGRnSyZ/TWSHbbBFpdsWfShGD0ljr37hj
 Hy0yvc5fJDzMj0DWxGRJFHp2D6EN65dg=
X-Gm-Gg: AYBFou1mcUVjIS/rJzuh7iHAMbnAKrSxQae0ESxw6T5V7QHtmltpUWSMBi5RqLyH11S
 LtUNBFNP6dTmOotP3MuxEerKywPcc/LAoaBxOvLmcBk4Qomzq0uV6opO10F9O5U2iMSqxhieJ4F
 eE6GRziHwIZ9ObIfYUCtW0dSYDBhbhOJqR0Yy10gDyMGZURQ07l7h3l+H6apSQS0kBs70fwTjpH
 JFS1Y4QibkAgEkuS97pClbjFJmw7alA1Cf+F6yhP9rgcMoVTCJ/N53GdBQdsOHFB3CTiFRw0btO
 ijUL+QPCQMxDotSjptYFtX8HjlAGFx2keovrPjL/ceDOPkJY1AX/SzGjVe8E5VxfnoCp4sN6V4F
 CdcJbvV3KztCp50SI
X-Received: by 2002:a05:690c:3481:b0:8af:1843:a9e5 with SMTP id
 00721157ae682-8af1843bbb9mr6462307b3.23.1791130750729; Sun, 04 Oct 2026
 09:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-17-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-17-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:18:57 +0800
X-Gm-Features: AclHuK8af1MPViklR1Kdl2_E6gteyKVfv0DqECsuNaIziOq-35RO9Gwi_qRtcB0
Message-ID: <CAEUhbmWYkkWYkfSik_Q2XcW8CB+j+6k_ecqKZ5unac2juVWd3g@mail.gmail.com>
Subject: Re: [PATCH v2 16/30] hw/misc/Kconfig: Remove redundant
 USB_EHCI_SYSBUS from config IMX
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sun, Oct 4, 2026 at 8:33=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Since commit 464ce71a963b "Kconfig: Extract CONFIG_USB_CHIPIDEA from
> CONFIG_IMX" all relevant i.MX SoC models select USB_CHIPIDEA such
> that selecting USB_EHCI_SYSBUS became redundant in CONFIG_IMX. Remove
> it.
>
> Fixes: 464ce71a963b ("Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IM=
X")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/misc/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

