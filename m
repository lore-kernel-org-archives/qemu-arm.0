Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2825976wrt;
        Thu, 18 Oct 2018 13:26:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63zTvfCWJSuZVbm4y6uhpoW8PbqzflSi2ofj+XsMvLb9sNH3Ob9r0SkyDXujVJIQSUn4Jhi
X-Received: by 2002:aed:35b2:: with SMTP id c47-v6mr29340319qte.155.1539894398130;
        Thu, 18 Oct 2018 13:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894398; cv=none;
        d=google.com; s=arc-20160816;
        b=Nk/XVbNNuSENpQsWKC5OaWidCZlKmNa6CsxBjGOiqb4AFsWPqfiVUZhEw7sSKbj08j
         6H0C4sboSg875/SXXiHZy0kaE5rfpUOOfGaEn6AEZk3gGCK6yElNXv4QHQD+q7PLNKD+
         9N78o+H3jMTP5qn6XRU9JeyMk86kpwZRCvmjBNyb60EDvhpY03YBF8OiUWYe59n4HJWh
         SbTVULDcUnMf9VYz4njHRgUT8NCC8YBa89x27A7gLfw+C2nBN+D3H55EZ/wexnFSr0lI
         d9Ml0b5cubwAR1cdFAhRwJwyzdSbQOl+lbDZOns9vSeUAW8+yapbgjG9oofkkrFNSV/C
         QJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=WpOVeD4HObO/pPEB191IlF7PXtxxiLOjxHHBI82/Lv4=;
        b=sthjsSDX45fMo9G0DKrF8XznmxTqA7NMUWZrQAJCvBn3egaPBdB2LEPH4/fMgB+bMh
         XomXg23gSaT8wD6R+g2RBz66SR33SaDDuI/E3AWqvQAT3k9XIVDuE5p4vNZqOzNgk9tJ
         uUuRwqhN/j2BVE7oop+M+Cu3OMHD7ZfSB7Rc3yEGaiA/bbriPzrVf24Xzy8kvIys02JM
         07npkiu2ttyBqXJnQ0XzoTkMhJVUS8RnJwL6KIwK7kiSfooYBij/irhzGEakxZtrG7wF
         wShTx5N+Lk4NcLrH/uZgbWIZMn2KIj+RuzrHhkbu5KmIbhVNqVmz4bfD2uhNPnAIzbnQ
         CHfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g128-v6si2136753qkd.233.2018.10.18.13.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEsP-0001Uy-Gq
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:26:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEaU-0001u8-4w
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:08:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEaT-0002W3-AH
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:08:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEaK-0002PP-Vs; Thu, 18 Oct 2018 16:07:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 072543001FCD;
	Thu, 18 Oct 2018 20:07:56 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E4F368876;
	Thu, 18 Oct 2018 20:07:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:02 -0300
Message-Id: <20181018200422.4358-26-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 18 Oct 2018 20:07:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 25/45] memory-device: document MemoryDeviceClass
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, David Hildenbrand <david@redhat.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zrJA2wxO2FPe

From: David Hildenbrand <david@redhat.com>

Document the functions. Don't document get_region_size(), as we will be
dropping/replacing that one soon.

Use same documentation style as in include/exec/memory.h, but don't
document the parameters, as they are self-explanatory.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-9-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index f02b229837..0474a3dd11 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -29,12 +29,48 @@ typedef struct MemoryDeviceState {
     Object parent_obj;
 } MemoryDeviceState;
 
+/**
+ * MemoryDeviceClass:
+ *
+ * All memory devices need to implement TYPE_MEMORY_DEVICE as an interface.
+ *
+ * A memory device is a device that owns a memory region which is
+ * mapped into guest physical address space at a certain address. The
+ * address in guest physical memory can either be specified explicitly
+ * or get assigned automatically.
+ */
 typedef struct MemoryDeviceClass {
+    /* private */
     InterfaceClass parent_class;
 
+    /*
+     * Return the address of the memory device in guest physical memory.
+     *
+     * Called when (un)plugging a memory device or when iterating over
+     * all memory devices mapped into guest physical address space.
+     *
+     * If "0" is returned, no address has been specified by the user and
+     * no address has been assigned to this memory device yet.
+     */
     uint64_t (*get_addr)(const MemoryDeviceState *md);
+
+    /*
+     * Return the amount of memory provided by the memory device currently
+     * usable ("plugged") by the VM.
+     *
+     * Called when calculating the total amount of ram available to the
+     * VM (e.g. to report memory stats to the user).
+     *
+     * This is helpful for devices that dynamically manage the amount of
+     * memory accessible by the guest via the reserved memory region. For
+     * most devices, this corresponds to the size of the memory region.
+     */
     uint64_t (*get_plugged_size)(const MemoryDeviceState *md, Error **errp);
     uint64_t (*get_region_size)(const MemoryDeviceState *md, Error **errp);
+
+    /*
+     * Translate the memory device into #MemoryDeviceInfo.
+     */
     void (*fill_device_info)(const MemoryDeviceState *md,
                              MemoryDeviceInfo *info);
 } MemoryDeviceClass;
-- 
2.18.0.rc1.1.g3f1ff2140

