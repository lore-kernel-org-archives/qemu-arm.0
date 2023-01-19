Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp339321ejc;
        Thu, 19 Jan 2023 05:45:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsz88T6N+38XE0hcwbbowkp74niXJwWtnuxQ95FFbNzH2DPxXuQSzqmI/RHLpNivgcFaQl7
X-Received: by 2002:a05:6122:e07:b0:3e1:7e0a:58e4 with SMTP id bk7-20020a0561220e0700b003e17e0a58e4mr5818222vkb.6.1674135951845;
        Thu, 19 Jan 2023 05:45:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674135951; cv=none;
        d=google.com; s=arc-20160816;
        b=GuQSANXW/Flf42pyJpeg1l9xPpb3n9YsfI8jnqXwTwPsAsU8bHADLlqNMgERAkfQAn
         ezM0LwqCYeKIDyguezHxbfV/vR/Gzx8XhvaI4WGGwdmYiLtoTqsenFVAIEgpMopMaPgB
         afPj0YWsHijZnmqPpcavej8kH9tPgtf66l/yg+EruTQ/1QcJARO+5GzuiEozKPCaOTL7
         E4Eiir+xh6YSv5bs3MO2YfjI7fx167pP4ikCD4jGG4M07VVRyhKPcC3o1YeIkrP+ld4G
         qT2xFtsmH39d2h4nebWHu8tOTCQBrJg4MMH7uU7J+RH8tDXToMzHmSEs5Uef7SR1K5xw
         fUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JpdmuGJz6c4TFCGymwgX2VJ4qEcxJKG4Vuqdz37LPk0=;
        b=LZpYE6VPiP26JHlAftAJFVgG5W8cM3gy2YSgXWQXoYTlAYqRtT6STWIIu0oj0UxJbV
         w67c+qD/4cycjGhmzpAF3m4MK3g++hN96zk6vO5W6gLzNBuyenaRH3Z+IwN0WtmDbuPL
         ivM+XGpJXKgEyze9sr9nN7UvyCV3eHbG4W4TVkDJbuUzL3BrDdcHmJ86ywUHOrU4CwQ6
         Q6xAjuBIbQ1sg5pK+NhDQxsXmFV4vCW8iDYAavz7JicG6w3aFRECRXrF8j40ZMxcGrRZ
         5hXZqO34mKJC/otVTeEpiXUQK0imAoj5zdUv3eqnJ7o3/xmDk2XUOabRPCHtvrBcJ081
         fx0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g3Xuju5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a13ec00b007066e12f4b6si6292941qkl.193.2023.01.19.05.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 05:45:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g3Xuju5m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIVEj-0000Mc-0W; Thu, 19 Jan 2023 08:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVEN-0000Bq-Nm
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 08:45:28 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVEK-0003wl-3r
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 08:45:26 -0500
Received: by mail-pf1-x435.google.com with SMTP id c26so1490398pfp.10
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JpdmuGJz6c4TFCGymwgX2VJ4qEcxJKG4Vuqdz37LPk0=;
 b=g3Xuju5m8U8VcFaJIfXYJvYT974BDB4gxgk6G6fYne/leT+8Q7itGI/oyB0yOGJTgF
 6cpNFFBZgHLC0Cf5TbDbB/UIeazfmiSwVN3tX5sTkJe2oRSTRfsTVd0o10Vsk+1K5DQ+
 oxdnrNziU9U/oArY7a06+QEuAuF8kqJS0C84MeLH/nvvlHnRDrvvGJDqrRF18C76u3wy
 XsWN6c2dKEb4uUY4f5XD7J4tvc3T7Gwk50HLY/pB6EjObTf0Lmlggw0v18DO7v4u69Aa
 8Gc2O/rtCXmpx73HdfClHB5WLkyYF5HX1kEeKHnZeSCw2Y/T0vDqZJNIInzeo9CXihaX
 pjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpdmuGJz6c4TFCGymwgX2VJ4qEcxJKG4Vuqdz37LPk0=;
 b=3qHSUPepvjhGB8XmKB0HAAQW1p+p5xs4BLgu32M7x10XV+qyK0+j25bN+Ajffgsq6P
 jwhdDbtfJKUlc0O9w4i+iRsh5EaFTBe+Qpi3E2N1wHuhB3826PZSPGdNhkohTgV9380d
 Z6mioNJfRUS3+Jie27GrqVbAkacisDMGENmiPLC3ZtysH/jabYLgiyKTXr8j+TslaqRI
 UngV10ufvt+X2c+XDFxmB3Fz2Dv6lDyXnGf4mB29RG07jDjIJN+F7+25afqiLfm4Rh78
 4SykkaUD2dDJrmPaJ9R0uWPcKmUAXyOvRireKzOM1qXvrs0mYidWkZ9V5N8rhR8O9Det
 FBWg==
X-Gm-Message-State: AFqh2kpZYB57AuIqstXqnQqXp2Js6XPOdvU0F+Txxw+BDWcWYkRXqbSX
 0LVznWagAA2wyCggyUV6956ONF30BzRBDlx8CpE48Q==
