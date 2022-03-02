Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp290233lfo;
        Tue, 1 Mar 2022 16:27:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywDk9wsSJLtEmIlu2rMZKzI38Ox3HauqPk2eUJoZlwLmBC14hw7Nfq9Dl8iuFE9bNEzKZn
X-Received: by 2002:a25:6989:0:b0:627:f5e8:c168 with SMTP id e131-20020a256989000000b00627f5e8c168mr17488922ybc.620.1646180845795;
        Tue, 01 Mar 2022 16:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646180845; cv=none;
        d=google.com; s=arc-20160816;
        b=RXoW6DmhmSvCf0EcCecAV+7kkghpYhD/b82pc9G+fl23VlhC4DmYF3Hs1fHqP/XV4V
         nZ55nwPLnowKfS9tuwxhgblH4YgNH3lA6RCll3xwNDnEgzWb4QCFpPPd+4yZUIK6urdR
         /uzdXY2GbY9CkLBSeBz+yxXpFPsC4hL9BW5YCNVCjDz9BVv0gi2VbhJQpacX5zbSZzjM
         gsaqGtaooEpWBaoEBHWXPCWlUkDvdtpkO/MBoFdtpthJRkVkITbartD2fQ7+yTAxhwfE
         NvKeaiLD8E2UDMUtbP1v7SFo4X2O/kbugmkytBSqs0zHKUh14ks1DjM8X2yR/I5kdxa0
         c+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
        b=jClLnyfcaYZM2pUBYGcu36ne36Eg4ThDVLT+2VBe78dqaNC7+4BDCko69lvjsrfC7D
         L6jZ0Z3GGT2XEdkVqdM3TdphZyEgqX23a/mE4WWp1yZudepqPHTlJE0a2PWXn1PM0byQ
         vQTj0CgnrZVDykp1wYYKeD0u8azqA0q+yUbzxUAFjxLT7YjxxJ4nvpK69HK/s5FC4Q9h
         /bcQZHJW5f4Pane3PnQ42b+7TgdnPKY6VVrgowZDZFfpXa49wzpd/xhdFjdK7V7OrCf7
         Y2CcRqmnc9K8G+BqevVPEpaplqLkr9AAy1fIIvi1ZizwvJWsmFGsaf/dHNRYMQMWdnOS
         uNPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=QP2mFJ7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y72-20020a814b4b000000b002d6931e42d0si12005767ywa.180.2022.03.01.16.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=QP2mFJ7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCpx-0003kA-8L
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:27:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_bgeYgYKCAIvkvwutiqqing.eqosgow-ctopqpipw.qti@flex--titusr.bounces.google.com>)
 id 1nPCmB-0008GW-EP
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:31 -0500
Received: from [2607:f8b0:4864:20::b49] (port=48803
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_bgeYgYKCAIvkvwutiqqing.eqosgow-ctopqpipw.qti@flex--titusr.bounces.google.com>)
 id 1nPCm9-0002uK-2x
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:30 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 j17-20020a25ec11000000b0061dabf74012so15397448ybh.15
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 16:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
 b=QP2mFJ7P2kORaGo6uuhsS19D0Uy6/4OMoWWS5LqizEHUT1u05R0AVRy2kXQmTHe7xE
 bqQP29gov2gtVUTjcJqRaf5p8i9fVXo8qctTCevw9TGVmvD8ijOtq53seujGePx/HJ3s
 b3+CAmG9opTKp/YOoSaI2vaJm4TUuN4Gd2ch6H4aB9SK7n/Id9/sfsAHOYmpUeyd+rI8
 VXBU0Bi3HRI2OIB5bvSkDeVveFDHLqWLHzkNxJmnioNHJXS1NVsG/8cX6k8MLTWoKQKX
 NkURM6IDMlNmdhpSYw/r96+KL1oZZ6zdNau115wFfeSFZs5KZhBVMWau8fdrSMz5FvQv
 +7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y2EUdWJWmuYng2riwpVs90eiRzjJjFCIkE+E1jmTD+Y=;
 b=RJRoQzyZup8l2IbblN11EWatjv8vapafndE74Ap78q/7BekmRKBx7/vZVn9h131JwA
 gVnCnFV+AAdbWU4tVxu6n2mj2hLcVTaeeATGWWLnbTrDCJ/gk4tTGsR6nhdnBwC9atsf
 8U0NOWBzlInxgxMJoEa5Zjr6v88iczYp3i0uVxNgRoSUKzfr5VKbzTb4TDjSVzM7JTd3
 9KXeSP2oaw2CWoVl2//HYkC5G+6RIna1UXh5krWF5zFFxKnX6oz/tPwm/V3f7unfjVjV
 T9R+Mo5yvuDRAUuUJyoje+Rx1hbGE+aEcCh2vfRzFG3OB6xszG3edByG0wUOrKXacEtY
 /A8w==
X-Gm-Message-State: AOAM532YCo63Ca2Xx3cVUAs+B5B+t4GVrVu3xqb08grBRiKCDBMwE6/x
 qHAlwctkSvK+3skgvQ9u2QQJO5zv/CU=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a0d:cc93:0:b0:2db:931f:1e90 with SMTP id
 o141-20020a0dcc93000000b002db931f1e90mr11479404ywd.307.1646180605715; Tue, 01
 Mar 2022 16:23:25 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:00 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-3-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 2/9] hw/i2c: pmbus: guard against out of range accesses
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3_bgeYgYKCAIvkvwutiqqing.eqosgow-ctopqpipw.qti@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: CXxirWTn4Cgj

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 07a45c99f9..93c746bab3 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -243,18 +243,47 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
 
+/* assert the status_cml error upon receipt of malformed command */
+static void pmbus_cml_error(PMBusDevice *pmdev)
+{
+    for (int i = 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word |= PMBUS_STATUS_CML;
+        pmdev->pages[i].status_cml |= PB_CML_FAULT_INVALID_CMD;
+    }
+}
+
 static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 {
     PMBusDevice *pmdev = PMBUS_DEVICE(smd);
     PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
     uint8_t ret = 0xFF;
-    uint8_t index = pmdev->page;
+    uint8_t index;
 
     if (pmdev->out_buf_len != 0) {
         ret = pmbus_out_buf_pop(pmdev);
         return ret;
     }
 
+    /*
+     * Reading from all pages will return the value from page 0,
+     * this is unspecified behaviour in general.
+     */
+    if (pmdev->page == PB_ALL_PAGES) {
+        index = 0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from all pages\n",
+                      __func__);
+        pmbus_cml_error(pmdev);
+    } else if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: page %d is out of range\n",
+                      __func__, pmdev->page);
+        pmbus_cml_error(pmdev);
+        return -1;
+    } else {
+        index = pmdev->page;
+    }
+
     switch (pmdev->code) {
     case PMBUS_PAGE:
         pmbus_send8(pmdev, pmdev->page);
@@ -1038,6 +1067,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         pmdev->page = pmbus_receive8(pmdev);
         return 0;
     }
+
     /* loop through all the pages when 0xFF is received */
     if (pmdev->page == PB_ALL_PAGES) {
         for (int i = 0; i < pmdev->num_pages; i++) {
@@ -1048,6 +1078,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         return 0;
     }
 
+    if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: page %u is out of range\n",
+                        __func__, pmdev->page);
+        pmdev->page = 0; /* undefined behaviour - reset to page 0 */
+        pmbus_cml_error(pmdev);
+        return -1;
+    }
+
     index = pmdev->page;
 
     switch (pmdev->code) {
-- 
2.35.1.616.g0bdcbb4464-goog

