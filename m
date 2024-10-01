Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp204204njl;
        Tue, 1 Oct 2024 07:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh+29N3xzH6ZQgqlIysRo8lu0ZXZsSwWU0nBn6crVsxuVref0t+tfsPD6i+T9WMMzerSEyKkv9lKGgkg==@linaro.org
X-Google-Smtp-Source: AGHT+IH3DKlHQBt2HJs8l9PImooZW46lp5twnkkoUF6fKXQPIo8W5+XQ3Qz7vVuW3KNWUSiaKoLM
X-Received: by 2002:a05:620a:242:b0:7a9:db7d:11f5 with SMTP id af79cd13be357-7ae3783ab2amr2010615785a.25.1727791646406;
        Tue, 01 Oct 2024 07:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727791646; cv=none;
        d=google.com; s=arc-20240605;
        b=HR/O5b+O/RTyYpuHaBi/uEg8pRbJdZMrt3CvOJ5u0djiTkHlBvXknYQ9D7R5deQUy4
         VEACdyavUnaSkVAlxngbM5puBaUqCXuAwnZP+NLqHDiecEVPO1NQtRoSOtjzcnYNvEWl
         wifCgE1qZZffJDt36kNlXtG1+lw7wwpAIK3NGUaxtLvUFH1/0yLekACX+SLCU6mN/r7d
         eHmvvw1QbbAM1lZyUo+aPjq/tseNJJIy9/uUKewZuc1y86p1hgd7cg7rICyYse6/qhKN
         9GEo5It6kkY2ZjCNZi4umP3Cy7stTeeFud9wtvfhefB7PKva/JQiVpI2uBdixpeNDrhs
         xKsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpW4yH467d0379s5Vgwk5GAfGeKWVP/pynA3yjAnFWQ=;
        fh=I5xCVkKIL8fBAIe9sMcxf3+wX3GFMqkjNIVxp/cY9lk=;
        b=dclWgPbOA/8T1MjFOlMFq4D+/OkTc4qHJDEQ8+k6gSLM/I9/0Hn5vPDcJvyQc5krz1
         0BwyiMUrCZ62sU3Z09FeSzrgPmOj2hWa0OuUwp55B5oZF6zopK7HWtcoHpOCBP5E2gpU
         hK1kp5wm1fsZMJy2mtDHnaw7JYyKLcmv4GWacaNFgxts3hXW0TyuVAGMBSiBJMdcFEvF
         58T41QUJO0tW932Dk78cx66GFGYZnnboF5bGiWLtVF60s46cKFi8NzbSwCWrykKNz7eQ
         xlvIdMf7/zA+qyOIFgblnXov0kpHtZGdE4uJsBJopwFeZrt5g6BqgH1aXJHLygUGxpkF
         01rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqPEPx+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84f0786da10si350062241.147.2024.10.01.07.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YqPEPx+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdWV-0003Fx-Nz; Tue, 01 Oct 2024 10:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svdWT-00033Z-Kp
 for qemu-arm@nongnu.org; Tue, 01 Oct 2024 10:06:42 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svdW6-00018w-6N
 for qemu-arm@nongnu.org; Tue, 01 Oct 2024 10:06:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c87ab540b3so8526272a12.1
 for <qemu-arm@nongnu.org>; Tue, 01 Oct 2024 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727791572; x=1728396372; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UpW4yH467d0379s5Vgwk5GAfGeKWVP/pynA3yjAnFWQ=;
 b=YqPEPx+oiyXGR3QZlZ9ZNi9jWgR9W0aRORGIbulgI19KGWS1eucif+b1xkwngZtxR3
 XSeiadB+o6nScVOiBvNcawfA4bgz2owvs40oCKfIgUCA/vN+v9LnY8LmgH8qRd4+GX3K
 PaxhtvCaBdLvdPrKg2flV7T0Y5wYkB+NrCaysONsb9Z9rx/t/HtL+YRyb2g87pxThHYH
 Gcnn3ElnEQ54q21wryzE0lIU1gfyFh/kTbZZaSoeP0iKHje1/+MgV8SlzpZNhn7KuGfs
 lwSRYlgkVhah9J2pOifWMRWt51xxvacwj2Ef//XOsctof+hOkaNkY5lVRi/UK+u1LhHU
 lXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727791572; x=1728396372;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UpW4yH467d0379s5Vgwk5GAfGeKWVP/pynA3yjAnFWQ=;
 b=b+nlnQhWMFtdz/96enuE3etEtY9NSCLFdv4cUdhopftbQ96hgt3P0Bgt2tMNd6Limb
 eFGahZx/odm4iyA30wRPtYWRFyoMWAbidiUzNKtgmEDREFpOkR6kHIgC+64nRCCVYCQY
 b5h0BFdAyI0qeaTE83U81IK9UsNzYcSWYfOK8N9K0DeW1AU+8fG9vaHRjzugGJOOENG5
 p34wqUF7jPAYO4iGqhHTDWYb4EsO4+Zepq2su0Y0L6yixrixGGZVqXbrvUHi2dY+bZf+
 laA3aOIbwxLO/lAXXDGfuAeZMPMmvlgLXpyjBQ0fDWHEsShEEuvHYz+oCzAxmpP0eQOz
 sgYA==
