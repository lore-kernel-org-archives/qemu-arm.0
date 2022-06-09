Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4097321qvs;
        Thu, 9 Jun 2022 06:21:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjPiwDWzPfUQjKCu27objc+i2dfbG1x1oMRDH+phfBf58VJ3/uXCMaeEYpX1JtPLpJZoFe
X-Received: by 2002:a05:6214:2422:b0:467:d777:7cda with SMTP id gy2-20020a056214242200b00467d7777cdamr26600467qvb.118.1654780919014;
        Thu, 09 Jun 2022 06:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780919; cv=none;
        d=google.com; s=arc-20160816;
        b=nl6I1W5Kt9pfWHT/oNvMUbULkr3kiONbgggRBd5ZcgaNXWtWVryYB4VXUg9BSK+67k
         PleCqO++t+oxKMRMYBnI/9kyWmeFOWbqXBD2yGHN8c8gsduJIjHu5/xfeFyZHCAr+9s3
         omWVTJpAIwVz++RicQYEJMsepsy771AxAcFUq2WMEcJYO93gQw8kJmkZvCx9ql+HzB1P
         5WEGCc1YxQjSa9r48Ac4Ev5lwv7/qaNWK2DJO+GY+5m53AnoIe9jHE+/Z83FZblVMy4q
         Afryz3skvL+tQnLOmsx7gGB9JKYX+sCz5050iJJpK1S6IzGjHNwJFkO1gs3WhU+Vvbod
         OQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=suAm6ZTDZIs9iFlfm6fgwQ/veDXUU3Qf3j53mLW/Los=;
        b=ytC1wOt575j2zdZ2gO3b2wga7BQ0dq+0KPP0ZX8e56aO1TLGXCtDGDG+nvvQafINDh
         gX+sPToZCvvlXSQEsdWdP4U8LGZ0DOQBS3U8NddxcZfvDl1QxKvkukjRGnZvPelDYvZP
         rKop+rTOO0P926O6hHVXz2wqTxZvJ9hzi9Y4pUwVDW/mSG4ycxT6IWeKw1GDIstnQGgU
         SD2O0DCMfQ6dpxivOqX3MtSGSTcjzfmwKnzLb5+V5IrcZJflMpj5FEoopR/O8aIh7Dmm
         WzUPC/v7pttmb9ZbvFlQPArPtn4eUWMPk+yhiEH+MnAhTpH2EqDAqzuUBg6bECn+ITIB
         pg3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOxTA92I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020ad45c48000000b0046bc5d570fdsi3887666qva.330.2022.06.09.06.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOxTA92I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI6o-0001V3-I7
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3d-0003JY-Un
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:10:35 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3Y-0001UZ-Jm
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:10:33 -0400
Received: by mail-yb1-xb30.google.com with SMTP id x187so13629531ybe.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suAm6ZTDZIs9iFlfm6fgwQ/veDXUU3Qf3j53mLW/Los=;
 b=kOxTA92INfef3OoCpuXHPDdjQwhwx2OBK8lYrQQJkFxDV6Jru5F+Y4OsJm5YJtWRlu
 WICMoEfcVcS+XOITBI50kF9Mtu88ReS7ucFYTQ7b3LRPIUhRL65ng3lXSXOVNgRXkxTj
 mVYWCB9NB911F5jMm4qXSM54srp1meEAvqTjn/TX3Qk8uMgq4lob4scas0b41sPFIwet
 DSod45QX+ZD5M3fYTznROx1PnTMQCbzFTlKE23LGwWJWWDURQeXFiaPR5lUrBqr84VvH
 6XE2MbRPTq+POsWjeduP7Jl1F72MPXqokEdq3XehPrXG/LGb9JcPV+j77P4Smprvs5wv
 cIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suAm6ZTDZIs9iFlfm6fgwQ/veDXUU3Qf3j53mLW/Los=;
 b=HKWSB8Tuslh9oATRs97j0XaILrXwgnvDq/QY/Y8zKMTvKyziUCds/5CoNTFQ8rMLjI
 Q7hekakki3zrElEtnCrZeGdBmUeE1XgScBbsabPx+/rWLEvSkuC6qsR8VLhb1r/IBUgY
 HqUWfRSvF0MMqdWp9F292Mq5hRzZ9npkmA/BzuRcM9fOXcqIJkwIH8Tn+KLMYquEo2kx
 YEyfOr5QupGsOstvcPf0G3kTocSWmH4HT1RLUcptw8EPzaNfq0eFmuQ24QBp/Y7zJkjH
 0nszAWTgy/HzHhVE/najl35c9h0sGKUqvaGEVneaTgAaK8KsD+GBK1ET58zQ3j42HYIZ
 ZrKQ==
X-Gm-Message-State: AOAM531/v1RWhKw7jenasSL09zOUcSsiU+RBhYpMVPHXxzcAZ8vfKHgU
 t1IFrZsjhiQ2EFkTd1NIy4Rz2Q3FCA58TeeKOQyb2w==
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr38713967ybp.479.1654773027239; Thu, 09
 Jun 2022 04:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-40-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-40-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:10:17 +0100
Message-ID: <CAFEAcA-cH-pE0yQw5Sa_UiSjLSKnkhS275YSLOPE4rvwA_M1ag@mail.gmail.com>
Subject: Re: [PATCH 39/50] lasips2: rename lasips2_init() to lasips2_initfn()
 and update it to return the LASIPS2 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: yFRJHRzh2gg2

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> When QOMifying a device it is typical to use _init() as the suffix for an
> instance_init function, however this name is already in use by the legacy LASIPS2
> wrapper function. Eventually the wrapper function will be removed, but for now
> rename it to lasips2_initfn() to avoid a naming collision.
>
> At the same time update lasips2_initfn() return the LASIPS2 device so that it
> can later be accessed using qdev APIs by the HPPA machine.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
