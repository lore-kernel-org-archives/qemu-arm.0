Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp390687njb;
        Wed, 10 Jul 2024 07:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAzi1fKhRj6G021qfyFPZoio1TWYXDGyKm1uvuyi065ztzSeZZZA+WGb/XVVcZEq9NRM8UQIb4gAM/O0SqS7MNUfmFOCA+
X-Google-Smtp-Source: AGHT+IHAwsd74tXLr+S9mXdoswlUJjMiK6reM7przrpN6HV4ZO83VIghZ+4xzpWXE+jg7BZ7CEOG
X-Received: by 2002:a05:6214:407:b0:6b0:789f:9ce2 with SMTP id 6a1803df08f44-6b61bc8363fmr80473326d6.2.1720620993851;
        Wed, 10 Jul 2024 07:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720620993; cv=none;
        d=google.com; s=arc-20160816;
        b=dwU0jMckqW+GN4ErgiD8HWHZYcmCVeq7KCWb8M1CZjH9DBq79J3eHXFwwYsTTujuKU
         zaPzJnygkWo8SufHQLRywr6U+y4b1FCLt6OrKptXV5nG+sRvSfng0xVQFpWl18ZUwPHk
         XLwdubKDjwldhhOQWXJCcSbPxoJVhTGi7N7mD6Fanq/gTJkPtPBGgvF8t+Gr0Ut6VzOs
         ZAokNTS6MlxfjSXj/qk8LPAkNkma8of1+VL8SBabxIP55ujr5wQHAgeh9f6h2GgxWiln
         2tmwWPB8q31JjCPDO00XOrrFaoCS/1NIZQslrqgwTik70tOLApQA6aioweEnuzeVv6s7
         zjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E592VUjNM/e32MWHdD7KwMvGh3P49D6D0LHQIn1oaLY=;
        fh=XebuggDVeLRg9REWX0YxwHNFut+1bJJJVqCWLKXZGT0=;
        b=j325/zt6Qchrf/Ysy53IK8wMelq1tL2j2ctn6wfcqkOFS0eiGbexDcZnHN6E+2TuQi
         b9wO8VmeuatoQinUseLCxHbK0RYhBGHvnw5TCKapdKW4WUpzAaMFmhR9xngEh0JCRGza
         ntBAUkga/cYe1ZQTphLDopCSxo3x7kO7JsupZCSLHnksSap94Beohe1K8cJ3GZmyWYJt
         79iiQzu7L52ZLhjRgGBIQaAXnu6fq4Tyg7WPgqlbBYRkud9SaiWdMkNSD0K1purT3wDo
         0rBHYzduA3y+sGQ7bTw/dgttJ1OMMOgFMAurHJeOJEY9SPnXm5F2GO+xM4pAoCuI/yyg
         oXmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f+gtcbBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61b9f6f12si46521796d6.73.2024.07.10.07.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f+gtcbBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRY76-0004bo-Ni; Wed, 10 Jul 2024 10:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY6n-0002Ig-RM
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:15:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY6W-0004Ec-AK
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:15:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42795086628so4320055e9.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620926; x=1721225726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E592VUjNM/e32MWHdD7KwMvGh3P49D6D0LHQIn1oaLY=;
 b=f+gtcbBtKrwwRBjIxCkoZUpe7GC7ZnimP78p8wUbldvdcJsZSlfJ1lfeuv5Fv7csd7
 j1tnaooeo9r4NdmIY1rG1Hbfvn0voNLrW+wh2x7ymSjrSHE/vQmVfScFUmBVgITWd6qW
 5Rl9ZTWOPVHyXzMnDdJG509cPB15xafckqg6DXWxd/6VPORYdCQeO50NW6XJTh37nI1B
 0Rts45t/NjSp3RByiQrNs+W5BmwsMzo4/jSFFvj+0RZmi0vXkvpjy34BzNirYi8mCn7r
 IaJdySSbu0dZQ8GPQQY09Tq1Qujthdp+L9tRsD0GNmWD5y1hj3uAmvSEhJSpJzk8Y6uX
 avMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620926; x=1721225726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E592VUjNM/e32MWHdD7KwMvGh3P49D6D0LHQIn1oaLY=;
 b=BSt9NEz4eHjm2qVqPJXy6G+iPadpnsncKAhDZzEwcFszHon9/fQQ0WvNAugmXzU6rS
 pSQsVCnwIqpFLXN4M1HM+hHfdraLwemFfQTuts3WXXkLtUFO/5KQ0tJS6V/QPN96ACHd
 4sLn1GS/AketQsM5vc38Q11d5aIwvbdX0vtau6nBGZw0teXfmy7r6ruI9oo/ZMHnPeDB
 VVj6/twyoiCTCwY0RZZAl2xP7aW69QqPaFYODUWyk8TMJMinsK1/1pnlVZbIUa4NFknj
 UWTIQBxntzv9dHpuhKBIBgvImj66YwzcVegjbaZK1mdmdWh3GGQeYQ7ibUwgvRDwkwAX
 0FPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWk5/9Ie05zZx1rNM30OdxnCrDQyhroQKeqDO6W7clgkd9Dz2mZIkogZkQ6ZrhzGWYTaBdrpVlCZasTl3JgBTFXFvM
