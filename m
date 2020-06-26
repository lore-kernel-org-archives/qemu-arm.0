Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp54784lfm;
        Thu, 25 Jun 2020 20:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcXq7ksGSxKZiePYK7eP14Dpy+7F47kfOXdBx+SOiCk88BRYShUR3F4he+lzajlSbMoivp
X-Received: by 2002:a25:ba4f:: with SMTP id z15mr1722003ybj.113.1593143172808;
        Thu, 25 Jun 2020 20:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143172; cv=none;
        d=google.com; s=arc-20160816;
        b=S2QmdPifQysQrGsD9qZwiqtG4+JM6lrvTEyNPYFxzTEeAlHx+0+6vy0h3R0OnhBe+o
         ragVVtyKTLts9gArPE9EM0KV4XasFFptzXNe9JhpzyJzMB0q37Xp3u3s7x5K4Ibrd5qz
         peWiahZC5xGI1zo1UWR7mA8IRxolQw9TqB1LB4leaMzqRBmmw7RVjfX+R5EEX7hpKDNS
         Ex4bdLiIsSrx0yMiqoGtm5YYlSZhOfQ8j94DP6z1XAGkrH9wvd8DNuahZZJK1mbpz+o8
         DdET+kmpkrXgUOIbEFW0OTtPq98YqnIKo8llhcvtDvO3Po2r7GMWR2WpfG0nji0kAy8e
         VoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=e+nPcVW2JQX4kQO3F4ekVFtgJoGprqMYmF1Q9wwLqRs=;
        b=uPKJsV0QpzmOc8Kp4uwbFaiEcL+jiTv470eA6AMBmoeMTgz+L2jx+6LwEylo05Dl9T
         uiwjzd5jhOheNMMPjbl8+vqb/7MoDIhlolLrIQYudqUvZucOD/xAoAR59e5dQQao/hBD
         j/TCupQsi61rordEITXI8S1p7JtNv4F6KxLxJk7u7M1pSTb93VXcnOfa0ei08d7g4RS0
         rYEaPtDt6umFKHqNoQKG8oiATHQeCNuwmkTojWbuxY1GkrxG6BNWgEC55c3RoQ/fEunv
         2p7wcNaTSY60DeObgPooJ+sPzzXiyn3NAFCzldk5mX931RX5dCmztULp08J5Gjo3vRqD
         jOfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yVStqs2g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si25448962ybl.92.2020.06.25.20.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yVStqs2g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofJc-000129-50
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6h-0001c1-Co
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:51 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6f-00029v-DT
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:51 -0400
Received: by mail-pg1-x541.google.com with SMTP id o13so1391081pgf.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+nPcVW2JQX4kQO3F4ekVFtgJoGprqMYmF1Q9wwLqRs=;
 b=yVStqs2gip2T/sKpXtnwfx5Y0pzw4/JkymozLTUK7lRWpJhkR63YdRF4y7jSw8Oj9t
 FHXxtv+pd+YF2fAb981Wu90JmEfSFw4Xlvga+4PveTio+rsRsrnRpdbTrabyrr8lkFnk
 13sL0AOF2S3cWx5ZQxQi4FM2rk+XvzfvuaCqUnPSDh80pFdnEPWuOXBp9wg3YOaEYp9p
 HWB0S2m7d07vQMTbyvnisoN9YFy8DKVN21pQ241mTTeiHeyplVhF6Q4yqLNvSEhvinoU
 7h80SCrRdHO9FHm1bLfrVXdxhrD7ii3iInB/U2w2YvxkCresu3/Clu+OQ29d19OaR2Lo
 6koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+nPcVW2JQX4kQO3F4ekVFtgJoGprqMYmF1Q9wwLqRs=;
 b=hCZo2juJNATOPBf5zjY0jFGt8dFSlcjMF6hA5WekdzG2tr8/OQ27/o3Zd0/vqJr9XX
 SSZsf2ujve4oCa1X8akK5qWyIMT0+cQNqZBaC7kMVkUyLEDniGjjS3s98+wXphnhouGM
 5VkzONj4A4X0kjbx2ZJQxDzfHfkaFckc151zeY3f3GDUzhi9UFPSM0DhP9kHB6caUshk
 4gHmmzYhzd5Oa7QCNVkqUumFAsX3eZneZlIb9xbm6vNUQazXrt/YKmaXx3x0UI8rMQdz
 4kizAaCoZIFI4r1hOIFS5ZjRABPfAtMKVgLRp6nOPrumIJU0pRQLp+yIAll/1DGwlu0V
 HXpA==
