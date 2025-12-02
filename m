Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2B7CFD2F6
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 10:01:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQNBw-0001t4-QQ; Tue, 02 Dec 2025 05:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQNBv-0001sO-7s
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 05:01:03 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vQNBs-0003Ps-Qt
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 05:01:02 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-78a7af9ff1dso50802267b3.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 02:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764669657; x=1765274457; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mKfnrdubD+3aWGIMw1TQgaMqIjKjNRHhJyadp8VkiZQ=;
 b=E5cKHa3eDU39lRRpL5ba0wGHI22whzpGc+Qr7C2ce5hdHRWdE6RqmVsUl0nX0MbyKx
 IqHT/4qbquaKvheLmjpB6II9l3Z2Nr83DTyk+upRIyOTvbEQTgOgSE6YBC67NdurtPgA
 /NxSzpxp5dOa8orZG3v/3iyZcPtVPtoLs28hkwlzf5kLx8/VLQrA/svVkpHcMzZJQUTU
 PcO6HBpBxiMhvYkvzpCpCP5bP7GOpAUGUTn+XCTiVVsE64v60Oup8uGlcOK4ZJbphD0v
 jlkWiaR8YwGPmFqJazYWLE8nCktIc7cmQBRhiVlPW5JAFXHGPPkGEpqs7kF1uzm86JHd
 qJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764669657; x=1765274457;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKfnrdubD+3aWGIMw1TQgaMqIjKjNRHhJyadp8VkiZQ=;
 b=AnmdFeloD10/pkIv9jD0tNWG9uZOD98bCs936ITojULFt9IJtmLTkqQGmxBEMITEH3
 YzItte0mfU8d1Y0fm9VPEsMbEgbM608xHofqlofLFmEEXGcqJOrLv0Zi3l9vPA547qd3
 1RebW5ZQYoWjlw+dpnpHnNzjMu+BP9rn+/DZjHWnm86qrCCaOfMVgr9Mgt5lYcrA+Xyj
 4c0obMso7cVk52GUFf9uU6zd6CsdAJmZdj6zFX9161e88SZmW3Q0L9I2Qb72qqwIK47n
 dQbNS3Z5ubMxsOZ9xNwyo0tkkOW49j+qXkRa6+TrzG6GCpeUOcJJtvacL/DLsvcjgaZ9
 onKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvluSqpch9omkCT/VHcUpXgRiD/p/s1LKFf+UINZcj8ppohmf4cJg39uYyw4+oDTz6E2o1++0zeg==@nongnu.org
X-Gm-Message-State: AOJu0Yx9Lk8Wf5BbPrG1BEVTow9Ekz3HKinjFeoesf9l5/OT3juNsifX
 zToZzWTOi2oosKd9BySTE4ha4VdycfDD99IxUNYHrTP4wGXDkLxShPXn2DVlrSbKOI0tMXS8b0H
 hqT6qdwz8tsG+lAi3DscOvlsmKRZfX/FNduck08yDgA==
X-Gm-Gg: ASbGncsJAIaiChLi4stpYpbr4Mpapx62Ty/JavcxqDrCcHmBmsgxAXUm7MoiylLJ6g9
 upR2oIy81DF/f0wRAgoLl+8KEkct4NMDEy+hwSScfYKEDCJJGNcAjtecnCep1btpiZLfNZ5E6sc
 kVcQw6NqqmtCu7EbftXGqBq2fXP9dLn6TPnQ9AXLxghwOebHPFiy/pw2HTd/qF0OBGv05xrlyrM
 CIztOkmiXiBJqVISCGGwXU8N+MC2lleUmSifiFMo/GJXlLNx/SUpTznt4+ixGyWhEOR9sgZ
X-Google-Smtp-Source: AGHT+IE7C5hUU6dftA4/yPcXA1SwoOCG0n0kIJDwKwJlsRsajlKV7L9jjIHgSIY/kmX77VXclRmXNc26P9Jxm8S+vE8=
X-Received: by 2002:a05:690c:6f10:b0:787:d46e:c567 with SMTP id
 00721157ae682-78a8b5424dfmr380241697b3.59.1764669657385; Tue, 02 Dec 2025
 02:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20251128162306.13701-1-osama.abdelkader@gmail.com>
In-Reply-To: <20251128162306.13701-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Dec 2025 10:00:45 +0000
X-Gm-Features: AWmQ_bnH_1Q8ACUybd_2vCPzKb9cMC8-aX2zV6GMF81QWCP_4wmjE2bq94gaNcA
Message-ID: <CAFEAcA__=TnXrcprp464uw6VNZKLcSBKYP0oj1T2e33Jysk18w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/raspi: remove duplicate include
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Fri, 28 Nov 2025 at 16:23, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> hw/arm/boot.h is included twice
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  hw/arm/raspi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 81d2fa1b67..bc723dd7d6 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -24,7 +24,6 @@
>  #include "qemu/error-report.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "hw/arm/boot.h"
>  #include "hw/arm/machines-qom.h"
>  #include "qom/object.h"
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

