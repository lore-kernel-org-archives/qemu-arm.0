Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1544006ejb;
        Mon, 23 Oct 2023 11:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8FNIkTxpKzOTxnTdhyN7QTI6lXnmvayHD5a7y2DpgX2B5erWtdolzPBmv+XDBLBmxQLtP
X-Received: by 2002:ad4:5e87:0:b0:66d:11fd:c9c2 with SMTP id jl7-20020ad45e87000000b0066d11fdc9c2mr15685894qvb.17.1698084596894;
        Mon, 23 Oct 2023 11:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698084596; cv=none;
        d=google.com; s=arc-20160816;
        b=wxyNDWo6jwYRhXPGHx4tLcM7KWUVh4WeWc9XSBsWRXKNTOJRGvMqS2aWTwrTOaFGo5
         RboZvIozyGE0k0h5Fzea32pa68jhv2y/R1iaFdxT7n/a3ZO2otglZtW0ZECdLiI3WURr
         I+gR2oRsDUILExHE1wrbRXpOzuuQ+qLoL4FqQgo2BZ4VGBiO6oOXwAo2bg5xbUkFX0vX
         E3UKFrD8ppv6rfVv1Vt4X3PNuN7Q7U9ho5ic761Irbm87AiycYK++jl/VqhIqGFEof99
         r5HpCxh9cvEy1g9E1jUzGGO6KIrpdV6YRFJxSTDSxOPk89AYNNwUaTcpjypFEwp3rNkn
         79GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=tr6BqDILaxbn7Hhg/79zBHPldU+oVgC3RO+BYZpqcOE=;
        fh=q4lL/uJQlrYuciyVDC1dM88wZO52S7lbF1hOqFxq0Bk=;
        b=Z7eGr3iDUKZQhH0cZIaYIMFULBNHAAB5TX4qSpZOBniFCiXuM34YeH8vv9sLvOyAKC
         WJm+4+KXpzWoWbpL5LBEZsVmHiE1CPCOregOWuc1cpn2zEY3PhmOa7Hj/0diZtInf0bx
         Y21BoIkdCECx7Tr4+lts8Ksm7MBQLVnAeYCHZM3xOxO9Ow67LcUiqGJ7ouIwmlSwLigA
         qFd+7e/KTSZe8aUT35GRrHb9gJQ11RR7DiaUPeMy6d7V1xtJbfY4RDz++kX9G1gXUfSM
         9ixoFyWXC4v3jqpM051EUrwns2W7I714jyKfwaocidNB72wBW05nZs59LAqX9sdFA5BM
         sSew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=VTlrvUwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a0cf8c9000000b0065b2d89bd6fsi5791561qvo.408.2023.10.23.11.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 11:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=VTlrvUwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quzMZ-0005Ua-MK; Mon, 23 Oct 2023 14:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xbY2ZQYKCD4ynyzxwlttlqj.htrvjrz-fwrstslsz.twl@flex--titusr.bounces.google.com>)
 id 1quzMW-0005Q7-DJ
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 14:09:12 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xbY2ZQYKCD4ynyzxwlttlqj.htrvjrz-fwrstslsz.twl@flex--titusr.bounces.google.com>)
 id 1quzMU-00071H-Jg
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 14:09:12 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a7cc433782so44995367b3.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 11:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698084549; x=1698689349; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tr6BqDILaxbn7Hhg/79zBHPldU+oVgC3RO+BYZpqcOE=;
 b=VTlrvUwXsUqvjPovrdpyyAJqSJKOI924WMtT0EDqGwHARrneLIXcxJ85AwESAmHnp5
 d88It1kRr17K2NcT5td2+8PEFpygeHjVrrB6u7qE2Be6amZiwl0Q/d8b3mqEH4RmUe8/
 wx8XQ346fnWA3nWugDjPb1ayAFGDFB+mtu2f3A+U15jL8enTvgzQpBI7oWI2GaCWfKp7
 tfWOunO8yzZfXTF58L5iLvGu7cFPK/yPdHtLJ6Rjlvo4t+4vg8blqbkFr/77t/1mo7oU
 wjvuC1EDvul9s2Asg7BQVZ2cN2dZBmGrnWC9EQbMVcZQB9cCEUww4FKfP42MAcBPalOG
 CKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698084549; x=1698689349;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tr6BqDILaxbn7Hhg/79zBHPldU+oVgC3RO+BYZpqcOE=;
 b=mwEZnFNFyJdsLIqJv241yVZgF0GvLuv8g1d7rwt8DXim1wQLkCZreB8rSAJ1o+Xfj/
 1Zp7PiOM5CUcvq7V2iDrqBVoqYspP4jghVPE/UJFKmWNeXCOLzf1OpO6XcI3HXYULN+0
 DfYIPaz/9AFWhV+AEV7+iibKqK22ZBOpMzMB0bvF0NgYoY57BmEI5uZnqeINeDaZiYag
 KQaXD4SHoQsO8MhqAtzfhSBDBNNIps/bMP9u/0sZeqFXdFLit1x/BMNcmPvh+zvbPfTY
 snTQCvGGawFkTWza8Nq6IikTgFLP4ognpOD5T+dSD4XzFnvqo+FWqBNQVD4X1dTU6Rsy
 /dFg==
