Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A65AEC01D4
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:44:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dhO-0004Cy-3j; Mon, 23 Mar 2026 07:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dhN-0004Cj-KQ
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:43:57 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dhL-0001FS-Ts
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:43:57 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-79885f4a8ffso33555697b3.3
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774266234; cv=none;
 d=google.com; s=arc-20240605;
 b=QGc++6jGyeMotdGWw6s5RCjD6qIfVHmG5Vrt0rIlQ6aFqSZLvZozXhX2CILkbhi12S
 ASuy4Lhbb/J0pnElTGFCUrDUeLYr9p2PnXjasqE3B0w3XHrs+E0U7F+OUvCJR4/zONEj
 F+9oYynTU1lXiy+RncCtsLfGy8NM0+EiNJ3XjEllCF+blsklZUEcQZ6m86lQ1fH4lEd7
 NZLiBUHeEil/Mvr70tAdqid9b2aOUt1t1cMzUiW0uxPlEM1yELD+D+WJY8QoqLevwEx3
 NwhzRp6zfnFM4Cp4VQndapks8hBtt4nMzjifeCrglgVlim7oQ1lMJIsAmLp7WoUqBqjC
 Wj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SNMcaEOH+SNnRbIYCSj4mp9uQnJ7AvR5jOnbX1A1R9E=;
 fh=C5xZJU8/Xw4eUgNIqRJj+dlEJgjzaxeMPNuNc2ZUhh4=;
 b=OCcoAZts8u5B8A9jPvQyI90IkR/6ozsQzzcmkGdLoLkCGaU27urCGUX13WijqQVwe0
 fj+YohGBWv0F0n/O0rN3ags1+bF1HeEdaPe0RJgXoGke4XFW1x/KC+nw2X7+/IqAVvdg
 05eWBTKvXQpUdzFbfjSzm/w8sn2+aIfn5Td+sTDT4Flr6Fb8ihGqGPECEiXqa2FICMk8
 tZb/LNPa1qSRmsHoZdXq79Y0zWWIdW1j12jVebqegHvcLvOFZWNS2AI+oIO8wh2hDEYp
 8qdWkTa7woqOwtYL9paXKAl9DHAbO9APixWyTZT96vhkJtPsi39ckUg1qsZepmCs8zY1
 H2WQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774266234; x=1774871034; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SNMcaEOH+SNnRbIYCSj4mp9uQnJ7AvR5jOnbX1A1R9E=;
 b=zlg5GA22zmCd/dQX+RkHbR1IWwPDJJvFnublUE+6h403Ha6yrLbaeNVGxjNfO1cPhS
 1mFpUSN7JbFqbZAvXcSljLGZcgHwxw8bZPfI2cMyIiOy7/OmW0BDU3KjyGHtoUv+ZAhV
 QrHoEOgHhqMNKw+WsZ5ElQAEpYUZrcnUJG1C2f9j1CLLEH533LjOcMCBadA/Hp7Jhv2X
 WFn7ROoJyl5Kp6lPgtwoT1fFQ5h8aoQ6vxZnXlvlZYpzCsRW/GoD/e9nP4WxyZvczmPV
 +Ymxvy5NQ/DBkMm2UHOmIh8q6jl5gveakdP7dcbS68yKEUMkdiJm6hQjud12CZZRavG7
 Hgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774266234; x=1774871034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNMcaEOH+SNnRbIYCSj4mp9uQnJ7AvR5jOnbX1A1R9E=;
 b=OT9qyrpEMY/xoD3pk4vKok/o+c8xdwL963YOdVXATxM5Mw0BU4zkJF4lwCAQnKPhJF
 7kly5aveXH5caPEpUEDJGb9BU2sFyVNIiFgHt9pEBRtQjMQTqNEFis4r+b8INkV0nzSt
 A5VK+Ge8wKMTwx0pBOmt24GUm7PXvq3nfYYTePgSgw2zAtQSxEG0Mkxcjqkk1xJ+hlVZ
 wF4wBo6o8YvihAGPcTwhqE9jQ6Kya2hOQa16yT/PfO78oL/7eqQsvjlS+UFrhq2ubYOf
 WC6g+6SQfjASmUfoLxoD+RKMJu+PZqYq60HoWZ3Gdkj/x2O00L59A8VET6Gq75OHZE4f
 DPUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnjrmlgvYiLK0E9EapxdrDFSXtapdMexo2gQxX3tNAMP3SEyOLH5b5uqX4mumpi7XbzBAed5Jyjg==@nongnu.org
X-Gm-Message-State: AOJu0YxSB8zR/KdsbKy9hx1ave11jytifb0QzaYByoEEP2ZrM442chJm
 6V/OMMu637UkmwwjQTXNavzzRZdkV6EJ+t3t1GE1jrYs2/MacBYCtVTt0JksHn2QCBMXG61R/UJ
 Y5kLAx2+UWyTBsHmCO22/berkT82/IPxmBij4ddIRZg==
