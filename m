Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6051BCA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDO7J-0006KV-Nk; Sun, 04 Oct 2026 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDO73-000615-CK
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:26:58 -0400
Received: from mail-yx2-x29.google.com ([2607:f8b0:4864:41::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDO71-00060e-Np
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:26:52 -0400
Received: by mail-yx2-x29.google.com with SMTP id
 00721157ae682-8ae10c1532eso4999807b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791127610; cv=none;
 d=google.com; s=arc-20260327;
 b=OtR7PEBHWd0k+CKKC9+gW82I9f6yNQ4bPZaJSEJQqIBPajaZp/zenVnTUjPfVYjph9
 sVpdv7ZxyDKmJrPeBQL5ZEiOqS+kbIZ3yOclW6aEIu9TP6k4RJi7DegYkI4FXeh5zyWx
 K0QIVqgqHxnM8SgTM7FpyRbQVkLvAKdXQCuAJ9G3ANbC17s+YSKoy3lz69NXB5HZv0uC
 1Z8/qnXPtdlDjGuF9w9Rf0XeQdbKcVByg56KT+XM0Cxn8bZYNbHDvpXMyzB3XcgH++XD
 DPC4eUcxqcYPqMG7XLW/LUt2Cj0jNiMXZYm5UfP+/PSYRRHwE2pkBAeKrDYnHfTqfdXC
 iz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pFwd6/3wkZ1BbDFLuud1O66rhIuYH7s2vLGJwpTjYyM=;
 fh=X26tDivlDM95x3uw0dnFf7qV18FI9HjxnsL/OD+M+iI=;
 b=WPdKS71Z/5L9h8wr2jsqHpZI9hC5uQjDelQtGMdNMyGVdFAYAGDQJnlOfFzJWAMzwp
 34npcyvtSRGnWbRzTZcGeoLymw/rMH2YpWwbF173jbaJSgrCmXgpZIp51tfTy8WO8fFD
 2jKYQ+56u9gLHq+p/dSj63guZU4bRcRZba1jN/YTiwO73u+4eTXlN7RPReug2MpSWKze
 O1uwQn+Xwc0YjVVQWDRBIgPjbt6U91T8K44UzBRZoyqGF4dQLKn2rfChv7hkbbSAZIhG
 c50L2jOszSwYPrCDa6GpKqHOBpKnsbRLBy4gHuzfJ7vrSjRFpOH/KOzyrTk88x9GLHDX
 RTuw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791127610; x=1791732410; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pFwd6/3wkZ1BbDFLuud1O66rhIuYH7s2vLGJwpTjYyM=;
 b=myeGxWt+3cckGT8gVJQ1ITczbJGPM/koNK8T9H8UF23joFkuwftKFDsNJb7dmrhkkW
 /xPw9YPK49sEeVlMtbqG7ZAyYxZxIHVlzchMY92FfzSbBVtjruAjk6KXQvmF/d/JTVRr
 h4mTOwpBu0HLMogrV0zhG+tpMhSWectSCTwPpzMuWQco41kydkmSohg2LRjX3irtp04k
 Rgxg26Yv8hLQxg+1vDhLpk9nI9KDSnkQGjT1YEOHZ8DnUfYqEX6VuDpmz4P6KDJzdS+e
 5YU/n5gyXT1fyrqnKfuPSdSblTTwUCg7WYkGcymhebJaGjY9of6wONdfoXvmKav/0cbh
 PWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791127610; x=1791732410;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pFwd6/3wkZ1BbDFLuud1O66rhIuYH7s2vLGJwpTjYyM=;
 b=SInh4RhjCyyFXgTWdjQZ6AF+45fOjSKMMNHehtDvQIZGq1ko0e5VB6ysAX/GnEBgik
 StImSf+iVNCJ2iSjKdBIsI/TyP8Pf13CJ/eMIbAHOIx23sFbWmtpqoNBzyKePGeQNmL0
 Mvr7K0hrFpW2zNJosKim4x8Omy0z/DTbRk1N2SedJTFPXMfJwYDS331rfTKKgdw2vT4t
 uZqu1GF5nHanrT2RUHmw8Y21kmEm001RCN0IgbOtRPZ4Za4xgPMpYI8eJaiCrbKHZx6E
 kDYPLx5wcPo9ZRN0O+XxHq87MiWHSG2876GvbI3Jceg5XeLQN54yRvJt2jcYIBEuIN2s
 Lv+w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgp84yPGJgVpVamDzsZGuvxJ92uf30dS1poXDrULzwGhIyoU3jNGLkLF9Jc10vVvSCZS9IMDwn+A==@nongnu.org
X-Gm-Message-State: AFq9FYJ66aJn3cDDxemJ/Abs5n3/flkBm92O53sUUHhs30RZo24BKmCR
 rFDyzjcXjDmAjJCpAs1DvkScRO5+DiD1XG+T8BdxmTiN9jT4qbh5tHmii0xilgf8P/7LVLkCJ6j
 ngHrVw4Zx7uglfLzmvmNcnlOSUvFLgzw=
X-Gm-Gg: AYBFou1GtALXrYtPI9y53lkxnln+aO5FZkTSEwQIX2WqfgswMg7fBhHb45RkbpSNPsD
 w7Xwy0RaQ4f+/4EorzPu1cQtJOV/DnuXWB3fHQuhhyTWMoMJHQrX/hTSI/W4QzI/tPMA7nMWFiA
 A0A7N7P3ZGnPKSwK1shWQqC4wbcOwBjv3v4AL3JQZZLb7f3jCM5wFV3IvmkL96RkMfP+wdig1eW
 xie1/fAFkNZvpUEf5eb6+tjWSXPoA0soWGmID1jFYgndP5+ECw/wVGi9REJ16wvCG9Han62/tfc
 lcFDg6Vnc7HJJZGXHNBO7lvYsb5+x0XWRnsbU+4Ngn3ahOmW0uHK1Mz7JhvNYUg6YIUXSyNd2Le
 Yr3H3+Spceqpj364l
X-Received: by 2002:a05:690c:348a:b0:8a8:889d:2db with SMTP id
 00721157ae682-8ae39bc50f7mr32695957b3.34.1791127610516; Sun, 04 Oct 2026
 08:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-6-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-6-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:26:38 +0800
X-Gm-Features: AclHuK-GIluIy7PXKC77O1q0cy8hQUecFfpIKLVNLkywXTFoWEmM1kyXfczi_Y0
Message-ID: <CAEUhbmX8X9z_kHL2QaH9SLvauTYKOmmrDs5wLjjjRvCEeANkeA@mail.gmail.com>
Subject: Re: [PATCH v2 05/30] docs, tests/functional: Drop redundant CLI
 arguments in imx8m*-evk invocations
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
Received-SPF: pass client-ip=2607:f8b0:4864:41::29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Both boards provide defaults matching real hardware. No need to ask
> users to repeat these. Also, remove these redundant arguments from the
> functional tests such that the defaults get tested.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/imx8m.rst                   | 2 +-
>  tests/functional/aarch64/test_imx8mm_evk.py | 4 +---
>  tests/functional/aarch64/test_imx8mp_evk.py | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

