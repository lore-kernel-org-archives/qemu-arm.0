Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3944130lfm;
        Mon, 13 Apr 2020 09:07:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypKBN7Vk2VEHeKLkydF9TBmN/6bT6klariF0tsEu2YP+V7Oz0nfl2AOd6WTPInuPDfYhP1dM
X-Received: by 2002:ac8:c48:: with SMTP id l8mr12010901qti.61.1586794022983;
        Mon, 13 Apr 2020 09:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586794022; cv=none;
        d=google.com; s=arc-20160816;
        b=HGoPemDq2ht+DezFwbkqlLSxMzJb9+6amj1hzLfLbjcqvmsQi8T2x9DfV2+mtoox3H
         oVUsilPBS9WMnp6jtaGghlcWDSNBzaryXyAUHQoRE+Y7+TipDxX7UUf5Huyn2/b4gacw
         hE05H4FMZ/TxSYN7EX2TsPFInVWX2KQz8H7vVXVGw98wTpWt3jxXLTxXQ9oCJI0JDnUx
         M9Q9U1yoyGp8teD5ljUKa+xYcKTy9fhXIBaA57ABbsE4cjg4vppaalHvuRz3aUWckbJc
         gMr07B0MfwrziOz3F7VFtQFS+1fVVcgGuLAnbEOqnAjydQ4MTlapeOutQ++6D1tjpmQY
         lxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ncPNgMcOBImrfUo6oLIIgskvPlrGH005jpGafkmeKso=;
        b=Y4fHtPUC+d3hJQ59TUhTzawX4LYahoMONYjmTnre6N+YGW4OPfrt3Re4pK2Lp8cmb3
         5ELdLHtEsE5wuUrf11FqN0RgpOHr8xBePnULyY90VcK2KfFYegNAaNK3nKnDAlmpXunA
         1uaJ9JHhK7n1ktuWH87ENuMsrfngDcUIrXg+4I9+GjlwG3KMEyl4pT5pYA5sjBhVMQS4
         4ckZt48UvWgtS6R6bz4lrQJ5FWiZmTpKQP1EeEn0mIFDG1F2Dyk6u0dzzjfIU/GbfZyJ
         y0KsJ9mozs47+SuZjM8rVwyIL/+YsNJHFDdxtfPOyJ1RKZ+xlK/qhrhWP2RIF677M3a6
         GknA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X5A5CBEG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si6197129qvf.219.2020.04.13.09.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 09:07:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X5A5CBEG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO1by-0003en-Ez
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 12:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO1am-0002bS-U8
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO1al-000410-Q6
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 12:05:48 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:44994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO1al-00040d-JZ; Mon, 13 Apr 2020 12:05:47 -0400
Received: by mail-vs1-xe42.google.com with SMTP id z1so1690450vsn.11;
 Mon, 13 Apr 2020 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ncPNgMcOBImrfUo6oLIIgskvPlrGH005jpGafkmeKso=;
 b=X5A5CBEGTcxBjzkPGYAp8Golt/lm1O+kzmVFVSO2xiFWQ8W0e08K287qKOmvZH0MEv
 +v5Zfw1QZ8CyS/zUbjCGJXZRcscpN9HWWCzP7hEEu/5lu241WLUV38T2rgFl3ol7Woi7
 cGRlSQpPHzJvnukeaLVfHsTcayOD08Gd/FpyQi7EM1YT4frmhB1CRbv6yX+VYsbs3a8E
 DlMxmtHfc7oj6bZ0uT9fAed32tPKTSt7ZtizKG3kYHt3rah7N3ZK7c4u0IokDPqfjTZD
 9XznXHux2c5LlyBXmW8Q44RV2y44dHljWEyx9p9ZkmtZkUge88Y4MCDr9IFWcuSb5go+
 FdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ncPNgMcOBImrfUo6oLIIgskvPlrGH005jpGafkmeKso=;
 b=q/jCTX6V1pf8TjYqbS2ZALeiz6PwyRRy2BeSj2rh5NjILpUTirHU+dW7fzjoJUT827
 cE+VlVr3jIoMavnwEzydbraClmoAo7HsKVkWQMxQLdpioQAFvwTp36ZJVMec2iYMlaKR
 o4vqbLDA+/LPOCu+QuG8JuNhqopS3zFb54nWGy8fIWSnz/1NmbjgfB/RcnVixa9MfqhX
 OQ4mQiPLd/dwoUspjZqGRAVJVvF12xk4veGObhtVdmGTDpi7YDuTVo9PKHklyrjLnMqr
 Sr8py7uw9oxc1t8jA6APMDmGUjVda7b9t4FXHAKc8IHbBXlr33C0lI814vBsfIq5mh2U
 W4NA==
X-Gm-Message-State: AGi0Pubyl0vmrU8xTWsKwlwXbcexu2kKdivc2PSlM2fWSI0mJDDU0qkl
 gdKqin52UtHCs484X5IaJpjSl4Beg4OBKoHqbug=
X-Received: by 2002:a67:26c2:: with SMTP id
 m185mr13061477vsm.180.1586793944785; 
 Mon, 13 Apr 2020 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200412224144.12205-1-f4bug@amsat.org>
 <20200412224144.12205-7-f4bug@amsat.org>
In-Reply-To: <20200412224144.12205-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 08:57:29 -0700
Message-ID: <CAKmqyKMew7-p7=k3tAQYd94BEB_R+QThQbWKZFm8BMJXe9H3Ww@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 06/23] hw/arm/msf2-soc: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CcsSeTI7LYQG

On Sun, Apr 12, 2020 at 3:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/msf2-soc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index e448b0ab74..7619e71cfa 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -93,7 +93,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, E=
rror **errp)
>      MemoryRegion *system_memory =3D get_system_memory();
>
>      memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->env=
m_size,
> -                           &error_fatal);
> +                           &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      /*
>       * On power-on, the eNVM region 0x60000000 is automatically
>       * remapped to the Cortex-M3 processor executable region
> @@ -107,7 +111,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>      memory_region_add_subregion(system_memory, 0, &s->nvm_alias);
>
>      memory_region_init_ram(&s->sram, NULL, "MSF2.eSRAM", s->esram_size,
> -                           &error_fatal);
> +                           &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
>
>      armv7m =3D DEVICE(&s->armv7m);
> @@ -115,7 +123,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memor=
y()),
> -                                     "memory", &error_abort);
> +                                     "memory", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
> @@ -184,8 +196,12 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>          bus_name =3D g_strdup_printf("spi%d", i);
>          object_property_add_alias(OBJECT(s), bus_name,
>                                    OBJECT(&s->spi[i]), "spi",
> -                                  &error_abort);
> +                                  &err);
>          g_free(bus_name);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>      }
>
>      /* Below devices are not modelled yet. */
> --
> 2.21.1
>
>
