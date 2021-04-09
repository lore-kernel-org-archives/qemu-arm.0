Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1637720lfr;
        Fri, 9 Apr 2021 09:26:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzwpXDMuCG39qj641wfn9D7hwZOXndqBNXQwG9M4LETTs2n1ifIOteYFjzzLkycyonDQtz
X-Received: by 2002:a02:aa92:: with SMTP id u18mr15520512jai.119.1617985599032;
        Fri, 09 Apr 2021 09:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617985599; cv=none;
        d=google.com; s=arc-20160816;
        b=dc1r0AEjUt3zJWEIkQRToZd6wGQaAQeqpObelXHLuOe8U3N0Dhf2aARtDduEuKysZE
         o4yD0xwRZfMaOIc8OnpDrig5ZTVPjUZNFSSSgBYOVYnxxONDlWRXXBiqczJDfW3uSzcu
         XA8GGiOH1bM6eApsYdKk2sQrcFtDzDOND5vgVhRpurFpmsyLxxirwTCbIbtF9Xw9cWSU
         5rqjAgLELvvJ37/JGJfyiRBh4qXp/5duVcqarYDMrHkwWpUswZDQt/Fac18dMjj5EcEj
         KV3o43eGFicyGUGuEUI5JR/9Q5yWZNpI6yss8h+U/9bQ+RMCzscoEnMXayaDXb/70Qpz
         wC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
        b=UlN81si3KE9xM1hR79N2K+p/S0WC7QvZhqYb+8j0bfO3a2u02gU1FeevKHh49SvryH
         9Q5cuedtP5Jgmc8k1oBzbg7zp/ysxWsOEefCUOp7dD8SB+mKhSDJZSzmnw5uAUeUZkuv
         3nVZqmZwyku6xUur07087au03fNUcvVBtb2kh9M/gi1aysmBq/bzdAoXafPOWEVzxloe
         si+IOCJp8zlyVF1nXmOh+PGSF621rjaFVynHJgniqDrRRA76ndxaYnO6Z8J+Lr8zgfuA
         FwtUZc/0SZNBwFK7nMLJ5QdWaLgu0d8cPs2miuEyR9nPjRlU1ZczFwYhPNCLt7wFko2u
         +WIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="T36F7rw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si3589327iol.17.2021.04.09.09.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 09:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="T36F7rw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUtxu-0005wt-Bq
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 12:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HYBwYAcKCOgfOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lUtxV-0005YE-Kj
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 12:26:13 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:34724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HYBwYAcKCOgfOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lUtxS-0007VG-Oc
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 12:26:13 -0400
Received: by mail-qt1-x849.google.com with SMTP id a16so3410187qtw.1
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
 b=T36F7rw/kBF+6HKCsr8xf+rfqzT1nrevkwj4jQWTvQFmZGLMSOvYOY2IQKv40/sGiD
 Bf5m8EPKhksUICsYl/HPC9BJF/SSds0E8Tj6NK2qLPqxA9QJMHXCiP0oKqXOsEMoAHmc
 EQbrarbhoI6ZJAguM5Sb12j/kIZrJe350TJL8Q86LkCmlyKkBb1sox9SQrHmmsIyQAvL
 ui8wVolRwf8RbNGCjmd4/bcT6wn04curF4doTFl4yLAAP8jenxKdd+/5VU7yxM9rGiVN
 KpaSo9ko7jNC1rujd6BaqZeoXDx7iROLYmlmCqc0NKtxIWFo6epfrbCdfXkORWmRuZoC
 YGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/nZIqirGm/4hMePzQ47kJsD6GC6cfP2kwpUtkwbOQ3w=;
 b=U22HRf5Bolui8dEF3hyPUK5EQvbCELsdpl4PPWyVgAXiXOqyseo6xAWTtRC3hBduIq
 KiCjPH9IVzUBUW+n4dYPy0lMJlMdayxSpXus/ADMluaXMr8Hx3yk8iR5V/imKX7PaEwz
 pzG94mdy+JGo3aLrVmvy4qX6YBPafZI2fldCQHyLavwHhfEvQ/KRNX4BFERqeUtOloO/
 OmBsPYJXI/OwvRmPGZbZPCl8nLbs2DHR74b/QNW7BwtN442wp3ZR4zODxYaZclDnP1hE
 Y3I7zy2gcDs+XtpMeDtLdWUX9oIh2ODx52o4a5pTGHYJ0EbeJjwz3xSOKO/h8/JtX4yi
 /APg==
