Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp285391ejb;
        Thu, 5 Jan 2023 04:56:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjVFYTtqk0c6Jo2ZfV6ihhw+mfD56GJqnifZnTu3uU6+FbJtfsNB5k3oObq252KF6aY2go
X-Received: by 2002:ad4:4e8a:0:b0:4c6:f5bd:2cb9 with SMTP id dy10-20020ad44e8a000000b004c6f5bd2cb9mr78461656qvb.33.1672923405305;
        Thu, 05 Jan 2023 04:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672923405; cv=none;
        d=google.com; s=arc-20160816;
        b=eOAbLjvgfSxwcbrC0kqNnspSh1EjPVivoE7y6faLyeZOh66b23SI1BRH5AO97u/oN2
         LWGQ6QAwhrQOldLh4/ilwikvKXb4ubtiqACSv5/8BdY9KXSGAlQjub/aoZf3+ABD3k60
         sdK/wOUymfypaR4H/wGph88DArkGMSFBbo8VKZT/3C0gBI7EeFnIOyHKiZd0ZRaHRHsS
         bL70c+1kPF+s0/5kQEsyLJit5iB2PU1uNhGDak3gWXooQ+1ZS7vD/eNCjP8q1Zg68zni
         FsvYylo8f0r5voPBnka7f0OAIhI/OO7urrO+Ef8dBUA5a6/c4eJx6qYzt1HAIhVtraAO
         2V7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=wU4RBYwyLpo6wFhvdqwG3YX7ndgaL0/IE1IGa8yRpaw=;
        b=Y5YM2IIwadWfzcyOT5IRWlVHbbn8/SbkvmIEmGBBzbnHqkP7Au04izt0k7kiEmnnlU
         oKkDODEyKRZTAUAFcYFRZRRLYn4MSRg1XwZVvQRh9sRp6l4IVrayzKcuNvdMSCmJCucD
         q33qhNNnFnZnO/IlwZyEI43k/vSsWFLuKexizc7tSZgQ/mDBmT7vDbNhSs1XdZZuDud5
         DMLdWO/CMQ+WCRqRK2BnhrDfDJpM9NsOLVreVOzlVPJygitCodv2n5N1tz2H8duTKRar
         3q41oAGN6y5FO8UnyG5rE/buhc4oq+kSgoLkktlrdYmJu+12162bnZ1zs2+IE6d/pksj
         k5NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020a05620a451200b006fa509fd0besi21408375qkp.634.2023.01.05.04.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDPnM-00073G-O3; Thu, 05 Jan 2023 07:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDPnK-00072i-Jb; Thu, 05 Jan 2023 07:56:30 -0500
Received: from [125.120.148.222] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pDPnI-0004la-Iv; Thu, 05 Jan 2023 07:56:30 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 4bfde3b5;
 Thu, 5 Jan 2023 11:09:41 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] hw/display/xlnx_dp: fix abort in xlnx_dp_change_graphic_fmt()
Date: Thu,  5 Jan 2023 19:09:37 +0800
Message-Id: <20230105110937.436585-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.120.148.222 (failed)
Received-SPF: softfail client-ip=125.120.148.222;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
X-TUID: 8+RuCOBOnwKf

xlnx_dp_change_graphic_fmt() will directly abort if either graphic
format or the video format is not supported.

This patch directly let xlnx_dp_change_graphic_fmt() return if the
formats are not supported.

xlnx_dp_change_graphic_fmt() has two callsites in xlnx_dp_avbufm_write()
and xlnx_dp_reset(). I think it may be OK to drop the abort in
xlnx_dp_change_graphic_fmt() because the error information will be
printed.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1415
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index b0828d65aa..407518c870 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -641,7 +641,7 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
     default:
         error_report("%s: unsupported graphic format %u", __func__,
                      s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
-        abort();
+        return;
     }
 
     switch (s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK) {
@@ -657,7 +657,7 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
     default:
         error_report("%s: unsupported video format %u", __func__,
                      s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
-        abort();
+        return;
     }
 
     xlnx_dp_recreate_surface(s);
-- 
2.25.1

