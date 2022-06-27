Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2532337lft;
        Mon, 27 Jun 2022 10:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vFwfvFQzqapPsxtK2jNId5onk+AOdhB0cMZomekyteLXpfHvdPZoCxZjWCo1CTTq9Hp4KO
X-Received: by 2002:a05:622a:1001:b0:305:1a72:4a7d with SMTP id d1-20020a05622a100100b003051a724a7dmr9973950qte.575.1656349924522;
        Mon, 27 Jun 2022 10:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656349924; cv=none;
        d=google.com; s=arc-20160816;
        b=K4zS5020oyKNjho+bVYAGlSgjCbFUhta1qxC/4WVnsF6TvkzPpyxW31ywXfDRbzqZx
         VmkZL55j88lSPXs5qgdbMN7pk4TmhjLYCVvRsk3ANw9JLs//sCrruFegEDxyUsdfMhrO
         UtcoSxrP4Mw4qWF7PFNROSNiN/8gJ5gjt71kUB6bxyMtCUoPOrC/qZDkDABW2NlMyg4Z
         wBOpwCpnryI6IDhDpNGG5KZM4UegCOtEKkII5LNbM6s/x/pr3unJZ568NRFTLpSRTxC1
         V80xPiFbKtlCOiw+LjORCnSIOHwuWUMH01OR4VVqj/eOze2ElDGBdvU2RxK9E4ZEtFeu
         NobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eFvZLsfdGBlvibyhFd5fb9m2dvkqQTlHIMCewxOHEUg=;
        b=Jpj3wg/hYtCeuzqsaN9EAs9Bh9eEAdZEuyfWDsJm25O+oQpHqHIQCrIET/Dvd+oIv+
         J0kWOUQhg51HhyD6Kpl95SoNxB1zuJS0F6vlkFneFOCpywm43eWjryOKNfA33UZ9kEzF
         U1YrPSmuky9Cgr99UV/EkUwFe8wP/TLAQAUkP5aha/mYdpQRaZM1DaTkr+PXq1f1WWwI
         W/SiS6WSo/QucFqoa8MeRM6UejRm7F+X6G+Hy8gZOMfeo8sYzDM7tbseUajNd25HXOEo
         ATQyv1XuywBOiqT9cam6sosM+ySX3uBzq9/d49TQjOsCSydAarA2dMPf5zN91OxUwhIs
         3FIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=idna7nFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05622a010700b00304ceee55e2si1210562qtw.503.2022.06.27.10.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 10:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=idna7nFi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5sHL-000235-TD
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 13:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o5rxk-0006XX-SW
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:51:49 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o5rxZ-000859-RX
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:51:46 -0400
Received: by mail-ed1-x531.google.com with SMTP id c65so13926446edf.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eFvZLsfdGBlvibyhFd5fb9m2dvkqQTlHIMCewxOHEUg=;
 b=idna7nFiFqrSDI/vLtYqJmO5E4Wf0i7CaY8NtGeQcwUh7FlpnQKwxO9jnkaeNyi9td
 Arq8H5nVbhTQvjk4khQNm7lrKhXzx+KLwzbd4giBckIGba6CY+wjKqpyRU+We0Ovn0rH
 N9nYEs3UEJK5rFQGlEQMPDTNUJ4xQfh/5UnaDQOTf5NZ5F8IyrGKod36Cmi3hfc4mVrr
 tKWTZm8KceI68QXURUJVICPGWIVsZmmtDGAjTf4aoh0hWTimKzyJQnCze290U0W14vLQ
 5VRcXhqta/VebtXLo8aMgrCGi1/cw10jARx3TJWPQ0Vm5t+MJvIptXUWRJSpjqDi652a
 NDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eFvZLsfdGBlvibyhFd5fb9m2dvkqQTlHIMCewxOHEUg=;
 b=Dzr4/+LAwoxQVha1eGbXrWEn1413V9L++X3PH6ysC0f43n/G0235AEzvATr9f6eOOJ
 SmRk55newhIWaC4HHEPaAN17qI2XlW+yygQ2lT+8yCzbpkn6/zqzoyJryuVzZAmLqUth
 Qg5+B0MDnMjYoahjES/Z1pjcOIKsudh9VEfnixbvilkLW0z3wTdTJYn6U/5uAHMiHc7o
 FR+5cvJ62FIRpBs4dVY+sGIDO46trCwqbibe17/SS66NlaoV5XuejqjRGPPhVWtxcuOY
 Hvct+U5DJ+fbylq6UjqwC2KZbHFkEmDy9dijhvJPv5bV+WtStwJt6bd0DZjjKcRtKrdk
 xkXg==
