Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516064lfb;
        Fri, 3 Sep 2021 10:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt9bNDp4eTPBKEDBc+UVLt6e8Bw+iqrY66Y8W24AGq4xDCRVnff6axa/Q2uUn55ID3DNJ0
X-Received: by 2002:a17:906:11cc:: with SMTP id o12mr16480eja.277.1630691213004;
        Fri, 03 Sep 2021 10:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691213; cv=none;
        d=google.com; s=arc-20160816;
        b=GREGxSYyfLIZzOIjjBVTeoiEMN8d0zF7QBlQNu1CI0kOX4pisVJQSjNJVFqkjoL3x1
         yjnRCukFCDEH4OLRurI+foqQt4BqlushU7rWH5l5yjoK83jcBFdEm6Iro+h4FF3oy1no
         B3l7dZg3ZaHUFzru7vBPxRqNh4ilnbA44Bi/jGnyW6m2slLHNjLixGldHX3P4ngqm6K7
         4HQeGtALGQPZVx7KGKVxsy2hXpJwZRmxnoI4yjl1HnBwEld4QzN1QbIzADKuUEmXsFq7
         D//Ew91hQFLP3p7MuB2WjGY07NP8iC0MGyNwGc5z/Oaljzf2/4KyETivoRcbLlx20z/3
         pmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rzFMsSs1nd+aiUV96h1dpanaGme0JuJTgHaVGdLrH2M=;
        b=HpnZhR8j+cX43s0ntYrvdPSu2RdlGdA+XeQSMCZY1WHgGEmUCxAnM28LoeRdWp4+rB
         vbEEI0VwZt8u2IH8KFt65xDQNBPrKXAu6SrQUhD4vTRcnPdBjGWexUyH9QzP5FULSmmE
         kJZmvSjPHFYeU2EdkBU3ivc+gC+8ZKfU+RQZO7TPadp2sFuN3pm4DXIW3taVFkVwOy3d
         vTUfxj3Ra2fbgbazNvMqI4lFXdDOlFD0ggKlAQKlYLyvOmeyY+afwtjKu+hb0BKNJDVc
         ldJZ+ucUc4UZcSw0vye9QUgV3R7r056bN5fQmLn6SLewH1VydgeWi26BQgsa9Ua0qULM
         FITg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EWaxzTNb;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id au25si7017226ejc.642.2021.09.03.10.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EWaxzTNb;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzFMsSs1nd+aiUV96h1dpanaGme0JuJTgHaVGdLrH2M=;
	b=EWaxzTNbATESbdFqP75y4riFOexBMt7MlUBiac+n5dFsJjzeVc75RSmM2u3slZ2DjDT4Fj
	KwARGyvxtSrFVHP1m29t99XpxGDdkRZeg7D5M1aTyPCk8b+I3SLjzuKizj5qXcg0o0Mc/9
	I0878V59DeSEDbyyHP/NrYoHyI57rLs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-niz8oK9fOdeR8nBvyvWDxw-1; Fri, 03 Sep 2021 13:46:50 -0400
X-MC-Unique: niz8oK9fOdeR8nBvyvWDxw-1
Received: by mail-wm1-f71.google.com with SMTP id m16-20020a7bca50000000b002ee5287d4bfso39192wml.7
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzFMsSs1nd+aiUV96h1dpanaGme0JuJTgHaVGdLrH2M=;
        b=X7UJjYHh8xhK06v+k75VUfPQPxP3Rcc1xdgmfouprUI32v4ayVZWKVAZBZg6aR5mId
         sjHm7kCla9dHgc9bJwm08Ldbe8Z7vuV9b3iyIkwpCSRQhKhaAf9HaSJcSktyHOGfJODx
         xDRow8AXPsd7/WHPHhwNZ3yeZBJyq0cjQNNtLeGMxpFQUWIS4SbUu72Krsoj2JKbYkzA
         Tm8I3CrPgNbB0MwP2zhO7PlHm25fN1e3YjZiyG7icWqUupicelRhzR+oGWwGzYzAMmae
         x+OPdBC4uQRO4C33DkK30Be4htCSMoD6hpHMDq3sDt7wvXvc/tHv81mYNFrRenpHKJcN
         V30Q==
X-Gm-Message-State: AOAM532+xzZcVqQAaLevQHnVQa90ObalbvRCBduymvn8yLOTszZQZOmc
	YPgdJDCGDr01mbRmeJ5aPAn010UxvaZHI5rk1YL64FdqTGwcJMhP/OO+RiJz4nii42bp3QwvxaG
	P76ALfSV3yaExrAK+
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr315720wrr.2.1630691209780;
        Fri, 03 Sep 2021 10:46:49 -0700 (PDT)
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr315703wrr.2.1630691209642;
        Fri, 03 Sep 2021 10:46:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id f20sm23207wml.38.2021.09.03.10.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:49 -0700 (PDT)
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
Subject: [PATCH v3 18/28] hw/vfio/pci: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:00 +0200
Message-Id: <20210903174510.751630-19-philmd@redhat.com>
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
X-TUID: gSib/m7Wi7fG

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
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23b..f7d0ef8cc61 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2040,7 +2040,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
      * physical device, we cache the config space to avoid overwriting
      * the original config space when we parse the extended capabilities.
      */
-    config = g_memdup(pdev->config, vdev->config_size);
+    config = g_memdup2(pdev->config, vdev->config_size);
 
     /*
      * Extended capabilities are chained with each pointing to the next, so we
-- 
2.31.1
