Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4829516lfb;
        Tue, 27 Apr 2021 07:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu9df7qUDKNRM9OczFpX0R3VjqrHpdM5049t1n65G8kog9ZZ9rB4Aiz1KmjMoZB6KwWTtJ
X-Received: by 2002:a02:708e:: with SMTP id f136mr21760365jac.50.1619533160039;
        Tue, 27 Apr 2021 07:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619533160; cv=none;
        d=google.com; s=arc-20160816;
        b=QG66IOXrEdCIlGjZHii15WjlhIQ2bbgkfqDfKdjNDxFmr8u59KlAXE6KwfmCNFDyJJ
         uvgXMiCptW3eB1HI47cFdLRXkhuZvDkI8Tn57hkBQO/f1er51GbiA6OfdxDGysHDNUHq
         Q3lxx1aen9/EGBKeovRqS9uQK1uNZqLfliRuhEJtr/XTLbRQuVMK55FMj7ZiXxsfsY9R
         ZTYOKGZLfejhmeIB8z74/agaxXLdI48ZhtZWFewYUSkodFlSU95kF+ByX3xCPCD3Smbq
         a5IxlOLqkp7gtce06hnMrufnT33QN6ycbXJXs17StJr3KvKKIl818wnbKnu1TyTBYvO9
         58mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=vmklFrTme3j0cpI76YQOwmiCsVzozfL1t3CKehJnu5w=;
        b=M7Yle95maU18ICNuG8WhJkmNPbtE0BxjtnFNSqSZBYHeLJ/SYHkYgUhwuFnyvccYLH
         wC9a387KbeC4ey6TaRuzLgbOwAuqlMB1oG/ZTZL2DU/10621nmekgRv+obQXkroO1RbR
         6O4jMpTw8qpfjKz8qQraazAyCBpKoo1ZU4x/PvVsa0sw5+BGLJqGwxYkgD9Kxn719UyJ
         /iv3ea1Y+QghfOnGch5OPeFtgaRQKVBNPJ3tiFMv7VB4GoUWx7M9TNaRizwGG0R8EuOd
         gyKiWVg2zBnU/QqaifOE2qNH/1jw6IRIpXDr8nssP+6ld3vcnr7jNTGPqLKg2x2M+A8+
         CjYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RJ6rYCwl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si3423882ilc.120.2021.04.27.07.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 07:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RJ6rYCwl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbOYZ-0002Eq-B4
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 10:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbOWL-0000iL-DU
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 10:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbOWC-0004rg-Vl
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 10:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619533011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmklFrTme3j0cpI76YQOwmiCsVzozfL1t3CKehJnu5w=;
 b=RJ6rYCwlmA01DB/32ONgxQplhzWKTUYqaVw+akNt4cLaDYtvEmoNNvWroTzadm0D6g+JuZ
 Uhm7dolRuYKnXd5JfcMW3dmjTwORX03i+JoKrO5uFYrh6KujMajWjl0+qbF19NoPae9jfy
 R++EvYYXcBB/0t/cMUBQN7qFCU3Sk1Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-NKmvtW3DMsWHkZNG2Jj0HA-1; Tue, 27 Apr 2021 10:16:48 -0400
X-MC-Unique: NKmvtW3DMsWHkZNG2Jj0HA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w15-20020a056402268fb02903828f878ec5so24989845edd.5
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 07:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vmklFrTme3j0cpI76YQOwmiCsVzozfL1t3CKehJnu5w=;
 b=kGjxCtyfheMxk7oJHHrgE/ek6wR97/sgmYr0laFGmWSfaTU7hYmenSWtYle57OqVFh
 OnShuXYOwWerDvG8qxvhhxKjF4DdrSlFr0Gnm+dz/C1Y/+xiSX5iXTh8Up6s87QeSaj3
 /6FHm1P0l+OHYhtGQxEO+2D6nY3Ld/n29gIAAM3vgR9jXqZPC8QcIA10bYubY8ULsE6I
 H4fn0JIaTM8VJGsgefXwxn1QbF3s4HtyXgbw33B4nKUDxSQVBPYFNROZUZ/ms3XdsL+S
 ZW0m4pbrxzMNqBri2JlkF17DzRdw3AUZ/m1YgLqIZeYg/fFUjb0nxKgrLRSCIC69MP11
 4txw==
X-Gm-Message-State: AOAM530Cy2bgdAC03uL7X3xzNGwij80/MyfZYZwh6RoMAZAR3iAWfepj
 LDTVfedCkg3QDsG2AR2khDKH6gIRZ60SL/tHkjP4oa9tzQG492yiBNlMviP48Fe0DqGBR/D48Og
 fjKQNydXn8nKP
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr23262591ejo.314.1619533007402; 
 Tue, 27 Apr 2021 07:16:47 -0700 (PDT)
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr23262569ejo.314.1619533007182; 
 Tue, 27 Apr 2021 07:16:47 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id me3sm40082ejb.49.2021.04.27.07.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:16:46 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:16:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210427141644.n6vw5fprgjhrymfw@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aOGpoZ3jvVNR

