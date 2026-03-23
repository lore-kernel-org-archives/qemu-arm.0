Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB52EC01CD
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:49:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dmz-0005x7-5r; Mon, 23 Mar 2026 07:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dmx-0005wc-PW
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:49:43 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dmw-0002E6-9Q
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:49:43 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7986fb839f5so39831607b3.0
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774266581; cv=none;
 d=google.com; s=arc-20240605;
 b=ILb2qV7J5UXdcs9+cE/H0FhqCyZM63/6oD1B1dmEqnC0u2qlv9RMLw0FeKpiXpZSOr
 0o6ru7NeeUP5OCt2IuFnRMBV49hJ9jl1seUKMxvXgMPcWp01kXohatlTefNRr8SCVFR7
 UjrVt176tv/KqdSIZWIDapxfc4IlX7EqrMLQd9h4APJsfbtDo212X82EF487kK5PGtfx
 4UxaQZSqVpZJ+2kRmn3W/uEGWO9V9okcewJH/tmHv4jJdBTpaODq4/I4Q7Vk/b+Af/+5
 rai9KTKspUM0XSFlv0M+tiIJcbzGInWMyj36AmCTpIxzviE7Le7b2XXcjMcAYD62CpQ2
 3xdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=a/I1sHcUTA9qsXLQZGVHbSeHDN/6/UdW2iP3Bh5paiU=;
 fh=EM0pQc7SsVFxBxrqzUPisYhv7M0qHEiq1GSoPloVclg=;
 b=dfxRGSyS8+G2gcdU3PXH4dLplVObEB68z1/YKmbzMHhA72PSqZYx9/V2dBHMUf5CFA
 vS4mOLK5YPYPaV/4yRYqa1UQ+p7NH/N0VcCet2hy11ZrRlOXm58CmsbDWEz/5iB0LJt6
 p1xRv24sKMdSCUGkXMPJFHyl0v2pOV5OgYpYcgbyXsRu8IDJuVTGjy7YPE9qrgIbscai
 kvbwJe9nmascL1Ms9N1CdQTBSyhJUi0YHhjBHGT5jK2Rh5toiscnf5FRXVr7DaUGHMFB
 boTkyOz45g7ls38bzyGRTY4sLlV/wMnOZW4CCG9jYYiJ+ssh0UI3bQ/oL0Rjqysgt0WZ
 Thmg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774266581; x=1774871381; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a/I1sHcUTA9qsXLQZGVHbSeHDN/6/UdW2iP3Bh5paiU=;
 b=wpaOF6fJqQGdvUPqoq0bDFPPJZPJ04qv3B+vmvp0avxlI2SStH/SCCQpKqoq7et7bL
 fiDHj+zd1akjyC1KoQRv4Ap3owuV552aDmZf8JhSlezymQjlWSWfEKvi4lgqvJPbGyyc
 6+OyVGud1HZCP8pyP92+ig8QtJoKkZ2dhVNusBohIqC9mpR9QzMmTUIKJnLGSRHpl0Kg
 A4yQe5gBXR7RZQDpnK3Xvy5DMZv7fBRR5I28h9SPzh7XKbb3IBstQZTn/hAvj15oAMnD
 Mq6IIJVeOQFOMj7HH1jADJoiOJlu0FYGP/JWWt8C17piteHI+wBk7P2n+VRE9ZPe9im1
 lYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774266581; x=1774871381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/I1sHcUTA9qsXLQZGVHbSeHDN/6/UdW2iP3Bh5paiU=;
 b=CCsWEXdWkN8V+7GeF0XI8wN7RxPzu5VycN4MNL1rbmGZLfWB55zRPSDPj6YJL3dy1T
 hp4LUObGL5E9ITae9rlhcv4lRlehCQRHkvIWTG9IEG+w73JrUz0rlBh2bHlGzJrjSdIb
 qvA7qvcJbKQz9lvjZmlXoukzw3yZJE+JGzDxxWZqN6eXReTKGcA2CAo/85p5jHVr+hB7
 1gcxcl3xleDVssI3pCLpr3h3xvC99u9CM/tO77R9qUFNU6l21i4FE1dGQsFZFpY5RESZ
 RN7NNUEtWvcO2HETI0h4ZkOE0v/jwr7HuDFlJip9rf/z1dcyd3iJes6FTGOysmsUaGhX
 qyuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjg+oEPA2QW6iIi3U0kRD4tyI4xmKowanPNjqJ18QTw1oIrg/9NWE0+6kdyQy+Rk7sODCtjabVVg==@nongnu.org
