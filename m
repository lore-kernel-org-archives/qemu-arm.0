Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173529lfb;
        Fri, 3 Sep 2021 04:07:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1x2qM5x+aVEwPnc9Ef0KTM6ftX3ZL/DFM6l0UC/j7fhUmHMcAW4TxOyu3EIMo7A4FFUWo
X-Received: by 2002:a05:6402:270a:: with SMTP id y10mr3396487edd.252.1630667242204;
        Fri, 03 Sep 2021 04:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667242; cv=none;
        d=google.com; s=arc-20160816;
        b=vru5Jp2Fx7LIy5gXHslH85CGkIvDTrFknYGLOT3SSwjPKXdAmlD2DsVOWiQgiygMQx
         CweZM9aa78PgAJD43HSRGlV/uU64zoehniPExutZnbnDa2XwZdJCh1xJxiZwIaXDux0p
         0GUpcjut0O9wYMS3eYZ+GNAol8O00DQ6zdaYZV8RD6iy/130V2VlbPzpSofB5Xlv64sf
         r8u2AircK6sJBr9Y0BT3w4OFw0FUUWIVEZmk0ZsZaXh1y4CQh1JMGDQhRH0iy4pXQDYG
         KjeJl7UBJ0ueFt3kTnj4pKIOIHn74oRWydv5Uarh035SVCgqE3qSbiJ1Gy+6giyCR86m
         fXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5oIQyOxRLkXvAZeThJneQzsCWvWqxZQLcKV/EKIlWcU=;
        b=A3+XcDpU6zNGNSRpI688xSzoBaeddSNye2JFkpsy7BXYinfG2X5g2KS0buI4TzIwEq
         wTrNb270mAD+vR84fF8EQYkSYOCEuBOd7YtYcPfseTjUZh0Nms9SPy1re+N1mLHZISRM
         aF87BNxcPmY/O2J8361oMJ99VVe6FcA0y8BD6SQoOgkn0xT51BnV+li1nwkJc67At2v+
         Fl+tpbxtaS2l64mFEXrwny4XZTeNBYSDtBIHHYrqW14X4LMItx6k1fQbaqcR1utr70FY
         GktZYvPhme+vbHsNB7vAZ6ObA5FA72Muvm+TkZ2FUJ0gYcpjo3DMo8Bb96LQlwhgr7B1
         SqSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZT7AvZ85;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id d22si5031190edx.58.2021.09.03.04.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZT7AvZ85;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5oIQyOxRLkXvAZeThJneQzsCWvWqxZQLcKV/EKIlWcU=;
	b=ZT7AvZ85hukwcigaE3Q4IpaYpEhZjSZdEBBPU/17MWpw34tgSDuXP9/vzAqI3rhpN51DZe
	WDxI01qu9Hblyr3z+5T/Gl7wJCYpVCy43IGUe1uZM/66JTKyLDVY6ZWs+TLpTP7Yq8q4UF
	4HMUWDiiodE/JJBRbaPJ2ihWHj9Bnok=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-2zSXvBIgM7iHAv3o_ia0IQ-1; Fri, 03 Sep 2021 07:07:18 -0400
X-MC-Unique: 2zSXvBIgM7iHAv3o_ia0IQ-1
Received: by mail-wm1-f70.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so2517542wml.5
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5oIQyOxRLkXvAZeThJneQzsCWvWqxZQLcKV/EKIlWcU=;
        b=AIaDmF8FU07+sxqWnfqkDgwvA/CkoaxuMV5hKIQzcVpdmnYK4UHjzpac+YzcvZIESe
         xInY77j6sDh1PEq8+N3cDufCPtehAZzBHQI7b3dVkssbzFt6WEEKNKHSGPBdT1/MP6kf
         5f/d0JRyDaZNjmBES7yWILpoFqYqjwW49pFjM1YHkIkClby9OCKKEBWxcQbHDqeDUyj5
         aCQLqrf4rpyfGyq4i1ZS+P7N5BdibZAUiXcmP0SC+j4pnHK0FcuIKv4s9j1MuAwDUkYD
         ujpwLiP1IAIMVkj5lCvW/3rHJXIQLZ2bArB8uLaVlYqNuuOp0S554CW6fVD59yJztDob
         Ls7A==
X-Gm-Message-State: AOAM531qxeOWmUoAMtka4mrHk42jj4YBcXWERz0BGVQmIKlCDFXkNs3L
	blUn2GbTypWeBM4TL1SG5meNqyHP+FktNLxSnOzEMw7ZITfMEnHJEcRoZf41xmVuGEQIdcmulVT
	RRbUocZIMQuCGIcSR
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr2702641wmj.109.1630667237587;
        Fri, 03 Sep 2021 04:07:17 -0700 (PDT)
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr2702602wmj.109.1630667237397;
        Fri, 03 Sep 2021 04:07:17 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id t23sm4706476wrb.71.2021.09.03.04.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:17 -0700 (PDT)
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
Subject: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri,  3 Sep 2021 13:06:36 +0200
Message-Id: <20210903110702.588291-3-philmd@redhat.com>
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
X-TUID: ezoGMKyup1o0

When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
(Fedora 34 provides GLib 2.68.1) we get:

  hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
  ...

g_memdup() has been updated by g_memdup2() to fix eventual security
issues (size argument is 32-bit and could be truncated / wrapping).
GLib recommends to copy their static inline version of g_memdup2():
https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

Our glib-compat.h provides a comment explaining how to deal with
these deprecated declarations (see commit e71e8cc0355
"glib: enforce the minimum required version and warn about old APIs").

Following this comment suggestion, implement the g_memdup2_qemu()
wrapper to g_memdup2(), and use the safer equivalent inlined when
we are using pre-2.68 GLib.

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/glib-compat.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 9e95c888f54..6577d9ab393 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -68,6 +68,42 @@
  * without generating warnings.
  */
 
+/*
+ * g_memdup2_qemu:
+ * @mem: (nullable): the memory to copy.
+ * @byte_size: the number of bytes to copy.
+ *
+ * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
+ * from @mem. If @mem is %NULL it returns %NULL.
+ *
+ * This replaces g_memdup(), which was prone to integer overflows when
+ * converting the argument from a #gsize to a #guint.
+ *
+ * This static inline version is a backport of the new public API from
+ * GLib 2.68, kept internal to GLib for backport to older stable releases.
+ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
+ *
+ * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
+ *          or %NULL if @mem is %NULL.
+ */
+static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
+{
+#if GLIB_CHECK_VERSION(2, 68, 0)
+    return g_memdup2(mem, byte_size);
+#else
+    gpointer new_mem;
+
+    if (mem && byte_size != 0) {
+        new_mem = g_malloc(byte_size);
+        memcpy(new_mem, mem, byte_size);
+    } else {
+        new_mem = NULL;
+    }
+
+    return new_mem;
+#endif
+}
+
 #if defined(G_OS_UNIX)
 /*
  * Note: The fallback implementation is not MT-safe, and it returns a copy of
-- 
2.31.1
