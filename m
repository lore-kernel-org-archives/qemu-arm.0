Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6531596njd;
        Mon, 7 Apr 2025 10:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPyzS3/CJU0t7aTqp4L7CuJcWpWh2AnEBCydekOBhfFEOlYWbMjIy353JSvfHsDeerkI53RvURJZhkdw==@linaro.org
X-Google-Smtp-Source: AGHT+IEmZDBMrQEIUph+7rVDswLqc3iRgGDy3SShM265MbQXS5d7XusNWq9tNy7VPLHeEihXFGUe
X-Received: by 2002:a05:6000:1844:b0:39b:f12c:385e with SMTP id ffacd0b85a97d-39d0de17bcfmr11624173f8f.20.1744046693900;
        Mon, 07 Apr 2025 10:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744046693; cv=none;
        d=google.com; s=arc-20240605;
        b=INFM46/Yj23PXvgpuAGxKaGqeOH9NqcjA9eYjsJyG5H6HTSKvU98ezVggwZuEmQUal
         8AM3ffgIMbDdcMglfLrgnVAlUuL81+wcC2ZhXAyKiv9+UtUiva5VFTOMXain5HsOEqz5
         +4e8LDzyKSXnP2EoVxTNYIOkHkyluUuhCC6SCibHhBCT6r3LNdhziwpqH6wVDTrGta7B
         9s/W/j7morEG3va9xgMnunaWXogXOtax1D/ogHYcmw+U8AoebXAe04wC3zpgAu1pJ5ey
         t3ylxLOc2knl87rV8bUX+/wfLVsNMpNV+K63m0O/j2XnuRPTYkdO5f3wMqrZVRrwUud0
         Wavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hpt+5E4PJftiC5mEAoUqrbVomglX561zjCw5YqHHtAM=;
        fh=N0K6G3GCMO8lSDqDKVITEotpZXhSall7UlyrfY8GEpU=;
        b=UzoFIikk4f0Kfv1632a/SRK6NndlFia4DtsPML+hPZS+w2HsW4+FgSX0C+nRHuwOKJ
         7LlMP388ebRREDHJ9ylWk8eL5UQo5vQ8XOwKpxyUNxDZmU0tHVboZ+onN+Zy4EM3+o/N
         iQRumJuZRYP9oK78P+Jfvj8qz8mkKYGGW/wKN8QXwV7ue8Y3xjKvPAhuw2PbC5fFsfcJ
         KiPcnfMCbQzwxk6ZI+D5jS177ESIz+lXJH79LcwjHSILa8v0di2XypVvXrtmjdNX+NvA
         Qv0SE54YdoMfH2rcctCd1bn1ItoIQkwpI1JLh5YEHfZIHg55g+J5j+7vvg2g0fvTxbYr
         kT6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GaMYChhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-39c30249519si6938444f8f.636.2025.04.07.10.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Apr 2025 10:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GaMYChhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u1qD9-0002Zg-9s; Mon, 07 Apr 2025 13:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u1qCy-0002WR-Bd
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 13:24:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u1qCv-0004NL-NM
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 13:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744046664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hpt+5E4PJftiC5mEAoUqrbVomglX561zjCw5YqHHtAM=;
 b=GaMYChhmR+AFwsGuP/xDaHOJAL87896WRegntQagxJ/DyK7hbuAXJjVQVaPYYAHhqpQEh1
 33wdUBQVMPtOD5JKNWqbIhA/U+3am/8v+BuBRw2WeYV3VuAAaye7SSvrkc+OtH5sZBCqkJ
 0oi84msURNraSoA9PC7hgsXuwBxZ+Zk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-GUlS8OLTNCKGYQrknU8tNg-1; Mon, 07 Apr 2025 13:24:20 -0400
X-MC-Unique: GUlS8OLTNCKGYQrknU8tNg-1
X-Mimecast-MFC-AGG-ID: GUlS8OLTNCKGYQrknU8tNg_1744046659
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d51bd9b41so40708045e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Apr 2025 10:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744046659; x=1744651459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hpt+5E4PJftiC5mEAoUqrbVomglX561zjCw5YqHHtAM=;
 b=EnEpE0IgQmg6DaMhh0RRR2OKkNCoqambnerUa7cIKeWVdIBUM+yU8Ti6fjpIBog/Pa
 z8o/uahxvTcKgyuHWf2y6EPcCBKrbP9c4fm9SIwMibTkyv0P5V8llvbtkpLcawlVjdGN
 gHMSIyGcU380A7+VoL9M9jN3r3iVGpZi0nJ/7fCx1tExXps46cLmntt7MhkejkXUq1tE
 d62WhzmIDOTgG0zSYY3RgGzA+khRrpXvktTnEtdh8UpPB7kPGNZNj2/stQBTROECw9tK
 gjJxgRGXEIhp0bVycsfJJzWdHBVjZJ97ShOU24qUkB1gQzfq2hGqIFyUurPKas0F84nN
 wpZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVboBhMuAa/Ka8uJ52rwpQI2qvNH9NkmtroYx55Z76RiHbOEkxnFme+ukohAgntZsyirgrtxShwtQ==@nongnu.org
