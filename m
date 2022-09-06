Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3215228ejh;
        Tue, 6 Sep 2022 15:09:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wnHeUP3owAtTnQ+LWAhtfDAIy4y0L2nTOPiYYYL6JD0S9BkLvMITKg/mMrKcrDwn7tyiA
X-Received: by 2002:a05:620a:2723:b0:6bc:5cdc:88f2 with SMTP id b35-20020a05620a272300b006bc5cdc88f2mr628488qkp.607.1662502153720;
        Tue, 06 Sep 2022 15:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662502153; cv=none;
        d=google.com; s=arc-20160816;
        b=E8CXQeuPVfMbbORtzyYfDVk/JVZLxl+l/gCtdBXsrLLzKJXotwtt48cOZT+Dimcr23
         0bfbX2jYfvgxXTXJpwBXwGT6ZuA5ZzpAIGCONes4Z/s36+CTi+z+X9eMOHfrGz9U61KU
         b2Tm+RfBsRxmTHWxNYLpbz4Y3pbM01BqYq+Imu49DuK8jQESFzEQVJ16FcAT3k19kIne
         Y+42Rb5kBBt+IKw/vYwS5by5iRpUsQPTDiQeVlx3Kla+dg1ujNsVXnr4VsGEq6959Z3f
         CpA+H65UkJ0hRnT8BYTi+y6FYU+3PYxc0K1K0yF6NgdpUfzL0aVseIS2Hxe/AHeShu0X
         88bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=/WpjcM1T0ZxvEyWW7+otoK1ODdHsnCFsOrS1b/RO8RU=;
        b=KogSHhpJpF5+SzZ1BjXvwq9uH7cmUGv5I3lSO4OjQjbr4rvzMT0I0oja78Sfc1/VbS
         cYMN7+Z6iuJnDlo0OEUO4C9cJAY30kO82fVSrxRHnNr+r+Ej3x5Pi7CgKV0L/y1Qt+Fl
         ASPoqR1YSFidKXK8nlyUrVxb5HE9P4TvTg6FrufNoZPPZk5pyMw6bzfa2J/BxG5JVXYr
         7pxCrUmJi3qGuAQN1soXhs/HjfVN05QHqtJsY29+Vunypna/eM/rmjY5ii6eIlRDfOIZ
         vDI7lvPPvWSe3/9WFF5pdLyKAYsZGJHUi8kHm45IImXBBmxeHdeGtb8JPCvuZCAzFzD/
         5qyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=GxjQkOOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ad45b8a000000b004962afa2a33si7453698qvp.351.2022.09.06.15.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 15:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=GxjQkOOA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVgkr-00013F-5h
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 18:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UsQXYwYKCFkK9KLJI7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--titusr.bounces.google.com>)
 id 1oVghz-0005Tn-5a
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 18:06:16 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a]:47994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UsQXYwYKCFkK9KLJI7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--titusr.bounces.google.com>)
 id 1oVghv-0004SR-Ry
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 18:06:14 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-31f5960500bso100165557b3.14
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date;
 bh=/WpjcM1T0ZxvEyWW7+otoK1ODdHsnCFsOrS1b/RO8RU=;
 b=GxjQkOOAfr2RuKghBsTgVmx1+q7waBkgcFt+ygKmAA+LBVmX1S4ggMkID278X1OLLl
 Stjuxyaayg4JnBEGZdco+buHYcqvO3PUb06DuGn1i82/gGyGLXHdRXDjGbLV2PJHjyL7
 LR+vA7uuL63uBGxFOR6GE6Kw3a+m8djA50o/igcOjEKiU0QBZA8iab2pVBDCd4EZJtD+
 K+EKPU/CsDukTRObetDPMmPWSdEQJYfX99ORhQbPoMCHt+jmXLsgaoJfpOvybFzEfcCv
 EesG7mMW+33utO/jhnY0lq3wUhzROlEAyxMUkssqkevPRAJATVv2FXIEh6blsJp0LhDM
 q0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=/WpjcM1T0ZxvEyWW7+otoK1ODdHsnCFsOrS1b/RO8RU=;
 b=O29yFTgHTBGoPyNvaEKbmwaIU5BMpGTe/blAMTEU/5eBJvLL8IWjbCESr82xznWtp+
 vFOFH3w1sPcIDa4KQvuXnlg0KNHmuy+r+9cQuMahQwRSY12MrKu64ZzCLVKgkLvNivmT
 TRYnghRu4Q/UhZVSl9q9dan/441IMSLaiu1QAjBrFemvhcQwyKoo9VBG7VfIz+nI5q4h
 8IjXeHLRVvJpSkLSmVSCWqiPPq8R5jmXrMeAYgf15XaloOwjLg2OPoW3VVRf18pnGvsM
 3WRyzjdqSxPN5PhQKi9cdizgt8EkAsUi4b3kNB2c8WW0IIOxbjUGjvMX4mEzycetXs5q
 fAZA==
