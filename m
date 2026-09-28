Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB41CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBRT-0004Ut-0P; Mon, 28 Sep 2026 09:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBRO-0004U5-Re
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:30:46 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBRM-000847-EN
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:30:46 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e56a1b327so2348046d50.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 06:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602242; cv=none;
 d=google.com; s=arc-20260327;
 b=aksb7Xjns2K4bvnxyOUAfDHGlMZliokiq1siBDvi0UHCZv5K3JkGmqalw8iEyCtZhA
 eodkahKc3JRix2/REEKJrI9O88Qx2PRwe2mqF8r6BegQGUyO3h1ee8HOzBFSb/hdFG7r
 uosxqul4r2PKiQ7Vz9cYsMyUmAfa2BRZ7h+7faFu+zC6Uklkg3YwxAPm9aIl7WuRl0cS
 rtMK18AabMG52Ajr72RF1LkHxBtnU1IXdDUyngiQBiHS609Qll7i4ro9LG6xjTj1dmhu
 QFB2CNtT8tPk5fzzc04MISLoVFlF5BzkCVbIzkyCriq1pgZkHJIqcwtRSn5KlpQQBmS3
 Rhdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=F61TigGnQSYhF0wVQMn6Z/FYAGBBgBYsjxIbXVVaoU0=;
 fh=FhwNYgUi8z2vYhjjSCi3tL5T4IpvpiWcSDCHQk+icZY=;
 b=DlRZDpvLS6ejLLMAnafgXjd+YVPUjjhn522RE4jQ5tzrOrZJd3VCTdXIVr5so4W9NM
 RrSp+Wwl2Odk5GD+hir9/6XeXcAIOgMNgXwrwdUDEwKuqUhRxgILo5NN46qr4KpGJNk7
 bGYFET+r9qK+foAG/s25Q1Ur1Vq5srAwEOA/rH8KMGL+ZeVWBNTBTiiu4d/dc5RYY16b
 MEvyb03J93PEe8WCbJqnbjhoudUKaT+cR+Iil2UMNuahKccFp3XqsePggJO/pt5h4fJ8
 8VRQyzpCBziGFJ5bw7zChPiX+IFfJShWeOARTiCIier6SCqGQQe72oKWOjlvBpmx1z4P
 7ClQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790602242; x=1791207042; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=F61TigGnQSYhF0wVQMn6Z/FYAGBBgBYsjxIbXVVaoU0=;
 b=LDtmZNHtjw1ui2tsqwtpIbskx0x8klN/3LOj0CniGBc9xaIATpExDThdd86dm/i05i
 2oYdraHSOz5GRXPP6bvbpfIU/xs42iED202fQMSgSb7n8eyl4aF0JfsHQadrW9BJIKZm
 PQU/rW/4Iq/+ZpeM0KVz+hhQQ2p/hz86J/pmxGCsEQ+ygDtxSQHfnTe433AoCnKRZGnT
 zhyzbJ8XdRrmNG4WKMD7HkC39cdjON1yIxz3a8gFtbOllPB/IoAdNCyAGhyx2DuRF3EW
 DX8f/8NUUHDJDNuBAva7AAMbwvPUOJfoq4GDMHspSE8A7NXgLEX8rGHSZwD+gILk0OCk
 CVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790602242; x=1791207042;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=F61TigGnQSYhF0wVQMn6Z/FYAGBBgBYsjxIbXVVaoU0=;
 b=j3BqhaQ0psykkgOyf9ec6oVQkHGEJ6ZcVXi0lkg+SN0pjtNeGNAPiJ3PUrMIjSoUtj
 LcMVwGxR9Y+oHsF8y4ssAAdusoxS06Av0S4HPvlhDgWHrThmCFjTvwGdiMdWm8pNDGXv
 AQED5B48oG5+bCqSTJu1M7xOflJ+IaEaZJuoRblYc3GfG8f6wat42NkF5ZuKdW0AVZPT
 gcyPSNAlvjatjbOaQICAg2yZ8yegEHd/CWhzXZ+qfc9fxCutm4Xq2iaAnRvHebDTTjPb
 CCRjvza6Hwm7YcKrrWKymxBOxAmIDLX31/6V0WsShBu2IhBmqWfTyuI/sH6nrY/vMeOx
 IHiw==
X-Forwarded-Encrypted: i=1;
 AKwUvByitYPM5WzaCud7YhScfg0y+U3GG2kDGiGgBdXS7NOLs2xKtFMbyPijp5yw0HM38Bh7GOg40bo8qg==@nongnu.org
X-Gm-Message-State: AFq9FYKgiPI+Iv0UL9W0HM3VTE+ip/XVk/K2ZP1w8QJMm3cTZPCHhw4y
 clVHMEMTJKQ3GKhzbvxZUW9pxSWqEERZWhMf8xgmYgeJlKD8A8JYAVKTjie8KA6jnmQBJm+Nj+S
 MLDBZ9BuNziDhCDKtetR/J8PUODgWt30YLcVFkD7KZA==
