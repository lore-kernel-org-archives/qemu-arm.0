Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1912397ejh;
        Tue, 9 Apr 2024 06:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA4VJxxpCK61OxALqKVrkewCEV/d5jyZ65XVYE1kPiuRjJ/w2Liq5Q40fD4+EFcQnSL7p4YtBDwBNuFKUDD18EV+aUHppV
X-Google-Smtp-Source: AGHT+IF79/mJOR6pPIWxvZ5NgfzGKYbwZs3J6O8PvzvluSHZL7+Vg9A2hoimDf1exB9k9Vd9zE7y
X-Received: by 2002:ac8:4a04:0:b0:434:aed1:844b with SMTP id x4-20020ac84a04000000b00434aed1844bmr3923760qtq.37.1712670019932;
        Tue, 09 Apr 2024 06:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712670019; cv=none;
        d=google.com; s=arc-20160816;
        b=WM+uTfwiqxMLOL6VZfL8pB6R6t4L1PrHZ4xTWs5i3r2xrUMAYwVgpY+M5ys3lBt2Sv
         +InZQIbrScUYlacxrBMx389UF9LGTD/2M2WNvP+dlt7FbS2WnHbmeoijLFf9ZTD9/bjF
         05MEKtZfOUkDLHFNx5j442ZyMtkj9lvbG7ZuOUYzGu62jef2GJfL84XbTNXmFql+ZcNn
         0UtJ4Uab4Nx2GHYlt4rZRrvX2LGN+gEm9vAxvOI54u2qc84HhEDn7Axd4RvIVad9kuGb
         H1zh9QsKIV7Osc1/C9uJipyo9nciZ6YFrd8WWwhhzi8TkUFFtk/Ep/164psKPVXFh/d+
         tqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=REIm1SfLMUgG42n/AOyva4uJWnD7BJmJ3hGw4grtNrQ=;
        fh=2Ou3mibJs8zqM7PH9STj4DkMucdu9TkhN4NUi+Pt0yM=;
        b=RftywJsNaI3xUgLStTBdCZ7lCwu+ZIrGNBvJoVVIYWfUcJFb5YzHwG2kyOw4K3GzN8
         QwMTtF72n4uosZn3zzd5sm6KO51Olr3y8Hoeg83wCzPUjIyWUa7tcs00RMtI3l46bSD0
         Pv3n9K0glN6rGKrQNXGGllA8QeffxE/kDDgKEPmP2hcZghhtKqxYtHJHKinHVecoPDZ9
         VXe4Vtd8jVjDj6JuBaIwvLiyj7NvU1KU5el335VlUqjH/E4LKgzEcGx85WqSfjuq/nEP
         XRCZ0C8D6+u0CQryeR90RCNRDaEU413ss9VNnH9ei8e/xl42fd6p2KOf6syVKm7SRfcg
         Yp0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LSZmv35s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp31-20020a05622a1b9f00b00431405206f1si10399091qtb.545.2024.04.09.06.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LSZmv35s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBhF-0007ZA-Dy; Tue, 09 Apr 2024 09:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgj-0006Jh-N5
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:39:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgc-0008Go-KR
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343b92e54f5so4224143f8f.0
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669932; x=1713274732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REIm1SfLMUgG42n/AOyva4uJWnD7BJmJ3hGw4grtNrQ=;
 b=LSZmv35s7D27V3+dGrZnCHfE9CB5s/cbgVpq5VCM3FIjLogRnulB1NLvrZtcIIwGJh
 eJM+XFKPxDKbq5MAaQEO0ZDYTxIZOGayb4oY2c55XFTHcddBjq3XoplVkrupSYjbdgBs
 H+TmTVSv2qO6ifSkFvUskg4L+8eryWlfQ9Q7ugUmZbQjc2qqTsWbEhjrCD0uqyvRQvil
 CCnUz9o2+VO3g16PfnWXrr18rSrsLFHFN8hDa788XgpEhNMby5Yy9G+lAIZj6PEcPhue
 MtDxkOTibz42wArgsv/0sXAz7XIMcKVGjQdVfUIDpJNtn6gOaWlSNM4bdGTnWUn8FMUO
 t4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669932; x=1713274732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=REIm1SfLMUgG42n/AOyva4uJWnD7BJmJ3hGw4grtNrQ=;
 b=KLRmscQ5oqpaiTeBu3cs+BTUDWFB6UZvZU6mTejkcW0b6uSsX8Y+KzEf2pf3uzzjrw
 1puVY3baeVAbAdlgIpcEIjyFYXkY4rVBH6kgokYSk9LoAp97YAjy26SbQfl1gWJevk6x
 atPBr8uZ+mSSHw+nFrjNHZInLxAf69jJ2pvuHRiptz/U7gHXXkp4WUNVByzSzPxncCtd
 2ljpVZ9bLZnQa7EyxUMytNCehMUxfgZZSx9kBXvmoo8mqH58Spv7TUdq0lp5aPz9Fi0u
 IZdnrrdpjCkK+Y1hHQnKHNmoqCTS1GXxIasOJNJu5K0pJtYu2aXs4dbxiUVpzqbuUNtq
 nKaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+r8CAHv1N/nyt/o0+JeRICS0zEH0SYtaqbeKUk3FhzBC33vXkTqFE7v/TYwQ7ByHhQdT3MzgPugzNCglnKqYSNiIB
