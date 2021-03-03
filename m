Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5705776lfg;
        Wed, 3 Mar 2021 13:47:21 -0800 (PST)
X-Received: by 2002:a05:6000:18a:: with SMTP id p10mr801615wrx.166.1614808041462;
        Wed, 03 Mar 2021 13:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808041; cv=none;
        d=google.com; s=arc-20160816;
        b=wsB+7kMfUa9dUvCY8VjftEWpS536WeVsx00wwjLEls69Qf6KOzYTNtpojdjUyF68nt
         2fd1KZTuIYUPC0T7DQXwmNVVcrH5jUZq3PvyyUwlVxYVBD8njngPK/7uaa41FWpV9RpZ
         qAwsIl9i3P7yspG/5rHDRPXbcRC7SDkWR/LSIJCGY/6V83DWMzcN8qY5ASJR6PBXsvvw
         K+MBIPZcT/rHeKNUTobqfV/lwgjesfqpfN8fwAQPyK/jkfUvccmhnCeTuAPekeQaWtUi
         8H+CcTdU9vC+ham7YZGCAnADFKU52SUNpBv466/iGeN/yufpBzvOZP/9kXtxZ4IBsDk7
         WScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=tRDIo4DQOW0kMm6RkoYcLXydekaWCXPMRmDJIFB5WvnWxxLHCtNCbZVQgGcubiljhY
         +Y4thkYyRY7KiYi+v2kqNLo2laX/fYQYVOvSzThO1ESWh4hjrSd0isnNz1zoj+s+oRKe
         1bGQWaPUPqfI9qOvpCNXF1T0i8xTqW8UuYF3KsSFVfXPVb3OzV6IKpZCerOIItkM90FB
         3eIw4GiX5eftDzZdLwv7NjaAY4J5mAfgra9TYhSDTe1Z5vYFW02KZjNwxc6aZ6JpPpQf
         ik0A6E7pR8xKLxcDjeO1kYxo89YV9bw6ks2fFtSmj+10Gp2ehmbCYGLdsxAiCgETl1gI
         zFOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HuJJwRmQ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v124sor4181063wma.7.2021.03.03.13.47.21
        (Google Transport Security);
        Wed, 03 Mar 2021 13:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HuJJwRmQ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=HuJJwRmQm/WNOwG0i0A956QWH6H100m0JkDutpdpBZXuu/7RBFufc96trr+qP0h/i7
         szkhInTF9ujPv4lnxTuYB/vn4oniSp09pr6ETBqkqrWm+0EK3Fxl71k2J7trHUiWTW9p
         lwFMy4VhPTnjVy9GyZGlZGRPh/+OBf1LcV0XONqrpc8HyyTFgYx+cPot7b6rGACmbK/W
         dS8GiTIl0slZmoPXWKMsw2UHEG/YlF9EVjBbwsORGh8uDuAq74258iuj9aIVG82OZ2VS
         JGU8QKblTOFSquBrtbwhKIAF7piCIyibLMQoy+/ysvpRZflRnTAuQznhb8L4001AtFqB
         7eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=aFkC1WnyIek38N/ESmiDOuONcIj4n+lSiI/kWmz874xP8xmbQaeg4TotaEGQW9iVp/
         SNE8YF6fK3aYYSKnudPyqbUNbtDr6kyyd7hxT7wjk4Do77E+sq11RKBCNjz2I19t71oP
         Iw1m9/Qo7qE2Xoz9RRxG8vWn25vAw1Cgqgn9Ns7HjhjRAFHk23BmFxQFz58GKoBLJqoi
         XCqCkdxo1D67tB1tt6Boue3KLzVbTvLS3oKhto4QjZl3uOEys63sjoc2Mgsdm4JTbS4w
         jixu47C9OJ3RYC7L2h6+bBCpJPOgRIV4cdH6TZVxnMX0+Q2lfTaNtRABDuoG9LxaWIm4
         UG7Q==
X-Gm-Message-State: AOAM532+QMXy0r/A8qdO+3x9uJ1YFGPKPyh+RYiXzCYa3Uj6IgDGwmqD
	BpRWW1nxZRvao0LZazeBk8M=
X-Google-Smtp-Source: ABdhPJzxS2VzZOvh/vxiv32QSoXBqRD0SUS3vVBgJQmaWmg7PAPBa+svtupAyEDVFXt/BahNUtcokQ==
X-Received: by 2002:a1c:4182:: with SMTP id o124mr848914wma.61.1614808041190;
        Wed, 03 Mar 2021 13:47:21 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i1sm6516207wmq.12.2021.03.03.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:20 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 02/28] cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs
Date: Wed,  3 Mar 2021 22:46:42 +0100
Message-Id: <20210303214708.1727801-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vRdjDC14UOYc

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..2d43f78819f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -578,18 +578,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                                   MemTxAttrs *attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
-    }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
-}
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs);
 
 /**
  * cpu_get_phys_page_debug:
@@ -601,12 +591,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-{
-    MemTxAttrs attrs = {};
-
-    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
-}
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 /** cpu_asidx_from_attrs:
  * @cpu: CPU
@@ -615,17 +600,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
  * Returns the address space index specifying the CPU AddressSpace
  * to use for a memory access with the given transaction attributes.
  */
-static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    int ret = 0;
-
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
-        assert(ret < cpu->num_ases && ret >= 0);
-    }
-    return ret;
-}
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..4dce35f832f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -94,6 +94,38 @@ static void cpu_common_get_memory_mapping(CPUState *cpu,
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                                   MemTxAttrs *attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_attrs_debug) {
+        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    }
+    /* Fallback for CPUs which don't implement the _attrs_ hook */
+    *attrs = MEMTXATTRS_UNSPECIFIED;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
+{
+    MemTxAttrs attrs = {};
+
+    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
+}
+
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    int ret = 0;
+
+    if (cc->asidx_from_attrs) {
+        ret = cc->asidx_from_attrs(cpu, attrs);
+        assert(ret < cpu->num_ases && ret >= 0);
+    }
+    return ret;
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.26.2
