Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1854626njb;
        Mon, 29 Jul 2024 08:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX83JfrxkHvHjoDmesAcFXY+G7RM+0KQHxOg4fjhbuGwJ/nENtNIRjJiGVNNVBg0zkhZ2wUy0J/a6LvBu3WX/3XUISS02GW
X-Google-Smtp-Source: AGHT+IEtmTXRjE+USCP5QTgUEehsXNHG0wG7eokLCR97cOeD4NKZkQKqi1zXxBF7xNzOp1Z4uOOt
X-Received: by 2002:a05:6830:4908:b0:709:3c0a:ff00 with SMTP id 46e09a7af769-70940c8f082mr13560626a34.24.1722267138414;
        Mon, 29 Jul 2024 08:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722267138; cv=none;
        d=google.com; s=arc-20160816;
        b=SiTjnxDxRle46p+GJsOKTYTZ3LWX/jwIV+p+uqJ7fKxXWfJsAvWHnJD0zn/FZsAbRr
         wh7l7Br84Q939BT+D2QaTq9heKkKe6EG4RlNEDhB4N9odJ+qh/R4ai4PVkSVWbCTgJKt
         rGiK3orukMxIh5yI9mwEWpFP15vaolB49OZVQCJBljYSfpq5yMU1kkKbu+q/ceivISdW
         v3B6UGDojcun5MTXNcVx3LrYZHg0gJEJluBeIumy2flPHVL9feV6yuaIBb40drNRM42c
         9cebTFR6lD9YMAavmLgdcesAWwMW6a4+73u8qZ1rlRdlcNCiToogOY9MluXBNwQYe/Cc
         cDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zhKcAf0ZWfz3qp6TykGkjQBKnlkjPN9B9/lzcKl1IwY=;
        fh=EdsZjsQ3zNMK6YoK3SJaTUZtRr0xSk954j+Ulqr12A4=;
        b=A8QOeIUhcXof3Xaplcj9ltjHWnh9AOUtcwlRyQ45lp3SIzEVDWQhldGRnkThvDb1Mp
         fnQ7kNFlfKRovYnznJX+WuRYmWqWDGfPWDHI5n4qCbjLSwjjU3ZhIIJf7I6Aj+tns0KT
         dPRl1xYIzuco1+9D2HIanZc2eJRgY/n3Z9gkFxizSIhSeWam0IXBKxGl/1Zvw+VA5+zN
         EWprLO7V0QQkBS6/FAxUbHjLSwXJrawbz2pAUq++Fblz4XvGi2zgxuGHdm+QAP/V0eEA
         uKt39Nsv8NjKW/+UmTlKYOUcCXmLXhgbQTcrRVZkDiVBryk1L579N7PHsg5Ggiyn8dhm
         XuwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuVAa8Jt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d744505esi1071718685a.226.2024.07.29.08.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2024 08:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuVAa8Jt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sYSLy-0008Gu-0U; Mon, 29 Jul 2024 11:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYSLx-0008E4-8O
 for qemu-devel@nongnu.org; Mon, 29 Jul 2024 11:32:01 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYSLu-00016r-Bb
 for qemu-devel@nongnu.org; Mon, 29 Jul 2024 11:32:00 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a10835480bso5443650a12.2
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2024 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722267113; x=1722871913; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zhKcAf0ZWfz3qp6TykGkjQBKnlkjPN9B9/lzcKl1IwY=;
 b=UuVAa8JttULL0Whup4slWn3pRRX780JPHyvN2u61R06U7oyRTZSmFjrby+w5nTcZFk
 hkQDKUCXvci7mVZ50EPDqe4VS3Xrmi5KMOz0STVLet7p2HJPgxJFLsheapRTBVlG0TTc
 wL74+wXCuquBHNhEW5PLFkD7yEE/W4uCZzVMeX+ShE4hrAxw424sQltksa1yzYSLBZbD
 ZR/1MhSB2xkiiKQh70N7qEthh8RLbJmVIRorqpV1rTDYvqwVQx487P7hpofo65HjBd+9
 kZrIiPMUXESEN0Q2Y39qNVF+E9GHrjDYVMVL9hq62aKf7zVb90ZIMT4yQG4tQPVRY0Y4
 Bl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722267113; x=1722871913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zhKcAf0ZWfz3qp6TykGkjQBKnlkjPN9B9/lzcKl1IwY=;
 b=tRiDYCOrubWqGeeg7OnpBDGvIg2uNVHKx3eQ222GDAxJBbIxcbj7fVTGyVkYxzQn9i
 CotL+FFq3F4ynkbFe+SMIY5n0LglfNmC1c/qtSaroQlTTpFAe2mhEtf5iWoLXxgXY0cH
 CaPBZ39pwuQUpjIMVMMzy9En8qyH68qb0RY0djCcqSLA4QcoI9NNLwhbzBryeIPK/uVe
 MccaX9bPuhnNnkSDFTiGeH8DtTW7jKzfZ41yCrjg0Paluz3CVqz2Dc3sOvloxu2uUrC2
 u+Q3kD2zZPuFdXxKaCTOM8SmfjbGEY9F1cNvjCQ1oHQoAGZwBxukd8Ok6uK9mNrMvKjc
 sjnA==