X-Gm-Message-State: AOJu0YwW8v/WCmkjfl1qA9gCNmuGG8g6xBI4dDB66jgw7fNgRdywzoFR
 IFB7dLU4jpJge9YlLstgxws8dpbP41B40zAgIOYx1scdZ9ml8Dpso+uK0Y/pffNyWmygBlUGJTg
 OYDohFB7gsRabhiGWBC26lifni0Yslw76LjMgvISgC63xOi+K
X-Received: by 2002:a05:6402:2550:b0:5c4:2d5d:b25f with SMTP id
 4fb4d7f45d1cf-5c8a2a4d72cmr3213218a12.13.1727787882522; Tue, 01 Oct 2024
 06:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <CAFEAcA9hH6b72pVMAVkGHWXye9t+RXHE13RD73AabQN+p_JOyw@mail.gmail.com>
In-Reply-To: <CAFEAcA9hH6b72pVMAVkGHWXye9t+RXHE13RD73AabQN+p_JOyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Oct 2024 14:04:31 +0100
Message-ID: <CAFEAcA9P+Eu+aFag1vpXTzevLDBuUk8zXd=kZVeYHbnvEL=80g@mail.gmail.com>
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O9tym9szJjOa

On Mon, 16 Sept 2024 at 11:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 3 Sept 2024 at 17:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This patchset removes the various Arm machines which we deprecated
> > for the 9.0 release and are therefore allowed to remove for the 9.2
> > release:
> >  akita, borzoi, cheetah, connex, mainstone, n800, n810,
> >  spitz, terrier, tosa, verdex, z2
> > We get to drop over 30,000 lines of unmaintained code. So it's
> > a big patchset but it's almost all deletions.
>
> Hi -- ping for review on at least patches 06, 08, 18:
>
> >   hw/display: Remove tc6393xb device
> >   hw/arm: Remove 'cheetah' machine
> >   hw/display: Remove pxa2xx_lcd.c
>
> These are all straightforward removals of either
> deprecated machines or devices that are definitely
> exclusively used by those machines. That would be
> enough for me to get the bulk of the uncontroversial
> reviewed parts of this series upstream. I can then
> roll a much smaller v2 with the parts still under
> discussion.
>
> Patches 22, 26 would also be helpful but they're a
> bit further down the patchstack so less critical:
>
> >   hw/arm: Remove pxa2xx_pic
> >   hw/misc: Remove cbus

In the absence of further review I'm taking these patches
anyway; they're only removals, so not complex stuff that
benefits from close review, and this patchset is too big to be
sat unapplied for long.

thanks
-- PMM
