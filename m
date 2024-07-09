Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1560427dlb;
        Tue, 9 Jul 2024 08:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJlR4En2/oAOleCPGRQlIZV/7RbXK9Wrmq7xA2RZ2qCY84KYnU5mQx+BoNpfDED9htuyyPnUS1qGp8FQI7hDUDyW8zWXs2
X-Google-Smtp-Source: AGHT+IHX+mQ+t4yL8ps0LQBWDg++xPKrWD7hNkp0DiQD+FR2XcpNdPJIoY/1m50Zxs+GjClraKZy
X-Received: by 2002:ac8:5910:0:b0:447:bf9c:3ea8 with SMTP id d75a77b69052e-447faadc5dbmr32977251cf.65.1720538910976;
        Tue, 09 Jul 2024 08:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538910; cv=none;
        d=google.com; s=arc-20160816;
        b=Zf1WnOQZeo0Y63IOdSIHuoTLS6sCeH2JRJv5B+Q+WCY8zAwXdm/Rn8eTa8l5YOFZI0
         JzGKlTa9KhahDhtsLUeQev6ziz+izDbNwipK1vnbadb8LlXeW/KPrrprbtF3Pr+kx9NO
         psiKsthJB7bqkQPZ9gEouLpKiksNj9guVSDvlBGcZ3cg1j46LMyzOVwAm6n1j+kuUCow
         JFeh0CiJ3Xv28mvr9dD21+2DAi5s5oYPtMRt4CNZNmrxAXUe4K3HD6+w1MRtb1XjDqmL
         MdrR5NWeZ0pbzFB7krHBKvKcvVjvktOhVtJwZMTzeJsig7EFYjn+4OujkjWbJS3dmn7Y
         wrIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+txOcp3qn5aM6X855Qa2b4pW5/3CYGUDetUe05A68E4=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=c2+epJ7eir6Fk7zcUMhMtSM4LDYUq+WIMj4YmOhGGerHSe09v8JUf+F2PTfTSxxc9q
         b83IJdF891Kp4r9/B3TSzJ3nIMMnitnvnLpCR5HmonBtW1sXJPN2FS5SEoQZBketpHV7
         rWRYlvOBU/LeqsMYJsaKn7zR7kVvfAp2NLLEdOqMJvS92/FJa5Ye+OTR312X5t45gCGY
         ShAWMJRv07SIGL6gqgXSmJTvGjgdcW/LYyD7W2+nQKE7ENJP5EkikglxJRE32mGUAQQ3
         ubEGf220gkX8z2qcZCOp2/LtJ0dsBuedCgi1jHyCCt2Im09db0dpzgQ3kG0mT/vkdaGl
         snpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kIaWSKI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bbec49si26601371cf.397.2024.07.09.08.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kIaWSKI2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCku-0002IT-Qs; Tue, 09 Jul 2024 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCko-0001q0-KD
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:42 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCkm-0006Uy-OI
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:42 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so55899771fa.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538858; x=1721143658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+txOcp3qn5aM6X855Qa2b4pW5/3CYGUDetUe05A68E4=;
 b=kIaWSKI27ipfN2ZrRUnpzR1uxBX14Z8BHEVcoaMRaYzrMps/+T1htjYW5e8VNv2Isv
 0+j/QsuYxg7b8lypSURktaZNCm8QuPsy6adp3WaZ2FlkdzfafFfse7j2YMcVspcqQeTb
 InzMvwrSF0pId9D+rQkYIoZrRnyRAGO7Ew9rB7CVCqfaztoeTNna+inpwUSll6zyKeJM
 hPCsKDbd1szPTSqHHtU0L8kjV7Zf3JB9a2hWIEH/w++dgcjWehusXlhvpULtTCd+xA3D
 AyKCPNY0YXViYM/Hfeiizmvf8S2eLxKN3J4jzAY2xDGw3C7jPc7seChympz+9taebe0o
 89Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538858; x=1721143658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+txOcp3qn5aM6X855Qa2b4pW5/3CYGUDetUe05A68E4=;
 b=MBTkNlIQ9rzV29GP2r5/B7UJ1/ttgARXz7Dyoh3TIVzCgokVndVfX05MZiIqHAYAvQ
 aeRgU8yVtkAfG/JrigiZtCXwhKFFHa0r/CodKVuR8emvKS2pidgI1Mj45cXlIj6vSNjS
 jXRf0iTE53ekWAJUetqS898clufVunBOejk49YLyNxadiN8b2epK9gFAxT/Dkz48SaQo
 NtkGiICcRV2hXUAMKWyPbWXgpd6ypZdhZ9QpBQgV0W+g5oSENkPxJAMSxvhHlUfiW/ci
 f5oJHMm5ege0y0Qid0QCjTT944w1dy3nD+a6NsZNDGjAYWkSrSytv5xubfYxKkaFoBGP
 jStg==
