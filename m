Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161267njg;
        Wed, 18 Sep 2024 21:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU7FyUXOSo0kNO2C6YxS8/Te2PJsnE5KNIEeV1abswzBHXgVwsF1FhYVfZUgjBBItwt8i6pBjTWSA5rQ==@linaro.org
X-Received: by 2002:a05:6a00:1ac9:b0:714:2dc9:fbaf with SMTP id d2e1a72fcca58-719261e73c0mr33737590b3a.18.1726721215284;
        Wed, 18 Sep 2024 21:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721215; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7zW6YuzmADSPLYC91RGzYXxNxbaEtRo9gk+kOs2pPjIwst9RCQYhnd8hnZImGw0/1
         4D9VK1+Qx9Kb+so58TL64cEt0ktEtfatsij4Ny1zOPKqyIAYHshGefNW74QmzVNhJoK0
         g36yoYEjGEIKysdusoJpCZVWoZnauO3DTbqqLDkhzaSKx2dHGfDJvxlxlKXlcFAxEdr9
         fIydl6R91SsL4u/gDCslvx7CmNDd7M9UAYNv7N++PQkrOY/0nmqC4tlvPFP8P74fLbgg
         UQJAVe64RJo5BqhQgfKpfPDYOjeOfIGq40IWLZ9vkzYdasJ1LJALj1ZULhmf/xmfXP/E
         TRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Azxsm+D4GnAmylef8kDOF8WcNEX0H+f5CVUHICifCkU=;
        fh=y6RUZf/D8nsE+hI+DwAqnUk8kzLlKhjtN7rryhlbqsA=;
        b=eS7gnqNFga6SzjPLRXqIPk9fw2edebboVo8w8rJ4iqs8KhYk6aB+e1a2waQ4HHJYE6
         noN3UGL/hiJeG+rGD+QI+2BlD/3DeR44c2972BuoO+LyVVldEOOrai5dW6JDjks/RuQ4
         TA3SHvD2nl/ubT8Sl0PwDCrvWTb1xBY/6YRM5LbNOjPHJ+Ft2lRHG0VpVHQXdxNoJwBz
         vi/jTJyxu31gQaN7yauX2TSseFQXOowBhMR/2PJcbyw4D0TXGaglPRQ/gHTQoDsGZ2h+
         3ddZIevOglevNoGaAvMdFvV24XjkuMb4GIjIktihVTIeIvGbUF6jfKIgNoCx2kdRO094
         6cFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gN+XYXey;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944a958f6sor7335150b3a.3.2024.09.18.21.46.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gN+XYXey;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721215; x=1727326015; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Azxsm+D4GnAmylef8kDOF8WcNEX0H+f5CVUHICifCkU=;
        b=gN+XYXeydx7L/HmbeoVEkIRNbZC0fAl4hfEezXhvEKZqKtV8YSZRcbm5G8YWKKJsya
         Ai0yEmbhc0sHgOv4EXjeS+DNoxF9f/gU0/CbOAV0qnDQQdPQeo870LzqOPcUBDc3MUnb
         hlM/fhRmo00abbyGpMiwr1G8NBcu8diyCjfbhTfNejfLMlsbPvw+3ZlMA2/dpleklbQG
         gS0HgvWTg1fp98GwLmKDwz2SyoZdSnM8e3sxwT93gQ+W++zsrjgPEdrDLfAm860TIQNa
         uxz6UW3gDOp+euV7RjmfXa4FGVYd1Hnd2Xasic14JrjnQLKR4iUnRWeJZ7kIydWe9DDF
         qzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721215; x=1727326015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Azxsm+D4GnAmylef8kDOF8WcNEX0H+f5CVUHICifCkU=;
        b=pAC/CxQgWtGF9Mr9EK/ts/fkxtLUnpsA0NWTOysd5j2OV7sDbOCW/qkOPGQysT7MPK
         UNMlOrWV6N1TBN2FxLbZieWKgrHNYE3V64V4F2rTKPmV9IHJSqWqfo+ie0tP+psqJwGz
         La1DRI9z1YVuSxyHrao5FJgUDlCl5T6hoYhwKt7CwJ6regeDLxrwozs6J8BSM5Qz+Zat
         KRjJheiy0n/aEhSQdQn7UKGAY40JCLnHztmJGnBmRdGEVs05j+NH3ocBO9DWryXN0pez
         xaDDgjzK+MdVlVvBUZClxsuqpsdqfHIVKl4s6+mNpfSYkV0XfSCbje6yYQtNoM4wmsyV
         jFDg==
X-Forwarded-Encrypted: i=1; AJvYcCVa1fo7DAYfGQk8Mj8ccJWOgobGolPOOZxm+x60x7n3EZ8sNA5ey007J2O1amdjZFKD9y+P3t5nqy2/MQ==@linaro.org
X-Gm-Message-State: AOJu0YxJlw1X1UxWTTwxmqwqKTiTcJYbBDKaalzKPnx+4HqTSGNdoiXs
	rALjjyG+CxBBomTTOXZeSsQB6qLOeIOEYRj3ktCjmEr2+mCfKLioly7sJD7gpgMWlw==
X-Google-Smtp-Source: AGHT+IH8mpWfLmu3//R/SRK5Lkyxtdl1U1xPXKHUsLRMNU3Octj4owEwLu2zdVJDZekcWXpKcQsdUg==
X-Received: by 2002:a05:6a00:4f85:b0:717:81b3:4c7a with SMTP id d2e1a72fcca58-719262060abmr39788484b3a.24.1726721214659;
        Wed, 18 Sep 2024 21:46:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 04/34] migration: replace assert(0) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:11 -0700
Message-Id: <20240919044641.386068-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SKJi8Wcno2ta

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/migration-hmp-cmds.c |  2 +-
 migration/postcopy-ram.c       | 14 +++++++-------
 migration/ram.c                |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 28165cfc9ed..20d1a6e2194 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -640,7 +640,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         visit_type_bool(v, param, &p->direct_io, &err);
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     if (err) {
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 1c374b7ea1e..f431bbc0d4f 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1411,40 +1411,40 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
 
 int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
 int postcopy_ram_prepare_discard(MigrationIncomingState *mis)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t rb_offset)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
 int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
                         RAMBlock *rb)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
 int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                         RAMBlock *rb)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
@@ -1452,7 +1452,7 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
                          uint64_t client_addr,
                          RAMBlock *rb)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 67ca3d5d51a..0aa5d347439 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1765,19 +1765,19 @@ bool ram_write_tracking_available(void)
 
 bool ram_write_tracking_compatible(void)
 {
-    assert(0);
+    g_assert_not_reached();
     return false;
 }
 
 int ram_write_tracking_start(void)
 {
-    assert(0);
+    g_assert_not_reached();
     return -1;
 }
 
 void ram_write_tracking_stop(void)
 {
-    assert(0);
+    g_assert_not_reached();
 }
 #endif /* defined(__linux__) */
 
-- 
2.39.5
