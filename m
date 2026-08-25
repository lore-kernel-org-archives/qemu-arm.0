Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C165AC5DF9C
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 06:24:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wykZm-0005oB-FM; Tue, 25 Aug 2026 02:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wykZj-0005nH-Du
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 02:24:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wykZh-0007Od-5G
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 02:23:58 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-395cf2535acso573238a91.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 23:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787639035; x=1788243835; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hjroD+dikGlpnVEI/GXyzccjDkDqMKQQY3NUKga7WrY=;
 b=dAgx3lwJhMGaUIfgCQdhWA7KkzFUgAU6wHTJF+nK7SbWdJabXi2k69jdNHQhSqkOFg
 Ov3SkppvjcQaQzaO4oihm+1kEH3n65l0/IGIzS23Y6NeFMezrVvTIvwWmMgqCF+y/Vr6
 6rEqE5UR6D9lr2EbS27ck5xPCGaAjTI3pU4a9g/lqpfegr9uTiclIZnpETXKXzPi4zra
 xdhJleSHrnqF4yyDoFjGDILw2TYrBwWtfKAJtetw4ZSSVw1POC3c6VmSE6+LbfFJztbk
 0HPyis6zfcTWr+7G+lYOgaRA0KR1VAReYpLNPNHNFgPQsGY0NZDJfU5sa4QmFlBh5p36
 ZGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787639035; x=1788243835;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hjroD+dikGlpnVEI/GXyzccjDkDqMKQQY3NUKga7WrY=;
 b=XbbxKpLmakooGsAiSpaNu2NsvMjfkM46dXzbIX31DLpIKWMuC5BiaREHrltTBmwj37
 Ib6gRb1b0+L+472E9b5goo9wFUadN3kgaW0W+hZJJlx96HDeYe96WpB3/I+4KkudDCLu
 wQzbd1b9r1ODGPx8Pf90KFEXruvPVkrVFtpJW6TKBh/tx9VKRSH0Thtc1vodCDqQv4DF
 NhdjwRPcr+XhmoNMZTuaD7IqkaVrvOK1SD/o2hoJPME2YxPriwiH41mFMU3I5nI+08aV
 CDlQ30ba5UkOL097tyCd4z93jE6n6KoXFr82NVCfN1fNoFb2x4y/NOgOXEBngoWgMbj1
 Iy1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpXxZbtPP9qYYL+QnKW+8ddNQJYC9o8gqD1L4f3wiq2zABMIDyL6eMIbwUIHonG5G+cwfiATu11Zg==@nongnu.org
X-Gm-Message-State: AFuF++lX/x8WXb72kn2B6esr/l0A612hzSSXrriTzrIxBZlbf9neurZi
 im5oR7odoHjNf5j3/l/qBeP7ZpOP2Eo8cQaHgBzp7AdS+dY43/NArvYO
X-Gm-Gg: AR+sD13z0pasNORIHi7+3rQh0+y6CRZ1FY8apFMrhGwEGMsLfXMH9YWwHFOgxO6IGrX
 WsRgca8n2swfoLEDvSUtRL4fkszgPSi6nC51iyIEEejzgYMlj9TVSe8A5gW9UYKZ9K+pYJcdDaK
 /BLGG1Cy+yHF3YOzbfCSleOdPBNIT7eS3jihM6AAXZ5LXG+uoJqkqVHBpuyWQuPbxA/GQoAPPvu
 O9ICNMT7Vfzg6gF1C/1/LOuo27lfNQ1S9r0yHXZROqFVUgQAjHnXCGJnh4zPGXZofyIFWmIPr+w
 msJKqVpM9X/WPWsLm1rYb/tMjHgBZApgRETqW04cXZmzQHFZIbglvDPpeFF8FKsFJpQFGI3qZqu
 XFSVw0pW9WmQK6S9gXMpEl7e5gy6ETZdk38U6m58lSUNZqbRh0+Euk4p3kXv+/+QlTq/zQuBzGR
 pPGO4IyRor4zkIzm7xx1+xC+GvSx0dRUSULeAdddMt4NbyaueI8Lsmjk3yco0mV84bY2Ph
X-Received: by 2002:a17:90a:d88e:b0:38e:9ca8:e99 with SMTP id
 98e67ed59e1d1-39645aaa842mr4708297a91.5.1787639035371; 
 Mon, 24 Aug 2026 23:23:55 -0700 (PDT)
Received: from smtpclient.apple ([117.55.237.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39645d989cesm2466402a91.16.2026.08.24.23.23.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2026 23:23:54 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 2/5] hw/arm: Rename ax3000-boards as axiado-boards
From: Jack Wang <163wangjack@gmail.com>
In-Reply-To: <20260825021155.2475879-3-kchiu@axiado.com>
Date: Tue, 25 Aug 2026 14:23:38 +0800
Cc: qemu-devel@nongnu.org,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D58CC33-E235-47A7-A9E9-5345CB67ED61@gmail.com>
References: <20260825021155.2475879-3-kchiu@axiado.com>
To: kchiu@axiado.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


> On Mon, 24 Aug 2026 19:11:52 -0700, Kuan-Jui Chiu <kchiu@axiado.com> =
wrote:
> Rename header file ax3000-boards.h as axiado-boards.h for sharing =
across
> different Axiado SoC series
>=20
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> ---
> hw/arm/ax3000-boards.c                              | 2 +-
> hw/arm/ax3000-evk.c                                 | 2 +-
> include/hw/arm/{ax3000-boards.h =3D> axiado-boards.h} | 0
> 3 files changed, 2 insertions(+), 2 deletions(-)
> rename include/hw/arm/{ax3000-boards.h =3D> axiado-boards.h} (100%)
>=20
> diff --git a/hw/arm/ax3000-boards.c b/hw/arm/ax3000-boards.c
> index 4b8deec15c..1b645b7f43 100644
> --- a/hw/arm/ax3000-boards.c
> +++ b/hw/arm/ax3000-boards.c
> @@ -7,7 +7,7 @@
>  */
>=20
> #include "qemu/osdep.h"
> -#include "hw/arm/ax3000-boards.h"
> +#include "hw/arm/axiado-boards.h"
> #include "hw/arm/boot.h"
> #include "hw/arm/machines-qom.h"
> #include "qemu/error-report.h"
> diff --git a/hw/arm/ax3000-evk.c b/hw/arm/ax3000-evk.c
> index a170848871..f491de7521 100644
> --- a/hw/arm/ax3000-evk.c
> +++ b/hw/arm/ax3000-evk.c
> @@ -7,7 +7,7 @@
>  */
>=20
> #include "qemu/osdep.h"
> -#include "hw/arm/ax3000-boards.h"
> +#include "hw/arm/axiado-boards.h"
>=20
> static void axiado_scm3003_class_init(ObjectClass *oc, const void =
*data)
> {
> diff --git a/include/hw/arm/ax3000-boards.h =
b/include/hw/arm/axiado-boards.h
> similarity index 100%
> rename from include/hw/arm/ax3000-boards.h
> rename to include/hw/arm/axiado-boards.h
> --=20
> 2.34.1
>=20
>=20
>=20
>=20
LGTM, and previous problem I pointed in v2 is fixed
Reviewed-by: Jack Wang <163wangjack@gmail.com>

