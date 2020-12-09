Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4567667lfb;
        Tue, 8 Dec 2020 18:57:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWhvPx0Pnw/oWRUVCWXhyY2UrboNz6WfzyHWnkNbkLCGXPuzqXlBfQBTWoHATM/1oodcXv
X-Received: by 2002:a05:6902:20a:: with SMTP id j10mr648199ybs.293.1607482649441;
        Tue, 08 Dec 2020 18:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607482649; cv=none;
        d=google.com; s=arc-20160816;
        b=Ze3SamXMY0MnSpMUZffzr0RoLRddEKVciOSyIQkRiCSpcTjykCYfmUrr6ag36VTEpw
         pKYQW1IvVznwPnPPZ4UMd+al6mEt+98N5APcIcMuT0FCZuPE8iCqbdzHGXsuFGVhtBBX
         57MERW8/Rgqo3mR8sjJi8oECQXTVfHP+vk33O9rWudNAhv025ubyXTV1LPtsD0rXOIX3
         XwH6cKVKr255sEctGtBLndMYGEKF5v/pzkfw4laIKRTvLtNAn+bdITSXjAR4veECCjei
         dlPej4sUsLD1MLLkcTnyyNqkyoMb33E3pvvs9NXVyPz3+hTb+mqF4j7H5QDer/4+nBbM
         WG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=J2z9Gk4CCpSkRNlPczFduG0xvLJTihuwXtdSxJyNrMw=;
        b=L4DbK/D75axmgKbspoTAQAcqcahqZX2ex+ITbHZo0xjMnlSqwKfP6HqH6hHTHbZl/W
         TLCgrVIYN9QDm0a2wwe0v5fVvuuhvkcV+CwgUF+WPYxztGrgx0aX48iHpcEYznJIGeYN
         e0iaI84N85BTkfhZaEVLJvyhb/RPxj0h1DDMmkv7x+HxMmyWsx/jOaR1ks85GwcilVTg
         ELEiNvd+LvNNvO72kz4PeVHHl2MNlHqhIdXsuUOlRnxM7zYveqPOFmF+gWfr9u1WD0MD
         9mge+BAt5j+RccOoNNCV3ZsIiVnBaj/VUbBibiASL2eTancRwtKdwfzAY2/Hw5liZp2x
         UAWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x77si421466ybe.306.2020.12.08.18.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 18:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmpfU-0000c7-O2
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 21:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kmpfH-0000bw-JV; Tue, 08 Dec 2020 21:57:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kmpfF-0002ka-2U; Tue, 08 Dec 2020 21:57:15 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrMBg6Wc6zhpdK;
 Wed,  9 Dec 2020 10:56:27 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 10:56:50 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] bugfix: hostmem: Free host_nodes list right after visited
Date: Wed, 9 Dec 2020 10:56:48 +0800
Message-ID: <20201209025648.23068-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, alex.chen@huawei.com, qemu-arm@nongnu.org,
 kuhn.chenqun@huawei.com, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMAJcfA2dge/

In host_memory_backend_get_host_nodes, we build host_nodes
list and output it to v (a StringOutputVisitor) but forget
to free the list. This fixes the memory leak.

The memory leak stack:

==qemu-kvm==209357==ERROR: LeakSanitizer: detected memory leaks
Direct leak of 32 byte(s) in 2 object(s) allocated from:
  #0 0xfffe430e3393 in __interceptor_calloc (/lib64/libasan.so.4+0xd3393)  ??:?
  #1 0xfffe41d58b9b in g_malloc0 (/lib64/libglib-2.0.so.0+0x58b9b)  ??:?
  #2 0xaaac0cdb6e43 (/usr/libexec/qemu-kvm+0xe16e43)  backends/hostmem.c:94
  #3 0xaaac0d2edf83 (/usr/libexec/qemu-kvm+0x134df83) qom/object.c:1478
  #4 0xaaac0c976513 (/usr/libexec/qemu-kvm+0x9d6513)  hw/core/machine-qmp-cmds.c:312
  #5 0xaaac0d2e980b (/usr/libexec/qemu-kvm+0x134980b) qom/object.c:1001
  #6 0xaaac0c97779b (/usr/libexec/qemu-kvm+0x9d779b)  hw/core/machine-qmp-cmds.c:328 (discriminator 1)
  #7 0xaaac0d26ed3f (/usr/libexec/qemu-kvm+0x12ced3f) qapi/qapi-commands-machine.c:327
  #8 0xaaac0d43d647 (/usr/libexec/qemu-kvm+0x149d647) qapi/qmp-dispatch.c:147
  #9 0xaaac0d21f74b (/usr/libexec/qemu-kvm+0x127f74b) monitor/qmp.c:120
  #10 0xaaac0d22074b (/usr/libexec/qemu-kvm+0x128074b) monitor/qmp.c:209 (discriminator 4)
  #11 0xaaac0d4daefb (/usr/libexec/qemu-kvm+0x153aefb) util/async.c:117
  #12 0xaaac0d4e30fb (/usr/libexec/qemu-kvm+0x15430fb) util/aio-posix.c:459
  #13 0xaaac0d4dac8f (/usr/libexec/qemu-kvm+0x153ac8f) util/async.c:268
  #14 0xfffe41d52a6b in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x52a6b)  ??:?
  #15 0xaaac0d4e0e97 (/usr/libexec/qemu-kvm+0x1540e97)  util/main-loop.c:218
  #16 0xaaac0cd9bfa7 (/usr/libexec/qemu-kvm+0xdfbfa7)  vl.c:1791
  #17 0xaaac0c823bc3 (/usr/libexec/qemu-kvm+0x883bc3)  vl.c:4473
  #18 0xfffe40ab3ebf in __libc_start_main (/lib64/libc.so.6+0x23ebf)  ??:?
  #19 0xaaac0c82ed5f (/usr/libexec/qemu-kvm+0x88ed5f)  ??:?
SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).

Fixes: 4cf1b76bf1e2 (hostmem: add properties for NUMA memory policy)
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 backends/hostmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 4bde00e8e7..9f9ac95edd 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -105,6 +105,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
 
 ret:
     visit_type_uint16List(v, name, &host_nodes, errp);
+    qapi_free_uint16List(host_nodes);
 }
 
 static void
-- 
2.23.0