X-Gm-Message-State: AOJu0Yw/Y3bmdVkHW+kWx0NkXqByz48/PcdajRsCNUb7TINDj6gxbgFC
 qvz8QWtnZAqCU6gYbp1q6LYUq5vNi2TTqFMf8VnSyPbIP8N7dK1OyThj/3UYoPlFf+5i6t85hdq
 LEDmDPTaEwUYOx+pk0tdV+LE4XCwWlhF2bvTGjml37otklBgool9ZSP0=
X-Gm-Gg: ATEYQzxHPylAgaq1PRQoKHE3ZgwRmeGlhGdk8Xc856C+zeek2Up0EgwmPidoopCuQVd
 mFq1YQl6bZSbeLh6YCFwbEMkU3K2M79Yv4uu2ISgpgNS5UadJAym+LfEAor7KIYQuJq2V8pKop/
 6H/5CLVOsHiza4i8FLog+fT9uLHlYox2By7xJceZT1ptqGj68A1Ps9k4OLbt6793NXw0Cis9Fyb
 uvrp5K2L3CrWkJPMBQQYtbRjNK0FE2jFuluifNfEYeogrXZSHgQupYl9bWL0mjx7lGIBNVgAR/Q
 foRgVOOFYL6KcaEikUd/xgmyNdKPMAFAtPCOXVaKLfWX4xCo54KnO6xJJGxLAnYXJV9KipQAVI/
 P/g==
X-Received: by 2002:a05:690c:4990:b0:795:294c:fd4d with SMTP id
 00721157ae682-79a90b7acafmr126214287b3.37.1774266580781; Mon, 23 Mar 2026
 04:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774099044.git.dingtao0430@163.com>
 <3411a43d161ef59db3db1d7ed0f84839d50ceb33.1774099044.git.dingtao0430@163.com>
In-Reply-To: <3411a43d161ef59db3db1d7ed0f84839d50ceb33.1774099044.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 11:49:29 +0000
X-Gm-Features: AaiRm53HhedbXWr_RWJu6Gfz2JH9Ik2ijt8qkpuhXrrQ02EO0bn5VFgKHhiSubk
Message-ID: <CAFEAcA_0JMqY-RCKtKL0uaVKFVfmPSR2-Ta7Eo2FHY9qRp0ThQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] PL011 generate receive timeout interrupt
To: Tao Ding <dingtao0430@163.com>
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

On Sat, 21 Mar 2026 at 15:47, Tao Ding <dingtao0430@163.com> wrote:
>
> After changing the read_trigger, no interrupt will be generated when the data
> in the rx FIFO of pl011 does not reach the FIFO level. This will cause input
> in the console to have no effect in Linux, until data input exceeds the FIFO level.

This sounds like you created a regression in patch 1 and are now
fixing it here. You should order changes to avoid doing that.

> But UART will generate an interrupt after a timeout period after RX receives the data.
> The relevant description of this in TRM :
>     *The receive timeout interrupt is asserted when the receive FIFO is not empty, and no
>     more data is received during a 32-bit period.
>
> To simplify this operation, pl011 immediately generates an RT interrupt upon receiving data,
> which means the period is triggered instantly. (QEMUTimer triggering is also optional)
>
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> ---
>  hw/char/pl011.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c96a706da1..58803f0fc2 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -200,6 +200,9 @@ static void pl011_fifo_rx_put(void *opaque, uint32_t value)
>      }
>      if (s->read_count == s->read_trigger) {
>          s->int_level |= INT_RX;
> +    }
> +    if (s->read_count) {
> +        s->int_level |= INT_RT;
>          pl011_update(s);
>      }
>  }
> @@ -281,6 +284,7 @@ static uint32_t pl011_read_rxdata(PL011State *s)
>      }
>      if (s->read_count == 0) {
>          s->flags |= PL011_FLAG_RXFE;
> +        s->int_level &= ~INT_RT;
>      }
>      if (s->read_count == s->read_trigger - 1) {
>          s->int_level &= ~INT_RX;

But if we do this, what was the point in changing patch 1 so as to
make read_trigger accurate? Now we are back to where we were
before, where we trigger an interrupt when there's any data in
the FIFO. (At least we do understand better now why we see the
problem...)

thanks
-- PMM

