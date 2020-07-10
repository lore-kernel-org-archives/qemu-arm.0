Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp604142lfm;
        Fri, 10 Jul 2020 04:34:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIY08YUdf444kshrc3EZ5hR9tGJm6pM2nf7l2dvlCW2oa4qEhOVjInStBBnFpvakJnDwD4
X-Received: by 2002:a25:d451:: with SMTP id m78mr21500242ybf.156.1594380840593;
        Fri, 10 Jul 2020 04:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594380840; cv=none;
        d=google.com; s=arc-20160816;
        b=vd1Yb2+zOKiQ/rRKrsU4gi3LnBVS+CBSdgnqYmuFQo06Jizd0XWL5OxeRs8bdOIyNl
         VEgN1kNaJgZsNMswhYwH+bb80cFVb2geBxQ3QaGRN5v/x+C9ES95X/loEHtpsoXZVf7G
         sqGVe5U9kcpEFyV/zoOLzj6A3m438pGT43ocxDQXNMhHZocsPEQ4Ok9TylDe5pKNs+CX
         hzrfFpYdm7vMAlZE4gcheSIiEal+Vw0QQppNPHOAHBZu5WBt1o4CVYU3IEKt2NwXpGUo
         wJ6ZI8oqaHdOKW5+zl8bacts0AS3+Y5vLrAhvMPFxXnPVozM8DUHMfIwe48QMoUEVJbe
         MO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQieVr+5/KL3MUIAhN3d/yT7oqDU6w64xTDiaUm5f4s=;
        b=IMjZF+X83PqS9Z4Q6QZhEFvyR9PxAL2lIie7PFSHaj4bbJ/zzZJ+mtNZ8l4Vuv2QLY
         lZTpsPwdAkWcCO6r0Hm+sdmoj3l5zUf3nUa6/6f/BTMM4ei1JXxhPPMKG0LaKzlNy3OO
         7CjNNYygg4jCuecdTcxPbsL+Lzyl+f73OpcNmNcwtbWpERuSlvwtlOK0KEqk/d+EIf0a
         lz93xzQSylgcdA1k5+62a/XPln7qS3oSDhxTO/4K1qgFsXRYKzT+aDH0UFEEe066jJ7W
         kkElI5GcSpGa32nbfxdesxHPHkMt3B7SRsnWEfTw12dVg3n6oRjPNdTJYjgLyuYAeELi
         C8Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gSyQ+h8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si5035143ybk.107.2020.07.10.04.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 04:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gSyQ+h8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtrHz-0006Dy-VG
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 07:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtrHo-0006Dh-HJ
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 07:33:49 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtrHm-0003xO-N6
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 07:33:48 -0400
Received: by mail-ot1-x341.google.com with SMTP id c25so3960388otf.7
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 04:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TQieVr+5/KL3MUIAhN3d/yT7oqDU6w64xTDiaUm5f4s=;
 b=gSyQ+h8xHV0UwEdfe6gnsyNfMdQAib548m+mTaU//q+50nLICt04u6aF+JIk27aKMt
 MawRCQ0zz3Lgaxll2OhErppCJapFu2JBLEkHz2nOX2KU0WzPk5uFYMJYCwbvUSR0WI3N
 AoiJ0nGTUjb57y9wda5cQF3AUqh1EnDOs/vufoPFZ/tIXrFHbOMNWT4NfqAwcp6U5Ckx
 dBoFv9QCF252VkJNnZvyfGicJxQcx8lX4OezkiKDPAB0qngU11VHMD5SNvhFb8LwLgsP
 k8wa0S714ivLHdryXxV/a5FDb7mbA2GqGF8TuDsdA6RqxduEQrK673cn6MlKLkwtmAjW
 Xn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TQieVr+5/KL3MUIAhN3d/yT7oqDU6w64xTDiaUm5f4s=;
 b=eANk0s2m/OxyQrv/3WLudn54JJ5SzPvxEdE3u0Av5D8atZkwDX5Ui3z11aH1UvIc/M
 KWTLMd6KgMVt0nEbhgcvdrmCWwGE8KJhZe2P0VK+PhDUiZDruXkpZw1lHjDaoAtqneKu
 omcIvaPowVH/A9LJ/jFT25RTpD0THeLj3YlmruvJ4US8oAJFRrX0BsofmzfAypBVw0qj
 8KhBB1PMB/TEl0/creFGRHNwiqGi4wV/oXZZaFTxEyw+zkC8Z34EEAgmEgIDIavZJRJ7
 eX1n/7wdbueGW/fxYhawyU8O+hCDTV6GXGrl8v99mHjE2GygLXNby6KoLxiz5uzJSPf4
 6ZGA==
X-Gm-Message-State: AOAM533gvclCgxL/0t7m/Gc+9gsI2vKqpVELWLdvPkhFEadmmnpZIM9d
 XfnkOIaSXsPntl5TfFSfRBiPXX4AMAjF9w6IJ08UTw==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr55313034ota.91.1594380825254; 
 Fri, 10 Jul 2020 04:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200710085417.638904-1-mcascell@redhat.com>
In-Reply-To: <20200710085417.638904-1-mcascell@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 12:33:34 +0100
Message-ID: <CAFEAcA-pRXOz5JVcwHa8=oaeogwaOK0YVXYQiJUpdM_rFZ+QTA@mail.gmail.com>
Subject: Re: [PATCH] hw/net/ftgmac100: Fix integer overflow in
 ftgmac100_do_tx()
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ziming zhang <ezrakiez@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sy2J4ms/TZEE

On Fri, 10 Jul 2020 at 09:56, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>
> An integer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
> occurs while inserting the VLAN tag in packets whose length is less than
> 12 bytes, as (len-12) is passed to memmove() without proper checking.
> This patch is intended to fix this issue by checking the minimum
> Ethernet frame size during packet transmission.
>
> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  hw/net/ftgmac100.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 043ba61b86..bcf4d84aea 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -238,6 +238,11 @@ typedef struct {
>   */
>  #define FTGMAC100_MAX_FRAME_SIZE    9220
>
> +/*
> + * Min frame size
> + */
> +#define FTGMAC100_MIN_FRAME_SIZE    64
> +
>  /* Limits depending on the type of the frame
>   *
>   *   9216 for Jumbo frames (+ 4 for VLAN)
> @@ -507,6 +512,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>          }
>
>          len = FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
> +
> +        /* drop small packets */
> +        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
> +            len < FTGMAC100_MIN_FRAME_SIZE) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too small: %d bytes\n",
> +                          __func__, len);
> +            break;
> +        }
> +

Andrew, Cedric: do you have the datasheet for this devic? Do you
know if we should also be flagging the error back to the
guest somehow?

I think a 'break' here means we'll never update the
descriptor flags to hand it back to the guest, which
is probably not what the hardware does.

thanks
-- PMM
