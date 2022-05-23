Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3521772lfh;
        Mon, 23 May 2022 07:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDwHigoiJuFYUG0gva4gI6l097NxlgEKBsGzajVqG4M1CBfUEhqaBYQTSQYSkNIJ6ZF2pf
X-Received: by 2002:a05:620a:4511:b0:6a0:5e0b:1374 with SMTP id t17-20020a05620a451100b006a05e0b1374mr13901944qkp.713.1653315350357;
        Mon, 23 May 2022 07:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653315350; cv=none;
        d=google.com; s=arc-20160816;
        b=UEbpuOoKv2ifv7cEj4ZXhwjxk/cv9cLMOd++TVb3JSmGllBROl3E9hn5fKdIzzPEYh
         ZVtqJmiGED0nkJOH9x9NZPNDOa2V3nw7GUS5U25J1H/GLIjyu+SA0zVZvXfEFt55VXjt
         ocbSv89HbK3ZpusZdpLq8E8jh5ZMJ2ldGT9UTHGCWUY+cBg1KXk2ZvnfyCgBBTHHN+m+
         DwY7nrnpWfnBOYHE3IEmdDBel4g1ZgmelCVxsVijiyc9Qyg2UyDbejXDAqPuFZMfzu6B
         +AgJPUt0YcShjiiw9a7RcAS/iIhXPXKWabDGZxSPnQqL7AX3brR72eS1bbJtHb2KY7Lo
         F0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2s/ym3qOHJmqG3ZdN+zD+tY8bcJl2nSDaLvl5Z/ACQU=;
        b=xTalXAdBwYk91RlkLwBoIjFTvx96O9KmK8qFVzcG7U8csioI3gpxo6wzwUiPR+N4aK
         /PKO702kYyJLjzqZDsjmL+9tVKKUF11OrNHToMkMVNm/DhhaBoXCNCLgbgjjh8X6a2Zk
         jfH9qySALev6zC1YaIC+2G1UpYQG+LeaWbXlklgauejZhOgGUfjJZbO8q+KyzThWL3WC
         zZonJv/y7tujcZM2hLhgWq6fkeoJSFD3t7cZDKnXLVx3kLu4ozjeDV0VZKtapAu28sM4
         x+JRlZKHc1L3kIsOc93iyQrMlIG+7mmEAfQwKwFSCoRqaQeoWhyn7cYCtqppKB7hQFo+
         6qGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6HBL4h9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05622a14cc00b002f93c4a2337si426169qtx.472.2022.05.23.07.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 07:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6HBL4h9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nt8qb-0003ki-Rk
	for alex.bennee@linaro.org; Mon, 23 May 2022 10:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8pj-0003kJ-5I
 for qemu-arm@nongnu.org; Mon, 23 May 2022 10:14:55 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8ph-0007s4-Fo
 for qemu-arm@nongnu.org; Mon, 23 May 2022 10:14:54 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2fee010f509so149322767b3.11
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2s/ym3qOHJmqG3ZdN+zD+tY8bcJl2nSDaLvl5Z/ACQU=;
 b=l6HBL4h9S9JF9w27Ak67mQCbAPqOeVk15ISsvnHoRYTD2XdIL1ptEypjFu4ncUIwfu
 +Sqhj31zza/oANJ35H2nGs+JEAcMd29s+tBWcBFVYfWYul4/aF2ghaEvZONCQ90iatwz
 dRaokLjGhujw1IUW5ztIDj0R8kCNWx2Iq6SUc3KBGAwiDQaV8j4kl3nzEw8Brfc48ntb
 OlsxFOnWY0M/EySRRTE+5JWp4UQKItIFLzIuDsdkBfNcStI4VyGR1FKg+fMB1jtb3g3D
 gk1d6mQ4/ym891bxsY0l6qNIf2uBu6cJ5ji2zNAk03beT4LnjcCcmyQDNwhJeFUYhGKc
 lrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2s/ym3qOHJmqG3ZdN+zD+tY8bcJl2nSDaLvl5Z/ACQU=;
 b=iPQoVlqIYBzdu2QgLn3TCpllzsjzqSwnHp8OXm+oAbKRYv1J4XPqwpaBTD+4u2PcKA
 Pa7hO3o9u/WILHFsPvFd3CoPZvQ/9cG6y0GNmnHRNoudIyA8a+7mUHfD39CqrmQfwdoS
 pntpsNarfSyjf56LSP790dWhbS6mhOwRpohLMtyNii5ra1rxMUIXydzWBFYZzBLBHN8N
 vgQHtV6FiOvs+Up9OKLQb8EYf5pz8Qa5ldd7zMTpUORdqfCp2BpyZxIGEhLfW0mp3SJf
 t1vlToBNqXEsIFV+7U/ou5g0n16qoTdkM2mjQLUEu6KCNnetG12utfA/3iM/bN8nMXNq
 59Vw==
X-Gm-Message-State: AOAM532o+1+ZsR0gwyAZP4vI+FLDzNooyaWoCmxYtHppAEe2wpYCC3tP
 I6foLSo4ktKHuqGShKX0u4xHs8NKKdTgbQfiF/xU7w==
X-Received: by 2002:a0d:e903:0:b0:2ff:43a3:90c8 with SMTP id
 s3-20020a0de903000000b002ff43a390c8mr23236948ywe.455.1653315292347; Mon, 23
 May 2022 07:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220520124200.2112699-1-uwu@icenowy.me>
In-Reply-To: <20220520124200.2112699-1-uwu@icenowy.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 15:14:41 +0100
Message-ID: <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/allwinner-sdhost: report FIFO water level as 1 when
 data ready
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7b5IfC7+zZ4k

On Fri, 20 May 2022 at 13:42, Icenowy Zheng <uwu@icenowy.me> wrote:
>
> U-Boot queries the FIFO water level to reduce checking status register
> when doing PIO SD card operation.
>
> Report a FIFO water level of 1 when data is ready, to prevent the code
> from trying to read 0 words from the FIFO each time.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  hw/sd/allwinner-sdhost.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index 041e45c680..b66fd9bce7 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -114,7 +114,9 @@ enum {
>  };
>
>  enum {
> +    SD_STAR_FIFO_EMPTY      = (1 << 2),
>      SD_STAR_CARD_PRESENT    = (1 << 8),
> +    SD_STAR_FIFO_LEVEL_1    = (1 << 17),
>  };

Is there documentation on this hardware available somewhere?
The Linux kernel driver for it doesn't seem to have a #define
for this bit 17.

In an ideal world we'd actually emulate the FIFO itself
(our pl181 and bcm2835_sdhost models do this, for example).

-- PMM
