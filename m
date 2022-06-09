Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp552770lfb;
        Thu, 9 Jun 2022 09:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+jFl3srm/TwURx00h0TAjbw/zKJixbqWB0Gs8yRbqEL1YIbLrOl7dBEAxYjt/K2D4slXz
X-Received: by 2002:a05:620a:4052:b0:6a7:36a1:e0d6 with SMTP id i18-20020a05620a405200b006a736a1e0d6mr1769252qko.545.1654791895239;
        Thu, 09 Jun 2022 09:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654791895; cv=none;
        d=google.com; s=arc-20160816;
        b=XYB00Z/cWAhjs1NAg3Cb+bWdKT2iLjIynrZnprD3SkvqAIkJFEIwT8NMRXNqmuVUl7
         7vS9q8/OUYtvoBam+Vx5iS3yhlhmqLAJ0HrM+FJenM16rmg4bwq9jb/eIyLAz90FTO0h
         xyqkSFGB/kq79hS3AqQ//Hwa5O+6H5K0OXENNb3wKslbrq96yQGJmKmrBsFLE1jCE84t
         Yxype8NxZMGlxX/8k+VJvKAX32uSAyHQLYVhbsCHkjPrdVCnikrXdQdFOzPmttNPztme
         Z4IzoP/gwkI/4r04K0Bootsn86yyM+TWKhhEAWuzIF3JYTF1AdsGGlbBwdsWUMK7/gQ5
         BBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=BfplgozcpFLea70qKN3g2QAWhjYSU1w+6pbj60I+9xk=;
        b=xXrpRkQzEmAmO2sh3BverLVVcwxNASLq25/9AYRpeNaG+S2eutvZ00EzhYEkvFiFRB
         TXq89+q9HR5d5ElkPHfyNUAq5lqoWAI5K1LZ2ETGd1+0/7davHZAzE3NpVOTFgaw1vTi
         rfXmYuRHFqsY3e59JxX8Y4HPT5l9ixYM/SK1u15DUlC6ewnWBsz+rq/8Ha3Jmr60ciMY
         U8SAFI096UJYWLgDBxyGt2HQlWOg3b45sL/YNHjXLXmrqtZWuXqURrLkPxYPTVM4IqMe
         lQIrOGC+sXG/xNxmU2Y/2ZEUeOYhsw0a07hzVqDkjdZSREvKe7g/pJcmPTt/eEpygvxR
         kdPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cC+d7GY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05620a16c600b006a6af5fd98csi7262901qkn.439.2022.06.09.09.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cC+d7GY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKxq-0007XQ-Ir
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nzKaB-0006Ol-6T
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nzKa8-0007Ca-Ft
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654790423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfplgozcpFLea70qKN3g2QAWhjYSU1w+6pbj60I+9xk=;
 b=cC+d7GY+BXdgl0lA+4tx2qpEj0QU2doq/I+sA+GeCdUxb4eqUnroOB33bmXmmDERX/3NU4
 LHsdBBUxGLg4jyCnIay5y61Ik5sut4YvuvEMLXnjps2HGaswTFQ+321KHOK//hDjYNtGM0
 GzDkZ374ftld8qBwy845Un7WIZl+MHA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-3LjuUqU3OzeQyu3S-PT0EA-1; Thu, 09 Jun 2022 12:00:22 -0400
X-MC-Unique: 3LjuUqU3OzeQyu3S-PT0EA-1
Received: by mail-wr1-f70.google.com with SMTP id
 y2-20020adff142000000b0021581245fa1so4581795wro.7
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BfplgozcpFLea70qKN3g2QAWhjYSU1w+6pbj60I+9xk=;
 b=V3XTMYzMInE5BaswBbJT14fFLKp3+7iDMNQGzBfU3+ZmhDl9Q/Dv5h3RrEh96J1hvP
 k4psGbPWN78scDzyBWcYYvm8lijMtAyZoF7vlJqZIJPbWJjs8Q+DnvfbqI0TBntlUyc6
 eVbSDjfzC9ez95Rwo0DerlUu9K7J88A6NtnwdFqU3L/CwzeIBB0JUzVs++iyNZLsOfX5
 1/dKo1ERRVgXyL5i2hEnw53m3eEix/EVknRN8JRWGaelzA/wVy1iCh9AG9B2d28KagNU
 PWLKkscLsdUh7ha0kAS0pt38vu+mXiMZ/CaW16qCC4owxK78g/61dVjDr5I8s81MH4VD
 i3NQ==
X-Gm-Message-State: AOAM532PNNFhuNIYMxheXmBTo607edqTN3wVBR6RdSSByQE1w3odHS8Y
 yz55SM2OL8xSwyV0zgZW1PpXWn4pPUFsTplXiY9nNhthiMYT1vvSOfLm5REYbCleuiB/3MKBd/y
 bTk8Ly9i0FiIJ
