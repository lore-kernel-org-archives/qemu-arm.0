Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2672618ejc;
        Mon, 9 Jan 2023 14:59:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs80s8s0KUGVKZpUB0cR3r/gd3I/eqD85RiZX0gHLZ3npSVlPnRsXzKvUUrU+u6ne42zE3G
X-Received: by 2002:ac8:5c8a:0:b0:3ab:a3d9:c5be with SMTP id r10-20020ac85c8a000000b003aba3d9c5bemr79773383qta.23.1673305145914;
        Mon, 09 Jan 2023 14:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673305145; cv=none;
        d=google.com; s=arc-20160816;
        b=XDUL9jlUJQvdpK/0PHaXFgZLrEVIV59KONOhBqYIYDxbb8hAkzBZC5LilY+fxepGk/
         oFZ+RY+U7O4MBHtZMHQZS4iy1zEdUQU0KQZAqa3h+/bxXeAgKJS+Dpg3nVPsvsuDnKOj
         wDLnv/WUdveBTKuh7VZdEX8lqiMwwMOGMxXDSQDNCI8sB9MqUDbQy+hMZAzgwqjM45MT
         7/NxATBxWcpW34QV9a1pHAyFzsqFzbkLdeiEUcbDs0xHVK4T1kLoeIAhhWeIL3ol9kdf
         BaVRhOTOOWpDAwLUIaseaKCwwaGCKMNd4nqOVblab7MJtz2jHRBrT6Y7epU9Il3Zbz9x
         vRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gPm+WM4ZBeQ371G8E1ItvrCVyCyvKwKJFgS/JWOihm0=;
        b=alBrSPfor/zfc1+jgyQUWh5lOuNMRm8i38WNd1o/DvWhhywJeUbmC3EgVzSub80jQ3
         rfT40dYRbjFTMcWEUfvyauGq0ifM7PQyr7r06nJpCvFk3vZt/4HzdPLKbPO4uP9PUnVF
         n6NBxR9oq5EfhdZvDtlqkR+e+KhUT+j/iksClglhvBIf8vc/Ezp/Qnd50e/fdziDlcun
         8Ilxmz40lzfVVpr194cSfbHugXqm6u22wm4epMoDyYPBYBroH242pYZQJsNE4XzLXXiA
         5eGYXmfAIAEaFhTHm53JSbfewZ0eiTykk1zv0defD1EuVyPN8yLipQSN2gtaK7SefBK3
         OWvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JAMTOPX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020ac84a07000000b003a540863defsi5283864qtq.377.2023.01.09.14.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 14:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JAMTOPX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pF16e-0003QW-TQ; Mon, 09 Jan 2023 17:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF16c-0003Pp-1x; Mon, 09 Jan 2023 17:59:02 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF16a-0000Ub-Bp; Mon, 09 Jan 2023 17:59:01 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id i185so10455909vsc.6;
 Mon, 09 Jan 2023 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gPm+WM4ZBeQ371G8E1ItvrCVyCyvKwKJFgS/JWOihm0=;
 b=JAMTOPX1ysEsDezC+bv9HY4QqxXHQJBc72chyZQzDa6UvVgpInYYFZPJM/c6QgKYp4
 PBS9/ysApEgp01uwN6eVQdtXwBLQwQlR4a3P/r5LzE46BPFvhTAMeGV4HPbsWJbt/8Os
 Yil2iNa7afpz11nV2s5UTNKvhdZi2r9FuxgII+K01ITdiu+aHO5DHT3Nhabf+dlygdoq
 8ngcBNEqOMkWz7Kuu+V1Y6VVRenDHdJSu4Hismsvk0vf61BmIdivVQ5ee7BN74Qxt2Hx
 keHGWn6FYQplWRvXMvJBRr4IHeuETDQAKpQNpiOjJ2E8q+V+pJcN8b4VmwgK6PpZLnJ6
 gy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gPm+WM4ZBeQ371G8E1ItvrCVyCyvKwKJFgS/JWOihm0=;
 b=jD5hwUruG15yHHaEreP1qcLoH2DV5C/qdQJev1mSeZzBfXt+t07R3qckUoQzSDXPef
 aTbJPNqkoDsad7VFrdLSRCtWtKeVYXbonOweuyYWOsSBwEe79Jj6EK5l3LpvFCkMb9/c
 yMx3Yz8We2WEcVSQQXrCJtwEeT1U+TMONAY9Fpweo1i6bJnwMZl9207WCQKHnXTdlQl4
 aaLczFnzsA9tEGErTfSMafhj7pfCH/8Cjln725sKl/VNaL6cjL73fLY8b+ERHQ10b38g
 c7fo5vXghEui6tOISno0eDq86g2YpmvYlFZ9ytnntvZo4hbSq7WqzO2jonTMxOsT6svN
 /XMw==
X-Gm-Message-State: AFqh2kp1A5c2LNLKA61Rx8xFDQJQSPNP3+lWuTvBm4icc4gOMn/UAnGD
 9yY4fOSfrKNoXNgf+mkWlozJ4pM0LvwPyqXouXQ=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr8658055vsb.10.1673305139027; Mon, 09
 Jan 2023 14:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20230109055933.749233-1-cyruscyliu@gmail.com>
In-Reply-To: <20230109055933.749233-1-cyruscyliu@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 08:58:32 +1000
Message-ID: <CAKmqyKPo7B=-QTvHVAd7WsTAJKh5V-WKTNaBvVMeSHeqFj_qwQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: fix overflow in
 xlnx_dp_aux_push_tx_fifo()
To: Qiang Liu <cyruscyliu@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: bgL5RD+I23d+

On Mon, Jan 9, 2023 at 4:01 PM Qiang Liu <cyruscyliu@gmail.com> wrote:
>
> This patch checks if the s->tx_fifo is full.
>
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 972473d94f..617b394af2 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -854,7 +854,11 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          break;
>      case DP_AUX_WRITE_FIFO: {
>          uint8_t c = value;
> -        xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> +        if (fifo8_is_full(&s->tx_fifo)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: TX fifo is full");
> +        } else {
> +            xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> +        }
>          break;
>      }
>      case DP_AUX_CLOCK_DIVIDER:
> --
> 2.25.1
>
>
