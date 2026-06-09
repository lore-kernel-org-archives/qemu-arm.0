Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9107CCD98C7
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:15:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz6P-000894-S1; Tue, 09 Jun 2026 12:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz6G-00086q-Rb
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:14:49 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz6E-0007Gm-64
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:14:48 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-bec449d0af2so672153466b.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021683; cv=none;
 d=google.com; s=arc-20240605;
 b=SNdicJNEg/AzqvCSVQyIuZpY5kLub+FaYkn1IhpAt08mPY0w/HuPpNgVO6hLOXyry3
 BBoTxrndDEaG8EcNaXjj9fBpPtTkAds+0CEqZItk2T0pRfFLc4HiatcUWgiO7TIU4UfK
 ZAIGekEScG5stmOAL8Vd3UXQ7CCkZwuatrzJFIHZh3LgRz1wtNjSXZ/Aoxl78CfK5xg2
 WNnTfHInc/TEZJxVmRbMxOlwMCCFVV4pnEJTImyfCCvyppHyBeUByea6GhuufBwmqIPC
 BMqRwnFzkYmaJSvxsKdizPwUo0IXXwxZwSxZT/WgpQm70PyBNkSRLmuBrhWHgHq/ZTrm
 R2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bmbZtOBEhzGzWB5lH6BsUTwAB8cq+OSXLFA+O8hG9ys=;
 fh=6ci1ikTRRS4TasWzU1j0eiyUkihl3OA6IglyORxIa/Q=;
 b=RElEDo1MTx7eBZCwKA13cLlELkmdSOmifkPqjATUBAYIAmpAj5HPOpvWO81oWBfioI
 ik5PErpKs7saFWy0KR8ESbEKxnkml/VM+1LisUdozybEpZho5AIY5CXUgQ8mdmgRQggO
 cXqDtypHZeswbSBr3o7UmVU98sx3QqCesJzdORJvh2tuGYVxSuh2dVUjbAuuFD4M6A/p
 n1jzQnLbEVgn0tfEXeq9T0eQt7CgmMTKdhFYnR2X1JgoPISffALUXQrdFsUa31+Eew4o
 R1W8gJwSGEq3ak8fwuGjNGx5oxzIy3pDz95eF3/kxXCPjBW1Q+7uSwAMIb+pmlQulz13
 iapg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021683; x=1781626483; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bmbZtOBEhzGzWB5lH6BsUTwAB8cq+OSXLFA+O8hG9ys=;
 b=AAAg3gXOmKsZ4VCtVSjx759ij3X5osPkSQS90sEonXvoPmZpUua1QNsGaMBrqkrc6K
 PgiiGDevuz1durey0mlEZLwnr5Yrz777gxKRvF5rulCAmcZwfQJzMYAyqe9ITyJ9zaOw
 qnL7n91rE0fV0G12RsAd0cPHfSky4eBaMj0CwNtKodZj6pzvsdswZuLfd2nbbydruWlN
 SewP/Y3VYMNdLd4dR9MiIaIRB31ul6yAWNZG6ZZdjRDNVvTz3PCdM8ZsHk/AOzhIeDXD
 N50WisAaTbQrw2qSsQtTZNGk/VY1BZCT2E0rgenYvJXGjoj+pm+qPGpCMV9/yzTY/yRC
 QRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021683; x=1781626483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmbZtOBEhzGzWB5lH6BsUTwAB8cq+OSXLFA+O8hG9ys=;
 b=WQ023GT9ilq9+tyLF58MV6NweGLr974plIbVdNtGMZe3Qxc8XXO1LKrZfTiUYxV/wl
 UUyviFrRn0FEZcYSaJLtO7mhZFRvfbiNzNY2qNp/SzXJb4jNw+K6DXlpWX9Wg2V1RGjs
 4lRGMujkeFQRsTl7+OY6iMRBtLFaXhqdOHdcUQx5mCqN8E7GOgnKI8MiujNrCdVA+o9d
 NE/uppB1oEk/cuDeeKJaEPr7PB1s4LylraU0DGK0IbTDZzKAhrqEvbTIVMDBOBuEr8DL
 /473SM9TmRiKWH78Z9Ssel39R8LrMrr2HTQQeHHtMNcSYzL4l/FS7FqLFSmUWnmfPfjr
 kVoQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nVc3zZUVN+phLvpc1Ec1CuhNhd+u1gzLEW0J3yl8Va/N2gwzayDElN3qw5YLnKv5QTExNWAEJiw==@nongnu.org
X-Gm-Message-State: AOJu0YzPOUlozyV/ai3ycycSWflge4Vs5ILy58101Hx1IBJ3udusxhhk
 +21oOMyldV0li/fR6soGhg1bNMqgpPWvR5+t1tVpX2R2eNwGEdpVsE7V08yEbHmRLXy/KaM7FeX
 l6C/ujdYUV97skR6VHjjiBCT+vgIUwfF2NnkuFa+38DKT66ZRZ4IE
X-Gm-Gg: Acq92OFx+MmdIBmQHM9LlCKNwTcXZSRsx0L918PEyNBo/e0yWYvFEbdsQfwFCkuXRcu
 i2Kf9QzFg0Oq/GUAGNPe0NDDR1ShYH1jpPb+5Lw+vJ4sr9v1C9vn4NbGyx4DHrR4mZ4l6gH3m+q
 4CbQg5V9jFr5ApBZhOfnaWQymTKaT+HioVo7ivHIdZKxwOB2goD/CloM9JRPnw3j8/APqANG/1s
 xYDxpBT/s/qMXLqSoeBtpAtOoW+8Kt/7HwiDvqfqru3n4VfRuwIvkCogwGr5M+41ely+cSE7qn5
 ZAmkQf/J7xidGKJ4ssMwS4/NG7XgI9SmskgBBtLfGBNsxpw4zvakLeABtnF2M2qbUVdndgi2r8o
 nQg==
X-Received: by 2002:a17:907:9687:b0:beb:1dbf:ebfe with SMTP id
 a640c23a62f3a-bf373408635mr1074165366b.36.1781021683421; Tue, 09 Jun 2026
 09:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-37-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:14:30 +0100
X-Gm-Features: AVVi8CcX498MBZAGQVeJBG8M65WuCgYCgOLMs40tK_gwfCcV5pc9cEkdLGG3e54
Message-ID: <CAFEAcA8uT0091zwWr2dLJrp6xU3+DG10xHh-M9T37_Wmj-ayqA@mail.gmail.com>
Subject: Re: [PATCH v9 36/45] target/arm: Enable FEAT_FP8DOT4,
 FEAT_SSVE_FP8DOT4 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 2 ++
>  target/arm/tcg/cpu64.c        | 2 ++
>  docs/system/arm/emulation.rst | 2 ++
>  3 files changed, 6 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

