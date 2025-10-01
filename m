Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C95CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:27:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s7Z-0001JE-HU; Wed, 01 Oct 2025 04:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7J-00012K-5L
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6i-0005v2-DO
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso5193235e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306954; x=1759911754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDgeo2zJE06h8QgA17T0RsOYYTnGmADPzWOfZYKLdkw=;
 b=Sg7tOPHDxRXshVYupcVo4jWUezTSywE+5bKFizMAFqnN5Y/eq27BAHF9zeQiWeQm5s
 MLYCwbpGUnD9MuGgai9Tsj0dIp66JCDIXSpxhTrOq6qxo4sFxWU9jJ/Cuahn43lAB1p4
 0t1yc9Yto+GwqKurc54iXc/4S4WzipiCqoafr8VARy+QswSjX7qZX4A/pIM74TjvaWr0
 QHkD5uAtoJUh+dyfsGODShYhMuqVjhhPV/xHpSyBWqAb6NYRu3Ko9/cYR7SZU01lTuut
 QXDO9n+KrN60OKM+XKWGA4TylCXWPyunQSfsUKy8JERoP1NsZFMQC9dfkzOikvAtal2z
 uNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306954; x=1759911754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uDgeo2zJE06h8QgA17T0RsOYYTnGmADPzWOfZYKLdkw=;
 b=hxz9VFvZ0CQgE4u9usR7qo4Cx55glEbj7XtlGzhzjLMx3zULxve/wGx00YxqtKjgBy
 jWcQ0DtaUL39LFJROuvidV7jETgS3UenEsh+oEDGfDPRyFHcKf0uth7fYZVOPYq0fJjr
 N0FfiWZzykbZsXLqlDyeJs2y3rl+Qv7KPrfW0VH5IJVQhVr8pNPOL29dgu10AkN8ITJE
 ckrKxCoJluDv2C3oVhOnG5IkKC2wahXWkK6JtzjSlJW6g4OcqBQjCCbeGyGyDGU36Gyq
 k7OoVcgOKyJ79oQPuQCoxQUxaNhRh4Vxx9Ihvgp7vSEWcT/d1qAzdjG43dRe3hiy1qFE
 87yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpevHSHy9xNlnomzGlyh+OCx9Y32sWC7h8TUpj+5LDOAyAIw6SBfCu4CYSN3WkEo9lU7i/1OSY8g==@nongnu.org
X-Gm-Message-State: AOJu0Yy7T8n1X8qGDgOQ5mrRJw9/I/nxUr62drr0hosA5SGb639M+mVq
 cDN7U3djJdnWgrtzHZhkKuMSnlfi6lhbUSFgkUdMvZ6pE25MXhNI3/kfMqRVq1NtJQE=
X-Gm-Gg: ASbGncv3Przpe6V68Q6k6NL6sG54D9w6fv/oI7ASvPnfP2Mu23PH5xBJ4Kkgm7PXial
 pNXkMoGvHQDOQwbYtV6fRuQoxMFNsw/LzvLeGVRdyKb0eKPVEuGusvv1HxxjhXKaadbN/ZA6Fz/
 5Z9lMwfby+9zmDPHe7bapZ7lZeNjokv8J9JxfFvM5ZJ5QLnWoXJNiEaMuora6y+yt8VS30oWFvV
 kWkYp23KS+WpOQUzgTxQA7Z2r+AyTK0gXIVsbmLmhjynazyt/EDROKiJxo2e7n49hgCuzZtKbao
 QpYOGb9c6Eg7ldwgvO6oq4z4SU1XcFC7BzlztOUlHAP8zIHMiPDq/eoaiKDoAE/pUJi6NfV0qH3
 zCOXWx8OC5TR4v8nXhZF8VTqtWiVJVdieMrlCZArLN0dF/L3w2k5nv7+gsp6BTCzqx5mGvnsYbd
 xwAuDGqIL82FqVPs40Z0Ds
X-Google-Smtp-Source: AGHT+IHvBo+V8oomdTfosMLuI0EpMsA23PUCxfHTKlB72ocxI/viBCxHR6lbgB29b5WbCh/EkkRIww==
X-Received: by 2002:a05:600c:a30b:b0:46c:adf8:cd82 with SMTP id
 5b1f17b1804b1-46e58aac99cmr48828895e9.3.1759306954128; 
 Wed, 01 Oct 2025 01:22:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6111c1f4sm17544135e9.0.2025.10.01.01.22.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:33 -0700 (PDT)
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
Subject: [PATCH 12/25] system/physmem: Rename @start argument of
 physical_memory_all_dirty()
Date: Wed,  1 Oct 2025 10:21:12 +0200
Message-ID: <20251001082127.65741-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Generally we want to clarify terminology and avoid confusions,
prefering @start with (exclusive) @end, and base @addr with
@length (for inclusive range).

Here as cpu_physical_memory_all_dirty() operates on a range,
rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index cdf25c315be..7a9e8f86be0 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -142,7 +142,7 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
+static inline bool cpu_physical_memory_all_dirty(ram_addr_t addr,
                                                  ram_addr_t length,
                                                  unsigned client)
 {
@@ -153,8 +153,8 @@ static inline bool cpu_physical_memory_all_dirty(ram_addr_t start,
 
     assert(client < DIRTY_MEMORY_NUM);
 
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    page = start >> TARGET_PAGE_BITS;
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    page = addr >> TARGET_PAGE_BITS;
 
     RCU_READ_LOCK_GUARD();
 
-- 
2.51.0


