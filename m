Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp77496lfc;
        Tue, 1 Sep 2020 17:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqw5foHN658VVI0WA+FZ4SDDwzWdnCublJbfiO2kLfvhCuh2svq+HjPO9c/9F9PdWLccl3
X-Received: by 2002:a25:7a42:: with SMTP id v63mr6357088ybc.4.1599006484323;
        Tue, 01 Sep 2020 17:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599006484; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfomF/1hM/HWq/4+FoRZqwihLQwLYjsvZ8XEJ7HiPsnHd8OnTvTLa1WvOOVpq6egaD
         3Kr/m2E8a/fMzaxsaGvxbhThzxD/fHWMNG0birq5+IZuvqCv/QlHGZpxdauEu5yfWky4
         YH3nn5/WtI+5noOuf3xy0/vDIAOP2fd61xHcP5yNUoIAWdKdxuCCTqK9vojT72nWDfrZ
         25LiC8rsUjfVs+o8uExGjsm+Hxh9aGoVJDOyDROzUqbpqa85cqre+GIG/xukdvTu4x44
         S2fDqMPmv1mnbYk/3svho5usrlspTZdUdok0OzMnKiWTm8KwYFRE4Svmh9Zmt3UyWd4J
         V5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4yZmY4JrwkiUpPsnpRTr8Z+/EcrZRkCeAtuP7/h77VA=;
        b=BaPhPt6f2UDjFzo0fJ47u9LEtWvYbJznjSzK5liIN3HdyHBZX4wm17eMmrsOzHWO+P
         zzr4+2X1vaPltZitHxWa2O0dlJUAs3MpRPVSdde2YVQn0jUkdwEGRwP5hXPqgdEWpqQb
         5dS3NBpqiYPV9OAdjEFKyp5EHJWHge3KSf3evtLnbeofByxVos2tOWZaF8o+Tei94NY7
         aPr9Kvol0pd83+wi9cLJj7NdIKmY3wMR7D3pQCDnv2P01s4HeKI5M0WU1nmPAV9bIo6o
         RY4fqgcV+gO2hbM73WRMHmN7s/dJrRXHWGNlxvVLWpreYG6qZObyRLYKfCfgDfR+rUAs
         ojeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="H/9TKfkp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si2565566ybe.410.2020.09.01.17.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 17:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="H/9TKfkp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDGd9-00073K-NB
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 20:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kDGcv-000732-78; Tue, 01 Sep 2020 20:27:49 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kDGcr-0005U6-Tg; Tue, 01 Sep 2020 20:27:48 -0400
Received: by mail-io1-xd42.google.com with SMTP id m17so2151724ioo.1;
 Tue, 01 Sep 2020 17:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yZmY4JrwkiUpPsnpRTr8Z+/EcrZRkCeAtuP7/h77VA=;
 b=H/9TKfkpmoOH7pAk+Q4IJHyrLSvGFtPPCQ7pnd5vYh28HtHjlz3oG8rupZh6dZRcwv
 y2pmVH/vEM1wNeINHCSiAU9/O+ub7WYBYcurqxaTqkft1X9l5LB4+Av/JbRX1uLh1IT/
 GklLacDX5vI4lascQfwSr8+NL95+H8etQ48605r7QI2iDl74xeyMCcDA6jRVmc/rUPry
 QSkqXpmCeqMGoHZwHn5Vgir7Gmk5XVis+VpuTyUfv+hguXOvvItDHFmuTpMa159j1lDG
 yj5vhwIaK0jm0PcfLV/BaLWqll9d7MQtK0WwnV1CbLltWkhtJlcKUj4ZsuH+lkLWhL3N
 rc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yZmY4JrwkiUpPsnpRTr8Z+/EcrZRkCeAtuP7/h77VA=;
 b=qmpRLw2nd8kbmuQDMriBuUnOIJihLZZJb4lwn96LzN1RkeTKw4d6xUwA5DIuF1nNJO
 USc9xAScOkVwrarEGN0fNouJDQ0MmF1xypc/wrK4kh37OCUfPQN/rxTmGbNPpAOIVUXN
 Vn4/9QajNASC9nN3IfbvdDZ+pIyPqVqzniWDgZcWqJ5b60fl8tWkoamKXU52Dz/pPNCw
 WgCLB0pk7MSmQpZVg6lE8ZuXwsn+lwlYuDHild2MsylDAHuIw/l2P/6hGVwepmLq/qaG
 xpsmB9tVIHhgfJkkXegWbYsHeX5sgKwUaTYZ/0nfrbUq4F+PbwSrtSeG0DhQL58fkVHt
 dZBA==
