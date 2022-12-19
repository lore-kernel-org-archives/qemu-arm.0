Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3841331ejb;
        Mon, 19 Dec 2022 14:04:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstuxJ4Fx4+09VnMfxOjrfpS0H8VoBz+CgbnpxMnvg1JnPbuWIWpKZnR+7FY34TUh0/u6WF
X-Received: by 2002:ad4:5290:0:b0:4c6:f83c:473e with SMTP id v16-20020ad45290000000b004c6f83c473emr11517666qvr.23.1671487465917;
        Mon, 19 Dec 2022 14:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671487465; cv=none;
        d=google.com; s=arc-20160816;
        b=DNTzglLyzCh0jhGXso1YEPkq6jtwapPgmGRYUpd7IqS2IXFW8Y2xMWXlaB5XRhD14d
         7VUPT73BbfMBYZqzPUlN7FF+9Y/6ZxyVsV2DwPTSeaQEZ0GgdLV2TA6ERA9qLg53b+f/
         45JztHA+TcUIxNXifuDjX9nuUfsDE2rCT7jpHXbrSWBGRgCrxDDH3cMGl6saooaj9vCA
         gnoBVnt0pioM7YWLn+CDWCVBiRuWWlq8es6YQQP9MN7bf1Bf9x6S+s8wxpr2WDyyasPq
         fnxkqh8/s3bpsurnjjcsboHidM6IT0CDwBXFc8to0m+rJydhI8OH9hxTMRXCBl2kpqZh
         z4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oDd2pV9RxAbkQqb3MwkVHArSjm0z788FK43lTqN2cPM=;
        b=TTLkFSZKiWdkVejYDtkmE4RQtARihXM6VrvuUHrodafMh46dK3fp7vTXsSxb8PtxoJ
         x6RrWCzwQIGqcAeJu7uilRsQNi5DdmbKUGVpCXGgmSIjsrX4Kq+alGGpwzGdLEIAJWTs
         ePsVc3efquORCNgESW7wD7XsTM4m3pX5tA4oNMDQtookUkqN/OC0LLh3sySGA5E8fmXf
         HyxLOm2SwBm2X4h3IETmR6JgXU6nuyonkGdx2ZfrFXqFV45b4FmyFC2sY4nGv0eubnD0
         noZjpP3BMJOaQHQLOO2p0kZh+VC0cSsKPzgGn41J3ywvIURfgnl2F9WNvfYUfvhnLEha
         6/wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYPhaxEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn12-20020ad45d6c000000b004c76393fc01si4489138qvb.108.2022.12.19.14.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 14:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYPhaxEG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7OF2-00059c-RL; Mon, 19 Dec 2022 17:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p7OEv-00058s-OC; Mon, 19 Dec 2022 17:04:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p7OEt-0002rt-WA; Mon, 19 Dec 2022 17:04:05 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n20so25041536ejh.0;
 Mon, 19 Dec 2022 14:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDd2pV9RxAbkQqb3MwkVHArSjm0z788FK43lTqN2cPM=;
 b=UYPhaxEGu9rNfoNYnEg9LbPJnmPgW7HAKoJir7gk08NjdMvfvGoiXPaRgRz5zVkoC6
 OxbgGF/8+xB9wQybm+wfef9cuxxSSkonw8xfA1p/wE/rS3o/Z4ykMufM95DeE0IohOxw
 vS7snLHvS0NjU3WG+CHssjMX3SFAuTNIumilx9yrhvBFwX8TxaCpoM6Cyfe0EM7mgsBQ
 /xWg4HvjJ8zzv1wINXoprVoYFNdNkfQFeWh2SpXJimzVQQvhVqSyt+Tmf9nFAbSldLgS
 IjAtBfQJgUOEXK6M3JorkdAPyDmT11iukihIaT6VjFN/fyLaBQh89ryRKDOHRXPZ1J4R
 y/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDd2pV9RxAbkQqb3MwkVHArSjm0z788FK43lTqN2cPM=;
 b=CeyjnrLYC8aE58G7d7CMBaoj8tdNznme8C1HtPYVZL5gBw4vyYqqm4tO2FwXz0m7/q
 jWgwWbN5fsxKuMcy/6Ust2LjoVyzG1QVFkSheFyTfWTbN4nvLwXKWqzR2EzoJK6gK8+L
 j9DYsbnZB6mQo43r06EDu8EACv0X49sgSfc8yCtu6NMyfLTRpBt/x+/3Iec2eMaVTIJS
 8FAJ/TA9pmq30qzAdkuWMykZ8TyfExvSjUYiO/IaC5rnRbZ98APrtLf+AuNPUCWt6Svo
 aiT/YCZgWkzrc+Hnw1jo/FdbcBzvf7yXzBphbElOVYT+EKzBbmi1pO8HlvG5c6aPp/xg
 owKw==
