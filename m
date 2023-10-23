Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1704754ejb;
        Mon, 23 Oct 2023 16:47:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC/gUzRy5r9YXsQN/hadvArX2dYnvH7I0mpRUdPusr7Un9trN2+ylVtJC47b1g4ku1pwcF
X-Received: by 2002:a05:6214:1d09:b0:66d:44b6:8aa8 with SMTP id e9-20020a0562141d0900b0066d44b68aa8mr11214038qvd.47.1698104855133;
        Mon, 23 Oct 2023 16:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104855; cv=none;
        d=google.com; s=arc-20160816;
        b=xQ7NuG3A96Ff+lnK/673tZVpYDt3mpwk7W8rwjsqA/OmBaTmCFSiL2gA0RcHzv2uCt
         pX8g+SjndaU5uABHQd9I6nxsV1OV8aXDR5tbUAFxpIvSBlbQjmHyI0TUDMyyaavUMxqx
         4GM7H17Wfpquompx2ejXvhhwHy7Cnx/e+V58suqeRThKrnHrqImO+mGs59nGpS88hXwT
         99FtP6lqxXabAg+mp8Jfbb2lthP/Ogv9G630KKTauS/j75lmLeKRbzCvLUvDzlC/KX54
         /iNPMPmM26WPgL+hGbMozah4EBUPWQjELwjK8+jBBJC/RKUka6Sb9keaMQfejKEV8+Yi
         SxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=hBi9ecZu+jknETLfEjF91XegZl5B2r+QYOyPgwOcjHE=;
        fh=Mz0v6aCc/GPSuGOAcNmOuoiwEqcNHc5EwzP8i2J+/2g=;
        b=kBtHqMavk8ti9GS33zFaejPj3aknYFY/VJw0H7Mub389sH3QCiBej9ElW+hgxdIDZ2
         jqJFXkqBlO/f2wKqhWHkZC/C8gyNO6ejK7gqxcX3bsZzC8ji5a4En9VFVYMkjPtgIqLn
         4eN3xAtEQSyMzQ+r9G/blKR6n4+td2ipA9rGaHAA1xPbZEMEeZrBY//diBzMa0rOZZtf
         GEEH0LmCqyU6lcddcIj5oPMjI+bRcJr9tkS6paxvp3NqTQ2HB9n02N6QGHrnDkMlCMrK
         eM5wv/GWCcm+pVJfJcUQHrIyFwvbrRXA6V7m6RxYy3aevDgXG9NS/XleySNdb/+1EOlp
         gDeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xoQrMLa9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ad44bb1000000b00653589bac0esi6221457qvw.509.2023.10.23.16.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xoQrMLa9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv4dU-0002qC-AY; Mon, 23 Oct 2023 19:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38QU3ZQYKCAo3s3421qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1qv4dR-0002mL-8V
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:01 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38QU3ZQYKCAo3s3421qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1qv4dP-0002lJ-Dy
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:00 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a8ead739c3so52367027b3.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698104818; x=1698709618; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hBi9ecZu+jknETLfEjF91XegZl5B2r+QYOyPgwOcjHE=;
 b=xoQrMLa9vGOddbcKH0N7gPKv2Ql1h/9i2Gvz6GxuuTxSlugC4WveA1iHquvDZuSYtS
 Wk+wyydtEsYAOScKzr8jiDgwX57fgCoLj/O9ExSCYbHZj/4l1r+dEsh1tKeIwWmyleCm
 yT0SPPWEb/8YsdkflUfUCjxvvJSTzd+W6/BuiNH/Ll0fpZdp1mAHIqUFgIQhRmyB8vWG
 PN0YnCHBood/PUmHl5rexXWxMxNIOptLESiHrjo2aOKxTw1URzdN0Df7oZdyw9q1gk90
 +xRw9t9cMjl3ApqheSvmXnVKhPwkzVzBg3V5s9GTbkU26Htk/vxN5TuJrX3UZ6XW1v1h
 +jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698104818; x=1698709618;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hBi9ecZu+jknETLfEjF91XegZl5B2r+QYOyPgwOcjHE=;
 b=greBhKagvDJSijKjtYhNDbpz0MRkjtWfaKZVqvtVaRjPX2J1p0MflUpBUaX8DfWCnu
 tHw1CdzBWR/riUrDrHvG8f1M5UUE1hoYdYa8XirAPDM0QsbRPHXFt6lR/t0LaPnbi53o
 CALJPEbWnWUMe6ayTZ/yaZ3RvZWTn7S28II169O22WFIWKVEXVhPEavKYz4J5mK54tnv
 a7+M/R1NlhAEtZ1po3rHKcAAW+7M1OVJCIM3geMGOFK350pQmbMoFF97NQUEIXbuilHk
 0ltqLDyJ7jqRBF7iiXoA3QS3RfI0YJJTdq5N1jWpRsBm4JesXru70R/YzxbVMb2+zPjf
 NAGA==
