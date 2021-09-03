Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175642lfb;
        Fri, 3 Sep 2021 04:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWWTfgCpJKVn5N7h2dJglhKosint924/aj09wzxtBGq4cSKJkvS7BtC0FiSazr14RsvWYH
X-Received: by 2002:a50:fa93:: with SMTP id w19mr3482147edr.86.1630667382098;
        Fri, 03 Sep 2021 04:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667382; cv=none;
        d=google.com; s=arc-20160816;
        b=P7+we/tFRzoQsBNQk2tZgCT2M/Z7/lDD8CkXTUuCAZnQnkaQ9umsUvUvQkTPObYrlH
         z8l68LYJIag9P1V04zfrU23N7FTzI6XuOkAQTzEz6NDteRlXac6cac7N00EtqWRnFevH
         K2/wWdJbLXKWhkLmw2gb6w6B7Q2zwdhYlu03EvjkyEek/I/MVay3jlNi7LlBMIyoWA2G
         zc9FR5Gc8nU9Bm2+COf2U+2H4RmovVMTI27WesCSNDkZdobz1AtUI5mM5ZotcZDY78ye
         ZpOgiGJFPZsBrICSx4H29Z3zlzyliaiUdjgrxEt+VhdPBSxdWgXMnkrm9vAWRVt51Z7R
         wIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jqD7iyLbQ9DTFxBdziDoBhccB1nGTykeUMkgqm25WoQ=;
        b=k0Nrf/5+LrGcEMj3L/QEH/m9upvZ1/0d4WgMsU2UK4UG3oxIQDks1qyrDEcLDUiOkf
         qyqSIqG9T45Ahuj5EtHtBhYSIsmI0Cj+S/IHc4rmIlhQiWwRpvDDvB4/jg58Hh8rOL7Q
         BmhnK7bV9Xx9XZH7+u6pkIorAyeFAeci8SczeiNBRmDvIRJDxmH/gdeufK0BCFbPBkIo
         199+gFboQRmvb1dTsR6SJGNPT05b8XA+DKgJo0lTmMbYkCFeYHDjmH4KQJKSpwguohXf
         nQHFp6BQjlCndm1P/Kj5MQHebsYzILwlwNucghWO3uNkfEpuFIlEJ9QDwYTNiDmPHuvs
         HW4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vb21pMcH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id e18si4808462ejj.656.2021.09.03.04.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vb21pMcH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqD7iyLbQ9DTFxBdziDoBhccB1nGTykeUMkgqm25WoQ=;
	b=Vb21pMcHoSPZwry1LiOn0Orkon7uiqaGUrrT92zfiMsVyMjmiKQAK+VCxdvwF3XafNMOQF
	oMieNzoA+o1GMs8irZkEKd/oczv8G+JTM1qbRm77Re1MMFzhP4Y5BntTh2p9wCiW6h2/qD
	B6D+F5yISnyHOe47MEcxFOUYp4fJMEE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-d2p72zcmPe-YPniE6AEYBQ-1; Fri, 03 Sep 2021 07:09:39 -0400
X-MC-Unique: d2p72zcmPe-YPniE6AEYBQ-1
Received: by mail-wr1-f71.google.com with SMTP id d10-20020adffbca000000b00157bc86d94eso1459312wrs.20
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqD7iyLbQ9DTFxBdziDoBhccB1nGTykeUMkgqm25WoQ=;
        b=cLRNDcGEnhtkM1CjhfHtuXFNoyVEnC41gHGJlDZkRgia8nq7qvhvUlpa+m7nS8W5cL
         g71LaLu9h0mSWNITdSvz78dQYzd0ccOhEH2hwSQ+xIt7scKKasiNG5EMUs6CDnCFNBdL
         RwDhoYLq7U/IK4eMn5xop8YpsvYc4V9piRM8uktf3ZGcufBlZVG9DbNai3M17Y1jH0f2
         DYub2b7oAfPayF5gng8h1bCL/knT06z5dqW5+1rndW110cpE98v2xGAYvgbO2ISiMZnV
         EJYaiSyCqDNYipKOlwrhSkYxya80E7Bk9ReNbMYrKP4AFrjo7JNiXq/W58K8pVSbdLfe
         K5rw==
X-Gm-Message-State: AOAM533V+mnGlHBKFLmFVoaHt7HQcJkT1/kESf8ms2EzUkYBnF6JBylU
	UkWggGtazbYU1XztAaua2XJuzYnTl6O/D8/YlRee9sOLKUpk+ZPxRaw+dHs7x0tFuf1Ak598w94
	Ha4i8yMEvGZZ0LgxH
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr3531986wrr.382.1630667378602;
        Fri, 03 Sep 2021 04:09:38 -0700 (PDT)
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr3531951wrr.382.1630667378445;
        Fri, 03 Sep 2021 04:09:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id t23sm4712670wrb.71.2021.09.03.04.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 27/28] contrib: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:07:01 +0200
Message-Id: <20210903110702.588291-28-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: F33G1Z/5g7k9

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 contrib/plugins/lockstep.c |  2 +-
 contrib/rdmacm-mux/main.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 7fd35eb6692..119a8054b3f 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -130,7 +130,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         }
     }
     divergence_log = g_slist_prepend(divergence_log,
-                                     g_memdup(&divrec, sizeof(divrec)));
+                                     g_memdup2_qemu(&divrec, sizeof(divrec)));
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index 771ca01e03f..d447d50f538 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -227,8 +227,8 @@ static RdmaCmMuxErrCode add_fd_ifid_pair(int fd, __be64 gid_ifid)
                            RDMACM_MUX_ERR_CODE_EACCES;
     }
 
-    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
-                        sizeof(gid_ifid)), g_memdup(&fd, sizeof(fd)));
+    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup2_qemu(&gid_ifid,
+                        sizeof(gid_ifid)), g_memdup2_qemu(&fd, sizeof(fd)));
 
     pthread_rwlock_unlock(&server.lock);
 
@@ -250,7 +250,7 @@ static RdmaCmMuxErrCode delete_fd_ifid_pair(int fd, __be64 gid_ifid)
         return RDMACM_MUX_ERR_CODE_ENOTFOUND;
     }
 
-    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
+    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup2_qemu(&gid_ifid,
                         sizeof(gid_ifid)));
     pthread_rwlock_unlock(&server.lock);
 
@@ -267,8 +267,8 @@ static void hash_tbl_save_fd_comm_id_pair(int fd, uint32_t comm_id,
 
     pthread_rwlock_wrlock(&server.lock);
     g_hash_table_insert(server.umad_agent.commid2fd,
-                        g_memdup(&comm_id, sizeof(comm_id)),
-                        g_memdup(&fde, sizeof(fde)));
+                        g_memdup2_qemu(&comm_id, sizeof(comm_id)),
+                        g_memdup2_qemu(&fde, sizeof(fde)));
     pthread_rwlock_unlock(&server.lock);
 }
 
-- 
2.31.1