X-Gm-Message-State: AOJu0Yxxh579NLrmwdxNFwUmia1qz/hzWqfVm/lncddVT9KL7O9DYg26
 sp3dNRvX2HqGZlxrU1ET2SdkLJGuL1c1kVjy+glKoVdHyabGp/jsV7wXm+iMIJ0=
X-Received: by 2002:adf:fdc3:0:b0:367:8a2f:a6dc with SMTP id
 ffacd0b85a97d-367cead15b8mr3771606f8f.44.1720620926710; 
 Wed, 10 Jul 2024 07:15:26 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab161sm5414331f8f.91.2024.07.10.07.15.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:15:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v48 12/12] hw/sd/sdcard: Support boot area in emmc image
Date: Wed, 10 Jul 2024 16:14:08 +0200
Message-ID: <20240710141408.69275-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: 91r/olC+IGuX

From: Joel Stanley <joel@jms.id.au>

This assumes a specially constructed image:

  dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
  dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
  dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
  cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
  truncate --size 16GB mmc.img

For now this still requires a mtd image to load the SPL:

  qemu-system-arm -M tacoma-bmc -nographic \
   -global driver=sd-card,property=emmc,value=true \
   -drive file=mmc.img,if=sd,index=2,format=raw

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 86b857d414..8c68494b8b 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -774,6 +774,40 @@ static uint32_t sd_blk_len(SDState *sd)
     return sd->blk_len;
 }
 
+/*
+ * This requires a disk image that has two boot partitions inserted at the
+ * beginning of it. The size of the boot partitions is the "boot-size"
+ * property.
+ */
+static uint32_t sd_bootpart_offset(SDState *sd)
+{
+    bool partitions_enabled;
+    unsigned partition_access;
+
+    if (!sd->boot_part_size || !sd_is_emmc(sd)) {
+        return 0;
+    }
+
+    partitions_enabled = sd->ext_csd[EXT_CSD_PART_CONFIG]
+                                   & EXT_CSD_PART_CONFIG_EN_MASK;
+    if (!partitions_enabled) {
+        return 0;
+    }
+
+    partition_access = sd->ext_csd[EXT_CSD_PART_CONFIG]
+                                 & EXT_CSD_PART_CONFIG_ACC_MASK;
+    switch (partition_access) {
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
 static uint64_t sd_req_get_address(SDState *sd, SDRequest req)
 {
     uint64_t addr;
@@ -806,6 +840,7 @@ static void sd_reset(DeviceState *dev)
         sect = 0;
     }
     size = sect << HWBLOCK_SHIFT;
+    size -= sd_bootpart_offset(sd);
 
     sect = sd_addr_to_wpnum(size) + 1;
 
@@ -1029,6 +1064,7 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
+    addr += sd_bootpart_offset(sd);
     if (!sd->blk || blk_pread(sd->blk, addr, len, sd->data, 0) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
     }
@@ -1037,6 +1073,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_write_block(addr, len);
+    addr += sd_bootpart_offset(sd);
     if (!sd->blk || blk_pwrite(sd->blk, addr, len, sd->data, 0) < 0) {
         fprintf(stderr, "sd_blk_write: write error on host side\n");
     }
-- 
2.41.0