X-Gm-Message-State: AOJu0YwiGjAcfVqsljWqU546JN+BLhUNBF9mte2zggT9hrGXEJi0cX0i
 5vxoYatSDkG1/C10ZoaRE1b3hGOLzsdmRVEQ4z1Z8ZQCtyFQoa3vBv/zHL6EimUc9CgoHihpHBN
 YIHQJBgnHSIXe5VKQSGMFxl3ET1wXesH4ZPsBquB6qwaOwiaCI1XzdLANbA==
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a0d:d50f:0:b0:5a7:ba09:44b6 with SMTP id
 x15-20020a0dd50f000000b005a7ba0944b6mr213630ywd.0.1698084549313; Mon, 23 Oct
 2023 11:09:09 -0700 (PDT)
Date: Mon, 23 Oct 2023 18:08:37 +0000
In-Reply-To: <20231023180837.91785-1-titusr@google.com>
Mime-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231023180837.91785-9-titusr@google.com>
Subject: [PATCH v3 8/8] hw/i2c: pmbus: reset page register for out of range
 reads
From: Titus Rwantare <titusr@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 philmd@linaro.org
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3xbY2ZQYKCD4ynyzxwlttlqj.htrvjrz-fwrstslsz.twl@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EvWl5UPcKhIZ

The linux pmbus driver scans all possible pages and does not reset the
current page after the scan, making all future page reads fail as out of range
on devices with a single page.

This change resets out of range pages immediately on write.

Also added a qtest for simultaneous writes to all pages.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/pmbus_device.c       | 18 +++++++++---------
 tests/qtest/max34451-test.c | 24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 481e158380..1b978e588f 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1255,6 +1255,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
 
     if (pmdev->code == PMBUS_PAGE) {
         pmdev->page = pmbus_receive8(pmdev);
+
+        if (pmdev->page > pmdev->num_pages - 1 && pmdev->page != PB_ALL_PAGES) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: page %u is out of range\n",
+                          __func__, pmdev->page);
+            pmdev->page = 0; /* undefined behaviour - reset to page 0 */
+            pmbus_cml_error(pmdev);
+            return PMBUS_ERR_BYTE;
+        }
         return 0;
     }
 
@@ -1268,15 +1277,6 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
         return 0;
     }
 
-    if (pmdev->page > pmdev->num_pages - 1) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                        "%s: page %u is out of range\n",
-                        __func__, pmdev->page);
-        pmdev->page = 0; /* undefined behaviour - reset to page 0 */
-        pmbus_cml_error(pmdev);
-        return PMBUS_ERR_BYTE;
-    }
-
     index = pmdev->page;
 
     switch (pmdev->code) {
diff --git a/tests/qtest/max34451-test.c b/tests/qtest/max34451-test.c
index 0c98d0764c..dbf6ddc829 100644
--- a/tests/qtest/max34451-test.c
+++ b/tests/qtest/max34451-test.c
@@ -18,6 +18,7 @@
 #define TEST_ID "max34451-test"
 #define TEST_ADDR (0x4e)
 
+#define MAX34451_MFR_MODE               0xD1
 #define MAX34451_MFR_VOUT_PEAK          0xD4
 #define MAX34451_MFR_IOUT_PEAK          0xD5
 #define MAX34451_MFR_TEMPERATURE_PEAK   0xD6
@@ -315,6 +316,28 @@ static void test_ot_faults(void *obj, void *data, QGuestAllocator *alloc)
     }
 }
 
+#define RAND_ON_OFF_CONFIG  0x12
+#define RAND_MFR_MODE       0x3456
+
+/* test writes to all pages */
+static void test_all_pages(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint16_t i2c_value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    i2c_set8(i2cdev, PMBUS_PAGE, PB_ALL_PAGES);
+    i2c_set8(i2cdev, PMBUS_ON_OFF_CONFIG, RAND_ON_OFF_CONFIG);
+    max34451_i2c_set16(i2cdev, MAX34451_MFR_MODE, RAND_MFR_MODE);
+
+    for (int i = 0; i < MAX34451_NUM_TEMP_DEVICES + MAX34451_NUM_PWR_DEVICES;
+         i++) {
+        i2c_value = i2c_get8(i2cdev, PMBUS_ON_OFF_CONFIG);
+        g_assert_cmphex(i2c_value, ==, RAND_ON_OFF_CONFIG);
+        i2c_value = max34451_i2c_get16(i2cdev, MAX34451_MFR_MODE);
+        g_assert_cmphex(i2c_value, ==, RAND_MFR_MODE);
+    }
+}
+
 static void max34451_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -332,5 +355,6 @@ static void max34451_register_nodes(void)
     qos_add_test("test_ro_regs", "max34451", test_ro_regs, NULL);
     qos_add_test("test_ov_faults", "max34451", test_ov_faults, NULL);
     qos_add_test("test_ot_faults", "max34451", test_ot_faults, NULL);
+    qos_add_test("test_all_pages", "max34451", test_all_pages, NULL);
 }
 libqos_init(max34451_register_nodes);
-- 
2.42.0.758.gaed0368e0e-goog

