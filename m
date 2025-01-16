Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3807588njn;
        Thu, 16 Jan 2025 07:00:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVgXdFmljLw8L6h7bQX61OEyc3sNfBsNSAr1GeyufqxbLP1sXjqwR7sFPCAnI8wK5eGu9MCCvrMFS36w==@linaro.org
X-Google-Smtp-Source: AGHT+IGUrBIz7tpiNRxuPVLvc7wSIrSWn3Q32Rgd4Sl0lhvnetLOzdwSyCGIftPQBwB7oT6Eqqlq
X-Received: by 2002:a05:6122:3d03:b0:519:fcf2:ef51 with SMTP id 71dfb90a1353d-51c6c46d008mr27214074e0c.5.1737039653260;
        Thu, 16 Jan 2025 07:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039653; cv=none;
        d=google.com; s=arc-20240605;
        b=gsyqeZP09JrU0xcY8A5j16wMiaTZejuE4WBu3mqRVPnUVlPu32bjNZGJyPmkWu3Mw9
         QYWklgFVqyquJoJynel+JQJd/LVbOR51umCaZLF3IiWMQ3wPbcprpAPqVKRrMwi9m3Io
         1DO5JCZUrdz42rCKlDJDHXssXQu66iXFxdp1WWnjz3JtyM4Mz2Ic2gu/Myiy/YfQz14w
         UBoDgTIJAi0jl5zG9ElP//DE8JgCDJuRwQmgEdOxMnseyAFLBwp9jmJ1iUaKetu1k9h+
         lpp+QP+WRkLIvM0b6me2jAjKwy+HUGY0moLhfpqPJLng0FslAf66yrtN5aKzvleSA1B2
         jGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JgiFcB97yHnaap/C1gN2qw1BdcOfgw1ZCK0YAaOeFGA=;
        fh=G5R5TwbLpwRGS0kbI5d6zQgDDYC83cGSFDmvlsSHW00=;
        b=e79dc0IAEmQY3Jtk4XvyUchaavGoypsNiQlJDWbQ9JXucNMglHG3wlGWsgvoc5++F9
         NxNMU5wKJ27NCn2ve4Tw13cupWV78mZajVmR+gdl6ROad/LBXu6U9hxnX3s1Tcnfi5oc
         1ixBwcyrYOPPEaHE2qw7AphZhvJVbFdFeDzRJCgc8scuYZkFdJalUQAbN5PUpitKtZpg
         3da8yThMMuP+ncKT6Hn+ZscecZTxf3zGoeYo5tiHtr7zfTVUoPApD28jFrjOl+gNeRHk
         XHpYY72FywzO1Oo+1k907gCMdhe4FiAXKs95HPSPscwPjdmuQ8gaRH2B2MQ8/4XrxBQ+
         sZyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GRGjilp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51cf559f3e9si89420e0c.91.2025.01.16.07.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GRGjilp1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRLr-00021U-D0; Thu, 16 Jan 2025 10:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLo-00020t-Vm
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:05 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLn-0008Jc-4B
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so10440155e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 07:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039601; x=1737644401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgiFcB97yHnaap/C1gN2qw1BdcOfgw1ZCK0YAaOeFGA=;
 b=GRGjilp1VvdmSymeJGJXIcOYvIuUq4c7Y2sZOQX+4vccRzWxJtn4NRujgAQvMJVa2N
 +L1h6A3YZT7Xixy30SAYrU0ESXb6og/2sznDp/ugK1Huf0ZwZOpUqIMXVEZS2tcpobzb
 GkDHpMxtoMW+afQz9mqd6i3R3N+OS9eh0puplZIVCQVjAQUVQMQMISRiccVc98VOZtcg
 zIzA8RbD1yy4CCNdeqUb+CtolNzYtb4Y00wZtpBCXUxkVfqC0mUjNeOtlNn2Gjmd2O6N
 t4v77V59lYj1gqKCzt4wcDSWCbK0HHHnMvfn+DVJNUP+9a+bJcHnasmMTga7qrDLszvv
 wplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039601; x=1737644401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgiFcB97yHnaap/C1gN2qw1BdcOfgw1ZCK0YAaOeFGA=;
 b=D6Kt3p+w4FiScMVyFX5wSrHKeupi2K4ho5CvKD+lsj40582ihGCc4YrG6RgEsMb7jl
 /p8yz4zOwBNLr6gufQQZ2+9zR0UEOvrQPJ9ArXd6b4Jq9AonNpRyQXyCjtDHSU7rguhN
 9N7z41/u9YHolqFM3krfEZ1/fX9J6sbDXRPVwMoN32QI/kzonONJV0e0zB3XFTBzYU4i
 qFGEo1mULjy4rccTjG02yhnFvWFTQWJi29DkTInVQFHL27tjA8V5sZiJmkpI7cvUICsG
 N5sDUI7Rg3jmnTkRrsQMVoztDipcMw9DUciB+inLFhDn70WH+LhWO6Pxi7Td0CRDAME2
 3ptA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrpc4FSCYAjsJRk0Tqi3bcnCBXSx7o3SdTINi5iDLfNwL/fQMF0qjrH1Qn7z5BuFJcYXJug5CTbw==@nongnu.org
