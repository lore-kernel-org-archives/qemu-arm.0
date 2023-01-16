Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1091479ejc;
        Sun, 15 Jan 2023 19:22:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuzL9q3wL46AfUImfemxnumYLN7a9cEfD3cd07Gwc19E8c91Oi4FPzVDjvUyiuVbXyqcZMh
X-Received: by 2002:a05:622a:1246:b0:3a6:91f2:62bf with SMTP id z6-20020a05622a124600b003a691f262bfmr134515339qtx.37.1673839345998;
        Sun, 15 Jan 2023 19:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673839345; cv=none;
        d=google.com; s=arc-20160816;
        b=czI4vkM/QqqXeLXOnFOuH9R2/CSRWlQsQ5HamTjKmIOeU0cvFyn8yDfkgI/PIJNbO8
         anGGNwZS/nTqH9DDecaWZ/g8oRU/LCYjAkQ92KoDxL9BbL8xf6nUpKFow/ertrYSKI3E
         /wrfs5Z5sd3pVDECPFDF+iaiQDSOhNN4nuM4rgMU+MBVfyy8FSfbt+cg60nfu4VXOkeC
         60EEGond+AfwIWLTNmlXYDRQQSwnNaEamafQ5GH+Fgoe8Aid1d1zH2WGV30r1m1qoyRh
         QqcpGg+BEto1tgPab+bq3q+RcQlCe7I9fc6+vGo3Ods+0zTsflNA9FEmkX1mAezZI+0P
         AGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=wU4RBYwyLpo6wFhvdqwG3YX7ndgaL0/IE1IGa8yRpaw=;
        b=tqF6qwwqZuggK7ED4kahcoV8FYtcx153bborcpvc2kn9n+Qf6+oIjN0MaMdAHrEh2M
         UYpiQx6JF39pk05iYDOz78uKKjlFr8k5tRblReLHHRBCz/D2FnfEmfg3hhTN7dErdd+W
         kpBWx0pqUYYTilJ1JaiiHMy2TO3NL0z0TrkZPmmSX5BU6VIDcM39H/hj9+QoLHIGAT6P
         pzMn7fE9NgYST4X3sRaFYwi9KzBK73ICegG24xQMLLMxnfaL1OPEIDCYc4urAxW2i32q
         LWz3qQxFXEbPe866qzdQvbf+P0NoSo3y8OiS9eLMRQeEBQphRPPCVEp3R/ZP0Ft/zE3y
         t31w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay26-20020a05622a229a00b003ab78a0b43asi16857887qtb.14.2023.01.15.19.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jan 2023 19:22:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHG4J-0007Yz-2G; Sun, 15 Jan 2023 22:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pHG4G-0007Yc-V8; Sun, 15 Jan 2023 22:21:52 -0500
Received: from [122.235.246.20] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pHG4F-00057P-3x; Sun, 15 Jan 2023 22:21:52 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id dbd5a6e0;
 Mon, 16 Jan 2023 02:55:08 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] hw/display/xlnx_dp: fix abort in xlnx_dp_change_graphic_fmt()
Date: Mon, 16 Jan 2023 10:54:59 +0800
Message-Id: <20230116025459.1376583-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 122.235.246.20 (failed)
Received-SPF: softfail client-ip=122.235.246.20;
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 74VPp2vmcMgH

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

