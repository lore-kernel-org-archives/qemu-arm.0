Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E91FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 11:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHK6c-0002Ak-Fk; Mon, 27 Apr 2026 07:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHK6Z-00029l-Cz
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:26:23 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHK6W-00014n-Dc
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:26:21 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-650775f427eso10580541d50.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 04:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777289179; cv=none;
 d=google.com; s=arc-20240605;
 b=dSTLv3LJRcWPV8suidQxxjB84shSk85CDiM3VlY/ghlRfVqb1uYKgUENDI7thjNc80
 zl68aQsWnh2FPefViXgSW5ANcCfe6741ugOdN7LX1Gp4Ox4JvCbtV/vjICMqON2AH7P9
 B6YPtHNyRuZ4bJvUbyB4/JTSRY4nVVRPJjzBjxTK5dAIcdNBdv3+ffZBkQU3QF4e1CvW
 kNzJ7XMkf1vOp/h5ZDbuL89puE+q3avOh8I0jTzuKqQK9VoobPRpRCQQK7WGD99xq2AA
 YO3ZxYwpiqwfpn7XiPfYO5/nULpsWqoUS3+B19EWmGyw+qD5tS/Q1IrZVTNl74Ew7DiW
 0Zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jQUSsqYVd7Cvs5s1VaZAfjWliG6udHgREMh34HOJ6vA=;
 fh=FhtHtoUJE2XPGDBLEJ+iVno/EeVfMqEsOfrRatuUZ1A=;
 b=dd62CTkDoaPbYuHKVNcvk8fB29qzlXTLsc3TT/RJWsTp7ZCAACdcG80eDJyacoZByv
 6hM0TABS+qWutpMncUHXekcirso4n8nG5n12SuUVjeARH5eZ4Zyns3MaW25315kf6Uv/
 42BVgt6M8aFAk+ENVRVkivFLWsysofV5pGJDTmFyeBARAEv3hMcNG8FyPR1lzeKrIxLy
 QjMW4CTU6Ksr9HiIPt+z9ZXv+/VJqb4p7uZebcga5eCgYYVZN1IFnT5xMfA3lPgWNcVN
 V4Ha3arU7TKD5idvlQmiYFbZmcCn6upxGZ1uTyA1nro9yugR2B7eInkpisQ4CLP8QCSN
 0E6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777289179; x=1777893979; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQUSsqYVd7Cvs5s1VaZAfjWliG6udHgREMh34HOJ6vA=;
 b=JA2Nc4P2DIB93d7sq92mf7zsfOXxhmBiy+nLncpwM7MD/P2wHGKuS/V1GlaPHW2amR
 cH0MdNW7vQXq4kDCkeWGUpjtpr7rsy4DjmLZPcfbFJPkgdglpsEBeeOv1liifYgv0Wck
 NpaFg9D048GGfdFH+bAqQFrQB4Ls9f/5NhWx0fhI/7g2SEO1fzSkc9f/U3gv7pa56pGx
 VK26Pf44IMyThPqxiJbzdOXOnm4kDCQK6av1AM8W29zGRAGF0j4QCMtvDgoEAICXU2w3
 orRGA8i6DVylOSdi2cdIqTtBhP30C5DvU1oZWESaHctipCMiB8c/Aa2fRLAqPcJXR7Sa
 GuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777289179; x=1777893979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jQUSsqYVd7Cvs5s1VaZAfjWliG6udHgREMh34HOJ6vA=;
 b=kVW5yUDFxqWqnCQtbGboX+BaO2hsJEnE4uk0fWGPL9EpkjT/sWLKWPezQHaumPUaYu
 lDmZlf8byhcgEiPesOnzQmSLnjZRoLOJd2zG6wfUNWcNll5EU7miHqweiDotmpKcOzRg
 Bhi2mZLA8EFhGK3fcbQyz8lo00HJHJGPlPtyhYmmCIfz56vWCS8HbUJIFL/85+QutMqz
 Ku7aYjdn4c3vKK8U0PEKOlJsrQxvRkT8m22CUnZ41PBFbxq88LFitrWugyu+ExghVrJ6
 c8/ZnmV33bnVMY+wRannpLsIf6EFcWlQ0lOIGcC4zDl9rFYU5dTlvsnOPSzpnZljwNHA
 y/5Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ++OTGd3ywxGbDXhJ3fML4jKzttxLE4zOtdY1MUGw0rJD2yzOSSzmMffF0aOwzrcorAfXqPzOAXBw==@nongnu.org
X-Gm-Message-State: AOJu0Yzfem1L6dj6PcC1jHXg0F5nAquaAtshAwiyD3QcAloSNGBGlLAF
 aNBeIV0so5/A23VVR8lhlsn+PNgJKvSgx2+MEfDZooR9og/078BuyseXDvxKX9ZN3JWe334nnLG
 bJ6rnCIuRnk4mZ0wGfqzvYsOwfm9C5BnO/en2I6yPHg==
X-Gm-Gg: AeBDievspIHIJq/xdNn8N2IGyYQk/woR34Ygsmnd+1p+y2CCujmTcbXEYhF55vhFmMJ
 97BlwHEerHP42/pCyz6QBtwFXsOlNzp5b9kVSV6stwbZHmpcf+Xt46M4NYOtcmaFnHwiCEmK55V
 gKynV0yrMXPb2MHBDZp6ZtY6a+eTf2J1dkYA7TujIObNqaYhJxkGv3czXCoemVn018iXjJ5SPeo
 RbyXppV5aJDSgjDIdHvQa4plDxt/uBKavQH/bJPcRhhl1Oj/Mr50xU947C32HxM/TUr4BC/AVox
 x8agBugIFjyj96D3xfK674Bv/I3EPALCcL2PO3UGXcWgJ722w79OGQVYRQ839J8Ad0cR6in0yec
 SKQ==
X-Received: by 2002:a05:690e:204f:b0:64a:e222:d3fa with SMTP id
 956f58d0204a3-65310b4ff1cmr29494611d50.58.1777289178761; Mon, 27 Apr 2026
 04:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260423170229.64655-1-philmd@linaro.org>
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 12:26:07 +0100
X-Gm-Features: AVHnY4JKpg_C5wnQkuVyGK1Vz1-Zobn8go7bYIwEPNotdyrFKeMgQ5BIaEdx5zM
Message-ID: <CAFEAcA-fnfCOri8nKJ11z+xnOpfW6J+6DTOW11LxQW9Nek5Gcg@mail.gmail.com>
Subject: Re: [PATCH 00/16] accel/hvf: Assorted collection of patches queued
 before v11 release
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 23 Apr 2026 at 18:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Various patches related to HVF I'm carrying.
> Some are already reviewed, some aren't :)
>
> Except the last one (RFC) I plan to eventually send
> a PR with them once reviewed / tested.

>   target/arm/hvf: Fix WFI halting to stop idle vCPU spinning

I didn't notice you picked this one up in this omnibus
patchset; I just sent some review comments on it to the v2
thread:

https://lore.kernel.org/qemu-devel/CAFEAcA9RHQ+7++=3DkLn2goJwcgzDnaqdkQtQBt=
xQ2Rw1-uiKY=3Dg@mail.gmail.com/T/#u

thanks
-- PMM

