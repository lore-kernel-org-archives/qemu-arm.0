Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174846lfb;
        Fri, 3 Sep 2021 04:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs0859eP+aIfl37S6loEgcHg8h/seK3MZyEMA7CkRGmArbMKQfbKgsHcmmns4GsCr5RNod
X-Received: by 2002:a17:906:b0c8:: with SMTP id bk8mr3592880ejb.412.1630667330820;
        Fri, 03 Sep 2021 04:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667330; cv=none;
        d=google.com; s=arc-20160816;
        b=ubekYjr0/nN1OZNbDxaEajeWsSatpaLSRZI+2l8nHcg3L+AHezt7YAf/HVfBlcpOez
         H5EUviRCkMcdvEA4HF0jy+Pttan4EP/WcdFAQ/fxND9A4Ih+SXJ7gHTfwmAhf6KVMia6
         DOfsniWFNjyMoDiE3/0foT7RBHNL64QjREQrZbpRE1A5TZVS1Q1W+kMyoHiYef7rYeVn
         7HXqSOZZE7eVjpkuVPdNqedh8IEnrzNq3BbUx4U/046MZ5IQ6GaN7LjaPaCZjtPRjwCB
         lauD1dE8/Za1qJT/fAj3lZhV47zg72CVlFO/oUpk9mjP8irHbu0kaWIDMpM3W4hHWJj6
         3uXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VOTtLJVTxmWiXFyWxgdLM6727jqRmtc6Bq8YlLBzcWE=;
        b=bueRNM5WPGvLdqf/TOXfSKpZPUaP+5WnGf5EKcbM6n6fCybxLBEu6C3ls2u9DBOvav
         ZBkhppZh4CWvmRXqGjdrJJIbodeBas04V4eSjwG5bYCCnL1m99y5cb4VmA7XireNxnIk
         t3IGSIX6mNnE7lJEqWBGxCZhS3YpxrFabCo8czukfwVedDmG9Tg4KOLqKjUCvuTbag0C
         wEm0A7PJrVWLILMkCLlR0nmfUSbDb6wM7BpcpRpar2k+dY8h95aUAtnGa1WnaPE2cpTa
         AUY+6XnCFoQc16bqG+YG0fyUjjdTlD50nobSvku1+S6Zipi9I3Ea76K66tNwkqojlWlw
         RugA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ai1HjDZS;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p15si6681911edj.97.2021.09.03.04.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ai1HjDZS;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOTtLJVTxmWiXFyWxgdLM6727jqRmtc6Bq8YlLBzcWE=;
	b=Ai1HjDZSO41N6Vf6xkkVPe5KxlW3SP6GwClFImmLtXL2iXNRuhUvs9Dorjak+OD6ZrWeGh
	sYFuDWGwwGBjwtKIRSjBQ/6IpUytnDuwy0VcRnXHdJv+f8BD2/St1JjX4dZ8IZx9Mg0D10
	PH7xhiPRxZP5IZuiuQaY427yRHPbJ3E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-APwGShWKNdOlsstZ3h44Mw-1; Fri, 03 Sep 2021 07:08:48 -0400
X-MC-Unique: APwGShWKNdOlsstZ3h44Mw-1
Received: by mail-wr1-f72.google.com with SMTP id n18-20020adfe792000000b00156ae576abdso1446478wrm.9
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOTtLJVTxmWiXFyWxgdLM6727jqRmtc6Bq8YlLBzcWE=;
        b=emFyTg0FErUFty0LJWWZ9jMQ5lE2Cn/INLxLzg7bl2qxXZpZ/2dzXKLwfPi8PawI1Q
         rKn9fAZh27kqCJS9EjJkp2Y9y9UbxH+KepsbqRIyXOFpTOCTvZJv0g01Xn6CZIMbWUtQ
         dMoT4uuvakLI0edCnfAWbTXGWT3PZG56NSil8caQvRxXnavdxYzRZZYqKrlHlxO30Ues
         Jz/meFdZdpQyV19Ypz86my0sF69sJxjNf2EX1MS6ihc7/KO+UK9V9cTdpGNfUuzGSEUY
         kisurH53vur7L6ppIOkwBS7xSs7RgdVhSYi2jNk8Uk9aSt5DWBThjQEkN0Khu2elNxK0
         9xig==
X-Gm-Message-State: AOAM530PhyLef2SjBd0dJLsjYhWEP8pM3LPZme6wvUg+JHdy2vGyXk2k
	Cm7TWMhlNZyBmvag9jnm5SgkRoJyqF4zmGmnvB9CCFShXhKLBCG+LF3/jMj5TV80LACXE8k+N38
	vbAyRJ5FbIxWJsLgD
X-Received: by 2002:adf:c14c:: with SMTP id w12mr3481199wre.115.1630667327544;
        Fri, 03 Sep 2021 04:08:47 -0700 (PDT)
X-Received: by 2002:adf:c14c:: with SMTP id w12mr3481173wre.115.1630667327398;
        Fri, 03 Sep 2021 04:08:47 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id g1sm5692199wrb.27.2021.09.03.04.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:47 -0700 (PDT)
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
Subject: [PATCH 18/28] hw/vfio/pci: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:52 +0200
Message-Id: <20210903110702.588291-19-philmd@redhat.com>
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
X-TUID: 4TeOCg3vRBXX

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
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e1ea1d8a23b..5c9acfd9c40 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2040,7 +2040,7 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
      * physical device, we cache the config space to avoid overwriting
      * the original config space when we parse the extended capabilities.
      */
-    config = g_memdup(pdev->config, vdev->config_size);
+    config = g_memdup2_qemu(pdev->config, vdev->config_size);
 
     /*
      * Extended capabilities are chained with each pointing to the next, so we
-- 
2.31.1
