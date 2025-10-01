Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F0CCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:58:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v412w-0001pV-QX; Wed, 01 Oct 2025 13:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v412p-0001kN-G9
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v412c-0000mJ-Gg
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so812755e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341298; x=1759946098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XkYjpkGwROToQk/2WbGPU7KxLpYxvDufJjy5PE3aYU=;
 b=gkg5PkMNV80T69QzR+lCXevOervSj4B292vlCOAS1ScqfLYkG6dRW47DrPPGT8+UMY
 7YLVEf63zKjkD/sLekrj7tmUY4vSIwv5ItcJ6T1ecfDXP57R1rGSrNgiIl0PdtUE/aZn
 vkH1k1iRkEHO05/4/bfU00WzEN2qsFcBw9MW0fW1423u3hcD1fZn9NyMwqKotNM059de
 LJwNsllfvB1l76Q8VmLW4BqexCozNaOzd+tfANDekpFZDLrTodIocaSRpaV2StWfQIvf
 2lDM90FccuVitVw7nh1a47zT4bKRxOdWMMf9QC5axnA9THD/BIi7jLvFp1z9i6IyUuIz
 cyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341298; x=1759946098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7XkYjpkGwROToQk/2WbGPU7KxLpYxvDufJjy5PE3aYU=;
 b=VT1z9p/KTwgSa+vWG3cCdVfqw3RitH6z2MtWIxHsM/3Ks03zEHuk4Z+Aq4FkLcxIpM
 WEgXVkOsXQkYur/2G6V7cVqBy/E6CQJXE8rmJ2CDsOTzUhOHJRwErC7veuNKEZTh+7nB
 Xj1/Zb3HbgE4GR1kT3nA1e4sjYOaKQaMZZQ/BpYsiJxTLXRe7myxlQ6JLNa9pQAM4E3V
 REsLvzvgvBNpU56Dm804zLCsDXhABjgAS7XokEGnLAlidWhYSfAP2wxTQVIxVTKg4SQr
 IA28jUojXJfeJWgdOI9XZuYlIwVNnUx4cLcJlxd6fuHrv6ege5nmpc7+PJL7QXrfRkJ3
 Nm3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWydZ4csKNd3luoAeif+tXkIv/WuiBe+FymcBWKZIHKQJvWPYxA/hsE7/j5hsa9L/+IhrOQB8AM0Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxj7/UkXcG7zP+a9DIw05XF6Te/GZjpbX/lnclg834LVu3oN/yk
 Pxv5qH9qNdYN/Fo4D7hMFkFpYnnEUMzLUzymlQtLI+tjUNtmrlCjeK8opAQS/vSPeJw=
X-Gm-Gg: ASbGncvwcDQQd+DTxYJe0LzpeHOrGrawK1BuL1fW0V8GZ8NBcnrUcPd4lWk/Ktp1ExF
 hHCpo/CXUnKyuyDsDfgo48IFKV7lbkaTg0TvgF60H7ZD+jRB3UY7m9D46QEIHqhYsLlIGH+NAci
 V7lef8Qubj3/UvrUW2IJe4cVmwGnCHnTWKUqdulGFtNiNQyHkNN6KQv12e2XOBcdMhU6yJoLATj
 ZGF8d14N+1VOuRICNAOLPcE1UnfQoJPcZwf+GcWrA7Z0EqUxOLl8i9eChJh+YPUaso2pktD/Bid
 UFs8AnPp8w8+COsVgjBmRFVJAT3q7oCKX7+Eegek2x1P0sgrmrc/em65uY2LblcW0hDcNq+lHn6
 gWirMnAC2YAdkqGl1dHWCr0d3NmTB9hc4Ee8sTIwP4l7L2V5jg4+kZ46zwzyBAgetkdaP/q6SqH
 i6F1qvMHij4+nUBsLe5hBAz2Pjad7EYmUjYfPg
X-Google-Smtp-Source: AGHT+IG+6A4w+oZ2nzHqr3/j+TRguh1ZpSriyILzNvAQJTaQHCMqI3mPsO36a1m6OS4BIGT2UtInzQ==
X-Received: by 2002:a05:600c:8b24:b0:45b:7a93:f108 with SMTP id
 5b1f17b1804b1-46e6125cf2amr37605675e9.3.1759341296396; 
 Wed, 01 Oct 2025 10:54:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e980dsm119278f8f.36.2025.10.01.10.54.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:54:55 -0700 (PDT)
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
Subject: [PATCH v2 01/18] system/ram_addr: Remove unnecessary
 'exec/cpu-common.h' header
Date: Wed,  1 Oct 2025 19:54:30 +0200
Message-ID: <20251001175448.18933-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Nothing in "system/ram_addr.h" requires definitions from
"exec/cpu-common.h", remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/ram_addr.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 6b528338efc..f74a0ecee56 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -29,7 +29,6 @@
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-#include "exec/cpu-common.h"
 
 extern uint64_t total_dirty_pages;
 
-- 
2.51.0


