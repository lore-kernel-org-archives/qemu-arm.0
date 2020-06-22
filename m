Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3428838lfm;
        Mon, 22 Jun 2020 11:34:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylG7+4kR0sDsoWeAlbwj34K5v77zRuuUEgeVvcchZxXJ7vZjJMj0F5T5L9tgujTMqfLjcn
X-Received: by 2002:a25:a128:: with SMTP id z37mr30980079ybh.218.1592850885809;
        Mon, 22 Jun 2020 11:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592850885; cv=none;
        d=google.com; s=arc-20160816;
        b=a0WVWZgWQ/WtLE7VMs8troOqqP/lg1xalCUCMLCTtnevLyrD0e9qX+ewNUOEi445wS
         kQskLIxZOdGRUvmm4sQ0AnKJDS7LOzYcMTgv6OoobJW19NupIcCD/qdXBCFBk4GKzv3s
         8Y7dojp0aXmY2Vj+pum/u2rGfRrukdfEvn8rmaKIaKmI9SlPRgT5goirRZEnnleX7jrN
         K4qLbcoPhO7M5WLCh664aZlBLTAYQFGyknqdqPP5llcxG0XG3Bby/WI+8j2D42wv682Q
         rWZ/uHe7xj7NtvJ8rraE0dSrwm4jHxBn/WvLENasy25VqMeZqa3eULtOpyXtVQ1ZncYH
         4veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tarjoTnAJPsibnCRp3X9HauskYnF2Gnt6IIG6Rw/TK8=;
        b=A8A05XntFPsaUBae2O1JCm/pdqjblJ5rWdH+4Nc40Y7Gy3ipDjMGu8w70H2KcrONO6
         IOnP1fBfPPJXql0BvB24DSTW7lvplSn4KBwsMW6/6pjmnv5mdULIhJO4p9OYye8qAyTi
         PBE1PLYm4SOqEc6Dgw4B5eJKHpHQdHDVtp8K4H5aPspEK8LUthLqAgHzIC34qwH5CZm4
         QOUvZRKc9Kgg+e1veGo8vC+ny0E96o9+cX2B2uP02tM84biXj/y7bv4++LUJwtc0jqjL
         hEi6tKC2cRDWp7Mp8s3GV4HQMUyotg2FloBW+3pCn2LvRWwIn2nxVohpAc38Z/n6FwQw
         sMDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lkORc1jr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l130si14491819ybc.0.2020.06.22.11.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 11:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lkORc1jr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnRHJ-0005Jb-0i
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 14:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRH9-0005Iw-GZ; Mon, 22 Jun 2020 14:34:35 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRH8-00080m-1Q; Mon, 22 Jun 2020 14:34:35 -0400
Received: by mail-wr1-x441.google.com with SMTP id l10so17718020wrr.10;
 Mon, 22 Jun 2020 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tarjoTnAJPsibnCRp3X9HauskYnF2Gnt6IIG6Rw/TK8=;
 b=lkORc1jrIk7z43y6JU7F7Fp38+XvnZ6/Xcerz+tqgp24adQdSU/w7muOZWQiP7muT+
 7WEl9RDNSu6RI2An32gOzDYINx5cIOH3XxsBv44raPpWGyMDBQ73w1CeTAPj7ZjOtdcD
 aub0m/PWQoXf4qn0AXhC8SFYiHDoZYSvFB/r+l6yGhq6D7tzBn0hYrnN5EUCJuFMaTRR
 QatMFWz/t01h285pSkROKyQQVCsW2MqbngmWB7iOLzQlL5ZZRm8yvB1sh98AW+mPRVTo
 2rXbDvtIentkfwSFBNijSqxYYOE+Pws6heM9IF6/KYPV0M8azPmyPfqzaqpYys8AlUGz
 +efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tarjoTnAJPsibnCRp3X9HauskYnF2Gnt6IIG6Rw/TK8=;
 b=oQnv25SSh+XYTSD2WKPMCOb1vPz0NcuJ7pXXvDFAslunJNY44QdWNG2duqK9gk71BC
 J12LTWWMtqf1DdxNf1dUl5cDcgbKi4VYnnilAueTuGQTV7wIW6MBFhnqNRtAQIBEhmd8
 i9Pzwmk+YTRArZKA91JiCF46LYKwWfXKlcqv7bIhKwJx4vh7lfpxZqB/tw7M73zsnc37
 Wcz5w/bS9dFCD+ZHSu8gHUM4YkvLsv1XPZ2eRzqi88/UtDA83YTdkf7fFOp8e41zf3UN
 O205+BPOPTYbwwk1885kNmwjeKxluwEGF+HPGyGEvoU2U1S7WV8LWfObtNPuBrw/56AL
 Vt3A==
X-Gm-Message-State: AOAM533hevIGe4nsGZTH5/0Z3oxJy7nAlGUJSoBCNaSAYzxrDcO0VOmu
 CEwNB7HlaOX9Ax+sS0UVD0Yzpec9
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr20818621wrq.156.1592850872040; 
 Mon, 22 Jun 2020 11:34:32 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h29sm20286161wrc.78.2020.06.22.11.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:34:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
Date: Mon, 22 Jun 2020 20:34:20 +0200
Message-Id: <20200622183428.12255-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200622183428.12255-1-f4bug@amsat.org>
References: <20200622183428.12255-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yw1DOKeUI+R3

Extract i2c_try_create_slave() and i2c_realize_and_unref()
from i2c_create_slave().
We can now set properties on a I2CSlave before it is realized.

This is in line with the recent qdev/QOM changes merged
in commit 6675a653d2e.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Markus Armbruster <armbru@redhat.com>
---
 include/hw/i2c/i2c.h |  2 ++
 hw/i2c/core.c        | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 4117211565..d6e3d85faf 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -80,6 +80,8 @@ int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr);
+DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
+bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);
 
 /* lm832x.c */
 void lm832x_key_event(DeviceState *dev, int key, int state);
diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 1aac457a2a..acf34a12d6 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -267,13 +267,27 @@ const VMStateDescription vmstate_i2c_slave = {
     }
 };
 
-DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
+DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
 {
     DeviceState *dev;
 
     dev = qdev_new(name);
     qdev_prop_set_uint8(dev, "address", addr);
-    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
+    return dev;
+}
+
+bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
+{
+    return qdev_realize_and_unref(dev, &bus->qbus, errp);
+}
+
+DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)
+{
+    DeviceState *dev;
+
+    dev = i2c_try_create_slave(name, addr);
+    i2c_realize_and_unref(dev, bus, &error_fatal);
+
     return dev;
 }
 
-- 
2.21.3

