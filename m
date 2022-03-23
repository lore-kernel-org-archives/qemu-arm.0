Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2168829lfb;
        Wed, 23 Mar 2022 00:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX6y/AYYepIq2PIuyMhonNyRIXyQV/q6ZuzYT2XQp1tn+gEq8kR88X+eOhxFv4ocPV678t
X-Received: by 2002:ac8:7d91:0:b0:2e0:6b65:c76c with SMTP id c17-20020ac87d91000000b002e06b65c76cmr22865668qtd.564.1648020321183;
        Wed, 23 Mar 2022 00:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648020321; cv=none;
        d=google.com; s=arc-20160816;
        b=N/2myR5Hq5KD/dhA3Aa18dfCK2OT+65uoxPH4dudXa5b7FIp3hktyFYfMZarBdh4Y9
         s6iqgeXhH79nSWCniVt6LwAzV4GZ9x5h+478EpR3cqRHoj+3TZWj1P1atCYCKxGAW6Nn
         Q5GTBMnbE7x2TGPbDkidERvgNlyMbpxXymma7JU0Q9dfpwfk7gjeguvI1ZndtzqNCHjQ
         z1NWrYfkZ299ARD9T0f4LMhlZT6ORHUgtLF0B2U6711Pd6bi7h+YhejLn2vkz8wFLCFQ
         FQLoqF/TW+loKBXqI6w1d6pDHFV7+mTSfaDD6uvHw/Voz4cCbGGLZA3qVRelUX0rm6g3
         Sr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ozZJjW77tp1RPbsuTtFCvlLt9ygsLD+rOf6IJpldEgk=;
        b=ef45CFJGZuZSPHjzX8ZD3/u3oLleec2o0z2Rid0H1VUkiDEKrkgIkuYi5FNmeyIfns
         X1HAhrBUvOJ5jUKmg3zVo6d/LKA8Kqr8oTLWHJY4tDfzP/GEeCZnaPSxdPOUzhQhdrTU
         aaaMLhUb2Rplve2plGAmXZw6uyvKmCl/YKMowqdHvjMhsgc35RoSgGfpkNayos2fnhPQ
         K/14PZ07dNhI2Vo1blxbFl+OpwD3draeD+8S1pz5gsEpWth2+gAV1MM+iR03mMST+Adp
         c1HhVPsA5T0N9DUBQ7m+dZ7XxNKWJZaf+5qd1OznH9vGV7UcBA33mJIDlvDBLmT+uxDp
         IxIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b2EfGjxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay33-20020a05622a22a100b002e1fbf3be40si3639187qtb.49.2022.03.23.00.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 00:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b2EfGjxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWvMu-0003dx-Ks
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 03:25:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvMj-0003dT-L7
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 03:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvMh-0000gi-8j
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 03:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648020306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ozZJjW77tp1RPbsuTtFCvlLt9ygsLD+rOf6IJpldEgk=;
 b=b2EfGjxzok4Zwu99G08wbLIsP0jiBYxPUFqU63mmxAd3ofaQXs/O1yHFCrAAXvlxEz+vRD
 F9f1wAgxQvEoJcwbh9t0ZhjzWYiRUIO19+y/C2OgBeomC+Xp9P6d9XOw0WbzYraFofsZcP
 BalagoiBdrW8fpBo2jicOTn62hAOj6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-W0L4eJm3MmC7XbkhqWfE2w-1; Wed, 23 Mar 2022 03:25:03 -0400
X-MC-Unique: W0L4eJm3MmC7XbkhqWfE2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7572899EC2;
 Wed, 23 Mar 2022 07:25:02 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AD2F2166B2D;
 Wed, 23 Mar 2022 07:24:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/4] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Wed, 23 Mar 2022 15:24:34 +0800
Message-Id: <20220323072438.71815-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L1ullLvMJWmE

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

  PATCH[1/4] Uses SMP configuration to populate CPU topology
  PATCH[2/4] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[3/4] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again
  PATCH[4/4] Take thread ID as the ACPI processor ID in MDAT and SRAT tables

Changelog
=========
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

Gavin Shan (4):
  hw/arm/virt: Consider SMP configuration in CPU topology
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table
  hw/arm/virt: Unify ACPI processor ID in MADT and SRAT table

 hw/acpi/aml-build.c      | 96 ++++++++++++++++++++++++++++++----------
 hw/arm/virt-acpi-build.c | 12 +++--
 hw/arm/virt.c            | 15 ++++++-
 qapi/machine.json        |  6 ++-
 4 files changed, 99 insertions(+), 30 deletions(-)

-- 
2.23.0

