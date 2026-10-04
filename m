Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16466CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:17:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDOtJ-0001iw-My; Sun, 04 Oct 2026 12:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOtB-0001hJ-OK
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:16:39 -0400
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDOtA-0001G9-CH
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:16:37 -0400
Received: by mail-yx2-x0e.google.com with SMTP id
 956f58d0204a3-67375a844dfso559743d50.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791130594; cv=none;
 d=google.com; s=arc-20260327;
 b=sy2EudxH2FxN0zebYDmrFPbZHad4yj109ZRZUnDa/HnV9ElBPsxWllCKVq4zii61y6
 9U/rQpqPXPfbCa4mfa8SZoLdJy7I0zr/VCHwFh0uBhh3xJ+M5QwDv/yXfkDKau7Dx45Q
 gWTjYj3HLvWA2kFfPXBb1fyuocTWIzcStSqFnfdxeX7sye0+EPKmn3hsRiNgu1uWVp/C
 K47TeLRCwyQWDdeEbIqZhVHPziuN/W2ES+2Df5i3NWlu3syEg3E1NDCKBWS8KW88ccF8
 uhXTSEZj+VpphP8DsLs6uwagQdw4pJx/06KVvcMsqEN+IrF8At7Tr5cxPw0Mn1N+WxgG
 tmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DmZaWdgSsjwsGhT+bcTwZ/ICj/jwgKoJL2XG9oXJ74s=;
 fh=SAVFYS9zQA/aJmGXSFzO/ZenUARSuhMStmLwY0JRrA4=;
 b=mmvay7BAiqvJETTN0N6DOAWUQ+QlJm23bc68uDest6QHzhXMdEcWQo7z7vQHoBHxh2
 X4bNTIKvtfw0lGkSGgKZM3XpsxWq91fPW8tUMv/5TaHB/+SQwtAfAmhMDqhAJRiowNty
 Vy7l5LvST2rIsaymtA/SZIKkRMOsKPXwCg5cMf2z041f8ZdNJFJh2Ls+pN9AjpsdmWEw
 KMRMjoKq8PQ3Z/x1mtV0f5Hj4OZBCDuBI7tlMI2FaOR4QpGaPEXZMTP2kK9RMWWgxqqY
 3aEjQoLlPsoHyN0zrmAg6fsAvH+HT2+J/Z/XY+5SKpnCh8O3FPAYuZDqLCyD78NE2vrs
 QN6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791130594; x=1791735394; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DmZaWdgSsjwsGhT+bcTwZ/ICj/jwgKoJL2XG9oXJ74s=;
 b=O2SajuRr2++26e+HAGxskZqUtsVPY/wp0/i7zVaKNgZbJQdFIhhnmX2Y5i6DKG7Fa/
 wLmuPd30gd0f35aWuRdErD/dN9qNgwLtrFjo3kMOIPu+CfI4KTRPzlq6OqFOTz8ih7qI
 2Yc5Ksos3JKeFgPNFTtG1ai3rMhVULhSRU/Fkms60+KiulFLNvnxEMbErhljymNG5Y2y
 ZB9tR7hBiM60sQAR0rnolaYNMQFKlbH+1ST9MUeO/RnREaK+Ny7Gx5r71LL+KuHpIRws
 oEKfl2/GQomTMLd1S6vxczW41RCCsCf52QVXe6VYGvpqMtUHT21cjARGEdrAZrYLDrmm
 cazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791130594; x=1791735394;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DmZaWdgSsjwsGhT+bcTwZ/ICj/jwgKoJL2XG9oXJ74s=;
 b=X0Rwqrnz1psB38IXSj2BJ6ku1XQGF5ZteudLZy1abFHD4v51/9h9/W+JdxJAdexTOi
 EbNC/1FiZ+L5J2ffStKHnQJyRGS0zs3K6uRBNwDQOVqcRV4AzaKEZ63osXNWOoCHQgFN
 0T8W9ljHrjP6h1EtKuk0FgxxWywrTzO4+Mv+8Yzhgy0IphsC0kXrsNkVHRwLVTgEqphQ
 kfqZj3VNBSyq/78dWUBzBrOOnWmgChP4HYuNRflzcMbHhVs1zRs9gVIvleTAzodcHX2g
 2lNJVC44HaUBRwVRtv1yNy8CWsK28yvsdGDVzU6CqNJwgP5YX8/M9YSmSfhLGS3zZ3LJ
 ieIw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRLigFRuVt459gUGQEUivGae72p5ODheDekrfSjEr6itDj9MCPjDx8dxshb6hTFLhzLppe2mBJ3A==@nongnu.org
X-Gm-Message-State: AFq9FYKHyHMbDDohBmJecpr9C661eswEpmLHPMLewO0kjf9lC9pwziE2
 eFQAGlgUZ8XQrjPn4ZSl0s2NjCV7VUDAHz26z5kOgtq4O/OZFJPtxZOpwF4q6eTfaauTX9/Ax94
 HBDe4NyBs23xQIgKI7ap7240IehfaaBI=
X-Gm-Gg: AYBFou1ejojBIn6UBfCAugKa6uL7LtTED+bqhGzZLsrupmKpL76/3y+BFJ8dAJzeypQ
 p2TT63LVcwZG7GVncQyXgmpUGyX/TfgoAl+dFlRdie8FUaBKzc6xwimrByS4McSg9iJiIGVTFBd
 aeiGZTTOMmrmoS0p1UBqHnGQwa1k3SB7RKTAL+AW7yhDFpY24twyg6n7UsVGw6P+XY1VtrZ3Imn
 UrY+AvIqtn6OY7nf/6ZHOEDZKlVOgtGZE8OdIx99u0BkiAxxf+k+BGCDlAS232XeQ0ideVJOPhW
 DL321PK46HoETfYgfPTd6KIMYEUT8hFvDQPKsl99Q3t8l5c7+wdjeJgQM1Q7sLtBVsws/h1i47H
 WqL5VSwKRav5ipugWMUEPSrU0ew==
X-Received: by 2002:a05:690e:1913:b0:677:aedf:d296 with SMTP id
 956f58d0204a3-677aedfd46emr3335305d50.7.1791130594292; Sun, 04 Oct 2026
 09:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-15-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-15-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:16:20 +0800
X-Gm-Features: AclHuK8OgWZYdIbiLNjf4s9o5UfzXsMuJywvadl8wfHNSBp1CV0h_Q3l-w_ANLI
Message-ID: <CAEUhbmXc6vynEkCYweCdxsQ9_qhk_Rzy4Y2rb7KKOZSRQsYCLQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/30] hw/arm/fsl-imx6ul: Derive from
 TYPE_SYS_BUS_DEVICE
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0e.google.com
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

On Sun, Oct 4, 2026 at 8:28=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx6ul.h | 5 ++---
>  hw/arm/fsl-imx6ul.c         | 4 +---
>  hw/arm/mcimx6ul-evk.c       | 2 +-
>  3 files changed, 4 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

