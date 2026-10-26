Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40461606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GkdUa4TU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLN8C-0001vq-CB; Mon, 26 Oct 2026 12:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLN86-0001q0-2e
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 12:00:59 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLN82-0006wS-RU
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 12:00:57 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8b0a28a720aso30097987b3.2
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 09:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030453; cv=none;
 d=google.com; s=arc-20260327;
 b=slkjpHiw1P6YNBF4o/ieWPxTMpof7qIxLeyHOzeiSMPVma1z4DwHdey/XWeBJxcyKO
 6VQ7pUrA506GwyZdyN135gN5CFxZiWcoL/HemzN+2f0BPICeaZa18dUdrhow6uPnekRq
 Wwjp0TA6ZYKQ2+P5mzV1QjVoG41wK8qROZV5O9kl5rB/O7pB7Uz7mLokD93rcJlKuK1M
 3Ol189MwRroKr4j84HrivjIxM6vONwQzgfijVQKq6twehU2UlOh4sCPIrAZGTRUKyN4m
 JnMfCTEmih1jbqzhzoeb2GIOWwUlq3hP6iPwJeCKXQCUYICGQ8a9+XLGRlkghB7BnPXS
 6YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ht0DlD2jz0BhiyL89WWcOw/7JBEQL+kkfL4oV/WrCvI=;
 fh=LiiuA/Bgnk+dVttWYIXrDq7A4JAoNoPNQR5aCKli5ds=;
 b=QICCPLsIv57izai7OCYu3USUrs8jmCiImYfrkM9B+mpEOQ1Ii6ErDN3CIO/1y8o8rE
 Gutk4Zof3K8SwwEmgKG2VOr3uU0Tz8aaUUoMCMoF44/ZVBlGdbnZHer5azHry9TtPat4
 y8To/4Kkp+iMOZ+mW+E95J9yP1jwNMG6+cKE63s2HvAW4RrhtxU18pr4PttdsFzL0aQt
 p0vOuuZjXXpARqN6GtYHoLRIx5HfzDKNMHVOrbxJIqgP2y606/d7fKAlkb2Pt61KZJ+R
 gQyRmbW48jZVQlHpCVXc2YQzHGm3bRp91rYuubvxnb0y60Ue4XNT6A5zso1BD8mQqfun
 7Tcw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793030453; x=1793635253; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ht0DlD2jz0BhiyL89WWcOw/7JBEQL+kkfL4oV/WrCvI=;
 b=GkdUa4TU+MDJLybmM8JQ5+c4UVbTJ5tcTJpsPgbgPdU0VyeXl3a7QcKxJtoCqM0Ye+
 ttsBhHN5UhWvUC4iOfIN+wj9+mGbmJ3TmgEWpeT9cz+gqrpTsNQ2BLj9+/DwbWXyxNdQ
 cZxphTOP4TzybaX7GVmGLIp6icvZBEjd14jZpUixMDLl8j2fVBEOStmtDHYxATV5EQW4
 z2NBU7bwuHdtghGgHXPmomOAkgtYdHLeAESvUUxW7fF3E8xIlF/2wNHGEEQr2Rdp6Nyp
 14Igw/J8u/U833Vpxzut9DtzGVkL+kRK5oi8rG7Gk7cLEdeicaF8iqQr5GfyNG44ZUtZ
 EUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793030453; x=1793635253;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ht0DlD2jz0BhiyL89WWcOw/7JBEQL+kkfL4oV/WrCvI=;
 b=hv6CDp772wmJ7tT9rQviOG/bgET6lt1Qwwtt4bm7RzYzaASJNbQXDfPGOFZ+wdNK/H
 0Y8w5FjI6M1AgtTAekq4FusciEG0/AAcnwpFsP3JI23d9dsCaahQebhkfvY/ggdgNQVx
 ni5agwLa6VbAWa3Q2urhkqoR4zmj0/5Z5BYgdPCflB3btTSVW21E3/XYlHqTv2KfVEA3
 UcryHCTp1IXV9CsoIkMF7tfmaOo7vwhRUA7FoZ6OncjIsBiBHT17Xs3sGbOC5caiqTZ4
 WN2bhzCG/gj+dezyrd2Mts5ag36f3/Tawt6J3L3imSfAtQQeCd3tfPyJ5BX0GGZ8QYBU
 1GyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzTq9cFW7f/q6J1dSqw0uHLe+EujKK3uNf1rFWGrvziZMk2Ut3BBmKaPSIVLH5fUV+OjR+VDeVeA==@nongnu.org
