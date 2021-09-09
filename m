Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp621404lfb;
        Thu, 9 Sep 2021 16:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHqcsLkm31bv2a02PXfxaw1vdoyRdvN2JfUq62htA0rbX2/gBEtLTraHsGijo+P283douh
X-Received: by 2002:ab0:70ce:: with SMTP id r14mr3925982ual.16.1631229454846;
        Thu, 09 Sep 2021 16:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631229454; cv=none;
        d=google.com; s=arc-20160816;
        b=UbqWzwJdti2CVjb+svPutSdLqbg2mf1FjYZHQ51dtEIDbHWODy0fXbrmdfNBRxdyQD
         CoWMU5OWRGXM0+74aBFLcLHoBvDqlg9qxlKxRYpY7wZZTKLnVPlAUsBiVbztNKSDNby+
         goqBhCO5RWhyckSBAu2tFeaeTgdl4PSXRpA+twv2PYl02JxGfBYv/0G64PWN4dN5hklJ
         v6tVgcksOOIBqtOIq8Fob/YtLDpeOiBMKV7yZlbQtxBaSAD6CXPR9uUeuuHar4XXAjfK
         fHBKYauqZ68C1ngN3xPVB6AaXX5xOr3AuyWam/cGpQca8Rl2y6qvbTaxm9ipsuL8nfN2
         i4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=hJiLQFbsLnMl3sENkk28GUEuiDBlwUuZkGsr4hP+k9k=;
        b=hapSmkg2twdGdinGHwfGROm5fwbjcUdefiTxTjZWDEDZ0P++edexMigMq/TCiSADop
         kg3dJ7i24Ic2AR2uZGl/+E5sahHahj2YUXajajSLfYShSw4AJyni9HNrNtCynEddaM67
         1BpzSfEF+QattPKHF0l48yYvRp/4vOT+inmKOQtrZ+QwHGFaZynsHS3iDE9Th6hdrblc
         VR/1NHIHSUwJgXqtbbHJaVOQXXz9HhhMLXMp5D2a+zgBICLbB6n8Osg3oNMNyMbE9TEi
         LjTvRWHfe0dXqmTNai58w/i6snAkd/HPLCRwx4t6pAFFoA0K0GhWHlRMTPux3RlKOYDi
         8nHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gGfakFAO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si1174355ual.40.2021.09.09.16.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 16:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gGfakFAO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOTIU-0000rl-51
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 19:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3p5M6YQgKCsgA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8e-0004n0-IX
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:24 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:57286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3p5M6YQgKCsgA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8b-0003ch-Vk
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:23 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 63-20020a250d42000000b0059dc43162c9so4408324ybn.23
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=hJiLQFbsLnMl3sENkk28GUEuiDBlwUuZkGsr4hP+k9k=;
 b=gGfakFAOBJAMjZvc3wl9wxu2QyQ646tyx5Z0r7BaJX2TBIeAKfD6XEDa9bv7j1a02G
 DMEXSL2albLXpzphCz+UywHWLDSyrnQU+u64ITCK5vIrqsbfuT3lSe6ctRt//yzqSrCC
 cuaFFSo2A6OrnDtx4RLOWrKgxFnJD1AvtY2QlArqAOoyXtWtffh3HVu3xdxkAdoKR5Mh
 lYZqsGVklmBKArl1MATakqPQnn9RGuhG58qXvO69CCBZ32RGiOhNvOCJL8S1uQsOGcjX
 X63iLK9mXtnirpoi4JkohSizquO9SknqFrLWTTnFy+JFVslQhOqaYiU2WNJ/Lt67Fc/k
 9TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hJiLQFbsLnMl3sENkk28GUEuiDBlwUuZkGsr4hP+k9k=;
 b=su305GIV8RKfYoXuZ86c/q/BMIiEutUTPMmJB5sNgShslYEtKybH5vBwnJZaE0xuQe
 bvVrnXzp1MYHTPauyXQUF4mHZMJJTG8QVtSBB9fjUm2v21VqS/4eHhiej75EiReOqcv9
 qyzocGAywhWlX8hCZgjUczUwYWTZs2WxXd8QYpGorLVIVOKkWIQc5gcTn5hP6gB1kPwB
 fhfdhfwRZzp8AZN1saqfIMk8GqOkZyo8YyC81RxOX2XXVzo6iNqzo6TWP4WG1ET6Fpjy
 Q8NElmzo+znnNn2f03uMrWX/qPd21YPxVvnMkYI+lSzf6dMq3g8LWVf3ucqmX5JdmoBq
 wMkA==
