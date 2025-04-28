Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5888691njd;
        Mon, 28 Apr 2025 04:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXp1xf+JUQu5qB1/4WOT4QF6t3JPiQyF5AxbNeFsBoEayokFS69E9fpqJ61FCx3ep3tw0JdcoXYDo84ig==@linaro.org
X-Google-Smtp-Source: AGHT+IHy6QNr2RK6pwfkW0bzA3DnDtAR3qRwy+mmgGxWpa7zwcMDTu4jeuaqwx7L3LyT8+RMHVx5
X-Received: by 2002:ac8:59d3:0:b0:47a:e70c:e1ad with SMTP id d75a77b69052e-48131038f53mr149797061cf.1.1745838520254;
        Mon, 28 Apr 2025 04:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745838520; cv=none;
        d=google.com; s=arc-20240605;
        b=DWdQYIYn8kVGN/A6MAFh0VmchC+pQ2zj6mj21G1gRfOP1ugLVTwe6WNDQsYetUIOMQ
         3U5os/7Uja0QnLOPqdpKOkYAP7/7w4VUQt6bm3HBNBfuXMgLKZbekd6Wei8Z7fkzA8Uh
         SytxcdFlMKZTEG+zzkXnWdqyaj69OiH3KE/E2oiYQDqvovo8D5+4/qDDtJ7M5YzhBDBT
         hJ8OrUz8XmRwDcuBSBFqRyhUc2kDfDnzUZYcVeJH6jVS3mP6Ehr8UozDLX0Jp3NMR9W2
         u9KBNCE9zG9T+Fs10boOpkm9bAoEZw/F32qIPl7H89UdHuDXBd26Wn8inuX0S4df7953
         RiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=c+qL0sTrMB26zTdxkAOihmV73h9govN806MgC8wuFIg=;
        fh=4I6C6M6UnjJSR8ua+77IMjq+L7KY+8Gqk52ai7dLWhQ=;
        b=j8CZJXWAQzCcYyMMQ4dIg1SrFXYSfhKbqlV40+uiNo9iinD1UW2VLYsNX0SnV1AwS7
         fQcdyv+FVnU9I+XFXLKKZqcaGLu0vJ5N5oGopSNKlAeONRNRhroUchaMzIFA1c/y82vR
         YZfKal8xEScFQImWP7JyXfG8W653SmGq68gt8+AjzjVNkhFJyEMK7BK9heT2lLNVaFNI
         p2cLN+jRXWyF2EEzXCE6Hlj6rPn0hhXRS3ZwdkvSqa7aZ63ofr6GxwkvOk4dnt79/gU1
         xp8lf6B9E2xOJL856kDbb/x87Porc2BbDMX6UvzioGruMFLRDIRaL3ytMQ29ivptjBv3
         3C8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9fa9b45asi106046401cf.177.2025.04.28.04.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 04:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9MLi-000445-T4; Mon, 28 Apr 2025 07:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u9MLf-0003z3-4q; Mon, 28 Apr 2025 07:08:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u9MLd-0001Vk-Ho; Mon, 28 Apr 2025 07:08:30 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZmLDV19fPz6M4kh;
 Mon, 28 Apr 2025 19:04:10 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 2532A1402EF;
 Mon, 28 Apr 2025 19:08:27 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Apr 2025 13:08:26 +0200
To: <qemu-devel@nongnu.org>
CC: <philmd@linaro.org>, <alireza.sanaee@huawei.com>, <anisinha@redhat.com>,
 <armbru@redhat.com>, <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>,
 <eric.auger@redhat.com>, <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, 
 <imammedo@redhat.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v10 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Mon, 28 Apr 2025 12:07:49 +0100
Message-ID: <20250428110754.48-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428110754.48-1-alireza.sanaee@huawei.com>
References: <20250428110754.48-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q1OrwtuLlFt/

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 29ab0ac79da9..1405506594c2 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1086,6 +1086,19 @@ void aarch64_max_tcg_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
+    /*
+     * Expanded cache set
+     */
+    cpu->clidr = 0x8200123; /* 4 4 3 in 3 bit fields */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    /* 1MB L2 unified cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
+    /* 2MB L3 unified cache */
+    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
+
     /*
      * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
      * to because we started with aarch64_a57_initfn(). A 'max' CPU might
-- 
2.34.1