X-Gm-Message-State: AOJu0Yytj0xlYSo+Jr3nl1V8Dv9cWdHAgfDN7vUzcRX9nhxpI2IysFIM
 Yfwede3pQUEMhKy23XF6KQsj1hwD//MtcR0L8dJgDaHujXglhc+/zkUCRfsAuC274vox9tR4ySO
 DUUdxuJU0ZUsL23s3LHEGRlnR/BZ2TgFvSmhyHIHISndeKGyIGw==
X-Gm-Gg: ASbGncsWUxa5oemhS7bcvEbDR4x+omazHzBF5sza+MzgyMqAXcbr2s8d6LMjIMnr1ar
 uol+xldyaEzGytipNrOaVWXeuceCBJvxpYjrWQmHPtMW6S1+RfjYR7MkDEi+YLtUb/ATmTiJAQP
 aHJ5yW8kerlboiWgs1I5TfCDGeT6Z0FrqwBBnAUI+qMDsr/4S7Q8dsi65PPs+M3FrGBAQxMKZdi
 lBXBFRG8oMzIngSZV9MmN3rXZFGfy1nW01GzWq7rtL7iSuElzZcXqLnn4JmY66CWzdMbytHcjdE
 /BAyBPdvsGZMaXX0gqUI8IYMd+OO5z0Lr0dUTxLEvKHF8BdzX96xnDDgJctWDfE=
X-Received: by 2002:a05:600c:1e8f:b0:43c:f63c:babb with SMTP id
 5b1f17b1804b1-43ed0b837c4mr114459815e9.1.1744046659424; 
 Mon, 07 Apr 2025 10:24:19 -0700 (PDT)
X-Received: by 2002:a05:600c:1e8f:b0:43c:f63c:babb with SMTP id
 5b1f17b1804b1-43ed0b837c4mr114459485e9.1.1744046659009; 
 Mon, 07 Apr 2025 10:24:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a727bsm12582362f8f.27.2025.04.07.10.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 10:24:18 -0700 (PDT)
Message-ID: <7cad3f1f-1977-4d98-900c-080aa5ad32d5@redhat.com>
Date: Mon, 7 Apr 2025 19:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] Specifying cache topology on ARM
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: mst@redhat.com, zhao1.liu@intel.com, dapeng1.mi@linux.intel.com,
 armbru@redhat.com, farman@linux.ibm.com, peter.maydell@linaro.org,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mtosatti@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, jonathan.cameron@huawei.com,
 jiangkunkun@huawei.com, yangyicong@hisilicon.com, linuxarm@huawei.com
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250310162337.844-1-alireza.sanaee@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aNyPvWlF7GTMCNa1f6thMCVdtt8CKoiJOobAbiWCtoo_1744046659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.32,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nMnl2PHrsttJ

Hi Ali,

