Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2219665lfb;
        Sun, 3 Apr 2022 08:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3J/2rxgAdS1O0MQwbgXiTQKqoUQr+ezvF8Wq1PPIXnjem7AjV8t5Ko/VTUtblA0PXw/Uh
X-Received: by 2002:a05:622a:15cf:b0:2eb:9ab8:7a0f with SMTP id d15-20020a05622a15cf00b002eb9ab87a0fmr11530172qty.563.1648998056034;
        Sun, 03 Apr 2022 08:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648998056; cv=none;
        d=google.com; s=arc-20160816;
        b=PQc3bKCkNtwJbJhNCmr69D/S7+Ox4qEPjPEFGeatMgXooX4ESxH8qiLiUeNDtYPNBo
         +Wl1Eqgy71q7a35bhgtUynSjdGrJrgUxvdxZgchI09dHo107xD/vx2/wdjjk/CLoZH/E
         ObQ7zqKOdsKGMUnhZy+94F2uLblTLRiTIK0V2QV1F4uqaPiUCkGOvj6yZm1Yh4TvDhvQ
         gef7dgrwuMeutSy5A95Bvj+nSOywM6mdmt0+ictaE/X8WjYrfdIdsEO9ISxfgX598/Ts
         tNVk3PwkqubI555PnFwRSB+IQeb8T6LimDAtzepc44W5WSXyiEgQX7dHu4U1JaS0bTMF
         1dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PA/i9OX0S1EAeTEc8LbKghdZn9wXwqBZtvTR+0NHMT0=;
        b=KCep3+O2LfeII9EpVkWGhO3JDkDElVcDH4+fvhCqeuE6GraA9DNBg1xH7hNQ9xQhWu
         +9n4aFD9exrEiiu2sYJc4G9jI727bOE1UEiwzjhQsUxsSh2Yl6le2G8ww3vgaH/FCqra
         U+JvBEHWj084BL0/qNJvnJLN8Lx/9vQX56tdbh4+hWQhRdleY/V+hZGXW3EjJ9c4F9He
         Mavw0qHcb+tGL0Q+2flwqPLzR3awVwFAJkrPMnjjDDSJSA1Es+AyGsmbcLdugoX0cdZm
         jZWB3MbETFR5n3LU5A/exeSc1OjohVHqwGy/CtBhR/5XrpQugEMae4Vm+qT+e9dy1zL+
         ykcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KMDIJVPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y127-20020a37af85000000b00680cde13d68si2529138qke.148.2022.04.03.08.00.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 08:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KMDIJVPK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nb1ip-00057E-Hk
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 11:00:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1i8-000572-6h
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1i6-0003G4-3U
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648998009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PA/i9OX0S1EAeTEc8LbKghdZn9wXwqBZtvTR+0NHMT0=;
 b=KMDIJVPKncvm9oJwwvdJCLkRfxAbUbIO2MqGbxO74FoqnQrpeZc2rSbcXBTgBrV5IH3UFF
 khwiusA3cwHVufHiKM00iogs1cmxzUYCfxSXsH7t4DVYlWwhQ/4okoEbC5+k9Fa3nGDJsI
 fN/wWGAPjX1ucqNDvxhEX3yQVOq3NXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-XQ95cnvZOX6qx3VyVPuSDw-1; Sun, 03 Apr 2022 11:00:08 -0400
X-MC-Unique: XQ95cnvZOX6qx3VyVPuSDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFC31811E76;
 Sun,  3 Apr 2022 15:00:07 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 626EFC15E73;
 Sun,  3 Apr 2022 15:00:02 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 0/4] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Sun,  3 Apr 2022 22:59:49 +0800
Message-Id: <20220403145953.10522-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-TUID: 77FdOUkkY5jt

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

  PATCH[1/4] Add cluster-id to CPU instance property
  PATCH[2/4] Uses SMP configuration to populate CPU topology
  PATCH[3/4] Fixes the broken CPU topology by considering the socket boundary
             when the default NUMA node ID is given
  PATCH[4/4] Uses the populated CPU topology to build PPTT table, instead of
             calculate it again

Changelog
=========
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

Gavin Shan (4):
  qapi/machine.json: Add cluster-id
  hw/arm/virt: Consider SMP configuration in CPU topology
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table

 hw/acpi/aml-build.c        | 100 ++++++++++++++-----------------------
 hw/arm/virt.c              |  20 +++++++-
 hw/core/machine-hmp-cmds.c |   4 ++
 hw/core/machine.c          |  16 ++++++
 qapi/machine.json          |   6 ++-
 5 files changed, 80 insertions(+), 66 deletions(-)

-- 
2.23.0

