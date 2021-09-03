Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1511625lfb;
        Fri, 3 Sep 2021 10:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5c+42B53s+WtVhua3dUqk3wPhbNP3URRoeHMvt6wvcNm1AlTpsGoHwGHR4H/0U8DSOZ0K
X-Received: by 2002:a05:6402:d6b:: with SMTP id ec43mr127736edb.107.1630690826159;
        Fri, 03 Sep 2021 10:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630690826; cv=none;
        d=google.com; s=arc-20160816;
        b=eXINODL0XDA0HsR+XNfz0x/71t70z8DGzWoWzN3kRKQCzrVePFTW+YWPJcPAkpl2MV
         2Ju765bcFRIbKFXLZepK0xuR1vRz79MTj6WxdshSAGs2797Y7trO+SqIMpgSzkAVGGhq
         usDG5WZ1E4a5ZAck600CxS85v+IOb0K4yZ2tNe5u9NwH1l72pTavmzh0xTk3CPUm8Mx8
         R71xBeW1T8dvVK7hXecNS2Oj77BYlZv9mxfeLwFPMdlUUUBM8dmRD3RIjNd3F02K+uAL
         XPwzzpBNtd71qz3H+owHfqGEf8WA8OJXDx90HFjbYzbyR6DRYQdCp5ZUvAHVV6Pnbvyz
         0LQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XaUg9euKBEDlRFT/nnz+Q21gALG1vnBlLHaDL6QJTcQ=;
        b=tBK/3dMqQoUiqvKaXc7cDNUs8oMDTI99npnHV/qYs0neGvpUvmEJycKHE4qjcT4GE/
         9vCX0dH9cZvSJlSVwn+2IRgWovMrUGZUypU0+RZAps45GDTvkWLbdZmj2Z2qvw7hQ/YP
         JzGwNXiMd5FDoWdb73X8CnIt8qTsXvE6oDq9Q1z2NQZjYvI5IKEDX4qplE2urbAmexT8
         h5gsL+3Yfm8anmyzu8J9qvzrb8/hoqhIYrjYEajpz6YkI2UkPYM8051uN8OrKY12fvjQ
         dm9c5Co/0QpPeFYNLfn5p4AduOwe18Z51r/W7VRVdLjZvdwwUqxqJRv9Bfm005OGE5In
         j+FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gq3R2ytB;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id nb38si6269973ejc.86.2021.09.03.10.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gq3R2ytB;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630690825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XaUg9euKBEDlRFT/nnz+Q21gALG1vnBlLHaDL6QJTcQ=;
	b=Gq3R2ytBV6PzZKC0shJq5MRfbV6SKgbhHZippGXeTtTJWciR0OyBtL8mEhom+wNQOoBmto
	PUisijrMwAk20hfAgntBAfT195OZDS0mx3Z9kaivBP3CZj49jOn4kBEWsZjFyU65shZqYE
	6DHkz4bWQGB0Yn5EdBQGh1fNvZtmT68=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-NsF5J5NeM9O-TIScBX1KMQ-1; Fri, 03 Sep 2021 13:40:22 -0400
X-MC-Unique: NsF5J5NeM9O-TIScBX1KMQ-1
Received: by mail-wr1-f72.google.com with SMTP id p10-20020adfce0a000000b001572d05c970so1813140wrn.21
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XaUg9euKBEDlRFT/nnz+Q21gALG1vnBlLHaDL6QJTcQ=;
        b=j8MRAmQ/RscoDGjVcOS+rBmhFY5LS3flR3PDLY5bUroQCtjknmfsWf5UcBcaTfVNpO
         4C1dnZXAwmgZg/BSZ9xzwIifU9g639SMihT41i0fLi/e5wHfT5Up0gp0ke4YCjpS5B3K
         fefHAhTFpZrWtFPiA9A/TzqgfgUOi5yKp5IqKyFGFeUw50wEQ1OXxO/NQLWnKxzWa+KX
         vq35GVclKTNM+YYoFa0N+kTYpVOYonXKxaAvwVNdIbSg0j/UIm1O3n00cvXfRuUbdsmz
         9jUHGjWfZx5zW+/Je+hPGQsQfkK27+qdAB5W5nGAzDMGeVMJ5qz4dP9ePuj4pJqpnSgg
         h1Xw==
X-Gm-Message-State: AOAM532MmVR5bTSrqATiUkPGX4lI4McC1gnK4cIjLAuMT5v3YSHBURo5
	CBKtWBR7VhTPgg6dQqY4wiyjk3R/o39wc1fY5kw0Zc+RrLCXtMrqNaH8T9d3a5XecMlruNLwWEK
	PfscwouCgkDd2Y0c0
X-Received: by 2002:a1c:7304:: with SMTP id d4mr1556609wmb.119.1630690820856;
        Fri, 03 Sep 2021 10:40:20 -0700 (PDT)
X-Received: by 2002:a1c:7304:: with SMTP id d4mr1556600wmb.119.1630690820684;
        Fri, 03 Sep 2021 10:40:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id s12sm5394375wru.41.2021.09.03.10.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:40:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 02/30] glib-compat: Introduce g_memdup2() wrapper
Date: Fri,  3 Sep 2021 19:39:40 +0200
Message-Id: <20210903174008.749126-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174008.749126-1-philmd@redhat.com>
References: <20210903174008.749126-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: b9PYv62AjPTW

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
index 9e95c888f54..915d0156da0 100644
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
+#define g_memdup2(a) g_memdup2_qemu(a)
+
 #if defined(G_OS_UNIX)
 /*
  * Note: The fallback implementation is not MT-safe, and it returns a copy of
-- 
2.31.1