On 3/10/25 5:23 PM, Alireza Sanaee via wrote:
> Specifying the cache layout in virtual machines is useful for
> applications and operating systems to fetch accurate information about
> the cache structure and make appropriate adjustments. Enforcing correct
> sharing information can lead to better optimizations. This patch enables
> the specification of cache layout through a command line parameter,
> building on a patch set by Intel [1,2,3]. It uses this set as a
some dependencies were merged. The series does not apply anymore.
> foundation.  The device tree and ACPI/PPTT table, and device tree are
> populated based on user-provided information and CPU topology.
this last sentence need some rewording.
>
> Example:
>
>
> +----------------+                            +----------------+
> |    Socket 0    |                            |    Socket 1    |
> |    (L3 Cache)  |                            |    (L3 Cache)  |
> +--------+-------+                            +--------+-------+
>          |                                             |
> +--------+--------+                            +--------+--------+
> |   Cluster 0     |                            |   Cluster 0     |
> |   (L2 Cache)    |                            |   (L2 Cache)    |
> +--------+--------+                            +--------+--------+
>          |                                             |
> +--------+--------+  +--------+--------+    +--------+--------+  +--------+----+
> |   Core 0         | |   Core 1        |    |   Core 0        |  |   Core 1    |
> |   (L1i, L1d)     | |   (L1i, L1d)    |    |   (L1i, L1d)    |  |   (L1i, L1d)|
> +--------+--------+  +--------+--------+    +--------+--------+  +--------+----+
>          |                   |                       |                   |
> +--------+              +--------+              +--------+          +--------+
> |Thread 0|              |Thread 1|              |Thread 1|          |Thread 0|
> +--------+              +--------+              +--------+          +--------+
> |Thread 1|              |Thread 0|              |Thread 0|          |Thread 1|
> +--------+              +--------+              +--------+          +--------+
>
>
> The following command will represent the system relying on **ACPI PPTT tables**.
>
> ./qemu-system-aarch64 \
>  -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-
s/cluseter/cluster
> cache.3.cache=l3,smp-cache.3.topology=socket \
>  -cpu max \
>  -m 2048 \
>  -smp sockets=2,clusters=1,cores=2,threads=2 \
>  -kernel ./Image.gz \
>  -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
>  -initrd rootfs.cpio.gz \
>  -bios ./edk2-aarch64-code.fd \
>  -nographic
>
> The following command will represent the system relying on **the device tree**.
>
> ./qemu-system-aarch64 \
>  -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
>  -cpu max \
>  -m 2048 \
>  -smp sockets=2,clusters=1,cores=2,threads=2 \
>  -kernel ./Image.gz \
>  -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=off" \
>  -initrd rootfs.cpio.gz \
>  -nographic
>
> Failure cases:
>     1) There are scenarios where caches exist in systems' registers but
>     left unspecified by users. In this case qemu returns failure.
Can you give more details on 1)? is it a TCG case or does it also exist
with KVM acceleration?
>
>     2) SMT threads cannot share caches which is not very common. More
>     discussions here [4].
>
> Currently only three levels of caches are supported to be specified from
> the command line. However, increasing the value does not require
> significant changes. Further, this patch assumes l2 and l3 unified
> caches and does not allow l(2/3)(i/d). The level terminology is
> thread/core/cluster/socket right now. Hierarchy assumed in this patch:
> Socket level = Cluster level + 1 = Core level + 2 = Thread level + 3;
>
> TODO:
>   1) Making the code to work with arbitrary levels
>   2) Separated data and instruction cache at L2 and L3.
>   3) Additional cache controls.  e.g. size of L3 may not want to just
>   match the underlying system, because only some of the associated host
>   CPUs may be bound to this VM.
Does it mean this is more an RFC or do you plan to send improvement
patches once this series gets upstream?

Thanks

Eric
>
> [1] https://lore.kernel.org/kvm/20240908125920.1160236-1-zhao1.liu@intel.com/
> [2] https://lore.kernel.org/qemu-devel/20241101083331.340178-1-zhao1.liu@intel.com/
> [3] https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/
> [4] https://lore.kernel.org/devicetree-spec/20250203120527.3534-1-alireza.sanaee@huawei.com/
>
> Change Log:
>   v7->v8:
>    * rebase: Merge tag 'pull-nbd-2024-08-26' of https://repo.or.cz/qemu/ericb into staging
>    * I mis-included a file in patch #4 and I removed it in this one.
>
>   v6->v7:
>    * Intel stuff got pulled up, so rebase.
>    * added some discussions on device tree.
>
>   v5->v6:
>    * Minor bug fix.
>    * rebase based on new Intel patchset.
>      - https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/
>
>   v4->v5:
>     * Added Reviewed-by tags.
>     * Applied some comments.
>
>   v3->v4:
>     * Device tree added.
>
> Depends-on: Building PPTT with root node and identical implementation flag
> Depends-on: Msg-id: 20250306023342.508-1-alireza.sanaee@huawei.com
>
> Alireza Sanaee (6):
>   target/arm/tcg: increase cache level for cpu=max
>   arm/virt.c: add cache hierarchy to device tree
>   bios-tables-test: prepare to change ARM ACPI virt PPTT
>   hw/acpi/aml-build.c: add cache hierarchy to pptt table
>   tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
>   Update the ACPI tables according to the acpi aml_build change, also
>     empty bios-tables-test-allowed-diff.h.
>
>  hw/acpi/aml-build.c                        | 205 +++++++++++-
>  hw/arm/virt-acpi-build.c                   |   8 +-
>  hw/arm/virt.c                              | 350 +++++++++++++++++++++
>  hw/cpu/core.c                              |  92 ++++++
>  hw/loongarch/virt-acpi-build.c             |   2 +-
>  include/hw/acpi/aml-build.h                |   4 +-
>  include/hw/arm/virt.h                      |   4 +
>  include/hw/cpu/core.h                      |  27 ++
>  target/arm/tcg/cpu64.c                     |  13 +
>  tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 540 bytes
>  tests/qtest/bios-tables-test.c             |   4 +
>  11 files changed, 701 insertions(+), 8 deletions(-)
>

