Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1794797lfr;
        Fri, 9 Apr 2021 13:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzcKE6RWk/Uxj5A0MApP8JBtLro3hEJHhMyERIIt+tDAiw6OTVDOkEy4OKO+0QYCNgul7G
X-Received: by 2002:a5e:cb4c:: with SMTP id h12mr12399766iok.183.1617999527031;
        Fri, 09 Apr 2021 13:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617999527; cv=none;
        d=google.com; s=arc-20160816;
        b=tew/TMNAb90d22Ef8fMPslRC3j/+DWi1kM2C5CLpAjFtVeTYNhXcN8nYvtaXM4aSj8
         JjPZ4jzdbkfg7p0aCF2PjxIgkK1WgMAVqNYGFk79gOgTpimjibmhfN5Fyi8V12ev5iiI
         i3/udtlpCakXK9aAWgBySVXmPltYgBlqNY9sMhCaIEbfHMrEfs+zjlRKX8t/TOtGH/rZ
         /xDp3CXGMVzPtlk8soYGPbaoRZCAds8Ewwd/Z4DA8Ikukv8QRu+v9NVrAfPNGBZ0MkC5
         FHmkiRoX/vH5kRpku/et+fX9WfSVqNwKXZhJf2rPj7M/KmlnlDU6mn6RCZTKBrImd4RU
         a42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
        b=lvp6LL4fQN9yLKgUKOnOp6hZd3c+KTWAbjuNVCA/TQAdbBtKbM5bDh1bIXuaTavYEj
         P9RIaWE4Qk+GWKRmHIvYdCHxyNQb16ZhC+pOlC2nk23IxKU96QIUVNsbUypNxChqf4nc
         OO7h/RBIVHiubfAq9xycqW/u76eNP+QCfh39Y/qvytmrXtpBTWVVfrAKS6EmEG/vL7vn
         I4k4SE8WFbCWV3jW0n/dOl6KbTKzT0jhs/b2U1p8jQe4W9HybgVJ0YY8BFMio+/9u88c
         K2ALXF5ugxhzUjtRiW/6XPVL/8WSnV6M3Kq89OIBxDhc/Ivsz2vK7u95W1hnTm+7Y3ot
         SMYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=tbffN6R0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si3801350ilv.87.2021.04.09.13.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 13:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=tbffN6R0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUxaY-00025C-Ay
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 16:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vrVwYAcKCvUsbkqrobdlldib.Zljnbjr-absbiklkdkr.lod@flex--venture.bounces.google.com>)
 id 1lUxWw-0008Ru-D1
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:11 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vrVwYAcKCvUsbkqrobdlldib.Zljnbjr-absbiklkdkr.lod@flex--venture.bounces.google.com>)
 id 1lUxWq-0000Eq-SB
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:15:02 -0400
Received: by mail-yb1-xb49.google.com with SMTP id h69so1836944ybg.10
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 13:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
 b=tbffN6R0v2teDS9kh7RdEHq/CEvrOnfMMMtBXvI29e4mF57EtZ9Ix/NAyFrRgyYFkw
 IYsbhT9QukaiAJmJKTewUmITNxBDDaWIXcpPJCvsP8oQJS/C2hSO8k8pIQzXm/8ZkC20
 Xp5seY284XbuVZE2dKN7EHrOw5aTJl+Ql37f4MuaIZfbGOkprA9SsiijxsiL8XOm2Qa+
 4tc/zedpetICp+mbCN8Cm2hDbBa0g8CRXp2blFZkZ2j4AM4M7/W8kJbJMt3rtd1VfpgF
 gsFd2BP+4Xkkhn8CqyyoqNhBuTLRpjApULxujsIAo3SP3To84VM+xuU5MfoVCo+34Q20
 w/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
 b=Gvt99RLN/mLEes8VmkP1TGdRy7VEDpoWPZITtxQoj9ZIms4GlI28/R6JmZ3RuD/i3t
 c1MREf5W6qGc7KZg7SsiASqkYRn9Lr7xP+OXOUVaFOTZtFJW3vBgbwrTNGRaXZ0HWtRV
 Q1Ic6cCPqswRWuY7Es+AJdK/eZ4tymfKnyvVlpIRNWdJ2DsSctt08l7Cfo/fxtvF30jC
 voZsg1RXDVtfnlEgUXXOdDIu6HmsWDviITMdc2RY8o+pXP9TtRdVKQFI3jIr6Ykx0fIo
 ZMe3rVesJhk/3+05gNDd4tepxVEFKSipWwCxVssG6RM0vbNBYQJSke49fBcXqHflaRau
 4gsA==
