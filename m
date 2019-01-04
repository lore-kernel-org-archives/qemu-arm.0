Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp662049wrt;
        Fri, 4 Jan 2019 06:28:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN52BJQtTme1XzAaScnwqeQmMUmm26A8aSVizWPo/oR9eiLzqLDf3V9QaUIYrKV8glWWXv46
X-Received: by 2002:aed:38a1:: with SMTP id k30mr56516qte.50.1546612120578;
        Fri, 04 Jan 2019 06:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546612120; cv=none;
        d=google.com; s=arc-20160816;
        b=prBHV5e83AvFfRqdzXyhvw7qxugPcAiJgRDc34Yyf0gQ6f3xYn4w3ELCIYFqg6zrmW
         HV3Gc8lSdxT8AairOV8B2LE2v5ooOWtv8r2u24rKFi5BPCLdeegSXhESizmr1MQ+He7t
         D0dHhtdF2QlshrAmy9K72z61YuhfVwExvRBDvsvozdzwTgJ6G4Zx6DQOxC/6ntgey67V
         6dq4H7LA6s8R0wTcGSS87q4AusEx9B6CBu73ECKHK4CmVBwA7EkbxnaOZrwa+CQbUkK7
         U/Ph9RauqbJ56JTTQGoY3Oa9aTFXQClCK+n1x6XGqmFFtIyxZmTEsHTK3dWPwE/mrMwe
         KHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=WKrrI0oBy+W58hCUGq5Y4qBBKMwsRVtrW3gEic4Iodg=;
        b=Ctxsu8K88DbenygQCA0b01cxujmu73L/gCYlCDmD9zwjwmA4uki1a6FSBZWbGL4dKR
         qKTvSDkjKAdNoLAu8iUra4ENqM8Qieunn6eUPg3v9KYqZw6yWgG4qdvyfeSK0SMzRaWI
         K7IOmZklU9KiO//Xyuov6PR+ScNuisrpvMVKWf/QHaEea6hYRmdK7ueWBWHaS+UXnGLS
         b2aR2niarkXve9zqhf9mWYwvFwOjbUQuvOpK93rQmOubJ7MJs19jnb2O8MKD7x5ix03U
         +WPiItx70dShXiRtIyYU4gQicCsgFjMjsliZvrwFywBbYgf0+kN1xYU66n1+j7/9qJ3p
         OOYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nQVZ9SuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b62si9263887qkf.59.2019.01.04.06.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 06:28:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nQVZ9SuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:35881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfQSm-00007w-3M
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 09:28:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfQSc-0008WQ-Aq
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 09:28:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfQSb-0000qp-DF
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 09:28:30 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:43631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gfQSX-0000fl-I9; Fri, 04 Jan 2019 09:28:26 -0500
Received: by mail-lj1-x242.google.com with SMTP id q2-v6so32560611lji.10;
	Fri, 04 Jan 2019 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WKrrI0oBy+W58hCUGq5Y4qBBKMwsRVtrW3gEic4Iodg=;
	b=nQVZ9SuCSm/QZDL2BWnwXAw1LKuqm8DPg/hl2gpUPsJ+80xcbcC4Mi1zqQznNpaTWx
	AVjDfa75XAHrl2wwkBRwdPhgfBF7afINUmDcOKLJegjDZZzx+DZeqplXxl0Klbl52V8M
	RA+bhEDLRLeZ3Ez29D2qH9C4UNd9KCAvVrsbHBX/AkIL+/S/HgVOOsHb28rmLdnOytj/
	xtpnMyfF42FMBjE2Cx8i9W1mwh3iYhCi8miqtLR0D3ddyEiFw8QUsDHIo+MsCbGdLQxX
	iNGDBLbgY5KEX0Va06TkLP493JM+gxQkTKGZe5GMgCObgfTaYURFd2c6Epf/ajH1+YD8
	JqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WKrrI0oBy+W58hCUGq5Y4qBBKMwsRVtrW3gEic4Iodg=;
	b=OCSD8thMKotgyyTXfnomtoR2WGojYEzO6Db8/8SbC0x6VEl82EN9rHm0QZT27pMNCa
	oO8qI2JTXlYqNJCPXP65zYxIVCGT4Y9zqDiMvLGzc78KKAy22tx+2bXYL8xQP/jWOIxr
	c7XNt2vjYgTIALBYaA5dljEQKez5lMZjKj0Uq8iXcm++ymSPnOdgS++krErmvUMenQ+c
	RjgaxvcYUtooKFCPaX/nyf4nYkj7TRfo3xVQxVWuywoh3dElBnLZrh8JOyQpuMQsup0T
	DbYjJ9aa88RL4lVfw3BakXBB8Qr9zlOYJDkDJIKQ9e07XFpYoRdRYaLC4tSQeiQGPFzY
	gNZg==
