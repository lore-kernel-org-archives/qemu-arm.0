Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp386162lfo;
        Wed, 2 Mar 2022 19:14:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDJw/3bHANb6TfEsBoCwQFjHbmFYedzZwCJRtka5dglm0X3aeodBliifBaIfFTKmX3bdNp
X-Received: by 2002:a81:5454:0:b0:2d0:e7d6:ebac with SMTP id i81-20020a815454000000b002d0e7d6ebacmr34400636ywb.166.1646277243909;
        Wed, 02 Mar 2022 19:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646277243; cv=none;
        d=google.com; s=arc-20160816;
        b=SQUDLoLL8zaongBybpDb1BE2W+8d5KGUwg+KCBBOh8yWRrlQUwlCMOwDqsW2w8rXok
         yyzAUO9MOdBqV4ExtyC47Bj5KvzknFpYykC8sec7OkdEEidn0me18sIUmyJF7eq1RSWq
         ERB8DTRPoqM7S0mEAM7YpDmaBbaDDGOetX8t/bnu/mfb1KKIolDaB2pjQmroeEb+GKNA
         0sndsu8zKBWYAD1qrqEkxBrbIYU7KhQGnu3z01tzmE8Du4CVj1PXfE6Go5ExLp1R+lzD
         4nv/gljowTzG4a4kITp2tWep8FmLA04snhBtKJMeQb0OKYGniVpDr/9CHLzI++gdc9en
         /Y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2/mZmVzWIP7KHK/fgzCmeeY2iqLmkgT+xBc7nsDvvn8=;
        b=M3AGXVcMSWtfxDgJ7Jq95c++HbpZDywFRr0pR+xNwBH1ZmoX6djOLtkJLGSIYfqFOQ
         cJhGRY84QE9pCY62FMihbFilTuK16JV0H8eGDjmTRp7t/0S6EbKLIDYC48VMuYRPCIiB
         EFOzUbMIWYPTJ9Kx4JHiSRgWBaUPQMt0bDBdK1SPR802HipVLP1uSB+fF5dhkuN2uxhz
         9AICgGkBJV04gptbbAtapP5D43gx6883qgMRg7/qJRbfaROQ7h7KJufTHKAX1Uk9loNp
         3HiXNxW6syy0tLjvBORuk/oZHe3IUfBvIc21hUSwsMynyT0lcGIyEuxAzUGcPJFOaYdA
         FZAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bbIyY7C+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a817e0d000000b002d6ccd5e1dbsi715763ywn.26.2022.03.02.19.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Mar 2022 19:14:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bbIyY7C+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPbul-0008V6-Ag
	for alex.bennee@linaro.org; Wed, 02 Mar 2022 22:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtB-0007Ub-Qk
 for qemu-arm@nongnu.org; Wed, 02 Mar 2022 22:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbt8-0003dB-Ik
 for qemu-arm@nongnu.org; Wed, 02 Mar 2022 22:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2/mZmVzWIP7KHK/fgzCmeeY2iqLmkgT+xBc7nsDvvn8=;
 b=bbIyY7C+hCXpVMdnUce2sOXSU28IvTrepRLqTkFp1BnBy4CqINIrkk42caQJY51YCaS+Nm
 ICyH3AbmzEBNWKzo1vFU93vaMFOxh9ihkqhFkgCFjfoznStWGwpyVEaeHwtJof8YLl69c8
 ux77y0dWiqrsvpqbtqP/Usb7c0L/NYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-XKwgS_MVPdOVVJU60brcaw-1; Wed, 02 Mar 2022 22:12:18 -0500
X-MC-Unique: XKwgS_MVPdOVVJU60brcaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B288E8070F0;
 Thu,  3 Mar 2022 03:12:16 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5037C1006854;
 Thu,  3 Mar 2022 03:12:04 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Thu,  3 Mar 2022 11:11:49 +0800
Message-Id: <20220303031152.145960-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: MiC6go0T14+K

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

PATCH[1/3]: Fixes the broken CPU topology by considering the socket boundary
            when the default NUMA node ID is calculated.
PATCH[2/3]: Use the existing CPU topology to build PPTT table. However, the
            cluster ID has to be calculated dynamically because there is no
            corresponding information in CPU instance properties.
PATCH[3/3]: Take thread ID as the ACPI processor ID in MDAT and SRAT tables.

Changelog
=========
v2:
   * Populate the CPU topology in virt_possible_cpu_arch_ids() so that it
     can be reused in virt_get_default_cpu_node_id()                          (Igor)
   * Added PATCH[2/3] to use the existing CPU topology when PPTT table
     is built                                                                 (Igor)
   * Added PATCH[3/3] to take thread ID as ACPI processor ID in MADT and
     SRAT table                                                               (Gavin)

Gavin Shan (3):
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table
  hw/arm/virt: Unify ACPI processor ID in MADT and SRAT table

 hw/acpi/aml-build.c      | 106 ++++++++++++++++++++++++++++++---------
 hw/arm/virt-acpi-build.c |  12 +++--
 hw/arm/virt.c            |  17 ++++++-
 3 files changed, 107 insertions(+), 28 deletions(-)

-- 
2.23.0

