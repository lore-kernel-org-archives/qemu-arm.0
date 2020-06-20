Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1643433lfm;
        Sat, 20 Jun 2020 09:30:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycrNIdEgMjfI8JUmE9H2kBp/1LhzHdlQvyFwbJemgKu4onsgnXbjSMMNSpxL+GC2UmOZRR
X-Received: by 2002:a25:cbce:: with SMTP id b197mr14959822ybg.316.1592670619877;
        Sat, 20 Jun 2020 09:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592670619; cv=none;
        d=google.com; s=arc-20160816;
        b=dxn48z9zf1pcNQH1R2kLPq+42l0WFPV41BOnUoQmT4AH6qoH/6h4bSgu9xA+vK7IWN
         9QntKep1NZOj3r65gKtcyFrW+/GelXvj7UE70h+LME7+UjoWzGI3FmmvcgoBAtqxpCt7
         kcvAHSajIX0vYXz5NESVZm+9Q+fnKY/vJDd1qIn96SJZ8eziOS81h5PmL+n3mCHY9yCy
         AcqvbA8HIZPUch0j1nULb6mm1Vaot6swbj8+H1FaALi+w6U4zib1/vL3MYn9gbSCgkMS
         HvVxD8IUcQ6/4bOuLKnoxBmREyOG2ulGehOFVD/IKSQhavgUmlW8t3QzDFZqvqu4x+DG
         0tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=u4yRFTMIfw8y7sQmFgoqYccYslLAPaFsaIXuAO8HYDQ=;
        b=x75AEVu6eFM46DQpagqiCNtaEUbqceV+GBXN4Vx0S214YHMmv7CEzDgU53gsEos/Sd
         9+bruay1N0NcRPLM8YmAHRz3Hih7LdAFjugoaZqhebjPQT+7GrSTQp5z4PN2ttVm9ecK
         5QA2Xi6GcKvEdg5kM+6EFFtgiWI00R+322adfoTQAXLCK4b6x8mhbhdM21qGYdDjHiHj
         VfE4Y3J/xnx49v18WLRPwp2kDmORZqBKhLcZXSEb5yGVCQrYqpuNmlrtI9SDMayzp9Yn
         lX8uPIXdrIrSEjKLMXSxaMUlZPp5GJYznUC6/BAEJKqL8u7/zDLD/6vB3muq3YMrcGis
         PVWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kwdui5Mb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si8362762ybe.134.2020.06.20.09.30.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 09:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kwdui5Mb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmgNn-0007WN-3u
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 12:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmgLy-0005b6-WF; Sat, 20 Jun 2020 12:28:27 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmgLx-0004n3-Fs; Sat, 20 Jun 2020 12:28:26 -0400
Received: by mail-wr1-x441.google.com with SMTP id c3so12462134wru.12;
 Sat, 20 Jun 2020 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u4yRFTMIfw8y7sQmFgoqYccYslLAPaFsaIXuAO8HYDQ=;
 b=Kwdui5MbCtqx5khqlC045H8+moV3fuxP+1MTptHQYxdZguwIXsmR1EZu2RykwImSi8
 jSOQgTOMx69uUZHaiVXQ+FjU1h97sb1bIykXFKrEGENe0d5o9B9m7xqfyIqS1v4qOQ2c
 FpSd/5dBUDqJzVgbBU2/eOsA5zDSgvEQ6533Mm825vqF/ouVYn76OqgCf8sPsxTvcy6A
 arP2IKY7yr3bbvJtC/DqYd95g+AwfKPWXMOL7J5q7s50Nzj9mUOf5adS96EUUjZPG1C+
 Iv43J3Q0WAiM3mJ1N1EzpWbkVhQ6aYXFVZr+FwXb+m4BoEpGj25aTJFuJuvhf6ZG0lxp
 0LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u4yRFTMIfw8y7sQmFgoqYccYslLAPaFsaIXuAO8HYDQ=;
 b=ZBGqyaNk00UgMX1AnHrrN2DO36ih+1KjDIG1qXF49qesKg6VNAyQngdO54KJpCZIjM
 ssfhh5KzaCL6RHallUUzui54QNTnhUmbZmynHjnnoJYxTsOABq7InXyZh1NkpyBixNZb
 36BBi9tUgNhT4vB54B2HodTLWPXEk3DRQvkdVZPb2u1+mu6MFl+7bNG4QD76W6N5Pc8H
 3D/USGv1yUklttO3YdDTRV+OyRuvXK1PIALve3ICbbGda84ubrQZ7mUnfbOf6lcSIPHC
 y3IgNBtBS9UVLSzcLAQroMruOan1MeH9g00WQh9ArnVEyBsCzhp2iMJoSceZ4gaM6YAe
 gg1g==
