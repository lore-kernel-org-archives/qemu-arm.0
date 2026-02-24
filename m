Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12109E9B251
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 11:26:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuqY8-0000ue-4n; Tue, 24 Feb 2026 06:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqY6-0000qa-CD
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:25:54 -0500
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqY3-0004Iy-2U
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:25:53 -0500
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64ae222d978so5066701d50.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 03:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771932350; cv=none;
 d=google.com; s=arc-20240605;
 b=PEvOg9TOnza18vmxR18+5uO2MCHbvAI1h3Em4s8QdUYOM7RognNLVk2pK63cjLxKoS
 Gy+zG2vCGL+D/haXeF6cIr9opN2TWmfTkOGsAwMk94Mj0fmS/ospWDjB0S+wRZcifM3G
 ab4fHhAIr1LmbcNxQAosLOV/TPN9VZHC3nwGFWtmRK9uC0LuPO16yh2T51JCGfZ70zfr
 n2pRIJ6YD3rD2tZfLUKPlWJj7y6iSlY4qr4KRHmGe6w8fDGwW+4HjKh+5f2VDpdiOkBj
 4LgYfQwsqFJEBdh+o6L5YjI/6eHyAsSqTRSwpndzACVbbevueqoxeuSU7z9ijDEgeXdu
 t3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=anqVlmblhXoqErTrjBU1z0bUl/NdAXado1i7fdBY8Fk=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=Xd8qz2J0pV13GA3ZOY6aqzbvzNUCFd6OFcDA9uOGzkh8uW7wbjoN+z6MJup7K/PhkW
 fjcNr90G6sfD0RT3EThJnfx+a7VL5a/Y1NSsfMLDZ1qvNRLNW9kCTX5+Se+H2gSENbgZ
 Z8dD0UdbwYUnLm1Y+1/DXagYVyo5ideHyuZHCq/WZQ1XAzF6zXGTlz0IdUkOd+ROXk1T
 5hPPIxwFcMrPGCgNDbdAweRLEasg9ata8QKGJnxP6uPvNOQC28CtmgCxeBVZhWnz+xv5
 rCjWGHkWesuDT1ehEsQtr46rV+CqggGW8YYysQDghZykGCJFT0l1QIa6wilB0ujPWnTF
 EBVA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771932350; x=1772537150; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=anqVlmblhXoqErTrjBU1z0bUl/NdAXado1i7fdBY8Fk=;
 b=RCFMloXifjXIpgfg0yQMkRK0Fuj6QcfbaEg/kvpIglOJqE73SJtEbP/GiqcojoEAOv
 bxpOnNRM4GWFgJ5lj+jy4hxyIo21z92b8X1yDzyJ9ElWCOSX4BFYd2j3zVv9gak9l7mQ
 49y3hz90bEdwukQF5oekWCRpjkbJP/vIQ/HFg6vh8vsotoHSDBmEjIg2up9SjqGkCUoj
 g2oWjjjHfbMcpJHKRgfqqJVWDxp29ApoAr8QHbnaMM6T8d9fixzIr3mtihZSamD4vuSh
 nnjbgPLhq5DNV1fTJOQJ/bdC32oofF5xY0Z1sSfDJCAnmLFyQf/T5Obw9syvoy/lk8lL
 2qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771932350; x=1772537150;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=anqVlmblhXoqErTrjBU1z0bUl/NdAXado1i7fdBY8Fk=;
 b=cNiEByaMAZe08y6XSJx2Js0aunDdPvn/lb49vSNe9gO9k96shHCmRUDfreu99NtxiP
 3zV3MN2tAVgGaB88VlNrljpkhYfsvvqrh0JJgw9njuWIvszZVVeUZbuojf6bTSXvGOjG
 1VrZtnt5/RQvnZmaOeYHdN6+MXbmi0ILG/OBHuxAGvJ8wb9EYQMW+5VUam9Uw2btyyRM
 KKX3fOgOUY/vgUj98PyYaVAICV0GPQqN1Qahw7Ixx6fCM36rx27sNubho1VQ9I8T1O2r
 WtqFnxp4S3ZzY1a26EApMFKfQuEawR7mqB7PMgCXw3dmk9/wYziKLdejRYDxXAz1HyWO
 +B9A==
X-Gm-Message-State: AOJu0YxBZ0ho4CtwsgVYD77sAdtv3ml/97wkfP9EQPzsaAM7P8qmBwws
 sjNYVzoBk8hkRotswtg59K1g1IFu1lipuDb6gfHK1dmld58vrElR157he3Q0jWm3j++zXlM9RIi
 cbNDaAjzRbtXFSnYxVMlrFG8E9IDreY2XmJfvojtdmBldtItg6giz
