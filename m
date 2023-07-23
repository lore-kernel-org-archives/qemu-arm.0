Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1524571ejb;
        Sun, 23 Jul 2023 16:46:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHflibqrqwSwMAgQZ+ILj0pGKwh1ZB0bzzFUBNMU3UPpKip+ca6q9nK01sddZBwbD4HMeq8
X-Received: by 2002:a05:620a:2211:b0:765:4073:efce with SMTP id m17-20020a05620a221100b007654073efcemr5740635qkh.19.1690155973290;
        Sun, 23 Jul 2023 16:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690155973; cv=none;
        d=google.com; s=arc-20160816;
        b=H8TlsakUt89hA6ZhHqU8uBolYbIhPnJSCnJU/wT/0LW5WgcCAQ5/PSXpnIPg9hNQ23
         PRb42OdMO611OriVSEU64DnG452HFm8qHr2aXLOmTh2nTaNsb42bvcwCzqkIH7YfAw8J
         CQikOwy9f/QZjEtFOoo1pDbmiwSGhQdiEP90/2oqBYnj4X8h/a6qLIWlFDq6397F6Su5
         3PRVAIcGj1oY7qdBRazHc6L7FU+r5AaBOap/vKVvvTuMkooMle7VYsVfTaCzBfvfdhQd
         omRIClYF1ZEls3SEhAo2WPyfI/3C2a4AtqK4GPfl+BGnIsVGxbQA52qUpp2EyuhgRBEk
         nM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FjhIaXTvM+YazFlF0I0qdrNY4Jr2xUalkd8K3LBKGis=;
        fh=t5P2QJgybaxZDuabJN4+EN00g1FWdT3a2w30ZXlVs9U=;
        b=Q0QrTEuqP8bs78gI74WwxHyS6uLWOEWsXw4qG+b5S9gINXN17sHDGycmeWZkT4+gey
         PgWZ21mf543DRt4sYL1uq638fjeWeirVGZBsAy9ZxDAg9qnWqOz8RzAKO8ClCiup/P62
         FZb/Zkt3fNVXjLWrSqzzyl57bwTZl8U+Ep8sH9Ov0znXRF9x5YTkMqiK+P7ZOw2nP70r
         XuDOsDs6Lh3wduUzBeQBrWU3fJyO4+bxjQw8MGWCDYzSAkD5SC2rDfOaSeHw1IJw/8D/
         Ecpbw3Ucz0eaOG8fIP1o3nXS4mQis9Ul9yShxTzfKWsqyLkqWEhJ2UH9ChsXPzN1i/Qv
         buLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="cJFLRL/k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay16-20020a05620a179000b007671d2985ebsi4468407qkb.279.2023.07.23.16.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 16:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="cJFLRL/k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qNim2-0004JC-Fr; Sun, 23 Jul 2023 19:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNim0-0004Iv-Tr; Sun, 23 Jul 2023 19:46:00 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNilz-0001dS-9U; Sun, 23 Jul 2023 19:46:00 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7996e265b4dso1464605241.2; 
 Sun, 23 Jul 2023 16:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690155956; x=1690760756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjhIaXTvM+YazFlF0I0qdrNY4Jr2xUalkd8K3LBKGis=;
 b=cJFLRL/kINhVbgsMGyi3NN3jvOluS03E03/N+iws4dv0GuxH6zgZezge1OLeMx2+yA
 fV5CnsPh5Hm1zaEYA41knxZR+vBe8pyz+msQM0udZ4po3jSu5OXqQZmL/DQpJh5LDwGl
 KhNR9EadLTTYgcwt5YU1et6l/l2Qs4SJntgqgUbgGubVL02110TeZ7adFcXBQYPi61gN
 9NVm9PtTkHATpxzPmm0DWKT/+XHQ+r0CREE/2M2qxRgPvSPFGhhAtxmTHmaLyDtQrDDM
 vWpEww+PROC+tzrO8rqtdnBaPuJtjlSByaeBRaIfYX1diAOj5kZOfuQyiF0sUpkTTRw4
 Q2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690155956; x=1690760756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjhIaXTvM+YazFlF0I0qdrNY4Jr2xUalkd8K3LBKGis=;
 b=Zar/jRo+pldlPF6uAy4Rn3H5oDrxRDFkPPOj1KNvePlTZqZgb3GGmmNxxiPKIkSwQY
 QyJ/WjaPUyJdZ6G0LsbifVHMkVHeZDX26fsCJdO5QTJmSgoPckVNyNjaDUn2bR8mB8xg
 0IfR4LQ20L47O2PhB7geFqC+Vz2dH6OU7g8Rzocojb3+jskpOO4+T5nk/OZrbyMT1N8P
 +4Od2yPoAtIF71qNJuUkOAViYNqZCZAuG6AXagb2u8nEJeSe6bMMJWZ9w3mAYyf5vDhK
 viHw89LJ5xJuPceU0rwZ1vuCDK8yh/owVzGXQmAIG8vJsk2ahtxMweWK3FDvZVQP581X
 uP7A==
X-Gm-Message-State: ABy/qLZAx3T9tEHS6sAz1VDlNMilQ5BSEGxpQgpg3Pn8n+iz6o3HCuTs
 dOaDEPP7ndvuMSw9disoTv2OMUQbVX64W3+HKEE=
X-Received: by 2002:a1f:3d4f:0:b0:47e:1425:12a7 with SMTP id
 k76-20020a1f3d4f000000b0047e142512a7mr3843034vka.5.1690155956547; Sun, 23 Jul
 2023 16:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-3-sunilvl@ventanamicro.com>
In-Reply-To: <20230712163943.98994-3-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 09:45:30 +1000
Message-ID: <CAKmqyKOGnyBvwFu3yX03ksdOtwG2z0_VY+AKhbYQ3ODiJF_mfQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv: virt: Add PCI bus reference in
 RISCVVirtState
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T2au4XyysRjB

On Thu, Jul 13, 2023 at 2:42=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> The PCI bus information is needed in RISCVVirtState so that other
> files like virt-acpi-build.c can make use of it. Add new field in
> RISCVVirtState so that ACPI code can use it.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 6 ++++--
>  include/hw/riscv/virt.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..46d3341113 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1073,7 +1073,8 @@ static inline DeviceState *gpex_pcie_init(MemoryReg=
ion *sys_mem,
>                                            hwaddr high_mmio_base,
>                                            hwaddr high_mmio_size,
>                                            hwaddr pio_base,
> -                                          DeviceState *irqchip)
> +                                          DeviceState *irqchip,
> +                                          RISCVVirtState *s)
>  {
>      DeviceState *dev;
>      MemoryRegion *ecam_alias, *ecam_reg;
> @@ -1113,6 +1114,7 @@ static inline DeviceState *gpex_pcie_init(MemoryReg=
ion *sys_mem,
>          gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
>      }
>
> +    s->bus =3D PCI_HOST_BRIDGE(dev)->bus;
>      return dev;
>  }
>
> @@ -1502,7 +1504,7 @@ static void virt_machine_init(MachineState *machine=
)
>                     virt_high_pcie_memmap.base,
>                     virt_high_pcie_memmap.size,
>                     memmap[VIRT_PCIE_PIO].base,
> -                   pcie_irqchip);
> +                   pcie_irqchip, s);
>
>      create_platform_bus(s, mmio_irqchip);
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..4ef1f660ab 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -60,6 +60,7 @@ struct RISCVVirtState {
>      char *oem_table_id;
>      OnOffAuto acpi;
>      const MemMapEntry *memmap;
> +    PCIBus *bus;
>  };
>
>  enum {
> --
> 2.39.2
>
>
