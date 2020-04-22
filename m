Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp194272lfm;
        Tue, 21 Apr 2020 21:35:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypLj2/YwKUnheSmFRiVIjXqnOeCT/aaGolvv3eSwYZVVr1yn+TuT4ToyWr/JNf+BGO7V/1vG
X-Received: by 2002:a05:6214:13cc:: with SMTP id cg12mr23690972qvb.100.1587530136792;
        Tue, 21 Apr 2020 21:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530136; cv=none;
        d=google.com; s=arc-20160816;
        b=ojN7ZXOUsAaQecB2NBusNam032DjJ0rlu+cZqPm32ni9NGMA2vT3R4OjIWG2Fif1hE
         aDJX9E6UOoWsEel7ozaIMauy7dEhvN/lnLQviQZ0bD89dLYhSG9P0wCxtPZ70Zal7UPS
         DK0Yc/iharobhfLr6KnT0WbdlgWRmqFO80A5FNJnF4894MyKFZCwuv1o57WRH/r7/vsh
         xYOiTox3TV2YWh3oJ2leEOimKzYJxIqn6XpvgXmzpsavi7PNsfsLCy5lG96X7KBvCkqT
         FBV3KwfI7dEM3xBHS/VlyUhaVRyd9MTiZjoD7ndGrenTHXz76RSAkubGFzYc25vEHFT0
         iuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ar4ktbgi8ho4D2K0AlAA7ABuossIOEQqKwU/YvDdwbY=;
        b=a+baqi0JGkPaDBuOHz79CB1vEliu8niNiUF3Qyk9QNAOhl1qBRUnAoUrl9Fk1I58nS
         dBl/JU3kxdqaOr0aeK/zz3fG+cwtOaAHK8gSccP/Yf5fI9NtZDnQS6XPseCeEIqgMsdL
         I+jNJzVyTMYIln3blxUesRulBxws8Mj7AgtBPhaxzzhe4ehCw3BEapTDPoaKD2ig626D
         +HXPkFNrAsU3Qwjxogz8V8NFGa1PF4cIbjKRZjR/PzCc/r294Yz/QPK5a+Zk8TTUxEMi
         E7+ta+Rixl5LjQZyWZdxZxuueFa1z+vAoQ91TCjL5hQkc+qoPNX81Eg2r/AT3+OArPDw
         c2bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KKHmN9DU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si2512305qkh.173.2020.04.21.21.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:35:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KKHmN9DU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR76m-0004KV-2D
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74X-0000Ph-AW
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74W-0004i3-QT
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:17 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74W-0004di-CM
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:16 -0400
Received: by mail-pf1-x442.google.com with SMTP id v63so434037pfb.10
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ar4ktbgi8ho4D2K0AlAA7ABuossIOEQqKwU/YvDdwbY=;
 b=KKHmN9DUtNl/895jM8s3jff7LEzmFeqpQ8DWMpXM1qONzT3m9ARgcZsMgP+XdscICt
 HZLMNtv/ZqoDWF8cXeHk+2bSlQs/4PWjWY5m0f5+6wiIyah2Z+B4dd2NmFckQr7NJ6HO
 FJ2+o+DHRGk8N+afxBcsGByNqu6GDXbOc6issTgN7yM3kAgSlrKXj2oY6o/6HzchDLLo
 iH6AsFkzi9ygAU/ahiyH9fYPWIhJi4eQgbeJH9nfG4wPaO08AUWKlOGemDpIwU7+crxI
 eXUdP952xqi7ovID9SZ5VX81/jeMI2wy+AP48xd3inj5+XoViGfrnA0WWgdTVEceMl3X
 kM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ar4ktbgi8ho4D2K0AlAA7ABuossIOEQqKwU/YvDdwbY=;
 b=QVrs+o6K82hOFJRjkOfFBSbHmvn1E91+/zC7jXR7WYtv+ZeNEl023Mzlg5gSHimmze
 ZiFhJu6JscmDPFRtsl1YfwtHingS294zHpM9kKQxbP3p2+/2+dAZK5ICEer8+cEZ/GCN
 aZEIg0iLWbqB1nXCYUjnGlnZthiCpOXCX1Y+RnkpoTjfiPDxHqDeWqXnoROBzKtiEWcp
 m4ITPD4ECxFcq2J4lN3ny/ZFKO2WLhWym6HslIAK+dDuZ/UHARF1bijYTd7ByXJl3one
 leNNbdc47bQ6D+OZQPwzFJN/txPBPBvZ26eFm6GVncLN74Q+kaiBBgfUC9hb83BssP2v
 OYUw==
X-Gm-Message-State: AGi0PuaemwNlLBuYHdBQiPsnosLt0uL5DzxEI2Iqa9rfBUIviexPWYsZ
 tiN1zGszNUGKu/FjovZLDNIeDvaQBJU=
X-Received: by 2002:a63:5853:: with SMTP id i19mr22901678pgm.288.1587529994937; 
 Tue, 21 Apr 2020 21:33:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/18] accel/tcg: Add block comment for probe_access
Date: Tue, 21 Apr 2020 21:32:54 -0700
Message-Id: <20200422043309.18430-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200422043309.18430-1-richard.henderson@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4kKqLaK++MA

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 350c4b451b..d656a1f05c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -330,6 +330,23 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
 {
 }
 #endif
+/**
+ * probe_access:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @size: size of the access
+ * @access_type: read, write or execute permission
+ * @mmu_idx: MMU index to use for lookup
+ * @retaddr: return address for unwinding
+ *
+ * Look up the guest virtual address @addr.  Raise an exception if the
+ * page does not satisfy @access_type.  Raise an exception if the
+ * access (@addr, @size) hits a watchpoint.  For writes, mark a clean
+ * page as dirty.
+ *
+ * Finally, return the host address for a page that is backed by RAM,
+ * or NULL if the page requires I/O.
+ */
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr);
 
-- 
2.20.1

