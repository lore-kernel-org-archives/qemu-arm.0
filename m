Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp976717njl;
        Mon, 16 Sep 2024 03:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXF4OfJlm4p3vDAv21gr9GGdkf6lTojFIb9ffg+YSLnmnPfOriVL/bHbhL8pstzFnMz+geKFG1KOeNlxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEm9rstzGwSfeY8IY4Oo/uUDLA+4EQwQtbSj49zHip1k7TtWoPI2+cJ/NV+Ek0Eo0VZpHA1
X-Received: by 2002:a05:6214:451f:b0:6c3:5457:46db with SMTP id 6a1803df08f44-6c57e136586mr201958516d6.44.1726482433110;
        Mon, 16 Sep 2024 03:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726482433; cv=none;
        d=google.com; s=arc-20240605;
        b=EI3tBPc2w0TSRDOgRTU4AuGsF7GcslfFsbUgvV5NWHXsoq6Hy+cvKuOqDZpK6o0Uw6
         FytJHNlAeCLiz/47CZOQUyhgVL2NspSA2kInpJ7iQqsYwiGK/SGe97Lw+1P2xFhII7cg
         M5aX6gt3b7NXKMtSBOspMXTIaY8LW0XKM0ilJw/4Wvl1RksvjAQwVoc9I4XUYPOT7OAU
         KTNQjUC065uozdtiCK3FtUAhyOlF4lN9TxW7BPA+/J84SCg4QW6Do4evQ9w6+nXdXLoH
         Evg85ptEc3Bmy6S755C4sxl36OcVF0Qxw1TkIlI9tQPswiBoB9iRodQ8ux8+hpmaNbsa
         zr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FhOcE6GLr7oBCg2qczBGYcYGD8YfMG8QvXwLqrVX/N4=;
        fh=I5x+dyeG/HLnSL5/+Z7O33DND+qZivLSe4y2ohH0DhM=;
        b=QU/Q3NEuKvaigVQXRgWps30E0Ceyp4E/earFTa4yqTz6OGz+F3P3Ojv1q00ZAxVOYS
         W3yA+mG+MYaG2F0K4kTGFOK41cF5QdtXXUEiA+lzpS/FURSdxnrbteee+sBPWbQES8N8
         0FZphr9JpIPRRGROusm4efwP4lkZi0I0/xLoBeXzOoo9/wMLlmZ/KmyGmaptO4Ty/XmX
         rwrKx0JJw5endDI89ph1AYb35xQbHxkoUFx5KrlymINh4g9bWDz6Jc2FmGj0uEeKSTVs
         rAc1a1QArSLJnDXz2T+oTqN9gpfTXJ+1I0Pe8k1J228AFHTZUxPnKry/9ucvCrrJZpa6
         308Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6d8FEA6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c7f2a1csi54189826d6.558.2024.09.16.03.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 03:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6d8FEA6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sq8wK-0006k5-UL; Mon, 16 Sep 2024 06:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sq8wJ-0006iH-DY
 for qemu-devel@nongnu.org; Mon, 16 Sep 2024 06:26:39 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sq8wH-0005r1-Up
 for qemu-devel@nongnu.org; Mon, 16 Sep 2024 06:26:39 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so3496468e87.3
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2024 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726482396; x=1727087196; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FhOcE6GLr7oBCg2qczBGYcYGD8YfMG8QvXwLqrVX/N4=;
 b=E6d8FEA6Uln2OH05eWhOF8LLcfT831Gfo6Gs3t9ucamgPPZE8yvfUHw+xO/kH55Saw
 epMejTRGmlMHbHhl0OM+2wVZ7fEeH/ikIJskg5O3671ZFzGj2By63vcBnkO859kqvIIz
 vaj6bhFMk6NWedPWkd+vvgI53HsvVWdCdj8xCVspjgHOJo20SQohmlyIWHwHC8OEZMTQ
 ufTgjuOQ706S6+noNftKEAPeV+qy35Pc0Y1DbowQTFuqqxC59yy2Lfc59EL0qTa1ob04
 XdjdeQ3ZRp1L6d5rYukr9gIkzhAk44BabO/KMHJUPlPrUzTbg9L327W+2eUqV0wLBi4P
 iOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726482396; x=1727087196;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhOcE6GLr7oBCg2qczBGYcYGD8YfMG8QvXwLqrVX/N4=;
 b=mPILhYicW9CkDf9a5Of6rU0l+gAF4BcCn9SRZO1BY48jG8w+H1myzTt7bUT0UVwJCj
 BozSEXLnHP6MnmoZT2GMKZqhTClq5APMGkt6HkJD6BxIG4Em0e8D1Jz/RYq1IuOkZT+H
 jyYaIypvtJ8EW+RlfcvMJBdEKxdNALij2DISjhbmGh5sFwi28H+BJlQyFB6VIZWMtRby
 4euVGYJNFwKd73l4LklsFOO5GPBuOGFVtNgORNWgtJpE9fQU16vwFcMiixxT+HL5fILO
 mNvNtZMukvotSLlMc3p5mdaZM6+5w7c6LJp9QBMGqQkIOi+UwEKb1Zp2xkAb4u/Uz5DQ
 ua8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg4FWHHf3UWrRFa2Ko5lfbblsJdoMmLR/8eRrysO3kFV79EmDXsy97qBZUysUoto2gAwshDO1ZiDnC@nongnu.org
X-Gm-Message-State: AOJu0YzEpeglJ21g/0i9GbxVxUpMzgzsCmxU4UwAcJ0s98cvjO4Ip1P+
 KAeA/6D2FIyz+pXC1Gn5u3ADBhB8Fxoy1SY8yWpiBGhalRZBd3aZWxXhk/61Mmb9gsJHSwCK7zY
 xu4FiMvfncdiuMJXLnizM+0gHZefJZsjzUfgmgQ==
X-Received: by 2002:a05:6512:12c8:b0:533:46cc:a71e with SMTP id
 2adb3069b0e04-53678fec522mr7479617e87.54.1726482395844; Mon, 16 Sep 2024
 03:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Sep 2024 11:26:25 +0100
Message-ID: <CAFEAcA9hH6b72pVMAVkGHWXye9t+RXHE13RD73AabQN+p_JOyw@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P/UTeOdiByDh

On Tue, 3 Sept 2024 at 17:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset removes the various Arm machines which we deprecated
> for the 9.0 release and are therefore allowed to remove for the 9.2
> release:
>  akita, borzoi, cheetah, connex, mainstone, n800, n810,
>  spitz, terrier, tosa, verdex, z2
> We get to drop over 30,000 lines of unmaintained code. So it's
> a big patchset but it's almost all deletions.

Hi -- ping for review on at least patches 06, 08, 18:

>   hw/display: Remove tc6393xb device
>   hw/arm: Remove 'cheetah' machine
>   hw/display: Remove pxa2xx_lcd.c

These are all straightforward removals of either
deprecated machines or devices that are definitely
exclusively used by those machines. That would be
enough for me to get the bulk of the uncontroversial
reviewed parts of this series upstream. I can then
roll a much smaller v2 with the parts still under
discussion.

Patches 22, 26 would also be helpful but they're a
bit further down the patchstack so less critical:

>   hw/arm: Remove pxa2xx_pic
>   hw/misc: Remove cbus

thanks
-- PMM