X-Gm-Gg: ATEYQzx5z8yMTG9SzqwL083XwaOwUtL+Cvb4pJtjfxbt9BXOjtbibgFt66rQBK0Wm8m
 m5eP12y35K3kxlRdMgWxjqqCuMtCEbamf6u9PR5U5gMralYePwd1u877Ut1+zfAgBKtfUGkJ9GJ
 0wzcUmjJYwIcXQEV49eQfMXbEsIfmfVZ15jwptgmhaLizstLZg9/4z84EvvGCakZwccKWK+Lv1p
 7CM3MFEimcHJbufts9YyWj3Mi89YBC+EKddBfQjtnpMwibv8mzD0BMRR3iTROPguese5jCLmt7m
 iNC/ZtMWlKXH0wK2hMbgH8wfk4LsTbpOpExO7oeJPz+jjfHDsj8R+zqIkxaBeIHMiammbsVzmRH
 yvQ==
X-Received: by 2002:a05:690c:82:b0:798:da7a:1ef0 with SMTP id
 00721157ae682-79a90b7ba82mr123984397b3.29.1774266234364; Mon, 23 Mar 2026
 04:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774099044.git.dingtao0430@163.com>
 <53bae159845bae966f620b42e7873b7f24404284.1774099044.git.dingtao0430@163.com>
In-Reply-To: <53bae159845bae966f620b42e7873b7f24404284.1774099044.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 11:43:43 +0000
X-Gm-Features: AaiRm50XOeVJ7iowjOG63kaaqJtqJsVgWS_yMBGBXvHA1ywP0PnfwzT36HH0rdE
Message-ID: <CAFEAcA8FpEWCKQK5_jDQ0MjvGqHC-vmYT37WxyxhLMhUBxqg7A@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] Fixed the PL011 FIFO level bug
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Sat, 21 Mar 2026 at 15:47, Tao Ding <dingtao0430@163.com> wrote:
>
> According to TRM, PL011 generate a burst or a single DMA request based on the FIFO level
>
> The FlowCntrl field description is as follows:
>      Receive interrupt FIFO level select.
>      b000 = Receive FIFO becomes >= 1/8 full
>      b001 = Receive FIFO becomes >= 1/4 full
>      b010 = Receive FIFO becomes >= 1/2 full
>      b011 = Receive FIFO becomes >= 3/4 full
>      b100 = Receive FIFO becomes >= 7/8 full
>      b101-b111 = reserved
>
> Only the read_trigger of rx has been changed, and there is no need to set a trigger for tx
> because write tx data always completes in a blocking manner. That means tx FIFO is empty.
>
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> ---
>  hw/char/pl011.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index cb12c3e224..c96a706da1 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -129,6 +129,14 @@ static const uint32_t irqmask[] = {
>      INT_E,
>  };
>
> +static const uint32_t fifo_level[] = {
> +    PL011_FIFO_DEPTH / 8,
> +    PL011_FIFO_DEPTH / 4,
> +    PL011_FIFO_DEPTH / 2,
> +    PL011_FIFO_DEPTH * 3 / 4,
> +    PL011_FIFO_DEPTH * 7 / 8,
> +};
> +
>  static void pl011_update(PL011State *s)
>  {
>      uint32_t flags;
> @@ -344,17 +352,24 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
>      return r;
>  }
>
> +static uint32_t pl011_decode_fifo_level(uint32_t val)
> +{
> +    if (val > 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "pl011: invalid fifo level field\n");
> +        return 1;
> +    }
> +    return fifo_level[val];
> +}
> +
>  static void pl011_set_read_trigger(PL011State *s)
>  {
> -#if 0
>      /* The docs say the RX interrupt is triggered when the FIFO exceeds
>         the threshold.  However linux only reads the FIFO in response to an
>         interrupt.  Triggering the interrupt when the FIFO is non-empty seems
>         to make things work.  */
>      if (s->lcr & LCR_FEN)
> -        s->read_trigger = (s->ifl >> 1) & 0x1c;
> +        s->read_trigger = pl011_decode_fifo_level(extract32(s->ifl, 3, 3));
>      else
> -#endif
>          s->read_trigger = 1;
>  }

I'm always a bit nervous about this kind of change, where we have had
something in the device for decades which was obviously working around
some kind of problem with a really common guest. The #if 0-d out code
gets the wrong answer for RXIFLSEL == 0b100, but otherwise it is the
same behaviour as the code you're putting in here. So I worry that
maybe this re-introduces the problem that the comment is describing.

thanks
-- PMM

