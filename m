Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp397240lft;
        Fri, 24 Jun 2022 08:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uuS6yw81hmxmNEi5D/OPJSVTN4Dyf1sS46x5ItTDJseh/DHnGxTa5ZxnQ/Wwy8JdFei7r+
X-Received: by 2002:ab0:7701:0:b0:37f:f40:3b39 with SMTP id z1-20020ab07701000000b0037f0f403b39mr8246733uaq.50.1656083666644;
        Fri, 24 Jun 2022 08:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083666; cv=none;
        d=google.com; s=arc-20160816;
        b=e+brqv4pIWy0dRE3smFBJaX1mB+tG4ECsI+S9NLvmwfuRu28QZbdSFER7NYOwKvJAn
         lIrOdzWgD9tF7q7JuaVQQpPQlMk05dcT2YwLeIsez4hSuLWW2YzoSWT+Q1TbtSOmBM9g
         heOPQ92F+TSlOnuq6vCHNF/D9UR2QGh2BIhP7CXlYTJ6pqFpekKOqQAtHLo1H0Zplm6/
         RQaP3VwW3fDDcnOHcP7a5f79w3vZlwaX0IPREy6ewdWxhQPiff8oi22BdEB7mRCsbWWP
         048Xndw3S7h6CpQZPz9PsUVzVTJFsFYnWtcsKTtHlMv5LWGHUrIa71uuF9YbZgset7BD
         nO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rNdTkCGtaBqWybng16571B9thp7pv/PBvk0H3wFvQjs=;
        b=bjrU9axOtllQEG4eDYpLcpj1jnaPHCyo2bJcv5kd+bd3iBH77FTH/zvqqL12/WHPWb
         +DmrSYY3UnMyL10X2shfcBa9w/r+biUG0A44mPsKJ186gMi9bwzREo41BRw4sADCUiiw
         zF1ceJH6Xl3ZFaXmAIN6DW+n6ZgDTGEtkkXLRhoBmetVLDK6oCsP096588MHAO5wE5me
         0VHSgaDdJGwe5O66QI2wEhOx6J+yHwqImmc5VFQl0RvZT9SH4BuX15QBOKABD/EPkdB8
         WqrwjU295eZnc8ornTFj5VjJxqYvx9qLcps8eBabI3n4Oes5foCZUgKJSzyEtnDOeyWd
         iKIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N42zIQ0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h69-20020a1f2148000000b0035e3f6b92b0si695429vkh.240.2022.06.24.08.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N42zIQ0I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4l0s-0003fj-1w
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kwV-0002d9-PQ
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:09:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:33621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kwT-0003Nq-B0
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:09:55 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-317710edb9dso28248637b3.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rNdTkCGtaBqWybng16571B9thp7pv/PBvk0H3wFvQjs=;
 b=N42zIQ0IHTQr7nSlyM4n24wGGmWE7C50pKIaIvK5y+/hTL9q7wBPgDwdSsTBsyMQ7R
 5M4psTMZGCL2U9Ij/KXUypt3dcZW/x7/aSIePlisz5tVxRqn+8k3vpD8lA1fV2GxlCtP
 AmGfEBGgr21yy2jrlvAK+Md4jE+XHncmtsqXd1sNi+BS5V3FsyU18kmloU6Ahsit1MO/
 9VgzvIkAZ3ROhC06v7cv2kQUGg+XSFgS+dcWDMCptU+gAVkzEgyS/Cu3A39BvMB8F7AQ
 Gjw37T7jRV9QsVCCq0lj09s+cw8JaUQa6zQRNcJZHgjdiow4NtDedNdCO4COzj4fyKEd
 cq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rNdTkCGtaBqWybng16571B9thp7pv/PBvk0H3wFvQjs=;
 b=cFUCNyb1qP4IGs1CjchckTJTwSHm2h66+BW0Vt8uPhOhfNpX04TdBItNTMN3+eTLVX
 15Z+y8WkV0y9f349n4rjhrWawGaZ6PDH39/lLJFh2JAz6ABso/jCuPAqMG97TAqMkKt6
 bxmjDyI2TByl3RaWpbqqMSQKe+rpRDqqmOdrbRKdjBwW8R99LOwIdTkz91lI983eYrPB
 p0xddNQ3xxS4m+PNliwI3pB46iIH4wB+VpoA+h0NXCvOieVpKDc5kOM1chRjsCBaAfZC
 dDErUFDZIUpu+cNnmV9D15nyzgo6RL8DvcJb44x2wVCZ/OiR9/fwl2Hi5A9kcSn5a0Tm
 clDg==
X-Gm-Message-State: AJIora9qdFj6mtIHZvWxeVmGMxxzYr3/veOuTT7P+i4fTkys+0DFwdk3
 q0zuI+Mh1yPJuI1jdJzBIV5oqAX9LsQKh03K1H6tdg==
X-Received: by 2002:a81:a047:0:b0:317:8761:14f8 with SMTP id
 x68-20020a81a047000000b00317876114f8mr18111603ywg.469.1656083392248; Fri, 24
 Jun 2022 08:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-45-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-45-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:09:14 +0100
Message-ID: <CAFEAcA-dz9vLBY9NiuB45k9mH8W9X9CER-bG89tdrSTp7qb5fw@mail.gmail.com>
Subject: Re: [PATCH v2 44/54] lasips2: add base property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: RRHsC5Jeb1R/

On Fri, 24 Jun 2022 at 14:43, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is in preparation for handling vmstate_register() within the device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>  hw/input/lasips2.c         | 17 ++++++++++++++++-
>  include/hw/input/lasips2.h |  1 +
>  2 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