X-Gm-Message-State: AJcUukdw3wR2I55NSpzHAxlklvIKkLe63bunkpi3Er6TanSYtgFGLKeJ
	Ba1aAOBOsMLaC6+3o/yyp8ayjI/ZV4g=
X-Received: by 2002:a2e:81d3:: with SMTP id
	s19-v6mr17143462ljg.138.1546612097795; 
	Fri, 04 Jan 2019 06:28:17 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	h22-v6sm9332938lji.45.2019.01.04.06.28.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 Jan 2019 06:28:16 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  4 Jan 2019 15:28:12 +0100
Message-Id: <20190104142812.20444-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190104142812.20444-1-edgar.iglesias@gmail.com>
References: <20190104142812.20444-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: [Qemu-arm] [PATCH v1 2/2] target/microblaze: Add props enabling
 exceptions on failed bus accesses
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D7i60LuIEhmd

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add MicroBlaze CPU properties to enable exceptions on failed
bus accesses.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/cpu.c | 12 +++++++++++-
 target/microblaze/cpu.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 49876b19b3..5596cd5485 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -202,7 +202,11 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
                         (cpu->cfg.use_barrel ? PVR2_USE_BARREL_MASK : 0) |
                         (cpu->cfg.use_div ? PVR2_USE_DIV_MASK : 0) |
                         (cpu->cfg.use_msr_instr ? PVR2_USE_MSR_INSTR : 0) |
-                        (cpu->cfg.use_pcmp_instr ? PVR2_USE_PCMP_INSTR : 0);
+                        (cpu->cfg.use_pcmp_instr ? PVR2_USE_PCMP_INSTR : 0) |
+                        (cpu->cfg.dopb_bus_exception ?
+                                                 PVR2_DOPB_BUS_EXC_MASK : 0) |
+                        (cpu->cfg.iopb_bus_exception ?
+                                                 PVR2_IOPB_BUS_EXC_MASK : 0);
 
     env->pvr.regs[5] |= cpu->cfg.dcache_writeback ?
                                         PVR5_DCACHE_WRITEBACK_MASK : 0;
@@ -265,6 +269,12 @@ static Property mb_properties[] = {
     DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_writeback,
                      false),
     DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
+    /* Enables bus exceptions on failed data accesses (load/stores).  */
+    DEFINE_PROP_BOOL("dopb-bus-exception", MicroBlazeCPU,
+                     cfg.dopb_bus_exception, false),
+    /* Enables bus exceptions on failed instruction fetches.  */
+    DEFINE_PROP_BOOL("iopb-bus-exception", MicroBlazeCPU,
+                     cfg.iopb_bus_exception, false),
     DEFINE_PROP_STRING("version", MicroBlazeCPU, cfg.version),
     DEFINE_PROP_UINT8("pvr", MicroBlazeCPU, cfg.pvr, C_PVR_FULL),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 03ca91007d..792bbc97c7 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -308,6 +308,8 @@ struct MicroBlazeCPU {
         bool use_mmu;
         bool dcache_writeback;
         bool endi;
+        bool dopb_bus_exception;
+        bool iopb_bus_exception;
         char *version;
         uint8_t pvr;
     } cfg;
-- 
2.17.1

