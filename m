Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0010DCD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:06:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnZD-0000aw-8y; Fri, 15 May 2026 04:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnZ5-0000Yi-Ez
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:06:37 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnZ3-00022E-5q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:06:34 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-651c7ddf514so11423843d50.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832391; cv=none;
 d=google.com; s=arc-20240605;
 b=aMd9FhWVddwC3SVqYD6fsj6zAtaTTopHckxnkY8vJxbocQsmbfAfoNgg+4XXfie8ku
 84pfrHbb8y18UGGKbLqceB773JdpXPZUcAGNM1crTRfcCx0nmMF+mjv5iddab5w+m1Jz
 iHa20b3eSmMzuyr3h2AMEqjceX4JGBDZmcsG4TmLJZ7HpnXHtTVO8lRbAX3kA6giSAj9
 0OGYWVpzYAtVArUF7zFHHksnIAkORAXvolfKfLS34LWzWdVb0AZq+P8LjAVfO5LV8Wmq
 aeou0+praZCXZvpsAYfdX9AdbuN2EaNEXtlcpuAHDMQJrgeMphoM1PtkFXq3++ZVxo67
 wdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=P4dhqE8j+agd/H0cGbTBRS5+8roBEjapfdz3LMq4yJQ=;
 fh=wS4KwNFsx6ylHitVeUIOfq1Dv4MTYiIPWEd+RvQtQ9A=;
 b=e52XXuVy+I/tBdzMaXBOVzI8PrycJy4oLfRoHB1/s8pHhd0v5ap9MQcjte+dahe5KM
 ar1k9GqgT7X7KS+l1SUHFkqyg9PRPO6UIU2s3gNPnnjPEEkQD354cT7i9k9uBQlp6Qhi
 y2dGRF3CmAnDw5U5bJFh+7j7gMx6YkgB+L5zAMG2ATjfhoPkoO1UNY/e02An/7uCaGaR
 OiU4eHpKh4v6qU6l2uomDO6MIN9TsFnIFl/1bRmXgoWRgE57+EdoYCvWCIGhz/2LewU4
 ugFVL+9Ju7B0QtCBMLqrH16GnARULgH8kKMyDE9daIaz59FSfOJE5YQ5Flpki41rf4ii
 cKBA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832391; x=1779437191; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4dhqE8j+agd/H0cGbTBRS5+8roBEjapfdz3LMq4yJQ=;
 b=b87vxyFKQbUMIJzXKJbg/2aZO4sLQHUG4GEoI0Z3DqR/wz+OH7UOALLl3a/dmckxCB
 WM6F+zVFZHaMkRWX8J84jJA5J22KRNfI+npO8u2lUmuvjCvM3Yk5OUAuHnR+NTvUZMfK
 gbA+dLNEcN8BdtpCULkVYjRpkUroUBqmbath4YdMtjtA9ebVPSeAHepzDs6qoND/KZAR
 RP9d0962nb8cL7eNbZ50OSdgM2CMryH8BSLy7bDeemM87weWwYA1ggDgt+YJqHwYGxeF
 oQYfE2l4hfvQl4UJzpELclVT/Hkp1LjoEurbwgptwHYg9ic5/2Y85Ge5p3U6cKT61YgS
 qpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832391; x=1779437191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P4dhqE8j+agd/H0cGbTBRS5+8roBEjapfdz3LMq4yJQ=;
 b=nkBw7o4LHeS0uBnBObT4n2poFJfs8jU5mfIs9+ZZNypznsavZZJ+0yQCNrm4lA6iWE
 By5emym4u2r3lne24G8p9m6tsllXuELLd6sMk768A+r2hPRICihA8O89xYr87tz1kBe4
 tC9+6pYOH2sMcMRo1XCql6i6rvj3uYp1mTYCqEgWhLzMF9uh6HaExpXxPvM1mJEbkaB+
 /OuYnNh5egjKgdt57U8WnGbfSnKfCG7Vo1Hab+/e+aVdTKNVZpEPyD2swhLmbaIc8ZO2
 /ayapoLr/IUVpWGw952UR7PZRfZRA8IvmYkHaDhkAKR/k2gLsAI3AuncB4RK8pJLumzn
 3Pww==
X-Forwarded-Encrypted: i=1;
 AFNElJ9icp93iwrEYdWKRJctVPzegbXJzbhY+IhFmk6uGzmf4ZFjUIeD8eZ81D705WSPUpVhuWNEvwBn8A==@nongnu.org
X-Gm-Message-State: AOJu0YxNjuHFK6GzPoh4XjLrt2vMIfODopIN6YyXxmLrA+v+GTj9jhH0
 T41YyVDRVp0ont1yPA8nq/CDPJKn1bqir7wMLABHZ3NYcquQm+sFxkXWkZ8NHibfy5GwPdCCgBY
 jHYdQ9N5dUDZMUSR0hNyZvVqbATZf4eyE2g82PX6kM0Q/of7Xg741IHs=
X-Gm-Gg: Acq92OHVOR+pqpiWGNnlo1ReRSjlfVst0LVmwJ56QW4PFuVDsukTP6INQfBYQsAyl3r
 I975lsk2egQ0M+zspwNyQdX6wF0xRNPqunI9NnC9oFbKJU21M+2KVARus9FYGAsspBNYxmi1vlP
 ag+k1HyY6ohubrXI4azQzja5Atg0IRKiqgEFIOSLVyvwWZGNhnjKw29YWhn5FZSXW9aHXAYm5JR
 Wn2x05HR0TyaYoBC5ocIVBI7UYrU+uOQ5voWuaPXaE+T888lpWlZOgAwjkHEAKiK9Ldff2klV8s
 z5BWic1jeJd7pHqc6Y6YbwWgyFXhYItLxfluMI7LXjuOxIA6WF7mT2JqjiCIDW6b61w=
X-Received: by 2002:a53:acdb:0:10b0:65d:de00:cd35 with SMTP id
 956f58d0204a3-65e226bbd2amr2381500d50.19.1778832390980; Fri, 15 May 2026
 01:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-14-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-14-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:06:19 +0100
X-Gm-Features: AVHnY4IKOau2RICHQ71C2Jfjx6e6f9U72BtxA-XEIBp9cHgTf_lwsB8maTq2isE
Message-ID: <CAFEAcA-qbSEFD6Zbw3UcU_T1joGcwJrRpceat1QLqsQQuhVfRA@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] hw/arm/xilinx_zynq: Add flash-type property
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
> Read flash-type value as machine property and set the flash type
> accordingly.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---

This hasn't changed since v5, so my review comments on that
still apply:

https://patchew.org/QEMU/20251204093502.50582-1-corvin.koehne@gmail.com/202=
51204093502.50582-14-corvin.koehne@gmail.com/

thanks
-- PMM

