Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2480559lfg;
        Sat, 3 Apr 2021 15:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3xoPwTCYWRmMnGMCuPeNAg8DmmZvuRx5R9j/u1MeWu6aAhf+36yMQu/lmCLaqXpwo7PMi
X-Received: by 2002:a02:ccd9:: with SMTP id k25mr17879138jaq.43.1617488981102;
        Sat, 03 Apr 2021 15:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617488981; cv=none;
        d=google.com; s=arc-20160816;
        b=HIhfhElgulf0jm9SJXUATY6lN7rtCkQ6CS9BDWQkZLPb1VKy58J+TY8STtxkWB/HuI
         +1NEwUwsmF7g+duSB/Q9Gyzpny2NCAvvjUGy5t+MWRR2WauNeboiTrK7vX3dgCwwxGqH
         po0EweqOmoA7Nom6PVUKvUDBEw9o8FsQg2ycVTSxXgL21ubQkftzfkyHfbOt135oMusc
         TrL+Cv/VmJZzVsCmd6jtLzX7nGyNGuUJkVYN6aBzPPbYrs5bkzZVngs/gF0VDzpSzu5H
         nbadY2K0QeUpMLU3ahmPdbKOOK7hpMurh9WqBbDwLrPk2ZL5ZtpHocsJUJupLk6WJawv
         akag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=T5YtRkRKUUIOvoZmqL262NcISbGPOODubGnB2CtWpAQ=;
        b=fKFMXgCBq3hEhfk8kMVmhM4MSHTLMXMxVEXjJFGpjN5XsLPHhgMH2As2co0MHQMUw/
         qC0ofQNcgTyJ0z86lZhKfT4HvwPja1UVc1k7O/EAUx5uV/DzTYONBgkqHmwOboQabMbE
         B0SnNhDqT6GRt2CQ6C2sWLvgochMvId8RZGbxBEtq8JUbbt4mbVLdE31N1fbYzSoMOF0
         ibVhk+qXyGK/wrYrUUyG3/gKEzgzdH7e9CNZQ+G663o8WnXlb4q5VjP+WxVSnJvnAhtI
         2t8ylxylg8lI0Z8zEFtjgProYFgk3YcF28KAM9VGPi4U233zInFxNCZOTZrkT9RMfIR7
         O+0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=EI1a+iI7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1si10980919iob.72.2021.04.03.15.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Apr 2021 15:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=EI1a+iI7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSolw-0005RV-F4
	for alex.bennee@linaro.org; Sat, 03 Apr 2021 18:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C-xoYAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1lSokx-0004WV-1J
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:42 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:48853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C-xoYAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com>)
 id 1lSokn-0002pD-Aa
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 18:28:34 -0400
Received: by mail-yb1-xb49.google.com with SMTP id d1so12995762ybj.15
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 15:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=T5YtRkRKUUIOvoZmqL262NcISbGPOODubGnB2CtWpAQ=;
 b=EI1a+iI7jyULXMrxo+kTtXgWo9gNO8ityODs5UgbjMSa5NClRfyU18fWCeQ3Y4kDiw
 QN0eaxm2gjt/ZSR388Zk/UdDSnZRm9iSEO1iKinhI61DbnP6LSjaMgR7gDpTfzy7TfTG
 MsmOUkO1EzTE6C31S8h4D0ACzRmvphnTZ7NJNByQV48T5eW73rRjV2Boz9CY0GgyywxV
 fkNFhtPDmegDkO1+c3Kj4EJZQk+djo3lxATmVoJ9By8IkruUHbbEdMA80rfCKUOpC+8T
 ZHITpdMBkDVqTGoInKfrIHwPC1Jz3gIfiV/p6nkxXeIzozcI3XDC3gb/fM+ip2XUIml2
 yBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=T5YtRkRKUUIOvoZmqL262NcISbGPOODubGnB2CtWpAQ=;
 b=Ie7mGEHYFppndQkQHi4YfBp9BedMsRdS8Y7cNOYbKaUL+qkDp+RkRTVLLK3kOMFcuQ
 GZpDGXjIzzPnqFh53KTerqqJaM0mIN/xefJLeDj2atawyLdrhVqJQpPJJm0U7wtWpwdL
 b6dmzeazmPea1VOFhWsIxBtoHKb4tE2apWbNZS4q8H1vDbUwXvnLKnI2LSQ1Gb2YLqPM
 OEt+j33CYFXLLS9ocm+d5uJHaz9JCXc2S3i86EIoGQrOIXylcMdv0FNNQl4qW/irIv2u
 nb2Uf9tKDnmgfAz57g946+7ZoeBcPfc00Gq628/VoM0JNvo/GRxX5WFhC7GyQEFFeBDB
 PLIA==
