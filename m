Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515933lfb;
        Fri, 3 Sep 2021 10:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2OXwrCbyo5ZX/aT95gwVwxlmQ08C/hTLkWgEKZCJ+IDnixvsJJIwHBQHVfuftdqTSsM0Y
X-Received: by 2002:a17:906:ce24:: with SMTP id sd4mr12561ejb.329.1630691202467;
        Fri, 03 Sep 2021 10:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691202; cv=none;
        d=google.com; s=arc-20160816;
        b=0ARagqVpFxAaAGyGQU/GiZVQiGidNayvrZ0PYH0+ZLVSrx2aAhzuUdecl2o1Kglyc0
         o7LHp95cGYV8hpP0DVEuI7zmM8ItmyeanRWRXVFzHrtT2PMEhIa2/kKThtAUAhmBpo+T
         DHYD4kmzWzyGqvkk0NSj9OKcTrvKf5ucJqsjA1iBoKFD6QME3mffDOdu1wLuTVbEa4r8
         A0ZeAiCemLZZjmQ9WV/kZs+bNo3AwL7s8ePqt1qVe1m7sgYQlgr0QCwkC7TlYGFTO6AV
         ICgt1RCHY0xLxhz6Llv+LmkTWdRHgzE2zw+DnHczSzvBwUQglZj1QxOWHPel3bzCkAn1
         zfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bmgDp5DDf2ZYN3DOZIz+XL4zsyjy3fDEm1GYA+/wcf0=;
        b=QuOhWJJA3npn42QI/JdW/WszN2H9xdJWLtUY0jaqFTGN6FjYnEhQMJAeH4ahlKEsol
         PamKZ7zNPudzE83axtXDduAiFDXhdY4Z6U4rTssNwucREQL6EilKo0MLvbQUd4a2PkM9
         Zx8Smb3HLijudw3NG8+vfnsD5HQQQkK+QiDzTUM3FrsTWoQy8atEZ5qPB8gWE/mcefzo
         k8nOUXp4SThMBrnlL9hehOfZKTZVld+hK9ybW8Kf9ULB//JYcZJxNNp/3qRY7emGUC4C
         A3wrrf8XUXuq2Z2iNsVzc6Bfe2/baEbjahjF6tERUgB2l2PAuRIuH6HpMId5tOQcnLMM
         puNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f/2Wtxnz";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id l15si5792242ejg.444.2021.09.03.10.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="f/2Wtxnz";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmgDp5DDf2ZYN3DOZIz+XL4zsyjy3fDEm1GYA+/wcf0=;
	b=f/2WtxnzQxHPB9VgehUVrYWuBr+kCuZLQ+fEjFANEo97R1jE7zAnlvM71ViipoTjVDWnIh
	yW0syCTX6Nf2mkEI0tQEo9MS1FH9+hEI8ZWBd+D/KR8O1eNkBgynBMAhVed0Rs6KuMrmaN
	VmikQNzmS9frryu+77Lb82YQJ2V/m/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-z_e5noOAOWe-vPDW0txMew-1; Fri, 03 Sep 2021 13:46:40 -0400
X-MC-Unique: z_e5noOAOWe-vPDW0txMew-1
Received: by mail-wm1-f71.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso51423wmj.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bmgDp5DDf2ZYN3DOZIz+XL4zsyjy3fDEm1GYA+/wcf0=;
        b=mH8tDW2ggGSCt7ztnyTNBob1FaaHB8LeAk7Z9tXvxSfZPo9zJyQmvy6QghMOdOwbSi
         D48m0coqkT24WzUgsUoxnfEyFEayXeVzc6HnCSquRfSnG6e7TqeyT2wsUU/yQ6Bu4/Bd
         OEpdb+6T/S8ZJrBkmE8rXtC/aHzl9LzSX45F4abBtgljKEstWlZ0Vn1xaUI4dI5XsAFx
         JA9UgwXNdLFWVilnelsjpN2D4GogRsZNkuAmDB5eXtT9/0MPAEEN67oD90QeWAnPRGxa
         4AH9aGPFPQiZeYE+oEHshrYy539GKRCsTD9Ei695bif3p84zIkx1DH2jPc+VQSdWTcEi
         L+GA==
X-Gm-Message-State: AOAM531/sNQdC8nTC3QcadOoy39TmjkSHvOcGA3wU+wrIz90Y3UqQ/DQ
	RhNDsYX6JiYR7OTej6LM/1L5UaNfN0Go65WVuuq6SGnYm5Pj6a45pnZAWjVgzTrwPpYDB9MndVU
	TA328lWnPLEPd37rY
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr279740wrw.324.1630691199287;
        Fri, 03 Sep 2021 10:46:39 -0700 (PDT)
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr279735wrw.324.1630691199158;
        Fri, 03 Sep 2021 10:46:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id g138sm30217wmg.34.2021.09.03.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 16/28] hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:58 +0200
Message-Id: <20210903174510.751630-17-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B0BJhvxmlm8N

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/spapr_pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7430bd63142..8e36cffab79 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2201,10 +2201,9 @@ static int spapr_pci_post_load(void *opaque, int version_id)
     int i;
 
     for (i = 0; i < sphb->msi_devs_num; ++i) {
-        key = g_memdup(&sphb->msi_devs[i].key,
-                       sizeof(sphb->msi_devs[i].key));
-        value = g_memdup(&sphb->msi_devs[i].value,
-                         sizeof(sphb->msi_devs[i].value));
+        key = g_memdup2(&sphb->msi_devs[i].key, sizeof(sphb->msi_devs[i].key));
+        value = g_memdup2(&sphb->msi_devs[i].value,
+                          sizeof(sphb->msi_devs[i].value));
         g_hash_table_insert(sphb->msi, key, value);
     }
     g_free(sphb->msi_devs);
-- 
2.31.1
