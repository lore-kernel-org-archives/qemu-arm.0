Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1305615ejh;
        Mon, 8 Apr 2024 07:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUtBqqMJVgLUnGfJVIPjjHgfOtV2UkEtpnJIY5CcFOYyUGUovFUgLRX9AKbNb46l/Elgo6Odokjm3UB/60KRkVhgmEfV5R
X-Google-Smtp-Source: AGHT+IFssNaYZC7Q+suZe8PNG8jNyJszRMXnWcOIYNGJlURUVQK/hZQaHL6TSt6DydLLBS4GMSZn
X-Received: by 2002:a05:620a:89d:b0:78d:6574:8230 with SMTP id b29-20020a05620a089d00b0078d65748230mr2943768qka.56.1712586352484;
        Mon, 08 Apr 2024 07:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712586352; cv=none;
        d=google.com; s=arc-20160816;
        b=T9ybU9KTmLOtoU0MVUldcCf0jo7UrX72EgGpmuMpuLcEoLFGlRfQANeAAt4cZQpi8V
         SaO2b+qbNFZ0umLmlPJJxdFSq92cWkXdk9ivHy4OrLcXzWr/auJ9rRwUhilQd2JFBhGV
         yZUtfKB2fIGX7i7lNpf+QYhaa8qVkHzRxkYhFX6EUnt1Wk8F2VGt9DwoPAAC1Vxu6qI6
         grp0w2p33DmwdIXalZPfhUp8j2XrM0JaNMzM9abcX63ivYjNRHA0W/zunYbtp9l96CIa
         vgZ1oLVKKqlV3VEVznmZbA7ws86CvNddunLTjUgb7u6ry6sQrdOsSnPd8pwtHEIhJARH
         NEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OrBRkuPxXOCZvmMbQCwyyz4itVDU/vM75cSck92WVEI=;
        fh=pDm4BkITLSP+p3rOP38L4uDc27zGNEZF4x5NDC144aY=;
        b=yk9rmVN+9KYtL54Mh81BFw9Fu5xR2NYkzYBFacYQF5fefyRIIPuMgm5t4Lh/ug+/vx
         MZuOfiBkJIu1k986f5SeVlDYRbNZqo4v0tEfFY7RSmYVpxtWJXdvPIs3jbLYIhdIya3/
         hHS17GU531SOHjqmRNObw1/1iRBUCxJgluN3AnGXLiT4DMs0D+prhseJYEGm7gGkOrge
         /ZW+sB8HP3NM8/7QkeBnH9NS5jaknsnOSFlpZhkLwDF+vFTW36C8b8B14t3W29TYgfbU
         y9djX/BIc0m/6tBp4ejs/G7g/esL6drMjWyZChvxTI7NaxttixiHj8THGnl37biGJmMx
         rNiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7Mn2Ubo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a05622a004300b0043468827618si2879770qtw.468.2024.04.08.07.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 07:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q7Mn2Ubo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtpvv-0006Fy-EX; Mon, 08 Apr 2024 10:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rtpvs-0006D6-AC
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:25:12 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rtpvp-0004Tr-RO
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:25:11 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-516d0161e13so4826912e87.3
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712586308; x=1713191108; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OrBRkuPxXOCZvmMbQCwyyz4itVDU/vM75cSck92WVEI=;
 b=q7Mn2UboO9Z3JOLkQqndjtwC0WLWb/GaiN+ybqnPLem67MjK/Ku5IQcjmKphNccAgJ
 BTPmxhlF6Zr0F27EbAvtv53dqcOT2QYF4YX1z14M8yArmIg8Mfn5neDA+UdMsfVKYi59
 WmkgcTakQsJmDGoz0FqmrO7niPYfHTHbiNKmAXop7jDKHiQhf7ZfuMGtbIAa/xa30fNn
 cytJ3eco1VT7TWKul66Jdl4lxUc9pa5k/pUW6URNE1VSwOaQP+uyuDXsck9lQCGoY9q8
 ciAO5sikwHPczWnyM10/f9GmeypGhWQZSGxzA4GXc83bJIHSZw1/ekk61Pj5ifob6MCV
 9rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712586308; x=1713191108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OrBRkuPxXOCZvmMbQCwyyz4itVDU/vM75cSck92WVEI=;
 b=WvL51QU39c4hC8o4P45oR5c4ERxhS9g0X6m+CWqLJGVFgbV2XC3ea/z2PnXt4bnwRN
 6d5CpxZbyWva/Lg7E7kJ+wXOmT4pHJtoOErlrkvaTq2yYNRD/fMqJisoFAel7ZQ++Rka
 9bwL8BZt5AumBVqaLrbA359SgOADJmpRtqu3qYyl/MYijq+3++PIbfbut3L/6PNu68lv
 IOJCmivocfhBQvmw/2HjqsS1sbkH6LmacMeIT7CLUE9M0dED2eavUDGoXXThgTzHvK22
 8ksICPxOgafSKQ/vLpUggcIYCjkc11XMSgUET7Qb8lGcIPtuzB8vavtORePHl7AHpQdN
 +1kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4cNOiwEbesMn6Np1WhuamHa6+krmz6jfJ/mRPNc5rbvWQjwhqVLwGnONxIjRY2QyAW3TmH0kqoF4pjhG/3+CpHnKT
