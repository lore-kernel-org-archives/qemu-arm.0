Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2154618ejb;
        Mon, 31 Jul 2023 06:00:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGc4pTVQQhLH133Xs0YW/Sz0dG4u+W0unUWwZmuxE7juu4CRkQj/+9SFKNx4gcGSJzx86Zg
X-Received: by 2002:a05:620a:b57:b0:76c:b30a:5d8e with SMTP id x23-20020a05620a0b5700b0076cb30a5d8emr1960267qkg.61.1690808442992;
        Mon, 31 Jul 2023 06:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690808442; cv=none;
        d=google.com; s=arc-20160816;
        b=TkOZdqLhtn/0+2oT4C3VTRUwDmF4FfF0M95Sgy/Y0krM/ssaUirJSE/P7cM6IwP/Xw
         T1lr7/LZJkcHq5HxzHgjXjBexes1zV5BRFxBXt2w006cIBeWdYGK3l9o6sQzndQyBzvj
         3RMEp/oY2dkT4ga7fwVT9Wr4EcuR2tpmcPnX37WpNlW4y8pvP8WitGDogN3Eg1/LWxgt
         U4ZsBp9qjnrBbv7gcDuLFHWdccWYv27jBLnTnmb+fgsV2j7nmvaJ22RozuWdNpmGzcQj
         YzkcxeVoE1NR4m0OIVYhTun8ykvr5EXf2W528v2cJnzL5JDabm0bFoJ03OzqNU59sjLE
         Z88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qcpWBDDJOi4yLuCS/GSO1Pdlb8fB/uP6AVuMBECFsQQ=;
        fh=frLW2KWoxX6VVjV5JZCx2pdITQVr5MlntX6MrgEjLhI=;
        b=IiFApjX4H9oQhKBnoA+noUckjwe8JUkubowkpuYMGdCUw/iP4pSyVonCtDVJ4RRdOs
         0DQdHna1kQ6X2QmBm3uSBEZOTlYU5zMa4KvgGpnGfXKhC723pA9hs324vE785ZeMoltI
         E3rxQL1gXOVNzICSbEBxWwp+RKDeWuJNKbNxApnCbklMYe8whwVIVdJRsWAgUdmiOG4u
         BJTjWiR4Z2xw6J7xqZb6eZfGSOyrhVH7f5jG9Rsc17nDZfNGWtCzu0J29lx+3KajyDty
         T328zl1TVtPLFvrO18v0zDm9QAMjRKkw4uHqVEwGADrvE5DwdAtFU95aERQtAEIxMDZ+
         Q31g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F9ExWnBK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a05620a404400b00767ee53f0absi5989476qko.340.2023.07.31.06.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 06:00:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F9ExWnBK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qQSVY-0007lI-G5; Mon, 31 Jul 2023 09:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQSVG-0007kW-UU
 for qemu-devel@nongnu.org; Mon, 31 Jul 2023 09:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQSVE-0007xv-Dq
 for qemu-devel@nongnu.org; Mon, 31 Jul 2023 09:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690808399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qcpWBDDJOi4yLuCS/GSO1Pdlb8fB/uP6AVuMBECFsQQ=;
 b=F9ExWnBKV4QsNDDLwe6ufPRQyo4EGJlPuAAgXaYsrFfZFVsDST/NaJ8KuHMj5y9DUHerh0
 M6WHipor31INXGmarOMinbxeeKTDzruOvPqO0sV3W814P85D83myH52FLeH2yTrUiCsx3d
 6ylXuhHWxiTpZ/H/9uzC0svCQov45GE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-pi-kRdmQOhy25-t3RpKKrg-1; Mon, 31 Jul 2023 08:59:56 -0400
X-MC-Unique: pi-kRdmQOhy25-t3RpKKrg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9FD18022EF;
 Mon, 31 Jul 2023 12:59:55 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 254FF492B03;
 Mon, 31 Jul 2023 12:59:52 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 philmd@linaro.org, david@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2] kvm: Fix crash due to access uninitialized kvm_state
Date: Mon, 31 Jul 2023 22:59:46 +1000
Message-ID: <20230731125946.2038742-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tNAW70oUzdmN

Runs into core dump on arm64 and the backtrace extracted from the
core dump is shown as below. It's caused by accessing uninitialized
@kvm_state in kvm_flush_coalesced_mmio_buffer() due to commit 176d073029
("hw/arm/virt: Use machine_memory_devices_init()"), where the machine's
memory region is added earlier than before.

    main
    qemu_init
    configure_accelerators
    qemu_opts_foreach
    do_configure_accelerator
    accel_init_machine
    kvm_init
    virt_kvm_type
    virt_set_memmap
    machine_memory_devices_init
    memory_region_add_subregion
    memory_region_add_subregion_common
    memory_region_update_container_subregions
    memory_region_transaction_begin
    qemu_flush_coalesced_mmio_buffer
    kvm_flush_coalesced_mmio_buffer

Fix it by bailing early in kvm_flush_coalesced_mmio_buffer() on the
uninitialized @kvm_state. With this applied, no crash is observed on
arm64.

Fixes: 176d073029 ("hw/arm/virt: Use machine_memory_devices_init()")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v2: Bail early in kvm_flush_coalesced_mmio_buffer() on the uninitialized
    @kvm_state and improved changelog        (David/Peter)
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 373d876c05..7b3da8dc3a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2812,7 +2812,7 @@ void kvm_flush_coalesced_mmio_buffer(void)
 {
     KVMState *s = kvm_state;
 
-    if (s->coalesced_flush_in_progress) {
+    if (!s || s->coalesced_flush_in_progress) {
         return;
     }
 
-- 
2.41.0