X-Gm-Message-State: ACgBeo2cqOhQQlMgr3D8q7fuKiU78TT+i0nuC9+0ulowE3d3CBLnowdh
 hmDBXT18f00m2rIPKKvM6NjzXckV03k=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:4a57:0:b0:340:dc12:345 with SMTP id
 x84-20020a814a57000000b00340dc120345mr641455ywa.338.1662501970725; Tue, 06
 Sep 2022 15:06:10 -0700 (PDT)
Date: Tue,  6 Sep 2022 22:05:52 +0000
In-Reply-To: <20220906220552.1243998-1-titusr@google.com>
Mime-Version: 1.0
References: <20220906220552.1243998-1-titusr@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220906220552.1243998-4-titusr@google.com>
Subject: [RFC PATCH 3/3] hw/peci: add support for EndPointConfig reads
From: Titus Rwantare <titusr@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter@pjd.dev, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3UsQXYwYKCFkK9KLJI7FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wpApcMf/6tV+

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/peci/peci-client.c  | 63 ++++++++++++++++++++++++++++++++++++++++++
 hw/peci/peci-core.c    | 44 +++++++++++++++++++++++++++--
 include/hw/peci/peci.h | 23 +++++++++++++++
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/hw/peci/peci-client.c b/hw/peci/peci-client.c
index 2aa797b5f6..8d93333248 100644
--- a/hw/peci/peci-client.c
+++ b/hw/peci/peci-client.c
@@ -23,6 +23,64 @@
 
 #define PECI_CLIENT_DEFAULT_TEMP 30
 