X-Gm-Message-State: AOJu0YzeEapthZTMD3RDeRzEsLTDHxUk974Umzpp2S9lMkpSWfx7CSgX
 yMlTVzHAa/AfeOxDUGHi5iBIiWJTmI2krIdJyt/DFYxlm23qqEUE0i1V2eb5BSf80vd7i8MqR4Z
 KbfY=
X-Gm-Gg: ASbGncvdZEybwqx35o4fpcULwbwWBPU8spcSQShE/rBZNOehwCyUuwdCGHZctTX+siW
 HnTfx2U9/e+hSNPbCUBV4HbgGSxaCr5hU+QphPk6PLQ+T91bSGQl9O6v/dr3iF5HQFKa5y+U0mf
 yFDVW2us4UVqEZeDqgulKVT+H0utU3/ETyT4/bqTGtkdEdRDwKYUSal1QLxbmZVJp5M53/Kknzc
 /zJd5ayozkGwy6SX79yNwtu835xsVBrxYV0BTav6upR8fSYBPvv9xdKgtD0IIBGFXB0jCoF2WpW
 79Fu2j8H7Nlxj623Qrocl/8aF9sy9t0=
X-Received: by 2002:a05:600c:1987:b0:434:fddf:5c0c with SMTP id
 5b1f17b1804b1-436e2679e05mr321645785e9.4.1737039601405; 
 Thu, 16 Jan 2025 07:00:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322a414sm84377f8f.47.2025.01.16.07.00.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 07:00:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 03/13] hw/arm/virt: Remove
 VirtMachineClass::disallow_affinity_adjustment
Date: Thu, 16 Jan 2025 15:59:34 +0100
Message-ID: <20250116145944.38028-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZOv/e/QPEAAb

The VirtMachineClass::disallow_affinity_adjustment
field was only used by virt-2.6 machine, which got
removed. Remove it and simplify virt_cpu_mp_affinity().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h |  1 -
 hw/arm/virt.c         | 30 +++++++++++++++---------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 27c5bb585cb..5d3b25509ff 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -117,7 +117,6 @@ typedef enum VirtGICType {
 
 struct VirtMachineClass {
     MachineClass parent;
-    bool disallow_affinity_adjustment;
     bool no_its;
     bool no_tcg_its;
     bool claim_edge_triggered_timers;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0080577e1a9..53f4a96e517 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1759,24 +1759,24 @@ void virt_machine_done(Notifier *notifier, void *data)
 
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 {
-    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
+    uint8_t clustersz;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
-    if (!vmc->disallow_affinity_adjustment) {
-        /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
-         * GIC's target-list limitations. 32-bit KVM hosts currently
-         * always create clusters of 4 CPUs, but that is expected to
-         * change when they gain support for gicv3. When KVM is enabled
-         * it will override the changes we make here, therefore our
-         * purposes are to make TCG consistent (with 64-bit KVM hosts)
-         * and to improve SGI efficiency.
-         */
-        if (vms->gic_version == VIRT_GIC_VERSION_2) {
-            clustersz = GIC_TARGETLIST_BITS;
-        } else {
-            clustersz = GICV3_TARGETLIST_BITS;
-        }
+    /*
+     * Adjust MPIDR like 64-bit KVM hosts, which incorporate the
+     * GIC's target-list limitations. 32-bit KVM hosts currently
+     * always create clusters of 4 CPUs, but that is expected to
+     * change when they gain support for gicv3. When KVM is enabled
+     * it will override the changes we make here, therefore our
+     * purposes are to make TCG consistent (with 64-bit KVM hosts)
+     * and to improve SGI efficiency.
+     */
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        clustersz = GIC_TARGETLIST_BITS;
+    } else {
+        clustersz = GICV3_TARGETLIST_BITS;
     }
+
     return arm_build_mp_affinity(idx, clustersz);
 }
 
-- 
2.47.1

