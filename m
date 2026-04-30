Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04603FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 16:19:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIU6U-00058G-VH; Thu, 30 Apr 2026 12:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIU6P-00057X-F3
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 12:19:01 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIU6N-0003IP-V6
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 12:19:01 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64937edbc9eso962466d50.2
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 09:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777565938; cv=none;
 d=google.com; s=arc-20240605;
 b=UwRHrJrriPSQM1a5xOssAJmqckZ+AR3GPx1h33TrO5FqwqeAmSiHTN+7lO3DVoX7ix
 60t6tcWvDaWrlkibpBTduA80hQLBiISxizkFIEKyWkNKGqisMFB2HNIqlFuERi6cNBMk
 Aidr4BdafV0FTGxla30SvQOzANT6LBcmkodSdXHj43F6lT8lXwtoSC9Bw8TbA06pqmh5
 GSGlq5mVhIXFlZPW4lCIS0L8WPyy8MiQwAmeKf0K3LUhzR86vVWCyhy76tHOMozqNIo+
 EX12uPXgVdtwMrbCIly1HJORoKmmJ9koR9opz5NHAKfgRxDoRMQbMxYnMLhyHaoKQUKC
 Xp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IWf6n2+rQx00tlBPS009bMm3BcgcawxuPrXZh+58IsM=;
 fh=bIZPOEZRKHnV6k9I+iqSEfQH8qEUzUKz+GF8Ie73Xcc=;
 b=HtGdbPfK0ioaQ6d7AS3kXC/gIBJrcEcGegH7KhiKTorsAwEgKeEFaiziCDNieUPuE4
 BxsKzZFSaOYs7l8UBoE+KGCWl+7za7ycTozXWvu+AvEXI8QxTDaDzJ4Uc2EKjhkcC+5p
 s0QrVb3kyiwHouupIKwrHVU/CTk6qEiY6tREwbT4ZJQztZeQX8RxOK/JmofZ6EvJQaqn
 2cESqYFCXt1dbDodm1L3DnzscffnxZUbauSKZvPFzxjEST0qfgluqA3HEO6DIzqND1IZ
 LYikIkcLSt4xFqEI1mye9qjn/ErqF4vp0FpJPIEtChzr6zmQLIHU7bRXG4ar1t2AkQ6J
 vF5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777565938; x=1778170738; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWf6n2+rQx00tlBPS009bMm3BcgcawxuPrXZh+58IsM=;
 b=orXTOQZdNxoP9mxmqlRQW/19yPOGgMa5pgY3geqDXps4LEbavH/AlbnR4172mo7yW6
 ywdwtP+Qjhjqx6rjeoQLtOuK2QLkt/8WGtnAVZm8LfkKH4jDWaTgpC3gchHcci0dXMXY
 B3ooyGT4D03ewPH/T8Jf7tAhA23+XHfu5y0ziGGqwjVtkKcbO/+XxgRbY2VXIXSCrbdm
 H8B+5dHaa4pDd6BpJ1yu/mqu+R+TUCgvvLir03q5MjmrN6fJrRebco7Il6DIlgej4vvD
 PtT0q0nvkpWJEzJYLFU4moyp8eVkrq5RO2peeeU9Qz+enDfgcUELfuEe7bQ+rdlzEKSd
 7eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777565938; x=1778170738;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IWf6n2+rQx00tlBPS009bMm3BcgcawxuPrXZh+58IsM=;
 b=mziFbMkksYNZCrNpwphoKbhYUZ5oVDCl5grnSgcvkojzbWNwmnOxj60TujdqDUTSLK
 Fw5M1IyQ+b4IZcsXy5xY8yktRQn6Lvgje9OsliTJfYHP+6MLSCam88sLp3T+0Sq873Fk
 k0GBNeEUtUac/dy9w9syHYkB6irn+ZHMestjT6T+woHKqaKZCan0qrYGJHccqdfPt6UZ
 PskDnZ+rGOeMdRt0qywqZIP8woBCHbMjXgHB9azbw+0O/gjOZ/c6/6tMkdds1RBrO2VG
 wjZTFJFpQwH+pbv89YtWe2lmsf7ZzFUDdi7ORrMckjbsTJABFH9ydn1wbQHz72AQshky
 B7Qg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KBsyBLuOsJv2pctStBy58uArQAn9bPZwzU2GX7AfxrPln4/rcdZPrZHrkhPpUlKmSwYiomn3pYg==@nongnu.org
