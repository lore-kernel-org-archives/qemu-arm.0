Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9085303lfc;
        Fri, 19 Feb 2021 07:00:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzc+cl/q4fU8+9Mdob06bMesfjlTGq2ksivLa5AAhxqX9hv1NZJuGWtJKQE0U9VWQ9/yQ4y
X-Received: by 2002:a25:c943:: with SMTP id z64mr14845883ybf.73.1613746831257;
        Fri, 19 Feb 2021 07:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613746831; cv=none;
        d=google.com; s=arc-20160816;
        b=pyaNv2ljqrcV0DebtvY2GizD/QYCIQv0tKlsPb54cwyN2mpEsHCFxak4rVnqT4j+JV
         Gnwr+qfVGAWxeXvEA7y9LOG0J4/O9VMQ2S8F8FXhc4K36AZHU0RG7dV9KvsT9ZinFsp4
         uYMPCE3LKER+Iw9ZoElWhilIgfDBivdUuW7oFNXinhwN+dMQebz20ZyGkzdV93qopJff
         LfdlR9oJTDsSCCgpkrva7+8pP7PpZ0gAOw9LyGrjbV/jeFM28pMz6p+eMqhOgyxpTcWW
         WUKo2sKJkF31FHj8UJwMAjEgqMFMLinJpn9DWSajvQXW36QprcUZZNO+gN0hf+Pu398Z
         0E8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TmDv8Ark28Kk9q6F5pp4r3C2pFWL+y0OiDgJ+fBRPtM=;
        b=Ee+2EGmRVq2HFOBnP9JOpa/KPh1bRS9HfH/HWi5e0tOPChuSwp6NVnquX5f0SdRmY8
         bWCC4Xak25TUHob2dX9ij47WYPHsmbEuyS3txU8np0y87/nOEarq/HygSGO/wNeA0+sI
         BV/f8PARaIOm94t9SZLUtBltuGeOZRowM2OIjZSDy03IDDBQfZZzI0hDpn5qh9Yd6ilT
         owJHhMOdujmLLhZbdDvo7Cng1aqKyrdvK0KXPPm3xPwGNZQv8GH9iy/t7V+Mr1CpSXne
         28l5uwky2gd+kFpubV1R88ldHhh0fpXgrtT4MGfFOQa8VjD3oqueuinWRIiHP4gqYgrO
         s2dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgemUiF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k135si8914411ybf.249.2021.02.19.07.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgemUiF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Gg-0002kv-Cv
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:00:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73V-0002PR-7k
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73B-0003Ue-W5
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:46:52 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so8822944wrx.13
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TmDv8Ark28Kk9q6F5pp4r3C2pFWL+y0OiDgJ+fBRPtM=;
 b=XgemUiF3rhqVMDpiCR3mpwvvfjCgIjV/dS9mcUiHa4YtQcttLdMpwWQaM6gu3dtDac
 Go1eSgONVGMZltDUBuJryvPw3N/7jfC9K4i/+0y99GJelGfPD8axuQnJBMn7oemBXfv5
 bEfJ4QBISMtkdag9wCy6NLbSdDqqJqPCVJNrkbLxFFX3fYYygNtD0bo3ujw4qzDhQcEE
 /A1dm32oCqsW1mGQTON2Z790MBHGc4mxgTaPkkW36zpJlgDp1mlKZDE+0iedsiTpPKAP
 egSAffQZHGmpxeRKn+fTZfiYFEB3sJfgHY0jU88a9gWIerpAV3LszYzcOqMqiUvWMAzk
 Fvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmDv8Ark28Kk9q6F5pp4r3C2pFWL+y0OiDgJ+fBRPtM=;
 b=mmyO5PzsGjT1044Lk+r99V+uiPTnI14pEKzMRgJPzvfx83+n4w9B6tlUIolQ083rAE
 AJRBurTWXpMIjM/B/33cxR0W6R/Y87jywjvoaIPKp4YEy+575IBtMRlCi6y+INTlEeZM
 dtd1pklTkFvdUkUxgdmW4Ej7sxdEFiEumDInpO/aeVis5IUsu/yYHDlw/Do+ARDQZWsP
 2fyUpzSS4qJRRR+wqIELoOp/vT6k3tPVpWCZEdQK5sE6UEgiDy3EKjyCWs0XZd5ZRhQy
 fll+jKo4DxP6KpXGwvGeDEtNQAXtxuR7SqH5UBTLtkSMJ85FNb4Ac8rJ6imlrx4gwINO
 tibQ==