X-Gm-Message-State: AOAM532b9bI/bdNHPxNbYQUhXHY3BTxDAOhRhlBgO0MuHTS47in8Ec60
 sPhqlOvMPt/scyXR4LfM8KElFB2W
X-Received: by 2002:adf:edc8:: with SMTP id v8mr8528498wro.125.1592670503521; 
 Sat, 20 Jun 2020 09:28:23 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e8sm9240006wrv.24.2020.06.20.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:28:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/aspeed: QOM'ify AspeedBoardState
Date: Sat, 20 Jun 2020 18:28:18 +0200
Message-Id: <20200620162818.22340-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620162818.22340-1-f4bug@amsat.org>
References: <20200620162818.22340-1-f4bug@amsat.org>
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
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1nLs4o7i9BDF

AspeedBoardState seems crippled. We use incorrectly 2
different structures to do the same thing. Merge them
altogether:
- Move AspeedMachine fields to AspeedBoardState
- AspeedBoardState is now QOM
- Remove unused AspeedMachine

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/aspeed.h |  8 +-------
 hw/arm/aspeed.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 95b4daece8..9c9bac1263 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -15,13 +15,7 @@ typedef struct AspeedBoardState AspeedBoardState;
 
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
 #define ASPEED_MACHINE(obj) \
-    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
-
-typedef struct AspeedMachine {
-    MachineState parent_obj;
-
-    bool mmio_exec;
-} AspeedMachine;
+    OBJECT_CHECK(AspeedBoardState, (obj), TYPE_ASPEED_MACHINE)
 
 #define ASPEED_MAC0_ON   (1 << 0)
 #define ASPEED_MAC1_ON   (1 << 1)
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 31765792a2..6b7533aeee 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -33,9 +33,14 @@ static struct arm_boot_info aspeed_board_binfo = {
 };
 
 struct AspeedBoardState {
+    /* Private */
+    MachineState parent_obj;
+    /* Public */
+
     AspeedSoCState soc;
     MemoryRegion ram_container;
     MemoryRegion max_ram;
+    bool mmio_exec;
 };
 
 /* Palmetto hardware value: 0x120CE416 */
@@ -253,7 +258,7 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
 
 static void aspeed_machine_init(MachineState *machine)
 {
-    AspeedBoardState *bmc;
+    AspeedBoardState *bmc = ASPEED_MACHINE(machine);
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
@@ -261,8 +266,6 @@ static void aspeed_machine_init(MachineState *machine)
     int i;
     NICInfo *nd = &nd_table[0];
 
-    bmc = g_new0(AspeedBoardState, 1);
-
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
                        4 * GiB);
     memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
@@ -751,7 +754,7 @@ static const TypeInfo aspeed_machine_types[] = {
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-        .instance_size = sizeof(AspeedMachine),
+        .instance_size = sizeof(AspeedBoardState),
         .instance_init = aspeed_machine_instance_init,
         .class_size    = sizeof(AspeedMachineClass),
         .class_init    = aspeed_machine_class_init,
-- 
2.21.3

