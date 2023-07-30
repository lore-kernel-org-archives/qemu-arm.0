Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1847532ejb;
        Sun, 30 Jul 2023 16:49:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF7hDq9ZhkXD5+GmtiwDjlegxmbdF/gDi1X0KC2v2ujleDDqsz4rHCun+18kHKQlGUpPnH/
X-Received: by 2002:ac8:5c91:0:b0:403:aa78:e9c3 with SMTP id r17-20020ac85c91000000b00403aa78e9c3mr14234887qta.26.1690760982083;
        Sun, 30 Jul 2023 16:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690760982; cv=none;
        d=google.com; s=arc-20160816;
        b=UAyE/X4FTnwFtdGYds/mYTPvZr1Jqi9dK73Cv4fvm9IKNEUONL7DQMZ5hxy5kd0qxT
         b7L7DTv/ONx3AWtbNcZ98sFDnub83l0+vyJOpKcCbfiSaFtr2RURm6is1JEaZUQwk/fq
         ikZ7NOwAHsWJ6KaOyvRb6Zoz4VSU+n/HJDqaROpt2/0PhxnFOYvVJIhFB+KzRnu+QXsL
         HMGBW0MW9zocKhIjQ7U1aVIcw0pa542YuBJ4jqkewK+VzEHxcuy+dfjvjLCXCwqrbl5n
         +VtIccwQuvxmB0xCHyBh4rb6pyYrQRy8VEavxa95QoWs4ah6/LV2+hj/PnV1szvhY0X/
         6aEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=t1l85CW0elmLDKPawBz3akud2XKIuETu6q7m9idSpyw=;
        fh=JfkibTU/RCl9SaiCohcog0nwo13MFN30OcDo5HKoGnA=;
        b=xUk8V4k2frqZdLq3C7dB848U+9zPfnqjCZ97uEhgpEDyZGTj0dAKZGICpijXOhlCxr
         DGqI0N8FIUBEorRrBVcXf8G9LFT/C/GjjLfdz32F8rLqnPQby/1OmTKz/Vdn36vzKUap
         LnND2hVENzDo5jvfjDtp7mu94jcNtRYp8Vxxp/zGlE1SkpixFdRzCmFANqxbmrtBuHi3
         BbJvAMy3reJMKczURWEvj/KQpzejDEbPeqcH3OznBuWFa6ArAkuL9GW9PgUSsUnok9an
         S02HEkZEubAm3a0f+a65ICk9c03gZHdfnyKPJcqGzvnlZ4XL68VY/TmlErpJ56epO8MS
         CpjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iAFQw208;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05622a014c00b00403a6fbc288si5278340qtw.453.2023.07.30.16.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jul 2023 16:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iAFQw208;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQG9m-00066Q-Vl; Sun, 30 Jul 2023 19:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQG9l-00066F-U7
 for qemu-arm@nongnu.org; Sun, 30 Jul 2023 19:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qQG9k-0001ok-In
 for qemu-arm@nongnu.org; Sun, 30 Jul 2023 19:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690760938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t1l85CW0elmLDKPawBz3akud2XKIuETu6q7m9idSpyw=;
 b=iAFQw208ug5uMCELSNhQtmw63G5qKtzUE1JLWyiurkP5z2+hZJONC4lZFYJEzraYrum8hJ
 t2j/94AgQqen/6iNjMmpLVkOGlL54X0qtMkhv9S1U31UcfUyIr1DxwevLRCkPRrG/ppbdb
 Eo7SSKh7K2r9ZAWYm+Uoh2oi1njXqbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-H-M28opqNZ2WMaCjyK-jCw-1; Sun, 30 Jul 2023 19:48:53 -0400
X-MC-Unique: H-M28opqNZ2WMaCjyK-jCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0622D1044589;
 Sun, 30 Jul 2023 23:48:53 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7970F4A9004;
 Sun, 30 Jul 2023 23:48:50 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, david@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH] kvm: Fix crash by initializing kvm_state early
Date: Mon, 31 Jul 2023 09:48:40 +1000
Message-ID: <20230730234840.1989974-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xX+FIXuow3Cu

Runs into core dump on arm64 and the backtrace extracted from the
core dump is shown as below. It's caused by accessing @kvm_state which
isn't initialized at that point due to commit 176d073029 ("hw/arm/virt:
Use machine_memory_devices_init()"), where the machine's memory region
is added ealier than before.

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

Fix it by initializing @kvm_state early. With this applied, no crash
is observed on arm64.

Fixes: 176d073029 ("hw/arm/virt: Use machine_memory_devices_init()")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 373d876c05..c825cba12f 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2464,6 +2464,7 @@ static int kvm_init(MachineState *ms)
     qemu_mutex_init(&kml_slots_lock);
 
     s = KVM_STATE(ms->accelerator);
+    kvm_state = s;
 
     /*
      * On systems where the kernel can support different base page
@@ -2695,8 +2696,6 @@ static int kvm_init(MachineState *ms)
 #endif
     }
 
-    kvm_state = s;
-
     ret = kvm_arch_init(ms, s);
     if (ret < 0) {
         goto err;
-- 
2.41.0

