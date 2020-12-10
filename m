Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5670474lfb;
        Wed, 9 Dec 2020 23:53:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfx3UUYrOC0o6sSWaIK8QOWcAzG/EeJPVRsbNqpJ2dLXfyU9+OOyAJy3LbeMl25VjwZ1fg
X-Received: by 2002:a25:2e07:: with SMTP id u7mr256427ybu.393.1607586800982;
        Wed, 09 Dec 2020 23:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607586800; cv=none;
        d=google.com; s=arc-20160816;
        b=WarGoeKw19gkQuxkOPYS/G0kuNXk6rgxwwUswcZG2HNFe51te5CEexPNGLMpCots2v
         vFcrazWIQYWs2Qe+xnKACJB2YQBJyLVrCRreMxuZb79NklgPPItMmzznnpIXFsyYBRXt
         lHWAXqtsMJNuAZKsZdSILvyf9viG9Sr95QHIOnJP5zpOXvXfbNlzvN2WFCIRraXIUWZM
         R0sdz5mGr9kJufHeg5da5fwiQfeecgS6O5NE2K3PICV+nXRJuDhwjEvtl7J+9pLCAj/c
         Xg3EI2M5yYechspMP8TlG17dd6Ehvs6huRrNYyBi2VzIeBAV5mEnwQgsxWGOSqYYbY/k
         Arcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=SVPMv1t7JXnRZNxpzMb8/JwFSGAYB65lrPR0RkuTRLM=;
        b=PFQoUBlI4qPRl0hdGKIRD/dBEoofRQJNAidAPHEUt19Edl17RlGiLz4lOmagJn2vFG
         HgD3oiNFMV+tTSAZOCw1WAsn/tKrbSxZ26CWmRvg6clcDfTxzGa9aucS3ZV2vOvay/SR
         gVQdvMUmtOdwgDSPlGOpX6j8M+dkvkZcErpOVvJMaIyFMIye9FARykjZyw28DlgtXEQi
         7KXdTKH2DlvMt4UNlCHc/ZLSRX99ZS9Xmx4eSf0r9eWUbp4d1+iQBV6lEs0gp79t1lgK
         ONuOggqf+DW08MjXX+6+Azg2JPGXfEpE9PbRTLEO+QSWR+V5ItYys8n+AduCEyP64E6i
         XpZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si4296830ybt.221.2020.12.09.23.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 23:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knGlM-0004Vi-Ep
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 02:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1knGl8-0004VA-Lf; Thu, 10 Dec 2020 02:53:06 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1knGl6-0002dH-2s; Thu, 10 Dec 2020 02:53:06 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cs5jJ3k86zknpL;
 Thu, 10 Dec 2020 15:52:04 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 15:52:39 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2] bugfix: hostmem: Free host_nodes list right after visited
Date: Thu, 10 Dec 2020 15:52:26 +0800
Message-ID: <20201210075226.20196-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: vXPeuXM/p/y1

In host_memory_backend_get_host_nodes, we build host_nodes
list and output it to v (a StringOutputVisitor) but forget
to free the list. This fixes the memory leak.

The memory leak stack:

 Direct leak of 32 byte(s) in 2 object(s) allocated from:
    #0 0xfffda30b3393 in __interceptor_calloc (/usr/lib64/libasan.so.4+0xd3393)
    #1 0xfffda1d28b9b in g_malloc0 (/usr/lib64/libglib-2.0.so.0+0x58b9b)
    #2 0xaaab05ca6e43 in host_memory_backend_get_host_nodes backends/hostmem.c:94
    #3 0xaaab061ddf83 in object_property_get_uint16List qom/object.c:1478
    #4 0xaaab05866513 in query_memdev hw/core/machine-qmp-cmds.c:312
    #5 0xaaab061d980b in do_object_child_foreach qom/object.c:1001
    #6 0xaaab0586779b in qmp_query_memdev hw/core/machine-qmp-cmds.c:328
    #7 0xaaab0615ed3f in qmp_marshal_query_memdev qapi/qapi-commands-machine.c:327
    #8 0xaaab0632d647 in do_qmp_dispatch qapi/qmp-dispatch.c:147
    #9 0xaaab0632d647 in qmp_dispatch qapi/qmp-dispatch.c:190
    #10 0xaaab0610f74b in monitor_qmp_dispatch monitor/qmp.c:120
    #11 0xaaab0611074b in monitor_qmp_bh_dispatcher monitor/qmp.c:209
    #12 0xaaab063caefb in aio_bh_poll util/async.c:117
    #13 0xaaab063d30fb in aio_dispatch util/aio-posix.c:459
    #14 0xaaab063cac8f in aio_ctx_dispatch util/async.c:268
    #15 0xfffda1d22a6b in g_main_context_dispatch (/usr/lib64/libglib-2.0.so.0+0x52a6b)
    #16 0xaaab063d0e97 in glib_pollfds_poll util/main-loop.c:218
    #17 0xaaab063d0e97 in os_host_main_loop_wait util/main-loop.c:241
    #18 0xaaab063d0e97 in main_loop_wait util/main-loop.c:517
    #19 0xaaab05c8bfa7 in main_loop /root/rpmbuild/BUILD/qemu-4.1.0/vl.c:1791
    #20 0xaaab05713bc3 in main /root/rpmbuild/BUILD/qemu-4.1.0/vl.c:4473
    #21 0xfffda0a83ebf in __libc_start_main (/usr/lib64/libc.so.6+0x23ebf)
    #22 0xaaab0571ed5f  (aarch64-softmmu/qemu-system-aarch64+0x88ed5f)
 SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).

Fixes: 4cf1b76bf1e2 (hostmem: add properties for NUMA memory policy)
Reported-by: Euler Robot <euler.robot@huawei.com>
Tested-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 backends/hostmem.c | 1 +
 1 file changed, 1 insertion(+)
---

v2:
 - Update commit message.
 - Add Chen Qun's T.b.
 - Add Igor's R.b.

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

