Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24420292lff;
        Tue, 7 Jan 2020 01:39:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlWWPKfSGu2I8fjLCl6GVoiZfcTt9WruMZRkh1vqsONLAxRbAxnUrDq8VG2yZ+vA1/6Xb7
X-Received: by 2002:ac8:337c:: with SMTP id u57mr70353476qta.42.1578389972980;
        Tue, 07 Jan 2020 01:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578389972; cv=none;
        d=google.com; s=arc-20160816;
        b=yPzlbCS0EDYg9H6jFmuHWL3G+mcKwPq585MjJcF3FeclSnQz0pTh23VzoMtIyuamFe
         ny8dT41qxJZv/Pd3QdK9gk0vuQnjS0PDKqESue77ZPzeNVGMFk0ukrk9UyA9F9dfJ81v
         MQuP4OF/11BbIJxyF2PV5gEsYtzfIT6P/y7vFg7UOs+C/bpJGaLKzJnvDcVdPchdbt/n
         pW0mYw6pYZ4rV+c38S1oKCLO6UcaE/XiPVbGi4by8jwDGnJC2GbBXZ5addP5Zp+qwrYB
         c1pwloKGjtaA3mOSzSn71VCQ2u4JCB0DvncLfNuQkYDn9Metl1Zk/bucJ6nmai47IaRp
         kJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=rV4AdtV6fpiPzPLrFUgrzsHrBxOJEDqTcY7DhA1rJnY=;
        b=cE5oeWTcSA83bX2IIqm9A7xMZKQ/lPct8xKyZudeRi0i46kIBitUx9NdbwFICdoCIW
         nCc73e4D4UxF/kpt9z5ymZdMsg5PM94f0OppY9TjnhdXJ/pOQlYAszu0BFvdEFelwpqf
         jlcc0ymqLkS6OMWG8wp+REULL4gFdViylx0KKYzBGhmh4aWAf5sKRR28FAq+4GtylF7l
         l+gnzowmeeXMxJlsfGnY7B9NSx24sS/1RtRv6HYVpa0tSkuzS9Y6SMxeI/6LkVNJZ/1n
         GlBWsKoWxkZXsD0aI6O414TZFaBw6xYZeA6M/4eT8bOymkAGk4grUm/6VPDTBt7CMUqP
         47pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BEIDivJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t125si31610424qkd.14.2020.01.07.01.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 01:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BEIDivJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iolKk-0003ns-Dl
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 04:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iolEn-0000en-9F
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 04:33:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iolEl-0006Ry-77
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 04:33:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52186
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iolEl-0006RR-28
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 04:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578389598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rV4AdtV6fpiPzPLrFUgrzsHrBxOJEDqTcY7DhA1rJnY=;
 b=BEIDivJEY2B7JoG22FIOE+qvQMb3DRSa8jR66HzxPFve2VTWxroExKyHVx9ti4Z/kb/WTe
 Eq3yAoHEIvXyLr5G3GXvVK37nGXSVef18cfRf5fxu7XFIavLzP+NqIi4wb+NmiMC1nyUtC
 OaMULOXxVR/iDrdmfbiADee2OpZ5xDM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-h01hAvLmN7y6-Q6DEEbH6Q-1; Tue, 07 Jan 2020 04:33:16 -0500
Received: by mail-qk1-f198.google.com with SMTP id g28so17539873qkl.6
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2020 01:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ohifn2DS3HJRYsyyct+ZrgDyh93/8Y0awwWQNx1/1jY=;
 b=TM9A8dsykxxzclTdnASB0MSG/tApOYVv7JcLPfNViPbNTfqp8aDSj2YS8XoQ26ZkdY
 MLnQIM/Oo9fWSZBPOKjXjfRfP+Szlw93ahgwLLhscvGau6R4iKib4d/xU5qiDUlYpfiy
 vZgcp5tFJP8ADR2cR2nEfFz4g9i+mwh0jFBLAVh64y2OCQBkuOKwrUdy7TGKbp+k15hR
 p5ibOv/DFkEozbev3/l1s/RrB0qE0v5LEKW9xUHqp2+MjNCNwj4ZyVeaJ5G3+p+H/n8W
 xA1ZBUL91R75MVCtZ5oZw0pcCeQXvc90+GfwxZ0HAwrSofN4xihJm0zLPbl9LT+BdYoh
 ftsA==
