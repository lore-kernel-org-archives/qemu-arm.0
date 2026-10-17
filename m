Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A126CCF2C1
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:39:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3h4-0006iU-2y; Sat, 17 Oct 2026 08:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3gx-0006i1-Gc
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:39:16 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3gv-0003sX-Kh
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:39:14 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8871ada1a26so4576907b3.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240752; cv=none;
 d=google.com; s=arc-20260327;
 b=GdM91slEJ280YSbVDdiR3kqS+4B36jwTtsjl9wzvhVIHC1mlW6m/MqyBw600VV9FvS
 HHKYQoU7Im1VPQb1AiTMDSUsM5M2mL4talonId95flgmTW9AKwMGCaDk8LJpS5vyzk6N
 m9pdPPZATpwPVuQJRDjC8YJURysELW0Ae1aP1DyAsNicGi0+ErO47DtwRxhVIsiLIZ2Z
 dSLq3jidMmDu3JYqknJ5iAVu1ShPrfls8Xj8t1uczj4s10lbbR8/jr9jpeyUnRa4oE+I
 PsmsOmXm1s85Bez4DGlFhysZ4LAc5H6tfzqDJuuG3UJxB1Z3YBSjCUb50192Fzs/Kx+S
 30Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fkIRji0WXt92EPvWP8XtmleqjeC013dlE5jwP2dXmLo=;
 fh=ekTx2kuSOmAcB+SAMtnrx/Wt87hQ4NoL8dCgv0uMqlo=;
 b=iFTvADxbuluoq+6hiQ/OBTan17m/rSHu1tRwZ6oHz1v0umDtuEKKUnNFulUB7SYsyG
 fxZ+JpUZPkXyn6I2whk7sg2LwVWFK0gkVCOICQFbxIr5GWMPZ8cyAaDzul1cWJ6eaVKS
 6c7lsFqwTJ4I3K5QeLsi29XTTMLVei/sy4TArsVukZ5LzQc1nYpNbfdiemCRd2RPfSwm
 /7KJakSVM/WRUbTPhT0msk0nEkth7lW/5x94HOV9beIn6QLH0MG7RDRH8fKHl/1ZJiP4
 gFJAPRUguERlrTYbWF/Jgkx68HuLkU+y5S7vbSSym9LfkshPnpmeCqEQ5w4P+yIWwjWJ
 EPqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240752; x=1792845552; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fkIRji0WXt92EPvWP8XtmleqjeC013dlE5jwP2dXmLo=;
 b=GGy1/KcMQPE5c1PdCojZmBfRNXbF0yYSo+Pj5PQUYos1R2FQmtkQ4uRwtCU3D8P29F
 fYZNyEK1ZGLfyOFuiHSI6g+WpYVU9yyEA1VlTYItm0CiQSoBtVixTwDmpz+gDAGYJ1F9
 vm3IPMr4SIJIgx5+4wuqm/7F0cvL7M+d4QtciqebelmnfzQZ6LPDSax1yllRYaGyOTz1
 G6d2XF8ThK6kGvLmdiWyWaRBbqr8jbvsAnH3FjDPtjYkl5a/XDo6dH9FPnYUh4fpYkIf
 GBgftiblaeuH1ZW0AxgzAIcEkq9Hw1CNzm8TT+asGUne470GWKvZa2kyV+PukJTLvNS2
 gfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240752; x=1792845552;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fkIRji0WXt92EPvWP8XtmleqjeC013dlE5jwP2dXmLo=;
 b=BlQom4xM2lN7KIYXr976qq3xkqNmMtYwf170036S0SyrdkYWJtszh4ZtHzQa5hpk0y
 2qA5DABbdg/y71In9M5uWZvbAsya8i3N6VGK4rvRD4GHWDiwro+FvWiRPUh6bmK6JZbs
 DTPetpF3TdyIOEQzZKojocvBEi+Q5QK9n3kLOCngEIWN5epCmm2VfkHwsUapmjynMhKw
 K29q+UXUUq+1/eEpxnQbIzhTS4OSl12Gba0rU1o2ckpRDIhUJ1faVJ5wWlLbKXHn1YNg
 p5Iz739U8Lf8co8T3OQyydSCINIH9sy7oXg3twBlUpgG87OcRC4xcpQFLDJMlxhk275B
 CuiA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxvPAh8XxtY6yROurS/Eky5INdWNW1+phP8mfdeZO53lcaCabelA7h9YW13ANDmt4J2q4x6lzYLnw==@nongnu.org
