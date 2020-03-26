Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2432827lfi;
        Thu, 26 Mar 2020 14:56:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu9ABnhJwG0MBJa18UMURVzPRA8F8OCBSvqAL5/wXg7T7E616/h9wnhtdE2hvrbmNANBuJG
X-Received: by 2002:ac8:7288:: with SMTP id v8mr10943929qto.31.1585259760374;
        Thu, 26 Mar 2020 14:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259760; cv=none;
        d=google.com; s=arc-20160816;
        b=DfLdlaVXHHjIlyHHBhIyWomxCjrQKH2qUrzR1/8meWnh/mfT1790ToiHbNBzSyc+i4
         9myJxzKEzf8M9Z1o8jOTLo/ZQrhwGGLGiEVLfsnl25/WpYrrSv88zA3XK6ATHyOpnek4
         tG2630GoAf9GR0+c5B4UvoBwmZ17airdS8/ym9SpioP+OFFjh6Gqg0rSEqDoy0XHq3V6
         3TxCw3eQmAlWYoMOmSA74/ot6zbUOrLIFj+6OA6Y6lDZa20U9onMNVf2nEXAu5RRa0Er
         T9SEGFx1Zql6pHrf3bs0ozMVrgcjUJ7rIMgsbfhIGFF3TJg28aCmxBbGpPrJqPoJ5mcN
         8n3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/7Dge42VPMQIQ+qAVtWjTSc1/n/GVgSuU4WhzEapY/E=;
        b=VJUL1DUKOjdvvgv4Zi3GCwEXbhbvFqw9ZhxeriS4Oa7PxAGYiCCrKFdpopqjiTksvN
         d6B43DzEpcWIZR6oIepb2z6dWRj0aWx7YTNJgHlLAsERaupFhPeIpDDc/c+/mQGOJiog
         vf8gtr+REM9mDsxvtraejthmUA7n1k1EhdUPRNBr78oAi43O8NP8Ch3Ya6mfkqJwB/Zt
         jc+ZFBHI37NP5ejk6AZ4+4hkmraRy9NxxWgKn0yC0VM4TVqAkJdv0TmiMAxfnWEwBDSy
         x2pyBzjD9wV5GZs8XV0SEXBzD4K8/9/8FCLrOR/D9Tq1EHMC7JPUlDLmKBUTVuxHRY2o
         iEvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Aw1Y3/2d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si2498890qke.68.2020.03.26.14.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Aw1Y3/2d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaTn-0004Up-RD
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaTZ-0004UQ-PJ
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaTY-0005hl-HA
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:55:45 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:32951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaTY-0005gj-Bl
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:55:44 -0400
Received: by mail-oi1-x243.google.com with SMTP id m14so7066183oic.0
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/7Dge42VPMQIQ+qAVtWjTSc1/n/GVgSuU4WhzEapY/E=;
 b=Aw1Y3/2dzbHMFpA62MhH9zJsJ8zMqb4GtyaSvfdqziD4nig5f4LXR3VQHxjwWVzXru
 8IYgF/jp+QflPbPr6w7Op4sOLl5UoZ2i6fL0iVQwFdHbHHAWzD/0rE4nwvLNeWa9TQ6e
 NU/z7gYAi4BAz09GvmaJzVd5qp579/Th1VHa45XC059+kUBXZ10obygo1tW+GDkR3eJa
 6ZDWsFturC6K2oSd0oe2hs7raNj1Ht48xyWla/TO61ubtKwnTkJa1KZnN5NxmJC8Y0g5
 hTXZJ8OIBEab+faVD3EZwPlfo3erURNegpJVagQtnA/1O2K+Qa4HoUPIsweELUgdlMcj
 OI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/7Dge42VPMQIQ+qAVtWjTSc1/n/GVgSuU4WhzEapY/E=;
 b=e83u0E3k1oJ08Mlij4UBAvBq7brUyKpdPUbqAUimmLqvgkMknAhEkKD0xyUZqA+ycZ
 o67cRhlpVROUNpgJLKvbSSCHqPMdRmGVsIn5rUiry3oYMOwaeHIOC/Cf03rs/VKHzLRr
 +/xtWl1ykFpme8RBOe9awj3SfK8w06niIGC88pLpJJkdtDkIx7X/q6xTAzEMkrCM5TuZ
 xOswXbkNkuSZfUivmww33rh5nfxUQ+siphTzPJGQDjDLXzkg7AJzHA8ApPIWWwnz1n+X
 /ZXy8sdILm7L3XjO566SX8wvvy68sVx+JilURh3gKPRLEW8zXuPFlIV5lMcxkXtJkdR0
 LI0A==
X-Gm-Message-State: ANhLgQ1Uoikq7dollUoOr5dDnpno7NEfIvwRpPdC2O4k0ESwKX1iV5yE
 CSCYQFEZOGIAf76CTdf1NkkuHNBU2kb9efJ1tOcRKg==
X-Received: by 2002:aca:c608:: with SMTP id w8mr1963767oif.163.1585259743374; 
 Thu, 26 Mar 2020 14:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-13-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-13-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:55:32 +0000
Message-ID: <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 12/12] hw/riscv/sifive_u: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mn8sZyOX6nqy

On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_bool() hw/riscv/sifive_u.c:558:4]]
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_bool() hw/riscv/sifive_u.c:561:4]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/riscv/sifive_u.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 56351c4faa..01e44018cd 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -473,113 +473,121 @@ static void riscv_sifive_u_machine_instance_init(=
Object *obj)
>  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>  {
>      MachineState *ms =3D MACHINE(qdev_get_machine());
>      SiFiveUSoCState *s =3D RISCV_U_SOC(dev);
>      const struct MemmapEntry *memmap =3D sifive_u_memmap;
>      MemoryRegion *system_memory =3D get_system_memory();
>      MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem =3D g_new(MemoryRegion, 1);
>      qemu_irq plic_gpios[SIFIVE_U_PLIC_NUM_SOURCES];
>      char *plic_hart_config;
>      size_t plic_hart_config_len;
>      int i;
>      Error *err =3D NULL;
>      NICInfo *nd =3D &nd_table[0];
>
>      object_property_set_bool(OBJECT(&s->e_cpus), true, "realized",
>                               &error_abort);
>      object_property_set_bool(OBJECT(&s->u_cpus), true, "realized",
>                               &error_abort);
>      /*
>       * The cluster must be realized after the RISC-V hart array containe=
r,
>       * as the container's CPU object is only created on realize, and the
>       * CPU must exist and have been parented into the cluster before the
>       * cluster is realized.
>       */
>      object_property_set_bool(OBJECT(&s->e_cluster), true, "realized",
>                               &error_abort);
>      object_property_set_bool(OBJECT(&s->u_cluster), true, "realized",
>                               &error_abort);

Different bug noticed in passing: these really ought not to be
using error_abort to realize things, as realize is a fairly
likely-to-fail operation on most objects (either now or in
the future if the object implementation changes).

>
>      /* boot rom */
>      memory_region_init_rom(mask_rom, OBJECT(dev), "riscv.sifive.u.mrom",
>                             memmap[SIFIVE_U_MROM].size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_MROM].bas=
e,
>                                  mask_rom);

>      object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].b=
ase);
>
>      object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }

The changes made in this patch are fine though:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