X-Received: by 2002:a5d:64a9:0:b0:210:3d60:f2b4 with SMTP id
 m9-20020a5d64a9000000b002103d60f2b4mr39126435wrp.432.1654790421066; 
 Thu, 09 Jun 2022 09:00:21 -0700 (PDT)
X-Received: by 2002:a5d:64a9:0:b0:210:3d60:f2b4 with SMTP id
 m9-20020a5d64a9000000b002103d60f2b4mr39126409wrp.432.1654790420779; 
 Thu, 09 Jun 2022 09:00:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003973a3fe4fasm27372503wmb.42.2022.06.09.09.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:00:20 -0700 (PDT)
Date: Thu, 9 Jun 2022 18:00:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, drjones@redhat.com, wangyanan55@huawei.com,
 Jonathan.Cameron@Huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 thuth@redhat.com, eduardo@habkost.net, lvivier@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 2/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220609180018.7b12a527@redhat.com>
In-Reply-To: <b2e11fe3-6590-ec7c-a437-7b4c2b66d359@redhat.com>
References: <20220518092141.1050852-1-gshan@redhat.com>
 <20220518092141.1050852-3-gshan@redhat.com>
 <20220526142512.32129b2e@redhat.com>
 <b2e11fe3-6590-ec7c-a437-7b4c2b66d359@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
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
X-TUID: zoJR7xtXOnMY

On Thu, 26 May 2022 22:40:05 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 5/26/22 8:25 PM, Igor Mammedov wrote:
> > On Wed, 18 May 2022 17:21:40 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> The {socket, cluster, core} IDs detected from Linux guest aren't
> >> matching with what have been provided in PPTT. The flag used for
> >> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> >> nodes.  
> > 
> > To permit this flag set  on no leaf nodes we have to have
> > a corresponding containers built for them in DSDT so that
> > 'ACPI Processor ID' could be matched with containers '_UID's.
> > If we don not build such containers then setting this flag is
> > not correct. And I don't recall QEMU building CPU hierarchy
> > in DSDT.
> >   
> 
> It's true that we don't have containers in DSDT. In Linux implementation,
> the corresponding IDs are fetched if 'ACPI Processor ID valid' is set in
> PPTT node (entry), without checking DSDT table.

linux can makeup container IDs and it is fine as long as it
does that consistently

> I don't know how the PPTT entry is linked to DSDT for _UID, after rechecking
> ACPI specification. I was thinking 'Private Resources' fields are used for
> the linking, but I should be wrong after checking PPTT tables on my host.
> I'm not sure if you have idea how PPTT entry (node) is linked with one
> specific device in DSDT table?

from spec description of 'ACPI Processor ID valid' flag:
"
For non-leaf entries in the processor topology, the ACPI Pro-
cessor ID entry can relate to a Processor container in the
namespace. The processor container will have a matching ID
value returned through the _UID method. As not every pro-
cessor hierarchy node structure in PPTT may have a matching
processor container, this flag indicates whether the ACPI pro-
cessor ID points to valid entry.
"

i.e. nothing to do with private resources
on can set this flag for a container only if there is
a container device in DSDT with _UID matching 'ACPI Processor ID'
in PPTT entry. Other possibility for setting this flag
is that processor is described in MADT (which is unlikely for
for a container)

> On my host, one of the cluster node resides at offset 10B0h and it's ID
> has been marked as valid. The 'Private Resources' fields point to the
> type-1 cache structures, which resides in PPTT table either. The cluster
> ID ('0x109') isn't appearing in DSDT table.

looks like they are cheating or spec is wrong

PS:
one of the reasons we added PPTT table is to avoid building
CPU topology hierarchy in DSDT.