X-Gm-Message-State: AOJu0YyfPVPLCkkwhf6YPUBX8EAfmS7FaM7V2wnpVDaIQb5Ys8wXTf5n
 /tTgPaZnuCACNvRacCn/AVSVCO9W/hFt6KggpfoxwV6TOFZazfeHBaOm2YObuHEMJw5U6vrxHzr
 MgkeqZdT347TaBAhQ9IYePWJdDUmFAhgVVD8vMg==
X-Received: by 2002:a50:cd49:0:b0:5a0:f0c4:aa7b with SMTP id
 4fb4d7f45d1cf-5b022003b8bmr4626553a12.27.1722267112810; Mon, 29 Jul 2024
 08:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240726055933.817-1-jim.shu@sifive.com>
 <20240726055933.817-5-jim.shu@sifive.com>
In-Reply-To: <20240726055933.817-5-jim.shu@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:31:41 +0100
Message-ID: <CAFEAcA_QmSdqTo4zmv=AKox2ZiJPt18vV4CwaLLp6VPLWBMcpA@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/net: xilinx_axienet: Fix DMA RX IRQ if ethernet
 disable RX
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T4OsPMur/COu

On Fri, 26 Jul 2024 at 06:59, Jim Shu <jim.shu@sifive.com> wrote:
>
> When AXI ethernet RX is disabled, it shouldn't send packets to AXI DMA,
> which may let AXI DMA to send RX full IRQs. It is aligned with real AXI
> DMA/ethernet IP behavior in the FPGA.
>
> Also, now ethernet RX blocks the RX packets when it is disabled. It
> should send and clear the remaining RX packets when enabling it.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/net/xilinx_axienet.c | 71 ++++++++++++++++++++++++-----------------
>  1 file changed, 42 insertions(+), 29 deletions(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 05d41bd548..8428f10946 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -530,6 +530,40 @@ static uint64_t enet_read(void *opaque, hwaddr addr, unsigned size)
>      return r;
>  }
>
> +static void axienet_eth_rx_notify(void *opaque)
> +{
> +    XilinxAXIEnet *s = XILINX_AXI_ENET(opaque);
> +
> +    /* If RX is disabled, don't trigger DMA to update RX desc and send IRQ */
> +    if (!axienet_rx_enabled(s)) {
> +        return;
> +    }

This checks s->rcw[1] & RCW1_RX, and does nothing if it's not set...

>  static void enet_write(void *opaque, hwaddr addr,
>                         uint64_t value, unsigned size)
>  {
> @@ -546,6 +580,14 @@ static void enet_write(void *opaque, hwaddr addr,
>              } else {
>                  qemu_flush_queued_packets(qemu_get_queue(s->nic));
>              }
> +
> +            /*
> +             * When RX is enabled, check if any remaining data in rxmem
> +             * and send them.
> +             */
> +            if ((addr & 1) && s->rcw[addr & 1] & RCW1_RX) {
> +                axienet_eth_rx_notify(s);
> +            }

...but at this callsite we open-code a check on RCW1_RX and
skip the call if it's not set. We don't need to check twice.

>              break;
>
>          case R_TC:

thanks
-- PMM