X-Gm-Message-State: AOJu0YyfFNneld7hoXVQliI2ivYfeUd8aefv39eCNZhI22KoBJKwIV/c
 Imd6aiNUy/PFcvbc7mcVKH9gagKocrNACYsBBzO4haky2zg2e6skDJqiuu4R5rI=
X-Received: by 2002:a2e:9495:0:b0:2ee:7b7d:66df with SMTP id
 38308e7fff4ca-2eeb30ba26amr17868591fa.9.1720538857887; 
 Tue, 09 Jul 2024 08:27:37 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde891a3sm2840837f8f.61.2024.07.09.08.27.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:27:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [Aspeed PATCH v47 16/19] hw/sd/sdcard: Support boot area in emmc image
Date: Tue,  9 Jul 2024 17:25:53 +0200
Message-ID: <20240709152556.52896-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BDRg5UHNMVCI

From: Joel Stanley <joel@jms.id.au>

This assumes a specially constructed image:

  dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
  dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
  dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
  cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
  truncate --size 16GB mmc.img
  truncate --size 128MB mmc-bootarea.img

For now this still requires a mtd image to load the SPL:

  qemu-system-arm -M tacoma-bmc -nographic \
   -global driver=sd-card,property=emmc,value=true \
   -drive file=mmc.img,if=sd,index=2 \
   -drive file=mmc-bootarea.img,if=mtd,format=raw

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: Update QEMU command in description
---
 include/hw/sd/sd.h |  1 +
 hw/sd/sd.c         | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index d35a839f5e..07435d2e17 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -132,6 +132,7 @@ struct SDCardClass {
     bool (*get_readonly)(SDState *sd);
     void (*set_cid)(SDState *sd);
     void (*set_csd)(SDState *sd, uint64_t size);
+    uint32_t (*bootpart_offset)(SDState *sd);
 
     const struct SDProto *proto;
 };
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index c7f8ea11c1..5830725629 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -774,6 +774,13 @@ static uint32_t sd_blk_len(SDState *sd)
     return sd->blk_len;
 }
 
+static uint32_t sd_bootpart_offset(SDState *sd)
+{
+    SDCardClass *sc = SDMMC_COMMON_GET_CLASS(sd);
+
+    return sc->bootpart_offset ? sc->bootpart_offset(sd) : 0;
+}
+
 static uint64_t sd_req_get_address(SDState *sd, SDRequest req)
 {
     uint64_t addr;
@@ -1026,9 +1033,33 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
     qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
 }
 
+/*
+ * This requires a disk image that has two boot partitions inserted at the
+ * beginning of it. The size of the boot partitions are configured in the
+ * ext_csd structure, which is hardcoded in qemu. They are currently set to
+ * 1MB each.
+ */
+static uint32_t emmc_bootpart_offset(SDState *sd)
+{
+    unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG]
+                          & EXT_CSD_PART_CONFIG_ACC_MASK;
+
+    switch (access) {
+    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
+        return sd->boot_part_size * 2;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
+        return 0;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
+        return sd->boot_part_size * 1;
+    default:
+         g_assert_not_reached();
+    }
+}
+
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
+    addr += sd_bootpart_offset(sd);
     if (!sd->blk || blk_pread(sd->blk, addr, len, sd->data, 0) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
     }
@@ -1037,6 +1068,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_write_block(addr, len);
+    addr += sd_bootpart_offset(sd);
     if (!sd->blk || blk_pwrite(sd->blk, addr, len, sd->data, 0) < 0) {
         fprintf(stderr, "sd_blk_write: write error on host side\n");
     }
@@ -2871,6 +2903,7 @@ static void emmc_class_init(ObjectClass *klass, void *data)
 
     sc->set_cid = emmc_set_cid;
     sc->set_csd = emmc_set_csd;
+    sc->bootpart_offset = emmc_bootpart_offset;
 }
 
 static const TypeInfo sd_types[] = {
-- 
2.41.0

