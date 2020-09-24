Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp166070lfq;
        Thu, 24 Sep 2020 04:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQpp6pX4KljFN4/rVu+h2hS0qMjbcOZbEkwZl2ZcSw2brRiUcAUoaL81S2hpESJ7UX9Z76
X-Received: by 2002:a5b:d43:: with SMTP id f3mr5762495ybr.46.1600946428863;
        Thu, 24 Sep 2020 04:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600946428; cv=none;
        d=google.com; s=arc-20160816;
        b=bm07C2aJsoOHOXt53Bv6CkeYJd+Pn113w7APi9xO0GeGSig2C/5pEEcBVpL8Ehsi/x
         YbGlw4c8FA0T0VRy0TIGKsCWzsx90dqrlm/104/a2WilSn5qf5iimeAsjizDP4ouXNOj
         CNjkSNwut3ByQZv+25elQNeXvm+pTWMmcy2PRhyRogf1JV8pA5e/M7nuB3ZTh1RXeM7k
         tcu1JxuRaFezJIbEMj6kD/YX/iaMtLQvfVpksTKnFGcARA89UqtnZi52MIseyDD+Q0cS
         R3Sdjc6vGmV3Avu1QykeZAjehFzLLQwHXZL5u0O3U38srw+FTNUtLvAejYHcqv17T+iT
         lRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4jv3gV83IdvS5OKXioOXbKRM8ceNFIHhtNFiZgXYFU8=;
        b=la3sLp09BLgzERHcdJrhIgA4PjtgozLRqUl1rqItx9/+QCvk7Upbt1ar0fr5uR0Bcm
         KFp1xylDGlLOZ0ACebuRF6bDsnw0MY0ZHvimBxEqEb735/+elbX8lqHOVzTBkYCAFRYX
         Ok0BkfZpypqDtxrRsARP8skaYUrIS2VEDckkkaAm/0s8YDX/oEh9+Jgvco3/yns3og1z
         qr0qtuqJqcJLJCYPi9IfunKAyBUNUhx7gV0egY0N6h2udmXNkZJh2Gk9sC9B3eBMkBT9
         ++n4qOZATXz1xst+yy+P6dobRSG9jimt1FO5oiQDv4viTyL/zT8isoLj41wpaqKMKHth
         62gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XHB3f84k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si2596346ybc.403.2020.09.24.04.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Sep 2020 04:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XHB3f84k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLPIZ-00065v-Pe
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 07:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kLPGV-0004Ge-3U; Thu, 24 Sep 2020 07:18:19 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kLPGT-0003vU-GE; Thu, 24 Sep 2020 07:18:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id w5so3360069wrp.8;
 Thu, 24 Sep 2020 04:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4jv3gV83IdvS5OKXioOXbKRM8ceNFIHhtNFiZgXYFU8=;
 b=XHB3f84kgvUwuD6XO/36aeszXDbun0OLCbns4Yk7pIQmZ4SajnFzoIMTp4YtQC34Z+
 cyciTFdmw5ip92S/UZQVAzxhm98G+efTXlTo8qgy1NgcdylN8NF0ZDFLx8L+Gtza1BMY
 jGGcgO7U8fEOKV9WPDI+ku40JKKucffZOsJZk8JyMOZU8vmLeoN3ukjTZxRqShTC6QER
 okcmjx7cOSkzRG+rbXfCe0qcS05SgyXyydPyMKlFYjlHagids+bmsblu90pjvF1VkUuV
 hcAaocjCNYkr+ybDZNaJkJuj+Yly3aAkqFTJO2s/b1ngs+4N4Dk0T489nJZKEsdgFzG8
 4vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4jv3gV83IdvS5OKXioOXbKRM8ceNFIHhtNFiZgXYFU8=;
 b=rwNvyN7q5H+xT4q7qnYjywHiyUdpVJYZb/WcxTacJxXYgY0YCJSK9mItyIxhBINYro
 TQc+Zeu3dh9WrmqnyQH0+HqodGk5avYeVWrwE28veoTGdiZ7yu/6mg9hel+DFDXC5PDY
 v1aSglUgts8AprR+vybQE49JhkRX+9TE3yL6Q3F2Vea/Y+cuMJVekauTqH0vvxOyVPMd
 Yqsql3E4J6Oo5RO6Ypst5eZ+zISuH0DTZ++IYEyC5uoRZutBnC9ACpHYHwqSkqki/TbY
 vQLix2e+2vB4DWUQJ8cN4roWzGrQ5Qk4jqq2da7yifAuXTbPO+W03nB6G7c4GFGOF1Ns
 wnyg==
X-Gm-Message-State: AOAM533LON21iWO5pw02ChrQbCjKbIbjG76ZrVt1WIrSCKWQftN0lMMn
 85mchEAVH3iK3X2RZNHQbPW1RXIqWf8=
X-Received: by 2002:adf:f88b:: with SMTP id u11mr4418818wrp.376.1600946295632; 
 Thu, 24 Sep 2020 04:18:15 -0700 (PDT)
Received: from x1w.redhat.com (234.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.234])
 by smtp.gmail.com with ESMTPSA id h76sm3400363wme.10.2020.09.24.04.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 04:18:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/8] hw/arm/raspi: Avoid using TypeInfo::class_data pointer
Date: Thu, 24 Sep 2020 13:18:04 +0200
Message-Id: <20200924111808.77168-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924111808.77168-1-f4bug@amsat.org>
References: <20200924111808.77168-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gysFuJ1RwXi5

Using class_data pointer to create a MachineClass is not
the recommended way anymore. The correct way is to open-code
the MachineClass::fields in the class_init() method.

We can not use TYPE_RASPI_MACHINE::class_base_init() because
it is called *before* each machine class_init(), therefore the
board_rev field is not populated. We have to manually call
raspi_machine_class_common_init() for each machine.

This partly reverts commit a03bde3674e.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 16e6c83c925..3000e6d57e6 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -306,13 +306,9 @@ static void raspi_machine_init(MachineState *machine)
     setup_boot(machine, version, machine->ram_size - vcram_size);
 }
 
-static void raspi_machine_class_init(ObjectClass *oc, void *data)
+static void raspi_machine_class_common_init(MachineClass *mc,
+                                            uint32_t board_rev)
 {
-    MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
-    uint32_t board_rev = (uint32_t)(uintptr_t)data;
-
-    rmc->board_rev = board_rev;
     mc->desc = g_strdup_printf("Raspberry Pi %s (revision 1.%u)",
                                board_type(board_rev),
                                FIELD_EX32(board_rev, REV_CODE, REVISION));
@@ -326,18 +322,36 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_id = "ram";
 };
 
+static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa21041;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
+#ifdef TARGET_AARCH64
+static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa02082;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+#endif /* TARGET_AARCH64 */
+
 static const TypeInfo raspi_machine_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi_machine_class_init,
-        .class_data     = (void *)0xa21041,
+        .class_init     = raspi2b_machine_class_init,
 #ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi_machine_class_init,
-        .class_data     = (void *)0xa02082,
+        .class_init     = raspi3b_machine_class_init,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.26.2

