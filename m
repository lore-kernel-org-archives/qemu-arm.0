Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp567338ejy;
        Tue, 13 Sep 2022 11:29:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6zGacUj8ZQkKGhDuaFknH1vWlSyzeAqhlN8bX8LGMk6pikAzQ6yakYgYw/EyQxCpB+Z4Lt
X-Received: by 2002:ae9:e404:0:b0:6bb:d8c0:381c with SMTP id q4-20020ae9e404000000b006bbd8c0381cmr23946941qkc.459.1663093771243;
        Tue, 13 Sep 2022 11:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663093771; cv=none;
        d=google.com; s=arc-20160816;
        b=QU1QPm2vE1Q3B2IAbVu1DECp4Y40xfTlSy42lTBgTPmBZlZpmN9TxpKGUwQElz8zBm
         kGfjwSkQcOBIpZxbegNZlMDBwkceMjjK8mTyGX333CH74P9VPNjIppf0v9BGqyRhpLzf
         IcU1YheXjQBgBPC16PFn8FThILzgzOq5jvQhvOkCaJ74PvFnWLzaGP0k8N7D6RcT3B/7
         ZM7kQcMAyNuPMapSd7+5vGD8uPyGdG+/ru6WiUjLd5nZQTUnSr86r09Z13PMvhDqKREp
         egh6u1r1xit/G+VQVOaI5+hnFBCMnnA5oQIkUTuhhe5JSp76rS865aKzlpKe+xaIR1Pk
         JUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=yfL3dwiC7fq07wle1OKxYaRxBaPqgWb8etaIbg8xPuY=;
        b=i2vo4o/1im5kp/NYKf1YrzXYZhZOReVFCJKrEoyLw920NzHe9PALAMzXpGTv+/S8RJ
         Sd0t+S+h5GG3mnuDugfSITKelLVrFUG5zHRswEGHP0dVpudEn6W+NhBr91zKvxjyxKb3
         c6+b+3qfwrxV7gGwuEfjF61nREyIsa8KrHyBok5eRUy97/IfwxnNCznXMm1WH/vvS/9S
         MB7Oz13qva8naBsPA+aXAHfg2XuV+oOgv6q6L1p3yfo/JkyYjDyLPGw2wnjWPPMybbiA
         LTbFRCkfv/TXVHaA/ii8nvQNCZxZfqQbqfXEil4IShjVNLae1Y0bgUXHJlc3JUDe7YQ7
         pxzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=WL3trtVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a05622a040a00b003446b911a75si39316qtx.458.2022.09.13.11.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Sep 2022 11:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=WL3trtVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYAf4-0005Sz-NX
	for alex.bennee@linaro.org; Tue, 13 Sep 2022 14:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RcogYwYKCHwynyzxwlttlqj.htrvjrz-fwrstslsz.twl@flex--titusr.bounces.google.com>)
 id 1oYAXt-0004nK-EQ
 for qemu-arm@nongnu.org; Tue, 13 Sep 2022 14:22:07 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:49118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RcogYwYKCHwynyzxwlttlqj.htrvjrz-fwrstslsz.twl@flex--titusr.bounces.google.com>)
 id 1oYAXp-0007Pc-0I
 for qemu-arm@nongnu.org; Tue, 13 Sep 2022 14:22:02 -0400
Received: by mail-qt1-x84a.google.com with SMTP id
 b10-20020ac8540a000000b0035ba387b0d1so9835742qtq.15
 for <qemu-arm@nongnu.org>; Tue, 13 Sep 2022 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date;
 bh=yfL3dwiC7fq07wle1OKxYaRxBaPqgWb8etaIbg8xPuY=;
 b=WL3trtVgOkfqlsVNSXViqzZq6OonZfHm1tBT0FeFc7De4tpHvJUatUoKbdBSMPNEix
 Bq9SEKpiUc7IuRJns7lGJSbOygUnJyr/i9bJCODWBgsTRs+2aI4m85vjrQzhUJZW/jlp
 t3mw28M03+LuLHflXef6zGrnCFzae32J9oW53p+/XkQWhvjXxRxpCP7Z/ZyL3jyYGS/D
 b5HncUB/ol1XFbm/ma7CkEJgOrYhAiQGxIxstEEuZQjVLVuBhXwaNH6Dcap9m+OGRihs
 0HBFXWfBTMGAgbk63uB/397bWms855YQlBCBCDjaEPN/6LQ7s5VDjYCYGxq0dZnhiYq4
 Lj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=yfL3dwiC7fq07wle1OKxYaRxBaPqgWb8etaIbg8xPuY=;
 b=8SE1nUbc4UI/ivp3wBYGwQuDypH+Q7JEOc+2QisbZSYO9gPE1mNME9ZOoXO5M0HPsB
 xQuNdQRFuQpyreCzKvRRC9fOsYL+qREu9B7JWt98ujBRHqYO0p5y+elddzlmP5ff45YX
 CB4ThAiKfa76iYiQeRDIt+R2OHfNDuQs/07Mg96VfXUh3wk4eKhLK0stJwVsC1G1Rkd+
 dcMQur6DuzLuHcJJLVSUSo0Q7d7PhDdCZ+Z0Aa07H9HMkiuzaE2Yg5ki1OuPy7GoX+oj
 B4jYyCHhjBi4enkQD5xLHOff1D3hFg6if1t1CxXsInn4WVGOhHw14yFn9DpDD0gHoavd
 JDcQ==
