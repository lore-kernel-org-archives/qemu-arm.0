Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26D9EB7EB6
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 10:23:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxjNi-000718-0A; Wed, 04 Mar 2026 05:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxjNg-00070c-2y
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 05:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxjNd-0002YT-2W
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 05:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772619780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eYqrXjzlMRX2r5f84qZKv+14d3Tw1qZIxlDLVXhHGeg=;
 b=Wlw8uv1um8tOlWwXSZ+Rf2/43sA0WHMNvOod0TkQtkMJ5UwqU4gtuqUFKY5+gC7k5w1N+w
 uZT/6iAi1uN1fY8OP3N5A0JBmVlNOLw9lRMt/hfLjO7WBS/pbU1c4DcxcNEywpbLA72hUv
 ZJrYTF73B3W3xc0Ci22MeGKfydvVqQ0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-ctnenVIXN_2V8Hcl6RIRbg-1; Wed,
 04 Mar 2026 05:22:56 -0500
X-MC-Unique: ctnenVIXN_2V8Hcl6RIRbg-1
X-Mimecast-MFC-AGG-ID: ctnenVIXN_2V8Hcl6RIRbg_1772619775
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9AEDF180034E; Wed,  4 Mar 2026 10:22:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.89])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3B8F71958DC2; Wed,  4 Mar 2026 10:22:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, cohuck@redhat.com,
 sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v8 0/6] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
Date: Wed,  4 Mar 2026 11:22:04 +0100
Message-ID: <20260304102249.1963784-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: bk3TcKTKwMzz0FaEsQFldUp0DcMuo9hiQumrUTcdqi8_1772619775
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series applies on top of
[PATCH v3 0/7] Improve traces on migration failure due to cpreg number mismatch

It introduces an infrastructure to explicitly tolerate some
mismatches between cpu cpreg indexes/values on migration.

We especially handle failures due to an attempt to migrate 
more registers than exposed on the destination.

Once the infrastructure is in place we can handle the following
known issues:
KVM:
- removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
  from v6.13 onwards. Causes forward migration failure.
- unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
  register from v6.16 onwards. Causes backward migration failure.
TCG:
- We can eventually remove AArch32 DBGDTRTX register which was
  erroneously defined.

Both series are available at:
https://github.com/eauger/qemu/tree/cpreg_vmstate_array_len_traces_v3_mitig_v2

History:
v7 -> v8:
- rebase on top of v3 dep
- removal of target/arm/machine: Fix detection of unknown incoming cpregs
  which is integrated in prerequisite series

v6 -> v7
- complete rework after Peter's comments in
  (https://lore.kernel.org/all/20260126165445.3033335-1-eric.auger@redhat.com/)
  Especially it does not use properties at all. Do not feature hidden regs
  Also the initial series was split into 2.


Eric Auger (6):
  target/arm/cpu: Introduce the infrastructure for cpreg migration
    tolerances
  target/arm/machine: Take account cpreg mig tolerances in case of
    mismatch
  target/arm/cpu64: Mitigate migration failures due to spurious TCR_EL1,
    PIRE0_EL1 and PIR_EL1
  target/arm/cpu64: Define cpreg migration tolerance for
    KVM_REG_ARM_VENDOR_HYP_BMAP_2
  target/arm/helper: Define cpreg migration tolerance for DGBDTR_EL0
  Revert "target/arm: Reinstate bogus AArch32 DBGDTRTX register for
    migration compat"

 target/arm/cpu.h          | 32 +++++++++++++++++
 target/arm/cpu.c          | 75 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c        | 34 ++++++++++++++++++
 target/arm/debug_helper.c | 29 ---------------
 target/arm/helper.c       |  5 +++
 target/arm/machine.c      | 30 ++++++++++------
 target/arm/trace-events   |  2 ++
 7 files changed, 168 insertions(+), 39 deletions(-)

-- 
2.53.0


