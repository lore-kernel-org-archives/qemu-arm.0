Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2094905lfk;
        Sun, 24 Apr 2022 20:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzubBh/hZIc26yjXiySpV9uQWwDDyosdClHK0FHeSznhlGmS6CZ7DUScNGTaTjrZVTUjiQu
X-Received: by 2002:a0c:b2d7:0:b0:443:afac:fc60 with SMTP id d23-20020a0cb2d7000000b00443afacfc60mr11419821qvf.58.1650857391925;
        Sun, 24 Apr 2022 20:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650857391; cv=none;
        d=google.com; s=arc-20160816;
        b=H4ElPlY5okDPeaz9+0z0jje78u9CHR/7Teqs2NnBI7zUJibSKA2Ih5L/nAwQB50MwG
         tBuR8ZSxaPI1tmVlk88xwdza0MjxgjX3F3w2/U8GWoT5u5AOtDscPIalYkxsHrDlYrbv
         36gsh/1Lx2pU7O4isfxRcOZvSymdQql1l0twsfe6DZt7vhPy7ya/VwrqF0xvXJqbOUqH
         Mp+8aljvFWDBhWrLy5oaI4WNlPPOwGmq80Nl8YXB5XNJzAfhBnGZDh26OghJEw89wNKZ
         OcDwMXx0S80YdClHOr3FKjzhBtcXsQCIAYrAR6jXi9ccPgPqtDxpLGPQAhFIhxfQfaVw
         vA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:message-id:date:subject:to:from
         :dkim-signature;
        bh=yAJPvKuPyJ5l1IGk6hFcP1/3aNdJ9HdqWAEFxxyoJHI=;
        b=sCGUGiLlvuQT1I7FYEmB1rquxqmmV7tKSORqpDiPRb3JYGYnpUErlnFXfbajj0AUgW
         C+8mfZ3y/BVFgC0l1i4v7EYTY7nhyC2ItwPGOgNSOxnHF5M/FH63dmfFvZfkjmfgJVW5
         1yLBRAaNvOa7G4fEdleZz4q/Wrmnzo45yIOsAeqoCavKoY3gbkVK5lqah2ILHdry7dS3
         VzOsit3x1OcPlsvQ9hGn25PUvcgPBQqgl2g3M1W66wahvQ+6KPyqfV64oSwpBDjVYqeX
         jHMEF5rT3gFhVhKcrqldy+UqQORYwMeVaARJZadhJonIWDQAY3odcMgNm3ZI6dBLKsRc
         UF/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ej3glWF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020a05620a44c800b0069c213befd4si4239067qkp.648.2022.04.24.20.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Apr 2022 20:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ej3glWF1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nipQ7-0002wi-DN
	for alex.bennee@linaro.org; Sun, 24 Apr 2022 23:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipPn-0002wT-8M
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipPl-0002Ny-6y
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650857368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yAJPvKuPyJ5l1IGk6hFcP1/3aNdJ9HdqWAEFxxyoJHI=;
 b=ej3glWF12l2Gt78ZLE08Z//ndTMXBHZ5uxbVYnmrTmvx8R3Q/GX2OVHEe7ztJkLuMpK4ZZ
 RKzJTTCI1CkfAsGORtGJKv0iO0cCxIosgYZG15hjj17+6Mm1WkoXgxf0CB74CVkEatjQfz
 QeczO/dT0CsiPC24XfIZTXVjrthmIuY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-rQvwNEgePc2g5t3-vcBoBg-1; Sun, 24 Apr 2022 23:29:25 -0400
X-MC-Unique: rQvwNEgePc2g5t3-vcBoBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB59129AB42F;
 Mon, 25 Apr 2022 03:29:24 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDEE11468940;
 Mon, 25 Apr 2022 03:29:15 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v8 0/5] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Mon, 25 Apr 2022 11:27:57 +0800
Message-Id: <20220425032802.365061-1-gshan@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NygyW3UZtK/t

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

  PATCH[1/5] Add cluster-id to CPU instance property
  PATCH[2/5] Fixes test failure in qtest/numa-test/aarch64_numa_cpu()
  PATCH[3/5] Uses SMP configuration to populate CPU topology
  PATCH[4/5] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[5/5] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again

Changelog
=========
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

Gavin Shan (5):
  qapi/machine.json: Add cluster-id
  qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
  hw/arm/virt: Consider SMP configuration in CPU topology
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table

 hw/acpi/aml-build.c        | 111 ++++++++++++++++---------------------
 hw/arm/virt.c              |  19 ++++++-
 hw/core/machine-hmp-cmds.c |   4 ++
 hw/core/machine.c          |  16 ++++++
 qapi/machine.json          |   6 +-
 tests/qtest/numa-test.c    |   3 +-
 6 files changed, 91 insertions(+), 68 deletions(-)

-- 
2.23.0

