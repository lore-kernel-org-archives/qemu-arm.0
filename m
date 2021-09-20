Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1873437lfp;
        Mon, 20 Sep 2021 01:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRJndLyrPc+Jnuc3G3Kjx1tRcCZMqTWjvd4lViDoba2/ovZy0Em238msZ5Ru9t76PEwzA1
X-Received: by 2002:a6b:6918:: with SMTP id e24mr17592014ioc.71.1632127194943;
        Mon, 20 Sep 2021 01:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632127194; cv=none;
        d=google.com; s=arc-20160816;
        b=YFkFzWPfsV0cHVRK6/Iw4r1m2cJoMy4Ttdfz+zCx1oA0vGgm1QLPUnVUkLIhy8RfPd
         7eKjcl187/udBwVLa/5SqnQakQept5CXA34F7ieQtyXoEcadMxnu0WHJTUHjnbhYNG6O
         2hvgRAyGDJM+NK7W3YpISZ5RH+WC+W048T9aJ0ArBC5zONd1rE57TdOt+lLEahsKmY1C
         5hS8f2pcIQD/b+48grsFK4PBFNS9cNsgaAXVSnG34sr7Zm8C8QodsAkZwQJ+p9DUuI+J
         JGAL9k3F6wqEliKC0CfncOmK/4/9PfuFzyzbsdDohMqoc3qkX3XjsPXdtRfpGqG+uhdj
         7WPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=LLW8feb35vQkeFSkgOZH7oZVlvYkZWbF7TR5s1LFyI4=;
        b=tYE4Wk8HrLiwcsoBDcFehYZio22+PN7qZw2rA+LZx9RrWHga/lOiLbtpmt9XqoMJM8
         BX67kA2LXLpEhSDW+LErj1R/KnCpmVvToOPaCbGjZN7jPz3xIeUhB6HidbveHcfATB3z
         qMnzW6Oc6Mn5+uiVt4Cy/X3LkxT/VCY4tL/bqCoX2fBitB5Y09PuB3afTUbvrcVCTnhS
         ZromjhR6EBV29cJ0pY7GnYY9N9AHfpgCVDQHnnhv32Dgk2VT1f1rn+N924URUpGho/43
         bKzgOp0N3NASU/hD3cZ2IXfZhfrRe9Mq+fQLtcJh9V4l0YlqS3FtjO+NVRaRPxjXPx/0
         nLhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VuesLYhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si11761875ilv.155.2021.09.20.01.39.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VuesLYhk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEqA-0002Rw-8h
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEq0-0002Op-7v
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSEpy-0003cz-Cg
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632127181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLW8feb35vQkeFSkgOZH7oZVlvYkZWbF7TR5s1LFyI4=;
 b=VuesLYhkavpTHzYf0uGYYd/c/tv4SA+nCYgk7H5NJRm/OYuKdywqqPdmCwI+c0LR5a7id9
 HAWFa86ShS7ZwBHILb8GUe/oWgc49ZLhx7tdYQxpfT6M8sF4Xn+M/hjkvhI2mB1DQUF2rY
 M2jeIsxhv1cIa13mcHFKASnhGMfKU9s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-f8OLExK8N0KsKghaNfG8Xw-1; Mon, 20 Sep 2021 04:39:39 -0400
X-MC-Unique: f8OLExK8N0KsKghaNfG8Xw-1
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so14042391edn.5
 for <qemu-arm@nongnu.org>; Mon, 20 Sep 2021 01:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLW8feb35vQkeFSkgOZH7oZVlvYkZWbF7TR5s1LFyI4=;
 b=xc8qwKUc+T+fR8StHX9Y1HugI4Qru2vuQ+VC1L8HXZ88bXefbu6kqgtf8WynVd9FeG
 eb5yMsVrHPIz6hhOly95nZCFD0pAInm+UoiAXk2EgXBQ51Cb83mUYvSqbbcLMzEfP9TR
 PbmtUZ3MNdqm9U5WvyuiZUkyWxyiK2ojHFRQNnK991S7S+HMxXngvZD+XTQ7TSDMZR+z
 FgFwbBdS7kRypzX0o1eE4vTWz+eGBsKhy/Ad4/lZKW7J2MhOUENrGc/dlVDGta8iIB12
 +XCBMt8TTla0fDah1Bd5O3/jinyzTdv7lxkL90fWwLHQrjor5ZkFBBBf8RZB0Krpjk4C
 STSw==
X-Gm-Message-State: AOAM530gjw0Le4hKNqgXRscuZ1Aj9lhLvoO5xY54eerBg9b4NXWuLmTp
 UNbIOPGQECJLOBxtVk9gdqdU3bow0rNTAaL53JH1EcUnHRlEf6q1KViUhkMQ49oVLdLpNPUFA9N
 uQN+CBsA5UdHJ
X-Received: by 2002:a17:906:27c9:: with SMTP id
 k9mr27852137ejc.124.1632127178377; 
 Mon, 20 Sep 2021 01:39:38 -0700 (PDT)
X-Received: by 2002:a17:906:27c9:: with SMTP id
 k9mr27852117ejc.124.1632127178188; 
 Mon, 20 Sep 2021 01:39:38 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v25sm5791969eja.83.2021.09.20.01.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 01:39:37 -0700 (PDT)
Date: Mon, 20 Sep 2021 10:39:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 07/10] tests/acpi: add test cases for VIOT
Message-ID: <20210920103936.2cc94969@redhat.com>
In-Reply-To: <20210914142004.2433568-8-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-8-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c7pdJk1XmUhT

On Tue, 14 Sep 2021 15:20:02 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Add two test cases for VIOT, one on the q35 machine and the other on
> virt. To test complex topologies the q35 test has two PCIe buses that
> bypass the IOMMU (and are therefore not described by VIOT), and two
> buses that are translated by virtio-iommu.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4f11d03055..f8bfe2f247 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1403,6 +1403,43 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_q35_viot(void)
> +{
> +    test_data data = {
> +        .machine = MACHINE_Q35,
> +        .variant = ".viot",

> +        .blkdev = "virtio-blk,bus=pcie.0",
why is this necessary?

> +    };
> +
> +    /*
> +     * To keep things interesting, two buses bypass the IOMMU.
> +     * VIOT should only describes the other two buses.
> +     */
> +    test_acpi_one("-machine default_bus_bypass_iommu=on "
> +                  "-device virtio-iommu "
> +                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
> +                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
> +                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
> +static void test_acpi_virt_viot(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-device virtio-iommu", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_oem_fields(test_data *data)
>  {
>      int i;
> @@ -1567,12 +1604,14 @@ int main(int argc, char *argv[])
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>          }
> +        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>          qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>          qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
>          qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
> +        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);

