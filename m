Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5EECAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:27:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s8J-0001yE-3x; Wed, 01 Oct 2025 04:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s8D-0001q6-KA
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7L-0006Ng-0I
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:13 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so47412545e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306992; x=1759911792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afB/RZFwe4kGQ4M+qs4tNxazcsoE4PwZzYwGLFafQyg=;
 b=uRPnTkwt3y+sdFVZaeJGUT0ny23Qns45h3bhriQdA41HsadBItKgL0uWnIGo3jZ4Er
 6DVDSwvXBYqGp+zIK0DPI+8Db36Onvb9HJOn4rdNRabPvhcJCrxm+iEsjf8A8D4J+NGW
 z05zq/SzUEWeKI0HwcSg0P6bSSSnMn7seLNnqyJp6O0/a/VLH4C1DEsYqlh8itIr9rTf
 ppDidu8oTqSrdD4Fauk9LZK223GYJlQSQkYqHpO6KEhoqJGKmk41gXK/i+QguoFi2Nn0
 f+z6XAwHmqYozK5D7pFu/kWAH2/jFV5f/7jbNGwaQ2BYPx0+yETSk3Xcl9ADr60jMqhO
 weIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306992; x=1759911792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afB/RZFwe4kGQ4M+qs4tNxazcsoE4PwZzYwGLFafQyg=;
 b=o5yytITAXyR2tE9Q5050+qqZqFAtDYjeWrzdE/WQMhZhetUeAyMtG8KHkW5a0u/TyL
 aOpyAwwUy5R4GYPCzme2uhIwhr+wYSDN+RCFPpvdo+xl9Lp13e76U5tvX2PBd0nRqqhG
 RfvGGm3/AwQuU79pkwuV6PR8kRUOWSd8b+AyxX5iVyh8CbhaGTMbK8wu4+H22HsbNgx3
 PF21PEZBp+fc4s8YfCm4bWslSJj/wpvi3Sh2Y/jGqk/iJXKa5fUKYxRcmS1sJoXPfwWy
 FsROacFtJDbZFyIPjH4hnU0dXpgoLWk4BzI34fyMmczIoYFdXBbS2eQwr/ln5edCoqWJ
 OWqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZA7qX84Mf+kLki5tyfZ5shDIZTLx1zdYheMoQlg5DXaC4JU4UnoOEDDIGPeJsp9AYjwKqXJsRMw==@nongnu.org
X-Gm-Message-State: AOJu0Yx5pRNoF4VwR3d/a69kDyNU1qbX4Px0WWcnzGDQp1oOIs90XRdj
 v/qd4sMbKh9De+qQYvJ8XeFuwFVuHaVHcplUDzy25YvqRT7g58XbVMMc3FVMc30oWk8=
X-Gm-Gg: ASbGncuAu4prax9DwDnltvTx1CDruerIguwWsrcKTe2H3yNLug7u9IbIkd8CJDs6asd
 plbxK9iGyGTNae/o8cpy1Sudms7UQtpFSJ9FjqwQrSxttX7oukYmu/eFA1zIwCLinW7zav+maa1
 qZBgs+muc7chi3L74TVn+Kt3umCzIZWhJTMAMXFdYLGVv/g87IkM36IgY9tEDA3BQaUzZZxZYbu
 VbdjwWMVmgzwE0V+RvT95VJfdbjGBFOnJMWE0Ndd9HpCt4CTuQ95RCHkUWaEBUISXFMFpprHGh/
 CmlhE+9zSXtISBw+hfqETU9Edjw4gNrkFlZhUDON02nNSGZhVJ0YeVGSl8cQWV6ZTHEvPa0cHQm
 wMkHEymRYGo3rs2cimP8cgs2KU/HiB3YGcu4yOnSuD0PWNN5e578B1TMJCY2/ajTum+QjeD8DTO
 gWFahfYBPZibi6xaPwHPw81jweBhpgUiQ=
X-Google-Smtp-Source: AGHT+IES+dNLrdEB70zhgtK1c4BlsMZT242yR2FvRNkFzHhBxS3IH+lOXPsvtn3VywwmBpBB1wjvcw==
X-Received: by 2002:a05:600c:8114:b0:46d:ba6d:65bb with SMTP id
 5b1f17b1804b1-46e612dadeamr20526405e9.31.1759306992259; 
 Wed, 01 Oct 2025 01:23:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e6199fc34sm31625915e9.8.2025.10.01.01.23.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:23:11 -0700 (PDT)
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
Subject: [PATCH 19/25] system/physmem: Rename @start argument of
 physmem_dirty_bits_cleared()
Date: Wed,  1 Oct 2025 10:21:19 +0200
Message-ID: <20251001082127.65741-20-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
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

Generally we want to clarify terminology and avoid confusions,
prefering @start with (exclusive) @end, and base @addr with
@length (for inclusive range).

Here as cpu_physical_memory_dirty_bits_cleared() operates on
a range, rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 4c227fee412..e65f479e266 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -166,13 +166,12 @@ uint64_t cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                                                 ram_addr_t pages);
 #endif /* not _WIN32 */
 
-static inline void cpu_physical_memory_dirty_bits_cleared(ram_addr_t start,
+static inline void cpu_physical_memory_dirty_bits_cleared(ram_addr_t addr,
                                                           ram_addr_t length)
 {
     if (tcg_enabled()) {
-        tlb_reset_dirty_range_all(start, length);
+        tlb_reset_dirty_range_all(addr, length);
     }
-
 }
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
-- 
2.51.0


