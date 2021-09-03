Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515029lfb;
        Fri, 3 Sep 2021 10:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylpNV+3cGBS7D5aJbrr/io6/T2EXoYSKw72KYAvrA3L9r6KEQyxqN6r1qPJWi21WHIRRl+
X-Received: by 2002:a17:906:6cc:: with SMTP id v12mr20021ejb.153.1630691128644;
        Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691128; cv=none;
        d=google.com; s=arc-20160816;
        b=omTnFyhP7pff75FAF7c2hGQeFdCR8wQPHpCj7JkZ6WhJ22EtXH7ymZ3o0ZFC7OZp30
         a3Y5HCwFOdZrKGdcdlrwcDsNJ41/tDFBt64/mIj1MHcjDhDsU24weEdCMENiSz7uDP8E
         SJcTyBlvpYQTbERUL9LXm7rjx8K6aM3NgQYt1U4CC+lejKo5e8dvVGO60Clv2qHEYT2e
         vdPIPKMFcW5pThUb1K7S4RkyxAd6r4vwmf5vxZGkgjWD/BWSahiZ1gDPnU4utZxsdDKm
         dHaOklrtzCnsDsIwd1vKIxRW9vZ5rbxw05ObFQDHKGdf8spqllH8hd0ya6Qn78LLU31u
         SQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z+3KRRg2uaRwQMu7zo1tfHiyUXSW+kC4va1y4Yzkd4M=;
        b=eK55CEzUwltb6Z9F4LQGGImAcgoMU2FsB+te3/vIZ0j+gqLCwLrOpZGcGE95ou5XQe
         8pioB8wbIMppy42e6KwXXajWOQeK0wex4Y5jZTClZixLzeROGMPH9oPinVD/xqYtlJNK
         G3/aQ0T2PXhCWq+uoJqVHCCvr7ooYG2o3+pRgLyXO4qk8yIKZ+u92U6DyfVlZcHEpPR1
         BVNpCDXtKT7C+8gRR0VtZ8RI6NqEVPRzlE1Cxv75DpS5wpF+Dt534JBOtdxxBlKQBk2l
         H2lhCk6ZQbn0G3NMszSJl49UuEwdc8DwYDoWSkobo20W8mOZOwX+bt1eZEyypGJnjZzW
         Atew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bI8wawA9;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s4si6267387ejm.735.2021.09.03.10.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bI8wawA9;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+3KRRg2uaRwQMu7zo1tfHiyUXSW+kC4va1y4Yzkd4M=;
	b=bI8wawA9NEXWftj7CD6GH7gznT3d1ULAvmnojJqdQNy5chrHmG3/JsGPnYE3K5AGd91kXC
	dNx4xHfCnkhFZHS2PKr3qyTemlN7bzL7uL3cax895A0ORNqKGR0AsPnCweGVlq8L5rToP1
	M3ojWsKw+r4YTIvlVWtMmQffxglCaRo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-ZNbG34prOBaWeVRF0czgLA-1; Fri, 03 Sep 2021 13:45:24 -0400
X-MC-Unique: ZNbG34prOBaWeVRF0czgLA-1
Received: by mail-wr1-f71.google.com with SMTP id h15-20020adff18f000000b001574654fbc2so1817210wro.10
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z+3KRRg2uaRwQMu7zo1tfHiyUXSW+kC4va1y4Yzkd4M=;
        b=ky1VgiTlAcTySJ/GRErWzVCk+hSCOs+H7txUi3K6YEDjqZ9nnbYKpoYFaAvWfCE+by
         Vf9GajZFaptWmVEkpm18IEkh3uwvN6U9hl7JyPCP1T2lYG8ttKaTah1sS5McYmYr1Jwq
         IpCh+zTDO9A3VatJVLP1hnV0+xFLoSZXEvvQgN3IielC+A4uL4pxliv5kJdLB+g4bTxU
         TXu+xbYWzKILwB65f0/CI5whcvK7Og6IlT428NB1VNeg3vKU5+XYNR0kel6utEFFnbV6
         RNaUFJVSz2CCJlZh5wM+0hPv9EmrmMl+fqlNYxRGdRZsXW3UvPKrzoP3HgYDzarzf8dx
         266w==
X-Gm-Message-State: AOAM532/d8UzJebx/5vmZpbyS/cYOyNM1WJ3/8m7lhg26KBeRvOZGQ/d
	lPciFpV42OuuRIRp2LMlOFQBsiIKevw1yn9XiklThxa8R6GvqddG75PSOEYQlVYyN/jpUEZ9vQe
	ZIVLPMtnqlQQaNzja
X-Received: by 2002:a05:6000:1248:: with SMTP id j8mr259702wrx.97.1630691123466;
        Fri, 03 Sep 2021 10:45:23 -0700 (PDT)
X-Received: by 2002:a05:6000:1248:: with SMTP id j8mr259679wrx.97.1630691123294;
        Fri, 03 Sep 2021 10:45:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id p5sm5783883wrd.25.2021.09.03.10.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:22 -0700 (PDT)
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
Subject: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri,  3 Sep 2021 19:44:44 +0200
Message-Id: <20210903174510.751630-3-philmd@redhat.com>
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
X-TUID: BYvHzkG/0MMq

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
 include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 9e95c888f54..8d01a8c01fb 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -68,6 +68,43 @@
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
+#define g_memdup2(m, s) g_memdup2_qemu(m, s)
+
 #if defined(G_OS_UNIX)
 /*
  * Note: The fallback implementation is not MT-safe, and it returns a copy of
-- 
2.31.1
