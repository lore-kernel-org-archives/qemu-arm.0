Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422531nji;
        Thu, 12 Sep 2024 00:39:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOSfurV52EYT6zTogadrj/lF+0svQx7GbToAWkaNrzcXs6aU5IIv7Vx8I4PbLwXfAqY19BDwzhNr/kEg==@linaro.org
X-Received: by 2002:a05:6808:1593:b0:3e0:4f3d:8d00 with SMTP id 5614622812f47-3e071b22026mr1045498b6e.40.1726126787634;
        Thu, 12 Sep 2024 00:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126787; cv=none;
        d=google.com; s=arc-20160816;
        b=DeGoUdTeT8JElzaZeX+Cd31uV1OyGEj2aQFn5Z0AkQSxvFB1QwNexYd6CuUdZG+a7P
         uSUhXW9nWyZ+gzmDUmgUsxRQf8YrC41LwC0p1VXqzK698zGq6okbH0+2oAJusRMu8i75
         CxiyFK4xjXeajiLFunJneZlYYfdgwCDJrDFfGvaZu9I4YknCvB4zjNPs+iBX2fYvQji1
         jrHaHY8OGwh37eNMlg8iio1Cv8iTz/DkcdK8u+YvIh7cv1lqpyM1+4Dtqpskk5ipShKu
         +wLZJlG44tq46Si5+EG7ylATtvtCeb+gK4qt0phUETTBYbslArFiw6fCCjn+FeGY4M/O
         UoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KmOJONIVi8Rgmcdj3MpwvRz35OjK70IjJaXWHbl2cKY=;
        fh=ZuPV4vJxTr3EbfHM9h8fLXPfDPvLLfZJJUz8PHKt/Os=;
        b=oCtKSBb8WhmZOvZcY6Upie0/f/X3plMKwBW4hgkdLJWs8jHVcyJwK7JQatN47vTopv
         7Rl9pYimxrMrfUWYPNyb5My/Ax80PO6gf9mdSFHjcR5qU9R6uRR3Ca3lQVD7r7xqfFJI
         LtglE/RsenNjPLBVGaGktDEAm22eD4P4z5jgRwmdKkddeQnx0ct7wnrpCq1nMGAJIEBp
         L2G7XOrHeCDkWu+6jm76MvParOQecbnsSuC5z5lH1aek+9tqVSyKRTq8KzFwzJ+DWzlM
         AO8WggA+K+l1o0+J+LDwNa2JRMFCsVfAJIHHvkklreDei89U14IOT7t/0N3i5P0CXMUm
         yyoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdZuqOld;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e039bd6902sor3902234b6e.16.2024.09.12.00.39.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdZuqOld;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126787; x=1726731587; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmOJONIVi8Rgmcdj3MpwvRz35OjK70IjJaXWHbl2cKY=;
        b=sdZuqOldtnqNN0MKnuQbYwFmPGal2cd5ewCJC0lKi436XyduMWbBagWlKyNJy/kGtb
         HvnPmBxuYFmJj9M0OnIlpEd6mWatdXaLdqkPs4WS1HT5KMkzXme2pEWSuW4Zw9fGzZwm
         TaSJGqv6/iXxR2Au4AZZbO1I1GW2gHsLbBWDDWrXWp2ujOGlACStzUP3/9U6Ecb1S4zg
         CyLKytCnnRr5IFh5uvL1VaoMZ+eOdCLv1NEjRyWdJnOeplyxfugGXmMzX5ny10dF6OW0
         IOqmsuMsi/6w/QGI4anlxgo/RtkfwyNFL5Dv/8DPi2ObpsXkbHsVA9CtCL0yPFEgtirm
         5JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126787; x=1726731587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmOJONIVi8Rgmcdj3MpwvRz35OjK70IjJaXWHbl2cKY=;
        b=CtnbVHS+rvsg0xaDws4dSNmq+TFX1rJ1/qXK15Rr1BXsu06f+ovg6NVuC1Vrx6Ff06
         4DxLeGal+EZqGPqSlSifMYWOntjO6sEqQ2CBzdDloYt0q1bzdl2W/eRRBgFRkySnN2FR
         f0XmV09dVHa7VSuboUNeoC32YGAJl+CkDQ6iytULZNEqfJF8gd7PgvX1El3kkJK3u24p
         NVacS1s0Kjnvv1QYYBQctbmOwz4Eby7Pm6+J8Dqb++IVW9cvc2dBs06AgaONR5LHiecB
         6CkBhibI/Y4KAtlJ/vG+vCuy70tPZmu/qXkEIABl3mYnL249q/XQzs9Pai7NTtfuEUl+
         ngRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO8iO3/+pt/8V5097+7cqc8J4fNsWe0xv3Zj5LDM8dIzoK2r8pVR2twv8u0s5Dzw/LidFSkZc0MsuXGg==@linaro.org
X-Gm-Message-State: AOJu0Yxryiyi5+Y5mx7R8Yc4eyh6DpsJVOa5ghZHeuVY8QQ7bBtiwTyo
	NLzDmnyG4E6zClA7z1Ueoq6KbBspICUatDA1T6urkRWiaKMxwPwgyevAA+YDZFmZvw==
X-Google-Smtp-Source: AGHT+IHQmwwOBmli4W+UYIBuLgmtdhnhoMM/mefW6Mu1WXJhmB0TUFR0xhKaZNkIkcZOjB8bVSAq8A==
X-Received: by 2002:a05:6808:309a:b0:3dd:3d77:2774 with SMTP id 5614622812f47-3e071b29035mr1047445b6e.43.1726126787067;
        Thu, 12 Sep 2024 00:39:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 08/48] migration: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:41 -0700
Message-Id: <20240912073921.453203-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Q/r9GbleZq4Q

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
2.39.2
