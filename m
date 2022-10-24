Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3161527ejn;
        Mon, 24 Oct 2022 02:49:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6js/dwfgZgrcUbG0dceMZs5WnmT12ql9MpCr0yD2Xevwv1Ebcc+KsEeICcRe60s6Sl5jB2
X-Received: by 2002:a0c:8d4b:0:b0:4bb:798f:5251 with SMTP id s11-20020a0c8d4b000000b004bb798f5251mr1462762qvb.51.1666604948985;
        Mon, 24 Oct 2022 02:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666604948; cv=none;
        d=google.com; s=arc-20160816;
        b=YR6GX+y4XeiPTroeTFQvpnK7hRTFZ7zhnUwv0y7JxzHx/9uCdFSrQWUO+bL0Ad/71o
         PDpL/mHphAA41ArBoolS58sBqgzYbhooq/8QWwtBQr/0ndJhvTZ8L2Po0BFuX5sqkZTO
         oVBfM3+8rb14s2HqK5XrY4wbr4NGCPCSj9RGLZcWMWV8Yw1Uk72uKSGFrBkZr+n0uw/c
         3awae/QhFO/8m0mFSJ5bf3YFCeJp0zvtrDqSUWD04LUnrlpY1gpXGVLvjf+6evL7acuz
         ve1XmFAuo2R4wMdpymL/ejWcnPlfTO34rd+f28GKSSV3I3C8+BR03f7C212R35XUDp98
         4znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:content-disposition
         :content-transfer-encoding:mime-version:in-reply-to:references:cc
         :user-agent:date:subject:to:from:dkim-signature;
        bh=OpivMPimy9uqEgZO+2MV5XjVRs/s41WV3GonaK+h8k0=;
        b=zCqBfJp5CHLdsAyM+NIbmeyXnJBoo2r0n02hBcNxd7gzUfhTbDNwbHfI0+s7H32/hS
         6LCEGEgydoZ4R9aOF361IzNrIzeY/62IYqnsmdGHlJwnf75pci+e3P19dfAJwOUD91tW
         Crkaw2DrboUITQCOrCDOeHP03tUICK9tzcj6IZcaTbPYfAl4rwW/wpC2lSOyXH/q8KsC
         aYkTWYDwYCeJVm4Kw4fttNBwTRUX51Ql0NWMdPoarroptM8h15+Dqh4u2xO9JQ3jijwS
         Yc11XS02de4nrlSPJn6Seme8xxcGywBL9BJQaTite0MwghmyjFOR+AtkLZS/nnsI33NA
         vBRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cmp.felk.cvut.cz header.s=felkmail header.b=DzoB07Vc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=cmp.felk.cvut.cz
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a05620a0ce400b006b946590959si15131164qkj.183.2022.10.24.02.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 02:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cmp.felk.cvut.cz header.s=felkmail header.b=DzoB07Vc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=cmp.felk.cvut.cz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omsfB-0006Jp-9u; Mon, 24 Oct 2022 04:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1omsf0-0006G5-Ae; Mon, 24 Oct 2022 04:18:21 -0400
Received: from mailgw.felk.cvut.cz ([147.32.82.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@cmp.felk.cvut.cz>)
 id 1omsep-0005xB-Hq; Mon, 24 Oct 2022 04:18:08 -0400
Received: from mailgw.felk.cvut.cz (localhost.localdomain [127.0.0.1])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTP id 019E530B295F;
 Mon, 24 Oct 2022 10:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 cmp.felk.cvut.cz; h=cc:cc:content-transfer-encoding:content-type
 :content-type:date:from:from:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=felkmail; bh=OpivM
 Pimy9uqEgZO+2MV5XjVRs/s41WV3GonaK+h8k0=; b=DzoB07Vck/1zEbjNgOW11
 U/avwviKRjVNuuqzp9kI6ADUKCMs2txj4t3TgdGp2IGhJaV1jAbV86WJ7XnCrNru
 SGM1g3h77KRDJCYOZbg9D4+kUTu2C1nEUVDdHl5NUoMy+DMFVwoD45NmZd/zQJr8
 01BV452HiQeqCP34j8E2lVBMQvJ7VR6UXqI5hRz98q6vfaYP6LjVQZrpfr1pnnJQ
 r4CtumoToTgBVvOqJRVU3N2njVBIDyvyDeYMrwehWRF3/aLBOT1vemTvs2oA5+AB
 htYPws3zBlJtluvEX11XC7DwIiJBL1pTHe2CCslRehBcueP3x2CjMgZu4xdg10cV
 Q==
Received: from cmp.felk.cvut.cz (haar.felk.cvut.cz [147.32.84.19])
 by mailgw.felk.cvut.cz (Proxmox) with ESMTPS id 2C08730ADE53;
 Mon, 24 Oct 2022 10:17:46 +0200 (CEST)
Received: from haar.felk.cvut.cz (localhost [127.0.0.1])
 by cmp.felk.cvut.cz (8.14.0/8.12.3/SuSE Linux 0.6) with ESMTP id
 29O8Hjpb026444; Mon, 24 Oct 2022 10:17:45 +0200
Received: (from pisa@localhost)
 by haar.felk.cvut.cz (8.14.0/8.13.7/Submit) id 29O8HjdN026443;
 Mon, 24 Oct 2022 10:17:45 +0200
X-Authentication-Warning: haar.felk.cvut.cz: pisa set sender to
 pisa@cmp.felk.cvut.cz using -f
From: Pavel Pisa <pisa@cmp.felk.cvut.cz>
To: Bin Meng <bmeng@tinyclub.github.io>
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
Date: Mon, 24 Oct 2022 10:17:39 +0200
User-Agent: KMail/1.9.10
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.osdn.me>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221024072802.457832-1-bmeng@tinylab.org>
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202210241017.39626.pisa@cmp.felk.cvut.cz>
Received-SPF: none client-ip=147.32.82.15; envelope-from=pisa@cmp.felk.cvut.cz;
 helo=mailgw.felk.cvut.cz
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Clz5PyFMg1GE

Hllo Bin Meng,

I ACK the change for SJA1000.

On Monday 24 of October 2022 09:28:02 Bin Meng wrote:
> %s/return ;/return;
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>  include/hw/elf_ops.h         | 2 +-
>  hw/9pfs/9p.c                 | 2 +-
>  hw/dma/pl330.c               | 2 +-

>  hw/net/can/can_sja1000.c     | 2 +-

Acked-by: Pave Pisa <pisa@cmp.felk.cvut.cz>

>  hw/timer/renesas_cmt.c       | 2 +-
>  hw/timer/renesas_tmr.c       | 8 ++++----
>  hw/virtio/virtio-pci.c       | 2 +-
>  target/riscv/vector_helper.c | 2 +-
>  target/rx/op_helper.c        | 4 ++--
>  ui/vnc-jobs.c                | 2 +-
>  ui/vnc.c                     | 2 +-
>  11 files changed, 15 insertions(+), 15 deletions(-)
>

> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index e0f76d3eb3..73201f9139 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -431,7 +431,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr,
> uint64_t val, (unsigned long long)val, (unsigned int)addr);
>
>      if (addr > CAN_SJA_MEM_SIZE) {
> -        return ;
> +        return;
>      }
>
>      if (s->clock & 0x80) { /* PeliCAN Mode */

-- 

                Pavel Pisa
    phone:      +420 603531357
    e-mail:     pisa@cmp.felk.cvut.cz
    Department of Control Engineering FEE CVUT
    Karlovo namesti 13, 121 35, Prague 2
    university: http://control.fel.cvut.cz/
    personal:   http://cmp.felk.cvut.cz/~pisa
    projects:   https://www.openhub.net/accounts/ppisa
    CAN related:http://canbus.pages.fel.cvut.cz/
    RISC-V education: https://comparch.edu.cvut.cz/
    Open Technologies Research Education and Exchange Services
    https://gitlab.fel.cvut.cz/otrees/org/-/wikis/home

