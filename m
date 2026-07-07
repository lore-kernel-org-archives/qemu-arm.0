Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73EBC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 12:47:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh5Cx-0002dh-KG; Tue, 07 Jul 2026 08:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh5Cv-0002d3-U5
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:47:26 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh5Ct-0006qs-Qf
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:47:25 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-664d35b4777so5881118d50.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 05:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783428442; cv=none;
 d=google.com; s=arc-20260327;
 b=IjpupMdCwtWf1osKs7+3idrNo7q7FWWQgBJPgAONteJ/3B63n34h2ru/Y80O2MF+Ju
 ERiyefaZvgwnKjP/sOEL+swSlA6Wwmx7qrRjL5MCaYBR17VX3ks2/kmRSXJLZRWZIcF3
 4pZQNFK1I05XU7AOh0icD9aldXBqC6Kq8My1UIeEQOWSeaDEh7nJ+dDWAb/cIHGzFBxu
 JMPv/GWZKemf/YxF1fVz+OqPhFph3sl51C7BsDMH61qMToaUZ930NbWvU5kpOSsdv2Cm
 AcoPtCXTctTGDLkeo1I75W4Khj4RdGtfRCWg2jKDdQkLXsepgryt4qfNczrwICk/w25z
 p+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Lqrftp7O5M2y1MshoegKoEz302VBqRw2vO925uW5neQ=;
 fh=QmSV9uh806UWEU+wSUtKsVvbAznRA9tc3Q6/3QjADt4=;
 b=qs6dD2TD2wxp2KCp0MeJ98qj0fhM7k2gd/XLRI2jUKT5K231OH5lpj1lS36a/6ascE
 XhFQ6sgYcLXJhaF7JQ9ODSEs/I/XkaCxvsnqzdf/LEP415Hu1WcLqMK3tWlj6WA8kZKh
 mmuqdLyfeHKMGoTvVXe4DPFZEtuHAO2EEOGgVtE9MyxgaMEJcZlyfNVbnXT0IWGW7MyY
 vL+mvhsRK1MLM5kNHuKyUuP5jt5FU1yorW9Xmgx/0npA5CcgtK5cKbgcfbjRTSSjFMC8
 Oah6LgRtc1MF1v1YcQb50WxwGLlDk4GN6xloGyHo61+mSDZU0fc8Jtz1TfcSvGoF6sHF
 cOIw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783428442; x=1784033242; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lqrftp7O5M2y1MshoegKoEz302VBqRw2vO925uW5neQ=;
 b=IRbH4uSvyvrzwdfhhn+ZGF9miEGDy4BYMvog71gkM1x06XqmpNchow45Q5c6AkcNSZ
 15TqL6L84uQ9l+qXuRtfH0lSQGpjDCv/1de4XOyaf05B5IsyJEaa33iTnn+bcy+kAvo/
 C92xQyw2IQGYJ5Ee/tp6cwXMxP+2QwIwdmTiRPvP0h2TvQOOJ+Uazk8BYw9AVRCW9RaO
 votjyqQkeE21wWM3SOIMswa/mKmWfHqTGA0lF06DKRTI52U9EHhjAGsqgtzeWTWa99JU
 EnlMkdKdh5H/WfsJAWbSo3bkR9yCcq1AU0L0Io+mBMoQCy+p/Q8QFvX2JNDl/IdJFNQS
 yKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783428442; x=1784033242;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lqrftp7O5M2y1MshoegKoEz302VBqRw2vO925uW5neQ=;
 b=RBm2Kz02KfpDf1wuBMEXse5gB7zzaKcoMuulry//+lei3AgJiN8jqVr7tmnNO8H+1J
 0pMIb07JQ/Pe/zKXik8NUusDym9XWRWzbYV+M7pX0dX4qaipoqqtmP6Jluu+XDSwXOmS
 JT5SZtYPPEc3LTi2B2VqZdnnzgz6/TgW7gfNrde5djuni2qbhUwQrEHJQVycp1JIzTh2
 QVYNKN3VvgPBSiTYTzU0PQfOPRX750DWPwzrV1CFWX2skHBN+o04nRDghCjDC+6lTjPL
 V/GtrfAHNNB6ktkcC1Qqd0slZ4sG4wdBn5+T/xXA8d5isCIfbzM9lhaP9TkTKSOrusuQ
 QYXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq82ozRXVUT7twWAbJ+9oTeTAgDOrZmi3euadvTPeBxqTsy5MQ0AhVq9DXqw0N258l1tV0dI3Hpng==@nongnu.org