+/* TODO: move this out into a config */
+static const PECIEndPtConfig spr_config[] = {
+    {
+        .hdr.msg_type = LOCAL_PCI_CFG,
+        .hdr.addr_type = 0x4,
+        .hdr.bus = 31,
+        .hdr.dev = 0,
+        .hdr.func = 2,
+        .hdr.reg = 0xD4,
+        .data = BIT(31)
+    },
+    {
+        .hdr.msg_type = LOCAL_PCI_CFG,
+        .hdr.addr_type = 0x4,
+        .hdr.bus = 31,
+        .hdr.dev = 0,
+        .hdr.func = 2,
+        .hdr.reg = 0xD0,
+        .data = BIT(31) | BIT(30)
+    },
+    {
+        .hdr.msg_type = LOCAL_PCI_CFG,
+        .hdr.addr_type = 0x4,
+        .hdr.bus = 31,
+        .hdr.dev = 30,
+        .hdr.func = 6,
+        .hdr.reg = 0x84,
+        .data = 0x03FFFFFF
+    },
+    {
+        .hdr.msg_type = LOCAL_PCI_CFG,
+        .hdr.addr_type = 0x4,
+        .hdr.bus = 31,
+        .hdr.dev = 30,
+        .hdr.func = 6,
+        .hdr.reg = 0x80,
+        .data = 0xFFFFFFFF
+    },
+    {
+        .hdr.msg_type = LOCAL_PCI_CFG,
+        .hdr.addr_type = 0x4,
+        .hdr.bus = 31,
+        .hdr.dev = 30,
+        .hdr.func = 6,
+        .hdr.reg = 0x84,
+        .data = 0x03FFFFFF
+    },
+    {
+        .hdr.msg_type = LOCAL_PCI_CFG,
+        .hdr.addr_type = 0x4,
+        .hdr.bus = 31,
+        .hdr.dev = 30,
+        .hdr.func = 6,
+        .hdr.reg = 0x80,
+        .data = 0xFFFFFFFF
+    },
+};
+
 static void peci_client_update_temps(PECIClientDevice *client)
 {
     uint8_t temp_cpu = 0;
@@ -115,7 +173,12 @@ PECIClientDevice *peci_add_client(PECIBus *bus,
         break;
 
     case FAM6_ICELAKE_X:
+        client->revision = 0x40;
+        break;
+
     case FAM6_SAPPHIRE_RAPIDS_X:
+        client->endpt_conf = spr_config;
+        client->num_entries = sizeof(spr_config) / sizeof(spr_config[0]);
         client->revision = 0x40;
         client->ucode = 0x8c0004a0;
         break;
diff --git a/hw/peci/peci-core.c b/hw/peci/peci-core.c
index 8210bfa198..a961ae51f3 100644
--- a/hw/peci/peci-core.c
+++ b/hw/peci/peci-core.c
@@ -22,6 +22,47 @@
 #define PECI_FCS_OK         0
 #define PECI_FCS_ERR        1
 
+static PECIEndPtHeader peci_fmt_end_pt_header(PECICmd *pcmd)
+{
+    uint32_t val = pcmd->rx[7] | (pcmd->rx[8] << 8) | (pcmd->rx[9] << 16) |
+                  (pcmd->rx[10] << 24);
+
+    PECIEndPtHeader header = {
+        .msg_type = pcmd->rx[1],
+        .addr_type = pcmd->rx[5],
+        .bus = (val >> 20) & 0xFF,
+        .dev = (val >> 15) & 0x1F,
+        .func = (val >> 12) & 0x7,
+        .reg = val & 0xFFF,
+    };
+
+    return header;
+}
+
+static void peci_rd_endpt_cfg(PECIClientDevice *client, PECICmd *pcmd)
+{
+    PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
+    PECIEndPtHeader req = peci_fmt_end_pt_header(pcmd);
+    PECIEndPtConfig const *c;
+
+    if (client->endpt_conf) {
+        for (size_t i = 0; i < client->num_entries; i++) {
+            c = &client->endpt_conf[i];
+
+            if (!memcmp(&req, &c->hdr, sizeof(PECIEndPtHeader))) {
+                    resp->data = c->data;
+                    resp->cc = PECI_DEV_CC_SUCCESS;
+                    return;
+            }
+        }
+    }
+
+    qemu_log_mask(LOG_UNIMP,
+                  "%s: msg_type: 0x%x bus: %u, dev: %u, func: %u, reg: 0x%x\n",
+                  __func__, req.msg_type, req.bus, req.dev, req.func, req.reg);
+
+}
+
 static void peci_rd_pkg_cfg(PECIClientDevice *client, PECICmd *pcmd)
 {
     PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
@@ -153,8 +194,7 @@ int peci_handle_cmd(PECIBus *bus, PECICmd *pcmd)
         break;
 
     case PECI_CMD_RD_END_PT_CFG:
-        qemu_log_mask(LOG_UNIMP, "%s: unimplemented CMD_RD_END_PT_CFG\n",
-                      __func__);
+        peci_rd_endpt_cfg(client, pcmd);
         break;
 
     default:
diff --git a/include/hw/peci/peci.h b/include/hw/peci/peci.h
index 1a0abe65cd..4fb2fc236e 100644
--- a/include/hw/peci/peci.h
+++ b/include/hw/peci/peci.h
@@ -112,6 +112,26 @@ typedef struct PECITempTarget {
     uint8_t tjmax;
 } PECITempTarget;
 
+typedef enum PECIEndPtType {
+    LOCAL_PCI_CFG = 3,
+    PCI_CFG,
+    MMIO_BDF,
+} PECIEndPtType;
+
+typedef struct __attribute__ ((__packed__)) {
+    PECIEndPtType msg_type;
+    uint8_t addr_type;
+    uint8_t bus;
+    uint8_t dev;
+    uint8_t func;
+    uint16_t reg;
+} PECIEndPtHeader;
+
+typedef struct {
+    PECIEndPtHeader hdr;
+    uint32_t data;
+} PECIEndPtConfig;
+
 #define PECI_BASE_ADDR              0x30
 #define PECI_BUFFER_SIZE            0x100
 #define PECI_NUM_CPUS_MAX           56
@@ -140,6 +160,9 @@ typedef struct PECIClientDevice {
     uint8_t dimm_temp_max;
     uint8_t dimm_temp[PECI_NUM_DIMMS_MAX];
 
+    /* EndPtConfig info */
+    PECIEndPtConfig const *endpt_conf;
+    size_t num_entries;
 } PECIClientDevice;
 
 #define TYPE_PECI_CLIENT "peci-client"
-- 
2.37.2.789.g6183377224-goog