X-Gm-Message-State: AOAM531WGidA+NUP/fcfPPU7HinRvu0R/JX5TAlUIbDs8LFVyr64Aly2
 D+SZ72i6Axx3H+ryLIttOKZ519Lgt64Uow==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr9264896wrb.180.1613745992570;
 Fri, 19 Feb 2021 06:46:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/44] hw/misc/iotkit-sysctl: Implement dummy version of
 SSE-300 PWRCTRL register
Date: Fri, 19 Feb 2021 14:45:49 +0000
Message-Id: <20210219144617.4782-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cbKTR7/X9FMm

The SSE-300 has a new PWRCTRL register at offset 0x1fc (previously
reserved). This register controls accessibility of some registers
in the Power Policy Units (PPUs). Since QEMU doesn't implement
the PPUs, we don't need to implement any real behaviour for this
register, so we just handle the UNLOCK bit which controls whether
writes to the register itself are permitted and otherwise make it
be reads-as-written.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysctl.h |  1 +
 hw/misc/iotkit-sysctl.c         | 52 +++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 980c2ddfd3c..8859b15d73b 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -53,6 +53,7 @@ struct IoTKitSysCtl {
     uint32_t initsvtor1;
     uint32_t nmi_enable;
     uint32_t ewctrl;
+    uint32_t pwrctrl;
     uint32_t pdcm_pd_sys_sense;
     uint32_t pdcm_pd_sram0_sense;
     uint32_t pdcm_pd_sram1_sense;
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index ab97055f529..e8255d26b5a 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -51,6 +51,9 @@ REG32(CPUWAIT, 0x118)
 REG32(NMI_ENABLE, 0x11c) /* BUSWAIT in IoTKit */
 REG32(WICCTRL, 0x120)
 REG32(EWCTRL, 0x124)
+REG32(PWRCTRL, 0x1fc)
+    FIELD(PWRCTRL, PPU_ACCESS_UNLOCK, 0, 1)
+    FIELD(PWRCTRL, PPU_ACCESS_FILTER, 1, 1)
 REG32(PDCM_PD_SYS_SENSE, 0x200)
 REG32(PDCM_PD_SRAM0_SENSE, 0x20c)
 REG32(PDCM_PD_SRAM1_SENSE, 0x210)
@@ -232,6 +235,18 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
             g_assert_not_reached();
         }
         break;
+    case A_PWRCTRL:
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            goto bad_offset;
+        case ARMSSE_SSE300:
+            r = s->pwrctrl;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     case A_PDCM_PD_SYS_SENSE:
         switch (s->sse_version) {
         case ARMSSE_IOTKIT:
@@ -507,6 +522,23 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             g_assert_not_reached();
         }
         break;
+    case A_PWRCTRL:
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            goto bad_offset;
+        case ARMSSE_SSE300:
+            if (!(s->pwrctrl & R_PWRCTRL_PPU_ACCESS_UNLOCK_MASK)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "IoTKit PWRCTRL write when register locked\n");
+                break;
+            }
+            s->pwrctrl = value;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     case A_PDCM_PD_SYS_SENSE:
         switch (s->sse_version) {
         case ARMSSE_IOTKIT:
@@ -634,6 +666,7 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->clock_force = 0;
     s->nmi_enable = 0;
     s->ewctrl = 0;
+    s->pwrctrl = 0x3;
     s->pdcm_pd_sys_sense = 0x7f;
     s->pdcm_pd_sram0_sense = 0;
     s->pdcm_pd_sram1_sense = 0;
@@ -661,6 +694,24 @@ static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static bool sse300_needed(void *opaque)
+{
+    IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
+
+    return s->sse_version == ARMSSE_SSE300;
+}
+
+static const VMStateDescription iotkit_sysctl_sse300_vmstate = {
+    .name = "iotkit-sysctl/sse-300",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = sse300_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(pwrctrl, IoTKitSysCtl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool sse200_needed(void *opaque)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(opaque);
@@ -705,6 +756,7 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
     },
     .subsections = (const VMStateDescription*[]) {
         &iotkit_sysctl_sse200_vmstate,
+        &iotkit_sysctl_sse300_vmstate,
         NULL
     }
 };
-- 
2.20.1