X-Gm-Message-State: AOAM530jDFzPp2QagHRwfebUWjnqFJ43HPo3trBBYJ60cpR28n3dB6Ez
 8Y6eXn/tCPndAQCBN3TMrlNTZrt6amGhtg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:6545:: with SMTP id
 z66mr7274972ybb.149.1631228839926; Thu, 09 Sep 2021 16:07:19 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:18 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 6/8] hw/ipmi: Move handle_command to IPMICoreClass
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3p5M6YQgKCsgA8vo276vu22uzs.q204s08-rs9sz121u18.25u@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UnufSHW+1ASV

Move the function handle_command to IPMICoreClass. This function is
shared between BMC-side emulation and Host-side emulation.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/ipmi/ipmi_bmc_extern.c |  4 ++--
 hw/ipmi/ipmi_bmc_sim.c    |  6 +++---
 hw/ipmi/ipmi_bt.c         |  4 ++--
 hw/ipmi/ipmi_extern.c     |  6 +++---
 hw/ipmi/ipmi_kcs.c        |  6 +++---
 hw/ipmi/smbus_ipmi.c      |  6 +++---
 include/hw/ipmi/ipmi.h    | 16 ++++++++--------
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 24979ecfd5..f7b88763c1 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -117,7 +117,7 @@ static void ipmi_bmc_handle_hw_op(IPMICore *ic, unsigned char hw_op,
     }
 }
 
-static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
+static void ipmi_bmc_extern_handle_command(IPMICore *b,
                                        uint8_t *cmd, unsigned int cmd_len,
                                        unsigned int max_cmd_len,
                                        uint8_t msg_id)
@@ -185,8 +185,8 @@ static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *data)
     IPMIBmcClass *bk = IPMI_BMC_CLASS(oc);
     IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
 
-    bk->handle_command = ipmi_bmc_extern_handle_command;
     bk->handle_reset = ipmi_bmc_extern_handle_reset;
+    ck->handle_command = ipmi_bmc_extern_handle_command;
     ck->handle_hw_op = ipmi_bmc_handle_hw_op;
     dc->hotpluggable = false;
     dc->realize = ipmi_bmc_extern_realize;
diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index 7cc4a22456..ddbf150e78 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -640,7 +640,7 @@ static void next_timeout(IPMIBmcSim *ibs)
     timer_mod_ns(ibs->timer, next);
 }
 
