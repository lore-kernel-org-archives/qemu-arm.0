Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3870115lfm;
        Tue, 23 Jun 2020 00:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3I9UpYue6lepYwV+XpCTbri10ILHPfzhnZ5V53Lsp8pzVwwP/enYFAx87zbH+n2JOKxyW
X-Received: by 2002:a25:ad56:: with SMTP id l22mr33386001ybe.383.1592897280518;
        Tue, 23 Jun 2020 00:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592897280; cv=none;
        d=google.com; s=arc-20160816;
        b=Ij7Kq0d3u7PDDok7uZe14r/wqjSYJN1gGmUzKMMA1kFSR6UlHu166/gG6xMKfUVICD
         QPH0eDA1WNBKn/qOPSkDTcAeubqFHYcCVQcLJLvC2+TOlm4yCbyX2caqHEewkBywAu+f
         Gi6aVwlyJG0yA0qaGu8jiU/TrnPI5Lnn0eMw3TR/RuCJwIoKdr/9VPAXhijp4tp8dx8u
         qTr874bZuN1KAi2tW4JDW1c7yzsqw1PzRmTkbyOprYCfAnndGrW7kZszGWw9PzlwBpEV
         adqGz5sfye+HGDLdJH/W4sw60TEB/NZYOH5iprXeYxIBoNIMDeCzGQFvU02oANItO5W1
         Tm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/rkCC0KY0vr0BR9gviPE1vDAj9HmfkCPFJec63urFJQ=;
        b=vYpOr9FSGUCVdr7APb+maUBip7k1PwgVrGCPsoHkhrpLhBiORWRtzxBo5frlxbfdGA
         Ax94KI1aLcV2bbbL79atiyn088IQ7CsQB9sg1ztaX4OpNXi6+CuknKkIVgiAQ6l6oyKj
         JqGj3S/Hb9f5KHNVWLrGltBo3rY1tF7ScjB7YCjZsHL7gW20khzoRepfS67Y5N4s13VS
         uRHjc3xmPoV1afTT8Bu7xQ4mVMvjIA5l34otU5/RVHHl7e9G59vrPjUfg4whg1L1qDbt
         MLEgcmvaNRoILeA6TkbUV9nb7onwiyYwSQBhKzfYCidfeq83dahNMG41gMiweNpyCXqg
         MGxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ju0yhOGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i204si15057114ybc.254.2020.06.23.00.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 00:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ju0yhOGf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jndLb-0007td-Sy
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 03:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndL8-00072t-AD; Tue, 23 Jun 2020 03:27:30 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndL6-0004yR-Ku; Tue, 23 Jun 2020 03:27:30 -0400
Received: by mail-wr1-x442.google.com with SMTP id a6so17403355wrm.4;
 Tue, 23 Jun 2020 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/rkCC0KY0vr0BR9gviPE1vDAj9HmfkCPFJec63urFJQ=;
 b=Ju0yhOGfR9afLf98j2+WW/ZhCVyk61vlvYiNSRnt6srk1E+5bQO/B04HGlj59beh+F
 KNXWpaEuAZe9M5rQvIymHnjUY12Y4qmO/LlOxOQHKncds5Usq320dPpvyvI/GHzP92zm
 nFa09Xa7pPNVFuuqt0gIpCRU0W++PjRIXY8tvovZI4y3ptKr3PSdEnhuHbFjOb7FDQRc
 /h7IiCfLQmxWrT/jrNSbEw7KZWQKpBkh0ozVdYz+53vpgaQTNGc/BmQHHbLPSwjWX4py
 JgWSBIolDDS4MHd7xrXub0NBN2KgOwSPF5oqJget9iECqhhVKCu/eSwm5uNrMoFxlWJx
 YL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/rkCC0KY0vr0BR9gviPE1vDAj9HmfkCPFJec63urFJQ=;
 b=b9oSX78PnNobL9hY4caIRZMfYxb3x8nKV3UTk34czIuaUIbYrPhxoWLEOBA8tgPP3L
 b0CZPc65tzcO6hG9IS2CBA7JxV2NVrxCcEtO6JjforYZZARp8ZeU+xQWH5/NNma+a+Dv
 Y4wZzILx27eLwu4lSYWiDo2jfG5n6a6mkrMSj+Q2wfHqUqaasE5WvGwUZcSkekQpSuUG
 g0kYKE2RcU1BEe78IeMm8yW93AmRcbRSWBbWQ6gUfajttAdEA4DON59Dyn3urfagK3Y3
 1HxPsd+rZ9jvtOJnIf4O6c3O2VvSx/cREUS3TEWCptnSuTL+fCOl67Qj/DoCXHaHytEj
 1IXw==
X-Gm-Message-State: AOAM531aup8vAlazw+WIRyvfl1HY2FbxpRwBaqu1T8kov4wPPajjWr6z
 /PhQMtd2Ocfsqd5qdQ97/rehA+Ar
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr7046428wrn.48.1592897246583; 
 Tue, 23 Jun 2020 00:27:26 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l14sm4200059wrn.18.2020.06.23.00.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 00:27:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
Date: Tue, 23 Jun 2020 09:27:15 +0200
Message-Id: <20200623072723.6324-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623072723.6324-1-f4bug@amsat.org>
References: <20200623072723.6324-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WO4QtZBzOXgH

Extract i2c_try_create_slave() and i2c_realize_and_unref()
from i2c_create_slave().
We can now set properties on a I2CSlave before it is realized.

This is in line with the recent qdev/QOM changes merged
in commit 6675a653d2e.

Reviewed-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

