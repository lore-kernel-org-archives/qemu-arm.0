Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp986711ejc;
        Wed, 27 Dec 2023 07:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi2oN1jhkK/s3sIcaWD15tDGHVOxxvM8liyfcEi//hzvIsw4E7WTPDp3CTbgwl+dM2VfcY
X-Received: by 2002:a05:6122:2194:b0:4b2:c554:ccfe with SMTP id j20-20020a056122219400b004b2c554ccfemr5262759vkd.10.1703689628267;
        Wed, 27 Dec 2023 07:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703689628; cv=none;
        d=google.com; s=arc-20160816;
        b=g5oY7vKk6sZi66KT6ZFHZsZ9zIbkPmctB4GCPKOb0O573TZzKRZTlVJvEwyfoHwmLA
         hu23O2Me1bodpUt3Ri8nR4cUp6Ggbe1yLeCmeqwrW+IDUtRtrTP7RUgGfz4Ww9BYhXkQ
         9Yr0ETNMKUuHvRUiX2yTjgkEZ5Xnv9l3LbGdcGuuh3QuquagOX58x2DcxqEfss6vX7TL
         ic4UhqvtsFjx8fUaRlGkIAfqM9HlEGkvOQ+aIr9wNVEFmhQBtl1O2hJkc1lSnjIGFaBz
         9eyjbJPiesGZuar/sVCqcr5QYl5L3O4PeVm0g23R6TxJ2IVxzqyBDETmv/FbodKS4eNn
         52GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=SZWDiHGmKERzKhBumVmZnws4wjt4lR+ejbstAPfVUm0=;
        fh=iM4eT6SjkA5S3V4viqiCHRKuUn9O1etLzvxf9PuHi+o=;
        b=tKiVz4AF7OK9F5LV397YzqrYZVWP+0TU5UWXN9hECt5dpIPmS8OsNSVZMVd+oeLMCs
         YyhMrDZL0ziQtZ4bIPZ7sB35c7gZN2iat4Hit08FnppBx9GuRxjim5v5KamCR+BCldH5
         UicIpnmBDjgeUya69/ajmy4bWoeo0fzoSgZxZuunDrrhD3YlMi7oQzhfHyxQBCPORe4s
         WGxccBVdC1YJcD8Uk0g0yH+Jze5IhV5rnw6UDYfT4b2GF4Fl8jIecxxcq7pV3Mmlgczz
         9GDXveNMBvG0bqdibQX53YwrsOBLz2XP6X4RIoQxeiDatxewpmZUz1XQ49Dx0eDp3qE7
         MYIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020a05612208d500b004b6dbbf9ce5si2283547vkg.313.2023.12.27.07.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 07:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIVUa-0007WX-Ru; Wed, 27 Dec 2023 10:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rIShh-0002Hs-DW; Wed, 27 Dec 2023 07:08:06 -0500
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rIShe-0006Pg-Cu; Wed, 27 Dec 2023 07:08:04 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXnwuZE4xl5b1lAg--.30641S2;
 Wed, 27 Dec 2023 20:07:53 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDX+OWSE4xldrYAAA--.2783S5;
 Wed, 27 Dec 2023 20:07:49 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, chenbaozi@phytium.com.cn,
 xiongyining1480 <xiongyining1480@phytium.com.cn>
Subject: [PATCH 2/2] hw/arm/sbsa-ref: Add cpu-map to device tree
Date: Wed, 27 Dec 2023 12:07:22 +0000
Message-Id: <20231227120722.1683361-3-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
References: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwDX+OWSE4xldrYAAA--.2783S5
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAGBmWLKugHfQAAsX
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7AF13Cr1kAw17KF1UWw4UArb_yoW8Cr17pw
 4UJF1YgrW5CrnFvayfWa42gFyFgw1rXw4UXw47KayFywnrG34fXFyIyF90kr18Jry2gFya
 krn8CFyFga4UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Dec 2023 10:06:43 -0500
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
X-TUID: DM7i+Mg8K4xF

From: xiongyining1480 <xiongyining1480@phytium.com.cn>

Support CPU topology description through device tree.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
---
 hw/arm/sbsa-ref.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e6cd612bc5..a3c851148a 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -283,10 +283,45 @@ static void create_fdt(SBSAMachineState *sms)
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
+        qemu_fdt_setprop_cell(sms->fdt, nodename, "phandle",
+                        qemu_fdt_alloc_phandle(sms->fdt));
+
         g_free(nodename);
     }
 
+
     sbsa_fdt_add_gic_node(sms);
+
+    /*
+     * Add vCPU topology description through fdt node cpu-map.
+     */
+    qemu_fdt_add_subnode(sms->fdt, "/cpus/cpu-map");
+
+    for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
+        char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
+        char *map_path;
+
+        if (ms->smp.threads > 1) {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
+                cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
+                (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
+                (cpu / ms->smp.threads) % ms->smp.cores,
+                cpu % ms->smp.threads);
+        } else {
+            map_path = g_strdup_printf(
+                "/cpus/cpu-map/socket%d/cluster%d/core%d",
+                cpu / (ms->smp.clusters * ms->smp.cores),
+                (cpu / ms->smp.cores) % ms->smp.clusters,
+                cpu % ms->smp.cores);
+        }
+        qemu_fdt_add_path(sms->fdt, map_path);
+        qemu_fdt_setprop_phandle(sms->fdt, map_path, "cpu", cpu_path);
+
+        g_free(map_path);
+        g_free(cpu_path);
+    }
+
 }
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
-- 
2.34.1