X-Gm-Message-State: AOJu0Yy+neNAPNLLVenee/qzId2nLEbha2ADP/qBpkq84gA5Sna4ex+R
 9vaDFdr/bB+o3r65eJyE3y97DTHxetYLlkCAQozXOhud7zFkCtuhcMIG8ZFjkQKL7/s2TLzTfhx
 qBvWDcvsJVoW9dJNmRPCxPKPbFF8StRSMx0TAyNdG3g==
X-Gm-Gg: AeBDievXtXUYouWPWaFOuCZV5kJbfatsM1LFHpRtMuzKk0hoVtSp2lZDHaAHk55G+9d
 GAocBGxYzomPUg0BEYaAzPpMI0SdZbi3aAHbjBoajPf4I8JroH6y5rOHkgrIJ2ro3ooTcG3M9Go
 wUuqgRsfFqu+jQMWJ+WE/r1HJeGycafTmyw4hVxginj8b4l5XYOBlAMNOJdSQmip3hSdhOkEbH1
 zgHD5IDuvZJg4YXpqeNFIIVIAUpuZDEv2FPd+Otf3YVAPyMJPjb+VTDTaPoJRN6h9v+SfRA2Nim
 pOJcBDtT9K3h0kJ6TdBNxBFkQ+Q8/mN/q3yn2y1iY5DFYleHv2lQ57D2/fCZnTfaD0tCC76T/Lh
 3bSTuKiKN/1zr
X-Received: by 2002:a05:690e:190c:b0:650:3e1f:907c with SMTP id
 956f58d0204a3-65c18503a47mr3017462d50.0.1777565938317; Thu, 30 Apr 2026
 09:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040753.3337-1-iyzsong@envs.net>
In-Reply-To: <20260430040753.3337-1-iyzsong@envs.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 17:18:46 +0100
X-Gm-Features: AVHnY4IIIorx1xkrEBS1R9K2W-QNLlsG2iNu5IcnwNcfXuKfCBUy22hqBemJxs8
Message-ID: <CAFEAcA8AUr3hOyTdDJhUpmRMDz59j2gyYrXcgYR1L5D7=tv4KQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac: Flush queued packets when rx
 is enabled
To: iyzsong@envs.net
Cc: qemu-devel@nongnu.org, =?UTF-8?B?5a6L5paH5q2m?= <iyzsong@member.fsf.org>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>, 
 "open list:Allwinner-a10" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Thu, 30 Apr 2026 at 05:08, <iyzsong@envs.net> wrote:
>
> From: =E5=AE=8B=E6=96=87=E6=AD=A6 <iyzsong@member.fsf.org>
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3459
> Signed-off-by: =E5=AE=8B=E6=96=87=E6=AD=A6 <iyzsong@member.fsf.org>
> ---
>  hw/net/allwinner-sun8i-emac.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.=
c
> index 9b7c67ae8e..7cc06b73c2 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -727,6 +727,10 @@ static void allwinner_sun8i_emac_write(void *opaque,=
 hwaddr offset,
>          break;
>      case REG_RX_CTL_0:          /* Receive Control 0 */
>          s->rx_ctl0 =3D value;
> +        if ((value & RX_CTL0_RX_EN) &&
> +             allwinner_sun8i_emac_can_receive(nc)) {
> +            qemu_flush_queued_packets(nc);
> +        }
>          break;
>      case REG_RX_CTL_1:          /* Receive Control 1 */
>          s->rx_ctl1 =3D value | RX_CTL1_RX_MD;

Thanks for this patch; I've queued it to target-arm.next with
an expanded commit message.

I dropped the direct check on (value & RX_CTL0_RX_EN), because
allwinner_sun8i_emac_can_receive() also checks
(s->rx_ctl0 & RX_CTL0_RX_EN) and won't return true unless it's
set, so we don't need to check the same thing twice; so the
patch as I have it is:

@@ -727,6 +727,9 @@ static void allwinner_sun8i_emac_write(void
*opaque, hwaddr offset,
         break;
     case REG_RX_CTL_0:          /* Receive Control 0 */
         s->rx_ctl0 =3D value;
+        if (allwinner_sun8i_emac_can_receive(nc)) {
+            qemu_flush_queued_packets(nc);
+        }
         break;
     case REG_RX_CTL_1:          /* Receive Control 1 */
         s->rx_ctl1 =3D value | RX_CTL1_RX_MD;

thanks
-- PMM