X-Gm-Message-State: AOAM533ZYIhXUus10wKuqRKyg1B0r/9vTB8a9AoNBeHne8VMQ+G0x+db
 9ZEKN18lXnv1SerDRD3KI/wF2OzLE8qi
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:6985:9b01:e10b:b119])
 (user=venture job=sendgmr) by 2002:a0c:9e17:: with SMTP id
 p23mr1897329qve.7.1617985565516; Fri, 09 Apr 2021 09:26:05 -0700 (PDT)
Date: Fri,  9 Apr 2021 09:25:44 -0700
In-Reply-To: <20210409162545.3705962-1-venture@google.com>
Message-Id: <20210409162545.3705962-4-venture@google.com>
Mime-Version: 1.0
References: <20210409162545.3705962-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v2 3/4] hw/i2c: move search to i2c_scan_bus method
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3HYBwYAcKCOgfOXdebOQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tX6A43g6rsRq

Moves the search for matching devices on an i2c bus into a separate
method.  This allows for an object that owns an I2CBus can avoid
duplicating this method.

Tested: A BMC firmware was booted to userspace and i2c devices were
detected.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 38 ++++++++++++++++++++++++++------------
 include/hw/i2c/i2c.h |  1 +
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d03b0eea5c..12981cea2d 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -77,6 +77,30 @@ int i2c_bus_busy(I2CBus *bus)
     return !QLIST_EMPTY(&bus->current_devs);
 }
 
+bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast)
+{
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
+        DeviceState *qdev = kid->child;
+        I2CSlave *candidate = I2C_SLAVE(qdev);
+        I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(candidate);
+
+        if (sc->match_and_add(candidate, address, broadcast,
+                              &bus->current_devs)) {
+            if (!broadcast) {
+                return true;
+            }
+        }
+    }
+
+    /*
+     * If broadcast was true, and the list was full or empty, return true. If
+     * broadcast was false, return false.
+     */
+    return broadcast;
+}
+
 /* TODO: Make this handle multiple masters.  */
 /*
  * Start or continue an i2c transaction.  When this is called for the
@@ -93,7 +117,6 @@ int i2c_bus_busy(I2CBus *bus)
  */
 int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
 {
-    BusChild *kid;
     I2CSlaveClass *sc;
     I2CNode *node;
     bool bus_scanned = false;
@@ -115,17 +138,8 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
      * terminating the previous transaction.
      */
     if (QLIST_EMPTY(&bus->current_devs)) {
-        QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
-            DeviceState *qdev = kid->child;
-            I2CSlave *candidate = I2C_SLAVE(qdev);
-            sc = I2C_SLAVE_GET_CLASS(candidate);
-            if (sc->match_and_add(candidate, address, bus->broadcast,
-                                  &bus->current_devs)) {
-                if (!bus->broadcast) {
-                    break;
-                }
-            }
-        }
+        /* Disregard whether devices were found. */
+        (void)i2c_scan_bus(bus, address, bus->broadcast);
         bus_scanned = true;
     }
 
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 9b8b95ff4a..45915f3303 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -87,6 +87,7 @@ void i2c_nack(I2CBus *bus);
 int i2c_send_recv(I2CBus *bus, uint8_t *data, bool send);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
+bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast);
 
 /**
  * Create an I2C slave device on the heap.
-- 
2.31.1.295.g9ea45b61b8-goog