X-Gm-Message-State: AOAM530jJGHZiYIpsbpGNrWGNaArLHTZsi92xDHmNjC9R5+ehWco5+s6
 iSY3lYfDFu0KAT+VFOscKkhYpgr0/crA
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:ec3:6619:183b:36d8])
 (user=venture job=sendgmr) by 2002:a25:bb90:: with SMTP id
 y16mr19321177ybg.49.1617999294961; Fri, 09 Apr 2021 13:14:54 -0700 (PDT)
Date: Fri,  9 Apr 2021 13:14:41 -0700
In-Reply-To: <20210409201443.111197-1-venture@google.com>
Message-Id: <20210409201443.111197-3-venture@google.com>
Mime-Version: 1.0
References: <20210409201443.111197-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v3 2/4] hw/i2c: add match method for device search
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3vrVwYAcKCvUsbkqrobdlldib.Zljnbjr-absbiklkdkr.lod@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: iNoREGGkIB93

At the start of an i2c transaction, the i2c bus searches its list of
children to identify which devices correspond to the address (or
broadcast).  Now the I2CSlave device has a method "match" that
encapsulates the lookup behavior. This allows the behavior to be changed
to support devices, such as i2c muxes.

Tested: A BMC firmware was booted to userspace and i2c devices were
detected.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 23 +++++++++++++++++++----
 include/hw/i2c/i2c.h | 11 +++++++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 21ec52ac5a..d03b0eea5c 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -118,10 +118,9 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
         QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
             DeviceState *qdev = kid->child;
             I2CSlave *candidate = I2C_SLAVE(qdev);
-            if ((candidate->address == address) || (bus->broadcast)) {
-                node = g_malloc(sizeof(struct I2CNode));
-                node->elt = candidate;
-                QLIST_INSERT_HEAD(&bus->current_devs, node, next);
+            sc = I2C_SLAVE_GET_CLASS(candidate);
+            if (sc->match_and_add(candidate, address, bus->broadcast,
+                                  &bus->current_devs)) {
                 if (!bus->broadcast) {
                     break;
                 }
@@ -290,12 +289,28 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr)
     return dev;
 }
 
+static bool i2c_slave_match(I2CSlave *candidate, uint8_t address,
+                            bool broadcast, I2CNodeList *current_devs)
+{
+    if ((candidate->address == address) || (broadcast)) {
+        I2CNode *node = g_malloc(sizeof(struct I2CNode));
+        node->elt = candidate;
+        QLIST_INSERT_HEAD(current_devs, node, next);
+        return true;
+    }
+
+    /* Not found and not broadcast. */
+    return false;
+}
+
 static void i2c_slave_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
     set_bit(DEVICE_CATEGORY_MISC, k->categories);
     k->bus_type = TYPE_I2C_BUS;
     device_class_set_props(k, i2c_props);
+    sc->match_and_add = i2c_slave_match;
 }
 
 static const TypeInfo i2c_slave_type_info = {
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 1f7c268c86..9b8b95ff4a 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -16,6 +16,7 @@ enum i2c_event {
     I2C_NACK /* Masker NACKed a receive byte.  */
 };
 
+typedef struct I2CNodeList I2CNodeList;
 
 #define TYPE_I2C_SLAVE "i2c-slave"
 OBJECT_DECLARE_TYPE(I2CSlave, I2CSlaveClass,
@@ -39,6 +40,16 @@ struct I2CSlaveClass {
      * return code is not used and should be zero.
      */
     int (*event)(I2CSlave *s, enum i2c_event event);
+
+    /*
+     * Check if this device matches the address provided.  Returns bool of
+     * true if it matches (or broadcast), and updates the device list, false
+     * otherwise.
+     *
+     * If broadcast is true, match should add the device and return true.
+     */
+    bool (*match_and_add)(I2CSlave *candidate, uint8_t address, bool broadcast,
+                          I2CNodeList *current_devs);
 };
 
 struct I2CSlave {
-- 
2.31.1.295.g9ea45b61b8-goog