X-Gm-Message-State: AOJu0Yy7L8LDHru/muc+/KAb6Cl1ufTskniiCeMfmzwWJY2FVibQuN/b
 qu4qKwLtrK/GJAdJ6CSxkg1RAu4AZxwW+vElj4YQ5zSmSEZa4jMhzH6dUV+szjnk+AqgAfx/NrC
 /kUYsJRZPXXsEaTJYf7KM2vA9Y4JYRtYmEeqJxA==
X-Received: by 2002:ac2:4ac2:0:b0:516:d4c2:53eb with SMTP id
 m2-20020ac24ac2000000b00516d4c253ebmr5376563lfp.58.1712586307609; Mon, 08 Apr
 2024 07:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240408105149.59258-1-philmd@linaro.org>
 <20240408105149.59258-3-philmd@linaro.org>
In-Reply-To: <20240408105149.59258-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Apr 2024 15:24:56 +0100
Message-ID: <CAFEAcA8vvURMn2FaDP9tXtP5eCMs6-XFOCR9ypo=WBH+6g5prw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0? 2/2] hw/net/lan9118: Fix overflow in TX FIFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Chuhong Yuan <hslester96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: iYlQtKzNsBEk

On Mon, 8 Apr 2024 at 11:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When the TX FIFO is full, raise the TX Status FIFO Overflow (TXSO)
> flag, "Generated when the TX Status FIFO overflows" [*].

This doesn't sound right. The TX Status FIFO and the
TX Data FIFO are separate FIFOs, and the TX FIFO has its own
overflow bit, TDFO. And I think the overflow here is of
a third FIFO, the MIL's transmit FIFO...

> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index 7be0430ac5..7a1367b0bb 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -795,8 +795,11 @@ static void tx_fifo_push(lan9118_state *s, uint32_t =
val)
>              /* Documentation is somewhat unclear on the ordering of byte=
s
>                 in FIFO words.  Empirical results show it to be little-en=
dian.
>                 */
> -            /* TODO: FIFO overflow checking.  */
>              while (n--) {
> +                if (s->txp->len =3D=3D PKT_SIZE) {
> +                    s->int_sts |=3D TXSO_INT;
> +                    break;
> +                }

While I was looking at this bug, I realised that we have serious
confusion about whether any of the variables we use to track FIFO
size and FIFO usage are word counts or byte counts.

Looking at table 5-3 in the data sheet, the size of these
FIFOs is actually software-configurable in the HW_CFG register,
but we don't implement that and (attempt to) only provide
the default configuration setting of TX_FIF_SZ =3D=3D 5. That
should mean:
 TX data FIFO size =3D=3D 4608 bytes =3D=3D 1152 words
 RX data FIFO size =3D=3D 10560 bytes =3D=3D 2640 words
 TX status FIFO size =3D=3D 512 bytes =3D=3D 128 words
 RX status FIFO size =3D=3D 704 bytes =3D=3D 176 words

But we don't consistently use either word or byte units for the
variables we use to track FIFO size and FIFO usage. For instance:
 * we initialise s->tx_fifo_size to 4608, which is a byte count
 * we initialise s->rx_status_fifo_size to 704, which is a byte count...
 * ...and then three lines later override that to 176, which is a word
   count!
 * we generally simply increment the various fifo_used fields
   when we push a word into the FIFOs, implying word counts
 * we mostly do calculations assuming word counts
 * calculations of the RX_FIFO_INF and TX_FIFO_INF fields
   (which report the used space in words and the free space
   in bytes) are confused about units too
 * the tx_status_fifo[] array is 512 words long and the bounds
   checks assume 512 is a word count, but it is a byte count
 * the rx_status_fifo[] array is 896 words long, but the worst
   case RX status FIFO size is 896 bytes, even if we allowed
   runtime adjustable FIFO sizes
 * the rx_fifo[] array, on the other hand, is 3360 words long,
   which really is the max possible size in words

Anyway, I think that txp->data[] is effectively modelling
the "2K Byte transmit FIFO" within the MIL, not the TX FIFO.
(We don't need to model the TX FIFO itself, because we don't
do asynchronous sending of data packets: as soon as we've
accumulated a complete packet into the MIL TX FIFO, we
send it out. In real hardware the guest can put multiple
packets into the TX data FIFO, which is why it makes sense to be
able to configure a TX data FIFO size larger than the largest
possible packet and larger than the MIL TX FIFO.)

So the limit that we are enforcing here is similar to the one
described in the "Calculating Worst-Case TX FIFO (MIL) usage",
except that we don't actually use data space for the gaps
caused by unaligned buffers. So this can only overflow if the
packet is greater than what the data sheet says is the
maximum size of 1514 bytes. The datasheet unfortunately doesn't
describe the behaviour if this maximum is exceeded, and our
current code doesn't try to check it (it's in the "command B"
words, which are all supposed to match in the case of a
fragmented packet, and which we also don't check).

The most plausible behaviour to take I think is to raise
TXE when we would overflow the s->txp_data[] buffer; there are
various conditions described for when TXE is raised that seem
like this would fit in reasonably with them.
(There is a status bit TDFO for "TX Data FIFO Overrun", which
I think is probably only for overruns of the TX data FIFO,
not the MIL's TX FIFO.)

Since the datasheet doesn't say if the packet should be
dropped or truncated if it's invalid like this, I guess
we can do whatever's easiest.

>                  s->txp->data[s->txp->len] =3D val & 0xff;
>                  s->txp->len++;
>                  val >>=3D 8;

Conclusion:
 * we should raise TXE, not TXSO
 * add a comment about what exactly is going on here
 * we should try to clean up the confusion between words and
   bytes, as a separate patch that isn't -stable/-9.0
   material...

thanks
-- PMM
