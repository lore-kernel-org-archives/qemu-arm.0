Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B70CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:04:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnWu-00077B-HR; Fri, 15 May 2026 04:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnWl-00072R-3B
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:04:11 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnWj-0001RW-89
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:04:10 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-65c2cd216c9so10399626d50.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832248; cv=none;
 d=google.com; s=arc-20240605;
 b=HQLp3WxG7sI6Y4fMitSFIR5vUTy8Atp1XAMkwjqNjDwXY2JI8Tt23gnQkTi3/Ls3ww
 dMC/RlWA3benzqQaa0+eColgy45h1sE/VMolBKOlXJQaXJ9QE0AWUE49svADKI/KM23k
 tso/lSYKbOKb3jEx2Nhwt+5Pm/FFx0m77c24eOVcfsPui0hbcVK2uEr5GQQDfD3NtkEK
 y30fypMy2x7NGJqtDMgFMYN4MZlHa3WITWqIU6HnsktrnQK3cYUVGsQW2yTWkz+RkmoG
 8WWPG/Y/y0qDifQYuPaowxwbA2D9n7tepTa39R0r7avP0wQrrFvSSCewyPc8mzs93NW+
 FpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tAeko3QliCsjSnxHyD7hnmpxbGpB6r/G/Yu1W1e5c44=;
 fh=KiGvSDLNTGu8X570vmsp6/ZF1KGNFdScW4do0d70vk0=;
 b=E+kLzAjf9+3djceDHYJPu29s3E+3MZa3jYRaGnlVVOijH2xpdzXxiptBU95ocB4yte
 eDjCDUJSd/GOh2YwDgT8xy5G3Jm70l/NZAJxmolE51l8Cfu/pHFoou680LieivBwpJiW
 SsHrf0uiowIO6xfab9uw1JIp3f3uyR4iQrFM8rdGB+9f3YJEbTLuXuOE/DwwR/daU521
 o8S1akMhcUy/jXSgF3cbb+BZqO8KNgH7HgHIlXrbpfw85FKDkTbvwtKcD0B+tf4Bn9wN
 I1hXoPyxsZ3GT6qfxQk4WdPXwPb4OrQBBtylCv7XW1jlYWIUzGZdiH7Mlpa/CqTTUSjW
 tEEQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832248; x=1779437048; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tAeko3QliCsjSnxHyD7hnmpxbGpB6r/G/Yu1W1e5c44=;
 b=F/kkitSEfcS6TUYOodXhaEh1FqF0GYOKzWcGK0ommTw26h0NIrVW9Wug6SjoXoSvAI
 M4obzIg2HV/GSBCWoUx+AFMkIILgX6ouvohI9OU2RCILJssE+BrEVg8agvNEthzaok1K
 fG8CC291ymOZWIRiXClURNYVKzE2uO5WR5ONYGu09lgfj+GiUGDlFLtAOzS1OL3h+AcX
 gU9BhTT3lEEU3dMXaxT2t/R8ItXglX/nkU36+t4zBecclM9G+orW59WSb49qDNm4tPBC
 w4dC2z7gQR6LLkys+/wJg2sJdzpECYooEf68Afq+dDkAn2hcURqa5jEFSCIv6WYLW8a7
 /prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832248; x=1779437048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tAeko3QliCsjSnxHyD7hnmpxbGpB6r/G/Yu1W1e5c44=;
 b=hOLrgxalZd7YuLsMvmJCejmw5lFMceDfyHen9487+tmFadyPic/PGTV45ibH6KhM3b
 ZdKtwjhfCtfdMmCOfV4hy4RxDh9zxF+4CqNEBfQVMXATbHUt+QrXyn1itJyxUWziLBpw
 +9RZhmvE+tmHwyyQHbfB6CKzajNO2EhuqbJl7VU6wNCzeUN59gqFLT7trEDySohNfsXA
 jn09ItRzWqCJGd07ly1BWwWXwrDVnaj7b5BW5rkQxuY1tq+ZmgkuYHrGE2/pxGXllf33
 pufZ3omz80hSra1q/vXZe6elHELqDV3+F3ZTzPMNZoHv10CQNgFEoKo382qKS5S90nEe
 QQLQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9l4JmBgTrxDT8ulto5mSLm/MdCpHur1fFd1xvrGdVXkwiyQBGQgbTh7pwQyW9lct0akaRygtPZYQ==@nongnu.org
X-Gm-Message-State: AOJu0YwAtAw6IG4BmIhGJ0AnO478zKmg70IPm0xvF4VFuUyS3JED2Ugg
 NWfFDddhp8eCF1wZVPydwWoJpFo9cIT0YmO/RKjY0+Xnt3mTUugr/gahwZxVWuE06lkNsGOOM2b
 3ZvjO+oYUEYEfEtfPx9Uof2QIZKViznXYycjpnhZNyQ==
X-Gm-Gg: Acq92OF3PpVGUQst9n+HYpqUKSbIHJUe5HO1ix4J3TD4PBvcHn8tcdId4pOBkm4vKr0
 8X6vqEWu5rojPJF9+CRxmjV6MhQodZnqh+7MBayMbY8IO6PJ6YPbe0Z70NYu116YP6IudC5Nr0H
 hUbYyP81dOMjwzew0yf9NyBMtRbHb2HJ6L7She2wmLtp9Zp7EGTY5/4yADHc1w8puqUGLaM8Wy1
 GX3+ixeRAvVul2T5Cg8vGgjxaQAl5l4OdCAQDA8/606g/owOAdE135w1HMwLvmLZ0tH/eTD/3th
 g6Tnot6mWUIptSbgWZuSeKqJcnggHRk9VaFIEzmFMiDRxJRJvruS8EOI6UQzNn14EhA=
X-Received: by 2002:a53:d008:0:b0:65c:5329:788e with SMTP id
 956f58d0204a3-65e227bacc0mr2480805d50.32.1778832248002; Fri, 15 May 2026
 01:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-2-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-2-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:03:55 +0100
X-Gm-Features: AVHnY4Ke-tAGlteQHWfYiv4ZYE-rSsNmuu97DIvTD-XkmqgM9rJgTsCezHgFryo
Message-ID: <CAFEAcA92NRy1ePw2nHuGj7B4uzBOzGiPeMsAGjsF6viX+wQxnA@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] hw/timer: Make frequency configurable
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> The a9 global timer and arm mp timers rely on the PERIPHCLK as
> their clock source. The current implementation does not take
> that into account. That causes problems for applications assuming
> other frequencies than 1 GHz.
>
> We can now configure frequencies for the a9 global timer and
> arm mp timer. By allowing these values to be set according to
> the application's needs, we ensure that the timers behave
> consistently with the expected system configuration. The SoC
> configures the device correctly.
>
> Information can be found in the Zynq 7000 SoC Technical
> Reference Manual under Timers.
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

