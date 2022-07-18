Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1340339lfp;
        Mon, 18 Jul 2022 07:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBjTtbrvipu4dMa5r9mOe6G2ShsOmvogOJhcNxpW5uZRMd9AbiHKC9u0JttJF9TP/7reVA
X-Received: by 2002:ae9:efd8:0:b0:6b5:df92:dc3b with SMTP id d207-20020ae9efd8000000b006b5df92dc3bmr5758740qkg.510.1658155290151;
        Mon, 18 Jul 2022 07:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658155290; cv=none;
        d=google.com; s=arc-20160816;
        b=lZoMLehkZfTAqsfesjJm1HB3Szv/9NjsEdEWFTTQDMMvL8PZVF+b+Av4jvBE5aK7bz
         hJ1Tyz/0TpL9JkRDkCnKTb9MdXxuVgqQkhNxpGEdhFOPieM1huLGY+oD5lGQBT4i7sjj
         RX9Bu1O65JWl5C1IzPkHaud/9d+Ww968bK2yMJou8uiaxm5j+hAevCp1oth98jG677er
         92sUbif4GC/ti1vUlAaGfeHedVnhl7uKBIQw8MQBFxSsFGoXB1Cx/H+nHYlicQ75SrsF
         cp0h9vzVrFNhLYigJ5MV48sJMvB8NE7xu0Te36+o8J9ChYtznzTYorcZk/ZlrzOAdNPX
         sLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=KcdLCsFpqRGORG5Gklxq5tpO1A/StMsFhTS+ry5h+xo=;
        b=tIG5Wl13Woyw9NMay5cA6ScITRPHDYtHnlMCI0U1Yy61UYScxK/yoHdPMZPGJMi0N3
         xSkbuIIVmaQD5LRa3sJIYJjYjEBQ2DxpI919YKOjeu7EsVIy0/tKyuvt0mwT1SdeRRY9
         MwT82/4tGtcPkeOKOKPESODhu8Zje9esEbQmEJB5ofdTwqPUPE0Wq0m1JlMLkn3Dt4Ur
         V6KSx8ZWqox69eAUHEhrqdgIR270YV+zZeAeR5bD0qB/dUMoeOaLhfYKN7CiD9foW+jV
         RN8nIGMEbKFZlYD3kKH6UR1TcOFASW1g9rWwgDx6vXcI1vVm9K+byjRfHgK1gFj2XM1A
         ZWqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daDsJV35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn13-20020ad45ded000000b00470b640e173si5788046qvb.382.2022.07.18.07.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 07:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daDsJV35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDRw9-0004Fi-IO
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 10:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRax-0001FV-L5
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 10:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDRau-00069Z-P2
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 10:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658153972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcdLCsFpqRGORG5Gklxq5tpO1A/StMsFhTS+ry5h+xo=;
 b=daDsJV35gWSYtgrme5d3tgnYOitq1KCo17jO/Y55GVUUDl4Nt+cdQ/NDCr5sdWMfkD11ct
 Se9vJNwDnKRUMhF+BFvft0oqDu9FpajY2R2OLAuU5mhZokh/hWNPlhqa3M2iqokg8Sbfvd
 QoxwJ3oZCMkCi8pzxW1+WPsSLtRNCpo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-GO6EgeNnPoeXtL7rzvHNaA-1; Mon, 18 Jul 2022 10:19:30 -0400
X-MC-Unique: GO6EgeNnPoeXtL7rzvHNaA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w13-20020a05640234cd00b0043a991fb3f3so7973428edc.3
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 07:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcdLCsFpqRGORG5Gklxq5tpO1A/StMsFhTS+ry5h+xo=;
 b=NmsDff+5Cgu7T1CH/37hmcpv7BC0ihObdZJ9vTqJayl50mtTtQfuokTNPhr7BKZFjK
 M8pRN8eIVs3ffX+BxxX6GLBkxpm9P6OMcUiaYK7VA9dU9e/fDBAK3nC6iSsi3HT91OoF
 3aDeGfPnU8gWLk5U8KhIFoC/4pXhE0ae3KCyq06krUaacrMF2SeZszQPgA00xC1tSAUs
 Ju6/LlwE5x4S7E4u4K76+LWEukY+QA7inltvQXHqa2P3XndU14WUYqYCpEq5I+RAw2O6
 EcHRp5cHCTNi0puwQuF4LP5UuUFnJ7ukUHSQt85NVrj9hUTcXoj5cccrUTJJBSyUfVEU
 N/Kg==