X-Gm-Gg: ATEYQzxkHFSfQ6hSiacAFI8pDMFd4mmAsAiljC6XkG5AWPT9EqxDzk2VPeJ/IpP/Scq
 i/pCdgk2Gy8TmXAiTJpEZMdMvLGnCvAn7PZAj1v2CiYp6dEQEzwyxkFd3hmcjQGnEN7MG54ULti
 UWmlVpHo2AsA46k7eQ/oLK1ismJ5IDxJ+Yzq6u+9Gl/vsXrigq4+e+TvSH8R5SCL5WlesMu1eJr
 6HTuxsUjShISvzU+G56icrh+bCwgQL5G0Ysrx9klvwHG7oXywNJRYx09t4FNCEVCbWErIMUiofk
 QBnqhByqTb6EGJzVv8ZgkDdrk5hnmGGeArscTFgKw95AUKgKjHHJ8LpVYjVrhByDe2s=
X-Received: by 2002:a05:690e:134c:b0:649:e501:21af with SMTP id
 956f58d0204a3-64c787d4d6fmr8758791d50.14.1771932349733; Tue, 24 Feb 2026
 03:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20260210101702.3980804-1-peter.maydell@linaro.org>
In-Reply-To: <20260210101702.3980804-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 11:25:38 +0000
X-Gm-Features: AaiRm511caSeVEUCDy_bF5wcOKNK09wyU0rVeClWQjHN8x60RNjpA910bB5vX54
Message-ID: <CAFEAcA_fNFEov+etidkWVqTV4j-Br_rZX7SPdqLQeOwS-77Nrw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Only log "data written to disabled UART"
 once
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

Ping for review?

thanks
-- PMM

On Tue, 10 Feb 2026 at 10:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We log a GUEST_ERROR message "PL011 data written to disabled UART" if
> the guest writes data to the TX FIFO when it has not set the enable
> bit in the UART.  The idea is to note that the guest has done
> something dubious but let it work anyway.  However, since we print
> this message for every output character, it floods the logs when
> running a guest that does this.
>
> Keep a note of whether we've printed the log message or not, so we
> only output it once.  If the guest actively disables the UART, we
> re-arm the log message.
>
> Notably, the Linux kernel does not bother to enable the UART if it is
> used for earlycon, relying on the firmware having already done that.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The log messages here were getting in my way trying to debug something
> else, but I didn't want to just delete them completely.
>
>  hw/char/pl011.c         | 24 ++++++++++++++++++++++--
>  include/hw/char/pl011.h |  1 +
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index b2ca68e3e8..cb12c3e224 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -227,10 +227,25 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
>  static void pl011_write_txdata(PL011State *s, uint8_t data)
>  {
>      if (!(s->cr & CR_UARTEN)) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "PL011 data written to disabled UART\n");
> +        /*
> +         * Only log this message once, not every time the guest outputs:
> +         * otherwise we would flood the logs with this message, making
> +         * harder to debug guests. (Some very popular guests like Linux
> +         * don't actively enable the UART.)
> +         */
> +        if (!s->logged_disabled_uart) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "PL011 data written to disabled UART\n");
> +            s->logged_disabled_uart = true;
> +        }
>      }
>      if (!(s->cr & CR_TXE)) {
> +        /*
> +         * We don't bother with the only-log-once machinery for this check
> +         * because TXE is enabled by default from PL011 reset, so there
> +         * isn't likely to be existing in-the-wild guest code that trips
> +         * over this one.
> +         */
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "PL011 data written to disabled TX UART\n");
>      }
> @@ -457,6 +472,10 @@ static void pl011_write(void *opaque, hwaddr offset,
>          break;
>      case 12: /* UARTCR */
>          /* ??? Need to implement the enable bit.  */
> +        if ((s->cr ^ value) & CR_UARTEN) {
> +            /* Re-arm the log warning when the guest toggles UARTEN */
> +            s->logged_disabled_uart = false;
> +        }
>          s->cr = value;
>          pl011_loopback_mdmctrl(s);
>          break;
> @@ -665,6 +684,7 @@ static void pl011_reset(DeviceState *dev)
>      s->ifl = 0x12;
>      s->cr = 0x300;
>      s->flags = 0;
> +    s->logged_disabled_uart = false;
>      pl011_reset_rx_fifo(s);
>      pl011_reset_tx_fifo(s);
>  }
> diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
> index ff735b5234..5695787650 100644
> --- a/include/hw/char/pl011.h
> +++ b/include/hw/char/pl011.h
> @@ -51,6 +51,7 @@ struct PL011State {
>      qemu_irq irq[6];
>      Clock *clk;
>      bool migrate_clk;
> +    bool logged_disabled_uart;
>      const unsigned char *id;
>      /*
>       * Since some users embed this struct directly, we must
> --
> 2.43.0

