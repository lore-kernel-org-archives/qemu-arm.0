Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp823384ejq;
        Tue, 16 May 2023 20:41:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zejKJJa3zbDYyUslDOlq6/bnnWs3UJPNIPhVAg0AtmyjXvZfY/Y8HbQCPqg/6jFoHeUd3
X-Received: by 2002:a05:6214:1d2f:b0:61a:43f0:7308 with SMTP id f15-20020a0562141d2f00b0061a43f07308mr70642760qvd.27.1684294862029;
        Tue, 16 May 2023 20:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684294862; cv=none;
        d=google.com; s=arc-20160816;
        b=abDbbLJpsulsDsH+eCdOLlFivPNZ/J1mvP3PT4KuOmqGNk72lU01BUtzkE3gik+Q0Y
         r8lq/WVwMq2Kehsp2W/c2qm5r8UgUCbtsRioTl1WG7VRDyisr9gi9tN61q1Q/nk5SCem
         mpHruQxmFCwqKyfT+3CqwFe0f2CaGaiQ5kNc52z5oVzsAJwMYA6eG+YmFhTyXq0r4qHd
         999Er37ffib3at40ITdkREy7rJO5bTziz2g58e/JdLX+xDiOPl7wdH8GP903ai3beBa+
         qWWkhpbFFbiQCApIruQ/j0EqhNzrlM7/8aecD9j1TZ2VrChHYPH8BxSvSDZUDVKl2T8i
         tQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pPcFQo21eXW1Pge7vlk+v+e+pxWr/D8D6By0VIVq7aY=;
        b=h9vh9JgfscVc+AYwF9dlY3pP1FjftD/QG8sedOtQ2VFKHs/DamdmT+Afscc6kijOtS
         ThH2YD4yHKkbP645ck9SL7LSgHC9NVCugs11dt85WRv8EN9SeNYWX9AQFgImNypb2Ci8
         cLTfPLMqvV76lBHmEaWGsHBfxB76aSLS/aNRCDwUxQSvfTpX/VTWJ2FOkR9sLn1Cxz3I
         Pr+LgTrzuEY1zslkhD6zK0WfTsw5dh/qMKKsN6uUxl5NNfiq2tBbIFPdsrFk+YHSGr9v
         C+DYeqlY6mtoE/bMwDbkm4z7NnfRJc/FPVSd36Q7f4tX3EiRgIokw15Z+a5SeciFbOwK
         WRSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=EfwHWNto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc7-20020a05620a520700b0075544fda9ffsi719765qkb.744.2023.05.16.20.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 20:41:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=EfwHWNto;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pz81r-00014M-Sq; Tue, 16 May 2023 23:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz81o-00013h-7H; Tue, 16 May 2023 23:40:40 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz81l-00069o-04; Tue, 16 May 2023 23:40:39 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-435ff65df88so56990137.1; 
 Tue, 16 May 2023 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684294833; x=1686886833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPcFQo21eXW1Pge7vlk+v+e+pxWr/D8D6By0VIVq7aY=;
 b=EfwHWNtomS0Tv+odsBZHXHJD2nvuSDeRJrZnxZvzNZJDUuCwrvc6h9jJUpXcmEQNcV
 Vv11MoTZPrZKl28gkyGWpwqjI0HjX9ZiKds0u0f8W0Nvts3k2IPJFhxrrpbiTVXRroXR
 1Nw+YgdESqHLmACAl0TMg8W1vykYFRHbrkEz/4LCFG/SAyDkgSopPuYxJLhnVH1BuKop
 /atnyMb0XougP85P3nmW6ELfvcs3JqhDKoYYxDmE1IvNMe2u0TuXdHN0MP9cuc9K9Pfb
 hc/Dhk4o9ljYTGFE/Un7owtOndftc0WizCnabCVMchvyRmgXBIB4aZv0ubrkWoB80Bq1
 28cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684294833; x=1686886833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPcFQo21eXW1Pge7vlk+v+e+pxWr/D8D6By0VIVq7aY=;
 b=gcFOB5qXaW1eoahbghiCE2nM+FNJF/R9OQp/MAzE6CXxEVQ5Lj9kUgbAGQcoFJOnz9
 VbTYiRYlyn3T0jjxuDRNftah8uTt/fYrqX7ucq80zHRHpngzt5KidBC0v7NUsUIuhyWP
 UOXy2QWJJQtJgTfE+D31IztATGnmCzWZuQc2RS/Xdyeue5xzVYqkmFkAUXv2i2hMo33I
 07QLmDphBwPrqWelDP7Ca6bUnCorvePgLs3RpyfeC1m94d28Wsa7vz28tdUkwhdFdRSl
 OQT/AgVAQuZ6uYRxeQuIUFc5PV3FP4nvdNnVY5t6U2o0qHNQw3XHFpL2J8dLj+2pDCGi
 EeUg==
X-Gm-Message-State: AC+VfDySjw5eMhbqSLydrwefEu9X2+DcAb3SR1W3eh/bRlFOyDZSLT+g
 vRDA8QMqXymZ6tDUnCdTIZAsM6jpcnYwyitQe5Q=
X-Received: by 2002:a05:6102:3a66:b0:425:8613:da7d with SMTP id
 bf6-20020a0561023a6600b004258613da7dmr15497351vsb.22.1684294833687; Tue, 16
 May 2023 20:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230509002739.18388-1-gshan@redhat.com>
 <20230509002739.18388-4-gshan@redhat.com>
In-Reply-To: <20230509002739.18388-4-gshan@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 13:40:07 +1000
Message-ID: <CAKmqyKNeKTvKpkCO6z-+3Eh46fmEG6ytRB52LJY7WKyZDmCy+g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] hw/riscv: Validate cluster and NUMA node boundary
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 pbonzini@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org, 
 rad@semihalf.com, quic_llindhol@quicinc.com, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 thuth@redhat.com, lvivier@redhat.com, ajones@ventanamicro.com, 
 berrange@redhat.com, dbarboza@ventanamicro.com, yihyu@redhat.com, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pI2MYTujrCO6

On Tue, May 9, 2023 at 10:29=E2=80=AFAM Gavin Shan <gshan@redhat.com> wrote=
:
>
> There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
> Both of them are required to follow cluster-NUMA-node boundary. To
> enable the validation to warn about the irregular configuration where
> multiple CPUs in one cluster has been associated with multiple NUMA
> nodes.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c | 2 ++
>  hw/riscv/virt.c  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 2c5546560a..81f7e53aed 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -354,6 +354,8 @@ static void spike_machine_class_init(ObjectClass *oc,=
 void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary =3D true;
>      mc->default_ram_id =3D "riscv.spike.ram";
>      object_class_property_add_str(oc, "signature", NULL, spike_set_signa=
ture);
>      object_class_property_set_description(oc, "signature",
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..84a2bca460 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1678,6 +1678,8 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>      mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported =3D true;
> +    /* platform instead of architectural choice */
> +    mc->cpu_cluster_has_numa_boundary =3D true;
>      mc->default_ram_id =3D "riscv_virt_board.ram";
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
> --
> 2.23.0
>
>
