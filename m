Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2973935ejb;
        Tue, 1 Aug 2023 09:03:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFlUXhjeQ4/oOml9ENXNvKraj/fX7gnlS8YsBCuvhuRudb7w9pyriaj8ZLM2FkFzzbRZujl
X-Received: by 2002:a05:6214:4c0f:b0:63c:ea91:6581 with SMTP id qh15-20020a0562144c0f00b0063cea916581mr12556782qvb.21.1690905780919;
        Tue, 01 Aug 2023 09:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690905780; cv=none;
        d=google.com; s=arc-20160816;
        b=Qc/WRMfwNFqKhNPEiQOuRtvPyDTExvtFLCfv7yLG17RPtlTydJZ+xN6Gzzv7c87syR
         o9wAhDCDEBjUCCa1I0ybfOmzl3IAz2LWmHI45RuQEdlb6MuMUGjR5VoEzfIUj3FRj/XA
         EoAZJuBhtaZs1XyzIzuVypube5HyCi4NMQ+Hlkf2vQIXOclerT+PNPcLuK9rL84AqxDs
         1PW3EHZirb6L/LeTZUx1gkVq5kd4cggf0U6ZwERr90yM8sihZ0BLyoUiGjfeoPt9EYJu
         WToT4/s2SBjX5jNRpPF8TzJdDfdOJNfPzKv52YOyTufT60hByOZ8WL4GSMdVxtdaJjYD
         In/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uHSqRcpiT02GTGeITNtnXVMmijcnbe/B+zmv+9E7TDA=;
        fh=BZXIkp1W3eSRs72GOdJFKaVeOSbIW3EN3AYu2JewLjQ=;
        b=V4bAQwiHKh9yfv0M19vZWcY/V4n5o87xSNgTDMmc/zwS9LHmZEbDwzFxqhr2zLGjnw
         IJIzww61uDgoNRVeNZMEbevqIaCsuOtyknFi6cwICLbFILE8Ma3RROLYAL1HqXZxzwdm
         p3E8zGeQM6duG6lEehraBUXkP4+Y2wOlJ8xFQyq6MH1YilhpTjiN22oteNG81qiA0t9X
         nsQBQO1evNmSmSZNwIIVfp+aExeZ7Gngc7c+1dB3m/HSevF+Ux/5zcHy02qZVLDiWViC
         GODQ4/45Ac9kJPmUyxzeWq7hvvr+CeOYt4DSGV2LaCAlzWqUbg5FMifTYZLOfOtGbExb
         DgBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cL+52DR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020a0ce24b000000b0063d2cea8723si7358087qvl.10.2023.08.01.09.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 09:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cL+52DR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQrp6-0008OJ-Sg; Tue, 01 Aug 2023 12:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQroF-0007fy-TX
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 12:01:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQroC-0004Uf-Mb
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 12:01:18 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52229f084beso8896729a12.2
 for <qemu-arm@nongnu.org>; Tue, 01 Aug 2023 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690905675; x=1691510475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uHSqRcpiT02GTGeITNtnXVMmijcnbe/B+zmv+9E7TDA=;
 b=cL+52DR25DTAZOR/t9BTofYZaSBMrN5BwC3FrqfrsqJCHWp0X4RDZHtmU7z4e0Uo4b
 mFZ9WHCnEQzFEhOYIEsOD+jag5hnRi5pNrD3d0BDbrTbK6+XSkC58xTVV7fIdUagNKao
 eJE/ZYgzjbPtpF4IfBp4E9oTJHABFzI5M+Z111Hmnyq7RvL+zdY3mr+xKsqZITH8WdrG
 mfFMh9dXxfL3Luw+GVBy6wDWbF0TezWt35lF35KeslYpwHLjYP074YYlK3Z4gu0EX7Ih
 MhvnTjt98tOgz2erNF8tmfSGTBsPjuBCZnVc9cVgibnkPB+CtARUky5Uu4l9GMkgZibF
 G89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690905675; x=1691510475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uHSqRcpiT02GTGeITNtnXVMmijcnbe/B+zmv+9E7TDA=;
 b=UU9yiBjXyvQcfiu+vgBeATcJ74yzbteNz4YcXlZ3XJrRuMFWjHdMEqVsepCBjUhB5F
 9g9vTKTATDe1+YsJQqtsXgUy8eM7yGse2OnOeWPB/KctLrdG3V1k0HMqyhMuBfBvmjGG
 V6bztRh9akdKYoxiUDnmsKvGOV5wslwqGfZDJHa8tpQDHyePERTpqznIrosKNcg6g20i
 yjPUstREVgbAgtqKt73Ti2gZ46lplpaAq5HCNHvMlWTh0NqJgVw4TXywmt6HTBj/Rzw4
 eDAPwhJpIvBOVAUgjcsRuajrau+hnS8TPlIjSKNsfNyh11ilP53P2wtql7eqgYK7hyJG
 K6rQ==