X-Gm-Message-State: AOJu0YwLiZR6OklzRmcXdU3sbGBgLqXSC9hpJNATqvqVIat+ahxbar5Z
 zLvM6UqiKv2MlWq6UQ8lKUPByERv3m4uOoNnjuqhdrFvDoAPtB50cfFSekYvzFI=
X-Received: by 2002:a05:6000:1864:b0:33e:48f9:169d with SMTP id
 d4-20020a056000186400b0033e48f9169dmr11866184wri.31.1712669932225; 
 Tue, 09 Apr 2024 06:38:52 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 j1-20020adfb301000000b003464e150e30sm236605wrd.15.2024.04.09.06.38.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:38:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 v2 09/11] hw/net/lan9118: Rename rx_status_fifo_size
 -> rx_status_fifo_wordcount
Date: Tue,  9 Apr 2024 15:37:58 +0200
Message-ID: <20240409133801.23503-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
References: <20240409133801.23503-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fB8DVOymzS3y

rx_status_fifo_size is a word count, rename it to avoid confusion.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index cace22381d..663776f575 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -259,7 +259,7 @@ struct lan9118_state {
     int32_t tx_status_fifo_head;
     uint32_t tx_status_fifo[512];
 
-    int32_t rx_status_fifo_size;
+    int32_t rx_status_fifo_wordcount;
     int32_t rx_status_fifo_used;
     int32_t rx_status_fifo_head;
     uint32_t rx_status_fifo[RX_STATUS_FIFO_BYTES / 4];
@@ -329,7 +329,7 @@ static const VMStateDescription vmstate_lan9118 = {
         VMSTATE_INT32(tx_status_fifo_used, lan9118_state),
         VMSTATE_INT32(tx_status_fifo_head, lan9118_state),
         VMSTATE_UINT32_ARRAY(tx_status_fifo, lan9118_state, 512),
-        VMSTATE_INT32(rx_status_fifo_size, lan9118_state),
+        VMSTATE_INT32(rx_status_fifo_wordcount, lan9118_state),
         VMSTATE_INT32(rx_status_fifo_used, lan9118_state),
         VMSTATE_INT32(rx_status_fifo_head, lan9118_state),
         VMSTATE_UINT32_ARRAY(rx_status_fifo, lan9118_state,
@@ -462,7 +462,7 @@ static void lan9118_reset(DeviceState *d)
     s->tx_status_fifo_used = 0;
     s->rx_fifo_size = 2640;
     s->rx_fifo_used = 0;
-    s->rx_status_fifo_size = RX_STATUS_FIFO_BYTES / 4;
+    s->rx_status_fifo_wordcount = RX_STATUS_FIFO_BYTES / 4;
     s->rx_status_fifo_used = 0;
     s->rxp_offset = 0;
     s->rxp_size = 0;
@@ -568,7 +568,7 @@ static ssize_t lan9118_receive(NetClientState *nc, const uint8_t *buf,
     }
 
     /* TODO: Implement FIFO overflow notification.  */
-    if (s->rx_status_fifo_used == s->rx_status_fifo_size) {
+    if (s->rx_status_fifo_used == s->rx_status_fifo_wordcount) {
         return -1;
     }
 
@@ -609,8 +609,8 @@ static ssize_t lan9118_receive(NetClientState *nc, const uint8_t *buf,
         rx_fifo_push(s, crc);
     }
     n = s->rx_status_fifo_head + s->rx_status_fifo_used;
-    if (n >= s->rx_status_fifo_size) {
-        n -= s->rx_status_fifo_size;
+    if (n >= s->rx_status_fifo_wordcount) {
+        n -= s->rx_status_fifo_wordcount;
     }
     s->rx_packet_size[s->rx_packet_size_tail] = fifo_len;
     s->rx_packet_size_tail = (s->rx_packet_size_tail + 1023) & 1023;
@@ -732,8 +732,8 @@ static uint32_t rx_status_fifo_pop(lan9118_state *s)
     if (s->rx_status_fifo_used != 0) {
         s->rx_status_fifo_used--;
         s->rx_status_fifo_head++;
-        if (s->rx_status_fifo_head >= s->rx_status_fifo_size) {
-            s->rx_status_fifo_head -= s->rx_status_fifo_size;
+        if (s->rx_status_fifo_head >= s->rx_status_fifo_wordcount) {
+            s->rx_status_fifo_head -= s->rx_status_fifo_wordcount;
         }
         /* ??? What value should be returned when the FIFO is empty?  */
         DPRINTF("RX status pop 0x%08x\n", val);
-- 
2.41.0

