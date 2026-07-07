Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE62C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 10:44:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh3HT-00066V-Js; Tue, 07 Jul 2026 06:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh3HS-000667-EZ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 06:43:58 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh3HQ-000484-QK
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 06:43:58 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-66766d649fdso3208351d50.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 03:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783421035; cv=none;
 d=google.com; s=arc-20260327;
 b=jYFLI2cd21FxFX3PgYzY5+i2Spkc/RcZgdIvKkgdEstmvrWOWpedSWfxJ5c1ZjBNsA
 95Dh7nLNZdNXeJ9sJWMjO4Js7Xd6vzgT2cbAUpYcsonGml9c6GROXljrGRKQXgA6XmMG
 +ICrQ8dBypjBPVepuVgwB6jp5JMPEcIiWSUec7+gpTB/A2uoabgK8P+4cAqwtY541adS
 QK6+x49VA6B6HsCCpsg1w6D/shtKyItDRHwxvFmfWV/FbMfEcgbw7hBcwsLNVY6m0dGW
 4ozXRpgrQtsE2/7rQRiO+pcbTHVwhYEUR7KQDbSnEzRxmxiytIIrmhLWpRbmx02cvdUc
 Yu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=a4Za2vOUCu9/1r75AG6k691yxycMkdWuYMeptLr85R8=;
 fh=lK5GpnBjedifYM6HSXaAbedhUzTQ/YSVdl5cTmXPIMc=;
 b=mjIB0/YKDFDFoZbhvBbRBAfUyzK8i8jSrPIeyvD0LYJc6Sj0h+CLq+F+wx5JuMO0Eq
 NWBsMPwQszEA97KFVZLveSn16y4hFZYLtKX/eFiooXFSQJ7IgwEtJ/1K+fJGZNKrbgff
 pK2uzkvayG8T2RzH/kQr9mwcyXEztEVaVKgkqct+HCUyo+F3YQsj+fKUR4FL99LKQFLr
 d6omMnHEdGR0e/DwggxIB2oZBPqsCEaWPoaah0HVGFV+x6/DNfeEcyv3nolCyS8dGuVU
 PzG6YUz48Tg8TviYa+eiXjNp0ZehJZ9OkGqLyOrAg1tZGEuQfSuwVCmjEpuWo6YXrDEV
 Yb5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783421035; x=1784025835; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=a4Za2vOUCu9/1r75AG6k691yxycMkdWuYMeptLr85R8=;
 b=K96O6y85ackUjJVBCU6DQd89tZf3ihfGUPJfYiPYkbS7RIgY88oL8ibW0O3i/EQlX7
 h5QQi2uc8APDtIqVRbwflUe7c0hXqU7uNHyK7gAGkuSQvy90gBFGLig960KgLIHxmNkY
 ePNdwkanPzZ6y5K3vWrW0q8lldXOIRiEH3blBfvl5NdbPKwuz6h3y4WmC2JuwUV22B2R
 3su0k7heqwARBIwmxFs3CbEqSzAo4K4kjMktfL7zExqiQWusApMTX8kAY6hh/H5rHOnE
 17Px/UYP+6sUJA9wBtLp1JNe+tu1eyAcW1/wCOx9xy8KEIuf4zt0PYEOLoeKb5EAQ9xi
 rLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783421035; x=1784025835;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a4Za2vOUCu9/1r75AG6k691yxycMkdWuYMeptLr85R8=;
 b=bysIpuM4UYNWnUlSA0+q2mtL4TnYVpguSCc6YIPvDXvWHOaQ3eEXFxrQJeL0WVSMKy
 UyDs8nHl0kZpK/sDGuw3hv8IYsqSZz1bVGTEQKpjqiAWxfJqdFlHJugxXgl53pk3XvR6
 rcgWGs8IZLudSSveSUfLT2KF37V4gEvzqY7BKkDSsBvu0H+S2esVu/iYcZ1K05M6l+fN
 YJshRBhoSkM48vLIlUBwFALMVhCegi8L8T3MQpCuUZ2AgNOVdRLZ7VD97mjRUb0G+0vk
 k2lbIL0nV153iVU9EEamEwL+GwKzFNp9lh57nAkoqBJIymnfJpbSypNetQ1gy61f3Rui
 v6bg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVs9vIUI0ny5TkjUaYblz3/ng1OZndIQSxvqxiBJ0vvhFOC3sPEB/3FQfB1BF7rwqwd930pcS1Ew==@nongnu.org
