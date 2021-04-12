Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4204699lfr;
        Mon, 12 Apr 2021 12:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/EnaCdSR3ha+cdXCsn9OEKWlyYqPRWZVcx8e7F0V+qqaW/q50lAA4l4DcnVoZYFW40a7t
X-Received: by 2002:a92:c80e:: with SMTP id v14mr23801284iln.138.1618256762199;
        Mon, 12 Apr 2021 12:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618256762; cv=none;
        d=google.com; s=arc-20160816;
        b=GFpsgRXsIb4Sz60vw9j+N0mkA5tFwCztkyUfAWeg2Qtr+ZbBoXMDAnJp+HceJrSHCk
         oD9NWToxN05zkKMNvhlmuW1csQ87I2CfzxLbsWpq/dDVWtIDy19+Gt2wQRvtdqdzZ5nq
         tfskC/BtqmG5jcTn97gNEYlppcTzMCXkvsKzk4ICO/q76lFsUIj+/E+lAU7rkRKHENyj
         MNfD1zZEGoe/IreMW2lDXufV0e3LoMMkptfDDgJiJAamwuw2db6Wc7tj2vYr9XjxhLnf
         LNioENCW16azjIuJjJ4hQuY8jv79zMpNwqdJ347o2fPXQeXTVjFJA37LkDya/2hhLKw5
         FtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
        b=pZlDFxixWlo+pVuT8qQPnkxLFRheTd4+9GtKQSLNk1Oq8jD7dNuupqdo8+yQWndwft
         odGN6MDM8/87B3kJpRcbgnYAHdoPqyDFGzvDk7P17xibvBYZ7GaxjEs9HeaBOzqMcx29
         IOoct01iWP5122CvxolGxW9co8Am9sWTgl+beCyreAeA4pnw+tkbw8RVup4djz09gJDN
         pTQ2iO74bK7KFfNjgI1WpCC+6IlZueHH4lG2ZBV74Y4e3GPRR+6vlYrxs7Yy2qJ9zBTz
         1ophnhTYi0OPl2vXhP/4Yt1B05UWHzHMtAdQSVRZplNlPWkgzy0ZxGcGdbY/4guoVG2k
         /+JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cPcq8En8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si12678324ilo.38.2021.04.12.12.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 12:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=cPcq8En8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lW2VV-0007c6-Eh
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 15:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Z6N0YAcKCIo9s1785su22uzs.q204s08-o50121u18.25u@flex--venture.bounces.google.com>)
 id 1lW2VI-0007YT-Ne
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 15:45:48 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:38888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Z6N0YAcKCIo9s1785su22uzs.q204s08-o50121u18.25u@flex--venture.bounces.google.com>)
 id 1lW2VF-0006a1-Ij
 for qemu-arm@nongnu.org; Mon, 12 Apr 2021 15:45:48 -0400
Received: by mail-yb1-xb49.google.com with SMTP id v194so4600705ybv.5
 for <qemu-arm@nongnu.org>; Mon, 12 Apr 2021 12:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
 b=cPcq8En8O4DtHmKX/Y+4sJLcO8P0azwCRQmPzVE/kM66u89/vqzpb3B2zY4S8skzFb
 41GkRq6zzgqvs7r/WpKYqYahtzPlDCGbPMUd/dHhlwjsTriXvOmjceFxwQLHhgnbBAj8
 AZ0ewPdBH5I4pyCpFMl6PAL7XSqqDU2mQnuwdCc77OFAfFm1CEHCkQ7UWXoNb95gVxNk
 s640D+27ycni5jEgkLnBLPKwnmH5vOW3pwuquDXz6tcCNqfvph2Mk20q4UJRWTPNqeEG
 QMZO4/w0OiOakTQuLYaCGc6y5UxG/7vxAP0T7eNtet9yko6qDXOM60NeSRVtNNVv7uZd
 Hkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=O27tGi51CsQG7yDvwmP852qZ1gjQhBSmWisJIHI1BPM=;
 b=YKDTpL9hgwoQP5RNxIY7gH0o/qNJkh7zMXeCIbc0vX+TCvPTuY2WFvvASbsgS5EA5Y
 sqT/6VvnF8AcqMye95HxYgMVkRpeP4kYiw3BQWAmpsRUsqBXHpNszfHepPKEOB8abVHR
 f1wgQNywPNLDmmdu81lHEK+ChoTLN5OsxZJKLA8DKgZdyNG7SOklZn6AmjruS7IG86DN
 Uierl0CPAVAxrbzAGAxD/Qrynj+atXd+tK7aEHo43az9qRXJcKUxvWs46sn00QsJnodn
 Te68c6P9i3xKGV/ARuSLQ9gQQAXylhSpbrAkwjqoyvgfgMOxBua5YCJOgfN0d2iv0Z4S
 gDdw==
X-Gm-Message-State: AOAM533JIhIYwQlAXzZVLhaMsZJijJPaMQuU8pzRE0MScSUxSj4NiWtC
 1v5Ika0ZoZoSmc9UX3WzF+RxWJTJE7br
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:7285:fb47:eb76:b9a4])
 (user=venture job=sendgmr) by 2002:a25:790d:: with SMTP id
 u13mr39658402ybc.427.1618256743930; Mon, 12 Apr 2021 12:45:43 -0700 (PDT)
Date: Mon, 12 Apr 2021 12:45:20 -0700
In-Reply-To: <20210412194522.664594-1-venture@google.com>
Message-Id: <20210412194522.664594-3-venture@google.com>
Mime-Version: 1.0
References: <20210412194522.664594-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v4 2/4] hw/i2c: add match method for device search
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Z6N0YAcKCIo9s1785su22uzs.q204s08-o50121u18.25u@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: xNPMJcbYqbfn

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

