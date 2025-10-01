Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA43CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:57:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4145-0002yp-4P; Wed, 01 Oct 2025 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413l-0002S2-8C
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413H-00015Z-1p
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so615165e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341335; x=1759946135; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMnn9QxqznMIk/8u6GQ47WHewwt0Ozp5spYHpTtSw08=;
 b=yHjct/hSjiR2GbaYKJ7A49olEU2WDzmn6aMCK7eMNr9YQVvqHFe5j3EuHU6Ql1HTCA
 604wAuBnsdt/HCQo17wr9wGAFdPs5tBKFG/K3MFnT5nrOoM4/KsAikBl3aCaaet3lkpw
 soY4u/aQsqm++cLr8Qq8rOwrxSKQeDQ3SVVmCPCB5vm/Z3n/hALlHTm5e0FkGIwz+1S0
 alHh7yd68h+hcNn4YJYXxs5g5jv31lpfWiHQOCPdUokhGqzkOLCKh8VS9BGltLT+P5d/
 LDMqWRELkW6n5kNGu0WJXdba6hEpkLGBxpxD7wTTNPuYKO58XpmaI6ILItspODBZtcMs
 Hc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341335; x=1759946135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMnn9QxqznMIk/8u6GQ47WHewwt0Ozp5spYHpTtSw08=;
 b=B6miLoS2KAsDIVvKCHu6Iad4Or43WkN3TFNXLK0x82QDJ4jlWbxzhS/lh/XfFiflhN
 xqA6mQLQJW62IAE7XQvjrU2iKHnVDTVh937zfwlnt0CZnOAGPkG20LAg7xaLQMNU2Ll6
 NCZ4i+263k1guc5OSnI+yU/bMwtti3p5QHR0R8sTIc8fV19uUJYhGUfI2zU8KgwdzcUD
 RxKQ329z+MiZisCf0IVe3ejfv8/e9xIaMnKAwwp9uCL86M9kyfDNQGxLeASGCq1cCV3M
 o9U5TdVY6BZgA6v9Wly2FsVTlIj3AbjA6odhbER4wZcDbOY1tFBOUevRkByqV2ggjqKO
 L3tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc4bDsrxeEUMRgKMwlu7duHF1U1NS6laMgk6HMLW6Ka1QC8bLQVdE6xEcTW1XssFmfG5Gf5Cl/zg==@nongnu.org
X-Gm-Message-State: AOJu0YyBNgH2ZVThfcY8WuQ0q2iYam55zRv2z2s03Jnc+feZF2kN4Pet
 h1GEVYYIStcSphJDSPUP9i5hickJv1oR7XEEccHbxxblJ9K3w2/2+/HwhL7RSqTuLnc=
X-Gm-Gg: ASbGncsuAPCbPYfqRvHTZpeSaGRcHeDAO9fnNqO/iJIIL1l2q+zYjOHnZY5oVhjen3i
 fC7GOi4Hp4i++ymd9JmHRU8x4x4tREjDzNAsIV0EKemfuOuco10W380dxj5py/LY+C34TfWuOka
 w35GVZdOUsxBXRYaIUAUqSJU5N9d5QokAWlsGcC67yz3Usa1DLmHpRyRK5B4sppT+s24Mo56OH8
 fYQ7c+9Np9tIdyi9YAAT+cIUYOT3QxUjx5qVfn6wUuut2F8nBXIUL8RjCjbuFCMuv6uv4Es3Uc1
 ylEEe1cpvN+P6YHL5sDvX6cvTWVhohLIC0dAmtMgEVICOw3fmyQG/aCBVi7zSN4mV55f/f8IyM/
 uNmnYXPA7x6zNJG72PsYGObubDiUwqg0aUMYQcx4T5yr8RzYNkH7QX1cZNhu0wdSczYU8EjFbFy
 a5PQsp4Zbvj042q9v6dda8CWJzN0woFqeffnpu
X-Google-Smtp-Source: AGHT+IH3Aw7dJFcRGHrlqU+4GY94BK4VCgtQs9LFky54IFrpPglI/IatQU7AKf0gdO60PkhxhKtrWw==
X-Received: by 2002:a05:6000:2901:b0:3ec:d740:a71b with SMTP id
 ffacd0b85a97d-4255780c039mr3284668f8f.31.1759341334253; 
 Wed, 01 Oct 2025 10:55:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f0846sm79742f8f.45.2025.10.01.10.55.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 08/18] system/physmem: Un-inline
 cpu_physical_memory_is_clean()
Date: Wed,  1 Oct 2025 19:54:37 +0200
Message-ID: <20251001175448.18933-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Avoid maintaining large functions in header, rely on the
linker to optimize at linking time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/ram_addr.h | 9 +--------
 system/physmem.c          | 9 +++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index f8a307d1a3d..cdf25c315be 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -183,14 +183,7 @@ static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
 
 bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client);
 
-static inline bool cpu_physical_memory_is_clean(ram_addr_t addr)
-{
-    bool vga = cpu_physical_memory_get_dirty_flag(addr, DIRTY_MEMORY_VGA);
-    bool code = cpu_physical_memory_get_dirty_flag(addr, DIRTY_MEMORY_CODE);
-    bool migration =
-        cpu_physical_memory_get_dirty_flag(addr, DIRTY_MEMORY_MIGRATION);
-    return !(vga && code && migration);
-}
+bool cpu_physical_memory_is_clean(ram_addr_t addr);
 
 static inline uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t start,
                                                                ram_addr_t length,
diff --git a/system/physmem.c b/system/physmem.c
index a8d201d7048..fb6a7378ff7 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -945,6 +945,15 @@ bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client)
     return physical_memory_get_dirty(addr, 1, client);
 }
 
+bool cpu_physical_memory_is_clean(ram_addr_t addr)
+{
+    bool vga = cpu_physical_memory_get_dirty_flag(addr, DIRTY_MEMORY_VGA);
+    bool code = cpu_physical_memory_get_dirty_flag(addr, DIRTY_MEMORY_CODE);
+    bool migration =
+        cpu_physical_memory_get_dirty_flag(addr, DIRTY_MEMORY_MIGRATION);
+    return !(vga && code && migration);
+}
+
 /* Note: start and end must be within the same ram block.  */
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


