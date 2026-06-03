Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD358CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcI1-0006eS-Np; Tue, 02 Jun 2026 23:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHx-0006YU-4S
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcHu-0003Zp-QD
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8424b6792efso867594b3a.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457341; x=1781062141; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMKShQuAK58R/9FBdHpTIimQtn7JKRLF6OWG4SPVFxo=;
 b=nd6EHwYgj6PB91jgfGy8LjqxZjAloIlFVQv9iwuVrPVPUA0g83vN3+vbFwSsyOBDNf
 i/RKHw9cwPVD5Yv1gX8vqEbRD2Qs8XfpCDOiYi6MeKsjKMtQzWSOIvbbY2T29utsU6L9
 GDulvKhcjtaM/bqrQBlA97ExI+cJZTFZIhF5QBfidatE+wVtJnA/Ib9KO7NOxf5aAAYG
 7h+GfgAPOXTwHuYZ9XNpPaY8AvIOdgZ/S9QJ+J654bpI9y3WmxDgPi94/d2JRZYZsF72
 CDnjGtlgFQkfUCrquWNZJx7jc9X6h++9XalXcca+SIKn/GE1WMCnbwxU7Rou4rXQYtxb
 gtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457341; x=1781062141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mMKShQuAK58R/9FBdHpTIimQtn7JKRLF6OWG4SPVFxo=;
 b=gDFHS187qBGvfPXIG9f7d4gHTuovijpIXzJHUSXDUhDKtSi5IxKhFnIWHWQXeYAfSl
 dRs9P+qUqNu0w+0JWc504Tt66P6s+NXjkdxukZW7+RegtLidcUhDGsja+TE1K/YgUi9d
 chxVXpSzC6tqgw2FyqQbZquFE/iYL0JSPphYAi9fVjnMAl0aQjtLY/NtkjHhgAznM9wh
 IIUPtvCKMeG6OTgDJLG3LtqhNJARquZFhH+0tgpII2ZiJ7xfZoSw5pjiUQiSHwRb7nlC
 Isri+KSjORtyr3BTk0R+iGXWGslMmjvE4Dc1A3eVkZnG6hq45I9puhkOoxc6WRHFL7NZ
 +qPg==
X-Gm-Message-State: AOJu0YxC7k7fcbKy7kpuK3LvRRz1ifEGdLjOQoyZIkqqrRW7x/B72iBY
 80nesYgGoZ1ELjyoGiIBkbNsqIIBjnDtJj1nTdNglJyqdACcyoIJdcMbNyyxu1wMvzM=
X-Gm-Gg: Acq92OFgEDh/cnlbJ0J2xQsW5rCOgRmOmKkD8ZjLj5qnEe37XbH/7uGx+1TmNC/vO9R
 a+yU4nEjaPeW29T97nH1p9/rECUbrNtaZXSu1wGeZHW2vcGOzpFqwHfYetG2kON1kNsEMKtkDXx
 S1sA+cQgtkApKd7TzuLw9/JNT0kgNYBpro/jeSAU/Qa4bfw8haWA1piCe+YVMcdnfBh8WDUag98
 0v7bc9xN9ADWyZgpwQybtTbvQhHf1aTbOkwg0h1NQd4rH5zfFTgLPsSEv51xWCWZAooXCI6OcSj
 lSym6ys8Cpzqfol99NludNJslSMxcuydFvoWz7P5nA16yepsPPkLB8pxBG/neD2zKvfgI09gNfX
 N7CW/vGJisFTGHmpZYmzliuANlib96/YByy+chd1vyZSKztHHJ/0MF6dnStj5HRePdCZVWvKF6B
 QXWiw2r6+tip9wXCwJldOc7tl/daI0fdMRnb4YHcQ=
X-Received: by 2002:a05:6a00:32cb:b0:82f:559d:ece3 with SMTP id
 d2e1a72fcca58-84284e83f69mr1630073b3a.15.1780457340973; 
 Tue, 02 Jun 2026 20:29:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 06/45] target/arm: Set e4m3_nan_is_snan
Date: Tue,  2 Jun 2026 20:28:15 -0700
Message-ID: <20260603032855.106930-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

The unique e4m3 nan encoding is SNaN for Arm.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b75c6a6622..77133b8b4a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -308,6 +308,7 @@ static void arm_init_fp_status(float_status *s)
 {
     memset(s, 0, sizeof(*s));
     arm_set_default_fp_behaviours(s);
+    set_float_e4m3_nan_is_snan(true, s);
     /* We want 0 for all other settings. */
 }
 
-- 
2.43.0


