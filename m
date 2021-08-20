Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1368867lfg;
        Fri, 20 Aug 2021 07:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJwLOpmkoT3WVaqneD0eJxPeBjnz9b2nwiFL6X8N2EBOcDrbk36uE/4a7qOcOMVM+oxehQ
X-Received: by 2002:a67:2d06:: with SMTP id t6mr17227124vst.47.1629470435406;
        Fri, 20 Aug 2021 07:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629470435; cv=none;
        d=google.com; s=arc-20160816;
        b=LoP1aSBh2hPAYs0NH58vzgkXhH9nAfjHxrXuRUUDbfXns5cWPFCT7XOsl+YbJSwZhf
         YtlyN7cXfvpUVE/VeWwkyjN3cgHDwishhgfPhGAYnOGhZ7oVC5mStcK78hogVDVODiV5
         vNGj9ffw/z03c7hgTT/nPiZT0Mrh7zDajQBOXox1m/3Li5qzqmzpq3X10y8pBHmNeozw
         brDEq5gEX4jBUL+lXonDjwcWbszEHZKD1+cImlYf63PzplHOPloSQwgNvvEpY3yfYU3c
         8oB4zge7q0BGszcVD7cl76uS3Yn//Wxp3lV40IbhnWfULOE1GjeAa66alcw71Ckup5aG
         By5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XL0kGlF8Zu3oZk5twTqrcPSdspZ9dYZrNRJFb3w6C2o=;
        b=cz/P0ByqIfIjvsS5/nivY0tvt7quh+Imosl7u44LoXt5N95YnOplvzvV7U0K5tP/s1
         ZOn7E3n/EaSA6nbjXeqazr57K/+Ha6vwv20ZhMOyHO10Ew77X/iU0lC3teIyndofyXxs
         CV4yhVdANv6ZZBmsOkxbkTD9RNEb6PO03KWcZVd9GttGWlpCTo9d2nkK3Pw0yDPeyzhp
         7/GHzq2iXfa5H7JjogkbBCQtM+oyHdkGqV9sOGP+8tQ+p/NMgeOYiX84wLod+Tc7DUuP
         S4UtwYFJxRvMwGwYbOlYnH87hpuDAHY63IjI2hJhanzGI6nrU3wi0ifuiVc8baWQjm2Q
         x1TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dKFkx60C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si1919147uav.74.2021.08.20.07.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 07:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dKFkx60C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH5hC-0005yN-OX
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 10:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH5gv-0005wZ-JL
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 10:40:17 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH5gu-0004kN-0G
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 10:40:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g21so14340681edw.4
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XL0kGlF8Zu3oZk5twTqrcPSdspZ9dYZrNRJFb3w6C2o=;
 b=dKFkx60CoKma27/XRTjLufJtOtx9tuaKKn/9juOC5NTEKgNSaql6QdFJALz5DBYWVZ
 zQ8bayrK2qmFrdPPZp041PSJRmhsXoV1TKQaBEhwgx7UxOcd1T49rzQzNbGFZgQ/Hn81
 jdPLvQ4NO6FqaTnYLrh8w17V3NxmBrxaHQ7V/LdDuFBVDO1blanURM4hmbodiL3R7A8v
 AuijoDJkNDPxfJEVjnBJYJgSt5cSq+bBkHr5YjtsUnttSeUJWfiK5AR4DQcJrv9LGETX
 LZwrGutvpRBIWkmRvjB0V33sXiXBPr+8TEkWBTGoimN5XHas3TgEgbpXgq+HKyfmPA68
 wBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XL0kGlF8Zu3oZk5twTqrcPSdspZ9dYZrNRJFb3w6C2o=;
 b=bg28CvWvWpYUn32Nts0M3+g26w+RLHLZXl3d616oMoulpiVPPpTE57gZZ1DqirYnCc
 j++NNwt2ZtNsXykHBTmdmaoOUykQaBmFMa6KNOgioq2dPlaWsAvs89WDKQDMl6Zu04do
 fHa+7wFkqcmPElmhmiwzyuP317gNKvxKNqtHwb4aXwQVaoMIB6u9iq3Eppc1fQHPeYIT
 /pm/2HRr7rLLvxuqMOZapUnykJMvEFeYb2vUAccJI5O+48zC5bQynzbbU5GQmTXpJhYo
 XqJLZubMFcRRpRSMXcPRc0ptriQqt0+X72UkZTZ1G0W8OlQEyTnh0AvIPsN5aU85VaPf
 chww==
X-Gm-Message-State: AOAM533etdSv0EIN6tHOQ11Caf4jOe53BIpF5mwbnit2S7kwmm41vcMn
 KtmojlfrPoyKxn7xhlBM2AcMccbneyxeI4OvCkngaQ==
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr22682493edb.52.1629470413853; 
 Fri, 20 Aug 2021 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
In-Reply-To: <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 15:39:27 +0100
Message-ID: <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lRAtAbhmPSXD

On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
>
> On 20.08.21 16:22, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> Hi Bin,
> >>
> >> On 8/20/21 4:04 PM, Bin Meng wrote:
> >>> Hi,
> >>>
> >>> The following command used to work on QEMU 4.2.0, but is now broken
> >>> with QEMU head.
> >>>
> >>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
> >>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> >>> allocate memory

> -m 40000000
>
> corresponds to 38 TB if I am not wrong. Is that really what you want?

Probably not, because the zynq board's init function does:

    if (machine->ram_size > 2 * GiB) {
        error_report("RAM size more than 2 GiB is not supported");
        exit(EXIT_FAILURE);
    }

It seems a bit daft that we allocate the memory before we do
the size check. This didn't use to be this way around...

Anyway, I think the cause of this change is commit c9800965c1be6c39
from Igor. We used to silently cap the RAM size to 2GB; now we
complain. Or at least we would complain if we hadn't already
tried to allocate the memory and fallen over...

-- PMM
