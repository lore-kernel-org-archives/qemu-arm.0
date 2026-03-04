Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450E1EDEBF5
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 00:13:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxZrL-00082L-Ix; Tue, 03 Mar 2026 19:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vxZrK-000822-9Q
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 19:13:02 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vxZrI-0007aM-Ng
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 19:13:02 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b934fdced05so835257666b.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 16:13:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772583179; cv=none;
 d=google.com; s=arc-20240605;
 b=WTbRwkbu5WDUUcDBP1lGEQOZatkASOSsXO9tx+qI4hAl+Nyn7XqLeSv+TyR5JIHGum
 n9ZpTQz7DnVEq16SuEg7t+oDRmcUmhxKFKwow8imRbiK0cRfc55uqRPBaTH5/vZgDiFf
 fVRbBoRIV9VPs9qlYsWwiAMBkZkODi4e2gigAcWI1u/aauMlHD9YFODOmI+69CEKKRKO
 FunetABRiHPRzLvSTmU7j2t1ICltS3jzFsQvfcCzv9dRgBoxY2vGwoT9sMLqL/4ek1zA
 E2rxFDVGpLMGIDXNZ6L8PVwo+RomN00jeZqz/GKZtbLT2/OUPClJgZwnczk7JE/0Ex7a
 bNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=N3B7mOdFJr2uoi+HUat2oCaARVzoRK4Yg6coFkprYbc=;
 fh=0Uwz6+a3Qwe0n/4XLHt+XiDyZMUeG/6SDqsnG62JuKY=;
 b=SbTeqBFAn/JFfl9Qy5wiQICQ3fkeCrIkgciXCTIIulDbJ10TZ1N1QHv5s2cYpZnQ6T
 AI+TsYR0iPRmfS3XKj/6lIC9BftbGdIuSHlOzrYDeSJB55L36gyEOzvtErwtPtuHTHH8
 IxwWNPnpio8dhHH83O00ojZqZjyse6i7/meMxkZC8uX9smGhWpYzSRThxXR8jcTRYOo/
 jiEVhGH43v18XrbFPrHku7GZLAbWEAAXR0M3Jeu+RYjAukIWShZ/Qja1KhbWnLsYski4
 dXOO1luYJqoA86EdO/uoLDJL4ZE+C2zHS5hmmXXKc69xt9f+614jVC9oMKfgIuEbjX94
 dMYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772583179; x=1773187979; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3B7mOdFJr2uoi+HUat2oCaARVzoRK4Yg6coFkprYbc=;
 b=OD2+dZK9lS4ZydbL/Im5DPxiILxu1/QEuwrijJcLmSeE9rzjCOCA9b3akOisSe6mdf
 B6jZ7mtdWomA3p2nxSHmL3FGO+YnbKdwKclDUIe32+rlUi3iXjg1lAzCpldLyIPQySS7
 F10LuRi9F8ivDq8wAIVJgB06YQX4lx43vbZKg7+rDM2zJWNHbpxaQTzJJG18t20lCYx1
 NmXdHVzUsOIMZmCIeh7nn5TFOSLiDhgSvEd7fn2pMcR5/5ipFybuQlCqqUgLQLrtFgox
 gVbZHhg+HkbWWrsN8K0lW2Fxz5dnWZYZpEs32uEEpKeaEMMo2/osyFWTyiyoc06YWGeQ
 50oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772583179; x=1773187979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N3B7mOdFJr2uoi+HUat2oCaARVzoRK4Yg6coFkprYbc=;
 b=ha81q+438ny7zH3tBRhBzw3+eBsSbvHSmLflEdyY+wgz84oe8F+UmKaJMwR+iFUQ2Q
 4FhJFY7yJbG80zjVDprDrEJfvAdfbAfUupcRNqX0T3csGuFVt9erzQ152xCmT2YrZ5gV
 CT/Ktxk8nKtwoZBH3IyA6RavGGcv2xrWQNlnpY6rqBo+D9ot0jdlA69hb7XZ+d5A5VBd
 h0WBo/NvmLL9X5ycqMEsyeRIoVAKOEdNHlj7XXdk+GdBvi7+ip1FlfrJxyoISMPyhKT7
 uxpmXE4fLXmzfuYejk0gRK5AYpL8YqkrdZ53lrm6sXh8pQuLGj4inA2RvHYZBnHWi+ZK
 5ZQA==
