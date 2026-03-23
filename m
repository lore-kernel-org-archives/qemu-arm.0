Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9A8EC01CB
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:33:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dWm-0000zd-94; Mon, 23 Mar 2026 07:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dWl-0000z9-1E
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:32:59 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dWj-0008BB-HD
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:32:58 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64eb7def21dso62964d50.1
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774265576; cv=none;
 d=google.com; s=arc-20240605;
 b=F7dwl4d1svLqkW21K/cqFHIZ7XBljNIQis6d20pyqnw62BSITZ7ZJ46MLz53YGuIVe
 Zqj8tXfPGTQDiBs6gSyxVbO8JlX/8NIaF3CCVQOpTOmqBnk+S1BTVBHU21tN8gFFKLSx
 nfkvPFTqiL+ltDgIAWnAQ2XTmzi1qUqk8/p7DvIy3dK23z6vwcXGMWs/hIVevvhad38L
 f/hU9xxShZxQ2sNdhnrq1t2WbRUqJa4jpoO2fvnSN4NYiDA39L5fpum6Bj14dU1GnjOu
 l6rSTyH+3Rw0whBvB+/dFEx/xdGBar7BJezsne0cbDQKL6ntcbKrKHTpYTVZc5n2FkZE
 Aajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Uce4dAExkWdTa9B8+QY2xBvUaXU6jGLUBPzqr4+fI2k=;
 fh=RiR/ISSHM34YfT6W/r0WrdPpMgF8yLzHzuMq5TBKj9I=;
 b=GOfY8e26qhBeMGDxHA4Tt0uCdWHrwWIr7hKxbK07neOh727P3hi0LaWqM831OUhxck
 eow79iXWzZo7fQkC4Bh7Db9dZKQFxFPlIoUfj+6oB/cPzymodtMiFmY0XRHYxVMrR+It
 c6IrEAEQ1eK2gt+/CM9VTu1rk6CANorbdd8uEQFrvWvfsNlPoUy5BFMenQyV3C63hawm
 JyLqOqgvth5A7zs/sJyi+a1kVqX7IpRKXBGVnA2A3OY4LFhyd8y/3mx3AAYCbcCB/nox
 UxenZ34FHfBheFOU5dJElF6Wi1I18jI1jX5Qbir0MnC8DWKzISzKXubAN1U4gmff+oIt
 2nAg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774265576; x=1774870376; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uce4dAExkWdTa9B8+QY2xBvUaXU6jGLUBPzqr4+fI2k=;
 b=n6rSmpX+rIW0k3Gt7OTWBqjqajaW1RkMsbvwaaeZ9tzpogJkCsApYOB3rsXq/6k8TZ
 iuq2Shbg859ZzbD2i2XpLVGlFgzgmeVoH8qKS07BN8jBcI2UYhzBe4995P1LTPyRfPFh
 FaGUjarPFCkhYxSu8HFoDNXP9ZmY6fAhOtJ3fA4FKPHNj9PpZCxBous0yjd4StGRqhh+
 Bc7nHBXXe1gG8XATA1ZPHRc1VIdX0z8FnsbOvhAHUGIKYs9ChABNNlY0HOnJiT7kCYTn
 KcKYmobWHyfiPt9JQ7dahVvGyOkMLV6AXk+XdEOsik9CmGNUA0vAMvp34eyT8iM2Lv7U
 FWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774265576; x=1774870376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uce4dAExkWdTa9B8+QY2xBvUaXU6jGLUBPzqr4+fI2k=;
 b=HsjoYJE/BlvxtCTNk0gBWm/5gX6jRMH8cqjp3bbXAvN/IQ5PU0iQXxdwlm6WPcpgOG
 V163CPl7YInKBV+fWd5u1/WdMdALd/AUpXXwGFT2xqUbn4KPM9Tq893D09BG2e0+F98O
 fq1ot8lYEwH7U10lgafPiUEslnOatGH4Fg0H+5fJUAM6bYGw3hrjGQNMYYTkvIrNPQRJ
 A26rzgZG3Dnrjxnf/WLpEkvvP0/6nxFhFxcQySQkwscz36rjudGMDvR/rhgbxI2DDC4l
 /YHL+zudxHvnrhajy71RM3N0fgsj+gM5FmL0yBWljp1JdUtYdG28SfYS+iJFktacUokg
 /OKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm97yEWfWn+KlAOX98QjHf+OmsTMcO/X/PC+oF+bkS/CskkjBug7hVhwWhFMhpMSGqsdyx93UXww==@nongnu.org
