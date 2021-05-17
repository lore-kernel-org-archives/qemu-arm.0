Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1467199lfm;
        Mon, 17 May 2021 10:12:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwRBswuI1BGFOXz94EI/IBPN+Bbt+McoeqOdvbikbQNBZNhynaAoa+XXPe9ckadiT6Uq32
X-Received: by 2002:a05:6e02:1002:: with SMTP id n2mr583442ilj.260.1621271562626;
        Mon, 17 May 2021 10:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621271562; cv=none;
        d=google.com; s=arc-20160816;
        b=EXey2KrjnqY7sPcehlgFNe5wX7xnoBxAJ/joWPjYdQvE9Xg0/8aOvY1PLD9hIQoeCx
         uaXmsI8ImvMKyG7kJv6tTWf2/c1OJUzzqVa0dmTnyC6LzAX7PBgULn59UWIvkhq7sp2l
         o1Ao5j4lnZVnk4mXRDwaFE9NCucYRuX33W6cwtnuHY8HpLLt4ErM7LjNTTiTnhTppKp5
         Jna2+Rl6pPDWJBOhZKcrx7bBz/gGQcJQ9psRcto5tv5VjfeQolWEZtH5Xxf6pxk6+raA
         7aIBkOtGGHoBdxdNjrT9a8HcU4YE7DN+DDOYvwgryqQrwoXI6fR0VGMA1eHdSR/JKo/m
         mn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=8h7YJ8cWRoSruS42EuF5SH1jgV1UozlDUkCSQz6Vvvs=;
        b=rmgH0uuVTx7HrRJ4VNmpvzpKCaBxF/n3F2rmbVN3pQuDdf99e/UoNgvEodd3gzlaRp
         U2/r5s4T80Hzg5yHohtFgZoo36RV+oYtF8pCVc4aIBX3Ed8WNRVIMI0gekqdy+lRcsOB
         sG515eN27MaJpghrb4BOQ0GJ1guYug4eKVfM29mygbrtCPOo3Wlhz+wNfhr45aXw/2w9
         fPf9MSQrXW74F2y/wt/UKEvSCFDOPgbR1qEDEwKVFUSmW0+1oTRQMRR1K0FcnafYysAv
         i+KAddeNhrwutlXUPvZG3vdSVh1xdRH/y/FxJGiHrWHWUwf9Bn275DRGRKg/NwMChh01
         m2Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si18425339ill.69.2021.05.17.10.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 10:12:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lignJ-0002cL-TZ
	for alex.bennee@linaro.org; Mon, 17 May 2021 13:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1ligid-0000el-73; Mon, 17 May 2021 13:07:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1ligia-00046E-Hg; Mon, 17 May 2021 13:07:51 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkQVM0LSmz17SNV;
 Tue, 18 May 2021 01:04:59 +0800 (CST)
Received: from dggpeml100023.china.huawei.com (7.185.36.151) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 01:07:43 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggpeml100023.china.huawei.com (7.185.36.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 01:07:42 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Mon, 17 May 2021 18:07:40 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: RE: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
Thread-Topic: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
 generation of MADT
Thread-Index: AQHXSj8wnuHxD9/W3U6Az/MWJnnxn6rn6C1A
Date: Mon, 17 May 2021 17:07:40 +0000
Message-ID: <6d3c643dc9174f8199ea9422f9e995e5@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-7-wangyanan55@huawei.com>
In-Reply-To: <20210516102900.28036-7-wangyanan55@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.78.116]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=salil.mehta@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Linuxarm <linuxarm@huawei.com>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>, yangyicong <yangyicong@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMaV4D5G7Epn