X-Gm-Message-State: ANoB5plERVbhTrQnyyCizIUP1juCUsuOHtJRNomwd5R2IDFNDI3cO/Bk
 Fquti2z9nzXyuWt3OVhXbY2bwZLAHNPV0VOxroY=
X-Received: by 2002:a17:907:c281:b0:7c1:8a0b:f915 with SMTP id
 tk1-20020a170907c28100b007c18a0bf915mr2104391ejc.42.1671487441052; Mon, 19
 Dec 2022 14:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
 <CABtshVRUevNjOucUwtKW-sccUAADRe-9JBbYHd8UMGf0YPJXSw@mail.gmail.com>
 <CABtshVSY+UxMEfh_=NCw9ws0VrEnjkgzoMspg4wfG9Jr_ZZc=w@mail.gmail.com>
 <11d8c4e0-c516-ed28-2df3-d613111ad53c@linaro.org>
In-Reply-To: <11d8c4e0-c516-ed28-2df3-d613111ad53c@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 19 Dec 2022 23:03:49 +0100
Message-ID: <CABtshVRyAJjgbBD9Non0Tm=SsQtJejYm-3C5m4ACK5jtd8Rmcg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: huaMK+WoRyLk

Hi,

On Mon, Dec 19, 2022 at 8:11 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 23:57, Strahinja Jankovic wrote:
> > Hi,
> >
> > I just looked around a bit more. Would OpenWrt image be acceptable?
>
> Sure.
>
> > It looks like there are releases for cubieboard that are kept for a
> > longer time, and I just checked that they work properly, so I could
> > add them to the acceptance test.
> >
> > Best regards,
> > Strahinja
> >
> > On Sun, Dec 18, 2022 at 11:34 PM Strahinja Jankovic
> > <strahinjapjankovic@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >>
> >> On Sun, Dec 18, 2022 at 11:17 PM Philippe Mathieu-Daud=C3=A9
> >> <philmd@linaro.org> wrote:
> >>>
> >>> On 18/12/22 22:19, Strahinja Jankovic wrote:
> >>>> This patch series adds missing Allwinner A10 modules needed for
> >>>> successful SPL boot:
> >>>> - Clock controller module
> >>>> - DRAM controller
> >>>> - I2C0 controller (added also for Allwinner H3 since it is the same)
> >>>> - AXP-209 connected to I2C0 bus
> >>>>
> >>>> It also updates Allwinner A10 emulation so SPL is copied from attach=
ed
> >>>> SD card if `-kernel` parameter is not passed when starting QEMU
> >>>> (approach adapted from Allwinner H3 implementation).
> >>>>
> >>>> Boot from SD card has been tested with Cubieboard Armbian SD card im=
age and custom
> >>>> Yocto image built for Cubieboard.
> >>>> Example usage for Armbian image:
> >>>> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk=
_Cubieboard_kinetic_edge_6.0.7.img
> >>>
> >>> As a follow-up, could you add a test similar to
> >>> test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.=
py?
> >>>
> >>> This test could be refactored as do_test_arm_allwinner_armbian(), cal=
led
> >>> for orangepi and cubieboard with the corresponding url / hash.
> >>
> >> I was planning to do it (I already have a patch for cubieboard), but
> >> there is a problem with finding a stable-enough image for cubieboard
> >> for automated testing.
> >> Unfortunately, Cubieboard does not have supported Armbian images as
> >> OrangePi-PC has (it only has weekly builds).
>
> Developers shouldn't worry about that but focus on the testing. The
> QEMU project doesn't have dedicated sysadmin / storage, but if it had
> it should be their problem, not yours. Meanwhile such a test is still
> useful. Artifacts come with their hash, so can be uploaded elsewhere
> later.
>
> >> From the images that can
> >> be found on archive.armbian.com, there is only one bionic image
> >> (21.02) and it won't boot because it hangs due to the musb issue (I
> >> tried both with my patches and without, by extracting
> >> kernel/dtb/initrd).
>
> Similar approach:
> https://lore.kernel.org/qemu-devel/20201018205551.1537927-4-f4bug@amsat.o=
rg/
>
> >> Other images are focal, but for some reason, in
> >> those images it is impossible to interrupt U-Boot (tested with 21.08),
> >> so I could not append to bootcmd to make boot process more verbose and
> >> easier to monitor for automated testing.
> >>
> >> That is why, for now, I would suggest not updating the SPL/SD boot
> >> test for Cubieboard.
>
> Niek can tell how many times his tests catched regressions for his
> OrangePi machine; I remember at least 3 occasions :)

Thanks for the suggestions, I will add the SPL boot test and use
OpenWrt image for it.

Best regards,
Strahinja

>
> Regards,
>
> Phil.
