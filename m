Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694891wru;
        Thu, 27 Jun 2019 13:29:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3D2CR1Z4ba5SpWa85NG0bU6H4DV7vqlLR64mRpd6bLNZdH45CdUT8yTMK/T7AuCT4VKVU
X-Received: by 2002:a0c:981b:: with SMTP id c27mr5199113qvd.48.1561667368505;
        Thu, 27 Jun 2019 13:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667368; cv=none;
        d=google.com; s=arc-20160816;
        b=XJk6GuuDWSmng+6J6byVNg3jJVg72z2zQsrYWxU5ltfsOH7TZs2VpcR710jX3YagDn
         /aWSkKTNc1frXPB3OlYONnEDn5uW/9kaRMM1ThT05iSs65YyPIjAjcMx7JKelJzYeUrw
         1bgz5jVDwk8Aw91jLFlAKiOqK7HyAHMwes2X3Xc0+C/E+KqHjtdhkAf5ijDmMRqrXptU
         glepl9+hfEQ6vqA0+VJYXJP14s9ELs21XXWwqwpKY6guZ+azIQuEhgubMpv/0jdmUAmh
         OUi4/yjc5VlyFM8YJE9yVRZkACzAlzelnlZ0l5R7LfGFXEW52g3VaB/b3eOOGtBPNOOp
         VjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=QjbNN640dBIU3kM3+/t+SK7ll2Gs17tRWGJc5Nj5eZo=;
        b=DbAhg53vtFAK+ORMVZzLHII3WCySdQzmTihdLiTjeQw/kWh6AfxdxRpL1+fyEXRyst
         xUePRlUI7AUDDA9PqPGKbs5Trhl70hWlGy8TJPMcYFezoJ9aTFLVrRliCGFm+axx0Jnv
         6gbv4/sdAsxRH1y3drsirNdgr1wJeJ5w/SyrEjklAKmYJMsqlLUQecm1xIqkau7zuzVd
         NLQOxIhw5/xaEH5k3LFr0KO4bqAQ17y96qk8d6f2X87S4J9sceG41HafaEtxHnwmTXmN
         8Ah4hrdC+NAnOzMnaRmJrpP4A1BNsxdCPFIuGLlNMVYjJCOiR8LepME4xN3PVcVU+x3a
         Pqhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q28si113804qte.31.2019.06.27.13.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82C5E356DA;
	Thu, 27 Jun 2019 20:29:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D50C600CC;
	Thu, 27 Jun 2019 20:29:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 14/28] hw/block/pflash_cfi02: Remove pointless local variable
Date: Thu, 27 Jun 2019 22:27:05 +0200
Message-Id: <20190627202719.17739-15-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 27 Jun 2019 20:29:27 +0000 (UTC)
X-TUID: ZZ07AeGo+oS6

We can directly use pfl->total_len, remove the local 'chip_len'
variable.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-6-stephen.checkoway@oberlin.edu>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 4be3837be5..1a794fa83c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -409,7 +409,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
             /* Chip erase */
             DPRINTF("%s: start chip erase\n", __func__);
             if (!pfl->ro) {
-                memset(pfl->storage, 0xFF, pfl->chip_len);
+                memset(pfl->storage, 0xff, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
             }
             set_dq7(pfl, 0x00);
@@ -490,7 +490,6 @@ static const MemoryRegionOps pflash_cfi02_ops = {
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 {
     PFlashCFI02 *pfl = PFLASH_CFI02(dev);
-    uint32_t chip_len;
     int ret;
     Error *local_err = NULL;
 
@@ -507,18 +506,17 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    chip_len = pfl->sector_len * pfl->nb_blocs;
+    pfl->chip_len = pfl->sector_len * pfl->nb_blocs;
 
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
-                                  chip_len, &local_err);
+                                  pfl->chip_len, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
 
     pfl->storage = memory_region_get_ram_ptr(&pfl->orig_mem);
-    pfl->chip_len = chip_len;
 
     if (pfl->blk) {
         uint64_t perm;
@@ -533,8 +531,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     }
 
     if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, chip_len,
-                                         errp)) {
+        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
+                                         pfl->chip_len, errp)) {
             vmstate_unregister_ram(&pfl->orig_mem, DEVICE(pfl));
             return;
         }
@@ -594,7 +592,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     /* Max timeout for chip erase */
     pfl->cfi_table[0x26] = 0x0D;
     /* Device size */
-    pfl->cfi_table[0x27] = ctz32(chip_len);
+    pfl->cfi_table[0x27] = ctz32(pfl->chip_len);
     /* Flash device interface (8 & 16 bits) */
     pfl->cfi_table[0x28] = 0x02;
     pfl->cfi_table[0x29] = 0x00;
-- 
2.20.1
