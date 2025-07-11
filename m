Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CACCC83F1A
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 12:03:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaCTZ-0001TO-HQ; Fri, 11 Jul 2025 08:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uaCRs-0006Ve-F5
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 08:01:52 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uaCRm-0007SX-Vl
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 08:01:52 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2e95ab2704fso1280136fac.3
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752235304; x=1752840104; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOXFH8R5r6PmAPMFgeOuloxTzLukrLX0Fs3plxk4ffk=;
 b=cHnFy3UUVmNUiE+0PpNqzg3rfghZNXWsBugr2RP7R7d3xsaELVmsTYY9yzSUaqpSTA
 YhyzUN4lDmqKtBnTyCfkrTobQg88+uYipkxIM0LtwhJJ6KmiRXR5yuf3EZpYimZxGGVJ
 lMa4iBObEcCPpHmdRvWTkI3lV5izcf40Q7J7W0b0nnqPd5Evwo7qqtDShOJx7WdW4T9p
 rgyMtgaof7tTD9VpccLFN9FNFhjotQHPAuL/XfxBrrcr2KRfsXUnh+qC5guaZzECS0Bq
 a1ePFdc9tdbxlE8HCuZaNn8o2cU7fbsRqLUkIqdDXCQlaWCyxgP/RJXgkBc21HKL6V9E
 eZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235304; x=1752840104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOXFH8R5r6PmAPMFgeOuloxTzLukrLX0Fs3plxk4ffk=;
 b=ebnjlXcG93S3P60F1e8a6uGZwBogh3gN4jXJ46b8hAH85FA1TJMDFpteZUuygY5TYK
 BkRdNSWT8PQNvo6cpzXtlNyVOzznHOP7xQUUibdeIR+bX73XIRirMKlv3HxKRw/h4/u5
 apD95WgQPL1tr/7GkMcn76luThvZvF9qIahQ7GWEs7lXfjcg/fhT0qINJtPb1IAMrNcd
 HcQuZJHDfydhZtdzr1Wxs8KK/1+xbEOoKqFy27sj6GmYdbWCs/oB66NX2WFYv5xH8wEy
 u4yMEemb/C69oiqEilSLvNabp7L+LKCzA87QNlge4WOFi+KDAQhqQVPA9nL9wbgqsKad
 RyLA==
X-Gm-Message-State: AOJu0Yxnos9CEln9HmdRrmv+4CQtBwB3m/p+GTFAy4PTPfUwjA9+OllB
 ELhgSBzgEbRd9dzbAWGYTEDUG3nw+IXKM78nbW8FDqhrexy6Bk1mzbKanQF2W1JAAAbdfvH2LDP
 7Eu4NQAc95qw9oTjoW/AH80WznIgwy44bsA76uHVz6A==
X-Gm-Gg: ASbGncuYwWLp2rsDiaScORULvLZfoPVJcEtoQYsQDYh4zsf2ZvC+wOcK3GQUsn5j2xJ
 aLu+0CwQEeretptsL5JeozZ2cOo5qJxmQIJTe6avXyKWC6ETUNP7xMWjoJqH/z6SC9ZnoHqKc/b
 HjmvwPoxRj+SaliOcMhh3w7VWyxsIEEK6H/ciaXUpFcPLbyI1ZRIIVKj83E+jcgbiw9xPUrmQ5r
 gCljVEO
X-Google-Smtp-Source: AGHT+IE5qU2yZFX1QfUGAGuaD+l/F5NaHns3TDaYMvyKdHOgDiVqsV4s2G6GoGc7UgoXgsDoJ2Vf06Xun6cG7ICpbkY=
X-Received: by 2002:a05:6870:6b8c:b0:296:b0d8:9025 with SMTP id
 586e51a60fabf-2ff26929eebmr1846965fac.20.1752235304456; Fri, 11 Jul 2025
 05:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250704083723.1410455-1-clg@redhat.com>
 <20250704083723.1410455-10-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-10-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jul 2025 13:01:32 +0100
X-Gm-Features: Ac12FXyCvtlUz3k6iOexX9mZzdoccOo0JKRc5ZhQKr8zYPOroWONcEv7cN15PLY
Message-ID: <CAFEAcA9-wpDS2_4paQgswqB=NfgxadvGB8WULWGqQXV7d47-Mg@mail.gmail.com>
Subject: Re: [PULL 09/11] docs: add support for gb200-bmc
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ed Tanous <etanous@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-oa1-x2b.google.com
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

On Fri, 4 Jul 2025 at 09:39, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> From: Ed Tanous <etanous@nvidia.com>
>
> This patch updates the docs for support of gb200-bmc.
>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
> Link: https://lore.kernel.org/qemu-devel/20250703144249.3348879-3-etanous=
@nvidia.com
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  docs/system/arm/aspeed.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 43d27d83cb54..bec0a1dfa8b8 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -1,5 +1,4 @@
> -Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``,=
 ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-=
bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``q=
uanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``s=
upermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``withersp=
oon-bmc``, ``yosemitev2-bmc``)
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``,=
 ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``fp5280=
g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-f=
irework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``son=
orapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass=
-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)

Hi. This change removed the "=3D=3D=3D=3D=3D=3D" underlining from the title=
, which
has broken the rendering not just of this page but also of the list of
arm boards in the parent doc:
 https://www.qemu.org/docs/master/system/target-arm.html
as it now has all of aspeed.rst's second-level headers in it.

Could you send a patch to reinstate the underlines, please?

thanks
-- PMM

