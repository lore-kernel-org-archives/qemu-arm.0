Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1710912lfj;
        Tue, 3 May 2022 14:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdRSraTutJiKyS/KOjKu/m6DlCwydX9ov61NLmM7ANQchcBeEsJ8FH88h/TNGpurhApRBG
X-Received: by 2002:a05:622a:206:b0:2f3:b1de:9a70 with SMTP id b6-20020a05622a020600b002f3b1de9a70mr3351787qtx.397.1651614420652;
        Tue, 03 May 2022 14:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651614420; cv=none;
        d=google.com; s=arc-20160816;
        b=TXhBlsrg9DIwXBpGXrjLqBevk+/BesPWxIej6i51QewA+k+MKXYq8uoq/YvMDXOXHq
         RQi9g9+NXvPqC6fDeJQsLD+6OT2M1MmKx3HClHNidVk5d5ih0UlJNXYwIFfj+ibHRt9P
         UXsrPRFhTorTdMxiCdPUwFFYSMCYdIMPYrh8KFoZAG8nr6Eyc3Qy+cgyn2hJ3ZL6uEGT
         pt2WgZfkxN9NW4gAMLvmv3fAyXiLhcyQdvw4PHepez08+4ls4i1qSZqSmVDN+Xeegnnn
         AcRZCDeFXfPT9sPgqGbWcbhgGeN2qdF99aHMPg3EjTf3jAy8Q4iCmB5MN7dd/u98YTvA
         uRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=z5HZiVhBJWVdW1of05zLZgXrpYe6Gx6nGw1fBox63Nw=;
        b=RgW5o8bN2LZuidf/h9fR7UaqcGFJksSPGr04ezd85vLCmuR9PkNhXC/laoY9TYmNuz
         AZn4VU+LAklONQ1a8+AfpGkDout7x4hVr+WbcF/Krp3eiBo4VA+t4VQ2bxZ9zEkNwsHE
         yYK62UAtM3/HOxC6Ji3gw2YFhsOLuA7NeH4R6DUaKCtMrQm/00D6pFiaeAwp4BIKKMHe
         FaOFhyG4YfXj9o0GE98TF5mLzoPRqOAFAiKRY+v0d4ZqOvkf4FA7rKInUBtYhbhcXuOw
         2fU6/+8uwVinj8s7mq041FDe901ZCFswPIax9BxAEYxca9Wv8a52z6xIWnIqimSIbUiY
         YxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ncf4aUwl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a050700b002f200ea785asi8828376qtx.648.2022.05.03.14.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 14:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ncf4aUwl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nm0MG-0004Uy-4l
	for alex.bennee@linaro.org; Tue, 03 May 2022 17:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlyzC-0008G9-Na
 for qemu-arm@nongnu.org; Tue, 03 May 2022 16:19:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nlyz7-0004Pc-UY
 for qemu-arm@nongnu.org; Tue, 03 May 2022 16:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z5HZiVhBJWVdW1of05zLZgXrpYe6Gx6nGw1fBox63Nw=;
 b=Ncf4aUwlNQz08XHC/r9bEbFw/xHb5N0S5At0AiqK9LTUbar0wLQf40EXZsi5dj0V8TT1X9
 sXXJQAWZxYdQiSBH5ai4awJQM5sAzX/MZzSlFZJ5uLkmxsP8NrW7Bx1JsKeM9MV069hLID
 KSki4mzJMli4psPhoWX0oQ8u4+OCb+0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-U-UKxFaBPpWgS4DplydmAA-1; Tue, 03 May 2022 10:53:11 -0400
X-MC-Unique: U-UKxFaBPpWgS4DplydmAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E97221D7B7BF;
 Tue,  3 May 2022 14:03:17 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2975A1537EC3;
 Tue,  3 May 2022 14:03:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v9 0/6] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Tue,  3 May 2022 22:02:58 +0800
Message-Id: <20220503140304.855514-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: jea0Gwf4fLxh

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue by populating full CPU toplogy on arm/virt machine.

  PATCH[1/6] Add cluster-id to CPU instance property
  PATCH[2/6] Fixes test failure in qtest/numa-test/aarch64_numa_cpu()
  PATCH[3/6] Uses SMP configuration to populate CPU topology
  PATCH[4/6] Corrects CPU/NUMA association in qtest/numa-test/aarch64_numa_cpu()
  PATCH[5/6] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[6/6] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again

Changelog
=========
v9:
   * Fix typo by replacing 'thrad-id' with 'thread-id' in
     PATCH[v9 2/6]'s commit log                                 (Igor)
   * Added PATCH[v9 4/6] to make CPU-to-NUMA association
     real                                                       (Igor)
v8:
   * Separate PATCH[v8 2/5] to fix test failure in qtest/
     numa-test/aarch64_numa_cpu()                               (Igor)
   * Improvents to coding style, changelog and comments         (Yanan)
v6/v7:
   * Fixed description for 'cluster-id' and 'core-id'           (Yanan)
   * Remove '% ms->smp.sockets' in socket ID calculation        (Yanan)
   * Fixed tests/qtest/numa-test/aarch64_numa_cpu()             (Yanan)
   * Initialized offset variables in build_pptt()               (Jonathan)
   * Added comments about the expected and sorted layout of
     cpus[n].props.*_id and assert() on the exceptional cases   (Igor)
v4/v5:
   * Split PATCH[v3 1/3] to PATCH[v5 1/4] and PATCH[v5 2/4].
     Verify or dump 'clsuter-id' in various spots               (Yanan)
   * s/within cluster/within cluster\/die/ for 'core-id' in
     qapi/machine.json                                          (Igor)
   * Apply '% ms->smp.{sockets, clusters, cores, threads} in
     virt_possible_cpu_arch_ids() as x86 does                   (Igor)
   * Use [0 - possible_cpus->len] as ACPI processor UID to
     build PPTT table and PATCH[v3 4/4] is dropped              (Igor)
   * Simplified build_pptt() to add all entries in one loop
     on ms->possible_cpus                                       (Igor)
v3:
   * Split PATCH[v2 1/3] to PATCH[v3 1/4] and PATCH[v3 2/4]     (Yanan)
   * Don't take account of die ID in CPU topology population
     and added assert(!mc->smp_props.dies_supported)            (Yanan/Igor)
   * Assign cluster_id and use it when building PPTT table      (Yanan/Igor)
v2:
   * Populate the CPU topology in virt_possible_cpu_arch_ids()
     so that it can be reused in virt_get_default_cpu_node_id() (Igor)
   * Added PATCH[2/3] to use the existing CPU topology when the
     PPTT table is built                                        (Igor)
   * Added PATCH[3/3] to take thread ID as ACPI processor ID
     in MADT and SRAT table                                     (Gavin)

Gavin Shan (6):
  qapi/machine.json: Add cluster-id
  qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
  hw/arm/virt: Consider SMP configuration in CPU topology
  qtest/numa-test: Correct CPU and NUMA association in
    aarch64_numa_cpu()
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table

 hw/acpi/aml-build.c        | 111 ++++++++++++++++---------------------
 hw/arm/virt.c              |  19 ++++++-
 hw/core/machine-hmp-cmds.c |   4 ++
 hw/core/machine.c          |  16 ++++++
 qapi/machine.json          |   6 +-
 tests/qtest/numa-test.c    |  19 +++++--
 6 files changed, 102 insertions(+), 73 deletions(-)

-- 
2.23.0

