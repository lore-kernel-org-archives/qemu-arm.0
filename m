Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp582224nji;
        Thu, 12 Sep 2024 09:12:05 -0700 (PDT)
X-Received: by 2002:a17:902:e5cb:b0:205:5427:2231 with SMTP id d9443c01a7336-2076e417e29mr39954225ad.47.1726157525177;
        Thu, 12 Sep 2024 09:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726157525; cv=none;
        d=google.com; s=arc-20160816;
        b=NqcUgey1RPkeDMu2mfASB1ze5yDMop+id53xeoLHoWInmk9mFn4UjQ+JoURQWf/vI/
         cNJzvS361a8+gPSv5CQ8qWxlnZZDbDf6n4bAqM3Z/fZ9OF15+TViWMkw0DZjmE+MehAI
         EpHwTKFDp6OhOJjfX+ergtZuGpy6wcKHmK5iL2iMrjPQUK6amtbFauDbjDhRiIyN+BqD
         kM+eXUIwjy/JKHEWeufp/W3PnBInEfVKzSrDIDtmBfYbFhTLvYbxCB8jsBzpstQI66vz
         BJ/8DsMDo8qg3LlTs4xHN1rja25Sp1Bpn0rIcSYaGARaDFErpmqAM+8wdhvgLZkQtU9D
         VyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=mKjZY38PTxGYr/WbE7V7KdYaVqXpGoHwAiqL2NqOWqw=;
        fh=ujiE8HSy6YTG7a3Z7CGLGec891YtQfFM1W/0TkY2zUo=;
        b=W3cnxbn5Hngs62Th7Y2X1z9kE+tmscBsVE3LdhP5AhlqLMRMEN0O+g9DZNlhT5eKDD
         YA+o333B+u0IQxrvmsM9wq/3u63rQ/jURtdnn61qsbA9pWexk+lH8991g/p5mAgnEdWI
         0IhXAfMjnCuVyvDR32g+G3P4kEHTzXhIMgFXDuOm+LrYS0ItH+RZsruVmTDoZ4xZWejw
         5vqXN67Z0WAE7/5CN7XmiojU1fHuZWyX5usNheqzMF3C2ztiMUd4VysbozwWqxNJN7so
         GOEcBDhAA0p1tBuFZmuWdURP+J/tAnw72YHxACR50e0nCTA1vFeEl966Hxo6m89UjHsK
         5hJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g4RSMzVW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710e1eea6sor67990485ad.3.2024.09.12.09.12.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 09:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g4RSMzVW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726157524; x=1726762324; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKjZY38PTxGYr/WbE7V7KdYaVqXpGoHwAiqL2NqOWqw=;
        b=g4RSMzVW1l24oNNGUJiYIoIXVVlSUOpYBXP4kZaPq06TIyLAdlGAN+xBbrokLhbvX9
         hAaaEdy69sgiodebo02sM/0TX2JhJP0aViYveU9ZG5acoKvvUOBV2Shanuxqgk3Yh7oz
         mN/lp9xk+xcn25sTmk0UCpa2b9Eo8VXErX8/W5CTPH0uh7ZCDdf9XifBzOIdhOd2PWAt
         Tz3cl6S9b0aLxO8HE/uOyfJTSyqOSpPKCEP6zfLFhmIscstsBxyBZoWl6CEHpjOQr6jH
         T0CZV7xHk8APhGTsqx6C3oox24JiEGaQ8dIAHpoiJ0obYQMpE0c9tSXywNvyrWqmy9dl
         KokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157525; x=1726762325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKjZY38PTxGYr/WbE7V7KdYaVqXpGoHwAiqL2NqOWqw=;
        b=Oit8mcSl15A6NmLrpMxruXjWk/K/4Cmpk5zAKP7Pnhi6TIAPo9Amg/znG/mkkHfmiZ
         eE6nTxi1OnebnIMwr+JWZgzNIp6BQ+/JiTwKajSBudIoEXsNQcDueLCycbdMJiwsYX/3
         NMBA3d2KMwsvKixBSRZz4N3NZqKZDhHx5KDVtYlxnv7RY8WtHQ3gfTH/zg6Sbf4E4Zr2
         9DKZ7ttttu+lqC85MrSMEFTebgFdAjI2EWiozWHneN7DxgXGpbXLB+XB7l22DV3f1Uq4
         bq2NXPCtMITtkI/M/hkxxw+KunRdnySx9cvDPSVwE13rGs16DxmlqNWLHw+M7sTenCp5
         1v0w==
X-Gm-Message-State: AOJu0Yws9IxLY9mcwXLvaD5LXAgcMjov6FDBQvninxgtzDO1nazMnZo8
	gC4W0vSHFs/sDV2w3lufHMY9UuQ6+NaAqmcE9aSMXwveoJRTX3f/1KPmMdu6mBtjCw==
X-Google-Smtp-Source: AGHT+IH3CkARGmsVrMtj/+IMTS0f8rigieK5Yd9oJ8RDmtHm7l5KLlEuNod9V4EkxnpZeL5wBcsOHA==
X-Received: by 2002:a17:90a:9ad:b0:2da:5289:89a2 with SMTP id 98e67ed59e1d1-2dba0092438mr3361278a91.41.1726157524497;
        Thu, 12 Sep 2024 09:12:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db0419aab4sm10868139a91.15.2024.09.12.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:12:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-s390x@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Eduardo Habkost <eduardo@habkost.net>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Rob Herring <robh@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Jesper Devantier <foss@defmacro.it>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Fam Zheng <fam@euphon.net>,
	Klaus Jensen <its@irrelevant.dk>,
	Keith Busch <kbusch@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	WANG Xuerui <git@xen0n.name>,
	Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Corey Minyard <minyard@acm.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 44/48] migration: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 09:11:46 -0700
Message-Id: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Gq8SJdBIuTDh

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/dirtyrate.c    | 1 -
 migration/postcopy-ram.c | 7 -------
 migration/ram.c          | 2 --
 3 files changed, 10 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index c03b13b624f..5478d58de36 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -229,7 +229,6 @@ static int time_unit_to_power(TimeUnit time_unit)
         return -3;
     default:
         g_assert_not_reached();
-        return 0;
     }
 }
 
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index f431bbc0d4f..0fe9d83d44a 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1412,40 +1412,34 @@ int postcopy_ram_incoming_init(MigrationIncomingState *mis)
 int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_ram_prepare_discard(MigrationIncomingState *mis)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                  uint64_t client_addr, uint64_t rb_offset)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
                         RAMBlock *rb)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
                         RAMBlock *rb)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 int postcopy_wake_shared(struct PostCopyFD *pcfd,
@@ -1453,7 +1447,6 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
                          RAMBlock *rb)
 {
     g_assert_not_reached();
-    return -1;
 }
 #endif
 
diff --git a/migration/ram.c b/migration/ram.c
index 0aa5d347439..81eda2736a9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1766,13 +1766,11 @@ bool ram_write_tracking_available(void)
 bool ram_write_tracking_compatible(void)
 {
     g_assert_not_reached();
-    return false;
 }
 
 int ram_write_tracking_start(void)
 {
     g_assert_not_reached();
-    return -1;
 }
 
 void ram_write_tracking_stop(void)
-- 
2.39.2
