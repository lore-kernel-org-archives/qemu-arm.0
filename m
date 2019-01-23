Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1171658wrt;
        Wed, 23 Jan 2019 13:27:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4iGVYIXIFE9nNZONClWnMt6PPsig2pCmPk2slMiAuSQHRiK4oaIfXyy9dPG+UaQvY4Z38r
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr1109895wrq.265.1548278868682;
        Wed, 23 Jan 2019 13:27:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548278868; cv=none;
        d=google.com; s=arc-20160816;
        b=Jp90fxu1hnENGWaiSKt6m6cd/Ow7Fr6HWWjaxAtJIDa2W5PoRVVVHkrFYhQ/CgYLxl
         lio9bzFVbDnmUM+p/0cktabBiCiqmmPFm6Cs31fGSseglI6rvsHbqeBvuayvhB+fsGWa
         tYLt6iJAzbIHqWAAVTnRySvuvnfu0J2zm5/Aby6eHJ2Ml6FWzGoZz68BE62zOuTTdgmd
         uAM8PsVyhIYPrVnrxVx8lfj1P3NFqNejM/UihpsE+3T0+tebmgsk1SS+NCf5Ez5FeLBl
         1uqsRDcjjuZ/7IEWH8fsdX+uHXKiXCI4gZjR5UVXJW9jwClY7DVF9fsCyr4iKCqs9rSl
         UsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yVvM4RyjRWE95rFO/eUBnlvDY+e7O7SXqjBDBAMvAos=;
        b=S/zV2jUn8wU+ZvMC0c5/ujyY78uy3IAWsqG3G0Yjo1TrgTXsFrin88ew7xhfhT8GNz
         gdK9Nu5ig7ghRtN3wLmLHQft9Kdtx1bsIRItEoAql+KWwmR/FPcjabF7yqhnIoSWK4Zb
         JoBWsBqszWx/Uo9M4U/HdnVnnfYHmgAkkKAyiIZHLYD9Fezk8Uwype+EpNiV94b5LsAv
         t3W/gO5KcT49c1uMYDy+wE/7WWPbpllhWaCJkj0JrkSc4IMoRyq+iNkAA+yEmhfsH9ok
         qjDtAQRn9Olp3cOMsrZjZsqhg/6GumP8MrT9HPI6lEkmUovIR+NHZ42u8uuZnfDWpUXW
         BvYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si70094094wrv.48.2019.01.23.13.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:27:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQ3n-0001MR-Ls
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzQ-0006CX-8Z
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:23:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gmPzP-0001n4-BS
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 16:23:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gmPzL-0001j5-P0; Wed, 23 Jan 2019 16:23:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A68B7A53C9;
	Wed, 23 Jan 2019 21:23:08 +0000 (UTC)
Received: from localhost (ovpn-116-104.ams2.redhat.com [10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E485F5C23D;
	Wed, 23 Jan 2019 21:23:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Jan 2019 21:22:30 +0000
Message-Id: <20190123212234.32068-2-stefanha@redhat.com>
In-Reply-To: <20190123212234.32068-1-stefanha@redhat.com>
References: <20190123212234.32068-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 23 Jan 2019 21:23:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/5] memory: add
 memory_region_flush_rom_device()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	jim@groklearning.com, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H++5z8I0OzGV

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

