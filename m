Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2668420lft;
        Wed, 22 Jun 2022 22:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufbZlV2G/m6cLA1tq9MqWOkHI3QjQI5A7t2edo7PzSFAe2R04YDHoNOFAZ0oAsN8/vnDRx
X-Received: by 2002:a05:622a:251:b0:304:f476:506c with SMTP id c17-20020a05622a025100b00304f476506cmr6386824qtx.600.1655961995045;
        Wed, 22 Jun 2022 22:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655961995; cv=none;
        d=google.com; s=arc-20160816;
        b=cpn+zumiN1+stH9k5IDNxHezSSC9auAx7WJzR3VIaKVepbHwDHRVvV8Gg50TnAjc1K
         TuKXD6QO6e+jyw2805gfSEiwRs/EQDReznYbsiH9EO9pI1nj30UesGxLDTd9KiHQehbI
         49CuAj0D+1bFS8abY6o7p9KYcRmfjWoTuaw9IlbAnjOjN0jg4Ruuf6XlZzttAwf46W0r
         G5cIry1gUudv3nJyTZcUFTfpYUZmQLKGeiBtDT2CbDqBP1rQOeLJ7IdycBKYRDc8V5uF
         XYZHdJd7k4AiSkQY9Q0Pd0DOxMxOxG2QS6UZ5kS0+EkYjjHkkil9PCCaNB45KZs9ApDH
         AXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YMYfBYFBtSZQ/UGSiZfn6+vx30kd6A0Eim4w7N+lFig=;
        b=BrJYN/EcXbOWfyT4bJbSwv1YYXFMKJWxi5cArzfsXpk0LFF0QqrqtP1G/4wyzGhTw4
         Foq7CZC572rCwvYkm2WYkiKRkw0nHSlpWYCvENy+fS+ELJkBUilP+FRABQp89xmy+uIy
         NIGEUUe2Mu5o73ORQiGhl1QvAouZ0NbPs/2N8M6b0fSSWhYskOfpAfINjYfM0FwQO6mb
         XWNzUglftE3CnapZecYZQ0EAJ+lD2zADsNT7t0Y2GivIvbA/PGIRsgkw4Pzn0tXL58nu
         4hOnXy53NIoz2qg+RFRxkOIPYDb4OqpU8iRMLDCsIFv0JstGAkPYqpE29J/MxFp+6KhD
         pImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=O0NKP20L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk12-20020a05620a1a0c00b006a68868fb0fsi13834487qkb.628.2022.06.22.22.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 22:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=O0NKP20L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4FMQ-0006od-Fu
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 01:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FLX-0006YK-Sq; Thu, 23 Jun 2022 01:25:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o4FLT-0001qP-Fw; Thu, 23 Jun 2022 01:25:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id v14so26282456wra.5;
 Wed, 22 Jun 2022 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMYfBYFBtSZQ/UGSiZfn6+vx30kd6A0Eim4w7N+lFig=;
 b=O0NKP20LyFM0izRlYZMNZt6xvpVhWYNIla0QDimPMYGK3UgVrB51JOlPgR0OqrPTPF
 iSiR4g2PPb7Az9CP5KZBFlzmxrXMYsJsxS+0t5xFuvoCmsneaSVCW0k8qrbjYOS/hy21
 3XUTFopvGQDNvq/nKalqKciOAmfZ4/yHsF6NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMYfBYFBtSZQ/UGSiZfn6+vx30kd6A0Eim4w7N+lFig=;
 b=bru8B6f253+4c/L1Nrf2XIU4rDMHPMScrWPyehhpSTjnrxFp6EYacACvCqAv3JuODf
 513Wu6IvkFgL8jCuFzk6Zm18li1Dp+kENkdAsE0ALnfuQBICVIOumd3fmQLz4cT9U+xu
 ptgwXOVadkH8lpdYh5pddIreXfci4CghngIop2G5a6TQ7TUnpZ1qgp+fqB7Iqe875kNg
 v+8uvrqlWdcHAea/Y08hvwBUy10mLkT+TtaJvpILC58GtodhfFZ5Q/yTJoNTCqXeP8vi
 IHlsNNTYJM5GbOuqxgQqshQUU/pRrG82Mudf8iSpQbUXJ8FSlM/eIm5b3Y52KXH4UqoO
 rX3g==
X-Gm-Message-State: AJIora/hJeIUdFlHFGRuoO8W8tgNLchWLg1FeiedKGnJr2grZ0CGx/sx
 HS0QcFX6+J1COeLe6yf7MpcFuXdC5Bcwlciz0ds=
X-Received: by 2002:a05:6000:993:b0:21b:8f16:5b3f with SMTP id
 by19-20020a056000099300b0021b8f165b3fmr6488340wrb.628.1655961931637; Wed, 22
 Jun 2022 22:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2022 05:25:19 +0000
Message-ID: <CACPK8Xcfyu0BxEhVZDQ=mfw0OcPgSm6nVSzpmT5nviq7X+rFTA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add Qualcomm BMC machines
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qTnuzeb5XlTJ

On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Hello,
>
> I'm sending a series to add Qualcomm BMC machines that are equipped with
> Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
> emulation. Please help to review.

Thanks for the MAX31785 model, that's handy to have.

I'm all for more emulation and testing using Qemu models, but I wonder
if you need to add all three of your boards. They seem to be a
progression (evb-proto -> dc-scm -> firework). Could you get away with
just one or two of those?


>
> Thanks,
>
> Jae
>
> Graeme Gregory (2):
>   hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
>   hw/arm/aspeed: add Qualcomm Firework machine and FRU device
>
> Jae Hyun Yoo (3):
>   hw/arm/aspeed: add support for the Qualcomm EVB proto board
>   hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
>   hw/arm/aspeed: firework: add I2C MUXes for VR channels
>
> Maheswara Kurapati (4):
>   hw/i2c: pmbus: Page #255 is valid page for read requests.
>   hw/sensor: add Maxim MAX31785 device
>   hw/arm/aspeed: firework: Add MAX31785 Fan controllers
>   hw/arm/aspeed: firework: Add Thermal Diodes
>
>  hw/arm/Kconfig        |   1 +
>  hw/arm/aspeed.c       | 158 +++++++++++-
>  hw/i2c/pmbus_device.c |   1 -
>  hw/sensor/Kconfig     |   4 +
>  hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build |   1 +
>  6 files changed, 742 insertions(+), 3 deletions(-)
>  create mode 100644 hw/sensor/max31785.c
>
> --
> 2.25.1
>