> 
> [C9Ch 3228   1]                Subtable Type : 01 [Cache Type]
> [C9Dh 3229   1]                       Length : 18
> [C9Eh 3230   2]                     Reserved : 0000
> [CA0h 3232   4]        Flags (decoded below) : 0000005F
>                                    Size valid : 1
>                          Number of Sets valid : 1
>                           Associativity valid : 1
>                         Allocation Type valid : 1
>                              Cache Type valid : 1
>                            Write Policy valid : 0
>                               Line Size valid : 1
>                                Cache ID valid : 0
>                                 :
>                                 :
> [CB4h 3252   1]                Subtable Type : 01 [Cache Type]
> [CB5h 3253   1]                       Length : 18
> [CB6h 3254   2]                     Reserved : 0000
> [CB8h 3256   4]        Flags (decoded below) : 0000007F
>                                    Size valid : 1
>                          Number of Sets valid : 1
>                           Associativity valid : 1
>                         Allocation Type valid : 1
>                              Cache Type valid : 1
>                            Write Policy valid : 1
>                               Line Size valid : 1
>                                Cache ID valid : 0
> [CBCh 3260   4]          Next Level of Cache : 00000CCC
>                                   :
>                                   :
> [10B0h 4272   1]                Subtable Type : 00 [Processor Hierarchy Node]
> [10B1h 4273   1]                       Length : 1C
> [10B2h 4274   2]                     Reserved : 0000
> [10B4h 4276   4]        Flags (decoded below) : 00000002
>                              Physical package : 0
>                       ACPI Processor ID valid : 1
>                         Processor is a thread : 0
>                                Node is a leaf : 0
>                      Identical Implementation : 0
> [10B8h 4280   4]                       Parent : 00000C6C
> [10BCh 4284   4]            ACPI Processor ID : 00000109
> [10C0h 4288   4]      Private Resource Number : 00000002
> [10C4h 4292   4]             Private Resource : 00000C9C
> [10C8h 4296   4]             Private Resource : 00000CB4
> 
> [gwshan@gshan tmp]$ grep -i 109 dsdt.dsl
> [gwshan@gshan tmp]$ grep -i 265 dsdt.dsl
> 
> 
> >> In this case, Linux guest takes the offset between the
> >> node and PPTT header as the corresponding IDs, as the following
> >> logs show.  
> > 
> > perhaps it's kernel which should be fixed to handle
> > not set 'ACPI Processor ID valid' correctly.
> >   
> 
> This case is already handled by kernel. If 'ACPI Processor ID valid'
> flag is missed, the offset between PPTT node and header is taken as
> the ID. It's correct behaviour because 'ACPI Processor ID valid' flag
> isn't mandatory for PPTT nodes. The problem is that the offset isn't
> the desired ID, which is not understandable and mismatch with the
> ID (value) we feed to PPTT table in QEMU.

as long as linux can match resources different IDs are fine.
So if it's not a bug, I'd leave it alone.

> >>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
> >>    -accel kvm -machine virt,gic-version=host -cpu host        \
> >>    -smp 8,sockets=2,clusters=2,cores=2,threads=1
> >>      :
> >>
> >>    # cd /sys/devices/system/cpu
> >>    # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
> >>      36  36  36  36  36  36  36  36
> >>      336 336 336 336 336 336 336 336
> >>    # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
> >>      56  56  56  56  196 196 196 196
> >>      356 356 356 356 496 496 496 496
> >>    # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
> >>      76  76  136 136 216 216 276 276
> >>      376 376 436 436 516 516 576 576
> >>
> >> This fixes the issue by setting 'ACPI Processor ID valid' flag for
> >> {socket, cluster, core} nodes. With this applied, the IDs are exactly
> >> what have been provided in PPTT.
> >>
> >>    # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
> >>    0 0 0 0 0 0 0 0
> >>    1 1 1 1 1 1 1 1
> >>    # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
> >>    0 0 0 0 1 1 1 1
> >>    0 0 0 0 1 1 1 1
> >>    # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
> >>    0 0 1 1 0 0 1 1
> >>    0 0 1 1 0 0 1 1

if you look at above, linux generated unique IDs for each node
while with your patch IDs are not unique for cluster/core groups
(i.e. you have only 2 clusters while in fact there are 4 total)

Should ID's in cpu$i/topology be unique or not, I don't really know.
Try to see how linux uses those values and if they are supposed
to be unique.

If you set flag to valid and provide DSDT containers
then you will be forced to generate _unique_ (within
the same _HID namespace) _UIDs to conform to the spec.


> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/acpi/aml-build.c | 9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> index e6bfac95c7..89f191fd3b 100644
> >> --- a/hw/acpi/aml-build.c
> >> +++ b/hw/acpi/aml-build.c
> >> @@ -2026,7 +2026,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>               core_id = -1;
> >>               socket_offset = table_data->len - pptt_start;
> >>               build_processor_hierarchy_node(table_data,
> >> -                (1 << 0), /* Physical package */
> >> +                (1 << 0) | /* Physical package */
> >> +                (1 << 1),  /* ACPI Processor ID valid */
> >>                   0, socket_id, NULL, 0);
> >>           }
> >>   
> >> @@ -2037,7 +2038,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>                   core_id = -1;
> >>                   cluster_offset = table_data->len - pptt_start;
> >>                   build_processor_hierarchy_node(table_data,
> >> -                    (0 << 0), /* Not a physical package */
> >> +                    (0 << 0) | /* Not a physical package */
> >> +                    (1 << 1),  /* ACPI Processor ID valid */
> >>                       socket_offset, cluster_id, NULL, 0);
> >>               }
> >>           } else {
> >> @@ -2055,7 +2057,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>                   core_id = cpus->cpus[n].props.core_id;
> >>                   core_offset = table_data->len - pptt_start;
> >>                   build_processor_hierarchy_node(table_data,
> >> -                    (0 << 0), /* Not a physical package */
> >> +                    (0 << 0) | /* Not a physical package */
> >> +                    (1 << 1),  /* ACPI Processor ID valid */
> >>                       cluster_offset, core_id, NULL, 0);
> >>               }
> >>     
> >   
> 
> Thanks,
> Gavin
> 