X-Gm-Message-State: APjAAAU+LFluB/vnM07iJWV4Z9hcXq9b6JtKl3csHkYosVtJ0A+GPvJT
 C4nY95L5BOF7WYdmUijY672P9e7VfiPGzcRRyqhXQR/iTsuUDyr3sC79qTxpKr2x12QwJGAt9vl
 rG4ayjyrAObdg
X-Received: by 2002:ae9:c112:: with SMTP id z18mr85848445qki.145.1578389596435; 
 Tue, 07 Jan 2020 01:33:16 -0800 (PST)
X-Received: by 2002:ae9:c112:: with SMTP id z18mr85848421qki.145.1578389596085; 
 Tue, 07 Jan 2020 01:33:16 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id q73sm22021675qka.56.2020.01.07.01.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 01:33:15 -0800 (PST)
Date: Tue, 7 Jan 2020 04:33:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zeng Tao <prime.zeng@hisilicon.com>
Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Message-ID: <20200107042918-mutt-send-email-mst@kernel.org>
References: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
X-MC-Unique: h01hAvLmN7y6-Q6DEEbH6Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /q2cpOHUDfsG

On Tue, Jan 07, 2020 at 05:18:49PM +0800, Zeng Tao wrote:
> When booting the guest linux with the following numa configuration:
> -numa node,node_id=3D1,cpus=3D0-3
> -numa node,node_id=3D0,cpus=3D4-7
> We can get the following numa topology in the guest system:
> Architecture:          aarch64
> Byte Order:            Little Endian
> CPU(s):                8
> On-line CPU(s) list:   0-7
> Thread(s) per core:    1
> Core(s) per socket:    8
> Socket(s):             1
> NUMA node(s):          2
> L1d cache:             unknown size
> L1i cache:             unknown size
> L2 cache:              unknown size
> NUMA node0 CPU(s):     0-3
> NUMA node1 CPU(s):     4-7
> The Cpus 0-3 is assigned with NUMA node 1 in QEMU while it get NUMA node
> 0 in the guest.
>=20
> In fact, In the linux kernel, numa_node_id is allocated per the ACPI
> SRAT processors structure order,so the cpu 0 will be the first one to
> allocate its NUMA node id, so it gets the NUMA node 0.
>=20
> To fix this issue, we pack the SRAT processors structure in numa node id
> order but not the default cpu number order.
>=20
> Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>


Does this matter? If yes fixing linux to take node id from proximity
field in ACPI seems cleaner ...

> ---
>  hw/arm/virt-acpi-build.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bd5f771..497192b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -520,7 +520,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>      AcpiSystemResourceAffinityTable *srat;
>      AcpiSratProcessorGiccAffinity *core;
>      AcpiSratMemoryAffinity *numamem;
> -    int i, srat_start;
> +    int i, j, srat_start;
> +    uint32_t node_id;
>      uint64_t mem_base;
>      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
>      MachineState *ms =3D MACHINE(vms);
> @@ -530,13 +531,19 @@ build_srat(GArray *table_data, BIOSLinker *linker, =
VirtMachineState *vms)
>      srat =3D acpi_data_push(table_data, sizeof(*srat));
>      srat->reserved1 =3D cpu_to_le32(1);
> =20
> -    for (i =3D 0; i < cpu_list->len; ++i) {
> -        core =3D acpi_data_push(table_data, sizeof(*core));
> -        core->type =3D ACPI_SRAT_PROCESSOR_GICC;
> -        core->length =3D sizeof(*core);
> -        core->proximity =3D cpu_to_le32(cpu_list->cpus[i].props.node_id)=
;
> -        core->acpi_processor_uid =3D cpu_to_le32(i);
> -        core->flags =3D cpu_to_le32(1);
> +    for (i =3D 0; i < ms->numa_state->num_nodes; ++i) {
> +        for (j =3D 0; j < cpu_list->len; ++j) {

Hmm O(n ^2) isn't great ...

> +            node_id =3D cpu_to_le32(cpu_list->cpus[j].props.node_id);
> +            if (node_id !=3D i) {
> +                continue;
> +            }
> +            core =3D acpi_data_push(table_data, sizeof(*core));
> +            core->type =3D ACPI_SRAT_PROCESSOR_GICC;
> +            core->length =3D sizeof(*core);
> +            core->proximity =3D node_id;
> +            core->acpi_processor_uid =3D cpu_to_le32(j);
> +            core->flags =3D cpu_to_le32(1);
> +        }
>      }

is the issue arm specific? wouldn't it affect x86 too?

>      mem_base =3D vms->memmap[VIRT_MEM].base;
> --=20
> 2.8.1