X-Gm-Message-State: ABy/qLbOfd4B7XwN+ehidah8tRMWBLYQShGhvjdDonBmlJTqt2EYp5Bh
 o9xW7fq19c2znW4UYCR0l5AnO7hewKkxV1FpeqWwJR8iwS9L96Lp
X-Received: by 2002:a05:6402:702:b0:522:ae79:3ede with SMTP id
 w2-20020a056402070200b00522ae793edemr2618952edx.11.1690905674975; Tue, 01 Aug
 2023 09:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <20230523100508.32564-2-qianfanguijin@163.com>
 <41e71eae-72ad-410d-9cd8-cc495c06dac4@roeck-us.net>
 <CAFEAcA8aEQWAap36CtHMrEkFQUPnDCH7=-X5+TE2GJ-qzm3Y9w@mail.gmail.com>
 <2044dc69-93de-d855-fe44-ee6f3ab3576b@roeck-us.net>
 <CAFEAcA8vtJNwbxBreDMFB6q-Z=G5FiOcWzAAz+F69A4-Er_4EA@mail.gmail.com>
 <a51c71c5-4c5e-8723-76f1-2cc9410f601b@roeck-us.net>
 <01087628-44c0-2b15-61bc-8677b7d1b459@roeck-us.net>
In-Reply-To: <01087628-44c0-2b15-61bc-8677b7d1b459@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Aug 2023 17:01:03 +0100
Message-ID: <CAFEAcA_mRY3bULpX0Qst--8XkDP9DYJqFbRBPgEpvEB1QnDr_A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] hw: arm: Add bananapi M2-Ultra and allwinner-r40
 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: flesYyEPoitX

On Sat, 24 Jun 2023 at 16:02, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/24/23 07:23, Guenter Roeck wrote:
> > On 6/24/23 03:40, Peter Maydell wrote:
> >> On Fri, 23 Jun 2023 at 20:33, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>
> >>> On 6/23/23 10:44, Peter Maydell wrote:
> >>>> On Sat, 17 Jun 2023 at 17:29, Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>> Main problem is that the SD card gets instantiated randomly to
> >>>>> mmc0, mmc1, or mmc2, making it all but impossible to specify a
> >>>>> root file system device. The non-instantiated cards are always
> >>>>> reported as non-removable, including mmc0. Example:
> >>>>>
> >>>>> mmc0: Failed to initialize a non-removable card
> >>>>
> >>>> Do you mean that QEMU randomly connects the SD card to
> >>>> a different MMC controller each time, or that Linux is
> >>>> randomly assigning mmc0 to a different MMC controller each
> >>>> time ?
> >>>>
> >>>
> >>> Good question. Given the workaround (fix ?) I suggested is
> >>> in the devicetree file, I would assume it is the latter. I suspect
> >>> that Linux assigns drive names based on hardware detection order,
> >>> and that this is not deterministic for some reason. It is odd
> >>> because I have never experienced that with any other emulation.
> >>
> >> Yeah, I don't really understand why it would be non-deterministic.
> >> But it does make it sound like the right thing is for the
> >> device tree file to explicitly say which MMC controller is
> >> which -- presumably you might get unlucky with the timing
> >> on real hardware too.
> >>
> >
> > Agreed, only someone with real hardware would have to confirm
> > that this is the case.
> >
>
> Actually, the reason is quite simple. In the Linux kernel:
>
> static struct platform_driver sunxi_mmc_driver = {
>          .driver = {
>                  .name   = "sunxi-mmc",
>                  .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>                                ^^^^^^^^^^^^^^^^^^^^^^^^^
>                  .of_match_table = sunxi_mmc_of_match,
>                  .pm = &sunxi_mmc_pm_ops,
>          },
>          .probe          = sunxi_mmc_probe,
>          .remove         = sunxi_mmc_remove,
> };
>
> All mmc devices instantiate at the same time, thus the
> device name association is random. If I drop the probe_type
> assignment, it becomes deterministic.
>
> On top of that, Linux does know which drives are removable
> from the devicetree file. However, since probe order is
> random, the assignment of the one removable drive to device
> names is random. Sometimes mmc0 shows up as removable,
> sometimes it is mmc1 or mmc2.
>
> So my conclusion is that qemu isn't doing anything wrong,
> it is all happening in the Linux kernel.

Hi Guenter -- do you know if this "random MMC controller"
issue has been fixed in Linux ? If so, we might be able
to update our test case image to avoid the slightly ugly
"root=b300" workaround at some point.

thanks
-- PMM