X-Gm-Message-State: AOAM533Klzej0Dc1ZzxINma6ZkyY/lo+xmFYBftjPT20LZ4DzdtJQEQZ
 mWKGBtPmkBxWHCbTdFZfuAkuR1dnY6yD
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:bcbb:2e0c:25df:d735])
 (user=venture job=sendgmr) by 2002:a25:db42:: with SMTP id
 g63mr27328821ybf.404.1617488907285; Sat, 03 Apr 2021 15:28:27 -0700 (PDT)
Date: Sat,  3 Apr 2021 15:28:09 -0700
In-Reply-To: <20210403222810.3481372-1-venture@google.com>
Message-Id: <20210403222810.3481372-2-venture@google.com>
Mime-Version: 1.0
References: <20210403222810.3481372-1-venture@google.com>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH 1/2] hw/i2c/core: add reachable state boolean
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3C-xoYAcKCpAFy7DEBy08805y.w86Ay6E-xyFy578707E.8B0@flex--venture.bounces.google.com;
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
X-TUID: To++Al+iZVHd

An i2c device can be reachable or not, controlled by some external
factor.  This field is leveraged by an i2c mux which presents the
devices on the parent bus when the associated channel is enabled and
otherwise not.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/i2c/core.c        | 6 ++++++
 include/hw/i2c/i2c.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 21ec52ac5a..fa7db4549d 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -18,6 +18,7 @@
 #define I2C_BROADCAST 0x00
 
 static Property i2c_props[] = {
+    DEFINE_PROP_BOOL("reachable", struct I2CSlave, reachable, true),
     DEFINE_PROP_UINT8("address", struct I2CSlave, address, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -118,6 +119,9 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
         QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
             DeviceState *qdev = kid->child;
             I2CSlave *candidate = I2C_SLAVE(qdev);
+            if (!candidate->reachable) {
+                continue;
+            }
             if ((candidate->address == address) || (bus->broadcast)) {
                 node = g_malloc(sizeof(struct I2CNode));
                 node->elt = candidate;
@@ -262,6 +266,7 @@ const VMStateDescription vmstate_i2c_slave = {
     .minimum_version_id = 1,
     .post_load = i2c_slave_post_load,
     .fields = (VMStateField[]) {
+        VMSTATE_BOOL(reachable, I2CSlave),
         VMSTATE_UINT8(address, I2CSlave),
         VMSTATE_END_OF_LIST()
     }
@@ -272,6 +277,7 @@ I2CSlave *i2c_slave_new(const char *name, uint8_t addr)
     DeviceState *dev;
 
     dev = qdev_new(name);
+    qdev_prop_set_bit(dev, "reachable", true);
     qdev_prop_set_uint8(dev, "address", addr);
     return I2C_SLAVE(dev);
 }
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 277dd9f2d6..e5ca15e486 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -44,6 +44,9 @@ struct I2CSlaveClass {
 struct I2CSlave {
     DeviceState qdev;
 
+    /* Whether the i2c child device is reachable from this bus. */
+    bool reachable;
+
     /* Remaining fields for internal use by the I2C code.  */
     uint8_t address;
 };
-- 
2.31.0.208.g409f899ff0-goog

