Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515392lfb;
        Fri, 3 Sep 2021 10:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCD+6XotQIGl/UMvas/eZmGkq97rftoGRW5Qg9wqT/DxJz0O6Po2vi2KPznBUn75wDgPFs
X-Received: by 2002:a17:906:c317:: with SMTP id s23mr26316ejz.83.1630691154948;
        Fri, 03 Sep 2021 10:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691154; cv=none;
        d=google.com; s=arc-20160816;
        b=ElQK3aaHDGJhr1ZZ0ltuK2nV+PbAOjsgpWwGALtnkO+mj+HOFmgnX767lXr1YJJ7yt
         v2t/73FrMYaYIgzTwSuey8cxVy/7s+1Ddv5+dV6Zi4yV4B20SqBJeO248IE/8l8VHMdE
         x0RUr3xmghz2Rez2trAELGT9s0UaZXkg2YEmc1MtL51vCvUy1lbqTRrCq6bXbEl+pVSw
         Q9dQyTAURabOQgVDnhah8TgEPDmAtLuxCsBxXc19OdnEY1nvJ/bGFRtrBlrSJX/GqORb
         DbNjrF3Fb3dKMbeYItHEcn+gB8vxtw3oEOMsWGdE5uxKYquAbznIXvhuXhg5lQNrU9aQ
         2/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YNHli5WAUQfrv0OkZqAsB5uiM9Te0pWSHkWdm+hWGxw=;
        b=N3/x/dgsrSUbMl4SkR/T+c4QzQgqTAAQJspZRdtibG4FDlIuZCizkwdInGV/0H8mU5
         gdJUUdSgDaqR74OtA0iBRkCB2RzNMN5Wgh6v56l36W9X6RcQgQQHQfSlDORXR7qWL0OK
         At14bDrUazHZETD5SlHJ08yKMna9oocGoxrV6kW+E/TlNDh9qeS7M/jig3D1ve+TwWhF
         xilNdYDGuB6D1qfYxBF+0NRvUp2f5q6OcsW0RYxD6X7kOq2s24I1nREDq/IGe+BCf55y
         5GMzweDiN+bbOse0VzlLguL+IliUqgOQkBtRF7ZKE6+MrC3siDCGPmAluhzL9MUjr2YC
         5izQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PHUgliHt;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id yd7si5998155ejb.177.2021.09.03.10.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PHUgliHt;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNHli5WAUQfrv0OkZqAsB5uiM9Te0pWSHkWdm+hWGxw=;
	b=PHUgliHtyk3cG20NkTxNvZ8jn1St0ZEXp+qumwEb+xH6QCZI4d2q0m8N7QgSGRtVEwsXm2
	/Z1bilGtxTZkrpe/yXI8uu+SyvQ9zRIH/bCHsSdYpfYhy+XwLPSXgF63tQkY9Xpny3Q/FA
	vybdMBDfQR2ah/xFhMcNsan7wt5XUQc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-emQqSefBMZC2SeTURt34dA-1; Fri, 03 Sep 2021 13:45:50 -0400
X-MC-Unique: emQqSefBMZC2SeTURt34dA-1
Received: by mail-wm1-f72.google.com with SMTP id a201-20020a1c7fd2000000b002e748bf0544so58848wmd.2
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNHli5WAUQfrv0OkZqAsB5uiM9Te0pWSHkWdm+hWGxw=;
        b=IwgVsOivDgi3aSTKEOltR8RieVrqvb3EgLnDZzpvLsFjUhDBrNJeaI6ndlKrVOZ/AB
         b3xIGHQ/qqrkQ6L4mFPJCmjWX6K3DwHtKQT3MMuqVDC57TdnvvwOrR0YcHx5WpE6VQoX
         v60gX8g50XHvFZFtMVXVd+W5d/1ovv0/0kYRfOM5R5b33zB/nYP+iqpoWWP3ST0PAkch
         tw1U1InXjFrS8GTsNi2H4aGA/Xq4UCVB9Lnkgtv64k7UZheFI/tG4UU0nPJ6E/OhI7NF
         GOGkLQyMglxUGXB3FXQCMC6+WKzzlXpBOiyQL1yHbi9zXOsnwIy875xuua9iu/zta0Tb
         KnvQ==
X-Gm-Message-State: AOAM53200S1hC4IgZmKvDvIVaqh2t8xbqTjhb99FvK7G58o0noZy2I2u
	GphJla6LRsditQFL43oJKoqmFpuhA8tZMcThY1BPDp1JPy6pqHLUM0ohQ+z5OzWSgEtkoZG00Rv
	kphMbv7lgkhQ2MCjy
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr4832wmj.181.1630691149556;
        Fri, 03 Sep 2021 10:45:49 -0700 (PDT)
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr4807wmj.181.1630691149340;
        Fri, 03 Sep 2021 10:45:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id w9sm32748wmc.19.2021.09.03.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:48 -0700 (PDT)
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
Subject: [PATCH v3 07/28] hw/9pfs: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:49 +0200
Message-Id: <20210903174510.751630-8-philmd@redhat.com>
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
X-TUID: FtIex5A27eSe

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
 hw/9pfs/9p-synth.c | 2 +-
 hw/9pfs/9p.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b38088e0664..d6168c653d2 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -497,7 +497,7 @@ static int synth_name_to_path(FsContext *ctx, V9fsPath *dir_path,
 out:
     /* Copy the node pointer to fid */
     g_free(target->data);
-    target->data = g_memdup(&node, sizeof(void *));
+    target->data = g_memdup2(&node, sizeof(void *));
     target->size = sizeof(void *);
     return 0;
 }
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index c857b313213..a80166fcaff 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -202,7 +202,7 @@ void v9fs_path_copy(V9fsPath *dst, const V9fsPath *src)
 {
     v9fs_path_free(dst);
     dst->size = src->size;
-    dst->data = g_memdup(src->data, src->size);
+    dst->data = g_memdup2(src->data, src->size);
 }
 
 int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,
-- 
2.31.1
