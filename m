Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C43ECCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:26:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s7t-0001Yy-IR; Wed, 01 Oct 2025 04:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7L-00012e-1H
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6i-0005sU-8T
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso5515900f8f.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306949; x=1759911749; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9IGpJufeP6E66MY+FRkIfF2QgQ90YgPFg2n1Q4hyMg=;
 b=Aurt7BVVu+tQg7UUwAXX7wRw5gIPV2YCqlgupgUFHCcCuQLImlFEp3sPKkvtGKsG/c
 MQ4okreoqU1kFivqJNQ2CjJgJyKg1CQuVvLD1P675sngVmIKUmQDjPvbmuaRTwhoK7B7
 A7Bg8FhmXnXN7WCMkGOynAFQSKHvJpC1NMpS3AOGMogYVpNtvut4D+/HMG0mx2oUQtvv
 rx83xtHNIQfdv0TQaJJsefqADDwmmRQLxRxXcwuxiD3RQfdF43J4bhIGSK51qQSPlpU5
 /SsWIufh5Y2zKG+/07hr9U4uhe8LoAABJxOldI1GwQPz1UXMK7Lc5mz1NJZ6X/MYBMdI
 9sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306949; x=1759911749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9IGpJufeP6E66MY+FRkIfF2QgQ90YgPFg2n1Q4hyMg=;
 b=v6+NkMGaCZgQSeoMBC0ZLGnO0j4Cf75dIzovFeYV8WsLFGgriInLcnUShAkzt+rBOj
 3nTYRrwMQoY4JHOV+wP0yaJPmIzulDF8UCuhevNWQc1e25gok1DZ1z96sRzCV7CGP5YW
 tnfxkEYJC0WzOk6Ze5NO2VX8rxrP31WO13X3q5stzXyWsTYfCUGw6vOGor4rkpAn3TKC
 aagQ2bsJcHHtNKsCE57RRJHokSZOtigAWMUTVbttvShI9aSx2SMMFTc//YYMk4uWC2fd
 JX/MJeKgaqSMdS5Inu4EKq7dLcDVUzeYn+2paNhmROQZd35GPGrD/9lMKKlZ+MKHOjGm
 xIzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOiFjersrf4ctJn5qZfxMl3+oiJ3C0hl09BsPTGkDZbHB/ya1wrc9AsjsmzbUdKurCu2PPgD6UMw==@nongnu.org
X-Gm-Message-State: AOJu0Yx34WiZR8/rZY0IwqxTEkuMMaAV2YPlb6SUNH4iBHbBxE6ho4oh
 YvjVbf6rEszpYKAgt03SnY02hijMvEzTdpzPbh8j/i181UuCig5Ucoty2kcFBcNM7H3hKQX3pPU
 1eiRhrdcQ2w==
X-Gm-Gg: ASbGnctXV/urK0zmd/7b+udxQ/5EKjA7zwImCZnbDP8Shso5Rn2kbFteaut5y9haOPb
 z8cuWSeXTfTD2Ekp4iHLCvPsMZOiTNdaGo+efBkwHttUrxYkE8y/cKZB64SUaQQOMsjOkJLhRQv
 WmhvdWrFLyaM9/idPjfnUZVpyroZDS/caoZrHvv+AgFIm7y8P1JgkssrtRbB0PNE63FjU4sWIp0
 gWnzbZngH4fQh5gqu+VhKuPjJWzyVHyjLZ3iTSvZcitYdAimJ49Xz/XpRLbEhNSLjRWhYkmxB3x
 uj3al41tTZ4W2Nn0Wm6U/iyvsFrTIPddHQinnaW4gDLrMYcZWXEy8vjqHTuw4BD3iXZWpxxTjzY
 0iZxl5mtUp8WFEOyL5mgptrHaCWZG1pAuyfzj/YqODd1Gv5dvzwto33yIr0o6p0TT5fQ+ktW0mW
 aR7nNEsYR5VIYUCT+kDsoA
X-Google-Smtp-Source: AGHT+IE7KkPLvaR1QK3ujSOd6vDORA988gltgTw9ux7aYxUsmtBHV92rbuikFKmOoYRH4wm0uOW4Ew==
X-Received: by 2002:a05:6000:400b:b0:3e7:535e:986c with SMTP id
 ffacd0b85a97d-425577ee89cmr1798733f8f.2.1759306948890; 
 Wed, 01 Oct 2025 01:22:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b7e37sm27742425e9.1.2025.10.01.01.22.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 11/25] system/physmem: Un-inline cpu_physical_memory_is_clean()
Date: Wed,  1 Oct 2025 10:21:11 +0200
Message-ID: <20251001082127.65741-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 7973448b3f8..b27519c3075 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -946,6 +946,15 @@ bool cpu_physical_memory_get_dirty_flag(ram_addr_t addr, unsigned client)
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


