Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496331ejc;
        Fri, 1 Sep 2023 02:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZKH9uujHWcWhpCABSV7tkEpsU5w2sxKYC3YlFQLk2kupnYEtOC5JLWEYsnXJpfXBbhCtJ
X-Received: by 2002:a05:620a:2408:b0:76e:e66c:92f8 with SMTP id d8-20020a05620a240800b0076ee66c92f8mr3062398qkn.8.1693561458211;
        Fri, 01 Sep 2023 02:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561458; cv=none;
        d=google.com; s=arc-20160816;
        b=T0RDOsEDtv6tG6pb+9ojmteLj8o4AFfZPKXbfHzRajUz9Xru1t3S260qHDlx8lBkQ2
         x13mUJbnEQlG2qNH3P2p2ePGql3dcIh2sBa9JZ1rbRmLLyBiNRItQBFLcM6eZtxbrNuL
         AkUIbDHFB92dX6St4g5kl68IvQSquFJt18k9Ql9Wh3Eab6p1qc5V6VYj6EOmZ4dQc0S9
         S5lAglaHAbHPFOBXd1tp1kqQf2QrnKAOz7qi2vt/yTuQyUvoUUpTn5FseimrPdtz947t
         8vHkBzcqrYZl/493Mjwu4lJIdEvoi4l0n3/C7BJMup5y17rdG8ueO7RE7Kk3YhUqIyDn
         0REg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Bho2ZC5PMS/GMiVTVmKTYhEWvUB5WGA2o2VijYaWBL8=;
        fh=sAFxsovMRUpeK1m2ZrUTkWk2zuchzNgVidyR5jMbIm8=;
        b=DbdtufRduIOJSy4ikuswMcx0QnVR1BpK4JoZqOb7HBN3kDBeOjM7mP8uAGlFJ+aPcP
         ndFiQIFod5bNkJZSqGFSrdmQX0fVRIpbdjoaBrtaMSQBi0/RirU6VzsZpE0+yqY/QVgb
         uH/y2nqhKTTXxcEhTDND2XsXFix2hlWg09Hqp/wpfNy/tkC+BjX0zaD4nQYqStnm3zt5
         hc4qeg8Edlx0MUnovkc0VdcEaMooyDz3OuVEYW/dzRnlpfDJSj8W/fyCFbcMoVeCGXSm
         yVhkdDricejR7nJekODchxtxpvwjINXBJp35h16spnuv2yfz0iMQ8daKkX8j79EjzFYd
         piVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020a05620a08d000b0076d8816ff26si2148527qkz.126.2023.09.01.02.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0gE-0002DG-Fk; Fri, 01 Sep 2023 05:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g4-0001wj-0o; Fri, 01 Sep 2023 05:42:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g1-000370-Fp; Fri, 01 Sep 2023 05:42:55 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3v1bSVz4x2Y;
 Fri,  1 Sep 2023 19:42:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3s3CXNz4x2D;
 Fri,  1 Sep 2023 19:42:49 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/26] hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD
 spec v3.01
Date: Fri,  1 Sep 2023 11:42:01 +0200
Message-ID: <20230901094214.296918-14-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: GzNsCN1c11ft

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

CMD19 (SEND_TUNING_BLOCK) and CMD23 (SET_BLOCK_COUNT) were
added in the Physical Layer Simplified Specification v3.01.
When earlier spec version is requested, we should return ILLEGAL.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220509141320.98374-1-philippe.mathieu.daude@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 77a717d35507..0be9ee965ac9 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1263,7 +1263,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            break;
+            goto bad_cmd;
         }
         if (sd->state == sd_transfer_state) {
             sd->state = sd_sendingdata_state;
@@ -1274,7 +1274,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            break;
+            goto bad_cmd;
         }
         switch (sd->state) {
         case sd_transfer_state:
-- 
2.41.0

