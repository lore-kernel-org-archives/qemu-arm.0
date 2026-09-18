Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2695BC982DC
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 11:41:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7Wwo-0000Tc-RK; Fri, 18 Sep 2026 07:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7Wwn-0000TA-97
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1x7Wwl-0001fT-Oj
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 07:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789731603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBaGuPoDATCVPFdrrPM5ytWeOyh4lWlPorysTKBYkuo=;
 b=cggX5IOYARo/Zg0pJR2udkyJ874QYauyxkFT6QU9WwUPyryCAn1ffvPI6A+V0Dj5y5s2Me
 1NKyQOD6uJilHJ7wlaZN67fVZi6xjarnRJP34OY59qXUa3gllfYheGixlyzaQgNqmTYxCJ
 r6COKrFd2DC4nyZ7tQ6PvIofEiMNe3w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-jNWQMfgVOY6JwX4HYZeg7g-1; Fri, 18 Sep 2026 07:40:01 -0400
X-MC-Unique: jNWQMfgVOY6JwX4HYZeg7g-1
X-Mimecast-MFC-AGG-ID: jNWQMfgVOY6JwX4HYZeg7g_1789731601
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91043af01d9so14539646d6.2
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 04:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789731601; x=1790336401;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PBaGuPoDATCVPFdrrPM5ytWeOyh4lWlPorysTKBYkuo=;
 b=VJ0oMhB/z5e2q+A7f7/hEGK2P0NDPFnETYJmXyqbWC+Hnay8F8BCzPM58jWtwr/egS
 XMg2AFXiOkDpbTLKcfpKc82aqxoeLG+FD92uyY1rtoy3g9c8FHLdBrJ/164lNJeNS04/
 NK4nBLuMmN552RgmRnFWnvffa6BgSAPeXhMRt0BFOCzVfPk2IZSb/ale8rZddxilXZB+
 clA802h0WaIGAzueazAPkZ4J2fB2ZraPXZPOdSYJQzGGqUzhD+hGBkFba9u0d6+AC9+i
 x03YLtRaDuuHKZlThTL7ZBEBU5QaE0gbEAVEinHF/u+EGEvuzrnx4gMLKlncll7OKzgZ
 sifg==
X-Forwarded-Encrypted: i=1;
 AKwUvByCI3eui5UPPjRUmfdDMBNrNhVruxN2Vs/eBxiEIxr/LKQd6U1qIkGVF3As8hiZO0UeO4CK6TohXg==@nongnu.org
X-Gm-Message-State: AFuF++lsDuS2GPTHDjyhJO3rDRuXcCzmGwZ/sC85mitN/coSHnA+DAme
 tE3JheHa2g2P4IdbsXPraEOM0fXfSIml8RnQRRIcbToZLs+duQIUkmsd8ePCa9AC8x6WCsfhuXb
 5I+3jvWOLmAom1aa/xkEy0kAYQ+UaTCj41hCbHgMV3H+o43YwK0WVyA==
X-Gm-Gg: AYBFou0W/SsYiTY4KWL1gInKffJzrVLXp5Di7UkJAAGoh6vAWlL6YPeynhSzyeyreQ2
 AP1jy2CFMYcGM/nHaUhtOPJJCJFlAF/NFw7LBIO93WMftW2A2KNFDFiSHB8OT8bM/LdLTGBX9Lq
 64ugECi/n9mc+6y6BtKz2oZN/IBwogB1nJDg4CzCZx28ikHvCVgIo53DXSeNp0CYpZB5QL9kKQf
 Tknq3wVtKnmap3oyBumSQDTtQlBQ1Stq0Obl7R72w9RBaZkkXl8hnhrD5rgIVPOvY5raYDr05XD
 K8Q6LzRARUhcPb851tdqE2rFa+j6XBqt341ymviDCGJCqsCrCOfpvm7II0sk9u1t1ava
X-Received: by 2002:a05:6214:3b81:b0:910:39f5:3747 with SMTP id
 6a1803df08f44-91254b3a7e7mr32247826d6.2.1789731601162; 
 Fri, 18 Sep 2026 04:40:01 -0700 (PDT)
X-Received: by 2002:a05:6214:3b81:b0:910:39f5:3747 with SMTP id
 6a1803df08f44-91254b3a7e7mr32247496d6.2.1789731600685; 
 Fri, 18 Sep 2026 04:40:00 -0700 (PDT)
Received: from localhost ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9125800d789sm10562956d6.17.2026.09.18.04.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 04:39:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PULL 03/11] arm/mps: Remove 32bit define for MPS3_DDR_SIZE
Date: Fri, 18 Sep 2026 07:39:18 -0400
Message-ID: <20260918113926.831204-4-peterx@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918113926.831204-1-peterx@redhat.com>
References: <20260918113926.831204-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kiLdgt-oDgqq-MODUZk56mXQQjTlqnhu5dHwBFu7FXE_1789731601
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

QEMU has switched to 64bit-only hosts for all system emulations.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260818172012.3052821-4-peterx@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/mps2-tz.c | 9 ---------
 hw/arm/mps3r.c   | 8 --------
 2 files changed, 17 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 4e6744eddf..7f41a74df1 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -190,16 +190,7 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
 /* Slow 32Khz S32KCLK frequency in Hz */
 #define S32KCLK_FRQ (32 * 1000)
-
-/*
- * The MPS3 DDR is 2GiB, but on a 32-bit host QEMU doesn't permit
- * emulation of that much guest RAM, so artificially make it smaller.
- */
-#if HOST_LONG_BITS == 32
-#define MPS3_DDR_SIZE (1 * GiB)
-#else
 #define MPS3_DDR_SIZE (2 * GiB)
-#endif
 
 /* For cpu{0,1}_mpu_{ns,s}, means "leave at SSE's default value" */
 #define MPU_REGION_DEFAULT UINT32_MAX
diff --git a/hw/arm/mps3r.c b/hw/arm/mps3r.c
index eedb877e4b..4bd5d83d56 100644
--- a/hw/arm/mps3r.c
+++ b/hw/arm/mps3r.c
@@ -58,15 +58,7 @@ typedef struct RAMInfo {
     int flags;
 } RAMInfo;
 
-/*
- * The MPS3 DDR is 3GiB, but on a 32-bit host QEMU doesn't permit
- * emulation of that much guest RAM, so artificially make it smaller.
- */
-#if HOST_LONG_BITS == 32
-#define MPS3_DDR_SIZE (1 * GiB)
-#else
 #define MPS3_DDR_SIZE (3 * GiB)
-#endif
 
 /*
  * Flag values:
-- 
2.55.0


