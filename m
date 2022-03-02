Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp291355lfo;
        Tue, 1 Mar 2022 16:29:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNkkRKnJnTFbrwQ6O/j2FB/WNVAxOHotDEkymJ6zR85eagOY4inYRK1o9NGhJGEpYti7Uu
X-Received: by 2002:a05:6902:567:b0:624:649e:1b14 with SMTP id a7-20020a056902056700b00624649e1b14mr25724333ybt.84.1646180985112;
        Tue, 01 Mar 2022 16:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646180985; cv=none;
        d=google.com; s=arc-20160816;
        b=r/oT/x00ZCuLvaRZHJKMPdnGcxkTpSDXC9/W5nUQNF2YJf+6ISD1TCDZOL8VnG/gw2
         GDk0Q3T0Rr2TFgxizlflToiaazodqVH8eEZm1xjZSvKRm3Oza/HWb8CCxfuprYkvqJIq
         rfcOsU9qzRKWwF7kxGg1jQ+x0qL3Zm90+UfVHwuvGT/s+Ooa7qCxl0W+1Kw/thb20Bcv
         u7FgDSywb+wKNfL8mv2s800hnFuM2OkRMrdsxgdIYm+g+bIjVtvKyhCSfTiU+JJ42L3d
         UchfXXmkb+OPPiqJiAG4/7ZP7btF8ELhvMVbPv1RU46p2FRYXuC9IwpdDdF+lPzU208F
         ny6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
        b=U61/zMFrLpuwyW7ZhGaeggRUCkuN8dCmX9CxFcd0vDx+IpM0Co2kFfCzoTCZuZVvko
         HphhN2z0WPYcV9bi41QxDhIRo/mZMrcpJF+Hd9YSF9SS19RB+fDGWoWuoHqNiRgXaHi2
         fpDlj2vCjw2okazbbxaTgo1r99kbOzZBxvOYDiHgcTZD1FnQ/Q4xyyJTRubm5Kcl3EYY
         6uYmhYy7HcF4PdI+VYw5nsRH6Bomq/rfKc16Ket+fJvRAAcNjopXacxnwG3PwsRyN846
         /M9x4PcAzVvk0M5MF4OpbaIfiHvmgtgz9BrrmAqfXDNhGw8kUuh/Tpa6JmMzyyxwwUCV
         Dziw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mO5CUDor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a250807000000b006221cfd3888si11439616ybi.219.2022.03.01.16.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 16:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mO5CUDor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPCsC-0005xj-Fb
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 19:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BLkeYgYKCAk2r2310pxxpun.lxvznv3-j0vwxwpw3.x0p@flex--titusr.bounces.google.com>)
 id 1nPCmK-0008Mu-2g
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:40 -0500
Received: from [2607:f8b0:4864:20::b49] (port=55820
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BLkeYgYKCAk2r2310pxxpun.lxvznv3-j0vwxwpw3.x0p@flex--titusr.bounces.google.com>)
 id 1nPCmH-0003Ex-53
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 19:23:38 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 b18-20020a25fa12000000b0062412a8200eso15292580ybe.22
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 16:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=mO5CUDor+WI9zZ1oHZfOBwMGxSPf6O7bUsACSSTY/eohY7BbMKskHLAYUi0pG5x/yn
 BnGP41fUlFfNQ8uFsn9dwjDnivBa+7D6yuBMapQPkokb2RO5/TEv6eF7SKm6ofMxW7FV
 MASkJF/JtxGNdiJropwF8nB4g1jtRtqXvmmFmeX5c4yexYHWIPUflg7S5nLyB7ZOfnwy
 a+iLoNF5lDuEHFpkG+NrHAXko3y+WDTBIUy5gj8dnhOjmxTPfgsfajsSN1U+ddi82jBG
 QUGaOZ3EMrYIzTFx+DMeDqRTNle79Iq7dK1rIYjPUbX/VO8oliwr6fFYwCeWzCHbf7XU
 maSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OuDjxU+Qw15BrOXbTXRNYAwlXoR5HJ4CkiZU3oZNlcE=;
 b=ZULaoae3/tG+WjTYRAGHTPm+4WD5KaQ8+aE1fTPg3a2AXnwtiEQwpGihHKoXAIqvdU
 +2CaB87BJFe2FwjsYwiAKhGpTa/Smym58PqfTKv2rX5145sGnfjkMKy3S2mEJWbMevBS
 8LRoO0ULoieafGGYTunkPVYkWNhtQ0Kcb/UygLSZzvqqUbtY7rIqqI7ZdwnPzNA9Zqp0
 DSINe9l7SAoruiTdXeWfrmddcz5rtNHzJ8lBVcAw6DH7wD89IBlgyikyljtzz/pvIkQu
 FjcUK6ih8s9WvxLwxQMGV4IP0bFx2yxCTgbJiNK3YT6jCmQYKrHmxAcU21b7dt1pC2Qr
 nafA==
X-Gm-Message-State: AOAM530kx99b0e30TizMNT4UDnS4oOgme2Hzn8qvJmoD4Of5Y/sieYju
 ++QHMQvO8AJ1TLZd682DFgQ6kVyb9l0=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3a0a:5449:c096:dc84])
 (user=titusr job=sendgmr) by 2002:a25:b004:0:b0:621:f386:f10a with SMTP id
 q4-20020a25b004000000b00621f386f10amr25596459ybf.314.1646180612929; Tue, 01
 Mar 2022 16:23:32 -0800 (PST)
Date: Tue,  1 Mar 2022 16:23:03 -0800
In-Reply-To: <20220302002307.1895616-1-titusr@google.com>
Message-Id: <20220302002307.1895616-6-titusr@google.com>
Mime-Version: 1.0
References: <20220302002307.1895616-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v2 5/9] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, Shengtan Mao <stmao@google.com>, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3BLkeYgYKCAk2r2310pxxpun.lxvznv3-j0vwxwpw3.x0p@flex--titusr.bounces.google.com;
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
X-TUID: CJawNNUBFt7H

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

