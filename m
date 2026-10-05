Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD50CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:24:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqw-0001BZ-3R; Mon, 05 Oct 2026 06:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfqr-0000y9-Nd
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:23:21 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfqq-0001c0-20
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:23:21 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 00721157ae682-8ac47074ae1so9516837b3.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195799; cv=none;
 d=google.com; s=arc-20260327;
 b=SGonJTyemrWq+zVuXbQ1c3q0ZIlKyv87CGS8tCfLY6qpuxMMQtC7+q6YBmxsMYgyFF
 7+eLTfH/NM9jg3wMc16jtysQ1nOkTCe320Mmsyoba8CzYDC2u/D+LjPd/SGN6meNvrCx
 Tv5bw7jeF7MEa2mAY74rR6Pf/OXDw2yU3PrIVpm+zK7OHNlV5TTZfmZf9xXZq4oLtlJA
 8RYbPRUn4+MED9KTUzRhkzv4BOTDr66cTO6tNHIYlSruJaA13Gl3Nr28DdC5mKYVwMIO
 jannm2aCHeJJevq+Gr38bsFOia8zw4AAjm2wIhr8hdZmYfZTrv7DKfwhjgdkJo8V0ira
 N2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JY5AhUvRIeC8DPXhmcL74nL/Q5+jZSyAmHm3WFUmfDw=;
 fh=O/U5E+ltV0iot4t+4nYbYTRQrmTjUl5UHliDK1BBaNA=;
 b=WKVuWJhiisl/WtytB6q8p+0iRqKpKAjv0621wRCndoFH63PRhEyemI8Y4HPE+pvHe2
 T4INnLye/4WrEmwUJywYI817xfaKLBjCchPqj9CHQgGfnvoOXPJoLDJbQuMGOOoU9KSn
 Y1c9z5f1a1GaNNQZmFmqoGvTF7iVv+v4/YROlOl/IySpzVBbp+ea1o+XFALFrhJCzNmA
 7GNfA+nkSiaBeqih9p0GYUGyF9fm09sIgW8dPZttb02vQJ+sNUiUbeGYIQsneGP1uL79
 suxm3SUjdnSIRdmp4pJOBGKX60SViQrmMYTwRpHgNiRh9Lj8mLAOtCBHc6qYfYQ3cbXF
 z2uA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791195799; x=1791800599; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JY5AhUvRIeC8DPXhmcL74nL/Q5+jZSyAmHm3WFUmfDw=;
 b=hC13d+uefsREdUpMToLHUGM56nF0UoTdrh20prERH/TfDf7vgNjUUofGifd4YxARDL
 ETxjXUC0c2mqLfVCt8A+JlR3bvnwo4rUi4CSHRWOU0uzP/Toinkx5Vx/c4bi1yrUlkl7
 Kv/3ar4GlWj3XyLy4YNkwVvAdfHbwYF7rNI+F9yqsuqPPb9FVCzVdHPrapSi0qORORTI
 YleQ56RTJXGn0Z5OFqrbKWOSw2s57d0UH0zQJ/+yEsvdJLQqaFu4S63ivIFX+GPD5OKD
 A2CzicDHTiFtgD7nV/p1lbDKoGLc7OyiwvC2eOumjLN0vwiJ2GZ7t3YbfJObfqTGU+O7
 yTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195799; x=1791800599;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JY5AhUvRIeC8DPXhmcL74nL/Q5+jZSyAmHm3WFUmfDw=;
 b=FMphd/ovasqIWC7bAg1GHkxgC1FnCznouLljL+sM0O2Ay7K93V4N0OgGfu3TKrpkbC
 MsSwpJbIV93Vtapals8U7xgTfwgs1UFePVfLuKc1NbD1DFgBf6JRA0EFknnqIZnH4zrs
 4ZAqIWLoxwiwC4VQgKPl1t9WVIUECmI3MyeW4KhXlYMqjj1WtaNfxmLYiGjWcPp0IY8t
 E1YJ5Psi94inffqBPs2No3znvaODJCUU6W24Q0ppSeX5pqdCdPMozlQvzIpYjINhWGyU
 X345StnLfdPmyVubPcymXJ0gZfwSNBYMb68Sl67FmQ5CZlmljLkYe+4pb3a+U42tVZ+T
 KEJA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFsAJW2rh2Agsy8xjHqpmvVo5QR/utMolwERGsOlSAcgPNY909UpDZ8P9PRJttHi+9VFO4MYna3A==@nongnu.org
X-Gm-Message-State: AFq9FYI7Jst1ysFuksiQlS+XYdibstFpGBHSD3375PL6UYRZC0hZdVLQ
 pbuAcnwhKLylVoIoyzit2nOHhelB2X2C8rishUERc87RD0GHr47//c2zopqEhypidVTkwW9lrk7
 lhkBSgPCaz/Z+ZXXBbyZtdQDrl3kEQNQS6M/gbQjptQ==
X-Gm-Gg: AYBFou1Bn2LdMEBJ9gBWAs+kJ9ffL19DRGjjEJoICRYn/cyuvG2f3Cy2I6YK0qpHoPo
 jqSzADk/lCTcWnz8kla8rp57BkcxEOSPVoh/gwISnQskVdLBymyUXy1+1Gf+topGz8W7d/qB3n0
 OYCp/oGx5rUvPYmouv1n/9OcXE1WmVtPk2xG5lkTnRaiUiEH+fcxWk/8pVfz3pWfuTjg74koYEI
 jCvd+44mP8V/mScQ9Ws6VvSbZ3s7b0OxZ9Xhg7VqEmgTw4egXn5qk5QrGdU9HGTc4b/CABg+3h1
 sVGnWM10CI7o0UmfeQHkCfo3Ly8g3P4zpwb8GnExDAGhPPWYImjeeZt5Jze7gpz8yCaY3ZVgj2K
 ocOoHTuhOwq3DZFQDjqDOtSJ2qm9m127XQehDsgQ=
X-Received: by 2002:a05:690c:c3a9:b0:882:1d1e:9aaf with SMTP id
 00721157ae682-8ae394b659emr36708537b3.29.1791195798634; Mon, 05 Oct 2026
 03:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-5-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-5-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2026 11:23:07 +0100
X-Gm-Features: AclHuK-NjQ8FmVGML3rIHMMCx2sM6WMtR-F1Y-Hv0YrYlvU6el4EICqs9bKtX9I
Message-ID: <CAFEAcA8B1yu+xWj1iAP7fOPB-o+B9LjzKWYfxA4fNd67c6JaQg@mail.gmail.com>
Subject: Re: [PATCH v3 04/31] hw/watchdog/wdt_imx2: Remove redundant attributes
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, 5 Oct 2026 at 11:18, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Since WDT and WDE are write one once bits, their values always
> correspond with their respective locked attributes. Thus, the attributes
> are redundant. Take advantage of this observation to simplify the code.
>
> Note that removing the attributes changes the vmstate structure which
> constitutes a migration break. This is allowed since QEMU does not
> guarantee migration compatibility for i.MX devices between feature
> releases.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/watchdog/wdt_imx2.h |  2 --
>  hw/watchdog/wdt_imx2.c         | 21 ++++-----------------
>  2 files changed, 4 insertions(+), 19 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

