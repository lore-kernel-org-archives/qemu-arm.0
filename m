Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp992339lfp;
        Thu, 16 Sep 2021 03:39:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+2j2vluzxqw4aVoEULZCxgS+GVvfhb4RJk8caU+0pC6ajMLMK7sSfEAYvcL43lrHMnsJn
X-Received: by 2002:a25:248e:: with SMTP id k136mr5858422ybk.124.1631788772403;
        Thu, 16 Sep 2021 03:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631788772; cv=none;
        d=google.com; s=arc-20160816;
        b=XWNgW+bhQxbNbMPUGPr7zZikEJin4wrRQ/Ol0TowXNMIxm0eIDd4EzYFJoN/3C9gj2
         s46bhPZ4Vh3lxJW+s6OHv9UNZvE7dmrkQwzCVybfTuIwVCJD4GlDM9lhxi2VB7nIc0vr
         znp1T2pv3BQJ6Vh7VXMbqMgsI+uEtAA9HZI9bsxnCv0Xo62oo7bCPEGAEnbizvXm3zER
         1w8ZULbTai03IW7X6Gws+ivVzZPyqXVJ4XmKQM2JWnyo32RxBo8thfavc7DINrKppEjQ
         VrCysaygv5xUGtfdObjvAXS0pu0t1TF2T6HLqLO9L+P/0KP2rd8T5sO0q6If88bTYJd8
         i9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=18tov8lxig1W/4IbzowEAKpdg1k4hEvHZZQ8quLi2qg=;
        b=Jf79zMbLN5aJ1R22IW6uUoOGdQvbzSReCIm/NTQVdVnPVdGN2K3zwzMTm2QibFJPcg
         y7UeXQLVvIfuWuQGuQLZAy5v8VgCt3/ric5kQZJayG1LohIP24vFwLYqaOPshEXsoX1Q
         elPJrdG5M2O76fGuYKE6xyAAdHEEY4EZaMXcyB5IJ3eXdN8/hCdgQJ1teDbxppf4zs16
         90xV9liTt28CdXFLzqr0gka1os4CEBwO49k2v+KV+Dc5g+ZfQtl3SAnTGrqQ9OIZ1hGi
         wd0wynWLaioiMejcuqrAnZrLQGOgsqO3F/zGVV0CfGNZjxfnORwLyN1f6pNcMLKidJjm
         z/zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qn4+7Ac0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si3245873ybq.478.2021.09.16.03.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 03:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qn4+7Ac0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQonj-0002ui-QA
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 06:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQonV-0002r2-Jx
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 06:39:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQonR-00056o-Rf
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 06:39:16 -0400
Received: by mail-wm1-x331.google.com with SMTP id 70so1517892wme.5
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18tov8lxig1W/4IbzowEAKpdg1k4hEvHZZQ8quLi2qg=;
 b=qn4+7Ac0PwLF/Q99q0G55mKJemAU02U4Ojl5WuYPJhCvXxAfeqCzwZfXsliYLFr2eV
 1vnAgAaoctEcJkQGSEW0d/8UbNHa9/RLC2F8ZyVj9O2N1thviTOKZ+jHT/VeFit9AQ42
 kQPZgLCTUwuUTVtHJmJ8Qetb2sNYIie3K8ViYOh7DEeqS6NvcKGPTVw2nccz+kVmYWG1
 7gyonOFFcPtWeaN+6Igpgtnw2TV6hy5ZHpyQBl1lcDYoV7ZU5g6TL9Z8mIar0hYelpwq
 8i9VD/J1gOfvDtpUimX4ptN8Q2lrgyMO5+en2FlrY6+mP6C0pVxT2mTGKrOuL4x/74Mo
 99oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18tov8lxig1W/4IbzowEAKpdg1k4hEvHZZQ8quLi2qg=;
 b=0d/XoAuO9dYXTpgG61u50cCkT8KCf4P8Yjh1fSnCl2K7B5bkY7RbtyJlgliIRjeGbA
 4IKkJAvMS1DL/ZJp338g39XcPciwMJYmiA7mXrmHSIRe/Kv4IKrI1O1t4nyFJJ1eFaEq
 YUzA1jXOdyiuUMkIJfsX+1d3P1Sab/NHCjIYUB9sQm0/R7nQDIwapuMY92H5/Jdrip2j
 5jl96DqvJdcVCW7J1JwKc/HrlotstyaTlyuSGctBJrmMZPBXS4XH7bsFD8zkBFDn3Cpa
 DATx/ka08tFBn8sWTSiowt3bYAh49/c6T69SRFK0LfGWa9P9VG1j8fKKS5E2deF+ZDYf
 48TA==
X-Gm-Message-State: AOAM530RABqDjaaPSLcxJSKpbQr2QT412jRgj8S5gahW+J1mvozNA9Di
 zIwvsKkzf9+1W0GLCDSAanb8wpjanPiPz7/ydkbN+g==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr9212102wmo.21.1631788752276; 
 Thu, 16 Sep 2021 03:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-2-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:38:21 +0100
Message-ID: <CAFEAcA_4N0xp=NVbGpHMSYpOrw9fm2NVZTBk4X+Ly8dc0xBKOA@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] arm: Move PMC register definitions to cpu.h
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EAdeCrNIh77L

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We will need PMC register definitions in accel specific code later.
> Move all constant definitions to common arm headers so we can reuse
> them.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Subject should say internals.h.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

PS: your mail server has been sending me delivery failure
messages because it seems to be subscribed to a blocklist
that has blocked one of gmail's outgoing mail servers:

554 5.7.1 Service unavailable; Client host [209.85.128.51] blocked
using dnsbl.sorbs.net; Currently Sending Spam See:
http://www.sorbs.net/lookup.shtml?209.85.128.51

-- PMM
