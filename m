Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7DC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 13:49:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiBbz-0007xI-T9; Fri, 10 Jul 2026 09:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiBby-0007wN-Gx
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:49:50 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiBbw-00017W-6V
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:49:49 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-66493875766so1599629d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 06:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783691387; cv=none;
 d=google.com; s=arc-20260327;
 b=hiNZgd50tulMIFi+HbeefI5ZtqKvjfjlwthVC+C8h0i5nzNRAP1hvZ0EL7AX9uVfKH
 xkXh8rGFzOUIA7PEGrpC1I4DJ+L4D2LQWs9LbnhaEo0662KMkon/w6whsWK9maoDDzN0
 EP7wT2pyqKQWiB2yvDtXvmZKSU9ZCbZM0Pa7spGPCPfhIYyHUa6/LTSJ2o2ZI1J+C07X
 cS0Fpv+Eok7rl5g/drUDizwXFTT3qKaRg0DjEdNtIXMdDCQYRj02czXkvX8IOgJSwWZN
 97oYLSko/H0ADbiim28eGNLKCJyAG7GYcVUoANSl2gOTc9X486D12WFUfhgE7AvV4xBl
 NDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9FHEy95HDKrD+em7DRowOIijJMJSg06LQji/uBbaXOc=;
 fh=zA+5Zbmi/akDBB+uPFpOPu7mYWOjJ3rgIOEOCAifBIU=;
 b=a1/VV9tm9Oy10cMJ1Ij+ws/QsxShSw3xcbhSW5p782awAY1p89OR08BpfBRT/QXErY
 eQBXL433k2ad57YD6S5a9HdF4HsHcsrVkTfuHTNKYNlJfhjfu0Uy/GF6VqU5AlOxv7wK
 T9QwDIVSsREFtqUDfFM+xlDvvIPrNDUIMXvpLf28xRPOdrRVI4kV88vi8s1qF9OuEwWH
 SsklywyZHBqNH6F/zQYmHEg2/O6V0dlgOr90myRPkbKIcYjOl+aQ74Dp6A/DD/nSTwYG
 e7sJBXBkYuHMWEAB90ruP1SzEH53rENX8C4pcLMoLiTguvxGLmsbw+jOMa3H5wsokLXW
 zJPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783691387; x=1784296187; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9FHEy95HDKrD+em7DRowOIijJMJSg06LQji/uBbaXOc=;
 b=h6S0njRfdiIELRs0z712Bbf3P6g9QZsX4zH/Bciko/h0SBHz1coZ7tFotH8zBkAbiG
 8gaV/z3n/Pu9KP7VVYsq557AUS0ViE8b+IgXQVn/GEKGu4vEyjyXfYaDSEIQPcHRjNBk
 hLn4KcLsS0kd78nKozva4GjsNtpz7Y5cNyTYAommsr/1AJcA4omzm1z/1QlgtoKQY21w
 CEfoL/aJW8vFSRTGF/Ab/gpVwQw8TqG/7XWFz5MOWRKQgHnNMPjen4pXJQh5IXn3jRFo
 6xamWNtcpVI/kkfETzWHpbrReNEvIq7Z66gAgug75QaJG+XRYDRG88vtgv0VIC7v5E9x
 jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691387; x=1784296187;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9FHEy95HDKrD+em7DRowOIijJMJSg06LQji/uBbaXOc=;
 b=rF5IMHNJGfzt3idAl9daJoQF/B4mWE1q5b+O3IUgYVgtDRZiRsR/V2r3dZb9cTo6lN
 9xmn+A/LYp6rmvSBVbrVAJaiV83PgqUAX+8ibJx13LC3UX1QQwT1nWiIEGJb9e9L1JMg
 oXSRDozRKiJHjhlTR/N4VTdAXBEYcuTxx215b7X/7+vSwwL1nAjDdH9gIzqG7mag2pdO
 PJNDHl8kV2UhsyL4FNpGfkvwSa8MVtTzb0bAyMdpKi6LlCnp58nSp10vg8+CK5x8aAdr
 HopQXIyIoigpA5c+IsDRGQbKwpcrUsglq/pEJ0UHEAQnNTl6v1qkbyTKlZb+30wdvlD6
 1RIQ==
X-Gm-Message-State: AOJu0YzbEOEjegBsCTCTSR/mc7hnFPyJFuCgZVY/TSpugxMWXxP073HA
 0ASLL8R0WZl0xh9RzHxcitpyUC5DYrDZAGMmNsk6KaD4qXVkSFyVuJX2+kMIHn9isOfxsttXlGs
 bFiYTkMffPo8Id92RvRrC+AMjPBlh2RkfSenUy73uniI0cVajTgzQT/k+9g==
X-Gm-Gg: AfdE7clnlUwYd37OEtUVR0p/cwcrFMrJc1g5fEO6FHrKoIUXGDapLgACnMKlvILo08p
 qpfJZ2p58cXymhTGcJmqkAcQUQn1RSKtwErWOxxWM1ADmHQCZ+cEI5eU1NviWNeQF8OzGmW5ecw
 27ELAkW2hdEodfT21y2POpTnkit9lZ92qjr+RgKHgI55i1hTUXsv+FKX6USV92675wPjn/s3yZ3
 42DE3fatiU2SP6Qq79vbReYqdZ+9Yeg7XdWIK6YtH77fCJgxscC/A8mGyZOh+fy3xyi84nvtdBd
 1nbdB/jOIvOWLbo1+Rol7PJmfX9HXZEcsnqEmTyPQUtms/MSR5pBGn2t
X-Received: by 2002:a05:690e:43c2:b0:667:8a13:c3f with SMTP id
 956f58d0204a3-6679f0c80c2mr6226539d50.42.1783691386827; Fri, 10 Jul 2026
 06:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260710105907.2570621-1-peter.maydell@linaro.org>
 <20260710105907.2570621-9-peter.maydell@linaro.org>
 <4162f17d-c91a-4e59-82e4-d4c1f590396c@oss.qualcomm.com>
In-Reply-To: <4162f17d-c91a-4e59-82e4-d4c1f590396c@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2026 14:49:33 +0100
X-Gm-Features: AUfX_mw1QgM1LwR9N1Ooz8dtwW8YBTKUeBniwFqXXPqueOTEUJcG5uQg6VhsQJo
Message-ID: <CAFEAcA8_wGzV60Z+8r8U3w5is7F=Vqn=He9xj7JNfqmi+qLNzQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] include/hw/arm/omap_dma.h: Move to include/hw/dma
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 10 Jul 2026 at 14:37, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 10/7/26 12:59, Peter Maydell wrote:
> > omap_dma.h is the header file for hw/dma/omap_dma.c; it fits better
> > to put it in include/hw/dma/ to match where we have the .c file.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/arm/omap1.c                    | 2 +-
> >   hw/dma/omap_dma.c                 | 2 +-
> >   hw/dma/soc_dma.c                  | 2 +-
> >   include/hw/{arm =3D> dma}/soc_dma.h | 0
> >   4 files changed, 3 insertions(+), 3 deletions(-)
> >   rename include/hw/{arm =3D> dma}/soc_dma.h (100%)
>
> Per the cover letter, "The omap_dma device is the only user of
> the soc_dma code", then maybe take the rename opportunity to
> name as omap_dma.h?

It's the only user but it is still a separate C file, so
I think we should keep soc_dma.h to match the soc_dma.c filename.

-- PMM

