Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1544028ejb;
        Mon, 23 Oct 2023 11:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEat9H+ZAtkot95mIkjlfczMmOHNlVj0dqa/ygv+YzwkOTbtGeKW2sGKdcpNrhbfmbkTbTX
X-Received: by 2002:a05:6102:23f7:b0:457:bc52:9b04 with SMTP id p23-20020a05610223f700b00457bc529b04mr9385847vsc.35.1698084598532;
        Mon, 23 Oct 2023 11:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698084598; cv=none;
        d=google.com; s=arc-20160816;
        b=E+kT3nybFhCaAw4sRo1q3j04jLfpP6Vv22shAFahcWgbo1O0P7+Ex3KI9gKf8RHzDb
         YLD5tNF9ColrrmgNN5BiqaqDs0YtumG48V/bIaZQTL7qmocHa7b3xFEZQvaxQAXrwfPl
         shxGW+0LXkHKB8jEnlqkE3Wc6wHQB0/atdZ4Naa1INvOijsOy2fjxB6Lq1ppNvtPqOBk
         Ec4yGt00DOwcHFhUrtBC9AySc6z2sfjIBlYKqf+TnxFTICSvRku5F79bwRsU+G2EnVg8
         HokUpUp7odB6JNSj8Qis6NQsSQk6SccOioRrbqIr5f5SV3kn2LT5PlIj3qLniJJAAA7U
         WOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HFnWjYOHB5EqSxwGHy/1s7BktEbWnkfGQGD6lm68LPo=;
        fh=q4lL/uJQlrYuciyVDC1dM88wZO52S7lbF1hOqFxq0Bk=;
        b=de2fIdldNV2X9hoy2dYKh9nljev7+W3nJ21Kb19B7DEzjWYrQtFszFJ6tDe0uuTJZO
         MTogZzfP2cqMcFHylS8B+4QqkIerQI/VUPQbKQyFDRhW9jVFT+444REY0ZtK+YEc4x+q
         NBR/64X9reNYECnaUl2MnP3yYwkReP0mpyU8T0CEStKsCvA6PUgOf2DGEqeD5Zv1DlK9
         UWlZRdU9Ze3KbusclpLkNyF+o6oHGdkV+BTVDePWf1VepnMtVtpgPgICCG9mRswAVyo6
         E8dv7XjOiSPsDFvPGRwd7S8DZ/esv+54m+K6wat9ddGNV0ELLrRUP9pUTmcKCIFrAhJO
         viXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OB4AEKyD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ma8-20020a0562145b0800b0065b0f071752si6111777qvb.171.2023.10.23.11.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 11:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OB4AEKyD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quzMS-0005Ng-S8; Mon, 23 Oct 2023 14:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3v7Y2ZQYKCjgncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com>)
 id 1quzMR-0005MJ-01
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:07 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3v7Y2ZQYKCjgncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com>)
 id 1quzMO-0006wp-W8
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:06 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d9a60a104b6so4522055276.1
 for <qemu-devel@nongnu.org>; Mon, 23 Oct 2023 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698084543; x=1698689343; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HFnWjYOHB5EqSxwGHy/1s7BktEbWnkfGQGD6lm68LPo=;
 b=OB4AEKyDHOauNwoOzAPUwTc0B4tZyfVR0PUM8hgqXH0vC1lgBvdElOCavvhyc8KPva
 bdSVwrIqV4W3/rtdxinhYBm17EQqA5uilpJhc4HshJtvHLYWihvxIrc6ajQaYDZNf5+v
 WPBVpe8qEvRqgxqoqNFgGcYw19SrZu1URg+weKU9pwQNwj3D2j5MqM6eo3xFD+5WBnvs
 xkVXcVPCvOUyTf3yxyAZKxLIrGMl655vQe8MYv6HhcwRsRhTTobarpK1/CbeqyULRdV8
 EY6gDyHSK8m5DQhStSKQdroACaDzEqoFPxVclSO8QHB4q4W04rOvOF8NYO3+ldDvggIw
 nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698084543; x=1698689343;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HFnWjYOHB5EqSxwGHy/1s7BktEbWnkfGQGD6lm68LPo=;
 b=mRI1Vo/eaXRT+X2UQ2ga4QvVwm6CEgI2C/+mcHQDzyp4UxCEXvaK6mu2OkBw9A0dJR
 zS17xRRcdWmzLe8hSBjT327lXUZXd28sfkqkNCQVGXjVFZTTkuE8kTmuWPYWZlUUZdWZ
 LcqJT3yU2RFX+FNI4z5CwGQsnZ6owbtgrekT9j3rjonfqDsQ87LyL77KBN4gqwPKv1uZ
 /ch/fOPpeA/Y9gnyZMk7YTRQNTMwdH98g2TCqqMU+YqewOPqWerkzzZ9i/pQ4XfpnKka
 zX6z/4K+1TWnKMwcugD29Kn5gcmb8FM2iTNrK5RnGvPMvI0NN0xgKhNanemYi3oDkmgz
 vzYA==
