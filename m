Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp394051lft;
        Fri, 24 Jun 2022 08:10:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uv7WKNaOfvnP7KUhSpmmbjeQ7fLLcX1M7CqJrafxCNOa7GoVNRWM2wMGCYDxJOEnRb6Fxi
X-Received: by 2002:ad4:5944:0:b0:470:4083:3962 with SMTP id eo4-20020ad45944000000b0047040833962mr22865250qvb.107.1656083404685;
        Fri, 24 Jun 2022 08:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083404; cv=none;
        d=google.com; s=arc-20160816;
        b=xdaVGv0e9cY0ymbmn42a/k2KbZi159DafkZYzJjmBq6LXo5GfXvMN2x7j/keZAozFR
         lbSGHWsyNQF99fxr8f9SHizEjMOPAGuuXyTgdwfQQlLXGp4GUL7thCK5xSuSYR5tqPvp
         aqJowUnn89+WpsLd+S+6kXpf94fkZPnlyilhwZdkN4eEsfU4SWRujT//VFIixn0ilcOi
         /vkGfnA2OQ75YgtsJmj9tTy46dKiqzXTTo4M183L5x8+RjyaCQ2wKLwWZaoJoct6aq9V
         n+fF3sf2iw5ayHpP2mS4sG7CnmRCyzjx27Ck20z600Sf+L/SVVJ1imQ+pjyU5jMq4gi3
         W33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oc4pclNhEFd3Zu03R/hG8/VwoJlClt84MNXR6oRyZUo=;
        b=psvNDu0JkuzMvFgdX5fcR/EwZEzfD9x39xJhpMvrtRDAtjrR51UIP3OUivrFSdKoac
         /ykB1CU6dTMGJvcrLGLbMLhqTd073nr872G2VxAjma/l19cvJdzgK8OxYAlXOiWTmFFd
         Eap7ChI1Ao114Z2joooYuVsemDCH+X3E7Vt2OyI+7HprjtonDAsV9lSn+6gGif/5zpoU
         35+FZhi5Q3hEb2A7KYIE4GBKdYv1EWW8Of9MmOmwmJiI6EgTpQrD4sR7LpdegJjacRqW
         pYn/jQtkNxrQ7R8MvJYkMi4kv+LC8u0RtZJKT5eejVOXCUz3OJ7ceSCOr/SWKpBavsKL
         pHvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aO8xa693;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a05622a048800b00304ff1f4d84si1765134qtx.492.2022.06.24.08.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aO8xa693;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kwe-0001Xw-4H
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kuR-0007MB-8o
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:07:47 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kuP-0003BF-Ld
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:07:46 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso27517087b3.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oc4pclNhEFd3Zu03R/hG8/VwoJlClt84MNXR6oRyZUo=;
 b=aO8xa693wdO05VpmK9/2VC/aAhgA2el0A8nWq+WT/3QAG+OQNd4uAVa29/FxE+JiJ8
 9Uo/srqktbtrbYNm+baaT/qD7Nns0hce8DPKx45qH0d/2Em8bDaa4tqP+7VW3WmuKCZB
 qV1nG5ZxG2sQWuwPbw7y3EC/XhvA3IzOx/Z4blXw+44B58vy1Z7U0YXwA/em7Q94Ue71
 xsZiDj9/lT40PlzZGFTgIoM9MyZaIGzgf9CWJMyb6VR070GyLnQKqVG3nMDdZEoiZlUz
 7B5IqCqIRugqwQQnOQEtuP+tTQmu6b6GG1/EJIr/Ic6ot6JgW5cCOV2C/rnyASNnvjMG
 D27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oc4pclNhEFd3Zu03R/hG8/VwoJlClt84MNXR6oRyZUo=;
 b=F74nWsOcgrVhwwtIuSr1RLoA6rGbVuhviRRTI/KOvUqd82VJlxbm/4rnumi3uwomPt
 AIaCIM4h6CklASoOPhOTCgOmNR80wUm3TDnMSpVM+JyhP/TJRzdsrm0SkNZT6CQXH+nk
 u596U+tTTAynKcG9eDgfT+BvZfsbmp4/Cy5URUMVLQOw+Do0MhUcBsTR9pedo2ZMJpqS
 /x0NDXI2+pgN9fN0YirV6x12VEr4eGSErR8N6dvTXVRSeKn0BIKZu6hqjb85UFga/LQU
 etywz2JzjEk0OntAirPo0MmioBOuoq1i14G/FIlZ6JXuHw5CKv6SmF1gubtQbelL42XY
 yXNQ==
X-Gm-Message-State: AJIora+6TRenR8pCe8C1ECw/Q+4TKWPhDEhZMFBG3S1rEs2pyYf33AP2
 loTHrWNugyhBdPRohdCoJiyQ73hsP2Nbm4w72+Ep6g==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr17477022ywd.64.1656083264039; Fri, 24
 Jun 2022 08:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-23-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-23-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:07:06 +0100
Message-ID: <CAFEAcA-1smdW57Ojp6ebxtee0i=ODO6NVsbZ1CX9+ypNcYt8pQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/54] pckbd: implement i8042_mmio_reset() for
 I8042_MMIO device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HsPsudoh6A38

On Fri, 24 Jun 2022 at 14:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the I8042_MMIO reset function to be registered directly within the
> DeviceClass rather than using qemu_register_reset() directly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>  hw/input/pckbd.c | 10 +++++++++-
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