> From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.o=
rg]
> On Behalf Of Yanan Wang
> Sent: Sunday, May 16, 2021 11:29 AM
> To: Peter Maydell <peter.maydell@linaro.org>; Andrew Jones
> <drjones@redhat.com>; Michael S . Tsirkin <mst@redhat.com>; Igor Mammedov
> <imammedo@redhat.com>; Shannon Zhao <shannon.zhaosl@gmail.com>; Alistair
> Francis <alistair.francis@wdc.com>; David Gibson
> <david@gibson.dropbear.id.au>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; zhukeqian
> <zhukeqian1@huawei.com>; yangyicong <yangyicong@huawei.com>; Zengtao (B)
> <prime.zeng@hisilicon.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> yuzenghui <yuzenghui@huawei.com>; Paolo Bonzini <pbonzini@redhat.com>;
> Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Subject: [RFC PATCH v3 6/9] hw/arm/virt-acpi-build: Use possible cpus in
> generation of MADT
>=20
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. So we create gicc nodes in MADT for possible cpus and then
> ensure only the present CPUs are marked ENABLED. Furthermore, it
> also needed if we are going to support CPU hotplug in the future.

Hi Yanan,
Yes, these changes are part of the QEMU patch-set I floated last year.

Link: https://www.mail-archive.com/qemu-devel@nongnu.org/msg712018.html


Perhaps I am missing something, but how this patch is related to the vcpu
topology support?

Thanks

>=20
> Co-developed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a2d8e87616..4d64aeb865 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -481,6 +481,9 @@ build_madt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
>      const int *irqmap =3D vms->irqmap;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
> +    MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> +    const CPUArchIdList *possible_cpus =3D
> mc->possible_cpu_arch_ids(MACHINE(vms));
> +    bool pmu;
>      int i;
>=20
>      acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
> @@ -491,11 +494,21 @@ build_madt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
>      gicd->base_address =3D cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version =3D vms->gic_version;
>=20
> -    for (i =3D 0; i < MACHINE(vms)->smp.cpus; i++) {
> +    for (i =3D 0; i < possible_cpus->len; i++) {
>          AcpiMadtGenericCpuInterface *gicc =3D acpi_data_push(table_data,
>                                                             sizeof(*gicc)=
);
>          ARMCPU *armcpu =3D ARM_CPU(qemu_get_cpu(i));
>=20
> +        /*
> +         * PMU should have been either implemented for all CPUs or not,
> +         * so we only get information from the first CPU, which could
> +         * represent the others.
> +         */
> +        if (i =3D=3D 0) {
> +            pmu =3D arm_feature(&armcpu->env, ARM_FEATURE_PMU);
> +        }
> +        assert(!armcpu || arm_feature(&armcpu->env, ARM_FEATURE_PMU) =3D=
=3D pmu);
> +
>          gicc->type =3D ACPI_APIC_GENERIC_CPU_INTERFACE;
>          gicc->length =3D sizeof(*gicc);
>          if (vms->gic_version =3D=3D 2) {
> @@ -504,11 +517,19 @@ build_madt(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
>              gicc->gicv_base_address =3D
> cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>          }
>          gicc->cpu_interface_number =3D cpu_to_le32(i);
> -        gicc->arm_mpidr =3D cpu_to_le64(armcpu->mp_affinity);
> +        gicc->arm_mpidr =3D cpu_to_le64(possible_cpus->cpus[i].arch_id);
>          gicc->uid =3D cpu_to_le32(i);
> -        gicc->flags =3D cpu_to_le32(ACPI_MADT_GICC_ENABLED);
>=20
> -        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> +        /*
> +         * ACPI spec says that LAPIC entry for non present CPU may be
> +         * omitted from MADT or it must be marked as disabled. Here we
> +         * choose to also keep the disabled ones in MADT.
> +         */
> +        if (possible_cpus->cpus[i].cpu !=3D NULL) {
> +            gicc->flags =3D cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        }
> +
> +        if (pmu) {
>              gicc->performance_interrupt =3D cpu_to_le32(PPI(VIRTUAL_PMU_=
IRQ));
>          }
>          if (vms->virt) {
> --
> 2.19.1
>=20

