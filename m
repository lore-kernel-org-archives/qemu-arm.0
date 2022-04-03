Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2106693lfb;
        Sun, 3 Apr 2022 04:01:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqStjzp0RaM9TtfGJD66Gh/uNILSiGL80gGBAEXxz49F7LUmdV3cgldsZayDEDdufydOvF
X-Received: by 2002:a05:622a:13c6:b0:2e2:2778:2ea5 with SMTP id p6-20020a05622a13c600b002e227782ea5mr13891369qtk.512.1648983693488;
        Sun, 03 Apr 2022 04:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648983693; cv=none;
        d=google.com; s=arc-20160816;
        b=BiNdBxzbbyVVVD93Tx84w6w2L+/aNja1P4+PZqWsLwxQ3OcbF+GrK0H66Q6w/mKHs/
         GdWihkGKOhuXPTV7WruzkyJLRrZUzA2OH0fhHjrKAASFm4oD3q+6Wq5Y+qsKS1GcYqxe
         jXl8SdyglxlIMZqL/bMOCdEutp1fQZVJmOpkK8U6sk48Kuk18MPwUBFpuHQ2/JRu27l9
         CY/UGD9TW+06J7C1CTFvc9xmvz5hpYOHEuBILN22cHPnn6Gleb5GlzbOSN4qprDU/KJA
         jhuPYwSpqaWP9y1DOdC0PFZpVkgqSaAfkvbnx2bqVQZvipfv4vLHDsMSGrSqZJtkvhaI
         YO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=s2QKMtJSbKYwZ3Fs4Cvv4gGrh4h+Z1nu9GE+rJgCLkI=;
        b=SCB3zotxtlle7XGW0nOju+lPM38aSGS+98trT98bqSM7K8JD/JA4CBOpSKFtMJQ3Cz
         kIjipMbb9rM9HtSiKkmv0hgDXzC3GvdGGo5Z16Hw8PPAZrlUap1prAU2Qs39nKxyRiia
         DpMcafoxEToT71+XJLQ32Y+hc2JEBZyjsnXPtQ5Aas2oRmvnB9maDBxDcLDKTPrBn9Ry
         LKtodWgjm6P7dbCWxk8Dd4xlOpOtM6wegxn7kE4mxBKMuHpAqAVoHKL1OZZZIT740PPd
         qevJkkUFhixIL3LbjbZz5gGrZQCteAcUhM+PGiM46xwQxJPhUK32Y0A+Upv6KOnqDIZu
         JHJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Psy5Q9px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a37c405000000b00699a875de36si1605426qki.409.2022.04.03.04.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 04:01:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Psy5Q9px;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naxzB-0004iF-0Q
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 07:01:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyk-0004hy-D8
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyf-0001VH-DN
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648983660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s2QKMtJSbKYwZ3Fs4Cvv4gGrh4h+Z1nu9GE+rJgCLkI=;
 b=Psy5Q9px1uu79oPHBx39b7MFYpxBbVvapnlsfk/SAPCYLJgkEi2rWBmN/9b3TNAzHqCcNy
 bgyhwVzg/jn77awo8X7undSaFrIfDUbYU6ss5AqBdhTrl89HOnKbgpfLj+EUU6CdoQFLW2
 aR984GSzZMJi2IwQ0EhgxGu+WOmqBF0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-fJAs5RHOMZyTB-TZI_fdDg-1; Sun, 03 Apr 2022 07:00:57 -0400
X-MC-Unique: fJAs5RHOMZyTB-TZI_fdDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95C8E3C01D8B;
 Sun,  3 Apr 2022 11:00:56 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9351F40D02E1;
 Sun,  3 Apr 2022 11:00:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Sun,  3 Apr 2022 19:00:33 +0800
Message-Id: <20220403110036.5531-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6poCIB5rXOvE

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

  PATCH[1/3] Uses SMP configuration to populate CPU topology
  PATCH[2/3] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[3/3] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again

Changelog
=========
v4:
   * Apply '% ms->smp.{clusters, cores, threads} as x86 does
     in virt_possible_cpu_arch_ids()                            (Igor)
   * s/within cluster/within cluster\/die/ for 'core-id' in
     qapi/machine.json                                          (Igor)
   * Use [0 - possible_cpus->len] as ACPI processor UID to
     build PPTT table and PATCH[v3 4/4] is dropped              (Igor)
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


Gavin Shan (3):
  hw/arm/virt: Consider SMP configuration in CPU topology
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table

 hw/acpi/aml-build.c | 95 +++++++++++++++++++++++++++++++++------------
 hw/arm/virt.c       | 19 ++++++++-
 qapi/machine.json   |  6 ++-
 3 files changed, 92 insertions(+), 28 deletions(-)

-- 
2.23.0