X-Gm-Message-State: AOJu0YwrM679VFJDpaZSxyCABca8QZyrpnC0pE/jr+yq2KvgpgGTU/JL
 xfgBDcOdH5QTk40yz+32EnALxCYL5kLCTDdqvraU3+WAzEg2FaSh0tzHh+uYk14Akf2JFO1b0wY
 DLgjKw7COOB1k1ChyUVgBZIt9BxwG5aEFrIoC0FBphA==
X-Gm-Gg: ATEYQzztTwR+lLrjLa8IEhksOBENkVmqpMJap8IU8Ypx1tSfA1T+ntENGoPP4ag2mNv
 1YxfU0pHwPnL9hslgGtx5P0lvEGmIPdXEKdEvThYVgFpONq5tuh0tiE0Vhi+8ON8GAyL1U5vKVn
 FovPTAONNsiM++o30GhkDo5bL6DY2+/zF3ksYOe4C81tyo+zlGlvjXi6VRSaZUukXqtHndGAhHn
 B3qc91C8jvhKWkeRbvxsxUZGXYHQ74l5uwHeeZt4VZ5tGN1rkTf1z7xxj7W1Weg82NZMs5dfrZE
 H+D+2sz5eJ9aWsDK4RsYJU+KC/DTlZF2bIzs2vmThZpoLYV6nvdys9mvSxZ0OeDopzM=
X-Received: by 2002:a05:690c:6983:b0:79a:6d99:b242 with SMTP id
 00721157ae682-79a909612camr120586737b3.0.1774265574862; Mon, 23 Mar 2026
 04:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774099044.git.dingtao0430@163.com>
In-Reply-To: <cover.1774099044.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 11:32:42 +0000
X-Gm-Features: AaiRm525KdEGD6QFdc1qMCIQHFRKN2woDuFxGxjdWhgdlLBavvHfWVDHrTJezbY
Message-ID: <CAFEAcA8S3=pUo9Dw0Lc3sWF0PHK-F-hpObDG-t_zCK7-QuaUBg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] PL011 and PL080 for dma transfer
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
> The PL080 implementation in QEMU currently supports memory-to-memory data transfers
> but lacks support for peripheral-related data transfers.

This is true, but do we actually need it ? The PL080 is an ancient
peripheral which we use only in a couple of devboards, where nobody
has complained about the feature being missing despite these
boards having been in QEMU for decades.

It's correct that the versatile boards ought in theory to be modelling
the peripheral DMA and wiring up the UARTs to the DMA controller,
but what's your motivation for implementing this ?

> Change in Versatilepb.c :
> -----------------------------------------
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index 254b1610b3..ee0056e831 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -281,7 +281,7 @@ static void versatile_init(MachineState *machine, int board_id)
>      }
>
>      pl011_create(0x101f1000, pic[12], serial_hd(0));
> -    pl011_create(0x101f2000, pic[13], serial_hd(1));
> +    DeviceState *pl011_dev = pl011_create(0x101f2000, pic[13], serial_hd(1));
>      pl011_create(0x101f3000, pic[14], serial_hd(2));
>      pl011_create(0x10009000, sic[6], serial_hd(3));
>
> @@ -292,6 +292,15 @@ static void versatile_init(MachineState *machine, int board_id)
>      sysbus_realize_and_unref(busdev, &error_fatal);
>      sysbus_mmio_map(busdev, 0, 0x10130000);
>      sysbus_connect_irq(busdev, 0, pic[17]);
> +    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(pl011_dev, 0));
> +    sysbus_connect_irq(busdev, 4, qdev_get_gpio_in(pl011_dev, 1));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(pl011_dev), 6, qdev_get_gpio_in(dev, 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(pl011_dev), 7, qdev_get_gpio_in(dev, 1));
> +
> +    sysbus_connect_irq(SYS_BUS_DEVICE(pl011_dev), 8, qdev_get_gpio_in(dev, 16));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(pl011_dev), 9, qdev_get_gpio_in(dev, 17));

These don't seem to match the channel numbering for the UARTs
documented in the versatilepb manual, and only cover one UART:

https://developer.arm.com/documentation/dui0224/i/programmer-s-reference/direct-memory-access-controller-and-mapping-registers?lang=en

If we're going to implement this, we should correctly model
it in the versatile board and have the test in tests/qtest.

thanks
-- PMM

