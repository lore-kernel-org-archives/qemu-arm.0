Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp486450lfo;
        Wed, 3 Feb 2021 11:09:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEqcqbmb3B0DSffVqsILYRYDvzp7IgB8MvmsCp2YZ+9UVzDO3WKwprK3OX3kNCf47M921L
X-Received: by 2002:a25:5095:: with SMTP id e143mr4490712ybb.173.1612379350373;
        Wed, 03 Feb 2021 11:09:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612379350; cv=none;
        d=google.com; s=arc-20160816;
        b=q/U29FWU1jpJcS26bR0ToRp1uh7gGA2GnZR45tk+2C5Q/EDXm/bT/zFL1zijfUnzS6
         elAW3i/dduhU+f/72xShCt5h2SyQj6SgiT2zZ9VWYQV6BxBcEHhhFVuQqo1XX0e/4qB1
         4KmTD22s5Wzik/8VYDwCforxoUzaxWZ0eKbj/WzAzKFXWUXfP+AeBkjA1a5wtQTN28gm
         zAwgVrJ1yK1MWYp2+pN3SsOxqYnkzFjAKHUZvc0dtfJz0hFHdZLeF7AdR0yRpgRKf7oB
         BcZlKmQ/0oswSpooWnyDG60mJmBHpBYJPWZjNBeAXcvekAtfeNgv260ta9GDIcig+P0W
         /XNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
        b=ouRyPl6V/NJmAPwEblMcjtQuISjpgURm09ypMSbt0wASk77KgIsUQlv1u+9YMNuW+E
         hdLAJZWe0KFa+IowDC2eJggArHWcZaJ0ehG60qpbMjqeT3t1PGSC5MFFCp6Uxp++6Rce
         F3hHqZegPYBJSFRM2L4DK5fjBq1iS0AjYy8oY3XGNYV00Wv8pQp/DFH0CIxLrUsuF3dI
         PssEOMFK2FJoGiGiHA+eHU8ju4fUe0Dx1vASTa8XCfyRVKSz2JsluOgQwuzFknpLmqFw
         0fNjgPClGGolZnCuBZEOG15/YFrJkCIg5Fvsd7ggV+FuZBrZwQr+OVjDfdqOPJCiEYok
         BZhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cfs6F6dc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si2231491ybt.29.2021.02.03.11.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:09:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cfs6F6dc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7NWX-0004J6-2G
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOQ-0007LD-FX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:47 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOI-0001ZC-SB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:46 -0500
Received: by mail-pj1-x102d.google.com with SMTP id e9so248904pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=cfs6F6dclOVA/7vKUzDqj1TRDzL9GxXsIHtiF+nvq2eWW6urRS94RYJdI0Gu2K3cri
 l0rk0tHbgeCxohxe64LJxh4FNjoTT1VUsybdQVIi/cM2lbiPXdwwb+JYTu3La8xx0XGe
 YRrMhLWWRK4GwuTXqaouOrccUh7PFRqSkSeO1t0REHNb3Jh+yvYBwYqfpOhILkqgvlTt
 NWLmyx0wzabhXqDfpdx8KQ8j1We89OxFODyx0ZaWajcK5ELRRHcU64uuAa64TTkyRIMh
 lwLcBZ48NYALbWx9ogFsoY1AaLMdkk+vVfSv4Pj9LV5Ft7UlsqyYNKKYMjBqxDgoY90W
 hklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkdpbP6ZnSTqdRa/S1vfX9RZ5a2dDCb/MaRsUJualVo=;
 b=lnbhLTeIDq47lX66trFp6TnMOXEPZe/8nPTvxHtZahd/QUZNSo45XYKHHboRGQABHF
 EmIYb0gI65zmC1SLkBYt7cBGLM118/yUt0AKAxHYNr8/l5oQs2ack/J3D7hOnCR64Lzy
 LPBPB5V6LNB3F6c8jeDwzniuSm4JJWCExQkJRLkGx6pGWk8tYIMvd9zxYsqMTS3lICba
 YBnLxkMaB8iA8k6thQUiCrE4oP/SDAXo3PifpLYXLGOoJYpmewi9xlXan0fTgOxLaB5K
 2xuv/hWxyUXg1NwYdR3pvRk2L3wXhkqL5CMNn+BtvU6CJ2Gw0s8IwuW+jRNdaSHJpBvf
 qAzg==
X-Gm-Message-State: AOAM531z/n/wiUrtmIgVge1c8sTpXmvEsZ4ipuJo91HqeqTFJpeciTBO
 zSKotaIJwxgwWzR0WRvbeSULqs94ltlnYlVn
X-Received: by 2002:a17:90a:4088:: with SMTP id
 l8mr4490214pjg.106.1612378835122; 
 Wed, 03 Feb 2021 11:00:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/31] linux-user: Fix guest_addr_valid vs reserved_va
Date: Wed,  3 Feb 2021 08:59:49 -1000
Message-Id: <20210203190010.759771-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mrbjk1bRGUf7

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d542..e62f4fba00 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-#define guest_addr_valid(x) (1)
-#else
-#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-#endif
+static inline bool guest_addr_valid(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-- 
2.25.1