X-Gm-Message-State: AOAM533Vc8/fy6+ugYCyDKCOX9lrghp2gTgt22byQoLt32Tob8y9z/D1
 2+h873ZeOwnJZBs57KuYbaa67w==
X-Received: by 2002:a63:af0f:: with SMTP id w15mr897900pge.363.1593142368246; 
 Thu, 25 Jun 2020 20:32:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 46/46] target/arm: Add arm,armv8.5-memtag to dtb
Date: Thu, 25 Jun 2020 20:31:44 -0700
Message-Id: <20200626033144.790098-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0eJOL0dGousG

The mte-v4 linux arm kernel development branch requires these tags.
It is still an open question as to whether they will be required
for the final commit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v9: Split from patch creating the tag memory; sort to the end
    since it's not yet certain that it's a requirement.
---
 include/hw/arm/boot.h |  3 +++
 hw/arm/boot.c         | 12 +++++++++---
 hw/arm/virt.c         |  2 ++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index ce2b48b88b..605446afe7 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -116,6 +116,9 @@ struct arm_boot_info {
      */
     bool secure_board_setup;
 
+    /* If set, all ram objects have tag memory objects. */
+    bool tag_memory;
+
     arm_endianness endianness;
 };
 
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index fef4072db1..4f96ce42fe 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -427,7 +427,7 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
 
 static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
                                uint32_t scells, hwaddr mem_len,
-                               int numa_node_id)
+                               int numa_node_id, bool tag_memory)
 {
     char *nodename;
     int ret;
@@ -446,6 +446,10 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
         ret = qemu_fdt_setprop_cell(fdt, nodename,
                                     "numa-node-id", numa_node_id);
     }
+    if (tag_memory) {
+        qemu_fdt_setprop(fdt, nodename, "arm,armv8.5-memtag", "", 0);
+    }
+
 out:
     g_free(nodename);
     return ret;
@@ -534,6 +538,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     hwaddr mem_base, mem_len;
     char **node_path;
     Error *err = NULL;
+    bool tag_memory;
 
     if (binfo->dtb_filename) {
         char *filename;
@@ -599,12 +604,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
     g_strfreev(node_path);
 
+    tag_memory = binfo->tag_memory;
     if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
         mem_base = binfo->loader_start;
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             mem_len = ms->numa_state->nodes[i].node_mem;
             rc = fdt_add_memory_node(fdt, acells, mem_base,
-                                     scells, mem_len, i);
+                                     scells, mem_len, i, tag_memory);
             if (rc < 0) {
                 fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
                         mem_base);
@@ -615,7 +621,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     } else {
         rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
-                                 scells, binfo->ram_size, -1);
+                                 scells, binfo->ram_size, -1, tag_memory);
         if (rc < 0) {
             fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
                     binfo->loader_start);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 22ce6d6199..8a4ddf13f7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1422,6 +1422,7 @@ static void create_secure_ram(VirtMachineState *vms,
 
     if (secure_tag_sysmem) {
         create_tag_ram(secure_tag_sysmem, base, size, "mach-virt.secure-tag");
+        qemu_fdt_setprop(vms->fdt, nodename, "arm,armv8.5-memtag", "", 0);
     }
 
     g_free(nodename);
@@ -1842,6 +1843,7 @@ static void machvirt_init(MachineState *machine)
          */
         if (object_property_find(cpuobj, "tag-memory", NULL)) {
             if (!tag_sysmem) {
+                vms->bootinfo.tag_memory = true;
                 tag_sysmem = g_new(MemoryRegion, 1);
                 memory_region_init(tag_sysmem, OBJECT(machine),
                                    "tag-memory", UINT64_MAX / 32);
-- 
2.25.1

