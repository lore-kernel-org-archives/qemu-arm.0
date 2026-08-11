Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30B1C5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:20:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjaq-0005o6-PW; Tue, 11 Aug 2026 06:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjap-0005np-AV
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:20:23 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjan-0004Gi-Kh
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:20:23 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8228ed0081fso39894447b3.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:20:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786443620; cv=none;
 d=google.com; s=arc-20260327;
 b=aGdMeQARzxzPekWfkiTu3fpWjcy46KQ0YPTUp0FUCEisDbCJE7IpOAtVMya9AMI1FB
 CWOEd2M51FHroZXSGi4Q5O1KnkT1l8HfU4vFUdtnfz2d8a1WeJdLLZEXtCD0A0dM1Cvk
 XfEKgQdYKWnPE5XciEd8/hvuKfHMp8tUsUvCcAYqIcE8GNfP0SkH6EA3639339b2J+FK
 GwG+UjTHYwp5/3WXv25nC0lauIBfnYL5RspWybnPV+4qmaa67BJddmqTx75B15yLwU2B
 QcyL3Sy6aw33UfYT3nXf9rvGgLI49qZV/dA1klPmIJM2Z7YbilZgxApJq2LOW+Mjj0Cy
 DWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PuonKHifZBM2j0CvU/PMoKGu2t0baagafZqtaczQrOM=;
 fh=LbRWrFbnicJZ39yGCwQzR8f6pwqnxZgbaW9vYhKYqt8=;
 b=Z1J7cADsZ1hiyMzoLjVoGKfqi6fOMvViuM94hMdc2hmwdDblmcYxOrkBNQmYYJBMZr
 HgUA+ggqrTOQQg9Sjlor7ydfytkIP6p6TdIZK1evnFAXLap/xHMvF2gvj93O80ryjG/7
 hR1GjH46F+dVqC2NGOB0dTc/4HAv7W7Z4EYwRGEma3JhKSVOlDy3frqcMVBCqIYJ3YB1
 BCuM0iN4CuTHSlvAifvcDsD3iDUEpE/CmZYN3hgIha3S+AgXqrd2F6bAzwWZsVdupMNh
 4w78iZwQ1VHiSnFvNOpXr5eE+2NNvHW+wiU+apypV38a3kWghh42UnyXsXdahFJoRz7a
 bPTA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786443620; x=1787048420; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PuonKHifZBM2j0CvU/PMoKGu2t0baagafZqtaczQrOM=;
 b=xywRZgX7C4sRLnriSvBc+xKCvrnfRrqFQ8hSVHOUu3lbIL1T0KNzuTt6Why+bNZfL2
 WmeW2996m1SPy/Re1Lbeicy+Da4j5K4D59Bch/VPEMdZ4G5NT6ExzPoaxPuCshddB0L1
 3ce+TsGRq/IwcSO7YRaIayShmhyySqeWt74ATHheTHgRNu5tp5HCo2qvxCzSe8ustflA
 CF2SIE8ECqznouoe1hvP+zhMtDSk4tsz6CM0SX7Y2/HzDYVrq3djoxSG3nS00Pqv6ihh
 69yvRL14zbUKqdjRgq6hin18mAs8fQqSP+MGiW0yxzkvoJw4UXbe6YGHx/sdVaZHqxus
 gIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786443620; x=1787048420;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PuonKHifZBM2j0CvU/PMoKGu2t0baagafZqtaczQrOM=;
 b=BqET7myjfvWXkKQKk/Pbs8RWaaWOsUpzcTLeMlK1sroTcaQJle6kqpuK0KOYHnv6/g
 +4Bynw5OtbG+BTSU4hooPG7wJqyQMo17ng1VYOIpLqsJZbyMgpwtenXp1rzVaqduZFEY
 gU15iDcc+yqZ52FPQsZ/7jZrlWx3Muc8mCncA++WHKXTFz8StPFPsnowKanchJY4wVRi
 G11oaD0xbR6e/YHp5czbr4hMbFJuXihGEesY8gZbSHWBDrYmOXb2XtfEBnC7Zg4DFME7
 y32Ub5Fr3iCE78fRnenD6Wzi2zX+b2mLPlpY3c9DWvwPfDJM6KaRxP2OyT6VOKNNeQld
 IPVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpGeQnT8vFANscxsvJa2SQ/7j2QwDQnh+mKevOPpcFl86aNyj0mEUhXNr91QmPhlC/drbEcESLpGw==@nongnu.org