X-Gm-Message-State: AFq9FYJjAVn0SpkqYgp8UMj0gUat+xCQOhoH/egdOnZuiz9e8LnflULR
 lSxcdF5zDV4te/uHJMqKeh1CFToI5Xgauia7z6C9M4CglxyM8n2VyxywzWXsilH4S4c1DP2AMNV
 bjgoqcPCohh40pcg5Dq68f4P9Bop97S4Y9da3l2HiwQ==
X-Gm-Gg: AYBFou3m96m6zJsYu/cAFWk8pqfIn+1iAfoUOh50ijLJTCE6rsEiL9iu64lj69AGwbv
 0jTrjMh7HD5L7tStdQjbyymDV+aUKlnUkaLRakJLh0lTFebpk5H//GC/uYXpURjM4UoE1/Uu+uv
 3r68Np06dFyaDJEAUGdISYkxub5bYlrSdNiIggOpxk4KDsdcnGIMVCoeMnZInYMja8WUsUUtdeX
 Ej6RzgQGFFNhRRSLoxTg+YjnGDVkmOK1iwAkOswlwqR0r+emOf9B2iW518y+Zg2m78zNYcup74v
 /o9mwt8mwYAxUKJ8WO3TR5EH4g/Z8NN1wjfb4vl4Rhc92XL02c9zPbtE+W1jc2qcxI55brGhRzi
 Ra4GmVDKtOCcXLie04yGPKhd2r4c2qnVgEmUQiRs=
X-Received: by 2002:a05:690c:294:b0:8b0:cc70:f54b with SMTP id
 00721157ae682-8b0f21df262mr9713597b3.83.1792240751835; Sat, 17 Oct 2026
 05:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-12-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-12-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:39:00 +0100
X-Gm-Features: AclHuK98Sr1n_yS3ZKvEpagjnMVUWjfsxfrHJXJ_0FRxHCqx9UzvJccZWfozVgE
Message-ID: <CAFEAcA99AobP34UsChN82U9Yh6oazdV9vL8s6Fi2Wm3PkL+NXA@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] hw/net/bcm2838_genet: implement GENET MDIO
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Implement the MDIO command register handling used to read/write the
> BCM54213PE PHY's standard MII registers (BMCR, BMSR, LPA, ...) plus
> its vendor "shadow" register blocks reached through the AUX_CTL/
> EXP_SHD indirection scheme, and a simple link-state model (PHY
> starts down, comes up once BMCR is programmed and autonegotiation
> is (re)started).
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> While carrying this forward, fix the autonegotiation-restart handling
> in bcm2838_genet_mdio_cmd(): the guest PHY driver sets BMCR.ANRESTART
> and polls BMCR until it reads back as cleared, but the result of
> FIELD_DP16() (which returns a new value rather than modifying its
> argument) was discarded, so the bit never cleared and the guest
> spun forever at boot. Also refresh the link state once the restart
> has been handled.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

This doesn't compile at this point in the patchseries, because
this function:

> +static void bcm2838_genet_phy_update_link(BCM2838GenetState *s);

is prototyped and called, but never defined:

../../hw/net/bcm2838_genet.c:23:13: error:
=E2=80=98bcm2838_genet_phy_update_link=E2=80=99 used but never defined [-We=
rror]
   23 | static void bcm2838_genet_phy_update_link(BCM2838GenetState *s);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

The patchset has to be able to compile at all points, to
avoid breaking future 'git bisect' operations. Moving the
callsite and the prototype from here to the "RX path" patch
that adds the function is probably the simplest fix.

thanks
-- PMM

