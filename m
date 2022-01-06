Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1349972lfb;
        Thu, 6 Jan 2022 15:16:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR2lKzFfk2zzyFJ5/VLNM81yWiOi+Rnfhl2AwXOGrgplZU3TUWEpwPeh2xjZTp5lJP8lJ6
X-Received: by 2002:a25:6dc6:: with SMTP id i189mr11339103ybc.471.1641510979057;
        Thu, 06 Jan 2022 15:16:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641510979; cv=none;
        d=google.com; s=arc-20160816;
        b=sN1ThTmkOzY3RTGZq6u2vQPxPCPDoaWJlKxwkwLtBQqZYAkdeEYtks2u0L2f+8P/Wl
         xDEGEsx7OUAKbMF7Gpp4O9cmx1LjntgTvq0HF8nf6TxlXRxlhC2E+jLVRsEe3U5h4Ppt
         5gYjA30ZMFvLo4Gcz4ZtjKLOXoLxpg3ZjAXJPbXZBDak7zwJSLKZ6bYMhs2Ofhc2RpGF
         GQDlust7TLSwT7qRc7VcwUJidL50mawndCJnkZy2yPOKX0l+FABqLX/PWWmXLXOPWVf7
         OFa9VmdZxTUaPms6SRECXi+wJii0EpcHyW61EMTvLB6ZFgj98cSKYaYBCfCqHdpRjZ5r
         5nbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=YbOjq3KDlppshwQpezVsb9MS/E9NuLAoax6A9T70OSQ=;
        b=Mpcztga2RKwTNhXZpNw0AzRPZTfy+eMC73rSUv4IzgcQFHOnPEFqGA0vRxMTfWYaXD
         2PowQCNfBuAtJTVHdADPBgBTa4kQbl+PR74iZ3cFK/A1Ufr+8IpawED8dRbKRqNAXDet
         UcGp3Y6tXf66HoCQGYB7NLqiRe59lMaD1mZnFFG0MdpnJwObNZtE8G42pCj/3c957J75
         TAAYeCfMcFFVzuunZhrnAAK3WuTUnvpQ5fSrfOYBWwnfradNIS7go+GM/g3wYuZ3xNQs
         5AVqMvQ3m5I336a09C9XeUxv85O9D+VJvHBoDup2PDc0z+9islx7rhCeGFhFd48ikUm8
         /O0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jc5cDr3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si2501861ybj.256.2022.01.06.15.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jan 2022 15:16:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jc5cDr3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5bzW-0001kV-DF
	for alex.bennee@linaro.org; Thu, 06 Jan 2022 18:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wXbXYQYKCCIRGRSQPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1n5bz7-0001gW-Jg
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 18:15:54 -0500
Received: from [2607:f8b0:4864:20::b49] (port=54020
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wXbXYQYKCCIRGRSQPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1n5bz6-00064i-42
 for qemu-arm@nongnu.org; Thu, 06 Jan 2022 18:15:53 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 a9-20020a251a09000000b0060b2c94d515so7946689yba.20
 for <qemu-arm@nongnu.org>; Thu, 06 Jan 2022 15:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YbOjq3KDlppshwQpezVsb9MS/E9NuLAoax6A9T70OSQ=;
 b=jc5cDr3OREYGEfR5CAaIq3QBrJAl5cWO28XpM4lxNWwQTw+Vy5PYSvXqYX7fbyR52I
 cWdZw7lCXIzVmaR2kLc9kX3i8yWnJamLHHV5/8s6vmwIsgVWJ1Sd7rNLwBahvgaF+uAm
 8F0g8NAgCBNirvUzrv1DmaU4c8uFzPuOqQC4/fzeG3d7rC5uVspPnVB56ERcpk9Guqzf
 D91DfkF4xaWqWYogM4WySnXvT3PJscbIPOhwUqj1RYVCT4q4MrBX4okH4sZO003fj5Yo
 qFXCirB6STaz2fazj+eSJohIlFSs1ErdykfB7zsFFUg9EvKeDTgmP7jSgpS331hxLUZV
 AWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YbOjq3KDlppshwQpezVsb9MS/E9NuLAoax6A9T70OSQ=;
 b=n2ldn28AWVNpE/JyGUpMpWGltBTIewdgdTnaaCFsjtx0UgsuR7oWCLdBxl0/6JAjmQ
 ennoq0nJLABgc6Zr2ASddz9PjtwzUHIvKQMIufRw1/Ndu9/Q0wOkaZsA+90K+TMlOiov
 UAXrDf+oKJ5eQ+BvyCp8eqEieJxJegIbEfGm5TaC8Nfj0M86uaeGDN12Jr9zwUmeoNQ6
 jlYVBOfjnoDyJGR8n/3H3G0nD3mRc5OVzEOQ16wEnKMZR7hMDHNZqqeQWaxEcwGWABwX
 NxTZrb7ZJ7QNAXj06sPzo536AjTQEAgi71w0C49/bAOVyE8GLjpp+68eZwQZHBNboOgY
 w6qw==
X-Gm-Message-State: AOAM531p2yeE/e9OGNg77RyDJjn1xUrf8VyGhdBZa+MFv0FwNZB2w4a+
 WZsfCl1pZmUOxq+CS0KTQOuS5AlAIso=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a5b:386:: with SMTP id
 k6mr32905947ybp.706.1641510593947; 
 Thu, 06 Jan 2022 15:09:53 -0800 (PST)
Date: Thu,  6 Jan 2022 23:09:33 +0000
In-Reply-To: <20220106230936.417020-1-titusr@google.com>
Message-Id: <20220106230936.417020-3-titusr@google.com>
Mime-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 2/5] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: f4bug@amsat.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Shengtan Mao <stmao@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3wXbXYQYKCCIRGRSQPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: zJI5KalZJI4n

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
2.34.1.448.ga2b2bfdf31-goog