X-Gm-Gg: AYBFou0T3dNmUXYEHzlVQ7LmLsO3ik0KF1/+3eV89B0MH8JMEc1BQ8INsI66GKytcph
 Ujpqhg8rq85zzU5iXpuVRK+ara3rKz5jLd7zk4xC0uzdtpKvza/4TFQfn+v3LlEwhY7UMuAZEnr
 fByUtLalfjwPeCBe2lfKHHTMtsCThK7JMHqoGo5NO0Sd2OE/Dj+N3V4yp8visWK/q5wAPO9QUfR
 C1qlChv2nPanqMWWEqUhz8CECaAjFG95uresvIDdX6H7edkbDed4e+zyL5GBx5n1F4EjGk8JwFz
 x6YJhX/W1mst+8kPK1xbftxvuTGNAcn8cdj5jH6teIUhpDaVCH22SsP9Wil0xrZXMRhfH5FYyJy
 1zSjyknvtrO03nvgpSmuo2bHu+Ys+tK81tuTxu5M=
X-Received: by 2002:a05:690e:148d:b0:675:4453:fb45 with SMTP id
 956f58d0204a3-675445405f2mr1366862d50.16.1790602242046; Mon, 28 Sep 2026
 06:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <178983644340.22135.11298603231632238119-0@git.sr.ht>
 <178983644340.22135.11298603231632238119-2@git.sr.ht>
In-Reply-To: <178983644340.22135.11298603231632238119-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 14:30:29 +0100
X-Gm-Features: AclHuK-Y2UKJo6WZXmQDaSE5O3SHJlovVSHlpIt-ecOAGy96VYCb9U_rMNbHqus
Message-ID: <CAFEAcA8W+h+0G5fqTyzOvbLss7_shkQ-OuDGgw867O=WPB5THw@mail.gmail.com>
Subject: Re: [PATCH qemu 2/2] hw/char/exynos4210_uart: fix fifo overflow
To: "~jprx" <jravi@mit.edu>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Sat, 19 Sept 2026 at 17:47, ~jprx <jprx@git.sr.ht> wrote:
>
> From: jprx <jravi@mit.edu>
>
> The Exynos 4210 UART FIFO implementation uses a circular buffer with a
> store and retrieve pointer. When implemented this way, a circular
> buffer's capacity is 1 less than the size of the backing buffer, because
> there is no way to disambiguate the empty and full states (when the
> store pointer == retrieve pointer).
>
> When exynos4210_uart_can_receive is called, it may report that the
> entire is buffer is available for receiving data, as
> fifo_empty_elements_number may incorrectly report that the FIFO capacity
> is equal to the entire buffer size (rather than 1 less than the size).
>
> If this happens, a full FIFO buffer's worth of data will be read into
> the circular buffer, the store pointer will wrap around back to its
> starting value, and the FIFO will reset back to the empty state. The
> next time exynos4210_uart_can_receive is called, it will report the
> entire buffer is empty instead of full, and promptly allow the data to
> be overwritten before the guest has received it.
>
> The consequence is that if a message is sent into the UART (eg. via a
> chardev) longer than the FIFO's buffer length, the first part of the
> message will be lost due to this overflowing behavior, and only the last
> part of the message will be received.
>
> This patch fixes this bug by refactoring the Exynos 4210 UART to make
> use of the fifo8 implementation, which is implemented via a head pointer
> and length field, and therefore has capacity equal to the buffer length
> and is immune to this behavior.
>
> The Exynos 4210 UART FIFO test now passes instead of timing out.
>
> Signed-off-by: Joseph Ravichandran <jravi@mit.edu>

Thanks for this patch; as well as fixing the bug, it's much
nicer that the device is no longer rolling its own FIFO code,
as demonstrated by the diffstat.

> ---
>
> One thing I wasn't sure about is whether we need to save rx_capacity and
> tx_capacity in the vmstate description. Since these are linked to the
> rx-size and tx-size properties respectively I wasn't sure if they need
> to be saved explicitly or not, so I didn't include them.
>
> The only place either field gets used after the UART is realized is when
> rx_capacity is read for a call to trace_exynos_uart_rxsize, but
> otherwise the capacity info gets baked into the fifo8s after they are
> created and should be covered by the VMSTATE_FIFO8.

Yes, that's correct -- data that is constant for the life of the
device (which includes most QOM property information) doesn't need
to be in the migration state. The receiving end QEMU must be
configured identically to the sending one, and so its property
values will be the same.

We don't migrate the tx fifo here, but we didn't before, and
the code doesn't even use it, so that's fine (we would only want
a TX fifo if anybody updated this UART model to avoid using
qemu_chr_fe_write_all()).

>  static const VMStateDescription vmstate_exynos4210_uart = {
>      .name = "exynos4210.uart",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .post_load = exynos4210_uart_post_load,
>      .fields = (const VMStateField[]) {
> -        VMSTATE_STRUCT(rx, Exynos4210UartState, 1,
> -                       vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
> +        VMSTATE_FIFO8(rx, Exynos4210UartState),
>          VMSTATE_UINT32_ARRAY(reg, Exynos4210UartState,
>                               EXYNOS4210_UART_REGS_MEM_SIZE / sizeof(uint32_t)),
>          VMSTATE_END_OF_LIST()

This is a change in the format of the data that goes out on the
wire, which makes it a migration compatibility break. That's fine
for this device, because we don't use it in any boards where
we care about cross-QEMU-version compatibility. But it does mean
we need to bump the value in version_id and minimum_version_id here,
so that if a user does try the cross-version migration they get
a useful error message about the version mismatch rather than
silent wrong interpretation of the migration stream data.

Other than that, this patch is good. So I'll do that version
bump tweak when I apply it to target-arm.next, to save you needing
to do a respin.

thanks
-- PMM