X-Gm-Message-State: AOJu0YwSu3ogYTqXlZXDan9QrWOhkKt/Kgs6ivODN5w566SydaxCT+p4
 eRmVBe0egdITxeNdMvv92bDsQOZBrRE=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:938e:0:b0:d9a:fd4d:d536 with SMTP id
 a14-20020a25938e000000b00d9afd4dd536mr256629ybm.3.1698084543317; Mon, 23 Oct
 2023 11:09:03 -0700 (PDT)
Date: Mon, 23 Oct 2023 18:08:30 +0000
In-Reply-To: <20231023180837.91785-1-titusr@google.com>
Mime-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231023180837.91785-2-titusr@google.com>
Subject: [PATCH v3 1/8] hw/i2c: pmbus add support for block receive
From: Titus Rwantare <titusr@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 philmd@linaro.org
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3v7Y2ZQYKCjgncnomlaiiafY.WigkYgo-XYpYfhihaho.ila@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: dH1QritD/85v

PMBus devices can send and receive variable length data using the
block read and write format, with the first byte in the payload
denoting the length.

This is mostly used for strings and on-device logs. Devices can
respond to a block read with an empty string.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 30 +++++++++++++++++++++++++++++-
 include/hw/i2c/pmbus_device.h |  7 +++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index cef51663d0..ea15490720 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -102,7 +102,6 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
     }
 
     size_t len = strlen(data);
-    g_assert(len > 0);
     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
     pmdev->out_buf[len + pmdev->out_buf_len] = len;
 
@@ -112,6 +111,35 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
     pmdev->out_buf_len += len + 1;
 }
 
+uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len)
+{
+    /* dest may contain data from previous writes */
+    memset(dest, 0, len);
+
+    /* Exclude command code from return value */
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
+
+    /* The byte after the command code denotes the length */
+    uint8_t sent_len = pmdev->in_buf[0];
+
+    if (sent_len != pmdev->in_buf_len - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: length mismatch. Expected %d bytes, got %d bytes\n",
+                      __func__, sent_len, pmdev->in_buf_len - 1);
+    }
+
+    /* exclude length byte */
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
+
+    if (pmdev->in_buf_len < len) {
+        len = pmdev->in_buf_len;
+    }
+    memcpy(dest, pmdev->in_buf, len);
+    return len;
+}
+
 
 static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 93f5d57c9d..7dc00cc4d9 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -501,6 +501,13 @@ void pmbus_send64(PMBusDevice *state, uint64_t data);
  */
 void pmbus_send_string(PMBusDevice *state, const char *data);
 
+/**
+ * @brief Receive data sent with Block Write.
+ * @param dest - memory with enough capacity to receive the write
+ * @param len - the capacity of dest
+ */
+uint8_t pmbus_receive_block(PMBusDevice *pmdev, uint8_t *dest, size_t len);
+
 /**
  * @brief Receive data over PMBus
  * These methods help track how much data is being received over PMBus
-- 
2.42.0.758.gaed0368e0e-goog

