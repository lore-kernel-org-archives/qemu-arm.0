Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1264CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:23:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s68-0000Yl-Pn; Wed, 01 Oct 2025 04:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s67-0000YH-D6
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s5r-0005LK-SI
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so5260619f8f.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306900; x=1759911700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+C5CzLMaPwDa1iB060vEOK+Ww+NfWXh/VYhisUdBYCs=;
 b=xS4+INqkvrOyo0VDk7EdrzA97R4H3E06nazlYJqUUGT+SdLdO9IawwxTPISovEhjIj
 cwf7W25cbcpHOkttjEmjU3BCmZ3Dcl0QskG96Mps+YD6zbyv0s3fBHw7lWCm2ztCLEML
 ltDwSlX9tLvy0kF7Y5/IhQmoFPVlmxRJMuWyPkhF/7IO37osNWdU0NQb3HhxYcHQu3GT
 ZW9xVK/EFXW+96lt6OJWHCERnBJFN4fKoxNBYRCQv2wYu42oIJxBRqYMf8JiRbvSdP7W
 4lTaCgETezKtvywCUgI3b7/hnbniaU6mLa/EGUmSoQZDrjOsvNsZPI9TL6aHJFyNQHLZ
 KAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306900; x=1759911700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+C5CzLMaPwDa1iB060vEOK+Ww+NfWXh/VYhisUdBYCs=;
 b=eXHMFt5YQ24ajBtRo2WkzmPQyklYD+Rn6VjVh7l1/6HpdbCF3UAk/Jf6jdb0hcVya+
 sJ4aPp7nZ+vIXceswaikBy2xOdoaHK9wRberxukW0RXTCq+qV4Nbw7f/6aHdfXQzQnwP
 LDfgJ0selPK7j0YYXCnlgCI66r3AxYmq5eWetz9qmAcVtZhmRlT94VeIyaSEDQVvBHbH
 sE7eR4maA1nafjYEE7HXi2dLXTYY9LBeRs/M0ZRivWVNbYrdSaZEV0Tw7gRlLj21RQmc
 D2nu0go6itnoWF45Ve8i+zL6PKeVQKmd2qTwFDCflI8xJtMAyGrVoN+5/+RVozZWioyG
 MVDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhmhYj36r0SsEUfCSPSl9ki8oSHnS8CxH2gO4xPf02msZ6JMtUtbskwfQZx1wzXp8MbsmT3E5L2w==@nongnu.org
X-Gm-Message-State: AOJu0Ywy1V3gCOLH3kxsq/EPLPEDO5gKs/RRht3xV3DtbZggXcBB8Lt6
 OH0CUGmTS7bBvMry53DHX3LtiSc/IDUeN6sG3SXZviQTqbmXW4VHPQSqW91qt0Arhnk=
X-Gm-Gg: ASbGncv8nvLMoGbJyT3o57NCLWJJl60gXi9KHERDnspZ0lupGShZu+SqvqVWbkt+vXc
 wWxyhsLmm4snLHkhlATT+zn6GOvJpm6PJa1bEVe/uEUZXZtQsFdncDa8qzl36q0aBuZJBZOsfMd
 9VOsUafgyfJFMXKk/rt7Yg9AqavZTtBU8XLtKaqwDGwXW4MGF7WhrbycU70G9yBZTMk6C5r2DR0
 yO1oPIsZ9w71xjorX/7wmy+aUrGGqt1YBRFDhtvHT3Pdgj/u1l/UBynEGcboAxne/8WAmkWp7EZ
 mBHgklbnglfBJHC2LS/7bJ/Aowjw6QmvBwVYY5VJNohwKISIO9mHGHs3vWrmOpg+pVUMvyvqxDm
 5T+bhbg8+s7nUjt8uQAYnIOUA4AzaUXXdDoIZ5OH/WGuLy0eohzf52Kw1mHwkD8fbIw+8O6KrQV
 PB6XLfeopVfuA7aMhTfjN6
X-Google-Smtp-Source: AGHT+IG+BsZmZhn5AVBasoM2tJ9zzxKe+EhfCA1OHPGY/VYR6bdoCD06Y50Qg9jsUtcYDIRS/+ZYRA==
X-Received: by 2002:a5d:64e6:0:b0:3f7:ce62:ce17 with SMTP id
 ffacd0b85a97d-4255780b1admr2121501f8f.38.1759306900546; 
 Wed, 01 Oct 2025 01:21:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6921b7dsm25730046f8f.42.2025.10.01.01.21.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:21:40 -0700 (PDT)
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
Subject: [PATCH 02/25] accel/kvm: Include missing 'exec/target_page.h' header
Date: Wed,  1 Oct 2025 10:21:02 +0200
Message-ID: <20251001082127.65741-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

The "exec/target_page.h" header is indirectly pulled from
"system/ram_addr.h". Include it explicitly, in order to
avoid unrelated issues when refactoring "system/ram_addr.h":

  accel/kvm/kvm-all.c: In function ‘kvm_init’:
  accel/kvm/kvm-all.c:2636:12: error: ‘TARGET_PAGE_SIZE’ undeclared (first use in this function); did you mean ‘TARGET_PAGE_BITS’?
   2636 |     assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
        |            ^~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e3c84723406..08b2b5a371c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -36,6 +36,7 @@
 #include "accel/accel-ops.h"
 #include "qemu/bswap.h"
 #include "exec/tswap.h"
+#include "exec/target_page.h"
 #include "system/memory.h"
 #include "system/ram_addr.h"
 #include "qemu/event_notifier.h"
-- 
2.51.0


