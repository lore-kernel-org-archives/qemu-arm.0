Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAB5CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:58:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v414N-0003NF-77; Wed, 01 Oct 2025 13:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v414G-0003De-8J
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413g-0001AU-NH
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:56:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-414f48bd5a7so66751f8f.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341356; x=1759946156; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlChLU8Sv66u34cuVfj2m981SsQ1riJ99O+cWJLK7Og=;
 b=RQeWcW61Zr447L8khS+L2dNr9h0CbH7PLQ4QtHDIMcb0PloHleY/6WEBSmX0a+fuAm
 xCN/3JIIbezfaNd3TCboNOHzFVOZctLZPwJRWnUoJcy62Lonp1vkCqESMAmwkQaXwLAk
 WOjrxs5j70OVxLewm4Mt950Sfkf7Ca0DOFDEOzsizp+fbCnjvJXP0UVTWplI8TTYAa7H
 Ta8WSzz+YOXxwPjkxdEKJZQyGbfLUtxn10hSjswpWHyD8NPPja/PIER4wOb4wJ+1ZwZQ
 Hla/qriNBdKz+RQExYIb8UbV8hWJSoHr+RUSJDeUeQoZj1jLPaWHA6iuMr94kGbajVO2
 XfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341356; x=1759946156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlChLU8Sv66u34cuVfj2m981SsQ1riJ99O+cWJLK7Og=;
 b=NBR3VMtt5C3nBjb8zWRDJIaJ1XWirHXHUT2vv3/q2uAIgSG+vVptepipKYgh4OTC75
 f6yFlXGWCziN0wIWjosIp12d9rR6xRnRKPRkw9xUGGjP6S7VkQxggNNvyXRBPtqNSpJV
 5BedqEv5oLYaYhS0qDz+F5bSbOKK/6rEWK7YWyklet365Etk9excWNVs2AMh4r54fwIu
 kI0mzpSJc8oZwSG3A00KGaCQncN7td/VYUknnaaSKbMwAMhVGTjhUWvKcYF2FvAl71tH
 h4AsYf9rWSNbfIGDKzi8pzDDY7dMTI/wsfR5Hr/9LMhmg4qxYcBzU7Rqzp0NTc45k6n/
 SKtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHKiPhK2tvw0UrYK4fkc2ITr1+e9NQ4MymgYr6nK3pb7StL3kKpH96/tY5XPlrqaw2pi1Q1HEHig==@nongnu.org
X-Gm-Message-State: AOJu0YyE3Ere+HWJq6uflX/5BXRaVRTqh97q54CjMQYnvVCaPNg9dj4t
 Xc3eFlUSGAdDNHpvo6J/NsdfliISZKfNXmpU2j5KWr0ZrrdCoOsCDnJnaqBcel3vksE=
X-Gm-Gg: ASbGnctlaJai51zxD4DZ74QE5FiAEV+5oxLJB9YcF0VTu5N5ZfwX9ws61fAuIvSv+aD
 pRc7jqHTcxHjgI0LEWLymjoGQxZO9fjdRmfgop3vBV2PnhmgjAsX6SNBG5iTbvzQvgXN8ZPUQqx
 jFlJ12pukKNYwtLa0qNqNZlsmmG9zXb6eBOGynFtQKz/WaZb4dVAjuhRqFHwtWw38g5S67/2lZ8
 CMg21pBVMIgANnT0xU/7YdW6zQ5bLRZwJRRoePfuiv3UlCNS0cQ0BxBBZppau9b7pmyrr3Q4BxR
 k/eL60ylZyON0jq1St0eGZVVw8A6OXFk5p1gL8LxlTIYEwlWHF9p5i0nHDT3ZcWx062zDyAmd0O
 0AzA+hKJIZSx6FGvkxIt9cpZYrlPyazKJV9tPrzNLuQa1aAM4GZSokxf0OaBm6ZxHo+HSb0HM7Z
 e89fBLjNH3YTBz8mZ2bZ+qk658uA==
X-Google-Smtp-Source: AGHT+IHfeO7OH/QdtcggUnA5uGklDQpIabKZxQPr/EBAMEwVNTVFueen9PGLslG1prHgPOf0O5ib5g==
X-Received: by 2002:a05:6000:288b:b0:3e0:e23f:c6d9 with SMTP id
 ffacd0b85a97d-425577f3550mr2999587f8f.17.1759341355760; 
 Wed, 01 Oct 2025 10:55:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6e1bsm144312f8f.8.2025.10.01.10.55.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:55 -0700 (PDT)
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
Subject: [PATCH v2 12/18] system/physmem: Remove _WIN32 #ifdef'ry
Date: Wed,  1 Oct 2025 19:54:41 +0200
Message-ID: <20251001175448.18933-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Commit fb3ecb7ea40 ("exec: Exclude non portable function for
MinGW") guarded cpu_physical_memory_set_dirty_lebitmap() within
_WIN32 #ifdef'ry because of the non-portable ffsl() call, which
was later replaced for the same reason by commit 7224f66ec3c
("exec: replace ffsl with ctzl"); we don't need that anymore.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index ca5ae842442..fbf57a05b2a 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -155,8 +155,6 @@ void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client);
 void cpu_physical_memory_set_dirty_range(ram_addr_t start, ram_addr_t length,
                                          uint8_t mask);
 
-#if !defined(_WIN32)
-
 /*
  * Contrary to cpu_physical_memory_sync_dirty_bitmap() this function returns
  * the number of dirty pages in @bitmap passed as argument. On the other hand,
@@ -265,7 +263,6 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
 
     return num_dirty;
 }
-#endif /* not _WIN32 */
 
 static inline void cpu_physical_memory_dirty_bits_cleared(ram_addr_t start,
                                                           ram_addr_t length)
-- 
2.51.0


