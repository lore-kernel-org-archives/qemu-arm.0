Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1280934ejb;
        Thu, 25 Apr 2024 04:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsaU/1IXrO97umB7dPwzSaEfX3qc4TWcpBAqGPrfZ1z/pQNpj7CyJwf0IShwZHrshf9xXUs1ZnxebWbRLFQ9m3DTr3lN/p
X-Google-Smtp-Source: AGHT+IFBayXDN//UPzZs7RyCSXZRb5DsQaqvkivPTcqkgC8b09U+58/HYer+zBaaVRA3HO8aQEin
X-Received: by 2002:a67:fc18:0:b0:47c:e20:979e with SMTP id o24-20020a67fc18000000b0047c0e20979emr4940949vsq.22.1714043182844;
        Thu, 25 Apr 2024 04:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043182; cv=none;
        d=google.com; s=arc-20160816;
        b=gBPetyLDragy2UKQylHnr8PTdn4OopO5lYpctieUu2RJFBvkYvV7e+ZHVSkXDowSXI
         h3AiPrlpPf3BwIL3LGMou5VZM5Qau1eVYVeBGlvg0ex6bPPiCTM8eneSEcwvGabCjUKl
         4q3VHgNRBY9i7zjz/fjSuCbEG9d2yc2cPzdIAOKDw++P2YYSzeKej4YSGdx3tEGlsBhI
         3FDRwXJJT8zMFsaq8PvXb/NtEDLKKQNIwk8K0p3wVj/BZ6FFFG0b55n5kwcMltLhlyEd
         kFo8MnyiOD4l5yghRAApywcMJEIBLkCpvP3fZbIve6VXN7MvdkY86sRK+lJhg5+5a5aV
         hkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W7uwePuX3rPWTRA+fw+W1FX6Shl9Ifmx73up+GoZgb0=;
        fh=d5UiGHZNYh/a+VHJFuskRYWEkZc1UIOavJ+wE04o+kw=;
        b=CYC+LeV0ors4zRFoxkzoj625eX5MnrPps+FHu6Tu0uyh/0VKjslFLJ3nwegz080LP4
         ge1omVXmKvLtmGhUa7WWwIG5K0IDnUjaaX2qdDeC9IhNIIZ+1bkfXyz1+G5EWQ6NicYg
         G4i7Hh60mu8s7xSC26nohvbYlcXwvz5lVIInIKmeUGO20Tdhk0MmlK1ZveoSfsPvVngr
         9rMNGDttbmZY43t291Lq1b9/ylAEuv7OEhe748bIsGO7naQNM6r0wzIQizeP9KFC3fXz
         0JXpjGxX0YRx9XF58e4p7DeAcqgpknUTnS8bLv8VDwBi0bYWOKKRIdzRsJU05KgYCT4e
         0qrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFwqAPvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a05610207c200b004784418d60fsi2664362vsg.814.2024.04.25.04.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CFwqAPvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwu3-0002I1-Sw; Thu, 25 Apr 2024 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtY-0000Iw-AZ
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:04:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwtN-0000Ks-Cr
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:03:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so1817465e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714043028; x=1714647828; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7uwePuX3rPWTRA+fw+W1FX6Shl9Ifmx73up+GoZgb0=;
 b=CFwqAPvFeUPkhH4JNVmmXc9RzcanHFPge6GaaXeL2rXurKpilMQmpVqVsGz32mxv6v
 pGWBI3PACyXx3XAKNi5uBH7D6+5BAiP5Z7GNBCfu2hidZx6UDASwjZIuS7yXeEK31Zag
 F3mokBzLLIgZcEste0+Y+dV5FAVJKYp7OLNyHJPDxI54AqSPLZaT1shztRSONi7pvBDz
 fN5+Ew2IS2A/T9Rwe/CT9LPzXd/+i43LDx36X9FimFBzIzk6kAvYDI9Lfze+2tHN+03B
 IO4pYV5t/PVtQ1rKsxqZXV1IfYz+SX00FS5yACi7Nbyc0uqxVHX3o3k1xpjCWK8UiUhf
 L9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714043028; x=1714647828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7uwePuX3rPWTRA+fw+W1FX6Shl9Ifmx73up+GoZgb0=;
 b=hxtIjA5/yxiqBcprLNiLsK93gAXH5xCXGu5wvfT3gT9vnTw/S366Ei0lFQc5w9lbf4
 Ox+0hImdEMmUC0RYgO9QOssAYh/fZFVrQY0FMHBR7kZrq3mAgD+prN1V4krvSPNm4/Zo
 JX2sDRWDXPRmYo9Vj+5znbp+T7sJazotrJmU1R1JyT9iXZeNgpWnN6mGaGQmApN9eB70
 rPaIS5EOJunXxfilaj7fjR0TW3EMVgiejfeQhK5s1ZFwNAr5LMBy9bQWci/pOCX/ywmE
 jnZNwVL3vK6XbBoCvH5G35lHHHf0N81C6P+XEWpFK54Jo7VfA1njhNWetq3VHb2SRIP9
 lTOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq9o3VtH1n1XIt3WHA87HaapJFutxADQ4FY9V8n6RpXpqTUQ0aWXCjIoaBSeEIRnYwO0V/XUftt6UF1yhCIgTLez8g
