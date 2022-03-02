Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp335782lfo;
        Tue, 1 Mar 2022 17:51:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxN3Xg65AEuKqcH5dAhYgUyU+7szLQ6Ps+Is7JYlf8hW3nKwcWhCnF81VZsCkvXVNkXI6Mj
X-Received: by 2002:a81:3595:0:b0:2db:d316:62f4 with SMTP id c143-20020a813595000000b002dbd31662f4mr7626850ywa.453.1646185909622;
        Tue, 01 Mar 2022 17:51:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646185909; cv=none;
        d=google.com; s=arc-20160816;
        b=zAxiN7NalTb5c7xcdAw3FZGnz9mfwtkXk5oDY9V/9nHfptUYZybEKQiimFAoxffEM1
         hgGdZha/LBr40JzNvV8dOd+YM6p9APddxce4dvhZ4Ogg+NXOJFWYNbpKIlBTSVeZODs6
         /HWyDQz3klRaYQLHA1MM6gcqkroqa4iZDorRRtjMIfVt2p7R0OpSHx+7CSpaZzzb6AxN
         aXzaAfew3HrDEtLuc5hgtw2LjgSwAQT6vEnZW4Nj2CcHWAFfXhu6DtRmaEoU3fhyN+bn
         bRLX/Cvih5xIJ8sqcSVQyerkR/KvgzKtXFDeezqFbdBmaM30Az0/QkEOb7+WBiOfWMpP
         PbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
        b=c3zcDjm9NCTOjObjyl10A347gwneX6JDubZm4LjZQoAzMHz8rXZUZmMDZadc8xtr7J
         iWJQ7nYjDPLnqLQxvtRQj9OIIz283Tqa+oyjS9AoV/+ok7n9vNgANzqwFNr6Skpgvuvu
         pO0PAZ5FF/wjgHQ2EsTx7fGWSQ49WVsCnSWmMq4g7MGbHhmJZY365dT9Li+vizgd+iPw
         0bfVrPTy9SapO7lG6UkjKccQBRAes401x6HVU1Dd6eJ+4S7SIGGLQx1Limy6RH4fAF7y
         MqmJwKfb/Z5mU+HWxYwXcyu8BB0hNcisFAF799ZufCXmuTsblSvRxrZG7ZseAKaMtxBw
         d0vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PrPSE+al;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a81ff0b000000b002dc068e3899si840410ywn.449.2022.03.01.17.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 17:51:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PrPSE+al;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPE9d-0007y4-05
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 20:51:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ks0eYgYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPE97-0007cx-WE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:18 -0500
Received: from [2607:f8b0:4864:20::b49] (port=55251
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ks0eYgYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com>)
 id 1nPE96-0004zt-FA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 20:51:17 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 x11-20020a5b0f0b000000b0062277953037so156082ybr.21
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 17:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=PrPSE+alUxesQE9QCHPpKglatXwma04vyfRTLAysKvatKxN9oo1nHmGL4Fmy5i445q
 BAhSppH+QyB1oIB9JPxXHTrzibhsbLGXQcCmkWAavVYkShilJ9g54sz+oq6fxDz1cRvk
 78IyHrwshOpRcohd6nU/gp8i/uH3PW9LKjBqzJ/gZY+wDL2De8moT7MRalnFcI4NcDzo
 hUO/V2wd4XXwSkj9xKE9D9c8rY713QaqGd2copJ4EwGpgobKCkXyX+R6idwiVhathY6m
 noruaEPkKEw6Ix41GtF+7PYvgjykXwPjYi8sSTkA7qqApyfAH+hiv/sWzRlgF8nxqtmo
 2DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=2GKmr41WlSpkGYGtOm5akUicBgQyfrnM+ca2dP618ZIGMPmAB3nP1QH6PlD5i1FX+I
 TVCUr3gFZGztJ22ioQ0JKXXIcwRgtGgT/mGSRNxQJq/tCmzKML4mNioRZ6IjSlDGnUPE
 pLkQp4vNaWu6H4NByY5p9yUxoHBGb+3UAp4EsDdYYYIAEHeol4jF29gpouGRYDBWmJ0n
 31qE7P/ncHuBvBJByVuiPIPcib82PzyOrLfZJBPscqzHZLWZc9ExcQsJgky0vBAi5vm9
 WiWZW0HaeGUpQJJMfYqDC0Lh08VR7tb8fgA8gD0FecGTg9cGzpF5q5np0pLWM38g+Hym
 adJQ==
X-Gm-Message-State: AOAM531G8GVvwDljSO01r3Pk7Ho9ERyEV/h8mHxembKUwq4uxxSWDZBS
 Rz7gpNZFNgPjqeaKb3clPxj1t8xziec=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a0d:ca8f:0:b0:2d6:b8dc:13f5 with SMTP id
 m137-20020a0dca8f000000b002d6b8dc13f5mr28277501ywd.323.1646185874896; Tue, 01
 Mar 2022 17:51:14 -0800 (PST)
Date: Tue,  1 Mar 2022 17:50:50 -0800
In-Reply-To: <20220302015053.1984165-1-titusr@google.com>
Message-Id: <20220302015053.1984165-7-titusr@google.com>
Mime-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v3 6/9] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org, 
 Shengtan Mao <stmao@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ks0eYgYKCr8ynyzxwlttlqj.htrvjrz-ij0jqstslsz.twl@flex--titusr.bounces.google.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/hNYYkf2e8M

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
 include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 3beb02afad..1036c41c49 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -28,6 +28,24 @@ uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value)
     return x;
 }
 
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp)
+{
+    /* L = D * 2^(-e) */
+    if (exp < 0) {
+        return value << (-exp);
+    }
+    return value >> exp;
+}
+
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp)
+{
+    /* D = L * 2^e */
+    if (exp < 0) {
+        return value >> (-exp);
+    }
+    return value << exp;
+}
+
 void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len)
 {
     if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 72c0483149..9a274247ab 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -446,7 +446,7 @@ typedef struct PMBusCoefficients {
  *
  * Y = (m * x - b) * 10^R
  *
- * @return uint32_t
+ * @return uint16_t
  */
 uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
 
@@ -459,6 +459,24 @@ uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
  */
 uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value);
 
+/**
+ * Convert sensor values to linear mode format
+ *
+ * L = D * 2^(-e)
+ *
+ * @return uint16
+ */
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp);
+
+/**
+ * Convert linear mode formatted data into sensor reading
+ *
+ * D = L * 2^e
+ *
+ * @return uint16
+ */
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp);
+
 /**
  * @brief Send a block of data over PMBus
  * Assumes that the bytes in the block are already ordered correctly,
-- 
2.35.1.616.g0bdcbb4464-goog