X-Gm-Message-State: AOJu0YzcFh01pLVO0bW4f2Cs4DoaiFT8zUwTaxFWkJ7oVwMaTx9ZB4VO
 KLlbTwvhkiSzcj38pInC/WYV1Vt3aycjWayx0vlPMDGOW2LK9yfn4j9GdXZBfxrGZZbyMWdRyGU
 Lyk1pMryr9BdBFeGHYD0NHMukTG6H24BlZnmT18jqIQ==
X-Gm-Gg: AR+sD11hQoOqrD4FCf0BwB6HoQNzYpyA3jh+aOYWaSUWalhq0ba39Toae64AxTfTPEm
 VybJB/dh1cCzVrXVtFDuI28kKNz3yjM5pzqkQmoA/3cVBrpYK7w60z4jfOC1tHuOz8NNrD7ZflE
 tOR9k6yb8V+Og0r+d5H4yCFwj5AkTlccOvmLSqvXGhPKbnTd61du52I4f1C/wIorShhfu03JS8w
 AdhUI4a+BzZR2eBI1OpQ8z5Pl56QGE0MifEgkPwDUrLZwvk2V70ENUtrddsrqZvIss0UqIlW4+W
 AjMV+TNyS91G4+YJU14TXj2Mhr1a56ZxRSoUBwPd7OQ/RJXkISQDNSq3A0Ocn+YZIynAvQG+2si
 8jOPny4XaUd8Tq3lLaaULGuX8zOUI
X-Received: by 2002:a05:690c:601:b0:81f:653d:4992 with SMTP id
 00721157ae682-82f2b9a060bmr16289517b3.13.1786443620018; Tue, 11 Aug 2026
 03:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260805191257.11303-1-simonxhy0404@gmail.com>
 <20260805191257.11303-5-simonxhy0404@gmail.com>
In-Reply-To: <20260805191257.11303-5-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:20:08 +0100
X-Gm-Features: AUfX_mxdX_fy376zf_-zPF-22lKYyRi-_KVZW51c79anogmGuxazCI9BwpN3NRk
Message-ID: <CAFEAcA8EB0az05AwqZHWavX=XPz_sKKCV+vb2VC8s7H-qLXgjA@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/arm/mps2-tz.c: add AN547 AHB PPC EXP1 DMA ports
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Wed, 5 Aug 2026 at 20:13, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Page 42 of the AN547 TRM defines the AHB PPC EXP1 ports with DMA 1-3
>
> AN547 TRM: https://developer.arm.com/documentation/dai0547/latest/
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
>  hw/arm/mps2-tz.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 81e64a91de..d6d178642b 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -1113,6 +1113,14 @@ static void mps2tz_common_init(MachineState *machine)
>                  { /* port 7 USER AHB interface 3 */ },
>                  { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
>              },
> +        }, {
> +            .name = "ahb_ppcexp1",
> +            .ports = {
> +                { /* port 0 reserved */ },
> +                { "dma1", make_dma, &mms->dma[1], 0x41201000, 0x1000, { 62, 60, 61 } },
> +                { "dma2", make_dma, &mms->dma[2], 0x41202000, 0x1000, { 65, 63, 64 } },
> +                { "dma3", make_dma, &mms->dma[3], 0x41203000, 0x1000, { 68, 66, 67 } },
> +            },
>          },
>      };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

