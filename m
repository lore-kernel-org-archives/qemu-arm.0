Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2796710lfq;
        Mon, 14 Sep 2020 20:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx70r9jm8v3cc2TPVUHE0R6437vq6Oc5xviDjQHGlHWPIpsELJj7QCY6QNvG8TiPRj20xs3
X-Received: by 2002:a0c:e78c:: with SMTP id x12mr15901614qvn.3.1600139677435;
        Mon, 14 Sep 2020 20:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139677; cv=none;
        d=google.com; s=arc-20160816;
        b=Aox26JyuBdQkuwxH2LobAH6C2MhvTPEwB6+By6EvKqVxFBXETp/htAmCB+VJzsIdEE
         meyTtcbnv3/meY3gWYPInAR/vfyn/GD/O5HnbUCcv9JExfP2uBVCrQkwaajW300B3SwT
         Aw3d+Uh3GBu2V/phdRmfOPb5G+enZjQvo4mSuHR5CvBHUgP1ylL2DtRmhoqwxE0+H3TY
         N/cuYsGxwxJScdP9pKhjAy4kqsA3ivNxG5Pm/Kwe0IwiZA2UlVC58ytglUNrjdh0UtQv
         40kPrMTdLkMNnIwmvfv8zC8KUZ4uL0ihJlm9XpzYjxKWykxTU45dcRgfaHyl6sjG4djj
         zwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9QKIG2CP5FsAJO1K1yLLKcM8WhKJpvUJh/YJzIciQaE=;
        b=edS6NVV9an4gEyvEd9eivokYUb/LLkbfAfYBjmEbotYu0siA/cm4h9M5RCM6McJ16X
         y/erBgxgHRBqyC4wpeikzF07bMvmve+TwHc8qaqPrlCU8rbim82sBfIrygsioSGjeWTg
         4bCAMnn4b4BqduQtSR2tH9xepQPeNevzibEQk4gM4eAMNk/ONcnF5dopb0gSsMkKQuqv
         /6Rpd7XSzt5xJX2jOnDkszmmScAw7cKWOVYxedJVSpHppvApXiTR50oCvZ3fRWBa/QSR
         x/mLtjDXE6csjx4el3f1bHrW2JCAyj47WL5gg/k/xFWy8C32RVkdul3GReugCXUMun8k
         NuKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lReM+xXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f193si8093673qke.9.2020.09.14.20.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lReM+xXe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1QS-0004BY-Om
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O8-0000Gu-Iv
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1O6-0001h3-54
 for qemu-arm@nongnu.org; Mon, 14 Sep 2020 23:12:12 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c196so1146057pfc.0
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2020 20:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QKIG2CP5FsAJO1K1yLLKcM8WhKJpvUJh/YJzIciQaE=;
 b=lReM+xXelGsNPF4vWL0t5TX+kwVrfj1L95xQ0vopMAc4L0dPqxD7n6zkpBUwiV/Dz3
 22euqP3i6uymqRzuL3XM1y/J5AfJDdY15Bx7nmzor2pTp1fd/bOFSm3Ei8hZs1SN+pbB
 iVcRL/FbS7DT+dhaFvy6SfnWXrp+s2UZRlA+rZnGvd+GJ3IXM2pTPCJbZltuRHDouEBm
 M8hL1vF4+al0ND+0T0vP/yjpM9Blpwkp9wXUnYYbCJD2JqxUHE0h3Xt1m/95xyCWuz+f
 Ifiit+RPZYHGPrL6MnXkCODG1XsNnoti8rMfNa3GpTrQhn275mxR+7o7DNGJ2//FEBeo
 6kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QKIG2CP5FsAJO1K1yLLKcM8WhKJpvUJh/YJzIciQaE=;
 b=gSnmU7O9Iw/nxcOHaX45lIj+KFWNLe/C+cyfuGuJKz+VyhjzbMcGyoc/exB0JQJXzm
 2UbsCOHGDM1/IARc4bF+VGiSUS/9I6adDIxi77sqbs6cdmkZA4iY1zuUlKfKCnr8vLup
 T7WTePLOdFe193lvq9n9WceuzQ/SyWp6/LWON2l2dYa5IniiHDz0aIZBLhYBH+kExiC1
 sTs5LzrqDIFh2+hltHswun+iVl2MOkEb1eFYDuMoxuCqH4tM9ta2VHxxdIzDpNKE7Wu/
 xgHnbAVfsVsFSchUsKNhAhe1kS0NDbJpH8SCfzx//YO8GlWOJ9M0ZWVxn2ts8LibMJf2
 q9Vg==
X-Gm-Message-State: AOAM530+A8RUB02kvCgMXqXD7BLcQAyo5J+Yfo0dQqIPNNxi2naYtaIu
 nCon736EyA0Ou8YAMkLH0lva
X-Received: by 2002:a63:5043:: with SMTP id q3mr12880104pgl.293.1600139528926; 
 Mon, 14 Sep 2020 20:12:08 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:08 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 04/12] target/arm: spe: Only enable SPE from 5.2 compat
 machines.
Date: Tue, 15 Sep 2020 03:11:40 +0000
Message-Id: <6d88497a83105b3317bb39ce26d763b729a426eb.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zp6+ScsB8Qxj

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c         | 7 +++++++
 include/hw/arm/virt.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acf9bfbece..3f6d26c531 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1830,6 +1830,10 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
+        if (vmc->no_spe && object_property_find(cpuobj, "spe", NULL)) {
+            object_property_set_bool(cpuobj, "spe", false, NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
@@ -2553,8 +2557,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
 
 static void virt_machine_5_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_5_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
+    vmc->no_spe = true;
 }
 DEFINE_VIRT_MACHINE(5, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dff67e1bef..72c269aaa5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -126,6 +126,7 @@ typedef struct {
     bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool acpi_expose_flash;
+    bool no_spe;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.17.1