X-Gm-Message-State: AOJu0YyuNrnxxhCJULjS7G8qFcFdJrsWuSFmGME81P9EJpqYlHEaBc/6
 O8y6cAqU1xfFpbmsRZt3YvFYRz/nhClf5tIpSAg9UjUdVe35P5NX0XXPlDLSzdA=
X-Received: by 2002:a05:600c:3502:b0:41a:fe41:80e4 with SMTP id
 h2-20020a05600c350200b0041afe4180e4mr3402391wmq.0.1714043027837; 
 Thu, 25 Apr 2024 04:03:47 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b0041b25a70a85sm3623801wmb.30.2024.04.25.04.03.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Babu Moger <babu.moger@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 19/22] hw/core/machine: Introduce the module as a CPU topology
 level
Date: Thu, 25 Apr 2024 13:01:52 +0200
Message-ID: <20240425110157.20328-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: e4fiG4xZ93/l

From: Zhao Liu <zhao1.liu@intel.com>

In x86, module is the topology level above core, which contains a set
of cores that share certain resources (in current products, the resource
usually includes L2 cache, as well as module scoped features and MSRs).

Though smp.clusters could also share the L2 cache resource [1], there
are following reasons that drive us to introduce the new smp.modules:

  * As the CPU topology abstraction in device tree [2], cluster supports
    nesting (though currently QEMU hasn't support that). In contrast,
    (x86) module does not support nesting.

  * Due to nesting, there is great flexibility in sharing resources
    on cluster, rather than narrowing cluster down to sharing L2 (and
    L3 tags) as the lowest topology level that contains cores.

  * Flexible nesting of cluster allows it to correspond to any level
    between the x86 package and core.

  * In Linux kernel, x86's cluster only represents the L2 cache domain
    but QEMU's smp.clusters is the CPU topology level. Linux kernel will
    also expose module level topology information in sysfs for x86. To
    avoid cluster ambiguity and keep a consistent CPU topology naming
    style with the Linux kernel, we introduce module level for x86.

The module is, in existing hardware practice, the lowest layer that
contains the core, while the cluster is able to have a higher
topological scope than the module due to its nesting.

Therefore, place the module between the cluster and the core:

    drawer/book/socket/die/cluster/module/core/thread

With the above topological hierarchy order, introduce module level
support in MachineState and MachineClass.

[1]: https://lore.kernel.org/qemu-devel/c3d68005-54e0-b8fe-8dc1-5989fe3c7e69@huawei.com/
[2]: https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-topology.txt

Suggested-by: Xiaoyao Li <xiaoyao.li@intel.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Message-ID: <20240424154929.1487382-2-zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h   | 4 ++++
 hw/core/machine-smp.c | 2 +-
 hw/core/machine.c     | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 69c1ba45cf..2fa800f11a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -144,6 +144,7 @@ typedef struct {
  *                 provided SMP configuration
  * @books_supported - whether books are supported by the machine
  * @drawers_supported - whether drawers are supported by the machine
+ * @modules_supported - whether modules are supported by the machine
  */
 typedef struct {
     bool prefer_sockets;
@@ -152,6 +153,7 @@ typedef struct {
     bool has_clusters;
     bool books_supported;
     bool drawers_supported;
+    bool modules_supported;
 } SMPCompatProps;
 
 /**
@@ -339,6 +341,7 @@ typedef struct DeviceMemoryState {
  * @sockets: the number of sockets in one book
  * @dies: the number of dies in one socket
  * @clusters: the number of clusters in one die
+ * @modules: the number of modules in one cluster
  * @cores: the number of cores in one cluster
  * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
@@ -350,6 +353,7 @@ typedef struct CpuTopology {
     unsigned int sockets;
     unsigned int dies;
     unsigned int clusters;
+    unsigned int modules;
     unsigned int cores;
     unsigned int threads;
     unsigned int max_cpus;
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 27864c9507..2e68fcfdfd 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -266,7 +266,7 @@ void machine_parse_smp_config(MachineState *ms,
 
 unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
 {
-    return ms->smp.cores * ms->smp.clusters * ms->smp.dies;
+    return ms->smp.cores * ms->smp.modules * ms->smp.clusters * ms->smp.dies;
 }
 
 unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 582c2df37a..9966641159 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1157,6 +1157,7 @@ static void machine_initfn(Object *obj)
     ms->smp.sockets = 1;
     ms->smp.dies = 1;
     ms->smp.clusters = 1;
+    ms->smp.modules = 1;
     ms->smp.cores = 1;
     ms->smp.threads = 1;
 
-- 
2.41.0

