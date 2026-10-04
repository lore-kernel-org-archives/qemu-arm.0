Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9B5CA5FEF
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 16:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDP2c-0002HO-8c; Sun, 04 Oct 2026 12:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP2a-0002Fx-O4
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:26:20 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDP2Y-0002Aa-Sl
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 12:26:20 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8ab43af5e97so6041447b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 09:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791131177; cv=none;
 d=google.com; s=arc-20260327;
 b=f2CiAwSQqP8CJ4PBIVEhnlIgOSHPwPQczbMrJ7B9NIxN/GNMwZkCBztUHcmg77rmKj
 +CZ3Jff1xLs9EYafbiCTRKtk4SE0uK8HSUxJgNPaHv7+iw3Tss07cPY1dHZeRQtGE6oC
 8U+50fWWaSLvizI3M+FLUZJrba7V0HjXdURgDYftEzPOIAVwwocYJKzKwubK2MzKe6+J
 vagA6hJPJB/dtO3JDiQIF2YLuOjATdvIlqp+Zj4lcQJ+jQmb6pRpePfLNLUn0ZJ+es44
 6FLuSnYOa2oVyL2zX7wmiNawYlqd8z/WM/ryW3N+bZOaM4WnNSR2dkxP8WBvivTZNJxW
 bpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gCMwWED71tLTeIT5hEmttxjS62VodQBS9PEI5/PVHSA=;
 fh=NXdD4FGiec/a15TbP/qfxDMx/buDYGDsYJfXmaVNW9w=;
 b=R1tUl1ehvotsrK9daeElhPgFCTwpNCgkJ3fXr6GwBzkY/tCfat6xaSkNIEvwV1JuSx
 NPxv1OHBwbrMujFUhUMtD4n5nwQv/nWljcVB5ouls8QCEl9LyhnzYYA80PrYZVWPJzG6
 RTZNbPsNvplwbxMXplTG/8IQdqf0uBDMZJRokasVYSbo5uE1q/vpWuCYDuY22Geb0DnP
 ExMmrx1GrmXDNg0ebS1vefzbGWz3SPe5Shcln4iDAbd1yU5aVFVxelpWodagfzI+2a3y
 Zs9HqCe0InWpmhy9bc/JlELsqrbEat6HxVg9WPvxdprEDD2HehymXp801p0tLSrZhUNQ
 Vb1A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791131177; x=1791735977; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gCMwWED71tLTeIT5hEmttxjS62VodQBS9PEI5/PVHSA=;
 b=kWsGcQEzM+mEU+pPaZ2TAaUQnb86rB3c1zEXxfA/BeEYlCEkcddBlIMVVWvywPhdRw
 g7CAADygjunASGtbOdaZ2DXZkIb+rqf7fS5oAxxRzC/clCVc4Kqe9kFyybWYtEPJ4zie
 ttAk5sTCT5Ot6mTueFhtvSOK8DR/LuvZ02XLaPNJagjXupAw/Xsl+QKokMI5yMD0fl9Q
 ayx721U+PH1RDxNbK7sIdXmc3LYkpcl7AGqwST5GtTAhNm53HbMeGphP0jPWkdd85dnr
 JUTXy2jUi9H397WLbapWGzV1vAVAhHWUtEellvCdaTMUN4lVIf7jAzJ6lRgCtyk6PLM7
 m/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791131177; x=1791735977;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gCMwWED71tLTeIT5hEmttxjS62VodQBS9PEI5/PVHSA=;
 b=iU5ubnOg61tDSaIVhPUlLjUcjQLP82+5sGW8fM0F6O8z2yWOorrd5IMXaqkn5j4MCX
 ExS6EUOC9MQ4F06j4COYN0VkOJrOeBkja8Znm0PVZTpOT5j4HmK/5bWgbrjsjYRngqxo
 wGcSVQ1LeZt4YtunBMPBO+IzPuTEI0LKLVoRzX8mCpfx+OQV40KWZg2NPmNre6SRrQBd
 LGODpOm/uus1nhCleM/nxLWkZIKfdBuY5XQhUACp5R4uSL9HUgUzHxTzKJphnTEKVqoC
 2BrrBYA2oN2iceWKfVAqwT1ZdPhfOQNssj0raKhc3gas60UVYboLN7Dnr+upDf5xiKFU
 GzFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwHk1iGhnZCnRZTFSYXno3L/obN9GVcR9f01pc0yhwZK2GAVcabW3xv4hSMmFFTYWXF/rvBg+gs1A==@nongnu.org
X-Gm-Message-State: AFq9FYLnHATDwChzAx6MkEWJtxGiebVuiZvYP43/xaZIkdytDov9Yf/a
 rB9GgQ0pn9NO4+rQeLP0rDojSe6B7/Taw+xR3/vtpa6TffC0Tdzv8pIIVGcQHnMPyYZENsEZ4VT
 eE/b7rN4PlDJhqgCt/BZL2mi8Va+kcNI=
X-Gm-Gg: AYBFou0WSXlY/n5T3fh/qvncIGck+0l0ErmTwZZBAYCK7RENXx5z8NBBMJN+al5Bphu
 sILr0qbwc8j4C2a8KyL7/yp1k7FZcTdhtBJkEDnv1BduGUbiFxBmDq3RlUgkLi5wLMEkpFNpGiw
 nkM6Sv+NIbdDDEnUGPLFtxHRFNohsS9I7nKKsja8uMy1k9V1R69CCglkgUssbE5uHYPTCjwS9Gn
 jgJTpoMdf8HNJJbd7kT8ngrg1Lg/fToe8aSfSzB2bOESD6KQViKlkV6raPl/xU06/AfXpa+HtSb
 rogwybpvoLFUreDLzCFQcFTX8GOdx0/mbxMA9w/rLncqm+17XCyEGa1aP9i9vLWv/iW+y/fVbqS
 1z9o1a5kgoxDQUuA=
X-Received: by 2002:a05:690c:d8f:b0:8a8:8945:c41a with SMTP id
 00721157ae682-8acdab6c34amr49674117b3.3.1791131177644; Sun, 04 Oct 2026
 09:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-31-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-31-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 00:26:05 +0800
X-Gm-Features: AclHuK_pU_rbdup5VKb9QVrW-iEijpIsgjS56VrcrlMfJmbyN81LENXo7UuueSI
Message-ID: <CAEUhbmUYrVbTZ93h9mkAL1e=1UntZ1XXy5hp5xZvj9M8YK0E=w@mail.gmail.com>
Subject: Re: [PATCH v2 30/30] hw/arm/fsl-imx8m: Fix typo
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
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

On Sun, Oct 4, 2026 at 8:36=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> This is IMX8MP and IMX8MM, not IMX6.
>
> Fixes: 0c105b261551 ("hw/arm/fsl-imx8mp: Add Ethernet controller")
> Fixes: 857670200c51 ("hw/arm/fsl-imx8mm: Adding support for ENET ethernet=
 controller")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx8mm.h | 4 ++--
>  include/hw/arm/fsl-imx8mp.h | 4 ++--
>  hw/arm/fsl-imx8mm.c         | 2 +-
>  hw/arm/fsl-imx8mp.c         | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