X-Gm-Message-State: AOJu0Yy0s1lozV9MSoL/YhgFI1kW6jlhpeb56kKyaVbBSW17aPJE2/ln
 ubUcBxKzdMdYDhWfkm8ir+wpLNfGls/ezb2znXbVFPpvrOB8DO7Ei6zg6FejXrCk2inR6mk4YCx
 neIEbkom6nGKlPlpJQHnDrDsQzqs85G+uiJirWWSKqA==
X-Gm-Gg: AfdE7ckUNwSOoJsnvpx4jO6znjGebSQep8ORrQGatCPPwiNBj9yQjBFjmxDwZJmmlgH
 Uymsekx/k00XbpMqHGYz8ytwBSC1kywnwEieMXLOuWyMchuf7QNcIOf1RsC1d15zIhMtmVbmARm
 MU/u8Dr+MF7VQ5FmwG/8xgv4UbG5GmRCxojwoiEakAR+HwnR73n7WVQmyOw6q2kftkBz3iOzKwh
 jGf9PbddkWUmKcn+1IkGWt30hJmi96zibiSaSCLSUluUmBGARdACxdeHzpXKk1caSiDKU3VDLAf
 fGTWn0o7qWffJcfviamkJA3BgxmFSIOuZ8lDKoibpWZ3r6ByxIiUs/f+
X-Received: by 2002:a05:690e:4386:b0:667:6034:d273 with SMTP id
 956f58d0204a3-6677faedbb4mr2670410d50.5.1783421035511; Tue, 07 Jul 2026
 03:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260702184038.178196-1-shentey@gmail.com>
 <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
In-Reply-To: <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2026 11:43:43 +0100
X-Gm-Features: AVVi8CehRy-VKWeD7SVF3oAyi4pbiJkeSstNGWL2B8a6GGaZpHUITZLEXLddr50
Message-ID: <CAFEAcA8aR6GPZWDphbTgPhVf3G=eoNrAFdb9QcLCGh9hdavkAA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Mon, 6 Jul 2026 at 14:25, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 2/7/26 20:40, Bernhard Beschow wrote:
> > Now that FlexCAN emulation has landed in master, let's add it to imx8mp=
-evk as
> > well. While the real i.MX8M Plus supports CAN FD which isn't emulated y=
et, the
> > non-FD mode works well under Linux: It is possible to use `cangen` and =
`candump`
> > either way on the host and on the guest, as described in
> > docs/system/devices/can.rst.
> >
> > This series consists of five patches where the first four are preparati=
ons.
> > The last patch integrates FlexCAN into the i.MX8M Plus SoC and EVK boar=
d. The
> > first preparation addresses the review comment from [1], and could be a=
pplied
> > independently.
> >
> > It would be nice if this series could make it into 11.1.
> >
> > Testing done:
> > * Start imx8mp-evk and run `cangen can0` there. Observe on the host tha=
t
> > `candump vcan0` prints the traffic.
> > * `make check`
> >
> > v2:
> > Thanks for the very helpful and super quick review, Phil! Here we go:
> > * Add patch "hw/net/can/flexcan: Wire clock control module via link pro=
perty"
> > * Have separate MemoryRegionOps for 32 and 64 bit
> >
> > [1] https://lore.kernel.org/qemu-devel/77d5891c-de12-467e-8746-02fe4312=
1e3e@oss.qualcomm.com/
> > ---
> > base-commit: a59157f98f0b69b0bbdb26bc15fbc4d6c8060799
> >
> > Bernhard Beschow (5):
> >    hw/net/can/flexcan: Wire clock control module via link property
> >    hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
> >    hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
> >    hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
> >    hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP and imx8mp-evk
>
> Peter, you just sent your (IIUC) last target-arm PR. I'm about
> to post my hw-misc one, do you mind if you take this series which
> is fully reviewed/tested?

As you note, I've already sent the last target-arm PR for pre-freeze
yesterday; I'm not going to do another one. So from my POV this
has just missed the deadline and will have to wait for 11.2.

thanks
-- PMM

