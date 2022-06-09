Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4094428qvs;
        Thu, 9 Jun 2022 06:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC8oxXl0JKCdSbSH9Ft72ALMYSoCI8po6FYRhuC9zEiKkkREeuVx6pdFrrqJ78ETY6SxFO
X-Received: by 2002:ad4:584c:0:b0:464:5904:998d with SMTP id de12-20020ad4584c000000b004645904998dmr40096103qvb.33.1654780682984;
        Thu, 09 Jun 2022 06:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780682; cv=none;
        d=google.com; s=arc-20160816;
        b=BObmiDQTjrPHdCHW9f1sJikXkCpSWSVT5rZtU93rut1ybXq9wLcMgi7DB+qkPKcrN1
         P6yWX1gOq8jwcsFygN46U7ev/Ze5eNq/pq0zHP6BYjYl7apaQ0nK/7El6s8DNViuWSOS
         GjhbpfjZIgLlHnDLaf6/a8w5RQaf6ik8IpWFoynN8vJl3A0FEjhLL4YolCGq6km4pO/4
         lNAkGk8PHNutF+mdLv0r/7gY3GMoHi3j8BXNG+IItkYBjuOBVE1ovic0vpIi0XfiQS1a
         geOMcCjNApQHPE1cShGTJo4xmY0HDduNS36Hl1iSI962Jl1BZoSLGbfJVSmBl/yUiq5q
         pQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YMRFURrrQxTa/wPA2d9gKTuLfzdKlF9ihL/79CT5nvY=;
        b=RvkcdtQNA4hLZo0WX5HKnv6UVhZxbIiVpa1fibrxpVmculCp6bGhoEtt4pXnckH63J
         FDFcn7Si5LJdjBBhVEAtCYLyM+02Ou7iA4KgQzmzxBRbRDe+9GrTdGikYjzKpxSAj6Bm
         r1XIHsnU3kVqslBbaYc4TUQFGsfQ097az5WU8udyTpEaww9xN1L9aGqlo44I4wPWRvO8
         ZWtGGyeQIeV+A0lWp3vdBZ7ss6/4DUh9CrFTAXXcB2BGRNsd+8Ql0jZc4v0OUNsgqeS9
         usAftF0ezuIcJD+m5DNp1COCwO4c86WtebfdXI8SrvnZGxaeeFV9wVWhmatWUbtfr3PF
         fSiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F2b6BzN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo3-20020a056214500300b004623d31df61si13367537qvb.235.2022.06.09.06.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F2b6BzN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI2z-0004vU-EA
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFvJ-00054H-KA
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:01:57 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFvE-0008KS-GF
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:01:57 -0400
Received: by mail-yb1-xb29.google.com with SMTP id k2so1782233ybj.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMRFURrrQxTa/wPA2d9gKTuLfzdKlF9ihL/79CT5nvY=;
 b=F2b6BzN+Hc0JIU2WbnuA87XsyjrKPFNJZDdFtPM4AUuYZ2HY5SzaoKR8HCFeEV20ka
 BFHI7eoiCmMmh7WMmIOBANZubbDkyRkW7XP+eIaRqC0Fi4QdMmIwVLiuk62aQq9eBBlP
 aJQg5Twg4U/y3OxCq7mNLfYA7T+hGZWVNxen1h7swm3oOzSygZ8MBgcNuavWiSyu15PB
 dbPVnkh9PgwtJDpgW0Cyc9u+31vl4vEEfssEbXSBUlA9C1GWnFI8m27FB1ovAYacFtl5
 XbrsD/YXjD8sbMSRCNcboMwHBp5ZSBDh0bE2h/hr9vIpYnCxkPbmPbTXdZLtDfwcZP44
 /h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMRFURrrQxTa/wPA2d9gKTuLfzdKlF9ihL/79CT5nvY=;
 b=rR8btWfyKrCPOGgP3oPr8Bk0WllR3j6U7TxT9PsDCjBuKwWtcDeEO36XVpruUr8i4V
 +phPTsxwkBsZXB5WH8IRAaZJYZS9bIcVIdFHgvj5fQuVVDEh/zfUi0TrSWF/Aye4PXsB
 S2LGb92AcSqSnCWmh6jCEEZ0crBGFn2B9NIAng0bEofglKihd15q6rqbSMVMDsmginVw
 XBBx9sQvckR8BPAzGVZPfSjOCONdtpOWHFhx2T3hQVl49y3SuRDRqCTmeAYyba4RcDOS
 PvLcG6P7rs4OzA9QPmuakCYjgRqgt+oFIG9+S8X7SufaLZ8e1Pghq5YoaihG+aeWhixj
 iqfg==
X-Gm-Message-State: AOAM531yitdZQ53XYZFVuNsHlmC1wlCNYr2VwIJ17ijlBqWnAaTl8YQE
 VNdbkdwpXQ90ZXIbMZH3NHND07WfuWH3qqvE/V+zDw==
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24920150ybt.288.1654772501175; Thu, 09
 Jun 2022 04:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-33-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-33-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:01:30 +0100
Message-ID: <CAFEAcA_v5cGxL1gKMa+o53a5HgENgqO9c=2AejHuZ=MocM1A8w@mail.gmail.com>
Subject: Re: [PATCH 32/50] ps2: use ps2_raise_irq() instead of calling
 update_irq() directly
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-TUID: jjaW+5dqT+mV

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This consolidates the logic of raising the PS2 IRQ into one single function.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/ps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
