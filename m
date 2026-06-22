Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D243ACDB46F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 16:07:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbhBY-00066U-8w; Mon, 22 Jun 2026 12:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbhBV-000662-Ig
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 12:07:41 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wbhBU-0006Ip-5o
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 12:07:41 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-662bb8b1f93so4423395d50.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 09:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782144459; cv=none;
 d=google.com; s=arc-20240605;
 b=FI3PNVN7agb2DJVla/7cgZ/APx7xfGcYcSRIDe0WqHDC+BqwAdyydxS6COvaodKDp+
 hfBxeC0PsW+un9Mugjsa+j/h1CbcoBXPY0bH0PqNGkGp3x5LrhC+HLXz1lADUlIzgWsr
 LZEEkCUHw+xLFvMmP4+OKci7S2DvyJPjCbGVv5m9ePgEtKSyFKcr8i57Skt5CvCmagzB
 Pqcnf2m+L0tcHLwOLvWgSEBosAmGiYX+vHWO6dctx+ruJV+stBmUsliPVb5Wu69vbbIs
 328dQHtNNF/HP683JwVr95k71GmFb6tJH4SmuvS7Xq+MlHl4wbpV6T6QojlLegvU24Vd
 fTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XFXBYQvR1B9AsvIycYAgg9wXLkRe3WQ47h1nYEBLwjM=;
 fh=nr54sUBo34v0Tw8LFx0E4ZVk9iqntZVK3SjJhuWBszU=;
 b=UMLAqGaKj2zGkNhrb0bl6JOtqh/XTaLHfpjoMw0CHfPIW26jyb2XHtSUL9EYDmnfNk
 JiotrckYeu7deUu5JLNDVBq/BtE1RtzlZpGVBpoCKEepl/5MegVe8jeSZJGRAdDMsUsq
 e/89diEQ7mIDrod/sWSpBNUkqAxhtLGNbLBXvnB1B5biC7zZY+s9luap0qcBo/d2Aq5u
 l9vQVqel0sUMh/PDnHTVucxzU4CrgAv+3njeqr5xELO8ce21zYEJahX+HG/J41kCzB7V
 uG97qRORuphk5E/clNcN4mMiPG0XCBifDoTW0DVXn5heSfGUl+Fc3i0NkGXjmaJoss8e
 FdDQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782144459; x=1782749259; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XFXBYQvR1B9AsvIycYAgg9wXLkRe3WQ47h1nYEBLwjM=;
 b=QUcAq8FKhWKW85D3x/l7KQAymnl4BKaCLEVBlREBXyJpou3q7D7NN6p5ejhPirijtD
 2Tfd0FJwDcF0Ao+ALDlbnd7Bl9Kn0iAoMZy/3WLMf7WnIwReqLiVu6XpM0Rye2WALDJS
 Lq9G/QWyisAjRI4/4J/iLwkBwStP7yHvzFiWKiZRxMsxCasNPiJQ0U7QsO/II07zUF/z
 4/xUCi1RnFVafvRqDXhLIaH74ZbrDTjWljmWuqAFDTNHRO5rkqUhfTX+3wdBrZj4bTqX
 wq4zRv9LpnQ/lsit7N2l+3NfI0Ktr/nSxhS9MzYq/DNfBfDxrXB1uf2klu7bfb7QlAZe
 TYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782144459; x=1782749259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFXBYQvR1B9AsvIycYAgg9wXLkRe3WQ47h1nYEBLwjM=;
 b=dkISBsAk5cd19jDaodbyWyoa9rBio63NiTb3opVB5LTInJcGsslLWOnhzN+flaL9DN
 urHZoPa43Cs1xq+2+5ODLm9U2x3ZFpuvYHO/RurrUR1g8mqvofcCOo2tGVGqQE/0rznz
 pLiUUPus0C5lHEzszx1JHzZFO1Fx+euYAZ42Dc3Q/QTfAmUcS1QK+V5T2PYilz7M5lah
 kj9/RDTu7pOj8LSmcz0mEZFOSQS6acptCjmxpnSHWqJI2n6zkgPdddXECA9ITXHbeOsz
 KyedUJbiBigNdCEXLOeceaB+kwtTSGLhfjjW56LZj1Oof1RnqusS5P3RGlLYrfn4hjdi
 pveg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrCYUuAH5g88BObckV/ytMIxcQ89PHryWtfln2lV/xvVSSYEWL+vC1xJXOFNOlBS9FZlYkFNdmcng==@nongnu.org
X-Gm-Message-State: AOJu0Ywcx5eemB9+l6+Rro/iy5cm3KMF2r55403foBbbhU5Qya25IBfa
 xNI3uiNOgd6lQ8P7cR1aaHktyX+3ctQRkVQFLf+dM1ntYeIhCENVTGsTl6T45yikkSOUNC8jPOa
 8FTiR3yGH5pLrA5dji4cYBk+aOeUlAbJQVUcZVQqB/A==
X-Gm-Gg: AfdE7clhzTmKXbfiUGsKtYBxpO9Yi/Hbh/oiFxTCcLGESMCJnKQ2ceYEspsp5kdxuPF
 0dydlDljEKOCASHbD5c+aodWHdr/paUlGDKIJlyE0JYsepF/GCuaZH14kFOOUyXuBMWf7qH2KrU
 ca9k/2en4Ry2oXMzsvdGDBm5LRLszbdA/LHskmN6jlLSsCeO6HZ2MKcT7KESwWCOAatC401WMui
 xmVUM5eNZSkcKGMeyswh/r3l6wJ9TgGbUVl5V6xw1LZ1d3wI1IdNQ8tlHdztnLpaUuyVhovm2cy
 h4pdUdWzU1GUwPaqPsXxiFQEUw6YG0w9+our2NTRma9YN9D7kN0Ydzwd
X-Received: by 2002:a05:690e:e81:b0:662:dcac:7a52 with SMTP id
 956f58d0204a3-663032f5ee5mr12483256d50.39.1782144458590; Mon, 22 Jun 2026
 09:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2026 17:07:26 +0100
X-Gm-Features: AVVi8CdQFZcZe9qHP4nGo_qucpQD1VPolgeNGwX947UE4Cv122fXpI5UTm5dl_4
Message-ID: <CAFEAcA8R1RXrGo2xov-4gKLQXX=FTVKoK1rGuxuYmBo9e8SN_g@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] target/arm: add support for MTE4
To: Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Fri, 29 May 2026 at 20:52, Gabriel Brookman
<brookmangabriel@gmail.com> wrote:
>
> This series implements ARM's Enhanced Memory Tagging Extension
> (MTE4). MTE4 implies the presence of several subfeatures:
> FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR, FEAT_MTE_STORE_ONLY,
> FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM, none of which are
> currently implemented in QEMU. This patch implements all five.

I just noticed that this patchset didn't add FEAT_MTE4 to the
list of implemented features in docs/system/arm/emulation.rst.
Are we missing anything to be able to call MTE4 complete
and close https://gitlab.com/qemu-project/qemu/-/work_items/3116 ?

thanks
-- PMM

