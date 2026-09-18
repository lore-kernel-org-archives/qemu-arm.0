Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69D6C982DA
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 11:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Wwa-0000Rk-S6; Fri, 18 Sep 2026 07:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7WwZ-0000RN-Dy
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7WwX-0001cx-MP
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789731588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfu1MBXsRmVP1HEFbBooqDFu2xyDHNFt7BQUuf2IFiw=;
 b=Fsq6RWpiE7w8lM1Tyv6MrWkomNgTSDeqKrIFzeviohrCM1OPgVpNu23E1vr6rg/t5B0nWc
 Hu7UvkEF2OTvZi51gZ6Etfe34QwVvIeI3qj6OxGONJXoOoasAnsEeI+SxgZqmYYt5eeZ5+
 nh21vivhPVhF3iSrwjf+7mrP+aIgYoI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-7BJl7QMuPq2ndSDonDlOzg-1; Fri, 18 Sep 2026 07:39:47 -0400
X-MC-Unique: 7BJl7QMuPq2ndSDonDlOzg-1
X-Mimecast-MFC-AGG-ID: 7BJl7QMuPq2ndSDonDlOzg_1789731586
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-530e0cb072eso9322631cf.1
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 04:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789731586; x=1790336386;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yfu1MBXsRmVP1HEFbBooqDFu2xyDHNFt7BQUuf2IFiw=;
 b=xCXyg/kUDu1LdWnnL7r50s3CIOy+z8a7IsQORoFQZaBl+724y1KDGe9pa2vwyAE/D8
 eMYO4cYNe4GqswR80GE4pxr46z2pW6u0Fi5sJwZMWMgJgmF6RxlAH89IXrQgMFcre0je
 FvPpdIpveGkxDJsSGs58l1eZW9PhTs3eSAUq8BOlKHFhe1IlpxNOVEiJwQJa/0qXliNq
 2Gg7m6UIcSaGS/ctUXie0SIi5YGujO4LQAe1hIsqsFI1r4mDeMKvo5T7tlbMpwYAtTMa
 U9GHECC29fyQp26wouh/bBtW4UeBnbiPE/EPx0NTVCz6zLJyai4nctfEjZIl3chLNFry
 iCEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBykgQpz4CGgB4y+h8AXM0ScqUL8CqQXKBbXU10eKeYybkkDNBkgdJkqWLSwMB+jYK4NfT1bpvimFQ==@nongnu.org
X-Gm-Message-State: AFuF++lvx2+FCCZZgMM5mSQN0uKXEfIIYrn/LbLpIe/8PipiawdwMCST
 z14XPvo1zunoEYu/OiGHdAuLhNA0b9/hntwbYE4CZSFqEdQSHrvluMW2J280+HykCRntGQzOTPL
 Y79E4yCwMGpm1qe7gCoFhyH+7BCCFBXKyRymn1NGf4Z1OSH/vSLMqrg==
X-Gm-Gg: AYBFou2KhgHSVDOQs+0AwLTZOYDe95rJ9M7QFcriGGMUb7X3kAJvRR1tv+KxOfuwFUR
 dmaccuzy4gk9bE07K7ZZEqN8WfPA8DK4rv28EE5B/YkDxZkFPVsXlvl1h6oM/eJvPSKe0VKQuyY
 qG6jvBvkm9lt8HyZDKdt19SKmmEAgYLQOblmX4/srtQlSV5iZh71C+CDE4HBuskKp1qTzbWu2a3
 SrQ3FIrSgrD+HYmG57GOzx3ocSzr7+MSl6YRo1um6OHKgFci1R9dk+8oAX7pGCX5QnAUA3mf5/j
 pRbjpFbIoYJlJXZIWBJT4RkV6zpyFDvmq/wXapH0A1XJ649KU/uZYRCskEUW7AKvXplFu3Xyci3
 /xXqbmVbw4gxx2l1HH6Zvia9i3LMwYgrKQexksMRzAKBQsTqSCngkJ859mME=
X-Received: by 2002:a05:622a:587:b0:530:ea70:39f8 with SMTP id
 d75a77b69052e-5329e47e893mr32013141cf.40.1789731586519; 
 Fri, 18 Sep 2026 04:39:46 -0700 (PDT)
X-Received: by 2002:a05:622a:587:b0:530:ea70:39f8 with SMTP id
 d75a77b69052e-5329e47e893mr32012811cf.40.1789731586002; 
 Fri, 18 Sep 2026 04:39:46 -0700 (PDT)
Received: from localhost
 (bras-vprn-aurron9134w-lp130-03-174-91-117-74.dsl.bell.ca. [174.91.117.74])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532a19f19f1sm11263171cf.22.2026.09.18.04.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:39:44 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PULL 02/11] hw/vexpress.c: Remove forced cast to u64
Date: Fri, 18 Sep 2026 07:39:17 -0400
Message-ID: <20260918113926.831204-3-peterx@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113926.831204-1-peterx@redhat.com>
References: <20260918113926.831204-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f2ps6KwtLd9aq9I9rDrypnJqiE8UHPKqN2LVFKgtS9k_1789731586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now since ram_addr_t has switched to u64, remove the forced cast as not
needed.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260818172012.3052821-3-peterx@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/vexpress.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 914cda66d2..a4328ec74b 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -362,16 +362,9 @@ static void a15_daughterboard_init(VexpressMachineState *vms,
     MachineState *machine = MACHINE(vms);
     MemoryRegion *sysmem = get_system_memory();
 
-    {
-        /* We have to use a separate 64 bit variable here to avoid the gcc
-         * "comparison is always false due to limited range of data type"
-         * warning if we are on a host where ram_addr_t is 32 bits.
-         */
-        uint64_t rsz = ram_size;
-        if (rsz > (30ULL * 1024 * 1024 * 1024)) {
-            error_report("vexpress-a15: cannot model more than 30GB RAM");
-            exit(1);
-        }
+    if (ram_size > (30ULL * 1024 * 1024 * 1024)) {
+        error_report("vexpress-a15: cannot model more than 30GB RAM");
+        exit(1);
     }
 
     /* RAM is from 0x80000000 upwards; there is no low-memory alias for it. */
-- 
2.55.0


