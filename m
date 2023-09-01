Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496080ejc;
        Fri, 1 Sep 2023 02:43:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWuXVY7B5anxuz5kxHHJJUaMwfaXjAsz0dbxWX6wIBtCTK4xVfuYRSKVjrgbYqDvGIUJDN
X-Received: by 2002:a0c:a9c8:0:b0:64f:3db0:ab31 with SMTP id c8-20020a0ca9c8000000b0064f3db0ab31mr2077940qvb.26.1693561432643;
        Fri, 01 Sep 2023 02:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561432; cv=none;
        d=google.com; s=arc-20160816;
        b=QufgUCSVtMh4M6TxGwQSdjkLwY6kU7SGfXXzNzGzVDFTvyQL8tU3sBPhHJkxtigVk9
         Z/6QTsTBdS1sUCcOXsAtI/JML5lZBIIwZIUZSp0+g4cF6ZMDjB6b/RHc/4vpHKRD9yNY
         JsJi0JqWDnB1JODDB5jeOEBBy6FYyKC6NvNl4yn+rqSZeMtqGWAV+Lw0/60GoWh3fUnr
         S1ZkFWJiYrtZzzkTnjY2+sjvI3dOL/wwHyz+BZvQ7Cjj1LAAbt03Y4MFJw+XzrOmv/x+
         aEh7/86nzCfTSy4yYbaRYHDtisGXwvCN7I+JXHzs75FZPnkHjn5vckcB48KBigPwU5K3
         OffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=qSahDTvOpdP8Uwj86S4Y6134kWqo8gH4wa+x+/ijE9w=;
        fh=sAFxsovMRUpeK1m2ZrUTkWk2zuchzNgVidyR5jMbIm8=;
        b=j/knN/wYUrdYaV1+TL+Xne8mgHx/NwSEw1P7TP9zO+gr4DKbnccH+x0wOtozYf5qEm
         rO2PXG0FOv35X8Q+KTW2WxrLBAC45OKhPzGmySa4qCgUZBuTOmlzLVRrkZa7AF+XVRzH
         dBlwKnh+lbV5NuX0XPMIgO0ZtXxrVQK/3IXDCq6vmsFrdCVgtbH9Nx1191qZ8nwGkZXn
         xUrNqXZ8uQloM+GJ48CmSoiQAKyGuCpBYmNnRY16th4VvtA9ngNy9FxmJAlzRt8Unx0r
         ozAxenJL/CWZcEz10vqJE3qnn1QsYSOBv1qdgXTZub3yRM2pWIU/tFGswPRprb8b4xX4
         vFvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a0cf04e000000b0064f44a6598esi2102060qvl.126.2023.09.01.02.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0gQ-0002qq-Jy; Fri, 01 Sep 2023 05:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gP-0002mt-KT; Fri, 01 Sep 2023 05:43:17 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0gM-0003BJ-7D; Fri, 01 Sep 2023 05:43:17 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY4G6QD7z4wy9;
 Fri,  1 Sep 2023 19:43:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY4F0zY0z4wy6;
 Fri,  1 Sep 2023 19:43:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 22/26] hw/sd: Add sd_cmd_ALL_SEND_CID() handler
Date: Fri,  1 Sep 2023 11:42:10 +0200
Message-ID: <20230901094214.296918-23-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5wvCmMoHOBK3

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-10-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index bd67c50894fe..33ecff496ade 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1037,6 +1037,17 @@ static sd_rsp_type_t sd_cmd_SEND_OP_CMD(SDState *sd, SDRequest req)
     return sd_r1;
 }
 
+static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
+{
+    if (sd->state != sd_ready_state) {
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+
+    sd->state = sd_identification_state;
+
+    return sd_r2_i;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1076,17 +1087,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 2:  /* CMD2:   ALL_SEND_CID */
-        switch (sd->state) {
-        case sd_ready_state:
-            sd->state = sd_identification_state;
-            return sd_r2_i;
-
-        default:
-            break;
-        }
-        break;
-
     case 3:  /* CMD3:   SEND_RELATIVE_ADDR */
         switch (sd->state) {
         case sd_identification_state:
@@ -2148,6 +2148,7 @@ static const SDProto sd_proto_sd = {
     .cmd = {
         [0]         = sd_cmd_GO_IDLE_STATE,
         [1]         = sd_cmd_illegal,
+        [2]         = sd_cmd_ALL_SEND_CID,
         [5]         = sd_cmd_illegal,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
-- 
2.41.0

