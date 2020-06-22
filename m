Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3431135lfm;
        Mon, 22 Jun 2020 11:38:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+zGUzkdEpGM542F/rGTZZbL99LJBU0Ujj5o8HjQqsdw/CYK47IHJ3AvmuD3y1h8WWckOR
X-Received: by 2002:a25:be05:: with SMTP id h5mr29554927ybk.131.1592851082643;
        Mon, 22 Jun 2020 11:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592851082; cv=none;
        d=google.com; s=arc-20160816;
        b=cBmoNOBLxnjmz2/eqj4IAwZ82FozixU3frwd639w9sfSgIe/kHDK4BIvFwCtvghhWo
         7IFfIKQFUtIhqq+KTXuetZWM5fyuUV3QjbrVVkUapClL1KEgVje8/Tb0AZzMqzwzydub
         65IcMgraYqZC1o4G2qKPFNbp4K5S5XVviy+v936bruXybJmGmFX01nkc2Gt1XJYQKcgI
         W3+7YivG2kbhT6bQC4DKXuHGFE+7K8tMQD2s7jUCKqi0lLZBfUp9XnbiUoVf4rGAbMHx
         aWhselm+K9IOg95RTs0sesXo8FrwzZHeXCTylsV2RXhiZ11E1E68IwoHdZHwqE+VwRyL
         bu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XYD6Rt1uTdowiAFU8CgbFH3XBUpZ+aAWy8P/+fZ7EA4=;
        b=WbxvLLtZp7LVhfGBSbYYACffhaEqlQWJKNxXudTCklRkzBB3uLGItnDKIex97AsHdB
         tdHbT19ayRJH/hli+4PDcCJL5EVhL5iK2ovcFKd2C8jMKaiPzFsJ2+38BPUP9ZqVudW/
         ieTtLO7q8wzqGtxjB8Dv0OR/EkOgmYhfEam+bGp4JEEqvLhBoRGC87gC/2ygLdPydCM+
         xz7XhGpMIS+G6MjUet6Gca5+2xw1CeIuiQuGZjqxV+0ygIdy/DRpWcH//tBsb74PaE87
         xfAqE18wvDtJb7El23fmZa6xuw84dgyJZCUQ7SxzzSJA+Ei5QtP1tOK1yEHBNG5CT8m8
         cZfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S+ymQDpE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si15072767ybp.168.2020.06.22.11.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 11:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S+ymQDpE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnRKU-0002Bh-0d
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 14:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRHE-0005Qk-VR; Mon, 22 Jun 2020 14:34:40 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRHD-00081Y-DC; Mon, 22 Jun 2020 14:34:40 -0400
Received: by mail-wr1-x443.google.com with SMTP id a6so15753127wrm.4;
 Mon, 22 Jun 2020 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XYD6Rt1uTdowiAFU8CgbFH3XBUpZ+aAWy8P/+fZ7EA4=;
 b=S+ymQDpEbXmC/ey5PufhbMsAK7V9Y+iNvm013OvH3IKgUpgUEdOeWS3LP8cr6hUYAT
 8069o57R0VKSeQAfXfVChRuIZVSq3wU3hx91IaZZLJpirBMVjGvalW7cf+11hoyMaGTz
 Dqjfl9ghyI/+8+2lDK0cLG42Bwo1feHWBZLOQEo5u5PO7lCzivu8aB8Q/V53ITFKvWfz
 5fGM6k+E4PslCvOEoPKSI/latl0nJZ86PYVa+k+cq+H/+8C1oDh9HT0LD35QZzMWJFkN
 S7G6StkhbLOzhepAP0zSv6OVuG5mdcWgpIkv8+J2eCAflt26CWDIu1InIxNcYHgltUgZ
 q7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XYD6Rt1uTdowiAFU8CgbFH3XBUpZ+aAWy8P/+fZ7EA4=;
 b=f2Z+fd+7C0sUkokeQA/oeRGsnveU9PUd/A2NLPim/KwReh3Z6bAASiZ+aKIbxRHrPm
 WBZJnzUyoevJusgLvYt7iWB2JSTw7dtef86328IVXFJRlg6hgTmKV4+urRf7NJh1sJHa
 IWnHLQbP5FBdrKDRH3Cblayll3Tq1griHgViWZA8PVcrG4sm6BkuHbXkU4FR81nuYR5Z
 YBh1+6eaIaCtoLyPexEwlrnpN+lI7kt6YJeheKIdqGH7ymk9C2EGPaEasUuOFKkjzMUK
 N86klx+j1I6uhv4o0mLl8fdTq+GCDMZjlI4Twhk4mvi2bz+i3pNXNUotpNjTP6ZaIhs6
 dRYA==
X-Gm-Message-State: AOAM533K6DgdbyNOxtmCp7uBlVaxmspuFs0G5mQHmdq1AXYpXMtUEzoa
 OlEfIKomX02qyER1lrOXswWaN1lz
X-Received: by 2002:adf:fec8:: with SMTP id q8mr21397226wrs.2.1592850877543;
 Mon, 22 Jun 2020 11:34:37 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h29sm20286161wrc.78.2020.06.22.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:34:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/9] hw/misc/pca9552: Add a 'description' property for
 debugging purpose
Date: Mon, 22 Jun 2020 20:34:24 +0200
Message-Id: <20200622183428.12255-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200622183428.12255-1-f4bug@amsat.org>
References: <20200622183428.12255-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WI8Kz82NYq2Z

Add a description field to distinguish between multiple devices.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pca9552.h |  1 +
 hw/misc/pca9552.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index 90843b03b8..bf1a589137 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -27,6 +27,7 @@ typedef struct PCA955xState {
     uint8_t pointer;
 
     uint8_t regs[PCA955X_NR_REGS];
+    char *description; /* For debugging purpose only */
 } PCA955xState;
 
 #endif
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 34062dbb69..d6d84c6451 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/qdev-properties.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/pca9552_regs.h"
 #include "migration/vmstate.h"
@@ -319,10 +320,19 @@ static void pca955x_initfn(Object *obj)
 static void pca955x_realize(DeviceState *dev, Error **errp)
 {
     PCA955xClass *k = PCA955X_GET_CLASS(dev);
+    PCA955xState *s = PCA955X(dev);
 
     assert(k->pin_count <= PCA955X_PIN_COUNT_MAX);
+    if (!s->description) {
+        s->description = g_strdup("pca-unspecified");
+    }
 }
 
+static Property pca955x_properties[] = {
+    DEFINE_PROP_STRING("description", PCA955xState, description),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pca955x_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -332,6 +342,7 @@ static void pca955x_class_init(ObjectClass *klass, void *data)
     k->recv = pca955x_recv;
     k->send = pca955x_send;
     dc->realize = pca955x_realize;
+    device_class_set_props(dc, pca955x_properties);
 }
 
 static const TypeInfo pca955x_info = {
-- 
2.21.3