X-Gm-Message-State: AOJu0Yzk/pn/oKzVagx81/D+GCVYXp4cRW/CzkYxzKbde8ENWJlTgxvB
 gnnnY4K9SdwLysrc3IBpZBRVhd9OZNht/wWNhWCHxxt+d5bcp67Kz1mgClCkvNKxGA1Vn/LHg44
 6OTWYFCd/LFSZ5AHtZ7EwbpU1phN9cI+oIUUjKhb2LQ==
X-Gm-Gg: AfdE7cnNgKTlAKc55xGn9zooOEgw91CnAlApJ8wtWuh3gCS3D0l1qRnNMAabDsZZ8OM
 nF6NwpbXA9le75YcNXKzGSzdm1OBPHffc1jufSzqd94fvZfkPXCouGaG1hw7aS0i4EEMrIwe68N
 HZ9i1vcxs18qIyRtBAi392u4pDl8MUa4js/ASdGlMdOCiZ0lTHURbKKg0vE3mxcfPioaOfvcY3F
 QhFDTFBU12VYO2Rs1J8Nr3RJhG2StudALL4M3kmGILrEcQ7EbC83EiaIZopyZEDySHZwt/XVqyr
 RXoRCNWmigM4oO9W1ZcmJKgHw5LaszVOudc2JqlZDnC7x7kTJgSbdM2V
X-Received: by 2002:a05:690e:43cc:10b0:667:8b90:2e5c with SMTP id
 956f58d0204a3-6678b903865mr1139281d50.104.1783428442414; Tue, 07 Jul 2026
 05:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260702184038.178196-1-shentey@gmail.com>
 <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
 <CAFEAcA8aR6GPZWDphbTgPhVf3G=eoNrAFdb9QcLCGh9hdavkAA@mail.gmail.com>
 <f0b42f48-2d4b-4f9d-8a3d-3abc1da411f0@oss.qualcomm.com>
In-Reply-To: <f0b42f48-2d4b-4f9d-8a3d-3abc1da411f0@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2026 13:47:10 +0100
X-Gm-Features: AVVi8CcjmrbZbmFLoQDXcECT_5ICI7cO-sLuqZGIvdJ9hmPqFrG-Rhdxx5Kp7lw
Message-ID: <CAFEAcA-phDL-y21=mO2yJ=eCPFL9krMBheKyDeep5Ar6K2-wrA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm/fsl-imx8mp: Add inital FlexCAN support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Jason Wang <jasowang@redhat.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 7 Jul 2026 at 13:30, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 7/7/26 12:43, Peter Maydell wrote:
> > On Mon, 6 Jul 2026 at 14:25, Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> On 2/7/26 20:40, Bernhard Beschow wrote:
> >>> Now that FlexCAN emulation has landed in master, let's add it to imx8=
mp-evk as
> >>> well. While the real i.MX8M Plus supports CAN FD which isn't emulated=
 yet, the
> >>> non-FD mode works well under Linux: It is possible to use `cangen` an=
d `candump`
> >>> either way on the host and on the guest, as described in
> >>> docs/system/devices/can.rst.
> >>>
> >>> This series consists of five patches where the first four are prepara=
tions.
> >>> The last patch integrates FlexCAN into the i.MX8M Plus SoC and EVK bo=
ard. The
> >>> first preparation addresses the review comment from [1], and could be=
 applied
> >>> independently.
> >>>
> >>> It would be nice if this series could make it into 11.1.
> >>>
> >>> Testing done:
> >>> * Start imx8mp-evk and run `cangen can0` there. Observe on the host t=
hat
> >>> `candump vcan0` prints the traffic.
> >>> * `make check`
> >>>
> >>> v2:
> >>> Thanks for the very helpful and super quick review, Phil! Here we go:
> >>> * Add patch "hw/net/can/flexcan: Wire clock control module via link p=
roperty"
> >>> * Have separate MemoryRegionOps for 32 and 64 bit
> >>>
> >>> [1] https://lore.kernel.org/qemu-devel/77d5891c-de12-467e-8746-02fe43=
121e3e@oss.qualcomm.com/
> >>> ---
> >>> base-commit: a59157f98f0b69b0bbdb26bc15fbc4d6c8060799
> >>>
> >>> Bernhard Beschow (5):
> >>>     hw/net/can/flexcan: Wire clock control module via link property
> >>>     hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
> >>>     hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
> >>>     hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
> >>>     hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP and imx8mp-=
evk
> >>
> >> Peter, you just sent your (IIUC) last target-arm PR. I'm about
> >> to post my hw-misc one, do you mind if you take this series which
> >> is fully reviewed/tested?
> >
> > As you note, I've already sent the last target-arm PR for pre-freeze
> > yesterday; I'm not going to do another one. So from my POV this
> > has just missed the deadline and will have to wait for 11.2.
>
> Err, I meant "do you mind if [I] take" ... :/

Sure, if they've been reviewed and you're happy with them you can do that.

-- PMM