On Tue, Apr 13, 2021 at 04:07:44PM +0800, Yanan Wang wrote:
> Add the Processor Properties Topology Table (PPTT) to present
> CPU topology information to ACPI guests. Note, while a DT boot
> Linux guest with a non-flat CPU topology will see socket and
> core IDs being sequential integers starting from zero, e.g.
> with -smp 4,sockets=2,cores=2,threads=1
> 
> a DT boot produces
> 
>  cpu:  0 package_id:  0 core_id:  0
>  cpu:  1 package_id:  0 core_id:  1
>  cpu:  2 package_id:  1 core_id:  0
>  cpu:  3 package_id:  1 core_id:  1
> 
> an ACPI boot produces
> 
>  cpu:  0 package_id: 36 core_id:  0
>  cpu:  1 package_id: 36 core_id:  1
>  cpu:  2 package_id: 96 core_id:  2
>  cpu:  3 package_id: 96 core_id:  3
> 
> This is due to several reasons:
> 
>  1) DT cpu nodes do not have an equivalent field to what the PPTT
>     ACPI Processor ID must be, i.e. something equal to the MADT CPU
>     UID or equal to the UID of an ACPI processor container. In both
>     ACPI cases those are platform dependant IDs assigned by the
>     vendor.
> 
>  2) While QEMU is the vendor for a guest, if the topology specifies
>     SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>     core-id the same value as a package-id, thus it is not possible
>     to have package-id=0 and core-id=0. This is because package and
>     core containers must be in the same ACPI namespace and therefore
>     must have unique UIDs.
> 
>  3) ACPI processor containers are not required for PPTT tables to
>     be used and, due to the limitations of which IDs are selected
>     described above in (2), they are not helpful for QEMU, so we
>     don't build them with this patch. In the absence of them, Linux
>     assigns its own unique IDs. The maintainers have chosen not to use
>     counters from zero, but rather ACPI table offsets, which explains
>     why the numbers are so much larger than with DT.
> 
>  4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>     match the logical CPU IDs, because these IDs must be equal to the
>     MADT CPU UID (as no processor containers are present), and QEMU
>     uses the logical CPU ID for these MADT IDs.
> 
> Tested-by: Jiajie Li <lijiajie11@huawei.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 2ad5dad1bf..03fd812d5a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>  
> +/* PPTT */

Please point out the ACPI spec section "5.2.29 Processor Properties
Topology Table"

> +static void
> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)

QEMU doesn't do this style, please write as

static void build_pptt(GArray *table_data, BIOSLinker *linker,
                       VirtMachineState *vms)

> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0, cpus = 0, socket = 0;
> +    MachineState *ms = MACHINE(vms);
> +    unsigned int smp_cores = ms->smp.cores;
> +    unsigned int smp_threads = ms->smp.threads;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {

Why not iterate from zero to ms->smp.sockets? With this type of loop if
the number of sockets doesn't correctly fit the number of possible cpus,
then you'll magically create new sockets that the user didn't want. That
case shouldn't be able to happen, though, because the smp parsing should
catch it. In any case, iterating sockets between zero it's number would
make more sense.

> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_processor_hierarchy_node(
> +            table_data, 1, /* Physical package */

If we want to pass the flags with in-argument-list comments, then please
make sure the flags are on separate lines. See below.

> +            0, socket, /* No parent */
> +            NULL, 0);  /* No private resources */

We don't need the 'No parent' and 'No private resources' comments.

        build_processor_hierarchy_node(table_data,
            (1 << 0), /* ACPI 6.2: Physical package */
            0, socket, NULL, 0);

> +
> +        for (core = 0; core < smp_cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (smp_threads <= 1) {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI Processor ID valid */
> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                    socket_offset, uid++, /* Parent is a Socket */
> +                    NULL, 0);  /* No private resources */

Now I see why you were calling out 6.3 in the previous patch. I suggest
still keeping the function of the previous patch referencing 6.2, but
also keep referencing 6.3 here, like you already do

                build_processor_hierarchy_node(table_data,
                    (1 << 1) | /* ACPI Processor ID valid */
                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
                    socket_offset, uid++, NULL, 0);

> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data, 0,
> +                    socket_offset, core, /* Parent is a Socket */
> +                    NULL, 0); /* No private resources */

No need for these in-argument-comments that don't match up with the spec.

> +
> +                for (thread = 0; thread < smp_threads; thread++) {
> +                    build_processor_hierarchy_node(
> +                        table_data,
> +                        (1 << 1) | /* ACPI Processor ID valid */
> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */

This looks good.

> +                        core_offset, uid++, /* Parent is a Core */
> +                        NULL, 0);  /* No private resources */

Don't need these comments.

> +                }
> +            }
> +        }
> +        cpus += smp_cores * smp_threads;

As stated above, we don't want this.

> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + pptt_start), "PPTT",
> +                 table_data->len - pptt_start, 2,
> +                 vms->oem_id, vms->oem_table_id);
> +}
> +
>  /* GTDT */
>  static void
>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, vms);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> -- 
> 2.19.1
>

Besides some changes that I think should be changed back and the 6.3
flags, this patch looks very similar to [1], so I'd prefer my
authorship be maintained. However, if my authorship is dropped, then
my s-o-b should be replaced with a Co-developed-by.

[1] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11 

Thanks,
drew