X-Gm-Message-State: AOJu0Yyv7joDLB7W3xSOk9OEB67gfZLL6aC/jJbfebk31846AQkMwRjx
 WXF1DRtYHGH1o8V9ehurVZzQ8B5gE9KQKKX5uTsuSLojaqd9kcaJHR5UpaDogJ/PKWUGETWtdt5
 mSsedBhXF2QxYfIqKyokK4KG//XQndAo=
X-Gm-Gg: ATEYQzxfLjAa1LuWGUlCoJ5vjVtepK+RTdA0xGTpT5yJUzt1P0BZqScgieqsU2gpuc0
 +Wsy56I0+TazZsLznOPcXFLYQZs3Urudku3hIZOXlfGe32vAV5+KViTyivHRkIg3U3yId8EdaSe
 8bQfyNpEuYAZ7OsDghc3qTSylNjoPpXGrOACHlgb1aHDCYXSyH2/a5URL9ITIuij+v7nwZXBhWG
 4HEM+i8EKYndKEor0UbMH0I2AQx/LDkAf/gTpIj/Jiul9qTTEAdktuTWqpQPvkKypvmnbj6OlNF
 T5cBWqwaRHe1L42s+tiDmxpM5Uz/sr0XLippPw==
X-Received: by 2002:a17:906:4fd3:b0:b87:39d:2bb4 with SMTP id
 a640c23a62f3a-b93765c7448mr1256511866b.59.1772583178342; Tue, 03 Mar 2026
 16:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20260303172718.437015-1-peter.maydell@linaro.org>
In-Reply-To: <20260303172718.437015-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Mar 2026 10:12:31 +1000
X-Gm-Features: AaiRm52txa99YVFzDkQpkcVktZH1QDd9HYCLNlPsLCVfplLNduzG22mTqN9cFok
Message-ID: <CAKmqyKN3G_b0+gVo9HyRjYRs70RVdZ97i_6gzskudpdWbnPUbQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xilinx_ethlite: Check for oversized TX packets
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Mar 4, 2026 at 3:29=E2=80=AFAM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> The xilinx_ethlite network device wasn't checking that the TX packet
> size set by the guest was within the size of its dual port RAM, with
> the effect that the guest could get it to read off the end of the RAM
> block.
>
> Check the length.  There is no provision in this very simple device
> for reporting errors, so as with various RX errors we just report via
> tracepoint.
>
> This lack of length check has been present since the device was first
> introduced, though the code implementing the tx path has changed
> somewhat since then.
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3317
> Fixes: b43848a1005ce ("xilinx: Add ethlite emulation")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/trace-events     |  1 +
>  hw/net/xilinx_ethlite.c | 12 +++++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 23efa91d05..001a20b0e2 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -527,3 +527,4 @@ xen_netdev_rx(int dev, int idx, int status, int flags=
) "vif%u idx %d status %d f
>  # xilinx_ethlite.c
>  ethlite_pkt_lost(uint32_t rx_ctrl) "rx_ctrl:0x%" PRIx32
>  ethlite_pkt_size_too_big(uint64_t size) "size:0x%" PRIx64
> +ethlite_pkt_tx_size_too_big(uint64_t size) "size:0x%" PRIx64
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index ba3acd4c77..75e6520569 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -162,9 +162,15 @@ static void port_tx_write(void *opaque, hwaddr addr,=
 uint64_t value,
>          break;
>      case TX_CTRL:
>          if ((value & (CTRL_P | CTRL_S)) =3D=3D CTRL_S) {
> -            qemu_send_packet(qemu_get_queue(s->nic),
> -                             txbuf_ptr(s, port_index),
> -                             s->port[port_index].reg.tx_len);
> +            uint32_t size =3D s->port[port_index].reg.tx_len;
> +
> +            if (size >=3D BUFSZ_MAX) {
> +                trace_ethlite_pkt_tx_size_too_big(size);
> +            } else {
> +                qemu_send_packet(qemu_get_queue(s->nic),
> +                                 txbuf_ptr(s, port_index),
> +                                 size);
> +            }
>              if (s->port[port_index].reg.tx_ctrl & CTRL_I) {
>                  eth_pulse_irq(s);
>              }
> --
> 2.43.0
>
>