X-Gm-Message-State: AJIora++zLwjENFuhT+fGlCGTUoZngGUyuXKdcrmAgFCOB1c9jlGVVW/
 OqjBoj0Tgnrtm1N2xeC5Feg1cvHyHc+ToGFKOvjG/Q==
X-Received: by 2002:a05:6402:201:b0:431:665f:11f1 with SMTP id
 t1-20020a056402020100b00431665f11f1mr17781386edv.378.1656348692998; Mon, 27
 Jun 2022 09:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <f4866421-06b2-a2b5-5c60-8a3cf3457e9e@kaod.org>
In-Reply-To: <f4866421-06b2-a2b5-5c60-8a3cf3457e9e@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Mon, 27 Jun 2022 09:50:56 -0700
Message-ID: <CAMvPwGouvvqCi4ZYxp1D3Qw-5jrK00deOyK9gLi7ohEstMnq_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add Qualcomm BMC machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, 
 Hao Wu <wuhaotsh@google.com>, Graeme Gregory <quic_ggregory@quicinc.com>, 
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=titusr@google.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: TkmDVRXdw//U

You can take them through the aspeed branch.

Thanks.

-Titus

On Mon, 27 Jun 2022 at 09:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Titus,
>
> On 6/27/22 17:46, Jae Hyun Yoo wrote:
> > Hello,
> >
> > I'm sending a series to add Qualcomm BMC machines that are equipped wit=
h
> > Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller devi=
ce
> > emulation. Please help to review.
> >
> > Thanks,
> >
> > Jae
> >
> > Changes in v2:
> > * Fixed a typo in QCOM DC-SCM V1 HW strap value comment. (Rebecca)
> > * Removed a useless change which is reverted by the next patch. (Joel)
> > * Changed machine name to 'qcom-firework-bmc'. (Cedric)
> > * Dropped FRU eeprom initialization part. (Patrick)
> > * Fixed comment for a case of PB_ALL_PAGES. (Titus)
> > * Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
> > * Fixed a typo in copyright in max31785.c. (Rebecca)
> > * Fixed indentation issues in max31785.c. (Titus)
> > * Fixed license identifier style and refined indentation of defines. (J=
ae)
> > * Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
> > * Moved machine updating part from the previous patch. (Cedric)
> > * Refined code to avoid retouching by the next patch. (Joel)
> >
> > Graeme Gregory (1):
> >    hw/arm/aspeed: add Qualcomm Firework BMC machine
> >
> > Jae Hyun Yoo (2):
> >    hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
> >    hw/arm/aspeed: firework: add I2C MUXes for VR channels
> >
> > Maheswara Kurapati (4):
> >    hw/i2c: pmbus: Page #255 is valid page for read requests.
> >    hw/sensor: add Maxim MAX31785 device
> >    hw/arm/aspeed: Add MAX31785 Fan controllers
> >    hw/arm/aspeed: firework: Add Thermal Diodes
> >
> >   hw/arm/Kconfig        |   2 +
> >   hw/arm/aspeed.c       |  95 ++++++-
> >   hw/i2c/pmbus_device.c |   6 +-
> >   hw/sensor/Kconfig     |   4 +
> >   hw/sensor/max31785.c  | 573 +++++++++++++++++++++++++++++++++++++++++=
+
> >   hw/sensor/meson.build |   1 +
> >   6 files changed, 674 insertions(+), 7 deletions(-)
> >   create mode 100644 hw/sensor/max31785.c
>
> Will you handle the pmbus/sensor patches or would you mind if I took them
> through the aspeed branch ?
>
> Thanks,
>
> C.
>
>
