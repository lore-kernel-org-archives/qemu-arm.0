Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4270868lfa;
        Tue, 8 Jun 2021 03:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwD4PvHkcfeFw7Ko8A5VLUWUzuil6r4M3VIiX7tmCuT+XrTQ+5zgXApOSnJl/TFnHpXs75
X-Received: by 2002:a67:70c7:: with SMTP id l190mr3732177vsc.40.1623146624474;
        Tue, 08 Jun 2021 03:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623146624; cv=none;
        d=google.com; s=arc-20160816;
        b=jDwZ33iaoOYl9bmItFocUx69QFHUUcWzDjtyixODVmjX3rb24sWTvtDpeiOYOD+Cd2
         lcIqz6KaPcoob0NbunpRNQpeBWA7Dpvs0VZAWnIFVVw5yCGMuua1sX84q5X9K5zJtw6s
         mAqQ/XNI1kT84BEfqdUDTLePeL/NZfmCzPJqc4zqjguuLzJTlZbRmNKakPKJdZViGkh8
         dTcFoqqyzpkB/Yz88ZbFu3YjF63eThpdQrJlVx9SS1iE/jzuAnwI7g57BgCxzwrXX5Tp
         eB92SHxrM+qXOwX/fe9fBBPXBtzk1XbTfNgqPiIt2eVYul+9dCgYjdZKL6HB9MKvlAWu
         HNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fAK72jQWfvbsBPebqRLDxZshnWftBCmkAJFK//pLDOs=;
        b=qqVWDLoZ5H+jHEDN+/j0ak9iEE/SrT4XfNY+Y0Kr2IMG83VtXYpTBF+udsf2SPWDwY
         8cOR5UgCv/RKnGuaHav6OZ7rJxCSKEEQJRAsOWFI0PbKnIcBGiTKYKUPYJq9D7TtEGE6
         vux8g9mVhg0470gNcvvw5LTT4fA8uzd/GMIvnHTjWIFwrnGX6q+JOTCsoABvUSJsheGe
         yFsj8+xseRft3JfeOpKSsNj88lp/0yMgQ6foVjgh+IXvJ+4BGx4+uDmDgpxFANtsd0Wo
         uzpVwgqhh3CBBQk/l384Ji4DUYX20W3fFVCstzpL1Q4UJtzr8ifGjoccJA1hwZDnH107
         icKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MMS4LvU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si1916391vso.149.2021.06.08.03.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 03:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MMS4LvU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqYaF-0001Eg-G3
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 06:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYa6-0001Cx-Hq
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:03:34 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYa4-0007o1-Sx
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 06:03:34 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t3so23845321edc.7
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fAK72jQWfvbsBPebqRLDxZshnWftBCmkAJFK//pLDOs=;
 b=MMS4LvU3GfiYpykcgTlH24GLc+5IUNl72PRoVnTFfozRbLnZrbkg6VFlVse6wA/Xc+
 LQxzcMiSizBpTxM/AEHaZFOjz4Mqve6+sW79on2IryOksenEiJBNE4RBnGh3/TWk2wa0
 +ZLe1E+oiGy/PV2Tkn2AfJRHKI2vCOUe4/cKnT46OwNttXPdjlHJFTXw1M19NLCbvx+D
 P1XzdkT7VZs0mOSiW+0ZwdfB7IKnwf5u/jTWFW2N0edHSN6GROJNgJY2qj/rd639Mt4p
 r/9hNEGu+hnX5wPHIOLmmK7mYd7Yj8g4/j0auXBp3IP4hkT01Zcz4RJkdOFnnI48sarP
 xv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAK72jQWfvbsBPebqRLDxZshnWftBCmkAJFK//pLDOs=;
 b=i/K/80TG/M5Ypb8UlTK80NQpOuSg2Jt5YBy+3yDIHcGMkkNhjMHbod1Kn+eksD0MLu
 izIA/WMM+jNUuChnbWfSSEDXGu83ASajlvoG2CtbnLzxxW3Y5eUiVf+2Yh1qFrTG7Jev
 GECZ0IP35fDsRsaIOuYxM2pBkp1k7VHfnuz1MlEREIjSzIWUD27brdLgPdgrGTekJH7T
 jaCFHcSONkyblccDkxzyALcQcF01VGdgnXmcY6DIvouLycAzZbgD8kXei9fKyiIet7os
 kv7N0oCk7TIKoUeKT0XtX/xdg/E4ZVQyFzUCBBJG+EjIo3t8sJRnZDsuzepXOX9POX7G
 uKFw==
X-Gm-Message-State: AOAM53397EEFKHR84aCsr65oJro7eKxKQnoOwzuCyWhixWjSgYNfL6QH
 zPn+dU+Os2yOJda+aQBSwrWNAmIeAxLy2Prt3/ysVw==
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr24416453edu.52.1623146611697; 
 Tue, 08 Jun 2021 03:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-2-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-2-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:02:58 +0100
Message-ID: <CAFEAcA80dnOL4CmNO6wPa9FyrojcyRZPuy-3zLuOYDdf4xNvDw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZElQaVCeOS0r

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 240 +++++++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |   8 +-
>  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
>  hw/intc/gicv3_internal.h               |  88 +++++++--
>  hw/intc/meson.build                    |   1 +
>  include/hw/intc/arm_gicv3_its_common.h |   9 +-
>  6 files changed, 331 insertions(+), 17 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c> @@ -129,7 +132,6 @@ static void gicv3_its_common_reset(DeviceState *dev)

>      s->cbaser = 0;
>      s->cwriter = 0;
>      s->creadr = 0;
> -    s->iidr = 0;

You don't need to delete this -- leave it for the benefit of the KVM code.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