-static void ipmi_sim_handle_command(IPMIBmc *b,
+static void ipmi_sim_handle_command(IPMICore *b,
                                     uint8_t *cmd, unsigned int cmd_len,
                                     unsigned int max_cmd_len,
                                     uint8_t msg_id)
@@ -2222,12 +2222,12 @@ static Property ipmi_sim_properties[] = {
 static void ipmi_sim_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
-    IPMIBmcClass *bk = IPMI_BMC_CLASS(oc);
+    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
 
     dc->hotpluggable = false;
     dc->realize = ipmi_sim_realize;
     device_class_set_props(dc, ipmi_sim_properties);
-    bk->handle_command = ipmi_sim_handle_command;
+    ck->handle_command = ipmi_sim_handle_command;
 }
 
 static const TypeInfo ipmi_sim_type = {
diff --git a/hw/ipmi/ipmi_bt.c b/hw/ipmi/ipmi_bt.c
index f76c369e4a..60a04f2a65 100644
--- a/hw/ipmi/ipmi_bt.c
+++ b/hw/ipmi/ipmi_bt.c
@@ -141,8 +141,8 @@ static void ipmi_bt_handle_event(IPMIInterface *ii)
     ib->waiting_seq = ib->inmsg[2];
     ib->inmsg[2] = ib->inmsg[1];
     {
-        IPMIBmcClass *bk = IPMI_BMC_GET_CLASS(ib->bmc);
-        bk->handle_command(ib->bmc, ib->inmsg + 2, ib->inlen - 2,
+        IPMICoreClass *ck = IPMI_CORE_GET_CLASS(ib->bmc);
+        ck->handle_command(IPMI_CORE(ib->bmc), ib->inmsg + 2, ib->inlen - 2,
                            sizeof(ib->inmsg), ib->waiting_rsp);
     }
  out:
diff --git a/hw/ipmi/ipmi_extern.c b/hw/ipmi/ipmi_extern.c
index f139eaef24..97dfed085f 100644
--- a/hw/ipmi/ipmi_extern.c
+++ b/hw/ipmi/ipmi_extern.c
@@ -119,9 +119,9 @@ static void addchar(IPMIExtern *ibe, unsigned char ch)
 }
 
 void ipmi_extern_handle_command(IPMIExtern *ibe,
-                                       uint8_t *cmd, unsigned int cmd_len,
-                                       unsigned int max_cmd_len,
-                                       uint8_t msg_id)
+                                uint8_t *cmd, unsigned int cmd_len,
+                                unsigned int max_cmd_len,
+                                uint8_t msg_id)
 {
     IPMIInterface *s = ibe->core->intf;
     uint8_t err = 0, csum;
diff --git a/hw/ipmi/ipmi_kcs.c b/hw/ipmi/ipmi_kcs.c
index e0f870e13a..4a77dbb7e7 100644
--- a/hw/ipmi/ipmi_kcs.c
+++ b/hw/ipmi/ipmi_kcs.c
@@ -162,12 +162,12 @@ static void ipmi_kcs_handle_event(IPMIInterface *ii)
             ik->inlen++;
         }
         if (ik->write_end) {
-            IPMIBmcClass *bk = IPMI_BMC_GET_CLASS(ik->bmc);
+            IPMICoreClass *ck = IPMI_CORE_GET_CLASS(ik->bmc);
             ik->outlen = 0;
             ik->write_end = 0;
             ik->outpos = 0;
-            bk->handle_command(ik->bmc, ik->inmsg, ik->inlen, sizeof(ik->inmsg),
-                               ik->waiting_rsp);
+            ck->handle_command(IPMI_CORE(ik->bmc), ik->inmsg, ik->inlen,
+                               sizeof(ik->inmsg), ik->waiting_rsp);
             goto out_noibf;
         } else if (ik->cmd_reg == IPMI_KCS_WRITE_END_CMD) {
             ik->cmd_reg = -1;
diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
index a2383f1212..e0248ac45f 100644
--- a/hw/ipmi/smbus_ipmi.c
+++ b/hw/ipmi/smbus_ipmi.c
@@ -107,7 +107,7 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *sid)
 {
     uint8_t *msg = sid->inmsg;
     uint32_t len = sid->inlen;
-    IPMIBmcClass *bk = IPMI_BMC_GET_CLASS(sid->bmc);
+    IPMICoreClass *ck = IPMI_CORE_GET_CLASS(sid->bmc);
 
     sid->outlen = 0;
     sid->outpos = 0;
@@ -135,8 +135,8 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *sid)
         return;
     }
 
-    bk->handle_command(sid->bmc, sid->inmsg, sid->inlen, sizeof(sid->inmsg),
-                       sid->waiting_rsp);
+    ck->handle_command(IPMI_CORE(sid->bmc), sid->inmsg, sid->inlen,
+                       sizeof(sid->inmsg), sid->waiting_rsp);
 }
 
 static uint8_t ipmi_receive_byte(SMBusDevice *dev)
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 1fa8cd12e5..0083c73e4b 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -196,6 +196,14 @@ struct IPMICoreClass {
      * Handle a hardware command.
      */
     void (*handle_hw_op)(struct IPMICore *s, uint8_t hw_op, uint8_t operand);
+
+    /*
+     * Handle a command to the bmc.
+     */
+    void (*handle_command)(struct IPMICore *s,
+                           uint8_t *cmd, unsigned int cmd_len,
+                           unsigned int max_cmd_len,
+                           uint8_t msg_id);
 };
 
 /*
@@ -216,14 +224,6 @@ struct IPMIBmcClass {
 
     /* Called when the system resets to report to the bmc. */
     void (*handle_reset)(struct IPMIBmc *s);
-
-    /*
-     * Handle a command to the bmc.
-     */
-    void (*handle_command)(struct IPMIBmc *s,
-                           uint8_t *cmd, unsigned int cmd_len,
-                           unsigned int max_cmd_len,
-                           uint8_t msg_id);
 };
 
 /*
-- 
2.33.0.309.g3052b89438-goog

