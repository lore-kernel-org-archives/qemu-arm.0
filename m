Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1487580lfa;
        Sat, 24 Oct 2020 10:02:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2354u+gMAU+9DaFNF3u47X+9s7z3Smy1B/mhFyUE1YHinCB/Jaz8jCVuBy5YnZqGVKIn+
X-Received: by 2002:ac8:5783:: with SMTP id v3mr2344655qta.298.1603558928686;
        Sat, 24 Oct 2020 10:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603558928; cv=none;
        d=google.com; s=arc-20160816;
        b=UKBUqjNR6KuxltQTpFzF60hkVxcCFDRDACS35wV8w5nVtJYRcQucFKiv4fzxY3sGWd
         5wcM/kt6RVQvJ44IzhlBizIARpmwQss5HjL5C3n6AXo6GKh3MY+ByB/QaWOqt4sRcW3b
         rJcXdevhVoz4ApKKKjaiekGO2mN79rfbNTg2/6dteXKyumDZAQ/bodUjErSvhVIEB4I+
         GxPtDJOH9KBwwrQUIouVQORtlIKVIvX0EYcvt3AoCl7xdwYkbppsp5SrrxnmPRpfo8Na
         AFdk06d8kdgJkply0xYvR8WwWDTVz5O5w9EPb/XBCSEkH/vLnSkwxcnVhZ4Fqa/8+vQ/
         EF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wZ942IpuEYn6heYqqSxOTzqAXYjCwIpQoTDS92tNWTM=;
        b=o+tPNR5EIwc2wVvK2ANq5Tg2Mx01Y00YBibXPHrmKKxTGt3sBsp/m39dQPyKId87S9
         LDW3ZBU4nr2NVWjVEpgQWoG13P5EV4X3UyLHSmgv+34em9kSBh3n/HiVWiltW5t2FUS0
         ityago00/klh/aincPXrQ8Rs/Rkv14Qzul11QF6Gr3d3yPa29aC4A8AMo15N98QsoHs1
         51/wcuf7k2rLKCRdv5nOaGUTS5UuVHz3CIKaIgMGtXq8ERXNlYM78QkFo9IcABu+8lGx
         QANF9ri4zAEkeKVUPRM0cDE2N9fLWw0z0F5rd/y11RiVuri9m8fYKvGI1WE1+ph8fFw6
         Blgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NqH0bWuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si2350252qtn.294.2020.10.24.10.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Oct 2020 10:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NqH0bWuQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWMvg-0007ak-46
	for alex.bennee@linaro.org; Sat, 24 Oct 2020 13:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvR-0007Wg-0T; Sat, 24 Oct 2020 13:01:53 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvK-0005iM-Pi; Sat, 24 Oct 2020 13:01:49 -0400
Received: by mail-wm1-x343.google.com with SMTP id d3so6257427wma.4;
 Sat, 24 Oct 2020 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZ942IpuEYn6heYqqSxOTzqAXYjCwIpQoTDS92tNWTM=;
 b=NqH0bWuQhI18QiShv3wL2R6Dpbn83TbrxO/qmpEgHoUWeP25wRnQILwUMS8SwdCBDf
 TxdbRfByVlDAua3pZXZ13OGFvNo1kjpXMHaSu8q0PWAKKGQWbRyznc3w5k/YkZfMOcua
 80nAFNDdUOyO6sYIClieI/9cWs/t6OGcbhT9d7x5+n6zTl9D32fJbn6uAGJ5Nnl6nWb4
 +rAX+9NvfCcHwj/FKqebYr8wl8/IuMeX4D4n5oHG0U3uDwzlKLF+LaOrXz2f/4PJreXV
 tNKrmGJz/MQFZvjlh2pOCsnKtRo5X33MPDzhHchRqJxZQYIx7VyWLoAjKwChkjlgPFX3
 vqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wZ942IpuEYn6heYqqSxOTzqAXYjCwIpQoTDS92tNWTM=;
 b=hs1iHYPMyqOAjB4fT7bOUg1exAlaWfEYGk91X4dpFUiKsIvwvGSxuMs3Ro7Rc5uMG0
 DhZLmr5LTc+bFhPTrgVbPvJchP3JMI4MP46WxYTXi1DrXfHfCkLHU4CIkEsu+Bll2Ar8
 dDsm+gJ/afIB9BzE0OWEAU0jT6sjz0QXuhK7eR4B4HNEutJbywFTsUAaVc1toYNpasHp
 EbaM0K/KASlLNZwc3YFXPdP32rVqUXo+RhoqnqZySPVsfJJ+0LBWSK3Qm2lQl1YXJWgh
 FhUzPc3nH6oH0awIrBaW+Adnbqtkzmk6KnQUuchSmmMWW3kf9cBk4QUkwwdZdFyuSJXv
 pSMg==
X-Gm-Message-State: AOAM533TTXEDYkCuRsY9GwHPkjmKyRu1YozvIcWIaJIw1A1aSw5Sfaeb
 TsmWIA+FySFf1uRxBZBkDr5uv9COk+U=
X-Received: by 2002:a1c:2b83:: with SMTP id r125mr7737637wmr.168.1603558904865; 
 Sat, 24 Oct 2020 10:01:44 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id v123sm10402821wme.7.2020.10.24.10.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 10:01:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/9] hw/arm/bcm2836: Introduce BCM283XClass::core_count
Date: Sat, 24 Oct 2020 19:01:21 +0200
Message-Id: <20201024170127.3592182-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024170127.3592182-1-f4bug@amsat.org>
References: <20201024170127.3592182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QZjxvA1plCIZ

The BCM2835 has only one core. Introduce the core_count field to
be able to use values different than BCM283X_NCPUS (4).

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8f921d8e904..c5d46a8e805 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -23,6 +23,7 @@ typedef struct BCM283XClass {
     /*< public >*/
     const char *name;
     const char *cpu_type;
+    unsigned core_count;
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
@@ -39,7 +40,7 @@ static void bcm2836_init(Object *obj)
     BCM283XClass *bc = BCM283X_GET_CLASS(obj);
     int n;
 
-    for (n = 0; n < BCM283X_NCPUS; n++) {
+    for (n = 0; n < bc->core_count; n++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
                                 bc->cpu_type);
     }
@@ -149,6 +150,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0xf;
@@ -163,6 +165,7 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0x0;
-- 
2.26.2