X-Gm-Message-State: AOAM533Bxpcp70dXtZ1Wz644mdMu3dLNxtlg55vuuoLvVWKs+eya+LJD
 pvttw7ze1jr5G+/m8+xj8bYE4SNaK6LgQIaX8j0=
X-Received: by 2002:a05:6602:2f88:: with SMTP id
 u8mr1383715iow.175.1599006464204; 
 Tue, 01 Sep 2020 17:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
 <1598924352-89526-13-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1598924352-89526-13-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Sep 2020 17:16:50 -0700
Message-ID: <CAKmqyKPrC9bQKF_2zy89f+M8vS6NoJ5axJDdm5AypfiCDe8Fog@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] hw/arm: xlnx: Set all boards' GEM 'phy-addr'
 property value to 23
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9H4hJQUnRcao

On Mon, Aug 31, 2020 at 6:50 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> When cadence_gem model was created for Xilinx boards, the PHY address
> was hard-coded to 23 in the GEM model. Now that we have introduced a
> property we can use that to tell GEM model what our PHY address is.
> Change all boards' GEM 'phy-addr' property value to 23, and set the
> PHY address default value to 0 in the GEM model.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v3:
> - use the correct (Object *) to set the 'phy-addr' in xlnx-zynqmp.c
>
>  hw/arm/xilinx_zynq.c | 1 +
>  hw/arm/xlnx-versal.c | 1 +
>  hw/arm/xlnx-zynqmp.c | 2 ++
>  hw/net/cadence_gem.c | 6 +++---
>  4 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 969ef07..9ffcc56 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -119,6 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>          qdev_set_nic_properties(dev, nd);
>      }
> +    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      sysbus_mmio_map(s, 0, base);
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index e3aa4bd..12ba6c4 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -165,6 +165,7 @@ static void versal_create_gems(Versal *s, qemu_irq *pic)
>              qemu_check_nic_model(nd, "cadence_gem");
>              qdev_set_nic_properties(dev, nd);
>          }
> +        object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
>          object_property_set_int(OBJECT(dev), "num-priority-queues", 2,
>                                  &error_abort);
>          object_property_set_link(OBJECT(dev), "dma", OBJECT(&s->mr_ps),
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index c435b9d..7885bb1 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -460,6 +460,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>          }
>          object_property_set_int(OBJECT(&s->gem[i]), "revision", GEM_REVISION,
>                                  &error_abort);
> +        object_property_set_int(OBJECT(&s->gem[i]), "phy-addr", 23,
> +                                &error_abort);
>          object_property_set_int(OBJECT(&s->gem[i]), "num-priority-queues", 2,
>                                  &error_abort);
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem[i]), errp)) {
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d80096b..7a53469 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -250,7 +250,7 @@
>  #define GEM_PHYMNTNC_REG_SHIFT 18
>
>  /* Marvell PHY definitions */
> -#define BOARD_PHY_ADDRESS    23 /* PHY address we will emulate a device at */
> +#define BOARD_PHY_ADDRESS    0 /* PHY address we will emulate a device at */
>
>  #define PHY_REG_CONTROL      0
>  #define PHY_REG_STATUS       1
> @@ -1446,7 +1446,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
>              uint32_t phy_addr, reg_num;
>
>              phy_addr = (retval & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
> -            if (phy_addr == s->phy_addr || phy_addr == 0) {
> +            if (phy_addr == s->phy_addr) {
>                  reg_num = (retval & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
>                  retval &= 0xFFFF0000;
>                  retval |= gem_phy_read(s, reg_num);
> @@ -1569,7 +1569,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
>              uint32_t phy_addr, reg_num;
>
>              phy_addr = (val & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
> -            if (phy_addr == s->phy_addr || phy_addr == 0) {
> +            if (phy_addr == s->phy_addr) {
>                  reg_num = (val & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
>                  gem_phy_write(s, reg_num, val);
>              }
> --
> 2.7.4
>
>