X-Received: by 2002:a63:5410:0:b0:4d1:96f6:8edd with SMTP id
 i16-20020a635410000000b004d196f68eddmr276853pgb.253.1674135922318; Thu, 19
 Jan 2023 05:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-2-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230117220523.20911-2-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:45:11 +0000
Message-ID: <CAFEAcA9EndzEQA7CPszBCFJyzSgD7=FqeFFK-LHxucTA=CSimA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/char/pl011: refactor FIFO depth handling code
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9jz+YZbEA7yK

On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 can be in either of 2 modes depending guest config: FIFO and
> single register. The last mode could be viewed as a 1-element-deep FIFO.
>
> Current code open-codes a bunch of depth-dependent logic. Refactor FIFO
> depth handling code to isolate calculating current FIFO depth.
>
> One functional (albeit guest-invisible) side-effect of this change is
> that previously we would always increment s->read_pos in UARTDR read
> handler even if FIFO was disabled, now we are limiting read_pos to not
> exceed FIFO depth (read_pos itself is reset to 0 if user disables FIFO).
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c         | 25 +++++++++++++------------
>  include/hw/char/pl011.h |  5 ++++-
>  2 files changed, 17 insertions(+), 13 deletions(-)

Looking at this again, I realised that there's a subtle point
here about migration compatibility. If we do a VM migration
from an older version of QEMU without this change to a newer
version that does have this change, the incoming migration state
might indicate that we have FIFOs disabled, and there's a character
in read_fifo[] that isn't in array element 0 (because the old
code doesn't put it there). I think this works out OK because
the codepath in the UARTDR read-from-FIFO will first read the
character from read_fifo[read_pos], which will be the non-zero
read_pos as set by the old QEMU, before constraining it to be
0 when it does the advance of read_pos; and the pl011_put_fifo
code doesn't care about the actual value of read_pos.

But this is kind of tricky to reason about, and fragile to
future changes in the code, so I feel like it would be better
to have a migration post_load function that sanitizes the
incoming state to enforce the invariant assumed by the new code, i.e.

  if (pl011_fifo_depth(s) == 1 && s->read_count > 0 && s->read_pos > 0) {
      /*
       * Older versions of QEMU didn't ensure that the single
       * character in the FIFO in FIFO-disabled mode is in
       * element 0 of the array; convert to follow the current
       * code's assumptions.
       */
      s->read_fifo[0] = s->read_fifo[s->read_pos];
      s->read_pos = 0;
  }

If we're putting in a post-load function we can also sanitize
the incoming migration stream to fail the migration on bogus
(possibly malicious) data like read_pos > ARRAY_SIZE(read_fifo)
or read_count > fifo depth.

> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c076813423..329cc6926d 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -81,6 +81,12 @@ static void pl011_update(PL011State *s)
>      }
>  }
>
> +static inline unsigned pl011_get_fifo_depth(PL011State *s)
> +{
> +    /* Note: FIFO depth is expected to be power-of-2 */
> +    return s->lcr & 0x10 ? PL011_FIFO_DEPTH : 1;
> +}
> +
>  static uint64_t pl011_read(void *opaque, hwaddr offset,
>                             unsigned size)
>  {
> @@ -94,8 +100,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
>          c = s->read_fifo[s->read_pos];
>          if (s->read_count > 0) {
>              s->read_count--;
> -            if (++s->read_pos == 16)
> -                s->read_pos = 0;
> +            s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
>          }
>          if (s->read_count == 0) {
>              s->flags |= PL011_FLAG_RXFE;
> @@ -273,11 +278,7 @@ static int pl011_can_receive(void *opaque)
>      PL011State *s = (PL011State *)opaque;
>      int r;
>
> -    if (s->lcr & 0x10) {
> -        r = s->read_count < 16;
> -    } else {
> -        r = s->read_count < 1;
> -    }
> +    r = s->read_count < pl011_get_fifo_depth(s);
>      trace_pl011_can_receive(s->lcr, s->read_count, r);
>      return r;
>  }
> @@ -286,15 +287,15 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
>  {
>      PL011State *s = (PL011State *)opaque;
>      int slot;
> +    unsigned pipe_depth;
>
> -    slot = s->read_pos + s->read_count;
> -    if (slot >= 16)
> -        slot -= 16;
> +    pipe_depth = pl011_get_fifo_depth(s);
> +    slot = (s->read_pos + s->read_count) & (pipe_depth - 1);
>      s->read_fifo[slot] = value;
>      s->read_count++;
>      s->flags &= ~PL011_FLAG_RXFE;
>      trace_pl011_put_fifo(value, s->read_count);
> -    if (!(s->lcr & 0x10) || s->read_count == 16) {
> +    if (s->read_count == pipe_depth) {
>          trace_pl011_put_fifo_full();
>          s->flags |= PL011_FLAG_RXFF;
>      }

thanks
-- PMM
