Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1933629lfb;
        Tue, 7 Jun 2022 01:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhFQ7yi27pSsLKdj71RMCTQC8RHUPWqcNyqb4tYJKY4BcbZeeekCd2+PmfZZQMwlXA9YEc
X-Received: by 2002:ac8:7f41:0:b0:2fa:f70e:8d46 with SMTP id g1-20020ac87f41000000b002faf70e8d46mr21746372qtk.528.1654591972951;
        Tue, 07 Jun 2022 01:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654591972; cv=none;
        d=google.com; s=arc-20160816;
        b=QtuudaaxmXcITmx6EYwQwf0T5vPy60Zcw3reu+IKtE3/iJtXiAWCQ/X3ETtHC2zWgj
         QMIc9V0VPQeAhxxg9cLe/VqvKGeVqygIY1UN+hqyY8Zz62SPCrD2617DTOjne/5F71zY
         XVbyS1MyC9yCL0lOzekt++6pnctGZjXc32DmLO9sOgwPNJgQpAOQq81W43vroo7JX1cU
         w/Bjdkq5RlE3capt/CL9istzeP/nJs68QGjZZgox4nxrdy+UmerIT/xA7m5+Mdm8DLLc
         sl7jPvg9AYCqAHDVegzugy9zokRZPkCWltFaVy98KKbtoVZxxt2DPp0UOyFqp+S0fLm3
         7JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GOGDM0p1S3KdiCzeCMUbY863jmhI2O528m1k1ZQ29eQ=;
        b=J+0foJe0pnNguufOwr2DwXruVZbiV13ZiKIeZK3sQzgXizyO4M0Mxe8oUaRTnDm7js
         VdE4sWAwpEBQ2I7faDz7/8ANeMHKfYRXF36x2HPugLxZJOcfcaHoJays0e7eHg6h+XYR
         wteCXCAm1Tl0hrHWe10MnZG3r3hqPprbdHb+pDHT2sk1SKkODbyJtK5okafaYCe9L6ZG
         1ceDC4UK4wKkzZSbRN4dgcG8i8PF4zJVUAhQyRR1AUbKTWo4mqG9SDyyS9t/pTFwQABW
         IrrqOKj8isefe5wzLs/FcpeHCMKaPGe6GSQ5CS92BTT7q1Gz75e057pq1QyLsA/FVVmK
         p8mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ik4eznyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ac85bca000000b00304e9f1b355si3834491qtb.494.2022.06.07.01.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 01:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ik4eznyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyUxI-0000aQ-CS
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 04:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUuZ-00071K-26
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:50:03 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:44976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUuW-0003UP-KH
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:50:02 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso167619417b3.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOGDM0p1S3KdiCzeCMUbY863jmhI2O528m1k1ZQ29eQ=;
 b=Ik4eznygGdb81JTIO6t+K09C6y4Es4ympdCzXE7L9ppcgG0Aeb8cwCXIFBOe83njXe
 gpgT476nb8fK6Ruilx+Ohovpwwj1IunK5zFB59Wy2H9dlYKTKzs8EnM3lo+K7ZI8lJZR
 rO6rcxHy72ybQTTrag/C5hav6+70YBBL+EpWbQscvOZwA0lNxC402SkOW0ut4vC9+svL
 Oy9vKFHKcCZupOCIbzWA1YuN2C9djaeQ32kukavZIy0bB03IxHeH8CwX0Al7U/HZjPof
 DgWDsHuTCxwf9ZA/XrI1ua5g2rfVzbF0aZUkgZIHsMMPaJidklrMqpeXUKnBI5KiYatD
 N5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOGDM0p1S3KdiCzeCMUbY863jmhI2O528m1k1ZQ29eQ=;
 b=JANVRK23Ew4Ox33pKc7yhb14DDezrFwp0I1jx+G5wYKvGwkt4AAFdjChqeVzwvg3CD
 35bK26GSlekqDa8SrtHjIycM43EANwra30xb8ypi4s0+LnFMsGrld/GmJX+q+Ap2Ut7c
 kVbWZxxX3V/ZUSB3jNGM2+Q8bdIx8th7Xix0ZBuzbc9fjq9H4LyRucRXD34vc3/wrCwt
 9pqp26r9eO28b0RdueRGjXbidbm4C7jRxOS55wR/AhIsg4CzEfrTSrdtHwqY1N6bEKN5
 L2QJ7MJNOU39sSn/A6GUtOv6PbRULguqLf0VGUyzGxbGE69a2V9IavNKLUExsxaZ9xG7
 nreA==
X-Gm-Message-State: AOAM533WRycq8hikOzt6wl4CoNV6UFUGqxch0Gv1DkNKvqj96MIWDiLw
 PjyUJoOYOdeRLsk7h6NaTspcV7mIuqccE5kR3XBp3A==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr30307185ywb.10.1654591799547; Tue, 07
 Jun 2022 01:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-35-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:49:49 +0100
Message-ID: <CAFEAcA-DFxys7UnnrJuMrwKmDocKr3qWR-FK+DRER=2j=mvKKA@mail.gmail.com>
Subject: Re: [PATCH 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4JgJsmgjK089

On Thu, 2 Jun 2022 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_default_vec_len,
> and take the pointer to default_vq from opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
