Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516613lfb;
        Fri, 3 Sep 2021 10:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaP9Qw4dz3U4mXb4x4Dc/EEPaD3LIwVwTFM+8bpi7/9p3an/I3elS9dNX4jqfSE3xlEKJq
X-Received: by 2002:a17:907:384:: with SMTP id ss4mr53049ejb.478.1630691259491;
        Fri, 03 Sep 2021 10:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691259; cv=none;
        d=google.com; s=arc-20160816;
        b=zepeHiu1GL/3g3XTuCBqfYHGIZCXSTcVNWTAWoMj4LoWGPRbNNob/rWOV7AcII877l
         oJPBjlsgMzbpJ9amxHwRSS2sHoEPBIpv5pRBGIdxwxHlm7GzUgHCpb9CMdnHWAfBxsWv
         +mAL2b09AhOxbJMMjIzL7PFMJA3OaKl2PyYRLR7S0IaxuqF3wrW5z7ysnil9W5Zg88zZ
         KsgjnUay0tBRIzP5kJgt9qMThizPeSRE5U2OyMMhQks+sEuRJ1OeuKO4EWbgO7ZoRkLD
         TOj4IAs+M701iAeZcQfX1O3e9c/zUAzERhSy3iBmO/h71IwCK1zjFuzZ7BlX9Dxy4JbH
         dKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=75WD5cgGLGf6CXabmurrx2v8dkC4eCS9lx1cW5KQ36E=;
        b=l/H5OmCMtjNqYTmPlzJssh1sh9I2QX744vn+QAH+e8iDGTXugb/reglrcWmbvawI42
         Axu1F9IoHM84JvQwiSWEBgssfP3xQrM5brAmFtXpdLBSQAR8Xo1aWawgq1Y3sVmh7wuo
         2NqDtANAVaYMsXYomfYJdcVAzS8fg9xQWtO+znphN51qljpy+6tnRGUU9DGqrgT0T6pz
         +UpHsYpBHouFDoaWh77HyvntqR79RXPXI7r8OPUUtSFES+JlHbL7CDLvLycxi4YH7Djw
         bBU38VAE/a7QzOq+ZYveTwrYO2KXoUSAGVauV6fi/KJYiwL1V4k8S7MAP4kczq4YjL1U
         xmew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zl2wSn9j;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m8si6530496ejl.556.2021.09.03.10.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zl2wSn9j;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75WD5cgGLGf6CXabmurrx2v8dkC4eCS9lx1cW5KQ36E=;
	b=Zl2wSn9j8mQSBAMT9yBLefxSJffSvnCxk2sRd1+Wk1nu8Gf/1gpK/GMjXukClzVwGqMbDX
	H5vHnu2r8gI9m1XncczNlodzag7Ld7sVW/BlhuxSYYbcuIjRfhzsJuxuRVzj9drkX5xHF9
	ZjaSADaqMkl/ihKrRUlgZryC15rNXC4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-hln97WgNMnm4j1v_6H8AIw-1; Fri, 03 Sep 2021 13:47:37 -0400
X-MC-Unique: hln97WgNMnm4j1v_6H8AIw-1
Received: by mail-wr1-f72.google.com with SMTP id j1-20020adff541000000b001593715d384so1823091wrp.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=75WD5cgGLGf6CXabmurrx2v8dkC4eCS9lx1cW5KQ36E=;
        b=Sgt5Y6WDCpp0hdaC3R5+grz4v0opnyEmYqOe88zH1vGEh0DCoh7Om48bjnGk9XemIT
         XDRpGbcKp0+cgefbdWPiajorODCjIeBn106d52wIYkWczDzTddcySA94Nrw5NuLUVz46
         WrE0IFbmMvIrHG6UIF3IQ6CFxDtBBZENfY9OZ/jD9WlF1YLTPgneru4I6MdSysAgUUBz
         EW8yKTgSBsSJjM/mxaYGJJtafaxNK3rNlKGhcCweOtVFCsgfI+eEcbRtQir86kjxhMNT
         BSKULwgXoJ13Q9HpX5CAcJnB4jz6bcl9rfpj7HThgFc4PYrl8Px89TRb3m0WjKzW+w8u
         aQaQ==
X-Gm-Message-State: AOAM533yXMlic9WnddTWj7LyZ1lgUbQF7VTYD0T9ZAXDo/qnaI7iOhL8
	kNy/kkucTSZFhy1ntwd9nEznOy9mWIQg+Q/QWBRR7ri0tXxPBupPzO7dxLN1IVGof1bZhMyQvb/
	0/5Zr4pHtvb6Oy62C
X-Received: by 2002:adf:dd11:: with SMTP id a17mr300002wrm.132.1630691255953;
        Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
X-Received: by 2002:adf:dd11:: with SMTP id a17mr299969wrm.132.1630691255750;
        Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id l124sm85542wml.8.2021.09.03.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
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
Subject: [PATCH v3 27/28] contrib: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:09 +0200
Message-Id: <20210903174510.751630-28-philmd@redhat.com>
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
X-TUID: QKjpJ9F09pha

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
 contrib/plugins/lockstep.c |  2 +-
 contrib/rdmacm-mux/main.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 7fd35eb6692..1c6a9f7a044 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -130,7 +130,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         }
     }
     divergence_log = g_slist_prepend(divergence_log,
-                                     g_memdup(&divrec, sizeof(divrec)));
+                                     g_memdup2(&divrec, sizeof(divrec)));
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index 771ca01e03f..0899dca2885 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -227,8 +227,8 @@ static RdmaCmMuxErrCode add_fd_ifid_pair(int fd, __be64 gid_ifid)
                            RDMACM_MUX_ERR_CODE_EACCES;
     }
 
-    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
-                        sizeof(gid_ifid)), g_memdup(&fd, sizeof(fd)));
+    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup2(&gid_ifid,
+                        sizeof(gid_ifid)), g_memdup2(&fd, sizeof(fd)));
 
     pthread_rwlock_unlock(&server.lock);
 
@@ -250,7 +250,7 @@ static RdmaCmMuxErrCode delete_fd_ifid_pair(int fd, __be64 gid_ifid)
         return RDMACM_MUX_ERR_CODE_ENOTFOUND;
     }
 
-    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
+    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup2(&gid_ifid,
                         sizeof(gid_ifid)));
     pthread_rwlock_unlock(&server.lock);
 
@@ -267,8 +267,8 @@ static void hash_tbl_save_fd_comm_id_pair(int fd, uint32_t comm_id,
 
     pthread_rwlock_wrlock(&server.lock);
     g_hash_table_insert(server.umad_agent.commid2fd,
-                        g_memdup(&comm_id, sizeof(comm_id)),
-                        g_memdup(&fde, sizeof(fde)));
+                        g_memdup2(&comm_id, sizeof(comm_id)),
+                        g_memdup2(&fde, sizeof(fde)));
     pthread_rwlock_unlock(&server.lock);
 }
 
-- 
2.31.1