X-Gm-Message-State: AJIora9Ioqv4fecnka8SvUAe9CHG9fqmPex2JeSxEteI57lOXhjQlt6L
 U4WUXseDacMSpKN+YUEzwakrdqXoV2RNiL2SXZBEIZke3CgQgdugMjecQq8MtSSkidNRrvqER1d
 ymlx8s2sGL+QU
X-Received: by 2002:a05:6402:ca7:b0:43b:5cbd:291e with SMTP id
 cn7-20020a0564020ca700b0043b5cbd291emr10200324edb.4.1658153969831; 
 Mon, 18 Jul 2022 07:19:29 -0700 (PDT)
X-Received: by 2002:a05:6402:ca7:b0:43b:5cbd:291e with SMTP id
 cn7-20020a0564020ca700b0043b5cbd291emr10200294edb.4.1658153969676; 
 Mon, 18 Jul 2022 07:19:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709066d5500b0072a4bb6bce8sm5527551ejt.168.2022.07.18.07.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:19:29 -0700 (PDT)
Date: Mon, 18 Jul 2022 16:19:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Hesham Almatary <hesham.almatary@huawei.com>
Cc: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>,
 <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <wangyanan55@huawei.com>, <marcel.apfelbaum@gmail.com>,
 <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, <mst@redhat.com>
Subject: Re: [PATCH 7/8] tests: acpi: aarch64/virt: add a test for hmat
 nodes with no initiators
Message-ID: <20220718161928.08fe6a4e@redhat.com>
In-Reply-To: <20220711104436.8363-8-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-8-hesham.almatary@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bha5hLAhletw

On Mon, 11 Jul 2022 11:44:35 +0100
Hesham Almatary <hesham.almatary@huawei.com> wrote:

> This patch imitates the "tests: acpi: q35: add test for hmat nodes
> without initiators" commit to test numa nodes with different HMAT
> attributes, but on AArch64/virt.
> 
> Tested with:
> qemu-system-aarch64 -accel tcg \
>  -machine virt,hmat=on,gic-version=3  -cpu cortex-a57 \
>  -bios qemu-efi-aarch64/QEMU_EFI.fd \
>  -kernel Image -append "root=/dev/vda2 console=ttyAMA0" \
>  -drive if=virtio,file=aarch64.qcow2,format=qcow2,id=hd \
>  -device virtio-rng-pci \
>  -net user,hostfwd=tcp::10022-:22 -net nic \
>  -device intel-hda -device hda-duplex -nographic \
>  -smp 4 \
>  -m 3G \
>  -object memory-backend-ram,size=1G,id=ram0 \
>  -object memory-backend-ram,size=1G,id=ram1 \
>  -object memory-backend-ram,size=1G,id=ram2 \
>  -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
>  -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
>  -numa node,nodeid=2,memdev=ram2 \
>  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
>  -numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>  -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
>  -numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>  -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>  -numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
>  -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
>  -numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
>  -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
>  -numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
>  -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
>  -numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
> 
> Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
> ---
>  tests/qtest/bios-tables-test.c | 55 ++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index f02b386d75..ed843c2abf 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1461,6 +1461,59 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>      test_acpi_tcg_acpi_hmat(MACHINE_PC);
>  }
>  
> +static void test_acpi_virt_tcg_acpi_hmat(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    data.variant = ".acpihmatvirt";
> +
> +    test_acpi_one(" -machine hmat=on"
> +                  " -cpu cortex-a57"
> +                  " -smp 4"
> +                  " -m 256M"
> +                  " -object memory-backend-ram,size=64M,id=ram0"
> +                  " -object memory-backend-ram,size=64M,id=ram1"
> +                  " -object memory-backend-ram,size=128M,id=ram2"

> +                  " -numa node,nodeid=0,memdev=ram0,cpus=0-1"
> +                  " -numa node,nodeid=1,memdev=ram1,cpus=2-3"
don't use legacy syntax, see test_acpi_tcg_dimm_pxm() for example

> +                  " -numa node,nodeid=2,memdev=ram2"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-latency,latency=20"
> +                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=5242880"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-latency,latency=10"
> +                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=10485760"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-latency,latency=30"
> +                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
> +                  "data-type=access-bandwidth,bandwidth=1048576",
> +                  &data);
> +
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
>  {
>      test_data data;
> @@ -1875,6 +1928,8 @@ int main(int argc, char *argv[])
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg) {
>              qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt/acpihmatvirt",
> +                            test_acpi_virt_tcg_acpi_hmat);
>              qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>              qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);