X-Gm-Message-State: AFq9FYJMoWiYgXctsfhBIhgU5fsqihaajJgbBx9ioPXeo6zMZxNMKyQX
 BE1A6Zx6Yex7mZT8n/j6ZeAgc0DxCDsWY2tpJPkrC/d1fvVbZuhRj1IMHYAyeoyCgBm9iHi+QIq
 08bqLy/YXY3845/HoJNL/i6pbdqonSrrjGQ9TPhE17cznw4o89wztEd8=
X-Gm-Gg: AYBFou3PK7l7qc/3oT2JIBzlz4eQsW+bJIA7+mcnKCaZOsz5GjntmeyUuCwfSncfEDI
 yYHHewUo6u/tTUGBAlThMJdnMGFUJ3j+pZkM6yl4eKWobnFUr4w2vUsv6Xl9WMF5dQ2Qf/IdO5D
 bCnsZKykqBVfn3Sv5beX9EgNzLpEWyYEhgvQDEax2SXB4mQg+hbY5rFDxSVYciAqQSfaUBytYEA
 SbLJyJYoBv07CSRrOf2BmnSL5k+xzSMx0At6IgPdzK00zvJXX+hWbyhHmevtkE4ZNjdBaoISgol
 RhzxrYCtnG1X2+0mgd9ywMd9jRk5gknH1lWSFv6gdgpibxnXytpDvFaFa/rBHFL44M5McCpzIsb
 5s//RefIUNLM4EPyMftvsI49gv+AmIa/mzaq/4SsvIlbN6SvIm52ZbhDxdQKW/dUcfLTDT24rD+
 gDuxXlvcBt88DGMiJzfKbj
X-Received: by 2002:a05:690c:e1d7:20b0:8b0:e207:34b4 with SMTP id
 00721157ae682-8b166b86c4bmr37271907b3.18.1793030453302; Mon, 26 Oct 2026
 09:00:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
 <20261023135924.64990-15-marcelomanzo@gmail.com>
In-Reply-To: <20261023135924.64990-15-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2026 16:00:41 +0000
X-Gm-Features: AclHuK9o60JzHiCJZzowU7s1dRU7NXr3BatvrBD-chA8mQ3rE9i4thT6yVt3MLg
Message-ID: <CAFEAcA9Y5=m=prR9+8nftf8yAE9BDkNttiTh1fj0Wo9G1s+sdg@mail.gmail.com>
Subject: Re: [PATCH v5 13/16] hw/net/bcm2838_genet: implement GENET RX path
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@oss.qualcomm.com, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026 at 15:00, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Implement the receive DMA ring handling: qemu_can_receive()/
> receive() callbacks for the NIC's netdev peer, copying incoming
> frame data into descriptor buffers on the active RX ring,
> classifying broadcast/multicast, and raising the RXDMA_MBDONE
> interrupt as descriptors complete.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> While carrying this forward, make these changes to the original code:
>
>  - Report no hardware-computed RX checksum (rx_csum = 0). The original
>    stored the IPv4 header checksum in host byte order, but the guest's
>    CHECKSUM_COMPLETE path expects a running checksum over the L4
>    payload, which made the guest reject otherwise-valid inbound
>    packets ("hw csum failure" in bcmgenet_rx_poll()) and broke
>    DHCP/connectivity intermittently. With 0 the guest verifies
>    checksums in software instead.
>  - Fill in the per-packet status block with stl_le_p() rather than by
>    casting the packet buffer to a C struct, which is undefined
>    behaviour for a misaligned buffer and wrong on big-endian hosts.
>  - Refresh the link state once a BMCR autonegotiation restart has been
>    handled by the MDIO code (moved here from the MDIO patch, where the
>    function it calls does not exist yet).
>  - Validate the guest-programmed descriptor indexes against the size
>    of the descriptor array, and limit the DMA write to the size of our
>    packet buffer, so that a guest-controlled register can't make us
>    access memory outside them.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

>  static NetClientInfo bcm2838_genet_client_info = {
>      .type = NET_CLIENT_DRIVER_NIC,
> -    .size = sizeof(NICState)
> +    .size = sizeof(NICState),
> +    .receive = bcm2838_genet_receive,
> +    .link_status_changed = bcm2838_genet_set_link,

A very tiny nit -- if the earlier patch had the trailing
',' on the .size initializer line here, we wouldn't need
to edit that line in this patch. (This is why we prefer
trailing comma even on the last initializer in a list, as
a general rule.)

But anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

