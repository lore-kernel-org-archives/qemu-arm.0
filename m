Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5100343wrt;
        Sun, 20 Jan 2019 06:37:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN45Gj5Rj2OeMhR++sxZurqHnG1nYhgZEO3et4zuhRikI1deykEAzxZTihXI+FcswBPR27pT
X-Received: by 2002:adf:a50c:: with SMTP id i12mr23250673wrb.220.1547995076051;
        Sun, 20 Jan 2019 06:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547995076; cv=none;
        d=google.com; s=arc-20160816;
        b=bBryASUxUq/Zc7GkkLTUHY/urTxAvgUkJA4+rigiCzluRAiyP8yRBILASfutghhJhk
         nEcqf6nxOnv1pai7pBUAgG5qejUhHA0QaAiaTo8klsn8VMpiAC4c/WIeUX8E1Y7D/GUk
         zmG68q2OfZMM5oo0zXq6nYrBxt0dq5+rRrUBfZLxGYjnCeCZ81dM847yi7rUDveRKZRi
         5Cq5F9Fsa6Hout1ClIBcZ+E5Pm15HcGuB0/6MF2nnpaaS6qk3nbUvBPIn1Ahimr2dKo5
         Dlk3YFRkCQbEDwxu8qFDqkIJ3jP4rJUDV6I7oIf4qZzymh99ltXMpe4PwbQEOpAKtQYF
         BqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yVvM4RyjRWE95rFO/eUBnlvDY+e7O7SXqjBDBAMvAos=;
        b=KC2xE1kWzZUrTxgNLswtonzRmrYr2i/pHNvd20vjMjGPtZBVpoxZCQyvocbxWCCIKx
         NziAw9wVZuHOiXAZQXFPCUG2+PUoG05BtVLp5RtpYfEyP2d17oSuvBgE895fysfRs1Pn
         RigxrTt5ICfUwXZ3QBA18Y5IJuuQfwRKxaYdcLKZHl0tjlHak5QqCXXGp0eSnnFR2Zyr
         XW93lZ3rgdHK4OOMvr4vkrXISpwcKBU6VnfvAMWEAskzUX05yswLFlUr0rBcwuJy4dtn
         1k7drY9ABTq2Dt+zbkaTN97tOPTdUN05wie7f4AKw7GC8Jcvqo6/45ptZT9ovGTw8u3E
         ZKew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si46336993wrc.280.2019.01.20.06.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Jan 2019 06:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glEEV-0003tg-3A
	for alex.bennee@linaro.org; Sun, 20 Jan 2019 09:37:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECI-0002pf-70
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1glECG-0002To-9u
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1glECC-0002Pf-2V
	for qemu-devel@nongnu.org; Sun, 20 Jan 2019 09:35:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 805473DE03;
	Sun, 20 Jan 2019 14:35:28 +0000 (UTC)
Received: from localhost (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF5719C7D;
	Sun, 20 Jan 2019 14:35:27 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 20 Jan 2019 14:34:49 +0000
Message-Id: <20190120143452.21683-2-stefanha@redhat.com>
In-Reply-To: <20190120143452.21683-1-stefanha@redhat.com>
References: <20190120143452.21683-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 20 Jan 2019 14:35:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/4] memory: add
 memory_region_flush_rom_device()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dr1qS12toCmc

ROM devices go via MemoryRegionOps->write() callbacks for write
operations and do not dirty/invalidate that memory.  Device emulation
must be able to mark memory ranges that have been modified internally
(e.g. using memory_region_get_ram_ptr()).

Introduce the memory_region_flush_rom_device() API for this purpose.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/memory.h | 18 ++++++++++++++++++
 exec.c                | 12 ++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index cd2f209b64..abe9cc79c0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1344,6 +1344,24 @@ bool memory_region_snapshot_get_dirty(MemoryRegion=
 *mr,
 void memory_region_reset_dirty(MemoryRegion *mr, hwaddr addr,
                                hwaddr size, unsigned client);
=20
+/**
+ * memory_region_flush_rom_device: Mark a range of pages dirty and inval=
idate
+ *                                 TBs (for self-modifying code).
+ *
+ * The MemoryRegionOps->write() callback of a ROM device must use this f=
unction
+ * to mark byte ranges that have been modified internally, such as by di=
rectly
+ * accessing the memory returned by memory_region_get_ram_ptr().
+ *
+ * This function marks the range dirty and invalidates TBs so that TCG c=
an
+ * detect self-modifying code.
+ *
+ * @mr: the region being flushed.
+ * @addr: the start, relative to the start of the region, of the range b=
eing
+ *        flushed.
+ * @size: the size, in bytes, of the range being flushed.
+ */
+void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwadd=
r size);
+
 /**
  * memory_region_set_readonly: Turn a memory region read-only (or read-w=
rite)
  *
diff --git a/exec.c b/exec.c
index 895449f926..105ff21e74 100644
--- a/exec.c
+++ b/exec.c
@@ -3162,6 +3162,18 @@ static void invalidate_and_set_dirty(MemoryRegion =
*mr, hwaddr addr,
     cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
 }
=20
+void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwadd=
r size)
+{
+    /* In principle this function would work on other memory region type=
s too,
+     * but the ROM device use case is the only one where this operation =
is
+     * necessary.  Other memory regions should use the
+     * address_space_read/write() APIs.
+     */
+    assert(memory_region_is_romd(mr));
+
+    invalidate_and_set_dirty(mr, addr, size);
+}
+
 static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max =3D mr->ops->valid.max_access_size;
--=20
2.20.1

