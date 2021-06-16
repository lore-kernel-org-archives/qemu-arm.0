Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp733883lff;
        Wed, 16 Jun 2021 14:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsENzFKwjb3Qj4URaXfpZ4u46sY2268k3/vBgqLZSbwaayg0Euuxh9y6iYXSzCC010sL4G
X-Received: by 2002:ab0:3724:: with SMTP id s4mr2305994uag.97.1623879878899;
        Wed, 16 Jun 2021 14:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623879878; cv=none;
        d=google.com; s=arc-20160816;
        b=w1ezcofmyKrmw4H/lITIQCHusDnXsbMSyzbGByJei1GXC5uHQQPFsBGjnPKSj0Yz0N
         oRkyXAkmGWn5jIsavfcK1igrA6isyXy1OsivDMSVE2V1C3e+NhPRvSzyndoBmHW7uXQg
         d2d/P3TctvbKog98u+tH5pa9RfpsfnQ4HzLg9durZ+oiNrIG625nbH2G3bPjk4AXfrcy
         WkwT1F4z/R/x4B+33qQICMhHAqynyXHjJ+dOdna9HvD2h0FlzVJkcMojXZIWW60BfI8M
         numzT21S9BRawWoqn54XpbVZZP1UTHcJq1uuvw7tjXpD+A5Pn78I/Oj+5AyXE9Xat4Ll
         I0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mF7eiAdIfTv9rlxceo15bFIxRiqB6zGPW3KZaJR5WqY=;
        b=oKIWZgnDqg12dCnXe7PywRTPCv6Wy5mPv/HvlswskfBO00jUSBQgQpuOwR+sYMKNOs
         fW2N0V2aoTHenp9WZlNhUKEcwHkXwbZvR8+1fWJdH4RIYfujnx2Ca0HDb62pw2s6Zsr9
         iMu5V+loe9vpOaZrD6SHn8wO4sveeNKRvZozOgs078dnF6f1iJv3v8dHmTkv8PpzBbMd
         UszYDNu4/VCRIVgI6ikRShqmr1YIPol/jSXE6C9PK9kJAo92QtXKxPer4H0bJW9Mn5Uh
         8Ue6geaGZOHnyShZS8xyf7PwWR3RR+dxpg7gqr2iNxmm2KEtZA0sfB/TTplDyNLYqpZ5
         HFTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QMUPRVQk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q99si3613900uaq.89.2021.06.16.14.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 14:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QMUPRVQk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltdKw-00032U-6i
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 17:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdK5-0001lc-Qk; Wed, 16 Jun 2021 17:43:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdK3-0006aM-Gb; Wed, 16 Jun 2021 17:43:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z8so4230273wrp.12;
 Wed, 16 Jun 2021 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mF7eiAdIfTv9rlxceo15bFIxRiqB6zGPW3KZaJR5WqY=;
 b=QMUPRVQkv8w+TrL5LUs46LyomAhgxeYc6Iv4T9V/4h98/UT7+h6vnIgZtw+3mYMsDH
 SHzNobKCtLbSvMkdgLDJrgb5HBnSM+rUgKh2ZCGC81OLcBWZKz0LzaLHBeO+OMwzvgm1
 XD0jXJLv2B8pzG6sE5tkkmPKqR0nvHycbgUdVfvfiDmJhttdj9VrImNrjbdnYrlAU1KZ
 E68/OE+wM+dFM16SkiBh46AsRcVU+JVBYxcyM1H0GIC8ckNpqDbjTvr4EC+xreTJxIaf
 VhBko9pMmelljYx1m9m6cB4bCHhvVG/BhwhtNcU9Wd8+CGr7csID9MVWqKNDTiLac1Ta
 Tq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mF7eiAdIfTv9rlxceo15bFIxRiqB6zGPW3KZaJR5WqY=;
 b=tE4oJcKgzkf1QLAOLy5mN6mLgzTJZJS8QGd/k8pBpv7ygVMTJnFlsnTUJonS3OJ7w2
 oRYSFUaQQYIj1id5HRvM+rNpKJXESA81+ftGh1l8vh6cbJ/H6O0YtRVdlXBbXeiUEBzp
 S5juhNgLrUVvVJA01FycaoR0NIPcbvMX7ne40EudVlPYUVqkUAK6XcepjqmWqxcE4KIO
 rfG+arGqsQFyMu3VgmOZaU3NFpY8SLIaCU1021MS/6MQaZAWx6ZwInSGGKR6ybFvi0+h
 aT8JgNxQBWyKyYoHzrxRdG935gOyK7JW49Q/U1YbEfxNeO6ROQDLB0dloXRfTPLhzeZI
 jYsA==
X-Gm-Message-State: AOAM53245V/poqbL32K8+sihjnGxTfOex09FmeHOQqq0V6VycOmpJUFA
 Ic2d2g854wDrQFhh2ndwXBFHp5v4grCURA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr1364249wrd.317.1623879820737; 
 Wed, 16 Jun 2021 14:43:40 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r6sm3327992wrt.21.2021.06.16.14.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/15] hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT
 cases
Date: Wed, 16 Jun 2021 23:42:47 +0200
Message-Id: <20210616214254.2647796-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rExY61joCtUp

To allow further simplifications in the following commits,
start copying WRITE_I2C code to the READ_I2C, and READ_I2C_MOT
to WRITE_I2C_MOT. No logical change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 148b070ce4a..9cc9cf3be32 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -133,6 +133,26 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      * Classic I2C transactions..
      */
     case READ_I2C:
+        is_write = cmd == READ_I2C ? false : true;
+        if (i2c_bus_busy(i2c_bus)) {
+            i2c_end_transfer(i2c_bus);
+        }
+
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            ret = AUX_I2C_NACK;
+            break;
+        }
+
+        ret = AUX_I2C_ACK;
+        while (len > 0) {
+            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+                ret = AUX_I2C_NACK;
+                break;
+            }
+            len--;
+        }
+        i2c_end_transfer(i2c_bus);
+        break;
     case WRITE_I2C:
         is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
@@ -163,6 +183,39 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      *  - We changed the address.
      */
     case WRITE_I2C_MOT:
+        is_write = cmd == READ_I2C_MOT ? false : true;
+        ret = AUX_I2C_NACK;
+        if (!i2c_bus_busy(i2c_bus)) {
+            /*
+             * No transactions started..
+             */
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+                break;
+            }
+        } else if ((address != bus->last_i2c_address) ||
+                   (bus->last_transaction != cmd)) {
+            /*
+             * Transaction started but we need to restart..
+             */
+            i2c_end_transfer(i2c_bus);
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+                break;
+            }
+        }
+
+        bus->last_transaction = cmd;
+        bus->last_i2c_address = address;
+        while (len > 0) {
+            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+                i2c_end_transfer(i2c_bus);
+                break;
+            }
+            len--;
+        }
+        if (len == 0) {
+            ret = AUX_I2C_ACK;
+        }
+        break;
     case READ_I2C_MOT:
         is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
-- 
2.31.1

