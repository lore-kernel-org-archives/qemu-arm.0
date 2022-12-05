Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378043ejx;
        Mon, 5 Dec 2022 01:53:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5xxCO2Gm1UENGHO1k+d7okVUhD1rz9eo7TBP+9A7wDkZQ/47AhFWhcZenJyi/TP08zQRCk
X-Received: by 2002:a05:620a:229b:b0:6fc:8f4e:5e5e with SMTP id o27-20020a05620a229b00b006fc8f4e5e5emr24534177qkh.480.1670234021060;
        Mon, 05 Dec 2022 01:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234021; cv=none;
        d=google.com; s=arc-20160816;
        b=04ksmsxFt8NsmnJJJwmBYK83Pf1Bb07OIjnYTR5kQQNchH242QHl2WM2bH3v3H6f5+
         AZC6K8IaPzvlKpFcZ6uVbVvYP1tivirHP8x2WO6LZtqiO7/JhCo8s+ObA4/kR7i10uNa
         G1GT/WfInve8qe5/JWbXR44qEG35seFF7w//0mRQ7p5JjQQICz2z6ibO2lEHuxXFrhYM
         7bSmnUteYhhO4X7sUlNf6WvAsXadzDCdP9mixoC6WjJomPVdWJqA95ACGOPWEVIURXUV
         8QixFL91frUpwLRDcff8k9qVYmgOCRB+LXPPiiyRssPXorD8y5mJkCLHRfp8Svh+iRuC
         aXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5SGCfToDbM9WhOy+q3kxZx78SijHUnLuNZHHeTrr+MM=;
        b=bMR6X+QSEoiNMNsUU/hvmAgQ18DX71/9aoqfe4lX07llKUsqQPsRE4QoxnRSczZCJf
         y7WV6MQVIB1yOwP8T1jA8AKyqqQv80rLr4Q6Jx0Ll4N+wcdWAIC7VX4l+fmBf4mWBUdC
         d6NeHnwKjTGyiWd3Fc1tp2yp58TQMOlHxbXij7qJlUu+ln7bFNnmP01edTqiXsnEEknT
         yubuUaZij1isejzF9qNVwQnq9/X0Oj9SFaK+LsuSSZAzWSnaBu9Ly/0uQSdpdvBC3hdw
         E0XD6dxTOrEuFC2wkT1x4Xie3csFD7w1/yUzbh7tgj/CcJeS05FumKi2JE9W6FEurk1L
         zJ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dJmSUhZ5;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u10-20020a0562141c0a00b004c7528af8b6si3280383qvc.517.2022.12.05.01.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dJmSUhZ5;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SGCfToDbM9WhOy+q3kxZx78SijHUnLuNZHHeTrr+MM=;
	b=dJmSUhZ5zv6IJN8q3hsNbWHtS60OYAQ8jyPQA+rcfoqAI+BMh5dp5vu9prZP7heh12TS4T
	p5rQCBsXJIW3FUXs2rHaV7w2SmHAxerZlXy8c62ie0QwJYhrO5g9x2a+kifMT/jd4eAbeB
	bLml/iyDtkSKg9sghBXKBPVe+XaCdJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-z77S-848PwCeZE2Tmiy1Ew-1; Mon, 05 Dec 2022 04:53:37 -0500
X-MC-Unique: z77S-848PwCeZE2Tmiy1Ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A304862FEC;
	Mon,  5 Dec 2022 09:53:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED0652166B29;
	Mon,  5 Dec 2022 09:53:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/51] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt (CVE-2022-4144)
Date: Mon,  5 Dec 2022 10:51:44 +0100
Message-Id: <20221205095228.1314-8-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: vtoAeZAX4YqZ

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Have qxl_get_check_slot_offset() return false if the requested
buffer size does not fit within the slot memory region.

Similarly qxl_phys2virt() now returns NULL in such case, and
qxl_dirty_one_surface() aborts.

This avoids buffer overrun in the host pointer returned by
memory_region_get_ram_ptr().

Fixes: CVE-2022-4144 (out-of-bounds read)
Reported-by: Wenxu Yin (@awxylitol)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221128202741.4945-5-philmd@linaro.org>
---
 hw/display/qxl.h |  2 +-
 hw/display/qxl.c | 27 +++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index bf03138ab4..7894bd5134 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -157,7 +157,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
  *
  * Returns a host pointer to a buffer placed at offset @phys within the
  * active slot @group_id of the PCI VGA RAM memory region associated with
- * the @qxl device. If the slot is inactive, or the offset is out
+ * the @qxl device. If the slot is inactive, or the offset + size are out
  * of the memory region, returns NULL.
  *
  * Use with care; by the time this function returns, the returned pointer is
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 231d733250..0b21626aad 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
 
 /* can be also called from spice server thread context */
 static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
-                                      uint32_t *s, uint64_t *o)
+                                      uint32_t *s, uint64_t *o,
+                                      size_t size_requested)
 {
     uint64_t phys   = le64_to_cpu(pqxl);
     uint32_t slot   = (phys >> (64 -  8)) & 0xff;
     uint64_t offset = phys & 0xffffffffffff;
+    uint64_t size_available;
 
     if (slot >= NUM_MEMSLOTS) {
         qxl_set_guest_bug(qxl, "slot too large %d >= %d", slot,
@@ -1452,6 +1454,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
                           slot, offset, qxl->guest_slots[slot].size);
         return false;
     }
+    size_available = memory_region_size(qxl->guest_slots[slot].mr);
+    if (qxl->guest_slots[slot].offset + offset >= size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" > region size %"PRIu64"\n",
+                          slot, qxl->guest_slots[slot].offset + offset,
+                          size_available);
+        return false;
+    }
+    size_available -= qxl->guest_slots[slot].offset + offset;
+    if (size_requested > size_available) {
+        qxl_set_guest_bug(qxl,
+                          "slot %d offset %"PRIu64" size %zu: "
+                          "overrun by %"PRIu64" bytes\n",
+                          slot, offset, size_requested,
+                          size_requested - size_available);
+        return false;
+    }
 
     *s = slot;
     *o = offset;
@@ -1471,7 +1490,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
         offset = le64_to_cpu(pqxl) & 0xffffffffffff;
         return (void *)(intptr_t)offset;
     case MEMSLOT_GROUP_GUEST:
-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
+        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) {
             return NULL;
         }
         ptr = memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
@@ -1937,9 +1956,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
     uint32_t slot;
     bool rc;
 
-    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
-    assert(rc == true);
     size = (uint64_t)height * abs(stride);
+    rc = qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
+    assert(rc == true);
     trace_qxl_surfaces_dirty(qxl->id, offset, size);
     qxl_set_dirty(qxl->guest_slots[slot].mr,
                   qxl->guest_slots[slot].offset + offset,
-- 
2.38.1