X-Gm-Message-State: ACgBeo3E4IOYExVxeTYmThff1+Bz+mACdEU1VW579t/6PL+7WbgQuvEb
 60XAyGcYz3+YYRjk5vwczZjA3XDdGlo=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:622a:244f:b0:344:7c4f:5a94 with SMTP id
 bl15-20020a05622a244f00b003447c4f5a94mr29111630qtb.563.1663093317452; Tue, 13
 Sep 2022 11:21:57 -0700 (PDT)
Date: Tue, 13 Sep 2022 18:21:49 +0000
In-Reply-To: <20220913182149.1468366-1-titusr@google.com>
Mime-Version: 1.0
References: <20220913182149.1468366-1-titusr@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220913182149.1468366-4-titusr@google.com>
Subject: [RFC PATCH v2 3/3] hw/peci: add support for EndPointConfig reads
From: Titus Rwantare <titusr@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter@pjd.dev, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3RcogYwYKCHwynyzxwlttlqj.htrvjrz-fwrstslsz.twl@flex--titusr.bounces.google.com;
 helo=mail-qt1-x84a.google.com
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
X-TUID: dHvNmUzFWnOM

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/peci/peci-client.c  | 63 ++++++++++++++++++++++++++++++++++++++++++
 hw/peci/peci-core.c    | 44 +++++++++++++++++++++++++++--
 include/hw/peci/peci.h | 23 +++++++++++++++
 3 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/hw/peci/peci-client.c b/hw/peci/peci-client.c
index 2aa797b5f6..e54735bb53 100644
--- a/hw/peci/peci-client.c
+++ b/hw/peci/peci-client.c
@@ -23,6 +23,64 @@
 
 #define PECI_CLIENT_DEFAULT_TEMP 30
 
+/* TODO: move this out into a config */
+static const PECIEndPointConfig spr_config[] = {
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
+        client->endpoint_conf = spr_config;
+        client->num_entries = sizeof(spr_config) / sizeof(spr_config[0]);
         client->revision = 0x40;
         client->ucode = 0x8c0004a0;
         break;
diff --git a/hw/peci/peci-core.c b/hw/peci/peci-core.c
index 8210bfa198..0650a03e2d 100644
--- a/hw/peci/peci-core.c
+++ b/hw/peci/peci-core.c
@@ -22,6 +22,47 @@
 #define PECI_FCS_OK         0
 #define PECI_FCS_ERR        1
 
+static PECIEndPointHeader peci_fmt_end_pt_header(PECICmd *pcmd)
+{
+    uint32_t val = pcmd->rx[7] | (pcmd->rx[8] << 8) | (pcmd->rx[9] << 16) |
+                  (pcmd->rx[10] << 24);
+
+    PECIEndPointHeader header = {
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
+static void peci_rd_endpoint_cfg(PECIClientDevice *client, PECICmd *pcmd)
+{
+    PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
+    PECIEndPointHeader req = peci_fmt_end_pt_header(pcmd);
+    PECIEndPointConfig const *c;
+
+    if (client->endpoint_conf) {
+        for (size_t i = 0; i < client->num_entries; i++) {
+            c = &client->endpoint_conf[i];
+
+            if (!memcmp(&req, &c->hdr, sizeof(PECIEndPointHeader))) {
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
+        peci_rd_endpoint_cfg(client, pcmd);
         break;
 
     default:
diff --git a/include/hw/peci/peci.h b/include/hw/peci/peci.h
index 1a0abe65cd..3dcfe82245 100644
--- a/include/hw/peci/peci.h
+++ b/include/hw/peci/peci.h
@@ -112,6 +112,26 @@ typedef struct PECITempTarget {
     uint8_t tjmax;
 } PECITempTarget;
 
+typedef enum PECIEndPointType {
+    LOCAL_PCI_CFG = 3,
+    PCI_CFG,
+    MMIO_BDF,
+} PECIEndPointType;
+
+typedef struct __attribute__ ((__packed__)) {
+    PECIEndPointType msg_type;
+    uint8_t addr_type;
+    uint8_t bus;
+    uint8_t dev;
+    uint8_t func;
+    uint16_t reg;
+} PECIEndPointHeader;
+
+typedef struct {
+    PECIEndPointHeader hdr;
+    uint32_t data;
+} PECIEndPointConfig;
+
 #define PECI_BASE_ADDR              0x30
 #define PECI_BUFFER_SIZE            0x100
 #define PECI_NUM_CPUS_MAX           56
@@ -140,6 +160,9 @@ typedef struct PECIClientDevice {
     uint8_t dimm_temp_max;
     uint8_t dimm_temp[PECI_NUM_DIMMS_MAX];
 
+    /* EndPtConfig info */
+    PECIEndPointConfig const *endpoint_conf;
+    size_t num_entries;
 } PECIClientDevice;
 
 #define TYPE_PECI_CLIENT "peci-client"
-- 
2.37.3.968.ga6b4b080e4-goog

