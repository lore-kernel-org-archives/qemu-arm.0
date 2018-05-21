Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311248wme;
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrYE0oPCX4X8M7UYoNhi6CvGq+A2tdPQkyumNbcs0H6D7inN2mMr3G0E81wwFiMW+h+OXXR
X-Received: by 2002:a1c:ca:: with SMTP id 193-v6mr9954688wma.99.1526911451602;
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911451; cv=none;
        d=google.com; s=arc-20160816;
        b=vox/fm1QRtFe5E2uuIGBdQhZFTKaaOTu7jKZdpt30WhNrnVwZgBP2+OaXlj2GHZLtv
         sB7R7WwVDkjlWH/ryVUk5N+WkQmRh73GbsjRl/pEQ6XePRytolYpZvzgUxli4lCX+VsW
         d7nMhqr4KahK/vU0qI6ZVwNCUpXBhUWlLIP1NAPgHTbUk9JuDbyzCytUaXYOUq9zAAx3
         N2P4hTG/aKyhZTplbAxogGo3Ep8k4j5uvV6Ac8aqTQ2bA0bwGx+v4wSXKPbaa5L/rSr0
         Bs8DpxLds6PwQI0NWXMPI0Lz7KC1xLkE9qg2YXlwgZq93lBSCFb+9E2hoAFHOV6Q1lAc
         nJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=0L6Fbo1swe1LD4/SuEn0gigFtbAbicj9ZF0NCJPQvRw=;
        b=je/DJdAT6cvhW9tfkbqwne7/mg/aOSm/lX39OdgdLfKCbIyu1SYbfXfE1V5S/RwR1C
         SPmiFmCRzMQgOKF9Vt9wfM7NvHw+juWHl+DTt5cAkOcpVXBzLBHojrrWEPYvhMFiXvg7
         FDueDC9JDSfyyWAXcvme/f7S252Jp4MNicRong7nvWcg5NHeNIMT2FOTDfNDrFpFb+Fv
         58sqfLf56BME9BxOubOtYYZF+XmYK0lMBO4Oqka6XiWuITqjpr4XIdWOl5CidlApGCHR
         G21MPDb+Akee1nkjy0gev2UdTXHZH/K+faXPE3Ca5JJyBK10TTF5pt6mHFmImyYlVBS6
         JMgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id a5-v6si3350092wrh.348.2018.05.21.07.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ3-0007hJ-40; Mon, 21 May 2018 15:04:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 11/27] Make address_space_get_iotlb_entry() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:46 +0100
Message-Id: <20180521140402.23318-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: GREzcqEhJCFg

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to address_space_get_iotlb_entry().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 2 +-
 exec.c                | 2 +-
 hw/virtio/vhost.c     | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 3980ab47ed..309fdfb89b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1896,7 +1896,7 @@ void address_space_cache_destroy(MemoryRegionCache *cache);
  * entry. Should be called from an RCU critical section.
  */
 IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
-                                            bool is_write);
+                                            bool is_write, MemTxAttrs attrs);
 
 /* address_space_translate: translate an address range into an address space
  * into a MemoryRegion and an address range into that section.  Should be
diff --git a/exec.c b/exec.c
index b818ba87f4..84f2c21ecb 100644
--- a/exec.c
+++ b/exec.c
@@ -582,7 +582,7 @@ static MemoryRegionSection flatview_do_translate(FlatView *fv,
 
 /* Called from RCU critical section */
 IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
-                                            bool is_write)
+                                            bool is_write, MemTxAttrs attrs)
 {
     MemoryRegionSection section;
     hwaddr xlat, page_mask;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 9d5850a7d7..48f4fd7cc9 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -895,7 +895,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write)
     rcu_read_lock();
 
     iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
-                                          iova, write);
+                                          iova, write,
+                                          MEMTXATTRS_UNSPECIFIED);
     if (iotlb.target_as != NULL) {
         ret = vhost_memory_region_lookup(dev, iotlb.translated_addr,
                                          &uaddr, &len);
-- 
2.17.0