X-Gm-Message-State: AOJu0YzfwmmsCAnQ3vMcTH0sTrZ49CgNcZcT7EVx3PchPE8JMIlTq8xu
 KLr0lQUe+TsLuTIT9+55+ev1m8uubXg=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a25:c5cf:0:b0:d9c:a498:c1ef with SMTP id
 v198-20020a25c5cf000000b00d9ca498c1efmr200160ybe.9.1698104817995; Mon, 23 Oct
 2023 16:46:57 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:46:40 +0000
In-Reply-To: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
Mime-Version: 1.0
References: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
X-Developer-Key: i=titusr@google.com; a=openpgp;
 fpr=228BD42BAD6A2BCD3865AEA6C41200175CD21E30
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793; i=titusr@google.com;
 h=from:subject:message-id; bh=DFzZTJTLw0CTmSTx82hBdiA+2byo4JM+5crzjaQBGUE=;
 b=owEB7QES/pANAwAKAcQSABdc0h4wAcsmYgBlNwXtyT65ehjpk1G3HI0rYb89KGrgO+LHkhvlr
 pyAHqH7GPmJAbMEAAEKAB0WIQQii9QrrWorzThlrqbEEgAXXNIeMAUCZTcF7QAKCRDEEgAXXNIe
 MKjlDACPXKl0VvqiIL+xetkQoN/Pr+swT5ig8aeZCkAefyjEa6kKr5g1t7GK5mkIQDmleoL7M5C
 UmpNxdxBeaczz5K5MydblhmHrAozTo6rkE92sWA15SCu4t2dkCc1Q4NXk4qdPOWxg9L/x356DMS
 PKhJB85bGNDYPSHTlCPpqOUxHbJCa/vt9aJsQ49iLJgINrXJ0sl9YvZO9Y0mzNjdV85Txc2quD1
 Q8YhiYI0NZr5qH6C0tBMK5mUKVrooWwXERJzcciD/8mtHZQLFaYXxR2U+9eXWJzxm8T+pfiWyW6
 dPWBA1S1rmIg8H61vVZSKNCJrPvcPXZ7NnzK+Zn58kLaWqBuUFwveZcTwjNHfIo3gbCSAdGigXK
 rBx/qvZj+cW+imGfMR3SEHxpHytEiTXkIKS7UuwUxmve66zkAk25KA9Uwfc+ZmBn0kk8HRDuJN3
 Gnh/nUMiVJDvpmCJMZHb4shXB1Yb7JP2v06P6iXxwKFtuIcdEIqa6txYJYEuHA7JLFni0=
X-Mailer: b4 0.12.2
Message-ID: <20231023-staging-pmbus-v3-v4-1-07a8cb7cd20a@google.com>
Subject: [PATCH v4 1/8] hw/i2c: pmbus add support for block receive
From: titusr@google.com
To: philmd@linaro.org, minyard@acm.org
Cc: Titus Rwantare <titusr@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=38QU3ZQYKCAo3s3421qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: ml+7tNkZDzwr

PMBus devices can send and receive variable length data using the
block read and write format, with the first byte in the payload
denoting the length.

This is mostly used for strings and on-device logs. Devices can
respond to a block read with an empty string.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
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

